Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A34D6ED17
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C6410E905;
	Thu, 21 Nov 2024 12:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJFE0exm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D1B10E8FE
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732191830; x=1763727830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mqU/5ef32W6AfiM2o6VPXUlzTw3CACKlL0oCFtjowGE=;
 b=nJFE0exmyPe9z6WvWI3s3JvEldAnKYVHS0APGqx6P/OI44vlurzuH3Ah
 t8tGxeS/2zSoLNHPWwxJ1ck0pOu2+8+XH025gzcMDfLwpBtng+PJXxmv5
 Wg74KD1k8gt9Q6Vzh5fq1FESL1aSWDGJAF15qjDrYOvVV9xIcjMKE7VWX
 vkCP6PoXkbVOfHNtrljh6Ou0kOLRI6dia6i78r5r5TxGut2AcwnV6W2Fp
 xHdZanW+2ycg0EZU8hn3l1IhqOIklkGl+Us9uWHtyxW4xdZQXIfQpnzay
 sz0Z8X893SlXVpReVP1Yd9a/rz/KXT0TMGuE0+h5vp0ugEj7Whq6cWyHB Q==;
X-CSE-ConnectionGUID: GK68MgHySqaFX+VUGJ6xSw==
X-CSE-MsgGUID: EcRvuWwFRI+3WVHJZ9/mkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43365086"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43365086"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:23:50 -0800
X-CSE-ConnectionGUID: efIblh+iRimDM6X61C/O4Q==
X-CSE-MsgGUID: CbjFalApR0mxugS+HVcYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="91052650"
Received: from carterle-desk.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.80])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:23:47 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, christoph.manszewski@intel.com,
 jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t v2 4/4] tests/intel/xe_eudebug_online: Add read/write
 pagefault online tests
Date: Thu, 21 Nov 2024 14:22:29 +0200
Message-ID: <20241121122230.451423-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
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

Add read and write pagefault tests to xe_eudebug_online that checks if a
pagefault event is submitted by the KMD debugger when a pagefault occurs.

Test that read (load instruction) and write(store instruction) attempt to
load or store access to unallocated memory, causing a pagefault.
Examine the address causing the page fault and the number of eu threads
causing the pagefault.

v2: Refactor of output attention bits on pagefault event handling (Andrzej)
    remove / update redudant code (Andrzej, Christoph)
    use igt_container_of() macro (Christoph)

Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 tests/intel/xe_eudebug_online.c | 178 +++++++++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 0ef0d8093..a70d18ee4 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -36,6 +36,8 @@
 #define BB_IN_VRAM			(1 << 11)
 #define TARGET_IN_SRAM			(1 << 12)
 #define TARGET_IN_VRAM			(1 << 13)
+#define SHADER_PAGEFAULT_READ		(1 << 14)
+#define SHADER_PAGEFAULT_WRITE		(1 << 15)
 #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
@@ -45,6 +47,7 @@
 #define TRIGGER_RESUME_DSS		(1 << 30)
 #define TRIGGER_RESUME_ONE		(1 << 31)
 
+#define SHADER_PAGEFAULT	(SHADER_PAGEFAULT_READ | SHADER_PAGEFAULT_WRITE)
 #define BB_REGION_BITMASK	(BB_IN_SRAM | BB_IN_VRAM)
 #define TARGET_REGION_BITMASK	(TARGET_IN_SRAM | TARGET_IN_VRAM)
 
@@ -61,6 +64,8 @@
 #define CACHING_VALUE(n)	(CACHING_INIT_VALUE + (n))
 
 #define SHADER_CANARY 0x01010101
+#define BAD_CANARY 0xf1f1f1f
+#define BAD_OFFSET (0x12345678ull << 12)
 
 #define WALKER_X_DIM		4
 #define WALKER_ALIGNMENT	16
