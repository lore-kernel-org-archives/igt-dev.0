Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD87C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E0D10E425;
	Mon, 29 Jul 2024 16:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKQO1vsQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB39D10E425
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269142; x=1753805142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NbOd7DbyHBmGPx4qRbXZtTawbSa3RguHMmMbQzUvPNQ=;
 b=ZKQO1vsQrDhOz2zWXyZNuhHgTWw62nSsquPXD3A2cleSv1g+7HQ6SRL5
 T5hsyHGhp874CCQ1Kx3RIs4SjuEGxm+U3hL7FYPtK78z0dvQKus/LAU1Z
 iwOdrCEKHcSlu6cfw6pRhZlXwkdrkfGDmCVLopmVF/56V0arE2/+lrRm8
 +B4T85f5n3kVoOP5NJpKYVS0a3ZlbzwRyZBrwFXOlM0vR0OOeWZJxb5ww
 Gfa2PxPeXRS8wyzMNdHSr6WWDooh3DCNxL3DTUdqyL/sScRxDTRUZxyO2
 VfAny8TtQsP1EioNHqiJ3fjGPxjpPRXJc0GnApo9vervY1yvy4/w3asW6 Q==;
X-CSE-ConnectionGUID: JmiIx1g5SIKsqEq7NeM3CQ==
X-CSE-MsgGUID: ELuAqOTVT7eljNwgDT5sUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427854"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427854"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:28 -0700
X-CSE-ConnectionGUID: Bi0ovXOxQRqpDWU59QhBIw==
X-CSE-MsgGUID: FceyCN1qTPCDskYt5TuLTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739815"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:24 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH 59/66] tests/xe_eudebug_online: Add single-step and
 single-step-one tests
Date: Mon, 29 Jul 2024 18:01:52 +0200
Message-Id: <20240729160159.37036-60-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Add single-step test that walks debugger over shader
instruction by instruction in every thread in parallel.

Add single-step-one test that walks debugger over shader
instruction by instruction in one thread at a time.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 260 ++++++++++++++++++++++++++++++--
 1 file changed, 246 insertions(+), 14 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 9f55cec74..cabe2101e 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -20,16 +20,23 @@
 #include "intel_mocs.h"
 #include "gpgpu_shader.h"
 
-#define SHADER_BREAKPOINT	(1 << 0)
-#define SHADER_LOOP		(1 << 1)
-#define TRIGGER_RECONNECT	(1 << 27)
-#define TRIGGER_RESUME_SET_BP	(1 << 28)
-#define TRIGGER_RESUME_DELAYED	(1 << 29)
-#define TRIGGER_RESUME_DSS	(1 << 30)
-#define TRIGGER_RESUME_ONE	(1 << 31)
+#define SHADER_BREAKPOINT		(1 << 0)
+#define SHADER_LOOP			(1 << 1)
+#define SHADER_SINGLE_STEP		(1 << 2)
+#define SIP_SINGLE_STEP			(1 << 3)
+#define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
+#define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
+#define TRIGGER_RECONNECT		(1 << 27)
+#define TRIGGER_RESUME_SET_BP		(1 << 28)
+#define TRIGGER_RESUME_DELAYED		(1 << 29)
+#define TRIGGER_RESUME_DSS		(1 << 30)
+#define TRIGGER_RESUME_ONE		(1 << 31)
 
 #define DEBUGGER_REATTACHED	1
 
+#define SINGLE_STEP_COUNT	16
+#define STEERING_SINGLE_STEP	0
+#define STEERING_CONTINUE	0x00c0ffee
 #define STEERING_END_LOOP	0xdeadca11
 
 #define SHADER_CANARY 0x01010101
@@ -92,7 +99,8 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height)
 
 static int get_number_of_threads(uint64_t flags)
 {
-	if (flags & (TRIGGER_RESUME_ONE))
+	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
+		     TRIGGER_RESUME_PARALLEL_WALK))
 		return 32;
 
 	return 512;
@@ -114,21 +122,30 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
 		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+	} else if (flags & SHADER_SINGLE_STEP) {
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__breakpoint(shader);
+		for (int i = 0; i < SINGLE_STEP_COUNT; i++)
+			gpgpu_shader__nop(shader);
 	}
 
 	gpgpu_shader__eot(shader);
 	return shader;
 }
 
-static struct gpgpu_shader *get_sip(int fd)
+static struct gpgpu_shader *get_sip(int fd, const unsigned int flags)
 {
+	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
 	static struct gpgpu_shader *sip;
 
 	sip = gpgpu_shader_create(fd);
 	gpgpu_shader__write_aip(sip, 0);
 
 	gpgpu_shader__wait(sip);
-	gpgpu_shader__end_system_routine(sip, true);
+	if (flags & SIP_SINGLE_STEP)
+		gpgpu_shader__end_system_routine_step_if_eq(sip, w_dim.y, 0);
+	else
+		gpgpu_shader__end_system_routine(sip, true);
 	return sip;
 }
 
