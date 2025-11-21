Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAFECFA46E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A368B10E7F9;
	Fri, 21 Nov 2025 03:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg3Igj+U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD6810E7FC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697448; x=1795233448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pE07UomSvazJTyG8ev9b16IckfpH88IhsfoM81bV5vE=;
 b=jg3Igj+U0F+nOBqvZN9rhb/A/+UhFmo1bmsMdZUxG65lH1A9x+WXbnQ1
 /OS7/4l7oXDIVCTasahNBOu5alsYCzuGqS2tQuKp5658LCM/un5qIfDcY
 CE6upzG/rOk8MqrcWoIrWwnl6++9O1qyIQ0JHr/Ooh7PMwzclJUBwFFiZ
 Y/mgtgZmRToPo8k0qRvEQD5uIlJiJty6t62kY0z8ujzXotkGkcUnAAH0Y
 Y4c3825HXAJCrVK17uQ+e8nQOdOocgIV3vE228RIdhsEEUb+uxbY+OWM7
 kjjA9khjOh5hYq0wOluxZFAemgCqWAO49RgrDRYIy9yCk77+jes38MWxu A==;
X-CSE-ConnectionGUID: MblzMo7kTh6IhVJV+F1cEQ==
X-CSE-MsgGUID: FwnFJGPDT2aSebsO32hnrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484679"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:27 -0800
X-CSE-ConnectionGUID: oQwIvGcVTSmsN3UfdTh7Mw==
X-CSE-MsgGUID: LH+97jHQTWSuN93O7RJ/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433512"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 17/19] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Date: Thu, 20 Nov 2025 19:57:29 -0800
Message-ID: <20251121035715.767226-38-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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
index 9f7b3b4d7..288ef9ed8 100644
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

