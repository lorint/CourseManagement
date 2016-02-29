IterationStudent.destroy_all
UserRole.destroy_all
User.destroy_all

k = User.create(name: "Ketan Patel", email: "ketpat@fakey.com")
c = User.create(name: "Claudio Carmeli", email: "claudiocarmeli@fakey.com")
s = User.create(name: "Sam Sargent", email: "samsarge@fakey.com")
d = User.create(name: "Dafin", email: "dafins@fakey.com")
dg = User.create(name: "Dan Garland", email: "dafins@fakey.com")
lt = User.create(name: "Lorin Thwaits", email: "lorint@fakey.com")

Role.destroy_all

candidate = Role.create(name: "Candidate")
groundworker = Role.create(name: "Groundworker")
student = Role.create(name: "Student")
instructor = Role.create(name: "Instructor")
marketer = Role.create(name: "Marketer")
admin = Role.create(name: "Admin")

WorkType.destroy_all

WorkType.create(name: "Source Code Repository",
  notes: "Github or Bitbucket link to a repo",
  is_url: true)
WorkType.create(name: "Pivotal Tracker",
  notes: "User stories and project management",
  is_url: true)
WorkType.create(name: "Code block",
  notes: "A block of code to address a programming challenge",
  is_url: false)

DeliveryDay.destroy_all
CurriculumDelivery.destroy_all
Curriculum.destroy_all
CurriculumType.destroy_all

mod = CurriculumType.create(name: "Module")
lesson = CurriculumType.create(name: "Lesson", is_teachable: true)
code_challenge = CurriculumType.create(name: "Code Challenge", is_teachable: true, is_workable: true)
homework = CurriculumType.create(name: "Homework", is_workable: true)
project = CurriculumType.create(name: "Project", is_workable: true)


# Set up students in roles
sk = k.user_roles.create(role_id: student.id)
sc = c.user_roles.create(role_id: student.id)
ss = s.user_roles.create(role_id: student.id)
sd = d.user_roles.create(role_id: student.id)
slt = lt.user_roles.create(role_id: student.id)

# Set up instructors
idg = dg.user_roles.create(role_id: instructor.id)
ilt = lt.user_roles.create(role_id: instructor.id)

# Set up admins
dg.user_roles.create(role_id: admin.id)

IterationDay.destroy_all
CourseIteration.destroy_all
Course.destroy_all

i = Course.create(name: "Immersive")
curr = i.iterations.create(start: Date.parse("2016-1-11"), end: Date.parse("2016-4-1"), created_by: idg)
nxt = i.iterations.create(start: Date.parse("2016-5-2"), end: Date.parse("2016-7-22"), created_by: idg)

isk = curr.iteration_students.create(student: sk, created_by: idg)
isc = curr.iteration_students.create(student: sc, created_by: idg)
iss = curr.iteration_students.create(student: ss, created_by: idg)
isd = curr.iteration_students.create(student: sd, created_by: idg)
islt = curr.iteration_students.create(student: slt, created_by: idg)

m1 = mod.curriculums.create(name: "Procedural Programming with Ruby")
	m1a = m1.children.create(name: "Control Statements", type: mod)
	m1b = m1.children.create(name: "Data Structures", type: mod)
	m1c = m1.children.create(name: "Advanced Ruby Concepts", type: mod)
m2 = mod.curriculums.create(name: "Object-Oriented Ruby")
	m2a = m2.children.create(name: "Single Responsibility Principle", type: mod)
	m2b = m2.children.create(name: "Design Patterns", type: mod)
	m2c = m2.children.create(name: "Refactoring", type: mod)
m3 = mod.curriculums.create(name: "Databases & SQL")
	m3a = m3.children.create(name: "SQL", type: mod)
	m3b = m3.children.create(name: "Normalisation", type: mod)
	m3c = m3.children.create(name: "Active Record", type: mod)
m4 = mod.curriculums.create(name: "HTTP & REST")
	m4a = m4.children.create(name: "Protocols", type: mod)
	m4b = m4.children.create(name: "Networking", type: mod)
	m4c = m4.children.create(name: "RESTful architecture", type: mod)
m5 = mod.curriculums.create(name: "HTML and the DOM")
	m5a = m5.children.create(name: "HTML 5", type: mod)
	m5b = m5.children.create(name: "CSS", type: mod)
	m5c = m5.children.create(name: "Javascript", type: mod)
m6 = mod.curriculums.create(name: "Front-end Development")
	m6a = m6.children.create(name: "Front-end frameworks", type: mod)
		m6a.children.create(name: "CSS Box Model", type: mod)
		m6a.children.create(name: "Web Components", type: mod)
	m6b = m6.children.create(name: "PSDs", type: mod)
	m6b = m6.children.create(name: "Responsive Design", type: mod)
	m6c = m6.children.create(name: "Asset Pipeline", type: mod)
	m6c = m6.children.create(name: "Accessibility", type: mod)
m7 = mod.curriculums.create(name: "Ruby on Rails")
	m7a = m7.children.create(name: "Intro to Rails", type: mod)
	m7b = m7.children.create(name: "Routing", type: mod)
	m7c = m7.children.create(name: "Nested Routes and Forms", type: mod)
	m7d = m7.children.create(name: "HAML", type: mod)
	m7e = m7.children.create(name: "SASS", type: mod)
	m7f = m7.children.create(name: "ActionMailer", type: mod)
m8 = mod.curriculums.create(name: "Full-Stack Development")
	m8a = m8.children.create(name: "AJAX & JSON", type: mod)
	m8b = m8.children.create(name: "Web Sockets", type: mod)
	m8c = m8.children.create(name: "Devise & Security", type: mod)
	m8d = m8.children.create(name: "Geolocation & Mapping", type: mod)
	m9e = m8.children.create(name: "Individual Project, pick one of 3", type: project)
m9 = mod.curriculums.create(name: "Agile Web Development")
	m9a = m9.children.create(name: "User Stories", type: mod)
	m9b = m9.children.create(name: "Git Workflows", type: mod)
	m9c = m9.children.create(name: "Group Project", type: project)
m10 = mod.curriculums.create(name: "Building Scalable Web Apps")
	m10a = m10.children.create(name: "Pagination", type: mod)
	m10b = m10.children.create(name: "Sorting", type: mod)
	m10c = m10.children.create(name: "Searching", type: mod)
	m10d = m10.children.create(name: "Distributed Services", type: mod)
	m10e = m10.children.create(name: "Background Tasks", type: mod)
m11 = mod.curriculums.create(name: "Javascript MVC")
	m11a = m11.children.create(name: "Object-Oriented Javascript", type: mod)
	m11b = m11.children.create(name: "Backbone.js", type: mod)
	m11c = m11.children.create(name: "Jasmine", type: mod)
m12 = mod.curriculums.create(name: "Service-Oriented Architecture")
	m12a = m12.children.create(name: "Building Ruby Gems", type: mod)
	m12b = m12.children.create(name: "API Design", type: mod)
	m12c = m12.children.create(name: "OAuth", type: mod)

# Dan taught Module 1 on Feb 28 to Dafin
cd = m1.curriculum_deliveries.create(taught_by: idg)
dd = cd.delivery_days.create(day: curr.delivery_days.find_by(day: "2016-2-28"))
[isd].each {|student| dd.delivery_to_students.create(student: student)}

# Teaching Devise on Feb 29
cd = m8c.curriculum_deliveries.create(taught_by: ilt)
dd = cd.delivery_days.create(day: curr.delivery_days.find_by(day: "2016-2-29"))
[isk, isc, iss].each {|student| dd.delivery_to_students.create(student: student)}

