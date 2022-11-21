Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6C410E02A
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 06:19:20 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, ramadevi.gandi@intel.com,
 ashutosh.dixit@intel.com, igt-dev@lists.freedesktop.org
Date: Mon, 21 Nov 2022 11:49:12 +0530
Message-Id: <20221121061916.3571789-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Revert of "Backport upstream context
 mutation changes-12"
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

This Patch reverts "Backport upstream context mutation changes-12" commit 165255fe7114555ade01580e464c4e637e1e3b28
to address BUGS: VLK-35521, VLK-35522.

The above bugs report igt@gem_ctx_param@(vm|invalid-get-engines) - fail - Failed assertion: err == -22, error: 0 != -22)
and igt@gem_ctx_engines@invalid-engines - fail - Failed assertion: __set_param_fresh_context(i915, param) == -22, error: 0 != -22

With revert of the patch, the above tests getting passed.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
baseline: f5cc3abb3d99e9ab5da2285b184e045da95c35a2
pile-commit: 86001f48c6e1b3afb251e04a08382e7ea599d735
range-diff:
  -:  --------- >  94:  d5372873f Revert "tests/i915/gem_ctx_engines: Fix the invalid subtest for the new rules"
  -:  --------- >  95:  69d98072e Revert "tests/i915/gem_ctx_param: Add a couple invalid PARAM_VM cases"
  -:  --------- >  96:  804bd3437 Revert "tests/i915/gem_ctx_param: Add tests for recently removed params"
 94:  51bd6800e !  97:  beb3f4a51 Revert "lib/i915: Rework engine API availability checks (v4)"
549:  d678bbc18 ! 552:  5e5b477be INTEL_DII:tests/i915/gem_ctx_engines: Adding 256 engines support.
760:  63c6402f0 ! 763:  6daa8fbe3 tests/i915: Drop has_context_engines check

 series                                             |   3 +
 ...i915-Rework-engine-API-availability-check.patch |  15 +-
 ...ests-i915-gem_ctx_engines-Adding-256-engi.patch |  46 ++---
 ...tests-i915-Drop-has_context_engines-check.patch |  15 +-
 ...s-i915-gem_ctx_engines-Fix-the-invalid-su.patch | 188 +++++++++++++++++++++
 ...s-i915-gem_ctx_param-Add-a-couple-invalid.patch |  40 +++++
 ...s-i915-gem_ctx_param-Add-tests-for-recent.patch |  72 ++++++++
 7 files changed, 336 insertions(+), 43 deletions(-)

diff --git a/series b/series
index 64da7161c..a98e741f7 100644
--- a/series
+++ b/series
@@ -93,6 +93,9 @@
 0001-Revert-Revert-test-i915-gem_exec_reloc-Restore-inter.patch
 0001-Revert-tests-gem_exec_schedule-Use-store_dword_plug-.patch
 0001-Revert-i915-Improve-the-precision-of-command-parser-.patch
+0001-Revert-tests-i915-gem_ctx_engines-Fix-the-invalid-su.patch
+0001-Revert-tests-i915-gem_ctx_param-Add-a-couple-invalid.patch
+0001-Revert-tests-i915-gem_ctx_param-Add-tests-for-recent.patch
 0001-Revert-lib-i915-Rework-engine-API-availability-check.patch
 0001-Revert-igt-dummyload-Require-an-intel_ctx_t-for-POLL.patch
 0001-Revert-lib-i915-gem_engine_topology-Delete-the-old-p.patch
diff --git a/0001-Revert-lib-i915-Rework-engine-API-availability-check.patch b/0001-Revert-lib-i915-Rework-engine-API-availability-check.patch
index acf9c468c..16b80accb 100644
--- a/0001-Revert-lib-i915-Rework-engine-API-availability-check.patch
+++ b/0001-Revert-lib-i915-Rework-engine-API-availability-check.patch
@@ -8,10 +8,10 @@ This reverts commit 3eae7848c89161d1cc66c88c90bc558e56df691b.
  lib/i915/gem_context.c         |  7 +++---
  lib/i915/gem_engine_topology.c | 40 +++++++++++++++++++++++++++++-----
  lib/i915/gem_engine_topology.h |  2 ++
