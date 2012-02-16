class DaysSinceVisit < ActiveRecord::Base

 #column :person_id, :integer
 #column :days_since_last_visit, :integer

 def readonly?
      true
 end

 class << self
  def days_since_last_f2f_visit

   current_date = Time.now.strftime("%Y-%m-%d")
   last_visit_date_sql = <<-SQL
     select people.id as person_id, '#{current_date}' - max(date(contacts.occurred_at)) as days_since_last_visit from people
     inner join physical_location_records on physical_location_records.person_id = people.id
                and physical_location_records.physical_location_type = 'PhysicalLocation::Placement'
                inner join out_of_home_locations on out_of_home_locations.id = physical_location_records.physical_location_id
                and date(out_of_home_locations.start_date) <= '#{current_date}'
                and (date(out_of_home_locations.end_date) is NULL
                or date(out_of_home_locations.end_date) > '#{current_date}')
     inner join contact_people on contact_people.person_id = people.id
     inner join contacts on contacts.id = contact_people.contact_id
                and contacts.mode like 'Face to Face%'
     group by people.id
   SQL
   days_since_last_visit = ActiveRecord::Base.connection.select_rows(last_visit_date_sql)
   return nil
  end

 def measure_time
    n_iterations = 10
    avg_time = 0
    (1..n_iterations).each do |i|
       t1 = Time.new
       days_since_last_f2f_visit
       t2 = Time.new
       timetaken = t2-t1
       avg_time += timetaken
       puts("In iteration #{i}, time taken = #{timetaken} secs")
    end
    avg_time /= n_iterations
    puts("Avg time taken is #{avg_time} seconds")
 end
 end
end
