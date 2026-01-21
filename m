Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E6EC4451E
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 11:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92E010E759;
	Wed, 21 Jan 2026 11:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSNctZsD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF3E10E75A
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768995999; x=1800531999;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/DtmRhkp0K+Il446fedmNb0XRg0WILn9c/y16IaxV3k=;
 b=mSNctZsDySCj1D4ZGGN76SXpq4N9RWWXE3pW5tiNGGqyPViPbfHYQPp7
 sYGvW4rT7xKXe2zgGTmjZLLwC5nFCWO/J40Zml71wvp47oDKyEG77LX6P
 ipT7C+aOXz1vzHP6wO4ODZyTATRKZ3TNkXih0K7DO8dwdwVcXfPsTW8+7
 BP5fSVqITXqSj8yMk/Y2fYRONLVTk9qa9L1F1F+j75qluBFsRrFo6ZGQ3
 K4zXpECD1gSgyhZCB08TM1AIdVuJTh4ZDQXbq49idnlxNnWAlsVEaRsFW
 wkUw34xS5pXDOms+JY0a4vFYthBmDfo9EgFMAiykW53w1A0e4Zg6uoRQj w==;
X-CSE-ConnectionGUID: VLptnLzWSI+2X0Jx4ehefw==
X-CSE-MsgGUID: kBlv0h+MS5il2TmzzinX+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889034"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889034"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:46:39 -0800
X-CSE-ConnectionGUID: i1mM8HqiRkqsIYbK2YRquA==
X-CSE-MsgGUID: 4dYcAZceSTOwrmzmyaYwaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347426"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 03:46:37 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH v3 3/6] tests/intel/xe_evict: Add multi-queue priority test
Date: Wed, 21 Jan 2026 17:16:28 +0530
Message-ID: <20260121114631.277272-4-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
References: <20260121114631.277272-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add 2 tests small-multi-queue-priority and small-multi-queue-priority-cm
which sets priority for multiqueue.

v3: Rename multiqueue to multi-queue in the test name
in the commit description.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_evict.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index dba9be7bb..25c729459 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -21,6 +21,7 @@
 #include "xe/xe_query.h"
 #include <string.h>
 
+#define XE_EXEC_QUEUE_PRIORITY_NORMAL   1
 #define MAX_N_EXEC_QUEUES	16
 #define MULTI_VM			(0x1 << 0)
 #define THREADED			(0x1 << 1)
@@ -30,6 +31,7 @@
 #define EXTERNAL_OBJ		(0x1 << 5)
 #define BIND_EXEC_QUEUE		(0x1 << 6)
 #define MULTI_QUEUE		(0x1 << 7)
+#define PRIORITY		(0x1 << 8)
 
 static void
 test_evict(int fd, struct drm_xe_engine_class_instance *eci,
@@ -89,6 +91,15 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 			};
 			uint64_t ext = to_user_pointer(&multi_queue);
 
+			if (flags & PRIORITY) {
+				struct drm_xe_ext_set_property mq_priority = {
+					.base.next_extension = 0,
+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+				};
+				multi_queue.base.next_extension = to_user_pointer(&mq_priority);
+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
+			}
 			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
 							     ext, &exec_queues[i]), 0);
@@ -279,6 +290,15 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 			};
 			uint64_t ext = to_user_pointer(&multi_queue);
 
+			if (flags & PRIORITY) {
+				struct drm_xe_ext_set_property mq_priority = {
+					.base.next_extension = 0,
+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+				};
+				multi_queue.base.next_extension = to_user_pointer(&mq_priority);
+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
+			}
 			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
 							     ext, &exec_queues[i]), 0);
@@ -540,6 +560,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  *
  * @small:			small
  * @small-multi-queue:		small multi queue
+ * @small-multi-queue-priority:
+ * 				small multi queue priority
  * @small-external:		small external
  * @small-multi-vm:		small multi VM
  * @beng-small:			small bind exec_queue
@@ -571,6 +593,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  *
  * @small-cm:			small compute machine
  * @small-multi-queue-cm:	small multi queue compute machine
+ * @small-multi-queue-priority-cm:
+ * 				small multi queue priority compute machine
  * @small-external-cm:		small external compute machine
  * @small-multi-vm-cm:		small multi VM compute machine
  * @beng-small-cm:		small bind exec_queue compute machine
@@ -714,6 +738,7 @@ int igt_main()
 	} sections[] = {
 		{ "small", 16, 448, 1, 128, 0 },
 		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
+		{ "small-multi-queue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
 		{ "large", 4, 16, 1, 4, 0 },
@@ -740,6 +765,7 @@ int igt_main()
 	} sections_cm[] = {
 		{ "small-cm", 16, 448, 1, 128, 0 },
 		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
+		{ "small-multi-queue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
 		{ "large-cm", 4, 16, 1, 4, 0 },
-- 
2.43.0