- tests/i915/gem_ctx_engines.c   | 10 ++++++++-
+ tests/i915/gem_ctx_engines.c   | 11 +++++++++-
  tests/i915/gem_exec_balancer.c | 11 +++++++++-
  tests/i915/gem_exec_schedule.c | 11 +++++++++-
- 6 files changed, 68 insertions(+), 13 deletions(-)
+ 6 files changed, 69 insertions(+), 13 deletions(-)
 
 diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
 --- a/lib/i915/gem_context.c
@@ -120,10 +120,10 @@ diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
 diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
 --- a/tests/i915/gem_ctx_engines.c
 +++ b/tests/i915/gem_ctx_engines.c
-@@ -59,6 +59,14 @@ __set_param_fresh_context(int i915, struct drm_i915_gem_context_param param)
+@@ -47,6 +47,15 @@
+ #define engine_class(e, n) ((e)->engines[(n)].engine_class)
+ #define engine_instance(e, n) ((e)->engines[(n)].engine_instance)
  
- 	return err;
- }
 +static bool has_context_engines(int i915)
 +{
 +	struct drm_i915_gem_context_param param = {
@@ -132,10 +132,11 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
 +	};
 +	return __gem_context_set_param(i915, &param) == 0;
 +}
- 
++
  static void invalid_engines(int i915)
  {
-@@ -579,7 +587,7 @@ igt_main
+ 	struct i915_context_param_engines stack = {}, *engines;
+@@ -551,7 +560,7 @@ igt_main
  		igt_require_gem(i915);
  
  		gem_require_contexts(i915);
diff --git a/0001-INTEL_DII-tests-i915-gem_ctx_engines-Adding-256-engi.patch b/0001-INTEL_DII-tests-i915-gem_ctx_engines-Adding-256-engi.patch
index b75795ba9..91ac1f388 100644
--- a/0001-INTEL_DII-tests-i915-gem_ctx_engines-Adding-256-engi.patch
+++ b/0001-INTEL_DII-tests-i915-gem_ctx_engines-Adding-256-engi.patch
@@ -14,9 +14,6 @@ back to Legacy of 64 engine I915_EXEC_RING_MASK.
 
 v2: Change some variables to u64 in preparation of PRELIM uapi (Ashutosh)
 
-v3: Replacing I915_EXEC_RING_MASK with PRELIM_I915_EXEC_ENGINE_MASK due
-to DII changes (Arjun)
-
 Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
 Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
 Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
@@ -24,9 +21,9 @@ Reviewed-by: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
 ---
  lib/i915/gem_engine_topology.c | 18 +++++++++++++
  lib/i915/gem_engine_topology.h |  2 ++
- lib/igt_dummyload.c            | 40 +++++++++++++++++++++++++---
- tests/i915/gem_ctx_engines.c   | 48 +++++++++++++++++++++-------------
- 4 files changed, 86 insertions(+), 22 deletions(-)
+ lib/igt_dummyload.c            | 40 ++++++++++++++++++++++++++---
+ tests/i915/gem_ctx_engines.c   | 46 +++++++++++++++++++++-------------
+ 4 files changed, 85 insertions(+), 21 deletions(-)
 
 diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
 --- a/lib/i915/gem_engine_topology.c
@@ -166,16 +163,7 @@ diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
 diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
 --- a/tests/i915/gem_ctx_engines.c
 +++ b/tests/i915/gem_ctx_engines.c
-@@ -91,7 +91,7 @@ static void invalid_engines(int i915)
- 	param.size = sizeof(stack) + 1;
- 	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
- 
--	param.size = sizeof(*engines) + (I915_EXEC_RING_MASK + 2) * sizeof(*engines->engines);
-+	param.size = sizeof(*engines) + (PRELIM_I915_EXEC_ENGINE_MASK + 2) * sizeof(*engines->engines);
- 	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
- 
- 	/* Create a single page surrounded by inaccessible nothingness */
-@@ -237,10 +237,11 @@ static uint32_t batch_busy(uint32_t busy)
+@@ -210,10 +210,11 @@ static uint32_t batch_busy(uint32_t busy)
  static void none(int i915)
  {
  	struct i915_context_param_engines engines = {};
@@ -188,7 +176,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  		.size = sizeof(engines),
  	};
  
-@@ -257,7 +258,7 @@ static void none(int i915)
+@@ -230,7 +231,7 @@ static void none(int i915)
  		};
  
  		for (execbuf.flags = 0;
@@ -197,7 +185,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  		     execbuf.flags++)
  			igt_assert_eq(__gem_execbuf(i915, &execbuf), -EINVAL);
  
