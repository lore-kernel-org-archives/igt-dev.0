Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18623CCD18D
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 13:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B114F10E380;
	Mon, 13 Oct 2025 13:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOg5+MsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2407010E38B
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760362885; x=1791898885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3t/fKdP//J7fmuo4rrIEln51v609PWfxYnVbj+cbUk=;
 b=BOg5+MsETXntcjAFbr48suP14iV3zn4Fq+YtcwnUWq9s/XMo2+ai/I0v
 HVj5ITlKtmttOeofxK3+XyuQwtPq6Vfgusb+ALpSHz0Sy+64Px2UNiOTy
 vYeBFSXJLC8CE6SVamWUHyR6fUAmgk8JEbhEWc3ZumcCSRwQUFkdha3GX
 R+h4pE78XuHN/WbFlWyKlGzIqraP8oBERBvHaVoh35HeRWxPVoRE6nJ32
 RSxEdeEGVwRy7t9KOvqmOunQz8lPsa7MqcgrjTMBRCh1H3/in79Zdr0wp
 dF8B5ZvPbML4Kzg/5EG3g/3u+zd3M75XRFVhnWCI6fLPfGxLqIKP+SBsv g==;
X-CSE-ConnectionGUID: 8rWs2eTNRQ+PktstVx5jyg==
X-CSE-MsgGUID: gZfTItdwQkSZwm9UYODoAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66155505"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="66155505"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:41:25 -0700
X-CSE-ConnectionGUID: nkuPPe4mQFC0afEFJlUQ4Q==
X-CSE-MsgGUID: h6qRHCnQSfOpYNMKdQWAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180742579"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 06:41:22 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, zbigniew.kempczynski@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 4/4] tests/intel/xe_eudebug_online: add pagefault stress tests
Date: Mon, 13 Oct 2025 13:40:43 +0000
Message-Id: <20251013134043.1676308-5-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013134043.1676308-1-jan.maslak@intel.com>
References: <20251013134043.1676308-1-jan.maslak@intel.com>
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

Add a stress variant of the already existing
xe_eudebug_online@pagefault-[read|write] tests that increases
number of threads in the shader and number of threads in
threadgroup to their maximum available amounts.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_eudebug_online.c | 61 +++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 4c6c31da3..356787ab6 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -40,6 +40,7 @@
 #define SHADER_PAGEFAULT_READ		(1 << 14)
 #define SHADER_PAGEFAULT_WRITE		(1 << 15)
 #define FAULTABLE_VM			(1 << 16)
+#define PAGEFAULT_STRESS_TEST		(1 << 17)
 #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
@@ -127,8 +128,22 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height, uint64_t r
 	return buf;
 }
 
-static int get_number_of_threads(uint64_t flags)
+static int get_maximum_number_of_threads(int fd)
 {
+	uint32_t subslices = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_MAX_SUBSLICE);
+	uint32_t eus_per_subslice =
+		xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_MAX_EU_PER_SUBSLICE);
+	uint32_t threads_per_eu =
+		xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
+
+	return subslices * eus_per_subslice * threads_per_eu;
+}
+
+static int get_number_of_threads(int fd, uint64_t flags)
+{
+	if (flags & (PAGEFAULT_STRESS_TEST))
+		return get_maximum_number_of_threads(fd);
+
 	if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
 		return 16;
 
@@ -156,8 +171,8 @@ static int caching_get_instruction_count(int fd, uint32_t s_dim__x, int flags)
 
 static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 {
-	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
-	struct dim_t s_dim = surface_dimensions(get_number_of_threads(flags));
+	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
+	struct dim_t s_dim = surface_dimensions(get_number_of_threads(fd, flags));
 	static struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(fd);
@@ -165,6 +180,11 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 	if (shader->gen_ver == 3000)
 		gpgpu_shader_set_vrt(shader, VRT_96);
 
+	shader->simd_size = SIMD_SIZE;
+
+	if (flags & PAGEFAULT_STRESS_TEST)
+		shader->num_threads_in_tg = gpgpu_shader__get_max_threads_in_tg(shader);
+
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 	if (flags & SHADER_BREAKPOINT) {
 		gpgpu_shader__nop(shader);
@@ -210,7 +230,7 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 
 static struct gpgpu_shader *get_sip(int fd, const unsigned int flags)
 {
-	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
+	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
 	static struct gpgpu_shader *sip;
 
 	sip = gpgpu_shader_create(fd);
@@ -673,7 +693,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 	}
 
 	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
-		uint32_t threads = get_number_of_threads(d->flags);
+		uint32_t threads = get_number_of_threads(d->master_fd, d->flags);
 		uint32_t val = STEERING_END_LOOP;
 
 		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
@@ -695,7 +715,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 {
 	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
 	struct online_debug_data *data = d->ptr;
-	const int threads = get_number_of_threads(d->flags);
+	const int threads = get_number_of_threads(d->fd, d->flags);
 	uint32_t val;
 	size_t sz = sizeof(uint32_t);
 
@@ -920,7 +940,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 {
 	struct drm_xe_eudebug_event_eu_attention *att = (void *)e;
 	struct online_debug_data *data = d->ptr;
-	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->flags));
+	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->fd, d->flags));
 	uint32_t *kernel_offset = &data->kernel_offset;
 	int *counter = &data->att_event_counter;
 	int val;
@@ -1044,7 +1064,7 @@ static uint64_t get_memory_region(int fd, int flags, int region_bitmask)
 
 static void run_online_client(struct xe_eudebug_client *c)
 {
-	int threads = get_number_of_threads(c->flags);
+	int threads;
 	const uint64_t target_offset = 0x1a000000;
 	const uint64_t bb_offset = 0x1b000000;
 	size_t bb_size;
@@ -1061,8 +1081,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 		.num_placements = 1,
 		.extensions = c->flags & DISABLE_DEBUG_MODE ? 0 : to_user_pointer(&ext)
 	};
-	struct dim_t w_dim = walker_dimensions(threads);
-	struct dim_t s_dim = surface_dimensions(threads);
+	struct dim_t w_dim;
+	struct dim_t s_dim;
 	struct timespec ts = { };
 	struct gpgpu_shader *sip, *shader;
 	uint32_t metadata_id[2];
@@ -1079,6 +1099,10 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	fd = xe_eudebug_client_open_driver(c);
 
+	threads = get_number_of_threads(fd, c->flags);
+	w_dim = walker_dimensions(threads);
+	s_dim = surface_dimensions(threads);
+
 	shader = get_shader(fd, c->flags);
 	bb_size = get_bb_size(fd, shader);
 
@@ -1644,6 +1668,18 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
  * Description:
  *     Check whether KMD sends pagefault event for workload in debug mode that
  *     triggers a write pagefault.
+ *
+ * SUBTEST: pagefault-read-stress
+ * Functionality: page faults
+ * Description:
+ *     Check whether KMD sends read pagefault event for workload in debug mode
+ *     with many threads.
+ *
+ * SUBTEST: pagefault-write-stress
+ * Functionality: page faults
+ * Description:
+ *     Check whether KMD sends write pagefault event for workload in debug mode
+ *     with many threads.
  */
 static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
 				  int flags)
@@ -2679,6 +2715,11 @@ igt_main
 	test_gt_render_or_compute("pagefault-write", fd, hwe)
 		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
 
+	test_gt_render_or_compute("pagefault-read-stress", fd, hwe)
+		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ | PAGEFAULT_STRESS_TEST);
+	test_gt_render_or_compute("pagefault-write-stress", fd, hwe)
+		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

