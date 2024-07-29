Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44A0C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8618210E434;
	Mon, 29 Jul 2024 16:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq4lHQiN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551A910E434
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269152; x=1753805152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Itx+BfdfXm50edYRGL24zxxb7mejNgdcLXa7B9KySWA=;
 b=Oq4lHQiNkX1hs45w5soMD/nawok/fNxFzHudUGknfLaJuywLwUs+jFC2
 f91uDw2ZAu4qBKeBsFr9AC13MJpFQXuk0YzyZmtI/PzvEeMHYdBP0Xcpw
 zUjcElJ1l4VW0A1/Ab2wo7G1JwXPtKxDjXbHM1tkQdiFWDV2Z3e73BZnA
 9CRsUGQSQfCMGV9ne1D7PTZxRcoqjnIMIT3H7Z1O5QjPhl1wTyu9uVH4d
 uuvZSk693jdCT0BlF3OcG01W5qA57hqHz6i0x9y4E39AUG8S5WR5xtEdv
 VlYFLHjRsZkcggxYKt8BCHkc5XDAOD51k3+Ny7wVJAHgpiwqAzWbu098n Q==;
X-CSE-ConnectionGUID: scFYlfE6T5KSgyXur7mYAg==
X-CSE-MsgGUID: mguDSAM8RUe5EBvBsolRBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427945"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427945"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:37 -0700
X-CSE-ConnectionGUID: Kou6vJ/fQeGYLpMBs5vuNQ==
X-CSE-MsgGUID: 1xz/9l+KRlK+xCjbULvgag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739924"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:34 -0700
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
Subject: [PATCH 62/66] tests/xe_eudebug_online: Add caching tests
Date: Mon, 29 Jul 2024 18:01:55 +0200
Message-Id: <20240729160159.37036-63-christoph.manszewski@intel.com>
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

From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>

Add caching tests that write incrementing values to 2-page-long target
surface, poisoning the data one breakpoint before each write instruction
and restoring it when the poisoned instruction breakpoint is hit. Expect
to never see poison values in target surface.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 194 +++++++++++++++++++++++++++++++-
 1 file changed, 192 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index c3c82b061..96129c06a 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -26,6 +26,8 @@
 #define SIP_SINGLE_STEP			(1 << 3)
 #define DISABLE_DEBUG_MODE		(1 << 4)
 #define SHADER_N_NOOP_BREAKPOINT	(1 << 5)
+#define SHADER_CACHING_SRAM		(1 << 6)
+#define SHADER_CACHING_VRAM		(1 << 7)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
 #define TRIGGER_RECONNECT		(1 << 27)
@@ -42,6 +44,10 @@
 #define STEERING_CONTINUE	0x00c0ffee
 #define STEERING_END_LOOP	0xdeadca11
 
+#define CACHING_INIT_VALUE	0xcafe0000
+#define CACHING_POISON_VALUE	0xcafedead
+#define CACHING_VALUE(n)	(CACHING_INIT_VALUE + n)
+
 #define SHADER_CANARY 0x01010101
 
 #define WALKER_X_DIM		4
@@ -103,15 +109,31 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height)
 static int get_number_of_threads(uint64_t flags)
 {
 	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
-		     TRIGGER_RESUME_PARALLEL_WALK))
+		     TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | SHADER_CACHING_VRAM))
 		return 32;
 
 	return 512;
 }
 
+static int caching_get_instruction_count(int fd, uint32_t s_dim__x, int flags)
+{
+	uint64_t memory;
+
+	igt_assert((flags & SHADER_CACHING_SRAM) || (flags & SHADER_CACHING_VRAM));
+
+	if (flags & SHADER_CACHING_SRAM)
+		memory = system_memory(fd);
+	else
+		memory = vram_memory(fd, 0);
+
+	/* each instruction writes to given y offset */
+	return (2 * xe_min_page_size(fd, memory)) / s_dim__x;
+}
+
 static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 {
 	struct dim_t w_dim = walker_dimensions(get_number_of_threads(flags));
+	struct dim_t s_dim = surface_dimensions(get_number_of_threads(flags));
 	static struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(fd);
@@ -135,6 +157,13 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 			gpgpu_shader__nop(shader);
 			gpgpu_shader__breakpoint(shader);
 		}