@@ -120,7 +125,7 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height, uint64_t r
 
 static int get_number_of_threads(uint64_t flags)
 {
-	if (flags & SHADER_MIN_THREADS)
+	if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
 		return 16;
 
 	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
@@ -179,6 +184,16 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 			gpgpu_shader__common_target_write_u32(shader, s_dim.y + i, CACHING_VALUE(i));
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__breakpoint(shader);
+	} else if (flags & SHADER_PAGEFAULT) {
+		if (flags & SHADER_PAGEFAULT_READ)
+			gpgpu_shader__read_a64_dword(shader, BAD_OFFSET);
+		else
+			gpgpu_shader__write_a64_dword(shader, BAD_OFFSET, BAD_CANARY);
+
+		gpgpu_shader__label(shader, 0);
+		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
+		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 	}
 
 	gpgpu_shader__eot(shader);
@@ -217,6 +232,16 @@ static int count_set_bits(void *ptr, size_t size)
 	return count;
 }
 
+static int eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, uint32_t size)
+{
+	int count = 0;
+
+	for (int i = 0; i < size / 4 ; i++)
+		count += igt_hweight(a[i] ^ b[i]);
+
+	return count;
+}
+
 static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, uint32_t value)
 {
 	int count = 0;
@@ -636,7 +661,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 		}
 	}
 
-	if (d->flags & SHADER_LOOP) {
+	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
 		uint32_t threads = get_number_of_threads(d->flags);
 		uint32_t val = STEERING_END_LOOP;
 
@@ -746,6 +771,44 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 			data->single_step_bitmask[i] &= ~att->bitmask[i];
 }
 
+static void eu_attention_resume_pagefault_trigger(struct xe_eudebug_debugger *d,
+						  struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_eu_attention *att = igt_container_of(e, att, base);
+	struct online_debug_data *data = d->ptr;
+	uint32_t bitmask_size = att->bitmask_size;
+	uint8_t *bitmask;
+
+	if (data->last_eu_control_seqno > att->base.seqno)
+		return;
+
+	bitmask = calloc(1, att->bitmask_size);
+	igt_assert(bitmask);
+
+	eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
+		       att->lrc_handle, bitmask, &bitmask_size);
+	igt_assert(bitmask_size == att->bitmask_size);
+
+	pthread_mutex_lock(&data->mutex);
+
+	if (d->flags & SHADER_PAGEFAULT) {
+		uint32_t threads = get_number_of_threads(d->flags);
+		uint32_t val = STEERING_END_LOOP;
+
+		igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
+				     data->target_offset + steering_offset(threads)),
+			      sizeof(uint32_t));
+		fsync(data->vm_fd);
+	}
+	pthread_mutex_unlock(&data->mutex);
+
+	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
+						    att->exec_queue_handle, att->lrc_handle,
+						    bitmask, att->bitmask_size);
+
+	free(bitmask);
+}
+
 static void open_trigger(struct xe_eudebug_debugger *d,
 			 struct drm_xe_eudebug_event *e)
 {
@@ -1015,7 +1078,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	struct intel_bb *ibb;
 	struct intel_buf *buf;
 	uint32_t *ptr;
-	int fd;
+	int fd, vm_flags;
 
 	metadata[0] = calloc(2, sizeof(*metadata));
 	metadata[1] = calloc(2, sizeof(*metadata));
@@ -1025,7 +1088,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	fd = xe_eudebug_client_open_driver(c);
 
 	/* Additional memory for steering control */
-	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
+	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
 		s_dim.y++;
 	/* Additional memory for caching check */
 	if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & SHADER_CACHING_VRAM))
@@ -1045,7 +1108,11 @@ static void run_online_client(struct xe_eudebug_client *c)
 							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
 							   2 * sizeof(*metadata), metadata[1]);
 
-	create.vm_id = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
+	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
+
+	create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
+
 	xe_eudebug_client_exec_queue_create(c, fd, &create);
 
 	ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, create.vm_id, bb_offset, bb_size,
