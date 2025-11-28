Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AF8D116F9
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163510E914;
	Fri, 28 Nov 2025 14:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ct31BLBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF59410E8FF
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339274; x=1795875274;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CJjL4fCXcMByPRHkx/xnkDbl1Bdn3fJuTE34YZ8kZXE=;
 b=Ct31BLBhH9cHs6ECg2tRGzZ81c7kCmM12fvnzuClcKOHTSo3WiPOuGzM
 RZcZ30qCiVUcZsp71inzV/mFwtnCX6B/urX/MOWCDkdOim04/oMAJpV2U
 gpIo9DUUizZrL9f7mylX8A4hWyD6iRB/SXp3lRgad+Kie59oYD7UPpWWG
 CBOpMHX/Nqhymqhlfx8dnzWlWIZzoqDTNHx82gQoRDuEH35RKgp8gkK8o
 jTXcaa4rHOtWRQGWAwTSNzPPj8lP4RKxJZROZq6nQv+DiZ/BNgeh5nBub
 JmwbtzuuPWL1Opi/zVc9qVXU522CcIBNH/g1jva0qtxuxyBuAygDdheiW A==;
X-CSE-ConnectionGUID: 4jzjKHevQQSsc2m7MuX+og==
X-CSE-MsgGUID: jP82eiKgTnyPFpwnNEBjwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261622"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:34 -0800
X-CSE-ConnectionGUID: a0OMVqNkSSibh0moMiEhqQ==
X-CSE-MsgGUID: 7b6cSrMTSgGQugUTAyOgIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173695"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:33 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:13 +0100
Subject: [PATCH 09/11] tests/intel/xe_eudebug_online: use online_debug_data
 in get_(shader|sip)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-9-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=7915;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=CJjL4fCXcMByPRHkx/xnkDbl1Bdn3fJuTE34YZ8kZXE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa325o739WSM2A8cDmyVfZuQ8kClcBogIuAE8
 vkHkkGnJT+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt9gAKCRAjYrKT3hD9
 1y0/C/97ym2C1t5uqNKna85IEbCJyCS+molrD6Pj958wVLLsBzrE7WUIDDC8ZHeb9NiS8+MuHVb
 X1OZK4zszmTqmedRqWvtkkAihvkM+uVMEh5sYLkaih9mBf1OEc7WxBriMs+MtWogWJSUEf0Xf3y
 pxNWyG8JvwiipVGaqa8VyT5rjS6xeBl+GuUo+EGxAfhU+f6R512yCG+IKCjaZJomP1X7Oo56/jP
 QyWWJeYAUP+ZCmM9mvU0xaZrcPxFMzyUaHLbtZHiAUnCQzkOaox6YahLJfHf8E0zc3LpwsDxWGC
 9lnEI2NScdLac8xnyNTy4bUyCIyFnyUiiH64T3Nk+zKrw6RFlH9Mlra/MYOq3haD6Rrmo76UH3x
 Ht/2IEFeCPZotPfK9/Oy3hwzfwZwM1qu4CrZDof6yi+SIWPzoX03mXGV73w0ZD+lW3OgEVaKfhV
 8+0saAzLPNRkkeODj+wJ20h9VQZ4NBsuRh1sYhWiyAzsv2P2CT+QMBfu4+nqvuqtewFdI=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Future tests will require access to online_debug_data during shader and
sip creation.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_eudebug_online.c | 104 ++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 51 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index b4c8674cb0e6..911e2d5f52ef 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -139,6 +139,35 @@ static int get_maximum_number_of_threads(int fd)
 	return subslices * eus_per_subslice * threads_per_eu;
 }
 
