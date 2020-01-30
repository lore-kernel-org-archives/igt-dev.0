Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200130204124.29907-1-tvrtko.ursulin@linux.intel.com>
 <158041727856.18112.4906224695590570854@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <f12e30f0-a287-f821-4bc4-c7545e9821b6@linux.intel.com>
Date: Thu, 30 Jan 2020 20:56:23 +0000
MIME-Version: 1.0
In-Reply-To: <158041727856.18112.4906224695590570854@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t]
 tests/i915/gem_ctx_persistence: Convert engine subtests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 30/01/2020 20:47, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-01-30 20:41:24)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Converts all per-engine tests into dynamic subtests and in the process:
>>
>>   * Put back I915_EXEC_BSD legacy coverage.
>>   * Remove one added static engine list usage.
>>   * Compact code by driving two groups of the name/func table.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> ---
>>   tests/i915/gem_ctx_persistence.c | 97 +++++++++++++-------------------
>>   1 file changed, 39 insertions(+), 58 deletions(-)
>>
>> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
>> index 8b9633b214ff..0d5b22d2b162 100644
>> --- a/tests/i915/gem_ctx_persistence.c
>> +++ b/tests/i915/gem_ctx_persistence.c
>> @@ -759,7 +759,20 @@ static void smoketest(int i915)
>>   
>>   igt_main
>>   {
>> -       const struct intel_execution_engine2 *e;
>> +       struct {
>> +               const char *name;
>> +               void (*func)(int fd, unsigned int engine);
>> +       } *test, tests[] = {
>> +               { "persistence", test_persistence },
>> +               { "cleanup", test_nonpersistent_cleanup },
>> +               { "queued", test_nonpersistent_queued },
>> +               { "mixed", test_nonpersistent_mixed },
>> +               { "mixed-process", test_process_mixed },
>> +               { "hostile", test_nonpersistent_hostile },
>> +               { "hostile-preempt", test_nonpersistent_hostile_preempt },
>> +               { "hang", test_nonpersistent_hang },
>> +               { NULL, NULL },
> 
> Heh, that's what I was tempted to suggest but did want to seem like I
> was requesting too much :)

Yeah, much less typing, especially with dynamic subtests.

> 
>> +       };
>>          int i915;
>>   
>>          igt_fixture {
>> @@ -792,72 +805,40 @@ igt_main
>>          igt_subtest("hang")
>>                  test_nohangcheck_hang(i915);
>>   
>> -       __for_each_static_engine(e) {
>> -               igt_subtest_group {
>> -                       igt_fixture {
>> -                               gem_require_ring(i915, e->flags);
>> -                               gem_require_contexts(i915);
>> -                       }
>> -
>> -                       igt_subtest_f("legacy-%s-persistence", e->name)
>> -                               test_persistence(i915, e->flags);
>> -
>> -                       igt_subtest_f("legacy-%s-cleanup", e->name)
>> -                               test_nonpersistent_cleanup(i915, e->flags);
>> -
>> -                       igt_subtest_f("legacy-%s-queued", e->name)
>> -                               test_nonpersistent_queued(i915, e->flags);
>> -
>> -                       igt_subtest_f("legacy-%s-mixed", e->name)
>> -                               test_nonpersistent_mixed(i915, e->flags);
>> -
>> -                       igt_subtest_f("legacy-%s-mixed-process", e->name)
>> -                               test_process_mixed(i915, e->flags);
>> -
>> -                       igt_subtest_f("legacy-%s-hostile", e->name)
>> -                               test_nonpersistent_hostile(i915, e->flags);
>> +       igt_subtest("smoketest")
>> +               smoketest(i915);
>>   
>> -                       igt_subtest_f("legacy-%s-hostile-preempt", e->name)
>> -                               test_nonpersistent_hostile_preempt(i915,
>> -                                                                  e->flags);
>> +       igt_subtest_group {
>> +               igt_fixture
>> +                       gem_require_contexts(i915);
>> +
>> +               for (test = tests; test->name; test++) {
>> +                       igt_subtest_with_dynamic_f("legacy-engines-%s",
>> +                                                  test->name) {
>> +                               for_each_engine(e, i915) {
> 
> Don't we need a
>    if (!gem_has_ring(i915, eb_ring(e)) continue;
> here?

It's built in to for_each_engine, yay for dynamic subtests! :)

> 
>> +                                       igt_dynamic_f("%s", e->name)
>> +                                               test->func(i915, eb_ring(e));
>> +                               }
>> +                       }
>>                  }
>>          }
>>   
>> -        __for_each_physical_engine(i915, e) {
>> -                igt_subtest_group {
>> -                        igt_fixture
>> -                                gem_require_contexts(i915);
>> -
>> -                       igt_subtest_f("%s-persistence", e->name)
>> -                               test_persistence(i915, e->flags);
>> -
>> -                       igt_subtest_f("%s-cleanup", e->name)
>> -                               test_nonpersistent_cleanup(i915, e->flags);
>> -
>> -                       igt_subtest_f("%s-queued", e->name)
>> -                               test_nonpersistent_queued(i915, e->flags);
>> -
>> -                       igt_subtest_f("%s-mixed", e->name)
>> -                               test_nonpersistent_mixed(i915, e->flags);
>> -
>> -                       igt_subtest_f("%s-mixed-process", e->name)
>> -                               test_process_mixed(i915, e->flags);
>> +       igt_subtest_group {
>> +               const struct intel_execution_engine2 *e;
>>   
>> -                       igt_subtest_f("%s-hostile", e->name)
>> -                               test_nonpersistent_hostile(i915, e->flags);
>> +               igt_fixture
>> +                       gem_require_contexts(i915);
>>   
>> -                       igt_subtest_f("%s-hostile-preempt", e->name)
>> -                               test_nonpersistent_hostile_preempt(i915,
>> -                                                                  e->flags);
>> -
>> -                       igt_subtest_f("%s-hang", e->name)
>> -                               test_nonpersistent_hang(i915, e->flags);
>> +               for (test = tests; test->name; test++) {
>> +                       igt_subtest_with_dynamic_f("engines-%s", test->name) {
>> +                               __for_each_physical_engine(i915, e) {
>> +                                       igt_dynamic_f("%s", e->name)
>> +                                               test->func(i915, e->flags);
>> +                               }
>> +                       }
>>                  }
> 
> Then I had a plan to add the pathological engines[] here.

Will see later what you exactly mean.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