@@ -1245,11 +1312,13 @@ match_attention_with_exec_queue(struct xe_eudebug_event_log *log,
 static void online_session_check(struct xe_eudebug_session *s, int flags)
 {
 	struct drm_xe_eudebug_event_eu_attention *ea = NULL;
+	struct drm_xe_eudebug_event_pagefault *pf = NULL;
 	struct drm_xe_eudebug_event *event = NULL;
 	struct online_debug_data *data = s->client->ptr;
 	bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
 	int sum = 0;
 	int bitmask_size;
+	int pagefault_threads = 0;
 
 	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
 					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
@@ -1265,6 +1334,17 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 			igt_assert_eq(ea->bitmask_size, bitmask_size);
 			sum += count_set_bits(ea->bitmask, bitmask_size);
 			igt_assert(match_attention_with_exec_queue(s->debugger->log, ea));
+		} else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
+			uint32_t after_offset = bitmask_size / sizeof(uint32_t);
+			uint32_t resolved_offset = bitmask_size / sizeof(uint32_t) * 2;
+			uint32_t *ptr = NULL;
+
+			pf = igt_container_of(event, pf, base);
+			ptr = (uint32_t *) pf->bitmask;
+			igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
+			pagefault_threads += eu_attentions_xor_count(ptr + after_offset,
+								     ptr + resolved_offset,
+								     bitmask_size);
 		}
 	}
 
@@ -1279,6 +1359,9 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 		igt_assert(sum > 0);
 	else
 		igt_assert(sum == 0);
+
+	if (flags & SHADER_PAGEFAULT)
+		igt_assert(pagefault_threads > 0);
 }
 
 static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
@@ -1302,6 +1385,43 @@ static void ufence_ack_set_bp_trigger(struct xe_eudebug_debugger *d,
 	}
 }
 
+static void pagefault_trigger(struct xe_eudebug_debugger *d,
+			      struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_pagefault *pf = igt_container_of(e, pf, base);
+	uint32_t attn_size = pf->bitmask_size / 3;
+	int attn_size_as_u32 = attn_size / sizeof(uint32_t);
+	uint32_t *ptr = (uint32_t *) pf->bitmask;
+	uint32_t *ptrs[3] = {ptr, ptr + attn_size_as_u32, ptr + 2 * attn_size_as_u32};
+	const char * const name[3] = {"before", "after", "resolved"};
+	int threads[3], pagefault_threads, idx;
+
+	for (idx = 0; idx < 3; idx++)
+		threads[idx] = count_set_bits(ptrs[idx], attn_size);
+
+	pagefault_threads = eu_attentions_xor_count(ptrs[1], ptrs[2], attn_size);
+
+	igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
+		  "resolved=%d, pagefault=%d] "
+		  "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d], "
+		  "pagefault_address[0x%llx]\n",
+		  pf->base.seqno, threads[0], threads[1], threads[2],
+		  pagefault_threads, pf->client_handle, pf->exec_queue_handle,
+		  pf->lrc_handle, pf->bitmask_size,
+		  pf->pagefault_address);
+
+	for (idx = 0; idx < 3; idx++) {
+		igt_debug("=== Attentions %s ===\n", name[idx]);
+
+		for (uint32_t i = 0; i < attn_size_as_u32; i += 2)
+			igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
+				  ptrs[idx][i], ptrs[idx][i + 1]);
+	}
+
+	igt_assert(pagefault_threads > 0);
+	igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
+}
+
 /**
  * SUBTEST: basic-breakpoint
  * Description:
@@ -1383,6 +1503,49 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
 	online_debug_data_destroy(data);
 }
 
+/**
+ * SUBTEST: pagefault-read
+ * Description:
+ *     Check whether KMD sends pagefault event for workload in debug mode that
+ *     triggers a read pagefault.
+ *
+ * SUBTEST: pagefault-write
+ * Description:
+ *     Check whether KMD sends pagefault event for workload in debug mode that
+ *     triggers a write pagefault.
+ */
+static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
+				  int flags)
+{
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+
+	data = online_debug_data_create(hwe);
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+					open_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+					exec_queue_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_pagefault_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+					create_metadata_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
+					pagefault_trigger);
+
+	xe_eudebug_session_run(s);
+	online_session_check(s, s->flags);
+
+	xe_eudebug_session_destroy(s);
+	online_debug_data_destroy(data);
+}
+
 /**
  * SUBTEST: preempt-breakpoint
  * Description:
@@ -2344,6 +2507,11 @@ igt_main
 	igt_subtest("breakpoint-many-sessions-tiles")
 		test_many_sessions_on_tiles(fd, true);
 
+	test_gt_render_or_compute("pagefault-read", fd, hwe)
+		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
+	test_gt_render_or_compute("pagefault-write", fd, hwe)
+		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.46.1