+struct online_debug_data {
+	pthread_mutex_t mutex;
+	/* client in */
+	int drm_fd;
+	struct drm_xe_engine_class_instance hwe;
+	uint64_t flags;
+	/* client out */
+	int thread_hit_count;
+	/* debugger internals */
+	uint64_t client_handle;
+	uint64_t exec_queue_handle;
+	uint64_t lrc_handle;
+	uint64_t target_offset;
+	size_t target_size;
+	uint64_t bb_offset;
+	size_t bb_size;
+	int vm_fd;
+	uint32_t kernel_offset;
+	uint32_t first_aip;
+	uint64_t *aips_offset_table;
+	uint32_t steps_done;
+	uint8_t *single_step_bitmask;
+	int stepped_threads_count;
+	struct timespec exception_arrived;
+	int last_eu_control_seqno;
+	struct drm_xe_eudebug_event *exception_event;
+	int att_event_counter;
+};
+
 static int get_number_of_threads(int fd, uint64_t flags)
 {
 	if (flags & (PAGEFAULT_STRESS_TEST))
@@ -169,50 +198,52 @@ static int caching_get_instruction_count(int fd, uint32_t s_dim__x, int flags)
 	return (2 * xe_min_page_size(fd, memory)) / s_dim__x;
 }
 
