import SwiftUI

struct TaskModel {
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150))]
    let items = Array(1...14)
    let tasks = ["COMELETE 1 LEVELS",
                 "COMPLETE 3 LEVELS",
                 "BUY EMERALD BLOCKS",
                 "BUY GOLD BLOCKS",
                 "BUY WATER BLOCKS",
                 "COMPLETE 5 LEVELS",
                 "OPEN 2 STAGE",
                 "COMPLETE 1 LEVELS IN 2 STAGE",
                 "COMPLETE 3 LEVELS IN 2 STAGE",
                 "COMPLETE 5 LEVELS IN 2 STAGE",
                 "OPEN 3 STAGE",
                 "COMPLETE 1 LEVELS IN 3 STAGE",
                 "COMPLETE 3 LEVELS IN 3 STAGE",
                 "COMPLETE 5 LEVELS IN 3 STAGE"]
    
    let coundRewardForTask = ["15",
                              "25",
                              "45",
                              "45",
                              "45",
                              "25",
                              "35",
                              "25",
                              "25",
                              "25",
                              "25",
                              "45",
                              "35",
                              "35"]
    let taskLabel = "TASK"
    let lockedLabel = "LOCKED"
}
