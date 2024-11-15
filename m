Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFE2D637CE
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 14:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4966510E867;
	Fri, 15 Nov 2024 14:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZX3hJG9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A1C10E865
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731679951; x=1763215951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cI6oFSLhlWlDzRIlrqlOv9IYUq7w6sejrua9O/AXKJ4=;
 b=HZX3hJG9uye/R7EQ8nF0OG81CDSSWP1OLdu1JAshGyvctTXOkdP1Jnc2
 3M9Ad5ddigglLZyQFFTNgYKOGS9JxMy1iEVf3tMCJPS7P/ULV28avNd5t
 3XKhox+6X6y85XqjmFUd6B9sZV/tnGqYOvcflLOVQ/oHoQ2endI3I4ivb
 XnP5u2+OJQSxtBzRYiTtLu7WOcHPUPKm4Pxo2gFzX8gMcYyjfEeR/H9rB
 LHJ+MbSMB9XQBkNsO30k1pfRnmRph9p68ps0nqEH+aIC1CTLcYg7vkM9r
 J7Fqp2zvubann+fg4ghPXNxlK7ZYBk4qOrQhN3ftoW5DBfzJCJpRWHdXb w==;
X-CSE-ConnectionGUID: 8GEc8zW4SDKbQqK9+QrLUw==
X-CSE-MsgGUID: fNj53A8AR8OSUglEEjnQnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31822551"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31822551"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:12:31 -0800
X-CSE-ConnectionGUID: U2MFpExJREGpAiK3ZyH28A==
X-CSE-MsgGUID: nZqfx5uJRnG+T8YQI7M9YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88979987"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.245.246.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 06:12:29 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, mika.kuoppala@intel.com,
 dominik.grzegorzek@intel.com
Subject: [PATCH i-g-t 4/4] tests/intel/xe_eudebug_online: Add read/write
 pagefault online tests
Date: Fri, 15 Nov 2024 16:11:32 +0200
Message-ID: <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
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

Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 tests/intel/xe_eudebug_online.c | 219 +++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 0ef0d8093..eae0eb520 100644
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
@@ -123,6 +128,9 @@ static int get_number_of_threads(uint64_t flags)
 	if (flags & SHADER_MIN_THREADS)
 		return 16;
 
+	if (flags & SHADER_PAGEFAULT)
+		return 16;
+
 	if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
 		     TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | SHADER_CACHING_VRAM))
 		return 32;
@@ -179,6 +187,16 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 			gpgpu_shader__common_target_write_u32(shader, s_dim.y + i, CACHING_VALUE(i));
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__breakpoint(shader);
+	} else if (flags & SHADER_PAGEFAULT) {
+		if (flags & SHADER_PAGEFAULT_READ)
+			gpgpu_shader__read_page_fault(shader, BAD_OFFSET);
+		else if (flags & SHADER_PAGEFAULT_WRITE)
+			gpgpu_shader__write_offset(shader, BAD_OFFSET, BAD_CANARY);
+
+		gpgpu_shader__label(shader, 0);
+		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
+		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
+		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 	}
 
 	gpgpu_shader__eot(shader);
@@ -217,6 +235,17 @@ static int count_set_bits(void *ptr, size_t size)
 	return count;
 }
 
+static int
+eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, uint32_t size)
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
@@ -636,7 +665,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 		}
 	}
 
-	if (d->flags & SHADER_LOOP) {
+	if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
 		uint32_t threads = get_number_of_threads(d->flags);
 		uint32_t val = STEERING_END_LOOP;
 
@@ -746,6 +775,43 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
 			data->single_step_bitmask[i] &= ~att->bitmask[i];
 }
 
+static void eu_attention_resume_pagefault_trigger(struct xe_eudebug_debugger *d,
+						  struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
+	struct online_debug_data *data = d->ptr;
+	uint32_t bitmask_size = att->bitmask_size;
+	uint8_t *bitmask;
+
+	if (data->last_eu_control_seqno > att->base.seqno)
+		return;
+
+	bitmask = calloc(1, att->bitmask_size);
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
@@ -1015,7 +1081,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	struct intel_bb *ibb;
 	struct intel_buf *buf;
 	uint32_t *ptr;
-	int fd;
+	int fd, vm_flags;
 
 	metadata[0] = calloc(2, sizeof(*metadata));
 	metadata[1] = calloc(2, sizeof(*metadata));
@@ -1025,7 +1091,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	fd = xe_eudebug_client_open_driver(c);
 
 	/* Additional memory for steering control */
-	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
+	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
 		s_dim.y++;
 	/* Additional memory for caching check */
 	if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & SHADER_CACHING_VRAM))