-static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
+static struct gpgpu_shader *get_shader(struct online_debug_data *data)
 {
-	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
-	struct dim_t s_dim = surface_dimensions(get_number_of_threads(fd, flags));
+	struct dim_t w_dim = walker_dimensions(get_number_of_threads(data->drm_fd, data->flags));
+	struct dim_t s_dim = surface_dimensions(get_number_of_threads(data->drm_fd, data->flags));
 	static struct gpgpu_shader *shader;
 
-	shader = gpgpu_shader_create(fd);
+	shader = gpgpu_shader_create(data->drm_fd);
 
 	if (shader->gen_ver == 3000)
 		gpgpu_shader_set_vrt(shader, VRT_96);
 
 	shader->simd_size = SIMD_SIZE;
 
-	if (flags & PAGEFAULT_STRESS_TEST)
+	if (data->flags & PAGEFAULT_STRESS_TEST)
 		shader->num_threads_in_tg = gpgpu_shader__get_max_threads_in_tg(shader);
 
 	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
-	if (flags & SHADER_BREAKPOINT) {
+	if (data->flags & SHADER_BREAKPOINT) {
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__breakpoint(shader);
-	} else if (flags & SHADER_LOOP) {
+	} else if (data->flags & SHADER_LOOP) {
 		gpgpu_shader__label(shader, 0);
 		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
 		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
-	} else if (flags & SHADER_SINGLE_STEP) {
+	} else if (data->flags & SHADER_SINGLE_STEP) {
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__breakpoint(shader);
 		for (int i = 0; i < SINGLE_STEP_COUNT; i++)
 			gpgpu_shader__nop(shader);
-	} else if (flags & SHADER_N_NOOP_BREAKPOINT) {
+	} else if (data->flags & SHADER_N_NOOP_BREAKPOINT) {
 		for (int i = 0; i < SHADER_LOOP_N; i++) {
 			gpgpu_shader__nop(shader);
 			gpgpu_shader__breakpoint(shader);
 		}
-	} else if ((flags & SHADER_CACHING_SRAM) || (flags & SHADER_CACHING_VRAM)) {
+	} else if ((data->flags & SHADER_CACHING_SRAM) || (data->flags & SHADER_CACHING_VRAM)) {
+		int  count = caching_get_instruction_count(data->drm_fd, s_dim.x, data->flags);
+
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__breakpoint(shader);
-		for (int i = 0; i < caching_get_instruction_count(fd, s_dim.x, flags); i++)
+		for (int i = 0; i < count; i++)
 			gpgpu_shader__common_target_write_u32(shader, s_dim.y + i, CACHING_VALUE(i));
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__breakpoint(shader);
-	} else if (flags & SHADER_PAGEFAULT) {
-		if (flags & SHADER_PAGEFAULT_READ)
+	} else if (data->flags & SHADER_PAGEFAULT) {
+		if (data->flags & SHADER_PAGEFAULT_READ)
 			gpgpu_shader__read_a64_d32(shader, BAD_OFFSET);
 		else
 			gpgpu_shader__write_a64_d32(shader, BAD_OFFSET, BAD_CANARY);
@@ -228,16 +259,16 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 	return shader;
 }
 
-static struct gpgpu_shader *get_sip(int fd, const unsigned int flags)
+static struct gpgpu_shader *get_sip(struct online_debug_data *data)
 {
-	struct dim_t w_dim = walker_dimensions(get_number_of_threads(fd, flags));
+	struct dim_t w_dim = walker_dimensions(get_number_of_threads(data->drm_fd, data->flags));
 	static struct gpgpu_shader *sip;
 
-	sip = gpgpu_shader_create(fd);
+	sip = gpgpu_shader_create(data->drm_fd);
 	gpgpu_shader__write_aip(sip, 0);
 
 	gpgpu_shader__wait(sip);
-	if (flags & SIP_SINGLE_STEP)
+	if (data->flags & SIP_SINGLE_STEP)
 		gpgpu_shader__end_system_routine_step_if_eq(sip, w_dim.y, 0);
 	else
 		gpgpu_shader__end_system_routine(sip, true);
@@ -374,35 +405,6 @@ static inline uint64_t eu_ctl_interrupt_all(int debugfd, uint64_t client,
 		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL);
 }
 
-struct online_debug_data {
-	pthread_mutex_t mutex;
-	/* client in */
-	int drm_fd;
-	struct drm_xe_engine_class_instance hwe;
-	uint64_t flags;
-	/* client out */
-	int thread_hit_count;
-	/* debugger internals */
-	uint64_t client_handle;
-	uint64_t exec_queue_handle;
-	uint64_t lrc_handle;
-	uint64_t target_offset;
-	size_t target_size;
-	uint64_t bb_offset;
-	size_t bb_size;
-	int vm_fd;
-	uint32_t kernel_offset;
-	uint32_t first_aip;
-	uint64_t *aips_offset_table;
-	uint32_t steps_done;
-	uint8_t *single_step_bitmask;
-	int stepped_threads_count;
-	struct timespec exception_arrived;
-	int last_eu_control_seqno;
-	struct drm_xe_eudebug_event *exception_event;
-	int att_event_counter;
-};
-
 static struct online_debug_data *
 online_debug_data_create(int drm_fd, struct drm_xe_engine_class_instance *hwe, uint64_t flags)
 {
@@ -530,7 +532,7 @@ static bool set_breakpoint_once(struct xe_eudebug_debugger *d,
 	struct gpgpu_shader *kernel;
 	uint32_t aip;
 
-	kernel = get_shader(d->master_fd, d->flags);
+	kernel = get_shader(data);
 
 	if (!data->kernel_offset) {
 		uint32_t instr_usdw;
@@ -671,7 +673,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 			uint32_t expected, aip;
 			struct gpgpu_shader *kernel;
 
-			kernel = get_shader(d->master_fd, d->flags);
+			kernel = get_shader(data);
 			expected = data->kernel_offset + kernel->size * 4 - 0x10;
 
 			igt_assert_eq(pread(data->vm_fd, &aip, sizeof(aip),
@@ -953,7 +955,7 @@ static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
 	gpgpu_shader__common_target_write_u32(shader_write_instr, 0, 0);
 
 	if (!*kernel_offset) {
-		kernel = get_shader(d->master_fd, d->flags);
+		kernel = get_shader(data);
 		*kernel_offset = find_kernel_in_bb(kernel, data);
 		gpgpu_shader_destroy(kernel);
 	}
@@ -1093,7 +1095,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	w_dim = walker_dimensions(threads);
 	s_dim = surface_dimensions(threads);
 
-	shader = get_shader(fd, c->flags);
+	shader = get_shader(data);
 	bb_size = get_bb_size(fd, shader);
 
 	/* Additional memory for steering control */
@@ -1129,7 +1131,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 				     get_memory_region(fd, c->flags, BB_REGION_BITMASK));
 	intel_bb_set_lr_mode(ibb, true);
 
-	sip = get_sip(fd, c->flags);
+	sip = get_sip(data);
 
 	igt_nsec_elapsed(&ts);
 	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, sip, 0, 0);

-- 
2.43.0

