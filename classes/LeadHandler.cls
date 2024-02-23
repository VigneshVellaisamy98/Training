public class LeadHandler {
    public static void handleLeadConversion(Map<Id, Lead> newLeadsMap, Map<Id, Lead> oldLeadsMap) {
        List<Lead> convertedLeads = new List<Lead>();
        List<Account> newAccounts = new List<Account>();
        List<Opportunity> newOpportunities = new List<Opportunity>();

        for (Id leadId : newLeadsMap.keySet()) {
            Lead newLead = newLeadsMap.get(leadId);
            Lead oldLead = oldLeadsMap.get(leadId);

            // Check if lead status changed to closed converted
            if (newLead.IsConverted && !oldLead.IsConverted && newLead.Status == 'Closed - Converted') {
                // Create account if not already created during lead conversion
                if (newLead.ConvertedAccountId == null) {
                    Account newAccount = new Account();
                    newAccount.Name = newLead.Company;
                        // Add any other fields you want to populate
                    
                    newAccounts.add(newAccount);
                }
                
                // Create opportunity if not already created during lead conversion
                if (newLead.ConvertedOpportunityId == null) {
                    Opportunity newOpportunity = new Opportunity();
                    newOpportunity.Name = 'New Opportunity'; // Add appropriate name
                    newOpportunity.StageName = 'Prospecting'; // Add appropriate stage
                    newOpportunity.CloseDate = Date.today()+10;
                        // Add any other fields you want to populate
                    
                    newOpportunities.add(newOpportunity);
                }

                // Add lead to the list of converted leads
                convertedLeads.add(newLead);
            }
        }

        // Insert new accounts and opportunities
        if (!newAccounts.isEmpty()) {
            insert newAccounts;
        }
        if (!newOpportunities.isEmpty()) {
            insert newOpportunities;
        }

        // Update converted leads to prevent re-processing
        if (!convertedLeads.isEmpty()) {
            for (Lead lead : convertedLeads) {
                lead.IsConverted = false;
            }
            update convertedLeads;
        }
    }
}
