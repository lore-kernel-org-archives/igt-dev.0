Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2413810E100
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 03:41:47 +0000 (UTC)
Message-ID: <351c5f77-936d-4c5a-b2be-59c2cbba9d69@intel.com>
Date: Mon, 13 Nov 2023 09:11:41 +0530
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231109110050.388343-1-sujaritha.sundaresan@intel.com>
 <20231109110050.388343-2-sujaritha.sundaresan@intel.com>
 <d9324cf9-35cc-45b7-b558-f99420ce7689@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <d9324cf9-35cc-45b7-b558-f99420ce7689@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 1/5] tests/intel: Add multi-gt support for
 rc6-idle test
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


On 11/10/2023 7:20 PM, Riana Tauro wrote:
> Hi Suja
>
> On 11/9/2023 4:30 PM, Sujaritha Sundaresan wrote:
>> Adding multi-gt support for the rc6-idle subtest
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   tests/intel/i915_pm_rc6_residency.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/i915_pm_rc6_residency.c 
>> b/tests/intel/i915_pm_rc6_residency.c
>> index b266680ac..57ac5c721 100644
>> --- a/tests/intel/i915_pm_rc6_residency.c
>> +++ b/tests/intel/i915_pm_rc6_residency.c
>> @@ -376,7 +376,7 @@ static void kill_children(int sig)
>>       signal(sig, old);
>>   }
>>   -static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
>> +static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, 
>> unsigned int gt)
>>   {
>>       const int64_t duration_ns = SLEEP_DURATION * 
>> (int64_t)NSEC_PER_SEC;
>>       const int tolerance = 20; /* Some RC6 is better than none! */
>> @@ -397,7 +397,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, 
>> uint64_t flags)
>>       struct igt_power gpu;
>>       int fd;
>>   -    fd = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
>> +    fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
>>       igt_drop_caches_set(i915, DROP_IDLE);
>>       igt_require(__pmu_wait_for_rc6(fd));
>>       igt_power_open(i915, &gpu, "gpu");
>> @@ -558,6 +558,7 @@ static void rc6_fence(int i915, const intel_ctx_t 
>> *ctx)
>>   igt_main
>>   {
>>       int i915 = -1;
>> +    unsigned int dirfd, gt;
>>       const intel_ctx_t *ctx;
> There is
> ctx = intel_ctx_create_all_physical(i915);
> in fixture. Please remove that as it is duplicate
>
> Thanks
> Riana

Fixed.

Thanks

Suja

>>       /* Use drm_open_driver to verify device existence */
>> @@ -572,11 +573,15 @@ igt_main
>>           igt_require_gem(i915);
>>           gem_quiescent_gpu(i915);
>>   -        for_each_ctx_engine(i915, ctx, e) {
>> -            if (e->instance == 0) {
>> -                igt_dynamic_f("%s", e->name)
>> -                    rc6_idle(i915, ctx->id, e->flags);
>> +        i915_for_each_gt(i915, dirfd, gt) {
>> +            ctx = intel_ctx_create_for_gt(i915, gt);
>> +            for_each_ctx_engine(i915, ctx, e) {
>> +                if (e->instance == 0) {
>> +                    igt_dynamic_f("gt%u-%s", gt, e->name)
>> +                        rc6_idle(i915, ctx->id, e->flags, gt);
>> +                }
>>               }
>> +            intel_ctx_destroy(i915, ctx);
>>           }
>>       }
>>   @@ -626,7 +631,6 @@ igt_main
>>       }
>>         igt_fixture {
>> -        intel_ctx_destroy(i915, ctx);
>>           drm_close_driver(i915);
>>       }
>>   }
