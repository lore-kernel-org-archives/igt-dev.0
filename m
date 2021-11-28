Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435F06EC00
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Nov 2021 07:18:26 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Sun, 28 Nov 2021 12:38:23 +0530
Message-Id: <20211128070823.1396652-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20211128070823.1396652-1-priyanka.dandamudi@intel.com>
References: <20211128070823.1396652-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/i915_hangman: Explicitly
 test per engine reset vs full GPU reset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Although the hangman test was ensuring that *some* reset functionality
was enabled, it did not differentiate what kind. So add in the
infrastructure required to choose between per engine reset or full GPU
reset and update the test to use it. Hangman will now check that it
can capture error logs when both forms of reset occur. It will also
ensure that the 'does per engine reset work' tests will only run if
per engine reset is avaiable.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 lib/igt_dummyload.c       |  80 +++++++++++++++++++----
 lib/igt_dummyload.h       |   4 ++
 lib/igt_gt.c              |  12 ++--
 lib/igt_gt.h              |   2 +-
 tests/i915/i915_hangman.c | 129 ++++++++++++++++++++++++++++++++++++--
 5 files changed, 203 insertions(+), 24 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 645db922..28ba6889 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -64,6 +64,11 @@
 
 #define MI_ARB_CHK (0x5 << 23)
 
+#define MI_BATCH_BUFFER_START_2ND_LEVEL		(1 << 22)
+#define MI_BATCH_BUFFER_START_PPGTT		(1 << 8)
+
+#define MI_COND_BATCH_BUFFER_END_CURRENT_LEVEL	(1 << 18)
+
 static const int BATCH_SIZE = 4096;
 static const int LOOP_START_OFFSET = 64;
 
