Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E521E10E07C
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Mar 2022 23:09:43 +0000 (UTC)
Message-ID: <4fffd5fe-5605-d0ad-a295-0773036f0726@intel.com>
Date: Thu, 31 Mar 2022 16:09:32 -0700
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220330183259.3003663-1-daniele.ceraolospurio@intel.com>
 <20220330183259.3003663-2-daniele.ceraolospurio@intel.com>
 <87v8vthgzb.wl-ashutosh.dixit@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <87v8vthgzb.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kmod: Wait for a kmod to
 finish its probe before unloding it.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 3/31/2022 3:52 PM, Dixit, Ashutosh wrote:
> On Wed, 30 Mar 2022 11:32:58 -0700, Daniele Ceraolo Spurio wrote:
>> Modprobing i915 can result in other dependent modules being loaded
>> automatically as a follow up. This means that by the time the i915 load
>> function returns these modules may still be going through their init, so
>> if we try to immediately unload i915 again we will fail with an
>> -EBUSY.
> Can you explain a bit where we see this happening and if any tests fail
> because of this? My expectation would be if module A depends on module B,
> loading A will cause B to load, but loading B will not cause A to load. So
> what is causing these dependent modules to load when we load i915? Is there
> e.g. something in /etc/modprobe.d or udev which is causing this to happen?

This is a new scenario, introduced with the GSC series where i915 
exposes the GSC as an aux device and the mei-gsc module binds to it 
(link to the kernel series in the cover letter). The kernel handles the 
addition of an aux device similarly to a device hot-plug, with the 
relevant driver (mei-gsc in this case) being automatically probed, 
without requiring an explicit modprobe. This aux device probe happens 
separately from the parent device probe, which means that the i915 probe 
can complete and return before the mei-gsc probe is done. The fact that 
mei-gsc binds to an i915 aux device creates a dependency, even if 
mei-gsc doesn't actually explicitly use any function exported by i915, 
so we need to unload it to be able to unload i915.

> Currently in IGT we maintain a list of modules depenedent on i915 which we
> unload prior to unloading i915. An alternative approach to this patch may
> be to maintain a similar list in igt_i915_driver_load() and load dependent
> modules after loading i915 as long as they are present on the system. So we
> would not need to wait for these dependent modules to complete loading when
> we unload i915. Do you think this is feasible?

No, as mentioned above the module is loaded automatically.

Daniele

>
> Thanks.
>
>> To avoid this, if the module load is still in progress, wait for it to
>> complete before unloading.
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> ---
>>   lib/igt_kmod.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index cf7a3b22..d2ac8a56 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -143,6 +143,12 @@ out:
>> 	return ret;
>>   }
>>
>> +static bool
>> +igt_kmod_is_loading(struct kmod_module *kmod)
>> +{
>> +	return kmod_module_get_initstate(kmod) == KMOD_MODULE_COMING;
>> +}
>> +
>>   static int modprobe(struct kmod_module *kmod, const char *options)
>>   {
>> 	unsigned int flags;
>> @@ -289,6 +295,16 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
>> 		goto out;
>> 	}
>>
>> +	if (igt_kmod_is_loading(kmod)) {
>> +		igt_debug("%s still initializing\n", mod_name);
>> +		err = igt_wait(!igt_kmod_is_loading(kmod), 10000, 100);
>> +		if (err < 0) {
>> +			igt_debug("%s failed to complete init within the timeout\n",
>> +				  mod_name);
>> +			goto out;
>> +		}
>> +	}
>> +
>> 	err = igt_kmod_unload_r(kmod, flags);
>> 	if (err < 0) {
>> 		igt_debug("Could not remove module %s (%s)\n", mod_name,
>> --
>> 2.25.1
>>
