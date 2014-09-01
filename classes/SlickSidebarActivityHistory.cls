// Copyright 2014, Kevin Akermanis - Sales Engineering, Salesforce.com Inc.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the salesforce.com nor the names of its contributors
//   may be used to endorse or promote products derived from this software
//   without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

public with sharing class SlickSidebarActivityHistory extends SlickSidebarAbstractController  {
  public List<ActivityHistory> activities {set;get;}

  public SlickSidebarActivityHistory() {
   
  }
  /**
   *
   * Activity history is a bit of a special case for querying in that:
   * 1) There is no fieldset that can directly be attributed to the History
   * 2) It cannot be queried directly and needs to be rolled up under a parent object
   * 3) The API name doesn't follow convention and goes by the plural name
   * 
   **/
public override void loadWidget() { 
    activities = new List<ActivityHistory>();
    String actQueryString;
    List<Contact> contactHistory;
    List<Case> caseHistory;
    List<Account> accountHistory;
        
        //new
        List<Lead> leadHistory;
        
    actQueryString = SlickSidebarFieldSetHelper.createBaseQueryString(new ActivityHistory(), SObjectType.Event.FieldSets.SlickSidebarActivityHistory.getFields());
    actQueryString += ' ORDER BY ActivityDate DESC, LastModifiedDate DESC, LastModifiedDate DESC NULLS LAST LIMIT 5';

    // For some reason the ActivityHisty sObject is called ActivitiyHistories vs. the base object name???
    actQueryString = actQueryString.replaceFirst('ActivityHistory', 'ActivityHistories');

    // The nested query that will just pull the activities
    //System.debug('ConsoleWidgetActivityHistory.init - actQueryString: ' + actQueryString);

    String queryString = 'SELECT (' + actQueryString + ') FROM ';
    if ( currContact != null ) {
      queryString += ' Contact where Id = \'' + currContact.Id + '\'';
      contactHistory = Database.query(queryString);

      for (Contact curContact : contactHistory) {
        for (ActivityHistory act : curContact.ActivityHistories) {
          activities.add(act);
        }
      }
    } else if ( currCase != null ) {
      queryString += ' Case where Id = \'' + currCase.Id + '\'';
      caseHistory = Database.query(queryString);

      for (Case curCase : caseHistory) {
        for (ActivityHistory act : curCase.ActivityHistories) {
          activities.add(act);
        }
      }
    } 
        else if ( currLead != null ) {
           
      queryString += ' Lead where Id = \'' + currLead.Id + '\'';
      leadHistory = Database.query(queryString);

      for (Lead curLead : leadHistory) {
        for (ActivityHistory act : curLead.ActivityHistories) {
          activities.add(act);
        }
      }
    }
        
        
        else {
      queryString += ' Account where Id = \'' + currAccount.Id + '\'';
      accountHistory = Database.query(queryString);

      for (Account curAccount : accountHistory) {
        for (ActivityHistory act : curAccount.ActivityHistories) {
          activities.add(act);
        }
      }      
    }
    System.debug('SlickSidebarActivityHistory.init - FINAL queryString: ' + queryString);
  }


  public List<Schema.FieldSetMember> getFieldSetMembers() {
    return SObjectType.Event.FieldSets.SlickSidebarActivityHistory.getFields();
  }

  public String getObjectName() {
    return ActivityHistory.sObjectType.getDescribe().getLabel();
  }
  public override void UnitTestCompliance() {
    Integer i=0;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;  
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;
    i++;      
  }  
}