@@ -1045,7 +1111,11 @@ static void run_online_client(struct xe_eudebug_client *c)
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
@@ -1245,11 +1315,14 @@ match_attention_with_exec_queue(struct xe_eudebug_event_log *log,
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
+	uint32_t *ptr = NULL;
 
 	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
 					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
@@ -1265,6 +1338,16 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 			igt_assert_eq(ea->bitmask_size, bitmask_size);
 			sum += count_set_bits(ea->bitmask, bitmask_size);
 			igt_assert(match_attention_with_exec_queue(s->debugger->log, ea));
+		} else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
+			uint32_t after_offset = bitmask_size / sizeof(uint32_t);
+			uint32_t resolved_offset = bitmask_size / sizeof(uint32_t) * 2;
+
+			pf = (struct drm_xe_eudebug_event_pagefault *)event;
+			ptr = (uint32_t *) pf->bitmask;
+			igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
+			pagefault_threads += eu_attentions_xor_count(ptr + after_offset,
+								     ptr + resolved_offset,
+								     bitmask_size);
 		}
 	}
 
@@ -1279,6 +1362,9 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 		igt_assert(sum > 0);
 	else
 		igt_assert(sum == 0);
+
+	if (flags & SHADER_PAGEFAULT)
+		igt_assert(pagefault_threads > 0);
 }
 
 static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
@@ -1302,6 +1388,55 @@ static void ufence_ack_set_bp_trigger(struct xe_eudebug_debugger *d,
 	}
 }
 
+static void pagefault_trigger(struct xe_eudebug_debugger *d,
+			      struct drm_xe_eudebug_event *e)
+{
+	struct drm_xe_eudebug_event_pagefault *pf = (void *) e;
+	int before_threads, after_threads, resolved_threads, pagefault_threads;
+	uint32_t attn_size = pf->bitmask_size / 3;
+	uint32_t *ptr = (uint32_t *) pf->bitmask;
+	uint32_t offset, before_offset = 0;
+	uint32_t after_offset = attn_size / sizeof(uint32_t);
+	uint32_t resolved_offset = attn_size / sizeof(uint32_t) * 2;
+
+	before_threads = count_set_bits(ptr + before_offset, attn_size);
+	after_threads = count_set_bits(ptr + after_offset, attn_size);
+	resolved_threads = count_set_bits(ptr + resolved_offset, attn_size);
+
+	pagefault_threads = eu_attentions_xor_count(ptr + after_offset,
+						    ptr + resolved_offset,
+						    attn_size);
+
+	igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
+		  "resolved=%d, pagefault=%d] "
+		  "client[%llu], exec_queue[%llu], lrc[%llu], bitmask_size[%d], "
+		  "pagefault_address[0x%llx]\n",
+		  pf->base.seqno, before_threads, after_threads, resolved_threads,
+		  pagefault_threads, pf->client_handle, pf->exec_queue_handle,
+		  pf->lrc_handle, pf->bitmask_size,
+		  pf->pagefault_address);
+
+	for (int idx = 0; idx < 3; idx++) {
+		if (idx == 0) {
+			igt_debug("=== Attentions before ===\n");
+			offset = before_offset;
+		} else if (idx == 1) {
+			igt_debug("=== Attentions after ===\n");
+			offset = after_offset;
+		} else {
+			igt_debug("=== Attentions resolved ===\n");
+			offset = resolved_offset;
+		}
+
+		for (uint32_t i = 0; i < attn_size / sizeof(uint32_t); i += 2)
+			igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
+				  ptr[offset + i], ptr[offset + i + 1]);
+	}
+
+	igt_assert(pagefault_threads > 0);
+	igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
+}
+
 /**
  * SUBTEST: basic-breakpoint
  * Description:
@@ -1383,6 +1518,77 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
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
+	uint32_t val;
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
+	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
+	xe_eudebug_debugger_start_worker(s->debugger);
+	xe_eudebug_client_start(s->client);
+
+	/* wait for workload to start */
+	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
+		/* collect needed data from triggers */
+		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
+			continue;
+
+		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
+			if (val != 0)
+				break;
+	}
+
+	pthread_mutex_lock(&data->mutex);
+	igt_assert(data->client_handle != -1);
+	igt_assert(data->exec_queue_handle != -1);
+
+	pthread_mutex_unlock(&data->mutex);
+
+	xe_eudebug_client_wait_done(s->client);
+
+	xe_eudebug_debugger_stop_worker(s->debugger, 1);
+
+	xe_eudebug_event_log_print(s->debugger->log, true);
+	xe_eudebug_event_log_print(s->client->log, true);
+
+	online_session_check(s, s->flags);
+
+	xe_eudebug_session_destroy(s);
+	online_debug_data_destroy(data);
+}
+
 /**
  * SUBTEST: preempt-breakpoint
  * Description:
@@ -2344,6 +2550,11 @@ igt_main
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