+	} else if ((flags & SHADER_CACHING_SRAM) || (flags & SHADER_CACHING_VRAM)) {
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__breakpoint(shader);
+		for (int i = 0; i < caching_get_instruction_count(fd, s_dim.x, flags); i++)
+			gpgpu_shader__common_target_write_u32(shader, s_dim.y + i, CACHING_VALUE(i));
+		gpgpu_shader__nop(shader);
+		gpgpu_shader__breakpoint(shader);
 	}
 
 	gpgpu_shader__eot(shader);
@@ -791,6 +820,108 @@ static void create_metadata_trigger(struct xe_eudebug_debugger *d, struct drm_xe
 	}
 }
 
+static void overwrite_immediate_value_in_common_target_write(int vm_fd, uint64_t offset,
+							     uint32_t old_val, uint32_t new_val)
+{
+	uint64_t addr = offset;
+	int vals_changed = 0;
+	uint32_t val;
+
+	while (vals_changed < 4) {
+		igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr), sizeof(uint32_t));
+		if (val == old_val) {
+			igt_debug("val_before_write[%d]: %08x\n", vals_changed, val);
+			igt_assert_eq(pwrite(vm_fd, &new_val, sizeof(uint32_t), addr),
+				      sizeof(uint32_t));
+			igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr),
+				      sizeof(uint32_t));
+			igt_debug("val_before_fsync[%d]: %08x\n", vals_changed, val);
+			fsync(vm_fd);
+			igt_assert_eq(pread(vm_fd, &val, sizeof(uint32_t), addr),
+				      sizeof(uint32_t));
+			igt_debug("val_after_fsync[%d]: %08x\n", vals_changed, val);
+			igt_assert_eq_u32(val, new_val);
+			vals_changed++;
+		}
+		addr += sizeof(uint32_t);
+	}
+}
+
+static void eu_attention_resume_caching_trigger(struct xe_eudebug_debugger *d,
+						struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
+	struct online_debug_data *data = d->ptr;
+	static int counter = 0;
+	static int kernel_in_bb = 0;
+	struct dim_t s_dim = surface_dimensions(get_number_of_threads(d->flags));
+	int val;
+	uint32_t instr_usdw;
+	struct gpgpu_shader *kernel;
+	const uint32_t breakpoint_bit = 1 << 30;
+	struct gpgpu_shader *shader_preamble;
+	struct gpgpu_shader *shader_write_instr;
+
+	shader_preamble = gpgpu_shader_create(d->master_fd);
+	gpgpu_shader__write_dword(shader_preamble, SHADER_CANARY, 0);
+	gpgpu_shader__nop(shader_preamble);
+	gpgpu_shader__breakpoint(shader_preamble);
+
+	shader_write_instr = gpgpu_shader_create(d->master_fd);
+	gpgpu_shader__common_target_write_u32(shader_write_instr, 0, 0);
+
+	if (!kernel_in_bb) {
+		kernel = get_shader(d->master_fd, d->flags);
+		kernel_in_bb = find_kernel_in_bb(kernel, data);
+		gpgpu_shader_destroy(kernel);
+	}
+
+	/* set breakpoint on next write instruction */
+	if (counter < caching_get_instruction_count(d->master_fd, s_dim.x, d->flags)) {
+		igt_assert_eq(pread(data->vm_fd, &instr_usdw, sizeof(instr_usdw),
+				    data->bb_offset + kernel_in_bb + shader_preamble->size * 4 +
+				    shader_write_instr->size * 4 * counter), sizeof(instr_usdw));
+		instr_usdw |= breakpoint_bit;
+		igt_assert_eq(pwrite(data->vm_fd, &instr_usdw, sizeof(instr_usdw),
+				     data->bb_offset + kernel_in_bb + shader_preamble->size * 4 +
+				     shader_write_instr->size * 4 * counter), sizeof(instr_usdw));
+		fsync(data->vm_fd);
+	}
+
+	/* restore current instruction */
+	if (counter && counter <= caching_get_instruction_count(d->master_fd, s_dim.x, d->flags))
+		overwrite_immediate_value_in_common_target_write(data->vm_fd,
+								 data->bb_offset + kernel_in_bb +
+								 shader_preamble->size * 4 +
+								 shader_write_instr->size * 4 * (counter - 1),
+								 CACHING_POISON_VALUE,
+								 CACHING_VALUE(counter - 1));
+
+	/* poison next instruction */
+	if (counter < caching_get_instruction_count(d->master_fd, s_dim.x, d->flags))
+		overwrite_immediate_value_in_common_target_write(data->vm_fd,
+								 data->bb_offset + kernel_in_bb +
+								 shader_preamble->size * 4 +
+								 shader_write_instr->size * 4 * counter,
+								 CACHING_VALUE(counter),
+								 CACHING_POISON_VALUE);
+
+	gpgpu_shader_destroy(shader_write_instr);
+	gpgpu_shader_destroy(shader_preamble);
+
+	for (int i = 0; i < data->target_size; i += sizeof(uint32_t)) {
+		igt_assert_eq(pread(data->vm_fd, &val, sizeof(val), data->target_offset + i),
+			      sizeof(val));
+		igt_assert_f(val != CACHING_POISON_VALUE, "Poison value found at %04d!\n", i);
+	}
+
+	eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
+		      att->exec_queue_handle, att->lrc_handle,
+		      att->bitmask, att->bitmask_size);
+
+	counter++;
+}
+
 static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint32_t vm,
 					       uint64_t offset, uint32_t size)
 {
@@ -806,12 +937,20 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
 	return ibb;
 }
 
