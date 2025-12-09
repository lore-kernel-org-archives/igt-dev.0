Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76430D3B7F8
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 03:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFFD10E47C;
	Tue,  9 Dec 2025 03:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KeAv9KV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD5310E37F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 03:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765250544; x=1796786544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vOgem3X0WF9466ajUQmenxOrJDds3kbW+5pLYpZ8t9I=;
 b=KeAv9KV0LSVh0AuwDgqOeRpayJmFT/nH+VmLoQpdvlzhyTrELbozbnS1
 w7O6CDJ7wVj9UDFBZdXBZv6nEyUKJG+hReSpCngM7vZx2QOGwJLtwtsxO
 1R6xa5FCi7DJ6to3A7ZZns2lbRGi2Eh7nDLQWPeX7vbz3wy//VMOg66xH
 6tS1bUzUWRZvyeGNaDOLj5biq7I3GD5egXGJOGpCOvvqYdPQ9nnu2bixr
 QgEJ1QZtzz63GTsAlFIEfzCs8b3APgNbkOjS9dkxaFxHsXS+aUge3gcUE
 yKgrs6OMwBi4ZMBfw/Na7VeNnYR9n/aGtLOBW/CRdC06qexaQXnCckDOQ g==;
X-CSE-ConnectionGUID: fF9No8OESXOGgVwZE4wDRA==
X-CSE-MsgGUID: VAKagc54R2eiPQWdopTd2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67164320"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67164320"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:23 -0800
X-CSE-ConnectionGUID: JlyRJIgKTOqEmUwMeI1t8A==
X-CSE-MsgGUID: UWwtXKy5S52omzxqXfoqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196570903"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 19:22:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com, stuart.summers@intel.com
Subject: [PATCH v3 05/18] tests/intel/xe_exec_multi_queue: Validate queue
 priority setting
Date: Mon,  8 Dec 2025 19:22:11 -0800
Message-ID: <20251209032208.1540217-25-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
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

Validate setting priority of queues within the multi queue
group.

v2: Add and use XE_EXEC_QUEUE_NUM_PRIORITIES (priyanka)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 67 +++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index 4f3ad6cf5..87f7c6dbf 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -18,9 +18,15 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define XE_EXEC_QUEUE_PRIORITY_LOW	0
+#define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
+#define XE_EXEC_QUEUE_PRIORITY_HIGH	2
+#define XE_EXEC_QUEUE_NUM_PRIORITIES	3
+
 #define MAX_N_EXEC_QUEUES	64
 
 #define USERPTR			(0x1 << 0)
+#define PRIORITY		(0x1 << 1)
 
 #define MAX_INSTANCE 9
 
@@ -37,6 +43,15 @@ __test_sanity(int fd, int gt, int class)
 		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
 		.value = DRM_XE_MULTI_GROUP_CREATE,
 	};
+	struct drm_xe_ext_set_property mq_priority = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+	};
+	struct drm_xe_ext_set_property priority = {
+		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
+		.value = XE_EXEC_QUEUE_PRIORITY_NORMAL,
+	};
 	struct drm_xe_engine_class_instance vm_bind_eci = {
 		.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
 	};
@@ -91,6 +106,11 @@ __test_sanity(int fd, int gt, int class)
 	multi_queue.base.next_extension = to_user_pointer(&multi_queue);
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
 
+	/* Setting other queue properties are valid for Q0 */
+	multi_queue.base.next_extension = to_user_pointer(&priority);
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+
 	/* Adding queues to group after primary is destroyed is invalid */
 	multi_queue.base.next_extension = 0;
 	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
@@ -119,6 +139,11 @@ __test_sanity(int fd, int gt, int class)
 	if (n > 1)
 		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext, &val), -EINVAL);
 
+	/* Setting properties (other than MULTI_QUEUE_PRIORITY) is invalid for secondary queues */
+	multi_queue.base.next_extension = to_user_pointer(&priority);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+
+	multi_queue.base.next_extension = 0;
 	for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
 
@@ -149,6 +174,37 @@ __test_sanity(int fd, int gt, int class)
 			xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
 
+	/* MQ priority is not valid for regular queues */
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
+					     to_user_pointer(&mq_priority), &val), -EINVAL);
+
+	/* MQ priority validation */
+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
+	multi_queue.base.next_extension = to_user_pointer(&mq_priority);
+	mq_priority.value = XE_EXEC_QUEUE_NUM_PRIORITIES;
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+
+	mq_priority.value = XE_EXEC_QUEUE_PRIORITY_HIGH;
+	exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
+	multi_queue.value = exec_queues[0];
+	exec_queues[1] = xe_exec_queue_create(fd, vm, eci, ext);
+	xe_exec_queue_destroy(fd, exec_queues[1]);
+	xe_exec_queue_destroy(fd, exec_queues[0]);
+
+	igt_fork(child, 1) {
+		igt_drop_root();
+
+		/* Tests MULTI_QUEUE_PRIORITY property by dropping root permissions */
+		multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
+		mq_priority.value = XE_EXEC_QUEUE_PRIORITY_HIGH;
+		exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
+		multi_queue.value = exec_queues[0];
+		exec_queues[1] = xe_exec_queue_create(fd, vm, eci, ext);
+		xe_exec_queue_destroy(fd, exec_queues[1]);
+		xe_exec_queue_destroy(fd, exec_queues[0]);
+	}
+	igt_waitchildren();
+
 	xe_vm_destroy(fd, vm);
 }
 
@@ -211,8 +267,17 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
 			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
 		};
+		struct drm_xe_ext_set_property mq_priority = {
+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+		};
 		uint64_t ext = to_user_pointer(&multi_queue);
 
+		if (flags & PRIORITY) {
+			multi_queue.base.next_extension = to_user_pointer(&mq_priority);
+			mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
+		}
+
 		multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
 		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, num_placement, eci,
 						     ext, &exec_queues[i]), 0);
@@ -313,6 +378,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  *
  * @basic:					basic
  * @userptr:					userptr
+ * @priority:					priority
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -330,6 +396,7 @@ igt_main
 	} sections[] = {
 		{ "basic", 0 },
 		{ "userptr", USERPTR },
+		{ "priority", PRIORITY },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

