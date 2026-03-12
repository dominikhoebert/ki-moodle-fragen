# DATABASES

Schnelle Schema-Übersicht der SQLite-Datenbanken im Ordner `databases/`.

- Zweck: Der Agent kann Tabellen- und Spaltennamen nachschlagen, ohne jede DB jedes Mal per MCP einzulesen.
- Quelle: Aus `sqlite_master` der jeweiligen DB (Stand: 2026-03-12).
- Hinweis: Viele DBs enthalten zusätzliche Spalten wie `TRIAL...` (Test-/Importspalten). Falls sie für Aufgaben keinen Sinn ergeben, kannst du sie in Aufgaben bewusst ignorieren.

## Inhalt

- [BikeStore.db](#bikestoredb)
- [employee.db](#employeedb)
- [flightdata.db](#flightdatadb)
- [hospital.db](#hospitaldb)
- [hr.db](#hrdb)
- [inventory.db](#inventorydb)
- [movie.db](#moviedb)
- [northwind.db](#northwinddb)
- [soccer.db](#soccerdb)

---

## BikeStore.db

Tabellen (Spalten):

- `brands` (brand_id, brand_name)
- `categories` (category_id, category_name)
- `customers` (customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
- `order_items` (order_id, item_id, product_id, quantity, list_price, discount)
- `orders` (order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
- `products` (product_id, product_name, brand_id, category_id, model_year, list_price)
- `staffs` (staff_id, first_name, last_name, email, phone, active, store_id, manager_id)
- `stocks` (store_id, product_id, quantity)
- `stores` (store_id, store_name, phone, email, street, city, state, zip_code)

## employee.db

Tabellen (Spalten):

- `department` (dep_id, dep_name, dep_location, TRIAL162)
- `employees` (emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id, TRIAL162)
- `salary_grade` (grade, min_sal, max_sal, TRIAL162)

## flightdata.db

Tabellen (Spalten):

- `airlines` (id, name, country)
- `airports` (airportcode, name, country, city)
- `countries` (code, name)
- `flights` (airline, flightnr, departure_time, departure_airport, destination_time, destination_airport, planetype)
- `passengers` (id, firstname, lastname, airline, flightnr, rownr, seatposition)
- `planes` (id, manufacturer, type, lengthoverall, span, maxspeed, initialserviceyear, maxseats, seatsperrow)

## hospital.db

Tabellen (Spalten):

- `affiliated_with` (physician, department, primaryaffiliation, TRIAL289)
- `appointment` (appointmentid, patient, prepnurse, physician, start_dt_time, end_dt_time, examinationroom, TRIAL289)
- `block` (blockfloor, blockcode, TRIAL289)
- `department` (departmentid, name, head, TRIAL289)
- `medication` (code, name, brand, description, TRIAL293)
- `nurse` (employeeid, name, position, registered, ssn, TRIAL293)
- `on_call` (nurse, blockfloor, blockcode, oncallstart, oncallend, TRIAL293)
- `patient` (ssn, name, address, phone, insuranceid, pcp, TRIAL293)
- `physician` (employeeid, name, position, ssn, TRIAL293)
- `prescribes` (physician, patient, medication, date, appointment, dose, TRIAL293)
- `procedure` (code, name, cost, TRIAL293)
- `room` (roomnumber, roomtype, blockfloor, blockcode, unavailable, TRIAL293)
- `stay` (stayid, patient, room, start_time, end_time, TRIAL293)
- `trained_in` (physician, treatment, certificationdate, certificationexpires, TRIAL293)
- `undergoes` (patient, procedure, stay, date, physician, assistingnurse, TRIAL293)

## hr.db

Tabellen (Spalten):

- `countries` (country_id, country_name, region_id, TRIAL358)
- `departments` (department_id, department_name, manager_id, location_id, TRIAL358)
- `employees` (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, TRIAL358)
- `job_grades` (grade_level, lowest_sal, highest_sal, TRIAL358)
- `job_history` (employee_id, start_date, end_date, job_id, department_id, TRIAL358)
- `jobs` (job_id, job_title, min_salary, max_salary, TRIAL358)
- `locations` (location_id, street_address, postal_code, city, state_province, country_id, TRIAL358)
- `regions` (region_id, region_name, TRIAL358)

## inventory.db

Tabellen (Spalten):

- `customer` (customer_id, cust_name, city, grade, salesman_id, TRIAL436)
- `orders` (ord_no, purch_amt, ord_date, customer_id, salesman_id, TRIAL436)
- `salesman` (salesman_id, name, city, commission, TRIAL436)

## movie.db

Tabellen (Spalten):

- `actor` (act_id, act_fname, act_lname, act_gender, TRIAL550)
- `director` (dir_id, dir_fname, dir_lname, TRIAL550)
- `genres` (gen_id, gen_title, TRIAL550)
- `movie` (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country, TRIAL550)
- `movie_cast` (act_id, mov_id, role, TRIAL550)
- `movie_director` (dir_id, mov_id, TRIAL550)
- `movie_genres` (mov_id, gen_id, TRIAL550)
- `rating` (mov_id, rev_id, rev_stars, num_o_ratings, TRIAL554)
- `reviewer` (rev_id, rev_name, TRIAL554)

## northwind.db

Tabellen (Spalten):

- `customers` (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments, TRIAL619)
- `employee_privileges` (employee_id, privilege_id, TRIAL619)
- `employees` (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments, TRIAL619)
- `inventory_transaction_types` (id, type_name, TRIAL619)
- `inventory_transactions` (id, transaction_type, transaction_created_date, transaction_modified_date, product_id, quantity, purchase_order_id, customer_order_id, comments, TRIAL619)
- `invoices` (id, order_id, invoice_date, due_date, tax, shipping, amount_due, TRIAL619)
- `order_details` (id, order_id, product_id, quantity, unit_price, discount, status_id, date_allocated, purchase_order_id, inventory_id, TRIAL619)
- `order_details_status` (id, status_name, TRIAL622)
- `orders` (id, employee_id, customer_id, order_date, shipped_date, shipper_id, ship_name, ship_address, ship_city, ship_state_province, ship_zip_postal_code, ship_country_region, shipping_fee, taxes, payment_type, paid_date, notes, tax_rate, tax_status_id, status_id, TRIAL622)
- `orders_status` (id, status_name, TRIAL622)
- `orders_tax_status` (id, tax_status_name, TRIAL622)
- `privileges` (id, privilege_name, TRIAL622)
- `products` (supplier_ids, id, product_code, product_name, description, standard_cost, list_price, reorder_level, target_level, quantity_per_unit, discontinued, minimum_reorder_quantity, category, attachments, TRIAL622)
- `purchase_order_details` (id, purchase_order_id, product_id, quantity, unit_cost, date_received, posted_to_inventory, inventory_id, TRIAL622)
- `purchase_order_status` (id, status, TRIAL622)
- `purchase_orders` (id, supplier_id, created_by, submitted_date, creation_date, status_id, expected_date, shipping_fee, taxes, payment_date, payment_amount, payment_method, notes, approved_by, approved_date, submitted_by, TRIAL622)
- `sales_reports` (group_by, display, title, filter_row_source, default, TRIAL622)
- `shippers` (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments, TRIAL622)
- `strings` (string_id, string_data, TRIAL622)
- `suppliers` (id, company, last_name, first_name, email_address, job_title, business_phone, home_phone, mobile_phone, fax_number, address, city, state_province, zip_postal_code, country_region, web_page, notes, attachments, TRIAL622)

## soccer.db

Tabellen (Spalten):

- `asst_referee_mast` (ass_ref_id, ass_ref_name, country_id, TRIAL714)
- `coach_mast` (coach_id, coach_name, TRIAL717)
- `goal_details` (goal_id, match_no, player_id, team_id, goal_time, goal_type, play_stage, goal_schedule, goal_half, TRIAL717)
- `match_captain` (match_no, team_id, player_captain, TRIAL717)
- `match_details` (match_no, play_stage, team_id, win_lose, decided_by, goal_score, penalty_score, ass_ref, player_gk, TRIAL717)
- `match_mast` (match_no, play_stage, play_date, results, decided_by, goal_score, venue_id, referee_id, audence, plr_of_match, stop1_sec, stop2_sec, TRIAL717)
- `penalty_gk` (match_no, team_id, player_gk, TRIAL717)
- `penalty_shootout` (kick_id, match_no, team_id, player_id, score_goal, kick_no, TRIAL717)
- `player_booked` (match_no, team_id, player_id, booking_time, sent_off, play_schedule, play_half, TRIAL717)
- `player_in_out` (match_no, team_id, player_id, in_out, time_in_out, play_schedule, play_half, TRIAL717)
- `player_mast` (player_id, team_id, jersey_no, player_name, posi_to_play, dt_of_bir, age, playing_club, TRIAL717)
- `playing_position` (position_id, position_desc, TRIAL720)
- `referee_mast` (referee_id, referee_name, country_id, TRIAL720)
- `soccer_city` (city_id, city, country_id, TRIAL720)
- `soccer_country` (country_id, country_abbr, country_name, TRIAL720)
- `soccer_team` (team_id, team_group, match_played, won, draw, lost, goal_for, goal_agnst, goal_diff, points, group_position, TRIAL720)
- `soccer_venue` (venue_id, venue_name, city_id, aud_capacity, TRIAL720)
- `team_coaches` (team_id, coach_id, TRIAL720)
