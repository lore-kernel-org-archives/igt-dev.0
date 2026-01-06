Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9ADCD042D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 01:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D99210E45D;
	Tue,  6 Jan 2026 01:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0Z6XtDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E080610E3C4
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 01:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767663024; x=1799199024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9F98GlbYseZi/1hUTGsBTzKMgbbzK0/fAR4YhRZFoso=;
 b=I0Z6XtDjDADRTr9QOV/95HyIxR02LG1f2I2jVUiZp5WeBgNzzLSKzLeb
 IUrbaqtRnGsYKy/wlsVY6j9vkX5Qa3uOcXKGXageBDYuC8q+JJy82wuj3
 PWrEjdUwlOOclco5eyeSVCQtXC0B8P5HZlXglHI4dJO31UsfRlP8766eZ
 UZcihFBMOGu9U2PTyAkI+GBoTq6zfqnQWy54YrzY9jyDUdFCYOccDf1Y6
 paNhAaU9IIStc+UDG8YuTmXm7+sOkvTlXr8IEB8RzqBpAMOk8VxEwr6d6
 Vj4XlFbnD4pZ7qtQ7r/wxm5xehe1WIo8BK7kOUu+o4rGXdiV6cJku+wvP Q==;
X-CSE-ConnectionGUID: LKnOoDuwSc+LoXtUTmGHmA==
X-CSE-MsgGUID: t5lXyZEzQFW+a6tu5lEG+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80483740"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="80483740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:30:24 -0800
X-CSE-ConnectionGUID: W+9w1Z80S0e0RE5wEptjxQ==
X-CSE-MsgGUID: s8nwJoRaSuGUQjJwRrxEyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201756985"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:30:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com,
	stuart.summers@intel.com
Subject: [PATCH 2/3] Revert "tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag"
Date: Mon,  5 Jan 2026 17:30:19 -0800
Message-ID: <20260106013018.2851521-7-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
References: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
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

This reverts commit 6d2f428f573320ed81ae26bc711637e3b3984137.

The KEEP_ACTIVE feature is being reverted, update sanity test.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index c37aea0a25..6bc6f9f63b 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -37,12 +37,10 @@
 #define FAULT_MODE		(0x1 << 6)
 #define SMEM			(0x1 << 7)
 #define WAIT_MODE		(0x1 << 8)
-#define KEEP_ACTIVE		(0x1 << 9)
 
 #define MAX_INSTANCE 9
 
-#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE |        \
-				      DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
+#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
 
 #define BASE_ADDRESS	0x1a0000
 
@@ -86,8 +84,7 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	if (!n)
 		return;
 
-	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
-			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
 
 	/* Invalid flags */
 	while (!invalid_flag)
@@ -122,15 +119,6 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
 
-	/* KEEP_ACTIVE not supported in preempt mode without fault_mode */
-	if (preempt_mode) {
-		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
-		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
-		igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -EINVAL);
-		multi_queue.value &= ~DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
-		xe_vm_destroy(fd, vm2);
-	}
-
 	/* Setting other queue properties are valid for Q0 */
 	multi_queue.base.next_extension = to_user_pointer(&priority);
 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
@@ -231,21 +219,6 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	igt_waitchildren();
 
 	xe_vm_destroy(fd, vm);
-
-	/* Validate closing FD while keeping group active */
-	fd = drm_open_driver(DRIVER_XE);
-	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
-			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
-
-	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE | DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
-	multi_queue.base.next_extension = 0;
-	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
-
-	multi_queue.value = exec_queues[0];
-	for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
-
-	drm_close_driver(fd);
 }
 
 /**
-- 
2.43.0

