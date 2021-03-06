import Foundation

class CourseViewModel {
    var id: String
    let name: String
    let title: String
    let description: String
    let season: Seasons
    var lecturerId: String?
    var dates: String
    var startDate: Date?
    var endDate: Date?
    var meetingTime: String
    var room: String?
    var roomId: String?
    var isWeekend: Bool = false
    
    init(course: Course?) {
        if let course = course {
            self.id = course.id
            self.name = course.name
            self.title = course.title
            if let description = course.description {
                self.description = description
            }
            else {
                self.description = "Stay tuned!"
            }
            if let season = course.season {
                self.season = season
            }
            else {
                self.season = Seasons.Spring
            }
            self.lecturerId = course.lecturerId
            
            if let room = course.room {
                self.room = room
            }
            if let roomId = course.roomId {
                self.roomId = roomId
            }
            
            self.startDate = course.startDate
            self.endDate = course.endDate
            
            self.dates = "Dates TBD"
            if let startDate = course.startDate {
                var dateText = startDate.toString(format: .custom("MMM d"))
                if let endDate = course.endDate {
                    dateText += "-"+endDate.toString(format: .custom("MMM d"))
                }
                self.dates = dateText
            }
            self.meetingTime = ""
            if let meetingTime = course.meetingTime {
                self.meetingTime = meetingTime
            }
            if let isWeekend = course.isWeekend {
                self.isWeekend = isWeekend
            }
        }
        else {
            self.id = UUID().uuidString
            self.name = "TBD"
            self.title = "TBD"
            self.description = "Stay tuned!"
            self.dates = "Dates TBD"
            self.meetingTime = ""
            self.season = Seasons.Spring
        }
    }
}
