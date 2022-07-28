//
//  MyFilteredList.swift
//  Picker_swiftui_tutorial
//
//  Created by minkyuLee on 2022/07/29.
//

import SwiftUI

enum School : String, CaseIterable {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
}

struct MyFriend : Identifiable, Hashable {
    var id = UUID()
    var name : String
    var school : School
}

func prepareData() -> [MyFriend]{
    var newList = [MyFriend]()
    
    for i in 0...20 {
        let newFriend = MyFriend(name: "내 친구 \(i)", school: School.allCases.randomElement()!)
        newList.append(newFriend)
    }
    return newList
}

struct MyFilteredList: View {
    
    @State private var filteredValue = School.elementary
    
    @State private var myFriendList = [MyFriend]()
    
    //생성자 메소드
    init() {
        _myFriendList = State(initialValue: prepareData())
    }
    
    var body: some View {
        VStack{
            Text("선택된 필터: \(filteredValue.rawValue)")
            
            Picker(selection: $filteredValue, label: Text("or"),
                   content: {
                Text("초등학교").tag(School.elementary)
                Text("중학교").tag(School.middle)
                Text("고등학교").tag(School.high)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            List{
                ForEach(myFriendList.filter{ filterTerm in
                    //$0.school == filteredValue
                    filterTerm.school == filteredValue
                }) { friendItem in
                    GeometryReader { geometryProxy in
                        
                        HStack {
                            Text("name: \(friendItem.name)")
                                .frame(width: geometryProxy.size.width / 3)
                            Divider()
                            Text("school: \(friendItem.school.rawValue)")
                                .frame(width: geometryProxy.size.width / 2)
                        }
                    }
                }
            }
            
//            List {
//                ForEach(myFriendList, id: \.self){ friendItem in
//                    GeometryReader { geometryProxy in
//                        HStack {
//                            Text("name: \(friendItem.name)")
//                                .frame(width: geometryProxy.size.width / 3)
//                            Divider()
//                            Text("school: \(friendItem.school.rawValue)")
//                                .frame(width: geometryProxy.size.width / 2)
//                        }
//                    }
//
//
//                }
//            }
        }
    }
}

struct MyFilteredList_Previews: PreviewProvider {
    static var previews: some View {
        MyFilteredList()
    }
}
