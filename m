Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4F410EA10
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 16:40:13 +0000 (UTC)
Message-ID: <745d8e2a-0fa3-db80-3aaf-7881bf08b8e3@intel.com>
Date: Thu, 8 Sep 2022 22:09:25 +0530
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20220908144609.2878575-1-riana.tauro@intel.com>
 <20220908144609.2878575-3-riana.tauro@intel.com>
 <CY5PR11MB6211D2F2EE0EABBD5C76FE0195409@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211D2F2EE0EABBD5C76FE0195409@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/i915_suspend: Disable
 d3cold_allowed for basic-s2idle-without-i915
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



On 9/8/2022 8:58 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Thursday, September 8, 2022 8:16 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>> Subject: [PATCH i-g-t 2/2] tests/i915/i915_suspend: Disable d3cold_allowed for
>> basic-s2idle-without-i915
>>
>> When module is unloaded and s2idle is triggered, PCI core leaves the endpoint in
>> D0 and the bridge in D3 state causing PCIE spec violation. The config space is
>> read as 0xFF
>>
>> Keep the bridge in D0 before module unload to prevent this issue
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/i915/i915_suspend.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c index
>> 94935595..a6769d64 100644
>> --- a/tests/i915/i915_suspend.c
>> +++ b/tests/i915/i915_suspend.c
>> @@ -43,6 +43,7 @@
>>   #include "igt.h"
>>   #include "igt_kmod.h"
>>   #include "igt_device.h"
>> +#include "igt_device_scan.h"
>>
>>   #define OBJECT_SIZE (16*1024*1024)
>>
>> @@ -206,13 +207,40 @@ test_forcewake(int fd, bool hibernate)  static void
>> test_suspend_without_i915(int state)  {
>> +	struct igt_device_card card;
>> +	char d3cold_allowed[2];
>> +	int fd;
> Why do we need fd ?

igt_devices_scan uses udev lib to scan the drm devices.
This requires the i915 to be loaded.

Should i use igt_i915_driver_load(NULL) instead?

>> +
>> +	fd = __drm_open_driver(DRIVER_INTEL);
>> +	igt_devices_scan(false);
>> +
>> +	/*
>> +	 * When module is unloaded and s2idle is triggered,
>> +	 * PCI core leaves the endpoint in D0 and the bridge in
>> +	 * D3 state causing PCIE spec violation.
>> +	 *
>> +	 * Keep the bridge in D0 before module unload to prevent
>> +	 * this issue
>> +	 **/
> Comment style need to change.
> Anshuman.
>> +	if (state == SUSPEND_STATE_FREEZE &&
>> +	    igt_device_find_first_i915_discrete_card(&card)) {
>> +		igt_pm_get_d3cold_allowed(&card, d3cold_allowed);
>> +		igt_pm_set_d3cold_allowed(&card, "0\n");
>> +	}
>> +	close(fd);
>> +
>>   	igt_kmsg(KMSG_INFO "Unloading i915\n");
>>   	igt_assert_eq(igt_i915_driver_unload(),0);
>>
>>   	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
>>
>> +	if (state == SUSPEND_STATE_FREEZE && strlen(card.card))
>> +		igt_pm_set_d3cold_allowed(&card, d3cold_allowed);
>> +
>>   	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
>>   	igt_assert_eq(igt_i915_driver_load(NULL), 0);
>> +
>> +	igt_devices_free();
>>   }
>>
>>   int fd;
>> --
>> 2.25.1
> 
