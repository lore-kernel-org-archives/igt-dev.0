Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC9710E568
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 07:06:51 +0000 (UTC)
Message-ID: <c87ba1a0-4d8f-77f3-5182-36d9da1117a0@intel.com>
Date: Thu, 21 Sep 2023 12:36:37 +0530
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, <badal.nilawar@intel.com>
References: <20230907060638.2317485-1-riana.tauro@intel.com>
 <20230907060638.2317485-2-riana.tauro@intel.com>
 <7360a545-fe62-ea4e-b2fd-2eda5ab703e4@intel.com>
 <20230919131631.i5wk7qgmaduv7r5v@kamilkon-desk.igk.intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230919131631.i5wk7qgmaduv7r5v@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/intel/xe_guc_pc: Add
 freq_power test
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

Hi Kamil

Thanks for the review

On 9/19/2023 6:46 PM, Kamil Konieczny wrote:
> Hi,
> 
> On 2023-09-18 at 09:31:02 -0700, Belgaumkar, Vinay wrote:
>>
>> On 9/6/2023 11:06 PM, Riana Tauro wrote:
>>> An assumption is that at lower frequencies,
>>> not only do we run slower, but we save power compared to
>>> higher frequencies.
>>>
>>> This test runs a spinner and sets the min and max frequencies
>>> to rp0 and rpn respectively. It then checks if power measured
>>> at lower frequencies is lesser.
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>    tests/intel/xe_guc_pc.c | 88 +++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 88 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
>>> index 032816921..cea7b56fd 100644
>>> --- a/tests/intel/xe_guc_pc.c
>>> +++ b/tests/intel/xe_guc_pc.c
>>> @@ -13,6 +13,7 @@
>>>    #include "igt.h"
>>>    #include "lib/igt_syncobj.h"
>>> +#include "igt_power.h"
>>>    #include "igt_sysfs.h"
>>>    #include "xe_drm.h"
>>> @@ -387,6 +388,82 @@ static void test_reset(int fd, int gt_id, int cycles)
>>>    	}
>>>    }
>>> +static int cmp_u64(const void *a, const void *b)
>>> +{
>>> +	return (*(u64 *)a - *(u64 *)b);
>>> +}
>>> +
>>> +static uint64_t measure_power(int fd, struct igt_power *gpu)
>>> +{
>>> +	struct power_sample sample[2];
>>> +	uint64_t power[5];
>>> +
>>> +	for (int i = 0; i < 5; i++) {
>>> +		igt_power_get_energy(gpu, &sample[0]);
>>> +		usleep(10000); /* 10 ms */
>>> +		igt_power_get_energy(gpu, &sample[1]);
>>> +
>>> +		power[i] = igt_power_get_mW(gpu, &sample[0], &sample[1]);
>>> +	}
>>> +	/* Sort in ascending order and use a triangular filter */
>>> +	qsort(power, 5, sizeof(*power), cmp_u64);
>>> +	return DIV_ROUND_UP(power[1] + 2 * power[2] + power[3], 4);
>>> +}
>>> +
>>> +/**
>>> + * SUBTEST: freq_power
> -------------------- ^
> Test names should use '-' as separator but testplan expects spaces:
> 
> * SUBTEST: freq power
Adding space instead of '-' in test documentation throws a warning
Warning: Missing documentation for igt@xe_guc_pc@freq-power

> 
>>> + * Description: Validates if running at lower frequencies saves power
>>> + * Run type: FULL
> ------- ^^^^^^^^
> We dropped 'Run type' field, see patch by Mauro:
> ("commit ada49eb7de576858b63e231ebfd850cfe864cefe")
>      tests: Intel Xe: drop Run type field
Will remove this
> 
>>> + */
>>> +static void test_freq_power(int fd, int gt_id, struct drm_xe_engine_class_instance *hwe)
>>> +{
>>> +	uint32_t rp0, rpn, vm;
>>> +	uint64_t ahnd;
>>> +	struct igt_power gpu;
>>> +	struct {
>>> +		uint64_t power;
>>> +		uint32_t freq;
>>> +	} min, max;
>>> +	igt_spin_t *spin;
>>> +
>>> +	/* Run for engines belonging to the gt */
>>> +	if (gt_id != hwe->gt_id)
>>> +		return;
>>> +
>>> +	igt_power_open(fd, &gpu, "gpu");
>>> +
>>> +	rpn = get_freq(fd, gt_id, "rpn");
>>> +	rp0 = get_freq(fd, gt_id, "rp0");
>>> +
>>> +	vm = xe_vm_create(fd, 0, 0);
>>> +	ahnd = intel_allocator_open(fd, vm, INTEL_ALLOCATOR_RELOC);
>>> +	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = hwe);
>>> +
>>> +	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
>>> +	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
>>> +	min.freq = get_freq(fd, gt_id, "act");
>>> +	min.power = measure_power(fd, &gpu);
>>> +
>>> +	igt_assert(set_freq(fd, gt_id, "min", rp0) > 0);
>>> +	igt_assert(set_freq(fd, gt_id, "max", rp0) > 0);
>>> +	max.freq = get_freq(fd, gt_id, "act");
>>> +	max.power = measure_power(fd, &gpu);
>>> +
>>> +	igt_info("Engine %s:%d  min:%lumW @ %uMHz, max:%lumW @ %uMHz\n",
>>> +		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance,
>>> +		 min.power, min.freq, max.power, max.freq);
>>> +
>>> +	igt_spin_free(fd, spin);
>>> +	put_ahnd(ahnd);
>>> +	xe_vm_destroy(fd, vm);
>>> +	igt_power_close(&gpu);
>>> +
>>> +	/* Max power should be greater than min power + 10% of min power */
>> nit: reword: power@max_freq should be at least 10% greater than
>> power@min_freq?
>>> +	igt_assert_f((11 * min.power < 10 * max.power),
>>> +		     "%s:%d did not conserve power when setting lower frequency!\n",
>>> +		     xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
>>> +}
>>> +
>>>    igt_main
>>>    {
>>>    	struct drm_xe_engine_class_instance *hwe;
>>> @@ -475,6 +552,17 @@ igt_main
>>>    		}
>>>    	}
>>> +	igt_describe("Validates power measured at lower frequencies");
>> nit: reword? Validate more power is consumed at higher frequencies?
>>> +	igt_subtest("freq_power") {
> ------------------------ ^
> imho better: low-freq-power
This test checks power at both low and high frequencies and compares them.
Since there is review comment to change the description. will retain 
freq-power

Thanks
Riana Tauro
> 
> Regards,
> Kamil
> 
>>> +		/* FIXME: Remove skip once hwmon is added */
>>> +		igt_skip_on(xe_has_vram(fd));
>>> +		xe_for_each_gt(fd, gt) {
>>> +			xe_for_each_hw_engine(fd, hwe) {
>>> +				test_freq_power(fd, gt, hwe);
>>> +			}
>>> +		}
>>> +	}
>>> +
>>
>> LGTM,
>>
>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>>
>>>    	igt_fixture {
>>>    		xe_for_each_gt(fd, gt) {
>>>    			set_freq(fd, gt, "min", stash_min);
