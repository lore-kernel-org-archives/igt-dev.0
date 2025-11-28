Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95169D116FC
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13B510E91B;
	Fri, 28 Nov 2025 14:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITLQueu8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C72610E91B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339278; x=1795875278;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CAsSDRp4Wxc1GrAoih88iKiJU5Juv1iZagyx6zodo7E=;
 b=ITLQueu8aUIjFknbf0FJx10c+X/JXaqDC1LdyojhoSA+Y1VBC8G4umoU
 tLCvqbVm6GPfiFhWN5NWMcQy5dZKZ5JD/OriZMqob3IejjrRofQenTXwJ
 1qjnpSHl+iGzbnA3w9Mf/kzeT42s1rN1C3fi2C0kDKStM6XjWAF8MhL2G
 BAnXNK69otCw/ZQIITE4ZkRmwaGaw/DrQF0lDZMbMfQVOZi8J8UPcaMBF
 PO50CAijNZx1BBrNP8BqZTu/wcNungU7Z1+8+nffHcQnwJjhFDWzG7ouP
 a6dQ9uAx/R2XEDuJxIY7jikeeku2MsopeAADJNAisGyx04IWoLkVIqVby Q==;
X-CSE-ConnectionGUID: B2IsccJuTceElMZofQY3Qg==
X-CSE-MsgGUID: qqjklGaBSX6582Uc6i0lqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261631"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:38 -0800
X-CSE-ConnectionGUID: EovmXMz6SGa1d/qqF3tv7Q==
X-CSE-MsgGUID: D9D3MW3nS6iMjD90N7tR8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173715"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:37 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:15 +0100
Subject: [PATCH 11/11] tests/intel/xe_eudebug_online: add
 pagefault-one-of-many test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-11-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=12866;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=CAsSDRp4Wxc1GrAoih88iKiJU5Juv1iZagyx6zodo7E=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa33G/e4hcRXk4bxMfidehTy5NefPaUIVhwod
 4srhspkhLmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt9wAKCRAjYrKT3hD9
 1wwyC/kB/sGmRs00ncEA/sWVzfCEjebAeMiLR+GoK9XI0sPukJlCOhJZRACjgrWTW1Sw9ELohCm
 P6V/KFH7tn6ZH48RaH2YiRCeAJy8pwU5imNVGHOCZR1XPxJqzmMd6RSbyqA65/8M6i8E7dqRhbM
 OtVtotGmUtP1S/rnZkZT3Cu8pRFtOycEC8KLn2L/K8jLWXj+OKKbiGdxSEpcORtjx0QxgL96pKO
 Qgqc64CtIeHaJOPvBxHFiJLAHIFgId8DjJw94Odx5nFX2SK15MXSN7WjikRpDxxqv3fWjqG4T6A
 VKS42xlXqtEzWcRmltwHyDzhzUa2yAvEAhZT6AjBJAhXK4AIINIUl4nbDq1AK1IM9ZMNCl2+VFA
 xdduHMVFuvBAKGh9dIWeqr5Mo7P49On/WsVQrfkC/rLwyRCK1qaMxoZebM91xTJSXsUxIm3uA0o
 nxwu0i6iN3P/IOilwlJ29ndMZiitBXiMymwg0Qiu89crF1uT03YIWGZM1Bpo4SH4WL2do=
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

In case of Xe2/Xe3 platforms idendtification of EU thread causing
pagefault is not supported by hardware. Instead special software flow
is used. pagefault-one-of-many verifies if culprit thread is identified
correctly by this flow.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/meson.build                                   |   2 +-
 tests/intel/xe_eudebug_online.c                   | 138 +++++++++++++++++++++-
 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c |  43 +++++++
 3 files changed, 177 insertions(+), 6 deletions(-)

diff --git a/lib/meson.build b/lib/meson.build
index 65b6a79ffce8..c17a4bc0c708 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -246,7 +246,7 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
 		      fallback : 'NO-GIT',
 		      command : vcs_command )
 
-iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c' ]
+iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c', '../tests/intel/xe_eudebug_online.c' ]
 libiga64_asms = static_library('iga64_asms',
 	iga64_assembly_sources,
 	include_directories: inc,
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index cd833ba37f92..a7dc3c598a51 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -41,6 +41,7 @@
 #define SHADER_PAGEFAULT_WRITE		(1 << 15)
 #define FAULTABLE_VM			(1 << 16)
 #define PAGEFAULT_STRESS_TEST		(1 << 17)
+#define SHADER_PAGEFAULT_ONE_OF_MANY	(1 << 18)
 #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
@@ -50,7 +51,8 @@
 #define TRIGGER_RESUME_DSS		(1 << 30)
 #define TRIGGER_RESUME_ONE		(1 << 31)
 
-#define SHADER_PAGEFAULT	(SHADER_PAGEFAULT_READ | SHADER_PAGEFAULT_WRITE)
+#define SHADER_PAGEFAULT	(SHADER_PAGEFAULT_READ | SHADER_PAGEFAULT_WRITE | \
+				 SHADER_PAGEFAULT_ONE_OF_MANY)
 #define BB_REGION_BITMASK	(BB_IN_SRAM | BB_IN_VRAM)
 #define TARGET_REGION_BITMASK	(TARGET_IN_SRAM | TARGET_IN_VRAM)
 
@@ -167,10 +169,17 @@ struct online_debug_data {
 	int last_eu_control_seqno;
 	struct drm_xe_eudebug_event *exception_event;
 	int att_event_counter;
+	uint32_t pf_thread_number;
+	int num_threads_per_eu;
+	int max_subslices_per_slice;
+	struct dim_t w_dim;
 };
 
 static int get_number_of_threads(struct online_debug_data *data)
 {
+	if (data->flags & SHADER_PAGEFAULT_ONE_OF_MANY)
+		return xe_query_eu_thread_count(data->drm_fd, 0);
+
 	if (data->flags & (PAGEFAULT_STRESS_TEST))
 		return get_maximum_number_of_threads(data->drm_fd);
 
@@ -246,8 +255,24 @@ static struct gpgpu_shader *get_shader(struct online_debug_data *data)
 	} else if (data->flags & SHADER_PAGEFAULT) {
 		if (data->flags & SHADER_PAGEFAULT_READ)
 			gpgpu_shader__read_a64_d32(shader, BAD_OFFSET);
-		else
+		else if (data->flags & SHADER_PAGEFAULT_WRITE)
 			gpgpu_shader__write_a64_d32(shader, BAD_OFFSET, BAD_CANARY);
+		else if (data->flags & SHADER_PAGEFAULT_ONE_OF_MANY)
+			emit_iga64_code(shader, pagefault_one_of_many, R"(
+#if GEN_VER >= 2000
+	// prepare load descriptor for page-faulting address
+	mov (8) r30.0<1>:uq 0x0:uq
+	mov (1) r30.0<1>:uq 0x12345678000:uq // PF address
+	mov (1) r30.2<1>:ud 0x3f:ud
+	mov (1) r30.4<1>:ud 0x3f:ud
+	mov (1) r30.7<1>:ud 0x3:ud // 4 bytes
+	// calculate thread id: r20.0 = dim.x * tgid.y + tgid.x
+	mad (1) r20.0<1>:ud r0.1<0;0>:ud r0.6<0;0>:ud r1.4<0>:ud
+	// page-fault only for arbitrary thread
+	cmp (1) (eq)f0.0 null<1>:ud r20.0<0;1,0>:ud ARG(0):ud
+(f0.0)	send.ugm (1) r31 r30 null 0x0 0x2128403 // load_block2d.ugm.d32t.a64.uc.uc
+#endif
+			)", data->pf_thread_number);
 
 		gpgpu_shader__label(shader, 0);
 		gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
@@ -266,7 +291,16 @@ static struct gpgpu_shader *get_sip(struct online_debug_data *data)
 	static struct gpgpu_shader *sip;
 
 	sip = gpgpu_shader_create(data->drm_fd);
-	gpgpu_shader__write_aip(sip, 0);
+	if (!(data->flags & SHADER_PAGEFAULT_ONE_OF_MANY))
+		gpgpu_shader__write_aip(sip, 0);
+	else
+		emit_iga64_code(sip, store_sr0_0, R"(
+#if GEN_VER >= 2000
+	mov (1) r5.0<1>:ud sr0.0:ud
+	SET_THREAD_SPACE_ADDR(r4, 0, 0:ud, 4)
+	STORE_SPACE_DW(r4, r5)
+#endif
+			)");
 
 	gpgpu_shader__wait(sip);
 	if (data->flags & SIP_SINGLE_STEP)
@@ -425,6 +459,7 @@ online_debug_data_create(int drm_fd, struct drm_xe_engine_class_instance *hwe, u
 	data->lrc_handle = -1ULL;
 	data->vm_fd = -1;
 	data->stepped_threads_count = -1;
+	data->w_dim = walker_dimensions(data->thread_count);
 
 	return data;
 }
@@ -1352,6 +1387,11 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 
 	if (flags & SHADER_PAGEFAULT)
 		igt_assert(pagefault_threads > 0);
+
+	if (flags & SHADER_PAGEFAULT_ONE_OF_MANY) {
+		igt_assert_eq(pagefault_threads, 1);
+		igt_assert_eq(data->thread_hit_count, 1);
+	}
 }
 
 static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
