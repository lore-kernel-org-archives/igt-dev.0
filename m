Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAD010E18B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 06:51:55 +0000 (UTC)
Message-ID: <898e839e-50e0-1725-cf6d-f567b243b3fc@intel.com>
Date: Tue, 5 Sep 2023 12:21:35 +0530
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230905052058.2216763-1-riana.tauro@intel.com>
 <CY5PR11MB6211861228CB959139EA8EC095E8A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211861228CB959139EA8EC095E8A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add GT id to identify failures
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 9/5/2023 11:46 AM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Tuesday, September 5, 2023 10:51 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>> Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Subject: [PATCH i-g-t 0/2] Add GT id to identify failures
>>
>> Add GT id to test assertions to identify which gt is causing a failure
> How about adding a debug log to print gt name in xe_is_gt_in_c6() as well ?
> Thanks,
> Anshuman Gupta.
Hi Anshuman

I did try that. Since it's under igt_wait and called multiple times (10)
The log is printed every time the function is called.

For some tests which use a loop, it was a lot of
prints.

Thanks
Riana Tauro
>>
>> Riana Tauro (2):
>>    tests/intel/xe_pm_residency: Add GT id to C6 assertions
>>    tests/intel/xe_guc_pc: Add GT id to C6 assertions
>>
>>   tests/intel/xe_guc_pc.c       | 18 ++++++++++++------
>>   tests/intel/xe_pm_residency.c |  8 ++++----
>>   2 files changed, 16 insertions(+), 10 deletions(-)
>>
>> --
>> 2.40.0
> 
