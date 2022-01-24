Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CC710E7CD
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 18:26:27 +0000 (UTC)
Message-ID: <4a76924a-43af-b8b8-6c76-c8c490230ba5@intel.com>
Date: Mon, 24 Jan 2022 10:26:20 -0800
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
References: <20220124144213.1900452-1-priyanka.dandamudi@intel.com>
 <dd9e60e7-127f-a5f0-5967-8d04c2abcbea@intel.com>
In-Reply-To: <dd9e60e7-127f-a5f0-5967-8d04c2abcbea@intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_hangman : Skips test
 for RCS/CCS on DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 1/24/2022 10:12, John Harrison wrote:
> On 1/24/2022 06:42, priyanka.dandamudi@intel.com wrote:
>> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>>
>> Updated code to skip for RCS/CCS engines on DG2 as the
>> platform cant handle shared reset domain.
> Is this based on running the test and seeing it fail? Or just thinking 
> that it is a problem?
>
> As per my update to this test in the internal tree, I do not see it 
> fail on the CCS engine only RCS. That also correlates with the nature 
> of the DG2 workaround - if you hang RCS then CCS cannot switch but if 
> you hang CCS then RCS can still switch quite happily. So if this test 
> is failing on CCS in upstream then we have a bug that needs to be fixed.
>
> John.
PS: Meant to add that making the skip is only a short term hack to get 
the CI results green. The correct fix is to update the test to be aware 
of the implications of the workaround. I.e. still run the hang test on 
all engines but, on DG2, expect more than one engine to be reset as 
appropriate to the workaround.

Lastly, just adding a continue to the loop is not the correct way to 
skip a test. That just makes the test vanish with no record that it is 
being skipped. You should use the igt_skip helper. That way, the test is 
still seen to exist can the skip can be tracked.

John.


>
>>
>> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
>> ---
>>   tests/i915/i915_hangman.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
>> index 23055c27..abbdaed5 100644
>> --- a/tests/i915/i915_hangman.c
>> +++ b/tests/i915/i915_hangman.c
>> @@ -445,6 +445,9 @@ static void do_tests(const char *name, const char 
>> *prefix,
>>       snprintf(buff, sizeof(buff), "%s-error-state-capture", prefix);
>>       igt_subtest_with_dynamic(buff) {
>>           for_each_ctx_engine(device, ctx, e) {
>> +            if (IS_DG2(intel_get_drm_devid(device)) &&
>> +                    (e->class == I915_ENGINE_CLASS_RENDER || 
>> e->class == I915_ENGINE_CLASS_COMPUTE))
>> +                                continue;
>>               igt_dynamic_f("%s", e->name)
>>                   test_error_state_capture(ctx, e);
>>           }
>> @@ -466,7 +469,10 @@ static void do_tests(const char *name, const 
>> char *prefix,
>>           igt_require(has_gpu_reset > 1);
>>             for_each_ctx_engine(device, ctx, e) {
>> -            igt_dynamic_f("%s", e->name)
>> +            if (IS_DG2(intel_get_drm_devid(device)) &&
>> +                    (e->class == I915_ENGINE_CLASS_RENDER || 
>> e->class == I915_ENGINE_CLASS_COMPUTE))
>> +                continue;
>> +                igt_dynamic_f("%s", e->name)
>>                   test_engine_hang(ctx, e, 0);
>>           }
>>       }
>> @@ -486,6 +492,9 @@ static void do_tests(const char *name, const char 
>> *prefix,
>>           igt_require(has_gpu_reset > 1);
>>             for_each_ctx_engine(device, ctx, e) {
>> +            if (IS_DG2(intel_get_drm_devid(device)) &&
>> +                    (e->class == I915_ENGINE_CLASS_RENDER || 
>> e->class == I915_ENGINE_CLASS_COMPUTE))
>> +                continue;
>>               igt_dynamic_f("%s", e->name)
>>                   test_engine_hang(ctx, e, IGT_SPIN_INVALID_CS);
>>           }
>