@@ -1375,16 +1415,40 @@ static void ufence_ack_set_bp_trigger(struct xe_eudebug_debugger *d,
 	}
 }
 
+static uint32_t attn_to_sr0_0(struct online_debug_data *data, int att_nr)
+{
+	uint32_t tid, eu, dss, sl, ss;
+	bool extended = data->num_threads_per_eu > 8;
+
+	/* Calculate dss/eu/tid from attention number, Bspec: 56831, 73459. */
+	/* Return sr0_0 register corresponding fields, Bspec: 56623. */
+	tid = (att_nr & 7) | (extended ? (att_nr & 64) >> 3 : 0);
+	eu = (att_nr >> 3) & 7;
+	dss = att_nr >> (extended ? 7 : 6);
+	ss = dss % data->max_subslices_per_slice;
+	sl = dss / data->max_subslices_per_slice;
+	return tid + (eu << 4) + (ss << 8) + (sl << (extended ? 14 : 11));
+}
+
+static uint32_t get_thread_space_address(struct online_debug_data *data, int thread)
+{
+	int x = thread % data->w_dim.x, y = thread / data->w_dim.x;
+
+	return data->target_offset + 4 * (y * ALIGN(data->w_dim.x, data->w_dim.alignment) + x);
+}
+
 static void pagefault_trigger(struct xe_eudebug_debugger *d,
 			      struct drm_xe_eudebug_event *e)
 {
 	struct drm_xe_eudebug_event_pagefault *pf = igt_container_of(e, pf, base);
+	struct online_debug_data *data = d->ptr;
 	uint32_t attn_size = pf->bitmask_size / 3;
 	int attn_size_as_u32 = attn_size / sizeof(uint32_t);
 	uint32_t *ptr = (uint32_t *) pf->bitmask;
 	uint32_t *ptrs[3] = {ptr, ptr + attn_size_as_u32, ptr + 2 * attn_size_as_u32};
 	const char * const name[3] = {"before", "after", "resolved"};
 	int threads[3], pagefault_threads, idx;
+	uint32_t sr0_0, offset;
 
 	for (idx = 0; idx < 3; idx++)
 		threads[idx] = igt_bitmap_hweight(ptrs[idx], attn_size * 8);
@@ -1410,6 +1474,38 @@ static void pagefault_trigger(struct xe_eudebug_debugger *d,
 
 	igt_assert(pagefault_threads > 0);
 	igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
+
+	if (!(data->flags & SHADER_PAGEFAULT_ONE_OF_MANY))
+		return;
+
+	offset = get_thread_space_address(data, data->pf_thread_number);
+
+	igt_for_milliseconds(500) {
+		igt_assert_eq(pread(data->vm_fd, &sr0_0, sizeof(sr0_0), offset), sizeof(sr0_0));
+		if (sr0_0)
+			break;
+		usleep(1000);
+	}
+	sr0_0 &= 0xffff; /* we need only thread coords */
+
+	for (uint32_t att_dw = 0; att_dw < attn_size_as_u32; att_dw++) {
+		uint32_t att_sr0_0, att_mask = ~ptrs[1][att_dw] & ptrs[2][att_dw];
+
+		for (int att_nr, att_bit = 0; att_bit < BITS_PER_TYPE(att_mask); ++att_bit) {
+			if (!(att_mask & (1ULL << att_bit)))
+				continue;
+			att_nr = 32 * att_dw + att_bit;
+			att_sr0_0 = attn_to_sr0_0(data, att_nr);
+			if (att_sr0_0 == sr0_0) {
+				igt_debug("Thread%d: matched pagefault, attn=%#x, sr0_0=%#x\n",
+					  data->pf_thread_number, att_nr, sr0_0);
+				++data->thread_hit_count;
+			} else {
+				igt_debug("Thread%d: unmatched pagefault, attn=%#x, th_sr0_0=%#x, attn_sr0_0=%#x\n",
+					  data->pf_thread_number, att_nr, sr0_0, att_sr0_0);
+			}
+		}
+	}
 }
 
 /**
@@ -1610,6 +1706,12 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 	igt_assert_lt(0, sigints_during_test);
 }
 
+static int getenv_int(const char *var, int def_val)
+{
+	char *env = getenv(var);
+
+	return env ? atoi(env) : def_val;
+}
 /**
  * SUBTEST: pagefault-read
  * Functionality: page faults
@@ -1634,6 +1736,12 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
  * Description:
  *     Check whether KMD sends write pagefault event for workload in debug mode
  *     with many threads.
+ *
+ * SUBTEST: pagefault-one-of-many
+ * Description:
+ *     Check whether read (EU thread's load instruction) pagefault memory
+ *     exception handling reports correct thread, if only one thread causes exception
+ *     and other threads are spinning.
  */
 static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
 				  int flags)
