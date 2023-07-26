Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9459110E464
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 11:34:47 +0000 (UTC)
Message-ID: <934c7837-bc22-7741-5bf9-839d2902f61f@intel.com>
Date: Wed, 26 Jul 2023 17:04:35 +0530
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230720043015.1677140-1-riana.tauro@intel.com>
 <CY5PR11MB6211B99539C0E65F73CD4081953FA@CY5PR11MB6211.namprd11.prod.outlook.com>
 <75b81eb1-c5c6-1e13-a613-307661448694@intel.com>
 <CY5PR11MB62111B0E0F61B1EB473C249D9502A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB62111B0E0F61B1EB473C249D9502A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe: Add a test that validates GT
 C0 on exec
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Anshuman

On 7/24/2023 12:25 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Monday, July 24, 2023 10:43 AM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Belgaumkar, Vinay
>> <vinay.belgaumkar@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>> kamil.konieczny@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: Re: [PATCH i-g-t] tests/xe: Add a test that validates GT C0 on exec
>>
>>
>> Hi Anshuman
>>
>> On 7/21/2023 2:52 PM, Gupta, Anshuman wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Tauro, Riana <riana.tauro@intel.com>
>>>> Sent: Thursday, July 20, 2023 10:00 AM
>>>> To: igt-dev@lists.freedesktop.org
>>>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>>>> <anshuman.gupta@intel.com>; Dixit, Ashutosh
>>>> <ashutosh.dixit@intel.com>; Belgaumkar, Vinay
>>>> <vinay.belgaumkar@intel.com>; Nilawar, Badal
>>>> <badal.nilawar@intel.com>; kamil.konieczny@linux.intel.com
>>>> Subject: [PATCH i-g-t] tests/xe: Add a test that validates GT C0 on
>>>> exec
>>>>
>>>> Add a test that validates if GT is in C0 while running a spinner on
>>>> an engine of the gt
>>> We should have a test as well to test opportunistic RC6 during workload
>> execution ?
>>> This is a negative test, not sure if this is going to fail.
>> This is a replacement for rc0_on_exec from
>> https://patchwork.freedesktop.org/patch/544388/?series=119910&rev=1.
>>
>> Due to the path change, moved this test here and used spinner.
>> Should i drop this test?
> We can have this test nut we should have a test as well to test rc6 as well.
Thanks for the review. I'll drop this patch and add a test that combines 
both.

Thanks
Riana
> Regards,
> Anshuman.
>>
>> Thanks
>> Riana
>>> Br,
>>> Anshuman.
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    tests/xe/xe_pm_residency.c | 39
>>>> ++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 39 insertions(+)
>>>>
>>>> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
>>>> index a20c4449c..7614af761 100644
>>>> --- a/tests/xe/xe_pm_residency.c
>>>> +++ b/tests/xe/xe_pm_residency.c
>>>> @@ -14,6 +14,7 @@
>>>>    #include "igt.h"
>>>>    #include "igt_sysfs.h"
>>>>
>>>> +#include "xe/xe_ioctl.h"
>>>>    #include "xe/xe_query.h"
>>>>
>>>>    #define SLEEP_DURATION 3000 /* in milliseconds */ @@ -76,6 +77,38
>>>> @@ static unsigned long read_idle_residency(int fd, int gt)
>>>>    	return residency;
>>>>    }
>>>>
>>>> +/**
>>>> + * SUBTEST: gt-c0-on-exec
>>>> + * Description: Validate if GT is in C0 while running a spinner
>>>> + *		on an engine of that GT
>>>> + * Run type: FULL
>>>> + */
>>>> +static void test_c0_exec(int fd, struct drm_xe_engine_class_instance
>>>> +*hwe) {
>>>> +	uint64_t ahnd;
>>>> +	unsigned int engine;
>>>> +	uint32_t vm;
>>>> +	igt_spin_t *spin;
>>>> +
>>>> +	/* Start with GT in C6 */
>>>> +	igt_assert_f(igt_wait(is_gt_in_c6(fd, hwe->gt_id), 1000, 1), "GT is
>>>> +not in C6\n");
>>>> +
>>>> +	igt_debug("Run on engine: %s:%d\n",
>>>> +		  xe_engine_class_string(hwe->engine_class), hwe-
>>>>> engine_instance);
>>>> +	vm = xe_vm_create(fd, 0, 0);
>>>> +	engine = xe_engine_create(fd, vm, hwe, 0);
>>>> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>>>> +	spin = igt_spin_new(fd, .ahnd = ahnd, .engine = engine, .vm = vm);
>>>> +
>>>> +	/* GT should be in C0 when busy */
>>>> +	igt_assert_f(!is_gt_in_c6(fd, hwe->gt_id), "GT in C6\n");
>>>> +
>>>> +	igt_spin_free(fd, spin);
>>>> +	put_ahnd(ahnd);
>>>> +	xe_engine_destroy(fd, engine);
>>>> +	xe_vm_destroy(fd, vm);
>>>> +}
>>>> +
>>>>    /**
>>>>     * SUBTEST: idle-residency
>>>>     * Description: basic residency test to validate idle residency @@
>>>> -101,12
>>>> +134,18 @@ static void test_idle_residency(int fd, int gt)  igt_main
>>>> +{
>>>>    	int fd, gt;
>>>> +	struct drm_xe_engine_class_instance *hwe;
>>>>
>>>>    	igt_fixture {
>>>>    		fd = drm_open_driver(DRIVER_XE);
>>>>    		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
>>>>    	}
>>>>
>>>> +	igt_describe("Validate GT C0 on exec");
>>>> +	igt_subtest("gt-c0-on-exec")
>>>> +		xe_for_each_hw_engine(fd, hwe)
>>>> +			test_c0_exec(fd, hwe);
>>>> +
>>>>    	igt_describe("Validate GT C6 on idle");
>>>>    	igt_subtest("gt-c6-on-idle")
>>>>    		xe_for_each_gt(fd, gt)
>>>> --
>>>> 2.40.0
>>>
