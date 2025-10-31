Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EA0CCFA02
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DAD10E304;
	Fri, 31 Oct 2025 18:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QII3J/H+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9557B10EC07
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ndjwzbQJfEsYjVyHpjcE/efreXcCNoOpXSiCHDbmBKA=;
 b=QII3J/H+eMic6AnoaldIHM+ahyy5j2ApXkWZhZao1ErkD3vP56eRLA5N
 G0wNlZ9QA+g3hACbUYs5SgvNlu00SB5ULvMJ59/BoXiAkzTKjDhVj33D/
 pnQiROesa+tOlb600nKVx5MvgZi9Kj82X7HLPui+iNOevPci8fwtT76xX
 7jAOxBvebd71Ms71vyZGt+6PMs13YT1uNPoj71fJpmsk6169i3rylnV3V
 fifbE1ssd6f19I+E0yw59ZPsv+MP/78vglnny1PvB7UtBvXhWn+hXwVZf
 uj+U57BhtUyfRLM1TmvzzJNRyvHcP12fRWYycMEp9ErZwRpEG9+aZynwB Q==;
X-CSE-ConnectionGUID: ZBa5PHvmRk2lVd91qdub7Q==
X-CSE-MsgGUID: HPhtD88ERACkFI5+BYBBtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81514638"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="81514638"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: dBHKemqfQGStd2DJelwMUg==
X-CSE-MsgGUID: r4f0IDDTTVabPe/qgverWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650039"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:01 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 17/18] tests/xe_exec_multi_queue: Sanity test KEEP_ACTIVE flag
Date: Fri, 31 Oct 2025 11:35:54 -0700
Message-ID: <20251031183555.1882721-18-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
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

Add DRM_XE_MULTI_GROUP_KEEP_ACTIVE to valid flags list.
Validate that KEEP_ACTIVE is not supported in preempt mode
unless fault mode is set.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 10b89692f..ee2b92293 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -39,10 +39,12 @@
 #define FAULT_MODE		(0x1 << 6)
 #define SMEM			(0x1 << 7)
 #define WAIT_MODE		(0x1 << 8)
+#define KEEP_ACTIVE		(0x1 << 9)
 
 #define MAX_INSTANCE 9
 
-#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
+#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE |        \
+				      DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
 
 /* Number of queues in exec sanity tests */
 #define NUM_QUEUES		2
@@ -81,7 +83,8 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	if (!n)
 		return;
 
-	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
 
 	/* Invalid flags */
 	while (!invalid_flag)
@@ -105,6 +108,15 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
 
+	/* KEEP_ACTIVE not supported in preempt mode without fault_mode */
+	if (preempt_mode) {
+		vm2 = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
+		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -EINVAL);
+		multi_queue.value &= ~DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+		xe_vm_destroy(fd, vm2);
+	}
+
 	/* Setting other queue properties are valid for Q0 */
 	multi_queue.base.next_extension = to_user_pointer(&priority);
 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
@@ -205,6 +217,21 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	igt_waitchildren();
 
 	xe_vm_destroy(fd, vm);
+
+	/* Validate closing FD while keeping group active */
+	fd = drm_open_driver(DRIVER_XE);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
+
+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE | DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+	multi_queue.base.next_extension = 0;
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
+
+	multi_queue.value = exec_queues[0];
+	for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+
+	drm_close_driver(fd);
 }
 
 /**
-- 
2.43.0