@@ -1642,7 +1750,26 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	if (flags & SHADER_PAGEFAULT_ONE_OF_MANY) {
+		uint32_t max_ss, max_sl;
+
+		data->flags |= DO_NOT_EXPECT_CANARIES;
+		data->pf_thread_number = getenv_int("IGT_PF_THREAD_NUMBER", 0);
+		data->num_threads_per_eu =
+			xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
+
+		max_ss = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_MAX_SUBSLICE);
+		if (!max_ss)
+			max_ss = xe_hwconfig_lookup_value_u32(fd,
+				INTEL_HWCONFIG_MAX_DUAL_SUBSLICES_SUPPORTED);
+		max_sl = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_MAX_SLICES_SUPPORTED);
+		igt_debug("HWCONFIG: %d threads per EU, max %d (dual)subslices, max %d slices\n",
+			  data->num_threads_per_eu, max_ss, max_sl);
+		igt_assert(data->num_threads_per_eu && max_ss && max_sl);
+
+		data->max_subslices_per_slice = DIV_ROUND_UP(max_ss, max_sl);
+	}
+	s = xe_eudebug_session_create(fd, run_online_client, data->flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
@@ -2668,11 +2795,12 @@ igt_main
 		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
 	test_gt_render_or_compute("pagefault-write", fd, hwe)
 		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
-
 	test_gt_render_or_compute("pagefault-read-stress", fd, hwe)
 		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ | PAGEFAULT_STRESS_TEST);
 	test_gt_render_or_compute("pagefault-write-stress", fd, hwe)
 		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
+	test_gt_render_or_compute("pagefault-one-of-many", fd, hwe)
+		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_ONE_OF_MANY);
 
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
diff --git a/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
new file mode 100644
index 000000000000..3bd5b0c5f53a
--- /dev/null
+++ b/tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: MIT
+// Generated using Intel Graphics Assembler 1.1.0-int
+
+#include "gpgpu_shader.h"
+
+#define MD5_SUM_IGA64_ASMS f0897ea23eff7ea77569eca6ddd16161
+
+struct iga64_template const iga64_code_store_sr0_0[] = {
+	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
+		0x00000961, 0x05050220, 0x00007000, 0x00000000,
+		0x800c0961, 0x04054220, 0x00000000, 0x00000000,
+		0x80000069, 0x04558220, 0x02000014, 0x00000002,
+		0x80001940, 0x04558220, 0x02000454, 0x00000000,
+		0x80000040, 0x04658220, 0x02000064, 0x00000000,
+		0x80000061, 0x04754220, 0x00000000, 0x00000003,
+		0x00032031, 0x00000000, 0xd00e0494, 0x04000000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
+
+	}}
+};
+
+struct iga64_template const iga64_code_pagefault_one_of_many[] = {
+	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
+		0x000c0061, 0x1e054330, 0x00000000, 0x00000000,
+		0x00000061, 0x1e054330, 0x00000123, 0x45678000,
+		0x00000061, 0x1e254220, 0x00000000, 0x0000003f,
+		0x00000061, 0x1e454220, 0x00000000, 0x0000003f,
+		0x00000061, 0x1e754220, 0x00000000, 0x00000003,
+		0x0000005b, 0x14040220, 0x02020014, 0x01440064,
+		0x00001970, 0x00018220, 0x12001404, 0xc0ded000,
+		0x04032031, 0x1f0c0000, 0xf8061e0c, 0x00a00000,
+		0x80000001, 0x00010000, 0x20000000, 0x00000000,
+		0x80000001, 0x00010000, 0x30000000, 0x00000000,
+		0x80000901, 0x00010000, 0x00000000, 0x00000000,
+	}},
+	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
+
+	}}
+};

-- 
2.43.0

