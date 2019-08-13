/* https://www.systutorials.com/241821/how-to-hide-my-private-ip-in-email-header-in-thunderbird/ */
user_pref("mail.smtpserver.default.hello_argument", "localhost");
/* https://www.systutorials.com/5515/making-thunderbird-not-wrap-lines-automatically/ */
user_pref("mail.compose.wrap_to_window_width", true);
user_pref("mailnews.wraplength", 0);
/* https://www.systutorials.com/310/default-descending-sort-order-and-inline-quote-when-reply-in-thunderbird/ */
user_pref("mailnews.default_sort_order", 2);
/* default in bodytext mode */
user_pref("mail.compose.default_to_paragraph", false);
/* show full name and email */
user_pref("mail.showCondensedAddresses", false);
/* suppress signature double dash separator */
user_prof("mail.identity.default.suppress_signature_separator", true);
