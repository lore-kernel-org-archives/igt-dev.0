Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3811AC28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 12:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E121A10EA01;
	Fri, 28 Mar 2025 12:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eviXNuH1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B90A10EA01
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743166011; x=1774702011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ctu9/JmbobJD9tZ7fVSnDooDcNXqBw3dQBj8D+uvjWo=;
 b=eviXNuH1U7/n1MpbQKK31C/QhLeVMRkEAWtyRRBvrI30H1W22JhAUXbV
 wwGKdCirYFLnNkDHsUpKwHSbsZP4BIDakOsz+Rsuxz6nJbrGAOGXcHzri
 B8068foO5ck/BrxMG9GSaNtFES5AO7ML2YiaQAc8YSdcbL4RR9R7G12Zw
 fzZoMRuMeoUiFMMYTb3B9VpB2+tePtqrcX3GjpWPAuehf+UxUDjHCW2ZM
 XdUOpmSP6/gtHwWR3zFn0k4deM0b1cFqcYHSy2egM8Qj0BNkNyT+Vxg0V
 ecCV9cWEt3mM5l1nEbNvk/GkuS6dN6hgZTd0Dv72nMDCwv2J8yBHI3vO5 w==;
X-CSE-ConnectionGUID: PmEv6iTMSwO7wIoMD95dig==
X-CSE-MsgGUID: u5Fod5IdS569XGBnCXJo2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44419791"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44419791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:46:51 -0700
X-CSE-ConnectionGUID: CHnnDIvyTu+pp4RyMFmGtg==
X-CSE-MsgGUID: 0GQVsXcDR321ogSFCzA06A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125441296"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:46:50 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/xe_eudebug_online: Implement faultable
 variations of some testcases
Date: Fri, 28 Mar 2025 12:45:55 +0000
Message-Id: <20250328124555.255036-3-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328124555.255036-1-jan.sokolowski@intel.com>
References: <20250328124555.255036-1-jan.sokolowski@intel.com>
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

Implement fault variation of tests, which are accessing the memory via
debugfd, by creating a vm in FAULT_MODE.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 84ba748c1..c20dd22f0 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -38,6 +38,7 @@
 #define TARGET_IN_VRAM			(1 << 13)
 #define SHADER_PAGEFAULT_READ		(1 << 14)
 #define SHADER_PAGEFAULT_WRITE		(1 << 15)
+#define FAULTABLE_VM			(1 << 16)
 #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
@@ -1098,7 +1099,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 							   2 * sizeof(**metadata), metadata[1]);
 
 	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
-	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
+	vm_flags |= c->flags & (SHADER_PAGEFAULT | FAULTABLE_VM) ?
+			DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
 
 	create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
 
@@ -1481,6 +1483,10 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
  * SUBTEST: set-breakpoint
  * Description:
  *	Checks for attention after setting a dynamic breakpoint in the ufence event.
+ *
+ * SUBTEST: set-breakpoint-faultable
+ * Description:
+ *	Faultable variation of test set-breakpoint.
  */
 
 static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
@@ -1488,6 +1494,8 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
+	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
+
 	data = online_debug_data_create(hwe);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
@@ -1739,6 +1747,10 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
  *	interrupts all threads, once attention event come it sets breakpoint on
  *	the very next instruction and resumes stopped threads back. It expects
  *	that every thread hits the breakpoint.
+ *
+ * SUBTEST: interrupt-all-set-breakpoint-faultable
+ * Description:
+ *	Faultable variation of test interrupt-all-set-breakpoint.
  */
 static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
 {
@@ -1746,6 +1758,8 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	struct online_debug_data *data;
 	uint32_t val;
 
+	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
+
 	data = online_debug_data_create(hwe);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
@@ -2521,6 +2535,9 @@ igt_main
 	test_gt_render_or_compute("set-breakpoint", fd, hwe)
 		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
 
+	test_gt_render_or_compute("set-breakpoint-faultable", fd, hwe)
+		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT | FAULTABLE_VM);
+
 	test_gt_render_or_compute("set-breakpoint-sigint-debugger", fd, hwe)
 		test_set_breakpoint_online_sigint_debugger(fd, hwe,
 							   SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
@@ -2563,6 +2580,9 @@ igt_main
 	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
 		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
 
+	test_gt_render_or_compute("interrupt-all-set-breakpoint-faultable", fd, hwe)
+		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP | FAULTABLE_VM);
+
 	test_gt_render_or_compute("tdctl-parameters", fd, hwe)
 		test_tdctl_parameters(fd, hwe, SHADER_LOOP);
 
-- 
2.34.1