@@ -281,6 +298,10 @@ struct online_debug_data {
 	size_t bb_size;
 	int vm_fd;
 	uint32_t first_aip;
+	uint64_t *aips_offset_table;
+	uint32_t steps_done;
+	uint8_t *single_step_bitmask;
+	int stepped_threads_count;
 	struct timespec exception_arrived;
 	int last_eu_control_seqno;
 };
@@ -298,13 +319,14 @@ online_debug_data_create(struct drm_xe_engine_class_instance *hwe)
 	data->exec_queue_handle = -1ULL;
 	data->lrc_handle = -1ULL;
 	data->vm_fd = -1;
+	data->stepped_threads_count = -1;
 
 	return data;
 }
 
 static void online_debug_data_destroy(struct online_debug_data *data)
 {
-
+	free(data->aips_offset_table);
 	munmap(data, ALIGN(sizeof(*data), PAGE_SIZE));
 }
 
@@ -366,6 +388,25 @@ static void copy_first_bit(uint8_t *dst, uint8_t *src, int size)
 	}
 }
 
+static void copy_nth_bit(uint8_t *dst, uint8_t *src, int size, int n)
+{
+	int count = 0;
+
+	for (int i = 0; i < size; i++) {
+		uint32_t tmp = src[i];
+		for (int j = 7; j >= 0; j--) {
+			if (tmp & (1 << j)) {
+				count++;
+				if (count == n)
+					dst[i] |= (1 << j);
+				else
+					dst[i] &= ~(1 << j);
+			} else
+				dst[i] &= ~(1 << j);
+		}
+	}
+}
+
 /*
  * Searches for the first instruction. It stands on assumption,
  * that shader kernel is placed before sip within the bb.
@@ -431,6 +472,57 @@ static void set_breakpoint_once(struct xe_eudebug_debugger *d,
 	gpgpu_shader_destroy(kernel);
 }
 
+static void get_aips_offset_table(struct online_debug_data *data, int threads)
+{
+	size_t sz = sizeof(uint32_t);
+	uint32_t aip;
+	uint32_t first_aip;
+	int table_index = 0;
+
+	if (data->aips_offset_table)
+		return;
+
+	data->aips_offset_table = malloc(threads * sizeof(uint64_t));
+	igt_assert(data->aips_offset_table);
+
+	igt_assert_eq(pread(data->vm_fd, &first_aip, sz, data->target_offset), sz);
+	data->first_aip = first_aip;
+	data->aips_offset_table[table_index++] = 0;
+
+	fsync(data->vm_fd);
+	for (int i = 1; i < data->target_size; i++) {
+		igt_assert_eq(pread(data->vm_fd, &aip, sz, data->target_offset + i), sz);
+		if (aip == first_aip)
+			data->aips_offset_table[table_index++] = i;
+	}
+
+	igt_assert_eq(threads, table_index);
+
+	igt_debug("AIPs offset table:\n");
+	for (int i = 0; i < threads; i++) {
+		igt_debug("%lx\n", data->aips_offset_table[i]);
+	}
+}
+
+static int get_stepped_threads_count(struct online_debug_data *data, int threads)
+{
+	int count = 0;
+	size_t sz = sizeof(uint32_t);
+	uint32_t aip;
+
+	fsync(data->vm_fd);
+	for (int i = 0; i < threads; i++) {
+		igt_assert_eq(pread(data->vm_fd, &aip, sz,
+				    data->target_offset + data->aips_offset_table[i]), sz);
+		if (aip != data->first_aip) {
+			igt_assert(aip == data->first_aip + 0x10);
+			count++;
+		}
+	}
+
+	return count;
+}
+
 #define MAX_PREEMPT_TIMEOUT 10ull
 static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 					struct drm_xe_eudebug_event *e)
@@ -493,6 +585,98 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 	free(bitmask);
 }
 
+static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *d,
+						    struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
+	struct online_debug_data *data = d->ptr;
+	const int threads = get_number_of_threads(d->flags);
+	uint32_t val;
+	size_t sz = sizeof(uint32_t);
+
+	get_aips_offset_table(data, threads);
+
+	if (d->flags & TRIGGER_RESUME_PARALLEL_WALK) {
+		if (data->stepped_threads_count != -1)
+			if (data->steps_done < SINGLE_STEP_COUNT) {
+				int stepped_threads_count_after_resume =
+						get_stepped_threads_count(data, threads);
+				igt_debug("Stepped threads after: %d\n",
+					  stepped_threads_count_after_resume);
+
+				if (stepped_threads_count_after_resume == threads) {
+					data->first_aip += 0x10;
+					data->steps_done++;
+				}
+
+				igt_debug("Shader steps: %d\n", data->steps_done);
+				igt_assert(data->stepped_threads_count == 0);
+				igt_assert(stepped_threads_count_after_resume == threads);
+			}
+
+		if (data->steps_done < SINGLE_STEP_COUNT) {
+			data->stepped_threads_count = get_stepped_threads_count(data, threads);
+			igt_debug("Stepped threads before: %d\n", data->stepped_threads_count);
+		}
+
+		val = data->steps_done < SINGLE_STEP_COUNT ? STEERING_SINGLE_STEP :
+							     STEERING_CONTINUE;
+	} else if (d->flags & TRIGGER_RESUME_SINGLE_WALK) {
+		if (data->stepped_threads_count != -1)
+			if (data->steps_done < 2) {
+				int stepped_threads_count_after_resume =
+						get_stepped_threads_count(data, threads);
+				igt_debug("Stepped threads after: %d\n",
+					  stepped_threads_count_after_resume);
+
+				if (stepped_threads_count_after_resume == threads) {
+					data->first_aip += 0x10;
+					data->steps_done++;
+					free(data->single_step_bitmask);
+					data->single_step_bitmask = 0;
+				}
+
+				igt_debug("Shader steps: %d\n", data->steps_done);
+				igt_assert(data->stepped_threads_count +
+					   (intel_gen_needs_resume_wa(d->master_fd) ? 2 : 1) ==
+					   stepped_threads_count_after_resume);
+			}
+
+		if (data->steps_done < 2) {
+			data->stepped_threads_count = get_stepped_threads_count(data, threads);
+			igt_debug("Stepped threads before: %d\n", data->stepped_threads_count);
+			if (intel_gen_needs_resume_wa(d->master_fd)) {
+				if (!data->single_step_bitmask) {
+					data->single_step_bitmask = malloc(att->bitmask_size *
+									   sizeof(uint8_t));
+					igt_assert(data->single_step_bitmask);
+					memcpy(data->single_step_bitmask, att->bitmask,
+					       att->bitmask_size);
+				}
+
+				copy_first_bit(att->bitmask, data->single_step_bitmask,
+					       att->bitmask_size);
+			} else
+				copy_nth_bit(att->bitmask, att->bitmask, att->bitmask_size,
+					     data->stepped_threads_count + 1);
+		}
+
+		val = data->steps_done < 2 ? STEERING_SINGLE_STEP : STEERING_CONTINUE;
+	}
+
+	igt_assert_eq(pwrite(data->vm_fd, &val, sz,
+			     data->target_offset + steering_offset(threads)), sz);
+	fsync(data->vm_fd);
+
+	eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
+		      att->exec_queue_handle, att->lrc_handle,
+		      att->bitmask, att->bitmask_size);
+
+	if (data->single_step_bitmask)
+		for (int i = 0; i < att->bitmask_size; i++)
+			data->single_step_bitmask[i] &= ~att->bitmask[i];
+}
+
 static void open_trigger(struct xe_eudebug_debugger *d,
 			 struct drm_xe_eudebug_event *e)
 {
@@ -614,7 +798,7 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
 
 static void run_online_client(struct xe_eudebug_client *c)
 {
-	const int threads = c->flags & (TRIGGER_RESUME_ONE) ? 64 : 512;
+	int threads = get_number_of_threads(c->flags);
 	const uint64_t target_offset = 0x1a000000;
 	const uint64_t bb_offset = 0x1b000000;
 	const size_t bb_size = 4096;
@@ -651,7 +835,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	xe_device_get(fd);
 
 	/* Additional memory for steering control */
