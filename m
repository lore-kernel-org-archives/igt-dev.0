Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E70CD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 14:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828CA1133CE;
	Wed, 10 Apr 2024 14:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOWDKRi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3434A10EC85
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712760210; x=1744296210;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=TDCWQ27SiGU/0uB83jDU3kuSy0OBrsGqFakK9ZDPnNY=;
 b=bOWDKRi496wpLM3f8gkNa4A2V8ZMgUq+VZSqOlKDBMLTgmiZ09WASW9b
 qHVSRRMQzsJVvCevYSM7CghUsbc7oB4WXe0Bj1GIKHWRSeoJpQMBKkDS2
 p5B7Lkuop8aWMhstAnNCucjPKxs2JgnNIQgkuSXMjdSBNQM4fxRO6s4mT
 AJz/D8uI5a9qMvhTifqHGcQ01U9i/yQ9HlpMNVASjEQZgehlEiS6o6ntP
 woFvOGsqXr1Hn6PdQbx9zxY7bLBgefaeIEjVBI+4fmnq5Oxg+/P5gOAPJ
 jlim9V/vAsAdiqrC3gkStF11x5+W4WKzvhYB6vsLXE0le2Y39VNR5HGyP g==;
X-CSE-ConnectionGUID: 6r/GlR1hTwWHRtCZbf8JWg==
X-CSE-MsgGUID: 3nsk8Ow7T8617MdPKvBF+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18732388"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18732388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
X-CSE-ConnectionGUID: xdOquwQ7S7qdXSo3L47eag==
X-CSE-MsgGUID: anj6gO44Re6orJBZVQELpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="43828880"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 07:43:27 -0700
Received: from linux.intel.com (unknown [10.245.244.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C96AE20B573A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 07:43:26 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1ruZAa-00000000BfE-3i5l for igt-dev@lists.freedesktop.org;
 Wed, 10 Apr 2024 16:43:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 3/4] tests: fix calloc calls with inverted arguments
Date: Wed, 10 Apr 2024 16:42:37 +0200
Message-ID: <20240410144321.44766-4-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
References: <20240410144321.44766-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The new gcc version 14 now complains when calloc is called
with inverted arguments. use the script	from:
a0ee73a8f359 ("benchmarks: fix calloc calls with inverted arguments")

To fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/amdgpu/amd_multidisplay_modeset.c | 2 +-
 tests/chamelium/kms_chamelium_frames.c  | 2 +-
 tests/intel/gem_exec_alignment.c        | 4 ++--
 tests/intel/gem_exec_fair.c             | 4 ++--
 tests/intel/gem_fence_thrash.c          | 4 ++--
 tests/intel/gem_ppgtt.c                 | 4 ++--
 tests/intel/gem_render_tiled_blits.c    | 2 +-
 tests/intel/gem_userptr_blits.c         | 2 +-
 tests/kms_atomic_transition.c           | 6 +++---
 tests/kms_flip.c                        | 4 ++--
 10 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 4a54f92e0a40..f940973525b0 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -239,7 +239,7 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 			      num_disps > data->display.n_outputs,
 		      "ASIC does not have %d outputs/pipes\n", num_disps);
 
-	buf = calloc(sizeof(struct igt_fb), num_disps);
+	buf = calloc(num_disps, sizeof(struct igt_fb));
 	igt_assert_f(buf, "Failed to allocate memory\n");
 
 	/* For mode test, it is max number of modes for
diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
index 05eeca593f87..a585e7e01d87 100644
--- a/tests/chamelium/kms_chamelium_frames.c
+++ b/tests/chamelium/kms_chamelium_frames.c
@@ -940,7 +940,7 @@ static void test_display_planes_random(chamelium_data_t *data,
 	overlay_planes_count = (rand() % overlay_planes_max) + 1;
 	igt_debug("Using %d overlay planes\n", overlay_planes_count);
 
-	overlay_fbs = calloc(sizeof(struct igt_fb), overlay_planes_count);
+	overlay_fbs = calloc(overlay_planes_count, sizeof(struct igt_fb));
 
 	for (i = 0; i < overlay_planes_count; i++) {
 		struct igt_fb *overlay_fb = &overlay_fbs[i];
diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alignment.c
index 0e9f78362401..6e5496166af3 100644
--- a/tests/intel/gem_exec_alignment.c
+++ b/tests/intel/gem_exec_alignment.c
@@ -201,7 +201,7 @@ naughty_child(int i915, int link, uint32_t shared, unsigned int flags)
 		flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	/* Fill the low-priority address space */
-	obj = calloc(sizeof(*obj), count);
+	obj = calloc(count, sizeof(*obj));
 	igt_assert(obj);
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -406,7 +406,7 @@ setup_many(int i915, unsigned long *out)
 		count = file_max();
 	igt_require_memory(count, 4096, CHECK_RAM);
 
-	obj = calloc(sizeof(*obj), count);
+	obj = calloc(count, sizeof(*obj));
 	igt_assert(obj);
 
 	flags = 0;
diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
index c903b6eddb3c..e71fa2f0d6e8 100644
--- a/tests/intel/gem_exec_fair.c
+++ b/tests/intel/gem_exec_fair.c
@@ -1118,8 +1118,8 @@ static void deadline(int i915, const intel_ctx_cfg_t *cfg,
 		(frame_ns / 1000 / 1000 + 2) * switch_ns + parent_ns;
 	struct intel_execution_engine2 pe = pick_default(i915, cfg);
 	struct intel_execution_engine2 ve = pick_engine(i915, cfg, "vcs0");
-	struct drm_i915_gem_exec_fence *fences = calloc(sizeof(*fences), 32);
-	struct drm_i915_gem_exec_object2 *obj = calloc(sizeof(*obj), 32);
+	struct drm_i915_gem_exec_fence *fences = calloc(32, sizeof(*fences));
+	struct drm_i915_gem_exec_object2 *obj = calloc(32, sizeof(*obj));
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(obj),
 		.cliprects_ptr = to_user_pointer(fences),
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index 0df7319fced7..e01e5a8a7e31 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -150,7 +150,7 @@ _bo_write_verify(struct test *t)
 	igt_assert(t->tiling >= 0 && t->tiling <= I915_TILING_Y);
 	igt_assert_lt(0, t->num_surfaces);
 
-	s = calloc(sizeof(*s), t->num_surfaces);
+	s = calloc(t->num_surfaces, sizeof(*s));
 	igt_assert(s);
 
 	for (k = 0; k < t->num_surfaces; k++)
@@ -231,7 +231,7 @@ static int run_test(int threads_per_fence, void *f, int tiling,
 		 num_fences, tiling, surfaces_per_thread);
 
 	if (threads_per_fence) {
-		threads = calloc(sizeof(*threads), num_threads);
+		threads = calloc(num_threads, sizeof(*threads));
 		igt_assert(threads != NULL);
 
 		for (n = 0; n < num_threads; n++)
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 9eb995f20230..e6a4651da88c 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -429,7 +429,7 @@ igt_main
 		mem_per_test = SIZE;
 		igt_require_memory(nchild + 1, mem_per_test, CHECK_RAM);
 
-		rcs = calloc(sizeof(*rcs), nchild);
+		rcs = calloc(nchild, sizeof(*rcs));
 		igt_assert(rcs);
 
 		fork_bcs_copy(30, 0x4000, bcs, 1);
@@ -456,7 +456,7 @@ igt_main
 		mem_per_test = SIZE + mem_per_ctx;
 		igt_require_memory(1 + nchild, mem_per_test, CHECK_RAM);
 
-		rcs = calloc(sizeof(*rcs), nchild);
+		rcs = calloc(nchild, sizeof(*rcs));
 		igt_assert(rcs);
 
 		fork_rcs_copy(30, 0x8000 / nchild, rcs, nchild, CREATE_CONTEXT);
diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_render_tiled_blits.c
index 3c4b062b016d..4b49c2a3658c 100644
--- a/tests/intel/gem_render_tiled_blits.c
+++ b/tests/intel/gem_render_tiled_blits.c
@@ -149,7 +149,7 @@ static void run_test (int fd, int count)
 		igt_info("Using a snoop linear buffer for comparisons\n");
 	}
 
-	bufs = calloc(sizeof(*bufs), count);
+	bufs = calloc(count, sizeof(*bufs));
 	start_val = malloc(sizeof(*start_val)*count);
 
 	for (i = 0; i < count; i++) {
diff --git a/tests/intel/gem_userptr_blits.c b/tests/intel/gem_userptr_blits.c
index 51948db0c90e..66f2a9416c97 100644
--- a/tests/intel/gem_userptr_blits.c
+++ b/tests/intel/gem_userptr_blits.c
@@ -1430,7 +1430,7 @@ static void store_dword_rand(int i915, const intel_ctx_t *ctx,
 	batchsz = count * 16 + 4;
 	batchsz = ALIGN(batchsz, 4096);
 
-	reloc = calloc(sizeof(*reloc), count);
+	reloc = calloc(count, sizeof(*reloc));
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = target;
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index e8992790d31e..29dd8ac4e4e8 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -480,11 +480,11 @@ static void prepare_fencing(data_t *data, enum pipe pipe)
 	igt_require_sw_sync();
 
 	n_planes = data->display.pipes[pipe].n_planes;
-	timeline = calloc(sizeof(*timeline), n_planes);
+	timeline = calloc(n_planes, sizeof(*timeline));
 	igt_assert_f(timeline != NULL, "Failed to allocate memory for timelines\n");
-	thread = calloc(sizeof(*thread), n_planes);
+	thread = calloc(n_planes, sizeof(*thread));
 	igt_assert_f(thread != NULL, "Failed to allocate memory for thread\n");
-	seqno = calloc(sizeof(*seqno), n_planes);
+	seqno = calloc(n_planes, sizeof(*seqno));
 	igt_assert_f(seqno != NULL, "Failed to allocate memory for seqno\n");
 
 	for_each_plane_on_pipe(&data->display, pipe, plane)
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 3973ec862436..15c3b5ba275d 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -423,8 +423,8 @@ static void emit_fence_stress(struct test_output *o)
 	igt_require(bops);
 
 	igt_assert(num_fences);
-	bo = calloc(sizeof(*bo), num_fences);
-	exec = calloc(sizeof(*exec), num_fences+1);
+	bo = calloc(num_fences, sizeof(*bo));
+	exec = calloc(num_fences+1, sizeof(*exec));
 	for (i = 0; i < num_fences - 1; i++) {
 		uint32_t tiling = I915_TILING_X;
 		bo[i] = intel_buf_create(bops, 1024, 1024, 32, 0, tiling,
-- 
2.44.0

