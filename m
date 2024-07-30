Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6747FC3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1D610E510;
	Tue, 30 Jul 2024 11:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRBRkAyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8C410E510
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340192; x=1753876192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9cTEW1ElbfAKErIHzXzgvkGb03D3HnZ+16876nJIAIE=;
 b=MRBRkAyfw1NHPFl5ac15f1uy+ywENJoF4Gm76vAmmNqrGOLbPCKK2Vuk
 W3+wnPHj7x4krRZPazqUhyvl75C0+gO7l+9kH62iaFlaI5ZkGgUdiX9eV
 zETMlHhfPtUJGWsUwuEMQXLldU+s3JtpNL4kxb0C+ehWvuaS/Rsk3w+wd
 A2IUIolV+aWGR061q63eJPfHlkGLLJoX3p6wc5bjvYQYI82WtRWqsbCKN
 i7D7dWW40ErTYlGAZI5pw3LnIA345LPDJo2Przfxjzcu8SqUGL/zCsNce
 Niu+5QcLomcvsLIpt1dDxIm0iQYh7x3EmYBTQkxiDKw6hpOlKddXggB77 w==;
X-CSE-ConnectionGUID: FiY2YjP8SbqGV84pmUf4+w==
X-CSE-MsgGUID: jbuzv9mVSk6nHnrC9iJxBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20286782"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20286782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:52 -0700
X-CSE-ConnectionGUID: ZJkeuQlLSO2p4M6MZKhsXQ==
X-CSE-MsgGUID: dLWxCGzURGK2riTWh5R2Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217755"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:49 -0700
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
Subject: [PATCH i-g-t v2 63/66] tests/xe_eudebug_online: Add subtests w/o long
 running mode
Date: Tue, 30 Jul 2024 13:45:20 +0200
Message-Id: <20240730114523.334156-64-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

Currently all our online tests use vms in long running mode. Add 3 subtests
without it to have some coverage for non-lr mode.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 96129c06a..864591a34 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -28,6 +28,7 @@
 #define SHADER_N_NOOP_BREAKPOINT	(1 << 5)
 #define SHADER_CACHING_SRAM		(1 << 6)
 #define SHADER_CACHING_VRAM		(1 << 7)
+#define DISABLE_LONG_RUNNING_MODE	(1 << 8)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
 #define TRIGGER_RECONNECT		(1 << 27)
@@ -1003,12 +1004,16 @@ static void run_online_client(struct xe_eudebug_client *c)
 							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
 							   2 * sizeof(*metadata), metadata[1]);
 
-	create.vm_id = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	if (c->flags & DISABLE_LONG_RUNNING_MODE)
+		create.vm_id = xe_eudebug_client_vm_create(c, fd, 0, 0);
+	else
+		create.vm_id = xe_eudebug_client_vm_create(c, fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+
 	xe_eudebug_client_exec_queue_create(c, fd, &create);
 
 	ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, create.vm_id,
 				     bb_offset, bb_size);
-	intel_bb_set_lr_mode(ibb, true);
+	intel_bb_set_lr_mode(ibb, !(c->flags & DISABLE_LONG_RUNNING_MODE));
 
 	sip = get_sip(fd, c->flags);
 	shader = get_shader(fd, c->flags);
@@ -1251,6 +1256,10 @@ static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
  *	Check whether KMD sends attention events
  *	for workload in debug mode stopped on breakpoint.
  *
+ * SUBTEST: basic-breakpoint-no-lr
+ * Description:
+ *	Same as basic-breakpoint but without vm in long running mode.
+ *
  * SUBTEST: breakpoint-not-in-debug-mode
  * Description:
  *	Check whether KMD resets the GPU when it spots an attention
@@ -1337,6 +1346,10 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
  *	interrupts all threads, checks whether attention event came, and
  *	resumes stopped threads back.
  *
+ * SUBTEST: interrupt-all-no-lr
+ * Description:
+ *	Same as interrupt-all but without vm in long running mode.
+ *
  * SUBTEST: interrupt-all-set-breakpoint
  * Description:
  *	Schedules EU workload which should last about a few seconds, then
@@ -1557,6 +1570,10 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
  *	interrupts all threads and detaches debugger when attention is
  *	raised. The test checks if KMD resets the workload when there's
  *	no debugger attached and does the event playback on discovery.
+ *
+ * SUBTEST: interrupt-reconnect-no-lr
+ * Description:
+ *	Same as interrupt-reconnect but without vm in long running mode.
  */
 static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
 {
@@ -1792,6 +1809,9 @@ igt_main
 	test_gt_render_or_compute("basic-breakpoint", fd, hwe)
 		test_basic_online(fd, hwe, SHADER_BREAKPOINT);
 
+	test_gt_render_or_compute("basic-breakpoint-no-lr", fd, hwe)
+		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_LONG_RUNNING_MODE);
+
 	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd, hwe)
 		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
 
@@ -1807,6 +1827,9 @@ igt_main
 	test_gt_render_or_compute("interrupt-all", fd, hwe)
 		test_interrupt_all(fd, hwe, SHADER_LOOP);
 
+	test_gt_render_or_compute("interrupt-all-no-lr", fd, hwe)
+		test_interrupt_all(fd, hwe, SHADER_LOOP | DISABLE_LONG_RUNNING_MODE);
+
 	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
 		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
 
@@ -1819,6 +1842,10 @@ igt_main
 	test_gt_render_or_compute("interrupt-reconnect", fd, hwe)
 		test_interrupt_reconnect(fd, hwe, SHADER_LOOP | TRIGGER_RECONNECT);
 
+	test_gt_render_or_compute("interrupt-reconnect-no-lr", fd, hwe)
+		test_interrupt_reconnect(fd, hwe, SHADER_LOOP | TRIGGER_RECONNECT |
+					 DISABLE_LONG_RUNNING_MODE);
+
 	test_gt_render_or_compute("single-step", fd, hwe)
 		test_single_step(fd, hwe, SHADER_SINGLE_STEP | SIP_SINGLE_STEP |
 				 TRIGGER_RESUME_PARALLEL_WALK);
-- 
2.34.1

