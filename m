Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A826D3B9B9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 00:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E16F10E657;
	Wed, 10 Dec 2025 00:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WG5zaOCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AA910E641
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 00:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765327186; x=1796863186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gHQw8rNPTOMDBg+BG8CcUWH90ZEGpuy+3licN3qpxWY=;
 b=WG5zaOCXHL8UVJTT+ApL2nqnYNWwJ2PMACyrHE63NxMme+lRhuze2S47
 sELcvBh7jDxjZgcPdthDQCerdQ1H/tPIC6WG+sK9R7RXHBHYRKyWcf/ZP
 /339TQGszYWt+91mn5ebmP6PxZ8IGhuwqHgpd/To2OK05cXttCidjdhMC
 v69RMHmB6mRcxxXXh8xGb59C6QnZZRN6h7VBBDNK1IWhli886QVY7kLuY
 KnF4j4+Mdh8keXDCiClXgEmThEw5WkFsrwV9PtNSP10QZkQ7QUo/bP08E
 s0b5ACbAqmzu2NbmtVKl3nDaeaih7YOT4Xx0KV3SOFOpjkVET/24+RyHm g==;
X-CSE-ConnectionGUID: XIhPyAMXTw6s/J9rga6gEQ==
X-CSE-MsgGUID: XINFDmKUQuqkw32uiTJHpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67180413"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67180413"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:46 -0800
X-CSE-ConnectionGUID: ZhI8z6zlRV6TyUgh3+uUGQ==
X-CSE-MsgGUID: +U4iUARMSfyhVtryXJLXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196421647"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 16:39:46 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v4 17/18] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Date: Tue,  9 Dec 2025 16:39:52 -0800
Message-ID: <20251210003936.1613078-37-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
References: <20251210003936.1613078-20-niranjana.vishwanathapura@intel.com>
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

v3: Remove redundant preempt_mode check (Stuart)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 414d3fea7..39d621d54 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -37,10 +37,12 @@
 #define FAULT_MODE		(0x1 << 6)
 #define SMEM			(0x1 << 7)
 #define WAIT_MODE		(0x1 << 8)
+#define KEEP_ACTIVE		(0x1 << 9)
 
 #define MAX_INSTANCE 9
 
-#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
+#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE |        \
+				      DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
 
 #define BASE_ADDRESS	0x1a0000
 
@@ -84,7 +86,8 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	if (!n)
 		return;
 
-	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
+	vm = xe_vm_create(fd, preempt_mode ? DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
 
 	/* Invalid flags */
 	while (!invalid_flag)
@@ -119,6 +122,15 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
 
+	/* KEEP_ACTIVE not supported in preempt mode without fault_mode */
+	if (preempt_mode) {
+		vm2 = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+		igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext, &val), -EINVAL);
+		multi_queue.value &= ~DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
+		xe_vm_destroy(fd, vm2);
+	}
+
 	/* Setting other queue properties are valid for Q0 */
 	multi_queue.base.next_extension = to_user_pointer(&priority);
 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
@@ -219,6 +231,21 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
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