+static size_t get_bb_size(int flags)
+{
+	if ((flags & SHADER_CACHING_SRAM) || (flags & SHADER_CACHING_VRAM))
+		return 32768;
+
+	return 4096;
+}
+
 static void run_online_client(struct xe_eudebug_client *c)
 {
 	int threads = get_number_of_threads(c->flags);
 	const uint64_t target_offset = 0x1a000000;
 	const uint64_t bb_offset = 0x1b000000;
-	const size_t bb_size = 4096;
+	const size_t bb_size = get_bb_size(c->flags);
 	struct online_debug_data *data = c->ptr;
 	struct drm_xe_engine_class_instance hwe = data->hwe;
 	struct drm_xe_ext_set_property ext = {
@@ -847,6 +986,9 @@ static void run_online_client(struct xe_eudebug_client *c)
 	/* Additional memory for steering control */
 	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
 		s_dim.y++;
+	/* Additional memory for caching check */
+	if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & SHADER_CACHING_VRAM))
+		s_dim.y += caching_get_instruction_count(fd, s_dim.x, c->flags);
 	buf = create_uc_buf(fd, s_dim.x, s_dim.y);
 
 	buf->addr.offset = target_offset;
@@ -1567,6 +1709,48 @@ static void test_debugger_reopen(int fd, struct drm_xe_engine_class_instance *hw
 	online_debug_data_destroy(data);
 }
 
+/**
+ * SUBTEST: writes-caching-%s
+ * Description:
+ *	Write incrementing values to 2-page-long target surface, poisoning the data one breakpoint
+ *	before each write instruction and restoring it when the poisoned instruction breakpoint
+ *	is hit. Expect to never see poison values in target surface.
+ *
+ *
+ * arg[1]:
+ *
+ * @sram:	Use page size of SRAM
+ * @vram:	Use page size of VRAM
+ */
+static void test_caching(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+{
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+
+	if (flags & SHADER_CACHING_VRAM)
+		igt_skip_on_f(!xe_has_vram(fd), "Device does not have VRAM.\n");
+
+	data = online_debug_data_create(hwe);
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_OPEN,
+					open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_caching_trigger);
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
@@ -1646,6 +1830,12 @@ igt_main
 	test_gt_render_or_compute("debugger-reopen", fd, hwe)
 		test_debugger_reopen(fd, hwe, SHADER_N_NOOP_BREAKPOINT);
 
+	test_gt_render_or_compute("writes-caching-sram", fd, hwe)
+		test_caching(fd, hwe, SHADER_CACHING_SRAM);
+
+	test_gt_render_or_compute("writes-caching-vram", fd, hwe)
+		test_caching(fd, hwe, SHADER_CACHING_VRAM);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