-@@ -269,6 +270,9 @@ static void none(int i915)
+@@ -242,6 +243,9 @@ static void none(int i915)
  
  static void execute_one(int i915)
  {
@@ -207,7 +195,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  	struct drm_i915_gem_exec_object2 obj = {
  		.handle = gem_create(i915, 4096),
  	};
-@@ -289,7 +293,7 @@ static void execute_one(int i915)
+@@ -262,7 +266,7 @@ static void execute_one(int i915)
  
  		igt_debug("Testing [%s...]\n", e->name);
  
@@ -216,7 +204,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  			intel_ctx_cfg_t cfg = {};
  			const intel_ctx_t *ctx;
  			igt_spin_t *spin;
-@@ -318,11 +322,11 @@ static void execute_one(int i915)
+@@ -291,11 +295,11 @@ static void execute_one(int i915)
  			ctx = intel_ctx_create(i915, &cfg);
  			execbuf.rsvd2 = spin->execbuf.rsvd2 >> 32;
  
@@ -230,7 +218,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  				igt_assert_f(__gem_execbuf(i915, &execbuf) == expected,
  					     "Failed to report the %s engine for slot %d (valid at %d)\n",
  					     j == i ? "valid" : "invalid", j, i);
-@@ -346,10 +350,11 @@ static void execute_one(int i915)
+@@ -319,10 +323,11 @@ static void execute_one(int i915)
  
  static void execute_oneforall(int i915)
  {
@@ -244,7 +232,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  		.size = sizeof(engines),
  	};
  	const struct intel_execution_engine2 *e;
-@@ -358,13 +363,13 @@ static void execute_oneforall(int i915)
+@@ -331,13 +336,13 @@ static void execute_oneforall(int i915)
  		param.ctx_id = gem_context_create(i915);
  
  		memset(&engines, 0, sizeof(engines));
@@ -260,7 +248,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  			struct drm_i915_gem_busy busy = {};
  			igt_spin_t *spin;
  
-@@ -385,7 +390,8 @@ static void execute_oneforall(int i915)
+@@ -358,7 +363,8 @@ static void execute_oneforall(int i915)
  
  static void execute_allforone(int i915)
  {
@@ -270,7 +258,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  	struct drm_i915_gem_context_param param = {
  		.ctx_id = gem_context_create(i915),
  		.param = I915_CONTEXT_PARAM_ENGINES,
-@@ -448,11 +454,14 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
+@@ -421,11 +427,14 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
  #define RCS_TIMESTAMP (mmio_base + 0x358)
  	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
  	unsigned int mmio_base = gem_engine_mmio_base(i915, e->name);
@@ -287,7 +275,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  		.size = sizeof(engines),
  	};
  	struct drm_i915_gem_exec_object2 results = {
-@@ -479,7 +488,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
+@@ -452,7 +461,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
  	}
  
  	memset(&engines, 0, sizeof(engines));
@@ -296,7 +284,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  		engine_class(&engines, i) = e->class;
  		engine_instance(&engines, i) = e->instance;
  	}
-@@ -490,7 +499,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
+@@ -463,7 +472,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
  	gem_set_domain(i915, results.handle,
  		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
  
@@ -305,7 +293,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  		struct drm_i915_gem_exec_object2 obj[2] = {
  			results, /* write hazard lies! */
  			{ .handle = gem_create(i915, 4096) },
-@@ -500,7 +509,9 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
+@@ -473,7 +482,9 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
  			.buffer_count = 2,
  			.rsvd1 = param.ctx_id,
  			.rsvd2 = sw_sync_timeline_create_fence(timeline, i + 1),
@@ -316,7 +304,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  		};
  		uint64_t offset = results.offset + 4 * i;
  		uint32_t *cs;
-@@ -525,7 +536,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
+@@ -498,7 +509,7 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
  	}
  
  	last = read_result(timeline, map, 0);
@@ -325,7 +313,7 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
  		uint32_t t = read_result(timeline, map, i);
  		igt_assert_f(t - last > 0,
  			     "Engine instance [%d] executed too late, previous timestamp %08x, now %08x\n",
-@@ -544,12 +555,13 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
+@@ -517,12 +528,13 @@ static void independent(int i915, const intel_ctx_t *base_ctx,
  static void independent_all(int i915, const intel_ctx_t *ctx)
  {
  	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
diff --git a/0001-tests-i915-Drop-has_context_engines-check.patch b/0001-tests-i915-Drop-has_context_engines-check.patch
index 9332916e7..e20664c0a 100644
--- a/0001-tests-i915-Drop-has_context_engines-check.patch
+++ b/0001-tests-i915-Drop-has_context_engines-check.patch
@@ -9,10 +9,10 @@ check is not needed. Remove this.
 Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
 ---
  lib/i915/gem_engine_topology.c |  7 ++-----
- tests/i915/gem_ctx_engines.c   | 10 +---------
+ tests/i915/gem_ctx_engines.c   | 11 +----------
  tests/i915/gem_exec_balancer.c | 11 +----------
  tests/i915/gem_exec_schedule.c | 12 +-----------
- 4 files changed, 5 insertions(+), 35 deletions(-)
+ 4 files changed, 5 insertions(+), 36 deletions(-)
 
 diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
 --- a/lib/i915/gem_engine_topology.c
@@ -34,10 +34,10 @@ diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
 diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
 --- a/tests/i915/gem_ctx_engines.c
 +++ b/tests/i915/gem_ctx_engines.c
-@@ -59,14 +59,6 @@ __set_param_fresh_context(int i915, struct drm_i915_gem_context_param param)
+@@ -47,15 +47,6 @@
+ #define engine_class(e, n) ((e)->engines[(n)].engine_class)
+ #define engine_instance(e, n) ((e)->engines[(n)].engine_instance)
  
- 	return err;
- }
 -static bool has_context_engines(int i915)
 -{
 -	struct drm_i915_gem_context_param param = {
@@ -46,10 +46,11 @@ diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
 -	};
 -	return __gem_context_set_param(i915, &param) == 0;
 -}
- 
+-
  static void invalid_engines(int i915)
  {
-@@ -636,7 +628,7 @@ igt_main
+ 	struct i915_context_param_engines stack = {}, *engines;
+@@ -609,7 +600,7 @@ igt_main
  		igt_require_gem(i915);
  
  		gem_require_contexts(i915);
diff --git a/0001-Revert-tests-i915-gem_ctx_engines-Fix-the-invalid-su.patch b/0001-Revert-tests-i915-gem_ctx_engines-Fix-the-invalid-su.patch
new file mode 100644
index 000000000..9454cc3e2
--- /dev/null
+++ b/0001-Revert-tests-i915-gem_ctx_engines-Fix-the-invalid-su.patch
@@ -0,0 +1,188 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
+Date: Mon, 21 Nov 2022 09:28:04 +0530
+Subject: [PATCH] Revert "tests/i915/gem_ctx_engines: Fix the invalid subtest
+ for the new rules"
+
+This reverts commit 99d863de8b7bb687daee9d7edd59c4b17419e8d1.
+---
+ tests/i915/gem_ctx_engines.c | 88 ++++++++++++------------------------
+ 1 file changed, 30 insertions(+), 58 deletions(-)
+
+diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
+--- a/tests/i915/gem_ctx_engines.c
++++ b/tests/i915/gem_ctx_engines.c
+@@ -47,44 +47,31 @@
+ #define engine_class(e, n) ((e)->engines[(n)].engine_class)
+ #define engine_instance(e, n) ((e)->engines[(n)].engine_instance)
+ 
+-static int
+-__set_param_fresh_context(int i915, struct drm_i915_gem_context_param param)
+-{
+-	int err;
+-
+-	igt_assert_eq(param.ctx_id, 0);
+-	param.ctx_id = gem_context_create(i915);
+-	err = __gem_context_set_param(i915, &param);
+-	gem_context_destroy(i915, param.ctx_id);
+-
+-	return err;
+-}
+-
+ static void invalid_engines(int i915)
+ {
+ 	struct i915_context_param_engines stack = {}, *engines;
+ 	struct drm_i915_gem_context_param param = {
++		.ctx_id = gem_context_create(i915),
+ 		.param = I915_CONTEXT_PARAM_ENGINES,
+ 		.value = to_user_pointer(&stack),
+ 	};
+ 	uint32_t handle;
+-	igt_spin_t *spin;
+ 	void *ptr;
+ 
+ 	param.size = 0;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
++	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+ 
+ 	param.size = 1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+ 
+ 	param.size = sizeof(stack) - 1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+ 
+ 	param.size = sizeof(stack) + 1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+ 
+-	param.size = sizeof(*engines) + (I915_EXEC_RING_MASK + 2) * sizeof(*engines->engines);
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
++	param.size = 0;
++	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+ 
+ 	/* Create a single page surrounded by inaccessible nothingness */
+ 	ptr = mmap(NULL, 3 * 4096, PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
+@@ -98,57 +85,57 @@ static void invalid_engines(int i915)
+ 	param.value = to_user_pointer(engines);
+ 
+ 	engines->engines[0].engine_class = -1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -ENOENT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -ENOENT);
+ 
+ 	mprotect(engines, 4096, PROT_READ);
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -ENOENT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -ENOENT);
+ 
+ 	mprotect(engines, 4096, PROT_WRITE);
+ 	engines->engines[0].engine_class = 0;
+-	if (__set_param_fresh_context(i915, param)) /* XXX needs RCS */
++	if (__gem_context_set_param(i915, &param)) /* XXX needs RCS */
+ 		goto out;
+ 
+ 	engines->extensions = to_user_pointer(ptr);
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	engines->extensions = 0;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
++	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+ 
+ 	param.value = to_user_pointer(engines - 1);
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines) - 1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines) - param.size +  1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines) + 4096;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines) - param.size + 4096;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
++	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+ 
+ 	param.value = to_user_pointer(engines) - param.size + 4096 + 1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines) + 4096;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines) + 4096 - 1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines) - 1;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines - 1);
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines - 1) + 4096;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(engines - 1) + 4096 - sizeof(*engines->engines) / 2;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	handle = gem_create(i915, 4096 * 3);
+ 	ptr = gem_mmap__device_coherent(i915, handle, 0, 4096 * 3, PROT_READ);
+@@ -158,40 +145,25 @@ static void invalid_engines(int i915)
+ 	munmap(ptr + 8192, 4096);
+ 
+ 	param.value = to_user_pointer(ptr + 4096);
+-	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
++	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+ 
+ 	param.value = to_user_pointer(ptr);
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(ptr) + 4095;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(ptr) + 8192;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	param.value = to_user_pointer(ptr) + 12287;
+-	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
++	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+ 
+ 	munmap(ptr + 4096, 4096);
+ 
+-	/* Reset back to a known-good param struct */
+-	param.size = sizeof(*engines) + sizeof(*engines->engines);
+-	param.value = to_user_pointer(engines);
+-	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
+-
+-	/* Test that we can't set engines after we've done an execbuf */
+-	param.ctx_id = gem_context_create(i915);
+-	spin = igt_spin_new(i915, .ctx_id = param.ctx_id);
+-	igt_spin_free(i915, spin);
+-	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+-	gem_context_destroy(i915, param.ctx_id);
+-
+-	/* Test that we can't set engines on ctx0 */
+-	param.ctx_id = 0;
+-	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+-
+ out:
+ 	munmap(engines, 4096);
++	gem_context_destroy(i915, param.ctx_id);
+ }
+ 
+ static uint32_t batch_create(int i915)
diff --git a/0001-Revert-tests-i915-gem_ctx_param-Add-a-couple-invalid.patch b/0001-Revert-tests-i915-gem_ctx_param-Add-a-couple-invalid.patch
new file mode 100644
index 000000000..591ad1cae
--- /dev/null
+++ b/0001-Revert-tests-i915-gem_ctx_param-Add-a-couple-invalid.patch
@@ -0,0 +1,40 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
+Date: Mon, 21 Nov 2022 09:33:13 +0530
+Subject: [PATCH] Revert "tests/i915/gem_ctx_param: Add a couple invalid
+ PARAM_VM cases"
+
+This reverts commit 9c59d4bd0d18b336d0b15e6dea0210e43768b96c.
+---
+ tests/i915/gem_ctx_param.c | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
+--- a/tests/i915/gem_ctx_param.c
++++ b/tests/i915/gem_ctx_param.c
+@@ -182,25 +182,6 @@ static void test_vm(int i915)
+ 	gem_context_destroy(i915, arg.ctx_id);
+ 	igt_require(err == -ENOENT);
+ 
+-	/* Test that we can't set the VM on ctx0 */
+-	arg.ctx_id = 0;
+-	arg.value = gem_vm_create(i915);
+-	err = __gem_context_set_param(i915, &arg);
+-	gem_vm_destroy(i915, arg.value);
+-	igt_assert_eq(err, -EINVAL);
+-
+-	/* Test that we can't set the VM after we've done an execbuf */
+-	arg.ctx_id = gem_context_create(i915);
+-	ahnd = get_reloc_ahnd(i915, arg.ctx_id);
+-	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx_id = arg.ctx_id);
+-	igt_spin_free(i915, spin);
+-	put_ahnd(ahnd);
+-	arg.value = gem_vm_create(i915);
+-	err = __gem_context_set_param(i915, &arg);
+-	gem_context_destroy(i915, arg.ctx_id);
+-	gem_vm_destroy(i915, arg.value);
+-	igt_assert_eq(err, -EINVAL);
+-
+ 	parent = gem_context_create(i915);
+ 	child = gem_context_create(i915);
+ 
diff --git a/0001-Revert-tests-i915-gem_ctx_param-Add-tests-for-recent.patch b/0001-Revert-tests-i915-gem_ctx_param-Add-tests-for-recent.patch
new file mode 100644
index 000000000..b00da9b0e
--- /dev/null
+++ b/0001-Revert-tests-i915-gem_ctx_param-Add-tests-for-recent.patch
@@ -0,0 +1,72 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
+Date: Mon, 21 Nov 2022 09:35:23 +0530
+Subject: [PATCH] Revert "tests/i915/gem_ctx_param: Add tests for recently
+ removed params"
+
+This reverts commit 3e70bbfb8af91396baaff5091791fdeee8526072.
+---
+ tests/i915/gem_ctx_param.c | 44 --------------------------------------
+ 1 file changed, 44 deletions(-)
+
+diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
+--- a/tests/i915/gem_ctx_param.c
++++ b/tests/i915/gem_ctx_param.c
+@@ -247,35 +247,6 @@ static void test_vm(int i915)
+ 	put_ahnd(ahnd);
+ }
+ 
+-static void test_set_invalid_param(int fd, uint64_t param, uint64_t value)
+-{
+-	/* Create a fresh context */
+-	struct drm_i915_gem_context_param arg = {
+-		.ctx_id = gem_context_create(fd),
+-		.param = param,
+-		.value = value,
+-	};
+-	int err;
+-
+-	err = __gem_context_set_param(fd, &arg);
+-	gem_context_destroy(fd, arg.ctx_id);
+-	igt_assert_eq(err, -EINVAL);
+-}
+-
+-static void test_get_invalid_param(int fd, uint64_t param)
+-{
+-	/* Create a fresh context */
+-	struct drm_i915_gem_context_param arg = {
+-		.ctx_id = gem_context_create(fd),
+-		.param = param,
+-	};
+-	int err;
+-
+-	err = __gem_context_get_param(fd, &arg);
+-	gem_context_destroy(fd, arg.ctx_id);
+-	igt_assert_eq(err, -EINVAL);
+-}
+-
+ igt_main
+ {
+ 	struct drm_i915_gem_context_param arg;
+@@ -438,21 +409,6 @@ igt_main
+ 		igt_assert_eq(__gem_context_set_param(fd, &arg), -EINVAL);
+ 	}
+ 
+-	igt_subtest("invalid-set-ringsize")
+-		test_set_invalid_param(fd, I915_CONTEXT_PARAM_RINGSIZE, 8192);
+-
+-	igt_subtest("invalid-get-ringsize")
+-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_RINGSIZE);
+-
+-	igt_subtest("invalid-set-no-zeromap")
+-		test_set_invalid_param(fd, I915_CONTEXT_PARAM_NO_ZEROMAP, 1);
+-
+-	igt_subtest("invalid-get-no-zeromap")
+-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_NO_ZEROMAP);
+-
+-	igt_subtest("invalid-get-engines")
+-		test_get_invalid_param(fd, I915_CONTEXT_PARAM_ENGINES);
+-
+ 	igt_fixture
+ 		close(fd);
+ }
--
git-pile 0.99-dev
