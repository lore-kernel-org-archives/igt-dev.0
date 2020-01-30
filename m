Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA386E7DD
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 10:52:30 +0000 (UTC)
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20200129181002.9405-1-krishnaiah.bommu@intel.com>
 <20200129181002.9405-2-krishnaiah.bommu@intel.com>
 <158033216228.13511.16715726772665260638@skylake-alporthouse-com>
 <8454bc4b-d07a-07bd-a8e8-bd15795de282@linux.intel.com>
Message-ID: <72a7ea9a-e3f9-1164-1b93-432f71cb9398@linux.intel.com>
Date: Thu, 30 Jan 2020 10:52:26 +0000
MIME-Version: 1.0
In-Reply-To: <8454bc4b-d07a-07bd-a8e8-bd15795de282@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/1] tests/i915/gem_ctx_persistence:
 Set context with supported engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Bommu Krishnaiah <krishnaiah.bommu@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 30/01/2020 10:31, Tvrtko Ursulin wrote:
> 
> On 29/01/2020 21:09, Chris Wilson wrote:
>> Quoting Bommu Krishnaiah (2020-01-29 18:10:02)
>>> Update the context with supported engines on the platform with set_property
>>> I915_CONTEXT_PARAM_ENGINES to make sure the work load is submitted to
>>> the available engines only.
>>>
>>> v2: addressed the review comments.
>>> v3: addressed v2 review comments.
>>> V4: Re-introduced the gem_context_set_all_engines() API,test_process_mixed()
>>> test creating new forked process, to set engine map to new forked process
>>> I added gem_context_set_all_engines() API.
>>> v5: addressed v4 review comments.
>>> v6: addressed chris comments.
>>
>> This is totally useless as a recording of the history. Explain why you
>> had to make the changes, for posterity.
>>
>>> -       __for_each_static_engine(e) {
>>> +       for_each_engine(e, i915) {
>>
>> Incorrect change that leads to compiler warnings and prevents the legacy
>> tests being listed by CI.
>>
>> I've given up and fixed it.

Where's your version Chris?

Krish please try the below. Hang subtest fails for me and destroys most
of the following subtests but I am not sure what kernel I have deployed
where I tested it.

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index de6f59251200..2e3f8509a3d7 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -758,7 +758,8 @@ static void smoketest(int i915)
 
 igt_main
 {
-       const struct intel_execution_engine2 *e;
+       const struct intel_execution_engine *e;
+       const struct intel_execution_engine2 *e2;
        int i915;
 
        igt_fixture {
@@ -791,68 +792,70 @@ igt_main
        igt_subtest("hang")
                test_nohangcheck_hang(i915);
 
-       for_each_engine(e, i915) {
+       for (e = intel_execution_engines; e->name; e++) {
+               unsigned int flags = eb_ring(e);
+
                igt_subtest_group {
                        igt_fixture {
-                               gem_require_ring(i915, e->flags);
+                               gem_require_ring(i915, flags);
                                gem_require_contexts(i915);
                        }
 
                        igt_subtest_f("legacy-%s-persistence", e->name)
-                               test_persistence(i915, e->flags);
+                               test_persistence(i915, flags);
 
                        igt_subtest_f("legacy-%s-cleanup", e->name)
-                               test_nonpersistent_cleanup(i915, e->flags);
+                               test_nonpersistent_cleanup(i915, flags);
 
                        igt_subtest_f("legacy-%s-queued", e->name)
-                               test_nonpersistent_queued(i915, e->flags);
+                               test_nonpersistent_queued(i915, flags);
 
                        igt_subtest_f("legacy-%s-mixed", e->name)
-                               test_nonpersistent_mixed(i915, e->flags);
+                               test_nonpersistent_mixed(i915, flags);
 
                        igt_subtest_f("legacy-%s-mixed-process", e->name)
-                               test_process_mixed(i915, e->flags);
+                               test_process_mixed(i915, flags);
 
                        igt_subtest_f("legacy-%s-hostile", e->name)
-                               test_nonpersistent_hostile(i915, e->flags);
+                               test_nonpersistent_hostile(i915, flags);
 
                        igt_subtest_f("legacy-%s-hostile-preempt", e->name)
                                test_nonpersistent_hostile_preempt(i915,
-                                                                  e->flags);
+                                                                  flags);
                }
        }
 
-        __for_each_physical_engine(i915, e) {
+        __for_each_physical_engine(i915, e2) {
                 igt_subtest_group {
                         igt_fixture {
-                                gem_require_ring(i915, e->flags);
+                                gem_require_ring(i915, e2->flags);
                                 gem_require_contexts(i915);
                         }
 
-                       igt_subtest_f("%s-persistence", e->name)
-                               test_persistence(i915, e->flags);
+                       igt_subtest_f("%s-persistence", e2->name)
+                               test_persistence(i915, e2->flags);
 
-                       igt_subtest_f("%s-cleanup", e->name)
-                               test_nonpersistent_cleanup(i915, e->flags);
+                       igt_subtest_f("%s-cleanup", e2->name)
+                               test_nonpersistent_cleanup(i915, e2->flags);
 
-                       igt_subtest_f("%s-queued", e->name)
-                               test_nonpersistent_queued(i915, e->flags);
+                       igt_subtest_f("%s-queued", e2->name)
+                               test_nonpersistent_queued(i915, e2->flags);
 
-                       igt_subtest_f("%s-mixed", e->name)
-                               test_nonpersistent_mixed(i915, e->flags);
+                       igt_subtest_f("%s-mixed", e2->name)
+                               test_nonpersistent_mixed(i915, e2->flags);
 
-                       igt_subtest_f("%s-mixed-process", e->name)
-                               test_process_mixed(i915, e->flags);
+                       igt_subtest_f("%s-mixed-process", e2->name)
+                               test_process_mixed(i915, e2->flags);
 
-                       igt_subtest_f("%s-hostile", e->name)
-                               test_nonpersistent_hostile(i915, e->flags);
+                       igt_subtest_f("%s-hostile", e2->name)
+                               test_nonpersistent_hostile(i915, e2->flags);
 
-                       igt_subtest_f("%s-hostile-preempt", e->name)
+                       igt_subtest_f("%s-hostile-preempt", e2->name)
                                test_nonpersistent_hostile_preempt(i915,
-                                                                  e->flags);
+                                                                  e2->flags);
 
-                       igt_subtest_f("%s-hang", e->name)
-                               test_nonpersistent_hang(i915, e->flags);
+                       igt_subtest_f("%s-hang", e2->name)
+                               test_nonpersistent_hang(i915, e2->flags);
                }
        }
 

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
