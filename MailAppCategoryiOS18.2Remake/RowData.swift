//
//  RowData.swift
//  MailAppCategoryiOS18.2Remake
//
//  Created by Mansur Ahmed on 12/12/24.
//

import Foundation

struct RowData: Identifiable, Equatable {
  let text: String
  let subject: String
  let merchant: String
  let category: Category
  let displayImageTitle = "person.circle.fill"
  let id = UUID()
  
  var timestamp: String {
    Self.dateFormatter.string(from: _timestamp)
  }
  private let _timestamp: Date = Date().addingTimeInterval(TimeInterval.random(in: -10000...0))
  
  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    
//    formatter.dateStyle = .short
    formatter.timeStyle = .short
    formatter.doesRelativeDateFormatting = true
    
    return formatter
  }()
}

// MARK: - Mock Data

extension RowData {
  static let mockData = [
    // Primary emails
    RowData(
        text: "Welcome to Your New Account!",
        subject: "Welcome to SwiftMail, Start Exploring!",
        merchant: "SwiftMail Team",
        category: .primary
    ),
    RowData(
        text: "Meeting Reminder: Project Kickoff at 2 PM",
        subject: "Don't Miss Your Meeting at 2 PM Today",
        merchant: "Google Calendar",
        category: .primary
    ),
    RowData(
        text: "Re: Follow-up on Our Last Conversation",
        subject: "Follow-Up: Next Steps for Our Project",
        merchant: "Jane Doe",
        category: .primary
    ),
    RowData(
        text: "Your Weekly Newsletter - Stay Updated!",
        subject: "Your Weekly Tech Newsletter is Here!",
        merchant: "Tech Weekly",
        category: .primary
    ),
    
    // Transactional emails
    RowData(
        text: "Order Confirmation: #12345 - Your Shoes Are On the Way!",
        subject: "Order #12345 Confirmed - Your Items Are Shipping Soon",
        merchant: "Nike",
        category: .transactions
    ),
    RowData(
        text: "Payment Received: Invoice #67890",
        subject: "Payment Successfully Processed for Invoice #67890",
        merchant: "PayPal",
        category: .transactions
    ),
    RowData(
        text: "Your Package Has Shipped! Track it Here",
        subject: "Your Package is On Its Way - Track Your Shipment",
        merchant: "Amazon",
        category: .transactions
    ),
    RowData(
        text: "Subscription Renewal Confirmation - Premium Plan",
        subject: "Your Premium Subscription Has Been Renewed",
        merchant: "Spotify",
        category: .transactions
    ),
    
    // Updates emails
    RowData(
        text: "App Update: New Features Available in Version 2.5",
        subject: "Discover New Features in Version 2.5 of Our App!",
        merchant: "App Store",
        category: .updates
    ),
    RowData(
        text: "Your Password Has Been Successfully Changed",
        subject: "Password Change Confirmation",
        merchant: "SecureMail Support",
        category: .updates
    ),
    RowData(
        text: "Security Alert: New Login to Your Account",
        subject: "Alert: We Detected a New Login to Your Account",
        merchant: "SecureMail Security Team",
        category: .updates
    ),
    RowData(
        text: "Your Account Settings Have Been Updated",
        subject: "Your Account Settings Were Successfully Updated",
        merchant: "SwiftMail Support",
        category: .updates
    ),
    
    // Promotions emails
    RowData(
        text: "Flash Sale! 50% Off on All Electronics Today Only!",
        subject: "Hurry! 50% Off All Electronics - Today Only",
        merchant: "Best Buy",
        category: .promotions
    ),
    RowData(
        text: "Exclusive Offer: Free Shipping on Orders Over $50",
        subject: "Enjoy Free Shipping on Orders Over $50!",
        merchant: "Walmart",
        category: .promotions
    ),
    RowData(
        text: "Last Chance! Save Big on Your Favorite Brands",
        subject: "Final Hours: Save Up to 60% on Top Brands",
        merchant: "Macy's",
        category: .promotions
    ),
    RowData(
        text: "Join Our Loyalty Program and Earn Rewards",
        subject: "Earn Rewards Every Time You Shop - Join Now!",
        merchant: "Starbucks",
        category: .promotions
    ),
    RowData(
        text: "Limited Time Deal: 30% Off Your Next Purchase",
        subject: "Get 30% Off Your Next Purchase - Limited Time",
        merchant: "H&M",
        category: .promotions
    ),
    RowData(
        text: "Special Event: Early Access to Our New Collection",
        subject: "Exclusive Early Access to Our 2024 Collection!",
        merchant: "Zara",
        category: .promotions
    ),
    RowData(
        text: "Upgrade Your Subscription and Get 2 Months Free!",
        subject: "Upgrade to Premium and Get 2 Months Free!",
        merchant: "Netflix",
        category: .promotions
    ),
    RowData(
        text: "Holiday Sale: Unbeatable Deals on Winter Apparel",
        subject: "Unbeatable Holiday Deals on Winter Essentials",
        merchant: "Old Navy",
        category: .promotions
    )
  ]
}