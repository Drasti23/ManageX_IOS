import SwiftUI

struct TimeRegisterMainView: View {
    @State private var clockInTime: Date? = nil
    @State private var clockOutTime: Date? = nil
    @State private var duration: String = "--:--:--"

    var body: some View {
        VStack {
            
            Text("Time Register")
                    .font(.largeTitle)
                    .padding(.bottom, 5)

            Text("Welcome, User!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)

            if let clockIn = clockInTime {
                Text("Clocked In At: \(formatDate(clockIn))")
                    .font(.headline)
                    .padding(.bottom, 5)
            }

            if let clockOut = clockOutTime {
                Text("Clocked Out At: \(formatDate(clockOut))")
                    .font(.headline)
                    .padding(.bottom, 5)
            }

            Text("Duration: \(duration)")
                .font(.title3)
                .foregroundColor(.green)
                .padding(.bottom, 20)

            HStack(spacing: 20) {
                Button(action: {
                    clockIn()
                }) {
                    Text("Clock In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    clockOut()
                }) {
                    Text("Clock Out")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }

    // Clock In Logic
    func clockIn() {
        clockInTime = Date()
        clockOutTime = nil // Reset clock-out
        duration = "--:--:--"
    }

    // Clock Out Logic
    func clockOut() {
        guard let clockIn = clockInTime else { return }
        clockOutTime = Date()
        calculateDuration(from: clockIn, to: clockOutTime!)
    }

    // Calculating  Duration
    func calculateDuration(from start: Date, to end: Date) {
        let timeInterval = end.timeIntervalSince(start)
        let hours = Int(timeInterval) / 3600
        let minutes = (Int(timeInterval) % 3600) / 60
        let seconds = Int(timeInterval) % 60

        duration = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    // Format Date
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a"
        return formatter.string(from: date)
    }
}


#Preview {
    TimeRegisterMainView()
}
