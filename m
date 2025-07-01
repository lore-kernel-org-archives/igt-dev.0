Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB1DC7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 13:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91C910E5B8;
	Tue,  1 Jul 2025 13:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoPo7PeX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDF110E5B8
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751378002; x=1782914002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IutO3CAmHpmEOV9Kv3Fg0G23QNjrAUUSiGVfiJY2DlM=;
 b=FoPo7PeX+DVZOZlMHiTJJSRAIZJ0Dbn0QEfFnQsz4emK/y3Qa+4QhmI3
 Ty+vi6scIHIA4lQGLMMDrLXVFqZX8gSgYqwhsIyktJSjTyXpWnmJ4rRU/
 izeuAZkGTjElreAvGFQr7R6sWX1Y54aO6mZwL30qd7pvMRyZJg48MkK4H
 zWG6vly5ITuBXvCJGu1PVY6BDErRyu3vXFoUgEAI7T4bNR5Q5fXFE4fZS
 QiA+yE+fW8+82xP+bE5hcgEHebB1Qok/Sd8taeMEa62bplfFhxa/0XsPj
 o3n0jwM5oFEYNzbsSx4jEkd4qaBlo2X2SQcIQb5N3pzu0sjaBusKK7qAF w==;
X-CSE-ConnectionGUID: n48Qcj3lSMuW3zEUsXbqeQ==
X-CSE-MsgGUID: ePG+6/UzQN6+G4zkRYaBlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57421133"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57421133"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:53:22 -0700
X-CSE-ConnectionGUID: NZSiFpFBRqS3y+G21QuX1g==
X-CSE-MsgGUID: d2V3qplsSpyDgidIwE3Exw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154504172"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 06:53:20 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 3/3] tests/intel/xe_eudebug_online: add pagefault stress tests
Date: Tue,  1 Jul 2025 13:53:07 +0000
Message-Id: <20250701135307.68147-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135307.68147-1-jan.maslak@intel.com>
References: <20250701135307.68147-1-jan.maslak@intel.com>
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
 tests/intel/xe_eudebug_online.c | 75 ++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 0498be80a..7f06fef27 100644
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
@@ -125,8 +126,34 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height, uint64_t r
 	return buf;
 }
 
-static int get_number_of_threads(uint64_t flags)
+static int get_maximum_number_of_threads(int fd)
 {
+	uint32_t hwconfig_len;
+	uint32_t subslices = 0;
+	uint32_t eus_per_subslice = 0;
+	uint32_t threads_per_eu = 0;
+	uint32_t *val;
+
+	val = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_MAX_SUBSLICE, &hwconfig_len);
+	igt_assert(val && hwconfig_len == 1);
+	subslices = *val;
+
+	val = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_MAX_EU_PER_SUBSLICE, &hwconfig_len);
+	igt_assert(val && hwconfig_len == 1);
+	eus_per_subslice = *val;
+
+	val = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU, &hwconfig_len);
+	igt_assert(val && hwconfig_len == 1);
+	threads_per_eu = *val;
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
 
@@ -154,8 +181,8 @@ static int caching_get_instruction_count(int fd, uint32_t s_dim__x, int flags)
 
 static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 {
-	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
-	struct dim_t s_dim = surface_dimensions(get_number_of_threads(flags));
+	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
+	struct dim_t s_dim = surface_dimensions(get_number_of_threads(fd, flags));
 	static struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(fd);
@@ -208,7 +235,7 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 
 static struct gpgpu_shader *get_sip(int fd, const unsigned int flags)
 {
-	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
+	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
 	static struct gpgpu_shader *sip;
 
 	sip = gpgpu_shader_create(fd);
@@ -671,7 +698,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 	}
 
 	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
-		uint32_t threads = get_number_of_threads(d->flags);
+		uint32_t threads = get_number_of_threads(d->master_fd, d->flags);
 		uint32_t val = STEERING_END_LOOP;
 
 		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
@@ -693,7 +720,7 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 {
 	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
 	struct online_debug_data *data = d->ptr;
-	const int threads = get_number_of_threads(d->flags);
+	const int threads = get_number_of_threads(d->fd, d->flags);
 	uint32_t val;
 	size_t sz = sizeof(uint32_t);
 
@@ -918,7 +945,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 {
 	struct drm_xe_eudebug_event_eu_attention *att = (void *)e;
 	struct online_debug_data *data = d->ptr;
-	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->flags));
+	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->fd, d->flags));
 	uint32_t *kernel_offset = &data->kernel_offset;
 	int *counter = &data->att_event_counter;
 	int val;
@@ -1042,7 +1069,7 @@ static uint64_t get_memory_region(int fd, int flags, int region_bitmask)
 
 static void run_online_client(struct xe_eudebug_client *c)
 {
-	int threads = get_number_of_threads(c->flags);
+	int threads;
 	const uint64_t target_offset = 0x1a000000;
 	const uint64_t bb_offset = 0x1b000000;
 	size_t bb_size;
@@ -1059,8 +1086,8 @@ static void run_online_client(struct xe_eudebug_client *c)
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
@@ -1069,6 +1096,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	struct intel_buf *buf;
 	uint32_t *ptr;
 	int fd, vm_flags;
+	uint32_t num_threads_in_tg = 1;
 
 	metadata[0] = calloc(2, sizeof(**metadata));
 	metadata[1] = calloc(2, sizeof(**metadata));
@@ -1077,9 +1105,17 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	fd = xe_eudebug_client_open_driver(c);
 
+	threads = get_number_of_threads(fd, c->flags);
+	w_dim = walker_dimensions(threads);
+	s_dim = surface_dimensions(threads);
+
 	shader = get_shader(fd, c->flags);
 	bb_size = get_bb_size(fd, shader);
 
+	if (c->flags & PAGEFAULT_STRESS_TEST)
+		num_threads_in_tg = compute_max_threads_in_tg(shader->vrt, false, SIMD_SIZE,
+							      false);
+
 	/* Additional memory for steering control */
 	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
 		s_dim.y++;
@@ -1116,7 +1152,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	sip = get_sip(fd, c->flags);
 
 	igt_nsec_elapsed(&ts);
-	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, 1, shader, sip, 0, 0);
+	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, num_threads_in_tg, shader, sip, 0, 0);
 
 	gpgpu_shader_destroy(sip);
 	gpgpu_shader_destroy(shader);
@@ -1630,6 +1666,18 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
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
@@ -2665,6 +2713,11 @@ igt_main
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

