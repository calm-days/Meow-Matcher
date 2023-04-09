import SwiftUI

struct MenuRow: View {
    var title = "FAQ"
    var leftIcon = "questionmark"
    var rightIcon = "chevron.right"
    
    var body: some View {
        HStack(spacing: 12.0) {
            GradientIcon(icon: leftIcon)
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: rightIcon)
                .font(.system(size: 15, weight: .semibold))
                .opacity(0.7)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow()
    }
}