-	if (c->flags & SHADER_LOOP)
+	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
 		s_dim.y++;
 	buf = create_uc_buf(fd, s_dim.x, s_dim.y);
 
@@ -674,7 +858,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 				     bb_offset, bb_size);
 	intel_bb_set_lr_mode(ibb, true);
 
-	sip = get_sip(fd);
+	sip = get_sip(fd, c->flags);
 	shader = get_shader(fd, c->flags);
 
 	igt_nsec_elapsed(&ts);
@@ -1275,6 +1459,46 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	online_debug_data_destroy(data);
 }
 
+/**
+ * SUBTEST: single-step
+ * Description:
+ *	Schedules EU workload with 16 nops after breakpoint, then single-steps
+ *	through the shader, advances all threads each step, checking if all
+ *	threads advanced every step.
+ *
+ * SUBTEST: single-step-one
+ * Description:
+ *	Schedules EU workload with 16 nops after breakpoint, then single-steps
+ *	through the shader, advances one thread each step, checking if one
+ *	thread advanced every step. Due to the time constraint, only first two
+ *	shader instructions after breakpoint are validated.
+ */
+static void test_single_step(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+{
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+
+	data = online_debug_data_create(hwe);
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_OPEN,
+					open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_single_step_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_METADATA,
+					create_metadata_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	xe_eudebug_session_run(s);
+	online_session_check(s, s->flags);
+	xe_eudebug_session_destroy(s);
+	online_debug_data_destroy(data);
+}
+
 static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -1340,6 +1564,14 @@ igt_main
 	test_gt_render_or_compute("interrupt-reconnect", fd, hwe)
 		test_interrupt_reconnect(fd, hwe, SHADER_LOOP | TRIGGER_RECONNECT);
 
+	test_gt_render_or_compute("single-step", fd, hwe)
+		test_single_step(fd, hwe, SHADER_SINGLE_STEP | SIP_SINGLE_STEP |
+				 TRIGGER_RESUME_PARALLEL_WALK);
+
+	test_gt_render_or_compute("single-step-one", fd, hwe)
+		test_single_step(fd, hwe, SHADER_SINGLE_STEP | SIP_SINGLE_STEP |
+				 TRIGGER_RESUME_SINGLE_WALK);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

