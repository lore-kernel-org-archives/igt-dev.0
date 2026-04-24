Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1040FE520B
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 11:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF1410F4DB;
	Fri, 24 Apr 2026 11:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnbfCtsc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCBF10F46B
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777029377; x=1808565377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EteDVr7s7JofdpKTAjbtSRbK+BWqgM2NeXCRFUW9UV8=;
 b=WnbfCtscGBGEpsdfYd/VgGFzkERD1MdlEHze1YI0jLa3gvjFqKAP4K7o
 dd5aJhVVU9KjKFfjPJtxZ96JmY2E9xek15yhou+YJ9g2kMe7cjWaV8Q1w
 EvYfvA3lJIj/4Ef1F8avdEgiT+s0XDNkmaSlYVaCP5e2zWVWGDa+U+h+l
 wUa06GdPAcaNLqjyhCr0IORnqu9nlSTyiH7qD5Mv9tIwBttojkU/rLVHW
 oncC6Ak6wk1XfkGJd1hYevd4EuWeffmoGhbSAKkNl/nrHYyb9N/kyfAmx
 A3EzJJlNDmNEcYkQgGU5zNqsxFk50dIzxOrxs2VwW2KS6y0Nv7iO2vH4D Q==;
X-CSE-ConnectionGUID: SBJnnWkQT8ScOu/qIhk5MA==
X-CSE-MsgGUID: R87MAZ4DQFO9TrxHHAZqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="80591674"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="80591674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 04:16:17 -0700
X-CSE-ConnectionGUID: XfhwCE4WR2mLHPtFoEglhg==
X-CSE-MsgGUID: a0WZE2ebRJaDpxONn+uttQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="237926279"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 mpatelcz-mobl.intel.com) ([10.245.245.96])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 04:16:15 -0700
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mika.kuoppala@linux.intel.com, dominik.karol.piatkowski@intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_eudebug_online: Pagefault workaround
 redesigned
Date: Fri, 24 Apr 2026 13:16:05 +0200
Message-ID: <20260424111605.3946016-1-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
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

* For Pagefault tests SIP writes canary so then the eudebugger can
verify if thread entered SIP.
* Updated calculation of expected SIP threads and pagefault threads.
* For PF write, added read faulty address after write.

Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 tests/intel/xe_eudebug_online.c | 93 +++++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 22 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 928a82624..0c6bf2ccc 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -71,9 +71,10 @@
 
 #define SIGTERM_COUNT		50
 
-#define SHADER_CANARY 0x01010101
-#define BAD_CANARY 0xf1f1f1f
-#define BAD_OFFSET (0x12345678ull << 12)
+#define SHADER_CANARY	0x01010101
+#define SIP_CANARY	0x02020202
+#define BAD_CANARY	0xf1f1f1f
+#define BAD_OFFSET	(0x12345678ull << 12)
 
 #define WALKER_X_DIM		4
 #define WALKER_ALIGNMENT	16