@@ -96,16 +101,23 @@ emit_recursive_batch(igt_spin_t *spin,
 #define BATCH IGT_SPIN_BATCH
 	const unsigned int devid = intel_get_drm_devid(fd);
 	const unsigned int gen = intel_gen(devid);
-	struct drm_i915_gem_relocation_entry relocs[3], *r;
+	struct drm_i915_gem_relocation_entry relocs[4], *r;
 	struct drm_i915_gem_execbuffer2 *execbuf;
 	struct drm_i915_gem_exec_object2 *obj;
-	unsigned int flags[GEM_MAX_ENGINES];
+	uint64_t flags[GEM_MAX_ENGINES];
+	bool in_2nd_level = false;
 	unsigned int nengine;
 	int fence_fd = -1;
 	uint64_t addr, addr_scratch, ahnd = opts->ahnd, objflags = 0;
 	uint32_t *cs;
 	int i;
 
+	if (opts->flags & IGT_SPIN_STORE_WORD) {
+		igt_assert(!gem_engine_has_cmdparser(fd, &opts->ctx->cfg, opts->engine));
+		igt_assert(gen >= 12);
+		in_2nd_level = true;
+	}
+
 	/*
 	 * Pick a random location for our spinner et al.
 	 *
@@ -277,6 +289,43 @@ emit_recursive_batch(igt_spin_t *spin,
 		execbuf->buffer_count++;
 	}
 
+	/* 2nd level call to the loop */
+	if (opts->flags & IGT_SPIN_STORE_WORD) {
+		r = &relocs[obj[BATCH].relocation_count++];
+		r->presumed_offset = obj[BATCH].offset;
+		r->target_handle = obj[BATCH].handle;
+		r->offset = (cs + 1 - spin->batch) * sizeof(*cs);
+		r->read_domains = I915_GEM_DOMAIN_COMMAND;
+		r->delta = LOOP_START_OFFSET;
+
+		*cs++ = MI_BATCH_BUFFER_START |
+			MI_BATCH_BUFFER_START_2ND_LEVEL |
+			MI_BATCH_BUFFER_START_PPGTT | 1;
+		*cs++ = r->presumed_offset + r->delta;
+		*cs++ = r->presumed_offset >> 32;
+
+		obj[SCRATCH].handle = opts->store_object;
+		obj[SCRATCH].offset = addr;
+		obj[SCRATCH].flags |= EXEC_OBJECT_WRITE;
+
+		r = &relocs[obj[BATCH].relocation_count++];
+		r->target_handle = obj[SCRATCH].handle;
+		r->presumed_offset = obj[SCRATCH].offset;
+		r->offset = (cs + 1 - spin->batch) * sizeof(*cs);
+		r->delta = sizeof(uint32_t) * opts->store_offset;
+		r->read_domains = I915_GEM_DOMAIN_INSTRUCTION;
+		r->write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+		execbuf->buffer_count++;
+
+		*cs++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
+		*cs++ = r->presumed_offset + r->delta;
+		*cs++ = r->presumed_offset >> 32;
+		*cs++ = opts->store_value;
+
+		/* Really end the batch */
+		*cs++ = MI_BATCH_BUFFER_END;
+	}
+
 	spin->handle = obj[BATCH].handle;
 
 	igt_assert_lt(cs - spin->batch, LOOP_START_OFFSET / sizeof(*cs));
@@ -336,34 +385,38 @@ emit_recursive_batch(igt_spin_t *spin,
 		r->read_domains = I915_GEM_DOMAIN_COMMAND;
 		r->delta = (spin->condition - spin->batch) * sizeof(*cs);
 
-		*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
+		*cs++ = MI_COND_BATCH_BUFFER_END |
+			(in_2nd_level ? MI_COND_BATCH_BUFFER_END_CURRENT_LEVEL : 0) |
+			MI_DO_COMPARE | 2;
+
 		*cs++ = MI_BATCH_BUFFER_END;
 		*cs++ = r->presumed_offset + r->delta;
-		*cs++ = 0;
+		*cs++ = r->presumed_offset >> 32;
 	}
 
-	/* recurse */
+	/* recurse but staying in 2nd level */
 	r = &relocs[obj[BATCH].relocation_count++];
+	r->presumed_offset = obj[BATCH].offset;
 	r->target_handle = obj[BATCH].handle;
 	r->presumed_offset = obj[BATCH].offset;
 	r->offset = (cs + 1 - spin->batch) * sizeof(*cs);
 	r->read_domains = I915_GEM_DOMAIN_COMMAND;
 	r->delta = LOOP_START_OFFSET;
-
 	if (gen >= 8) {
-		*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
-		*cs++ = r->presumed_offset + r->delta;
-		*cs++ = (r->presumed_offset + r->delta) >> 32;
+		*cs++ = MI_BATCH_BUFFER_START |
+			(in_2nd_level ? MI_BATCH_BUFFER_START_2ND_LEVEL : 0) |
+			MI_BATCH_BUFFER_START_PPGTT | 1;
 	} else if (gen >= 6) {
-		*cs++ = MI_BATCH_BUFFER_START | 1 << 8;
-		*cs++ = r->presumed_offset + r->delta;
+		*cs++ = MI_BATCH_BUFFER_START |
+			MI_BATCH_BUFFER_START_PPGTT;
 	} else {
 		*cs++ = MI_BATCH_BUFFER_START | 2 << 6;
 		if (gen < 4)
 			r->delta |= 1;
-		*cs = r->presumed_offset + r->delta;
-		cs++;
+
 	}
+	*cs++ = r->presumed_offset + r->delta;
+	*cs++ = r->presumed_offset >> 32;
 	obj[BATCH].relocs_ptr = to_user_pointer(relocs);
 
 	execbuf->buffers_ptr =
@@ -411,6 +464,7 @@ emit_recursive_batch(igt_spin_t *spin,
 	}
 
 	igt_assert_lt(cs - spin->batch, BATCH_SIZE / sizeof(*cs));
+	igt_assert_lte(obj[BATCH].relocation_count, sizeof(relocs) / sizeof(*relocs));
 
 	/* Make it easier for callers to resubmit. */
 	for (i = 0; i < ARRAY_SIZE(spin->obj); i++) {
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index f0205261..98e8234b 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -80,6 +80,9 @@ typedef struct igt_spin_factory {
 	unsigned int engine;
 	unsigned int flags;
 	int fence;
+	uint32_t store_object;
+	uint32_t store_offset;
+	uint32_t store_value;
 	uint64_t ahnd;
 } igt_spin_factory_t;
 
@@ -92,6 +95,7 @@ typedef struct igt_spin_factory {
 #define IGT_SPIN_INVALID_CS    (1 << 6)
 #define IGT_SPIN_USERPTR       (1 << 7)
 #define IGT_SPIN_SOFTDEP       (1 << 8)
+#define IGT_SPIN_STORE_WORD    (1 << 9)
 
 igt_spin_t *
 __igt_spin_factory(int fd, const igt_spin_factory_t *opts);
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 7c7df95e..a5b2fe84 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -122,18 +122,18 @@ static void eat_error_state(int dev)
  * to be done under hang injection.
  * Default: false
  */
-void igt_require_hang_ring(int fd, int ring)
+void igt_require_hang_ring(int fd, uint32_t ctx, unsigned int ring)
 {
 	if (!igt_check_boolean_env_var("IGT_HANG", true))
 		igt_skip("hang injection disabled by user [IGT_HANG=0]\n");
 
-	gem_require_ring(fd, ring);
+	igt_require(gem_context_has_engine(fd, ctx, ring));
 	gem_context_require_bannable(fd);
 	if (!igt_check_boolean_env_var("IGT_HANG_WITHOUT_RESET", false))
 		igt_require(has_gpu_reset(fd));
 }
 
-static unsigned context_get_ban(int fd, unsigned ctx)
+static unsigned context_get_ban(int fd, uint32_t ctx)
 {
 	struct drm_i915_gem_context_param param = {
 		.ctx_id = ctx,
@@ -149,7 +149,7 @@ static unsigned context_get_ban(int fd, unsigned ctx)
 	return param.value;
 }
 
-static void context_set_ban(int fd, unsigned ctx, unsigned ban)
+static void context_set_ban(int fd, uint32_t ctx, unsigned ban)
 {
 	struct drm_i915_gem_context_param param = {
 		.ctx_id = ctx,
@@ -164,7 +164,7 @@ static void context_set_ban(int fd, unsigned ctx, unsigned ban)
 	}
 }
 
-igt_hang_t igt_allow_hang(int fd, unsigned ctx, unsigned flags)
+igt_hang_t igt_allow_hang(int fd, uint32_t ctx, unsigned flags)
 {
 	struct drm_i915_gem_context_param param = {
 		.ctx_id = ctx,
@@ -290,7 +290,7 @@ static igt_hang_t __igt_hang_ctx(int fd, uint64_t ahnd, uint32_t ctx, int ring,
 	igt_spin_t *spin;
 	unsigned ban;
 
-	igt_require_hang_ring(fd, ring);
+	igt_require_hang_ring(fd, ctx, ring);
 
 	/* check if non-default ctx submission is allowed */
 	igt_require(ctx == 0 || has_ctx_exec(fd, ring, ctx));
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index c5059817..5ff02967 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -31,7 +31,7 @@
 #include "i915/i915_drm_local.h"
 #include "i915_drm.h"
 
-void igt_require_hang_ring(int fd, int ring);
+void igt_require_hang_ring(int fd, uint32_t ctx, unsigned int ring);
 
 typedef struct igt_hang {
 	igt_spin_t *spin;
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 4c18c22d..b28aaa8b 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -31,10 +31,14 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <fcntl.h>
+#include <sched.h>
+#include <poll.h>
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_device.h"
+#include "igt_store.h"
 #include "igt_sysfs.h"
 #include "igt_debugfs.h"
 #include "sw_sync.h"
@@ -45,6 +49,99 @@
 
 static int device = -1;
 static int sysfs = -1;
+#define MAX_RESET_TIME	120
+
+#define HWS_RELATIVE	0x80
+
+#define OFFSET_ALIVE	10
+#define OFFSET_RESET	100
+
+IGT_TEST_DESCRIPTION("Tests for hang detection and recovery");
+
+static void check_alive(void)
+{
+	const struct intel_execution_engine2 *engine;
+	struct intel_mmio_data mmio_data;
+	uint32_t scratch, *out;
+	const intel_ctx_t *ctx;
+	uint32_t hws_pre[GEM_MAX_ENGINES];
+	uint32_t hws_post[GEM_MAX_ENGINES];
+	int fd, i = 0;
+	bool want_mmio_check = true;
+
+	fd = drm_open_driver(DRIVER_INTEL);
+	igt_require(gem_class_can_store_dword(fd, 0));
+
+	ctx = intel_ctx_create_all_physical(fd);
+	scratch = gem_create(fd, 4096);
+	out = gem_mmap__wc(fd, scratch, 0, 4096, PROT_WRITE);
+	gem_set_domain(fd, scratch,
+			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
+	for_each_ctx_engine(fd, ctx, engine) {
+		igt_assert_eq_u32(out[i + OFFSET_ALIVE], 0);
+		i++;
+	}
+
+	/* FIXME: The register read is currently broken on too many systems */
+	want_mmio_check = false;
+
+	/* The register access library can cause the test to hang if it dies
+	 * without calling _fini (e.g. due to failing an assert). So do all
+	 * register poking in one go and then test their values later. */
+	if (want_mmio_check) {
+		int n = 0;
+
+		intel_register_access_init(&mmio_data, intel_get_pci_device(), 1, fd);
+
+		for_each_ctx_engine(fd, ctx, engine) {
+			uint32_t base = gem_engine_mmio_base(fd, engine->name);
+			hws_pre[n] = INREG(base + HWS_RELATIVE);
+			n++;
+		}
+	}
+
+	i = 0;
+	for_each_ctx_engine(fd, ctx, engine) {
+		if (!gem_class_can_store_dword(fd, engine->class))
+			continue;
+
+		/* +OFFSET_ALIVE to ensure engine zero doesn't get a false negative */
+		igt_store_word(fd, ctx, engine, -1, scratch, i + OFFSET_ALIVE, i + OFFSET_ALIVE);
+		i++;
+	}
+
+	gem_set_domain(fd, scratch, I915_GEM_DOMAIN_GTT, 0);
+
+	if (want_mmio_check) {
+		int n = 0;
+
+		for_each_ctx_engine(fd, ctx, engine) {
+			uint32_t base = gem_engine_mmio_base(fd, engine->name);
+			hws_post[n] = INREG(base + HWS_RELATIVE);
+			n++;
+		}
+
+		intel_register_access_fini(&mmio_data);
+	}
+
+	while (i--)
+		igt_assert_eq_u32(out[i + OFFSET_ALIVE], i + OFFSET_ALIVE);
+
+	if (want_mmio_check) {
+		int n = 0;
+
+		for_each_ctx_engine(fd, ctx, engine) {
+			igt_assert_eq_u32(hws_post[n], hws_pre[n]);
+			n++;
+		}
+	}
+
+	munmap(out, 4096);
+	intel_ctx_destroy(fd, ctx);
+	gem_close(fd, scratch);
+	close(fd);
+}
 
 static bool has_error_state(int dir)
 {
@@ -227,6 +324,8 @@ static void test_error_state_capture(const intel_ctx_t *ctx, unsigned ring_id,
 	check_error_state(ring_name, offset, batch);
 	munmap(batch, 4096);
 	put_ahnd(ahnd);
+
+	check_alive();
 }
 
 static void
@@ -302,7 +401,7 @@ static void hangcheck_unterminated(void)
 	uint32_t handle;
 
 	igt_require(gem_uses_full_ppgtt(device));
-	igt_require_hang_ring(device, 0);
+	igt_require_hang_ring(device, 0, 0);
 
 	handle = gem_create(device, 4096);
 
@@ -317,8 +416,10 @@ static void hangcheck_unterminated(void)
 	if (gem_wait(device, handle, &timeout_ns) != 0) {
 		/* need to manually trigger an hang to clean before failing */
 		igt_force_gpu_reset(device);
-		igt_assert_f(0, "unterminated batch did not trigger an hang!");
+		igt_assert_f(0, "unterminated batch did not trigger a hang!");
 	}
+
+	check_alive();
 }
 
 igt_main
@@ -339,11 +440,20 @@ igt_main
 		igt_assert(sysfs != -1);
 
 		igt_require(has_error_state(sysfs));
+
+		gem_require_mmap_wc(device);
+
 	}
 
+	igt_describe("Basic error capture");
 	igt_subtest("error-state-basic")
 		test_error_state_basic();
 
+	igt_describe("Check that executing unintialised memory causes a hang");
+	igt_subtest("hangcheck-unterminated")
+		hangcheck_unterminated();
+
+	igt_describe("Per engine error capture (GPU reset)");
 	igt_subtest_with_dynamic("error-state-capture") {
 		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
@@ -386,10 +496,21 @@ igt_main
 		}
 	}
 
-	igt_subtest("hangcheck-unterminated")
-		hangcheck_unterminated();
+	igt_fixture {
+		igt_disallow_hang(device, hang);
+
+		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
+	}
 
+	igt_describe("Per engine error capture (engine reset)");
+	igt_subtest_with_dynamic("engine-error-state-capture") {
+		for_each_ctx_engine(device, ctx, e) {
+			igt_dynamic_f("%s", e->name)
+				test_error_state_capture(ctx, e->flags, e->name);
+		}
+	}
 	igt_fixture {
+
 		igt_disallow_hang(device, hang);
 		intel_ctx_destroy(device, ctx);
 		close(device);
-- 
2.25.1
