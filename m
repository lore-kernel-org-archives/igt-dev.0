Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9993710E5D9
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 08:49:12 +0000 (UTC)
Message-ID: <2f00dd9e-9a10-ebd6-88f8-5147a4346230@intel.com>
Date: Thu, 3 Aug 2023 14:18:16 +0530
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20230803050609.2835714-1-riana.tauro@intel.com>
 <20230803050609.2835714-5-riana.tauro@intel.com>
 <CY5PR11MB6211F90C0EE12FFBEC92CFD79508A@CY5PR11MB6211.namprd11.prod.outlook.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211F90C0EE12FFBEC92CFD79508A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/xe: Add a test that validates
 residency during s2idle
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



On 8/3/2023 1:17 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Thursday, August 3, 2023 10:36 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>
>> Subject: [PATCH i-g-t 4/4] tests/xe: Add a test that validates residency during
>> s2idle
>>
>> During s2idle, the device is powered up and GT C6 enabled so we expect the
>> residency to increase across suspend.
>> Add a test that validates the residency over a s2idle cycle is within the
>> threshold.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/xe/xe_pm_residency.c | 54
>> ++++++++++++++++++++++++++++++++++----
>>   1 file changed, 49 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
>> index 4936de166..a2b56e78d 100644
>> --- a/tests/xe/xe_pm_residency.c
>> +++ b/tests/xe/xe_pm_residency.c
>> @@ -10,8 +10,10 @@
>>    * Functionality: GT C States
>>    * Test category: functionality test
>>    */
>> +#include <limits.h>
>>
>>   #include "igt.h"
>> +#include "igt_device.h"
>>   #include "igt_sysfs.h"
>>
>>   #include "xe/xe_query.h"
>> @@ -29,6 +31,11 @@ const double tolerance = 0.1;
>>   		     (tol) * 100.0, (tol) * 100.0, \
>>   		     (double)(ref))
>>
>> +enum test_type {
>> +	TEST_S2IDLE,
>> +	TEST_SLEEP,
>> +};
>> +
>>   /**
>>    * SUBTEST: gt-c6-on-idle
>>    * Description: Validate GT C6 state on idle @@ -38,9 +45,22 @@ const
>> double tolerance = 0.1;
>>    * Description: basic residency test to validate idle residency
>>    *		measured over a time interval is within the tolerance
>>    * Run type: FULL
>> + *
>> + * SUBTEST: gt-c6-freeze
>> + * Description: Validate idle residency measured over suspend(s2idle)
>> + *              is within the tolerance
>> + * Run type: FULL
>>    */
>>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>>
>> +static unsigned long walltime_ms(void)
>> +{
>> +	struct timespec ts;
>> +
>> +	clock_gettime(CLOCK_REALTIME, &ts);
>> +	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000; }
>> +
>>   static unsigned int measured_usleep(unsigned int usec)  {
>>   	struct timespec ts = { };
>> @@ -69,15 +89,25 @@ static unsigned long read_idle_residency(int fd, int gt)
>>   	return residency;
>>   }
>>
>> -static void test_idle_residency(int fd, int gt)
>> +static void test_idle_residency(int fd, int gt, enum test_type flag)
>>   {
>>   	unsigned long elapsed_ms, residency_start, residency_end;
>>
>>   	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in
>> C6\n");
>>
>> -	residency_start = read_idle_residency(fd, gt);
>> -	elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) / 1000;
>> -	residency_end = read_idle_residency(fd, gt);
>> +	if (flag == TEST_S2IDLE) {
>> +		residency_start = read_idle_residency(fd, gt);
>> +		elapsed_ms -= walltime_ms();
>> +		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
>> SUSPEND_TEST_NONE);
>> +		elapsed_ms += walltime_ms();
>> +		residency_end = read_idle_residency(fd, gt);
>> +	}
>> +
>> +	if (flag == TEST_SLEEP) {
>> +		residency_start = read_idle_residency(fd, gt);
>> +		elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) /
>> 1000;
>> +		residency_end = read_idle_residency(fd, gt);
>> +	}
>>
>>   	igt_info("Measured %lums of idle residency in %lums\n",
>>   		 residency_end - residency_start, elapsed_ms); @@ -88,6
>> +118,8 @@ static void test_idle_residency(int fd, int gt)  igt_main  {
>>   	int fd, gt;
>> +	char pci_slot_name[NAME_MAX];
>> +	uint32_t d3cold_allowed;
>>
>>   	igt_fixture {
>>   		fd = drm_open_driver(DRIVER_XE);
>> @@ -99,10 +131,22 @@ igt_main
>>   		xe_for_each_gt(fd, gt)
>>   			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
>> "GT not in C6\n");
>>
>> +	igt_describe("Validate idle residency measured over suspend cycle is
>> within the tolerance");
>> +	igt_subtest("gt-c6-freeze") {
>> +		igt_device_get_pci_slot_name(fd, pci_slot_name);
>> +		igt_pm_get_d3cold_allowed(pci_slot_name,
>> &d3cold_allowed);
>> +		igt_pm_set_d3cold_allowed(pci_slot_name, 0);
> We need to disallow d3cold only for discrete cards, rc6 residency should not get reset on integrated gfx.
> This can save some execution time on CI.

Sure Will fix this.

Thanks
Riana
> Thanks,
> Anshuman.
>> +
>> +		xe_for_each_gt(fd, gt)
>> +			test_idle_residency(fd, gt, TEST_S2IDLE);
>> +
>> +		igt_pm_set_d3cold_allowed(pci_slot_name,
>> d3cold_allowed);
>> +	}
>> +
>>   	igt_describe("Validate idle residency measured over a time interval is
>> within the tolerance");
>>   	igt_subtest("idle-residency")
>>   		xe_for_each_gt(fd, gt)
>> -			test_idle_residency(fd, gt);
>> +			test_idle_residency(fd, gt, TEST_SLEEP);
>>
>>   	igt_fixture {
>>   		close(fd);
>> --
>> 2.40.0
> 
