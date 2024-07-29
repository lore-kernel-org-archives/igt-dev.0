Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBD1C3DA7E
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F88810E432;
	Mon, 29 Jul 2024 16:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOu7RKdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C7A10E434
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269119; x=1753805119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2rFqxKReARSJgIlPjLbvFDwk/+LUasfTjUcLHGAflfw=;
 b=AOu7RKdUJWmI8wysGsYmul8jx9tvl42XjLQmJkuwM11wOghLWvU3IfIF
 MvW4pKpCEtTzYXZO84yxRuTwrD34+rlYtvpKvF7vdy6n/vByr3GcZ6ntk
 E38zhzDEYVAbLyP4CIVQHa9JhjpeRyDKf0BoTTjSNDs0+ACiZ3DdRJcg3
 2ykDSWseir0xKtBWuS4MU6/ZQwUh8idl3mXEzgrlihQyUyNUn1PK9UfIv
 Db63APWaVq4jKhOhfO50Cs0husw+0K2PxHcO4zTWa4U+i0T9JcNGKwcKg
 5JVt0xxQc5Nip9/lGcbh1HTSiqhQRHZRt21va1yVgnflgrH8e/G9iGPl8 w==;
X-CSE-ConnectionGUID: VJl1b6kEQrShUd0PiRsXbg==
X-CSE-MsgGUID: 13Go4qDaSKWM4XM40saWkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427655"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427655"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:09 -0700
X-CSE-ConnectionGUID: eraI5KsjQByZIryhzAfVHw==
X-CSE-MsgGUID: D/PmwrWCR1WAwO2P4awwrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739639"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:05 -0700
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
Subject: [PATCH 53/66] tests/xe_eudebug_online: Set dynamic breakpoint on
 interrupt-all
Date: Mon, 29 Jul 2024 18:01:46 +0200
Message-Id: <20240729160159.37036-54-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Implement interrupt-all-set-breakpoint, which interrupts all threads,
and once spots attention it sets a breakpoint on the next instruction.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@intel.com>
---
 tests/intel/xe_eudebug_online.c | 81 ++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 8791b29fa..5bb165fef 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -22,6 +22,7 @@
 
 #define SHADER_BREAKPOINT	(1 << 0)
 #define SHADER_LOOP		(1 << 1)
+#define TRIGGER_RESUME_SET_BP	(1 << 28)
 #define TRIGGER_RESUME_DELAYED	(1 << 29)
 #define TRIGGER_RESUME_DSS	(1 << 30)
 #define TRIGGER_RESUME_ONE	(1 << 31)
@@ -276,6 +277,7 @@ struct online_debug_data {
 	uint64_t bb_offset;
 	size_t bb_size;
 	int vm_fd;
+	uint32_t first_aip;
 	struct timespec exception_arrived;
 	int last_eu_control_seqno;
 };
@@ -342,6 +344,71 @@ static void copy_first_bit(uint8_t *dst, uint8_t *src, int size)
 	}
 }
 
+/*
+ * Searches for the first instruction. It stands on assumption,
+ * that shader kernel is placed before sip within the bb.
+ */
+static uint32_t find_kernel_in_bb(struct gpgpu_shader *kernel,
+				  struct online_debug_data *data)
+{
+	uint32_t *p = kernel->code;
+	size_t sz = 4 * sizeof(uint32_t);
+	uint32_t buf[4];
+	int i;
+
+	for (i = 0; i < data->bb_size; i += sz) {
+		igt_assert_eq(pread(data->vm_fd, &buf, sz, data->bb_offset + i), sz);
+
+
+		if (memcmp(p, buf, sz) == 0)
+			break;
+	}
+
+	igt_assert(i < data->bb_size);
+
+	return i;
+}
+
+static void set_breakpoint_once(struct xe_eudebug_debugger *d,
+				struct online_debug_data *data)
+{
+	const uint32_t breakpoint_bit = 1 << 30;
+	size_t sz = sizeof(uint32_t);
+	struct gpgpu_shader *kernel;
+	uint32_t aip;
+
+	kernel = get_shader(d->master_fd, d->flags);
+
+	if (data->first_aip) {
+		uint32_t expected = find_kernel_in_bb(kernel, data) + kernel->size * 4 - 0x10;
+
+		igt_assert_eq(pread(data->vm_fd, &aip, sz, data->target_offset), sz);
+		igt_assert_eq_u32(aip, expected);
+	} else {
+		uint32_t instr_usdw;
+
+		igt_assert(data->vm_fd != -1);
+		igt_assert(data->target_size != 0);
+		igt_assert(data->bb_size != 0);
+
+		igt_assert_eq(pread(data->vm_fd, &aip, sz, data->target_offset), sz);
+		data->first_aip = aip;
+
+		aip = find_kernel_in_bb(kernel, data);
+
+		/* set breakpoint on last instruction */
+		aip += kernel->size * 4 - 0x10;
+		igt_assert_eq(pread(data->vm_fd, &instr_usdw, sz,
+				    data->bb_offset + aip), sz);
+		instr_usdw |= breakpoint_bit;
+		igt_assert_eq(pwrite(data->vm_fd, &instr_usdw, sz,
+				     data->bb_offset + aip), sz);
+
+	}
+
+	gpgpu_shader_destroy(kernel);
+}
+
 #define MAX_PREEMPT_TIMEOUT 10ull
 static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 					struct drm_xe_eudebug_event *e)
@@ -382,6 +449,8 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 			resume[i] = event[i];
 			break;
 		}
+	} else if (d->flags & TRIGGER_RESUME_SET_BP) {
+		set_breakpoint_once(d, data);
 	}
 
 	if (d->flags & SHADER_LOOP) {
@@ -602,7 +671,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 	data->threads_count = count_canaries_neq(ptr, w_dim, 0);
 	igt_assert_f(data->threads_count, "No canaries found, nothing executed?\n");
 
-	if (c->flags & SHADER_BREAKPOINT) {
+	if (c->flags & SHADER_BREAKPOINT || c->flags & TRIGGER_RESUME_SET_BP) {
 		uint32_t aip = ptr[0];
 
 		igt_assert_f(aip != SHADER_CANARY, "Workload executed but breakpoint not hit!\n");
@@ -860,6 +929,13 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
  *	Schedules EU workload which should last about a few seconds, then
  *	interrupts all threads, checks whether attention event came, and
  *	resumes stopped threads back.
+ *
+ * SUBTEST: interrupt-all-set-breakpoint
+ * Description:
+ *	Schedules EU workload which should last about a few seconds, then
+ *	interrupts all threads, once attention event come it sets breakpoint on
+ *	the very next instruction and resumes stopped thereads back. It expects
+ *	that every thread hits the breakpoint.
  */
 static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
 {
@@ -970,6 +1046,9 @@ igt_main
 	test_gt_render_or_compute("interrupt-all", fd, hwe)
 		test_interrupt_all(fd, hwe, SHADER_LOOP);
 
+	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
+		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
+
 	igt_fixture {
 		intel_allocator_multiprocess_stop();
 		drm_close_driver(fd);
-- 
2.34.1

