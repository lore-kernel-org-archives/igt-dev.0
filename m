Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441E910E12D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 04:55:01 +0000 (UTC)
Message-ID: <96638823-9cba-409f-b519-dfefce8c98b1@intel.com>
Date: Mon, 13 Nov 2023 10:24:44 +0530
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231109110050.388343-1-sujaritha.sundaresan@intel.com>
 <20231109110050.388343-5-sujaritha.sundaresan@intel.com>
 <9232d88e-e9bf-40fb-ad5b-5e298d1bdd0d@intel.com>
 <b30b58c8-4936-48b5-a166-106cc07193a2@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <b30b58c8-4936-48b5-a166-106cc07193a2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 4/5] tests/intel: Print drpc info for
 rc6_residency test
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



On 11/13/2023 9:11 AM, Sundaresan, Sujaritha wrote:
> 
> On 11/10/2023 7:31 PM, Riana Tauro wrote:
>> Hi Suja
>>
>> On 11/9/2023 4:30 PM, Sujaritha Sundaresan wrote:
>>> Add drpc debug info for the rc6_residency test.
>> Add more details on why drpc debug is needed in commit message.
>>
>> Also add version history to the patch
> Sure will do
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> ---
>>>   tests/intel/i915_pm_rc6_residency.c | 51 ++++++++++++++++++++++-------
>>>   1 file changed, 40 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/tests/intel/i915_pm_rc6_residency.c 
>>> b/tests/intel/i915_pm_rc6_residency.c
>>> index 6e491f270..0288158fd 100644
>>> --- a/tests/intel/i915_pm_rc6_residency.c
>>> +++ b/tests/intel/i915_pm_rc6_residency.c
>>> @@ -36,6 +36,7 @@
>>>   #include "i915/gem.h"
>>>   #include "i915/gem_create.h"
>>>   #include "igt.h"
>>> +#include "igt_debugfs.h"
>>>   #include "igt_perf.h"
>>>   #include "igt_power.h"
>>>   #include "igt_sysfs.h"
>>> @@ -230,14 +231,27 @@ static uint64_t pmu_read_single(int fd)
>>>       return __pmu_read_single(fd, NULL);
>>>   }
>>>   -#define __assert_within_epsilon(x, ref, tol_up, tol_down) \
>>> -    igt_assert_f((x) <= (ref) * (1.0 + (tol_up)/100.) && \
>>> -             (x) >= (ref) * (1.0 - (tol_down)/100.), \
>>> -             "'%s' != '%s' (%.3g not within +%d%%/-%d%% tolerance of 
>>> %.3g)\n",\
>>> -             #x, #ref, (double)(x), (tol_up), (tol_down), 
>>> (double)(ref))
>>> +#define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
>>> +    igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
>>> +             (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
>>> +             "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance 
>>> of %f)\n %s\n",\
>>> +             #x, #ref, (double)(x), \
>>> +             (tol_up) * 100.0, (tol_down) * 100.0, \
>>> +             (double)(ref), debug_data)
>>>   -#define assert_within_epsilon(x, ref, tolerance) \
>>> -    __assert_within_epsilon(x, ref, tolerance, tolerance)
>>> +#define assert_within_epsilon(x, ref, tolerance, debug_data) \
>>> +    __assert_within_epsilon(x, ref, tolerance, tolerance, debug_data)
>>> +
>>> +char *drpc;
>> Move this to the top of the file
>>
>> Thanks
>> Riana
> 
> Just the definition ? I'm assuming the asserts can stay as is ?

Yes just the definition
> 
> Thanks
> 
> Suja
> 
>>> +
>>> +static char *get_drpc(int i915, int gt_id)
>>> +{
>>> +    int gt_dir;
>>> +
>>> +    gt_dir = igt_debugfs_gt_dir(i915, gt_id);
>>> +    igt_assert(gt_dir != -1);
>>> +    return igt_sysfs_get(gt_dir, "drpc");
>>> +}
>>>     static bool __pmu_wait_for_rc6(int fd)
>>>   {
>>> @@ -414,7 +428,9 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>>> uint64_t flags, unsigned int gt)
>>>               "Total energy used while idle: %.1fmJ (%.1fmW)\n",
>>>               idle, (idle * 1e9) / slept);
>>>       }
>>> -    assert_within_epsilon(rc6, ts[1] - ts[0], 5);
>>> +    drpc = get_drpc(i915, gt);
>>> +
>>> +    assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
>>>         done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>>>   @@ -450,7 +466,12 @@ static void rc6_idle(int i915, uint32_t 
>>> ctx_id, uint64_t flags, unsigned int gt)
>>>           igt_assert(cycles >= SLEEP_DURATION);
>>>             /* While very nearly idle, expect full RC6 */
>>> -        assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
>>> +        drpc = get_drpc(i915, gt);
>>> +
>>> +        assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
>>> +
>>> +        free(drpc);
>>> +        drpc = NULL;
>>>       }
>>>         munmap(done, 4096);
>>> @@ -503,7 +524,9 @@ static void rc6_fence(int i915, unsigned int gt)
>>>               "Total energy used while idle: %.1fmJ (%.1fmW)\n",
>>>               idle, (idle * 1e9) / slept);
>>>       }
>>> -    assert_within_epsilon(rc6, ts[1] - ts[0], 5);
>>> +    drpc = get_drpc(i915, gt);
>>> +
>>> +    assert_within_epsilon(rc6, ts[1] - ts[0], 5, drpc);
>>>         /* Submit but delay execution, we should be idle and 
>>> conserving power */
>>>       ctx = intel_ctx_create_for_gt(i915, gt);
>>> @@ -544,8 +567,13 @@ static void rc6_fence(int i915, unsigned int gt)
>>>             close(timeline);
>>>   -        assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
>>> +        drpc = get_drpc(i915, gt);
>>> +
>>> +        assert_within_epsilon(rc6, ts[1] - ts[0], tolerance, drpc);
>>>           gem_quiescent_gpu(i915);
>>> +
>>> +        free(drpc);
>>> +        drpc = NULL;
>>>       }
>>>       put_ahnd(ahnd);
>>>       intel_ctx_destroy(i915, ctx);
>>> @@ -634,6 +662,7 @@ igt_main
>>>       }
>>>         igt_fixture {
>>> +        free(drpc);
>>>           drm_close_driver(i915);
>>>       }
>>>   }
