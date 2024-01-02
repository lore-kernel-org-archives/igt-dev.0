Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4011710E130
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jan 2024 09:05:01 +0000 (UTC)
Message-ID: <9dd9361c-8030-4e1f-9235-4838110e792a@intel.com>
Date: Tue, 2 Jan 2024 14:34:20 +0530
Subject: Re: [PATCH] [RFC] tests/intel: Add tests to run suspend without
 display
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20231222093654.923541-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB6211813F1C521B84C5E4C544959DA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <CY5PR11MB6211813F1C521B84C5E4C544959DA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 12/29/2023 3:00 PM, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>> Sent: Friday, December 22, 2023 3:07 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>
>> Subject: [PATCH] [RFC] tests/intel: Add tests to run suspend without display
>> Add tests to validate s3/s2idle suspend cycle without display module to rule
>> out display related issues from the suspend/resume stack.
> Can you extend the existing xe_pm s2idle/s3 test which also submits the workload.
> Idea is to get the existing test results without display module.
> Thanks,
> Anshuman Gupta.

The last time I checked those tests are difficult to run for only 
s2idle/s3, they run the full suite from s0-s4. But let me double check.

Thanks,

Suja

>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   tests/intel/xe_pm.c | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
>> 602729daf..55088e7fa 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -17,6 +17,7 @@
>>   #include "igt.h"
>>   #include "lib/igt_device.h"
>>   #include "lib/igt_pm.h"
>> +#include "lib/igt_kmod.h"
>>   #include "lib/igt_sysfs.h"
>>   #include "lib/igt_syncobj.h"
>>   #include "lib/intel_reg.h"
>> @@ -364,6 +365,30 @@ NULL));
>>   		igt_assert(in_d3(device, d_state));
>>   }
>>
>> +/**
>> + * SUBTEST: s2idle-without-display
>> + * Functionality: pm
>> + * Description: validate the s2idle cycle without display  */
>> +
>> +/**
>> + * SUBTEST: s3-without-display
>> + * Functionality: pm
>> + * Description: validate the s3 cycle without display  */
>> +
>> +static void
>> +test_suspend_without_display(int state) {
>> +	igt_kmsg(KMSG_INFO "Unloading Xe\n");
>> +	igt_assert_eq(igt_xe_driver_unload(),0);
>> +
>> +	igt_kmsg(KMSG_INFO "Re-loading Xe\n");
>> +	igt_assert_eq(igt_xe_driver_load("enable_display=0"),0);
>> +
>> +	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE); }
>> +
>>   /**
>>    * SUBTEST: vram-d3cold-threshold
>>    * Functionality: pm - d3cold
>> @@ -536,6 +561,14 @@ igt_main
>>   		}
>>   	}
>>
>> +	igt_describe("Validate s2idle without display");
>> +	igt_subtest("s2idle-without-display")
>> +		test_suspend_without_display(SUSPEND_STATE_FREEZE);
>> +
>> +	igt_describe("Validate s3 without display");
>> +	igt_subtest("s3-without-display")
>> +		test_suspend_without_display(SUSPEND_STATE_S3);
>> +
>>   	igt_describe("Validate whether card is limited to d3hot, if vram used >
>> vram threshold");
>>   	igt_subtest("vram-d3cold-threshold") {
>>   		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
>> --
>> 2.25.1