@@ -149,6 +150,7 @@ struct online_debug_data {
 	struct drm_xe_engine_class_instance hwe;
 	uint64_t flags;
 	int thread_count;
+	uint32_t num_threads_in_tg;
 	/* client out */
 	int thread_hit_count;
 	/* debugger internals */
@@ -170,6 +172,7 @@ struct online_debug_data {
 	struct drm_xe_eudebug_event *exception_event;
 	int att_event_counter;
 	uint32_t pf_thread_number;
+	uint32_t threads_in_sip;
 	int num_threads_per_eu;
 	int max_subslices_per_slice;
 	struct dim_t w_dim;
@@ -253,11 +256,12 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
 		gpgpu_shader__nop(shader);
 		gpgpu_shader__breakpoint(shader);
 	} else if (data->flags & SHADER_PAGEFAULT) {
-		if (data->flags & SHADER_PAGEFAULT_READ)
+		if (data->flags & SHADER_PAGEFAULT_READ) {
 			gpgpu_shader__read_a64_d32(shader, BAD_OFFSET);
-		else if (data->flags & SHADER_PAGEFAULT_WRITE)
+		} else if (data->flags & SHADER_PAGEFAULT_WRITE) {
 			gpgpu_shader__write_a64_d32(shader, BAD_OFFSET, BAD_CANARY);
-		else if (data->flags & SHADER_PAGEFAULT_ONE_OF_MANY)
+			gpgpu_shader__read_a64_d32(shader, BAD_OFFSET);
+		} else if (data->flags & SHADER_PAGEFAULT_ONE_OF_MANY) {
 			emit_iga64_code(shader, pagefault_one_of_many, R"(
 #if GEN_VER >= 2000
 	// prepare load descriptor for page-faulting address
@@ -273,7 +277,7 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
 (f0.0)	send.ugm (1) r31 r30 null 0x0 0x2128403 // load_block2d.ugm.d32t.a64.uc.uc
 #endif
 			)", data->pf_thread_number);
-
+		}
 		gpgpu_shader__label(shader, 0);
 		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
 		gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
@@ -285,22 +289,32 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
 	return shader;
 }
 
+static void sip_pagefault(struct online_debug_data *data,
+			  struct gpgpu_shader *sip)
+{
+	if (data->flags & SHADER_PAGEFAULT_READ ||
+	    data->flags & SHADER_PAGEFAULT_WRITE)
+		gpgpu_shader__write_dword(sip, SIP_CANARY, 0);
+	else /* PAGEFAULT_ONE_OF_MANY */
+		emit_iga64_code(sip, store_sr0_0, R"(
+#if GEN_VER >= 2000
+				mov (1) r5.0<1>:ud sr0.0:ud
+				SET_THREAD_SPACE_ADDR(r4, 0:ud, 0:ud, 4)
+				(W) STORE_SPACE_DW(r4, r5)
+#endif
+			)");
+}
+
 static struct gpgpu_shader *get_sip(struct online_debug_data *data)
 {
 	struct dim_t w_dim = walker_dimensions(data->thread_count);
 	static struct gpgpu_shader *sip;
 
 	sip = gpgpu_shader_create(data->drm_fd);
-	if (!(data->flags & SHADER_PAGEFAULT_ONE_OF_MANY))
-		gpgpu_shader__write_aip(sip, 0);
+	if (data->flags & SHADER_PAGEFAULT)
+		sip_pagefault(data, sip);
 	else
-		emit_iga64_code(sip, store_sr0_0, R"(
-#if GEN_VER >= 2000
-	mov (1) r5.0<1>:ud sr0.0:ud
-	SET_THREAD_SPACE_ADDR(r4, 0, 0:ud, 4)
-	STORE_SPACE_DW(r4, r5)
-#endif
-			)");
+		gpgpu_shader__write_aip(sip, 0);
 
 	gpgpu_shader__wait(sip);
 	if (data->flags & SIP_SINGLE_STEP)
@@ -1123,6 +1137,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 	shader = get_shader(data);
 	bb_size = get_bb_size(c->fd, shader);
 
+	data->num_threads_in_tg = shader->num_threads_in_tg;
+
 	/* Additional memory for steering control */
 	if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c->flags & SHADER_PAGEFAULT)
 		s_dim.y++;
@@ -1320,6 +1336,7 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 	int sum = 0;
 	int bitmask_size;
 	int pagefault_threads = 0;
+	int threads_resolved = 0;
 
 	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
 					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_DEBUG_DATA |
@@ -1346,6 +1363,7 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 			pagefault_threads += eu_attentions_xor_count(ptr + after_offset,
 								     ptr + resolved_offset,
 								     bitmask_size);
+			threads_resolved = igt_bitmap_hweight(ptr + resolved_offset, bitmask_size * 8);
 		}
 	}
 
@@ -1361,13 +1379,24 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 	else
 		igt_assert(sum == 0);
 
-	if (flags & SHADER_PAGEFAULT)
-		igt_assert(pagefault_threads > 0);
+	if (flags & SHADER_PAGEFAULT) {
+		/*
+		 * With num_threads_in_tg > 1 not all data->thread_count may start
+		 * as it may reach physical number of threads.
+		 * The limit is get_maximum_number_of_threads(data->drm_fd);
+		 * So for limit 1280 and TG 64 we may get as much as 18 threads in SIP.
+		 */
+
+		igt_assert_eq_u32(data->threads_in_sip * data->num_threads_in_tg,
+				  (uint32_t)threads_resolved);
+		igt_assert_lte_u32(data->threads_in_sip, data->thread_count);
+		igt_assert(pagefault_threads > 0);
+		igt_assert_lte(pagefault_threads, data->thread_count * data->num_threads_in_tg);
 
-	if (flags & SHADER_PAGEFAULT_ONE_OF_MANY) {
-		igt_assert_eq(pagefault_threads, 1);
-		igt_assert_eq(data->thread_hit_count, 1);
 	}
+
+	if (flags & SHADER_PAGEFAULT_ONE_OF_MANY)
+		igt_assert_eq(data->thread_hit_count, 1);
 }
 
 static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
@@ -1448,7 +1477,25 @@ static void pagefault_trigger(struct xe_eudebug_debugger *d,
 				  ptrs[idx][i], ptrs[idx][i + 1]);
 	}
 
-	igt_assert(pagefault_threads > 0);
+	for (uint32_t i = 0; i < data->thread_count; i++) {
+		offset = get_thread_space_address(data, i);
+		igt_for_milliseconds(1) {
+			igt_assert_eq(pread(data->vm_fd, &sr0_0, sizeof(sr0_0), offset), sizeof(sr0_0));
+			/* ONE_OF_MANY testcase transfers sr0.0 register. Others write canary */
+			if (data->flags & SHADER_PAGEFAULT_ONE_OF_MANY) {
+				if (sr0_0) {
+					data->threads_in_sip++;
+					break;
+				}
+			} else {
+				if (sr0_0 == SIP_CANARY) {
+					data->threads_in_sip++;
+					break;
+				}
+			}
+		}
+	}
+
 	igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
 
 	if (!(data->flags & SHADER_PAGEFAULT_ONE_OF_MANY))
@@ -1729,6 +1776,8 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
+	if (flags & SHADER_PAGEFAULT)
+		data->thread_count = getenv_int("IGT_PF_THREADS", get_number_of_threads(data));
 	if (flags & SHADER_PAGEFAULT_ONE_OF_MANY) {
 		uint32_t max_ss, max_sl;
 
-- 
2.43.0

