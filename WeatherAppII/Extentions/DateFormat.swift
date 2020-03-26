

import UIKit

extension UIViewController{
    func timeConverter(date: String)-> String {
        
        var returnTime = ""
        
        let splitDateAndTime = date.components(separatedBy: "T")
        
        let splitTime = splitDateAndTime[1]
        

        let givenTimeFormat = DateFormatter()
        givenTimeFormat.dateFormat = "HH:mm:ssZ"
        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "h:mm a"
        

        if let currentTime = givenTimeFormat.date(from: splitTime){
            returnTime = hourFormatter.string(from: currentTime)
        }
        return returnTime
    }
    
    func dateReturner(date:String)-> [String]{
        var returnDate = ""
        
        let splitDateAndTime = date.components(separatedBy: "T")

        let splitDate = splitDateAndTime[0]
        
        let givenDateFormate = DateFormatter()
        givenDateFormate.dateFormat = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MM/dd"
        if let currentDate = givenDateFormate.date(from: splitDate){
            returnDate = dateFormatter.string(from: currentDate)
        }
            let returnDay = returnDate.split(separator: ",")
            let returnDayOfTheWeek = returnDay[0]
            let returnDayAndMonth = returnDay[1]
            
        return [String(returnDayAndMonth), String(returnDayOfTheWeek)]

    }
    
    func sunTimeConverter(date: String)-> String {
        
        var returnTime = ""
        
        let splitDateAndTime = date.components(separatedBy: "T")
        
        let splitTime = splitDateAndTime[1]
        

        let givenTimeFormat = DateFormatter()
        givenTimeFormat.dateFormat = "HH:mm:ssZ"
        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "h:mm a"
        

        if let currentTime = givenTimeFormat.date(from: splitTime){
            returnTime = hourFormatter.string(from: currentTime)
        }
        return returnTime
    }
}
