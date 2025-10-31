Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6311ACCFA0C
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 18:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D628710E35C;
	Fri, 31 Oct 2025 18:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bStiQ7qV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF0F10E320
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761935763; x=1793471763;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HQ+K0Hy2PCNfjQ1Q04bLHnvn0BhAolctA9yYeBDSido=;
 b=bStiQ7qVvxrTWZyiI6B6NrKOzT4qmP9nTbCso8cQPYLHv/OXGDHJHuVd
 tTcKHidkvC1t88Ry4SaVmZIfyoCbyr0NKkifMrjJE0hGYr/xKz+pM49gW
 051eJ4H5RXB9d4+irGOUC536Yv6YbRng0r9wLb7ZbsUXRJ9WylPFURWyE
 zJrapdPcqdmt/uqYptzB1LHuEZoBi2MFhLTXFOzVH8rYIDhrnphSJoCYr
 qcPHN7pJkiBZEiJqZzFwY8OO6qzw13agNxjoNkhyHTBb3bYgSVBjbeE/V
 zKAsGiU2tXUi8Ri9jRdUOJQV0I9Nphijs23qctE3qnH3Va2myzz/j/Nmw g==;
X-CSE-ConnectionGUID: 0VvR4axQTQynsNWTtexK2Q==
X-CSE-MsgGUID: hr3reGnTR1Cr8CTY4fgyMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64144726"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="64144726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:02 -0700
X-CSE-ConnectionGUID: zmgebuFiSXO31B2teaSdmA==
X-CSE-MsgGUID: SjgE17gmSfmtWQx1aAdpEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="190650019"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:36:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 05/18] tests/xe_exec_multi_queue: Validate queue priority
 setting
Date: Fri, 31 Oct 2025 11:35:42 -0700
Message-ID: <20251031183555.1882721-6-niranjana.vishwanathapura@intel.com>
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

Validate setting priority of queues within the multi queue
group.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_multi_queue.c | 65 +++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
index de2aae8f2..6c5ff54ec 100644
--- a/tests/intel/xe_exec_multi_queue.c
+++ b/tests/intel/xe_exec_multi_queue.c
@@ -18,9 +18,13 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#define XE_EXEC_QUEUE_PRIORITY_NORMAL	1
+#define XE_EXEC_QUEUE_PRIORITY_HIGH	2
+
 #define MAX_N_EXEC_QUEUES	64
 
 #define USERPTR			(0x1 << 0)
+#define PRIORITY		(0x1 << 1)
 
 #define MAX_INSTANCE 9
 
@@ -35,6 +39,15 @@ __test_sanity(int fd, int gt, int class)
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
 	uint64_t invalid_flag = 0, ext = to_user_pointer(&multi_queue);
 	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
 	struct drm_xe_engine_class_instance *hwe;
@@ -75,6 +88,11 @@ __test_sanity(int fd, int gt, int class)
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
@@ -103,6 +121,11 @@ __test_sanity(int fd, int gt, int class)
 	if (n > 1)
 		igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext, &val), -EINVAL);
 
+	/* Setting properties (other than MULTI_QUEUE_PRIORITY) is invalid for secondary queues */
+	multi_queue.base.next_extension = to_user_pointer(&priority);
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -EINVAL);
+
+	multi_queue.base.next_extension = 0;
 	for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
 
@@ -133,6 +156,37 @@ __test_sanity(int fd, int gt, int class)
 			xe_exec_queue_destroy(fd, exec_queues[i]);
 	}
 
+	/* MQ priority is not valid for regular queues */
+	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
+					     to_user_pointer(&mq_priority), &val), -EINVAL);
+
+	/* MQ priority validation */
+	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
+	multi_queue.base.next_extension = to_user_pointer(&mq_priority);
+	mq_priority.value = XE_EXEC_QUEUE_PRIORITY_MAX;
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
 
@@ -195,8 +249,17 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
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
@@ -297,6 +360,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int num_place
  *
  * @basic:					basic
  * @userptr:					userptr
+ * @priority:					priority
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci, int num_placement,
@@ -314,6 +378,7 @@ igt_main
 	} sections[] = {
 		{ "basic", 0 },
 		{ "userptr", USERPTR },
+		{ "priority", PRIORITY },
 		{ NULL },
 	};
 	int fd, gt, class;
-- 
2.43.0

