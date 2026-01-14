Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C09D31A13
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9E610E58F;
	Wed, 14 Jan 2026 06:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lD0+/7TT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC7F10E58F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373974; x=1799909974;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mWqqrayFBKLbe742FcssOxWizR1qZen0mkTFTqkanjM=;
 b=lD0+/7TTqdCEFGspfCJhDLmzOcc6az3zFx8KUuyqeCyKe2rg633YiFG0
 o76yYD2aucQxmdqiBM6qJ2382PsMHQkYgjQ6WZ3Qlo9GMpW3PSJFsYoWr
 uxI3gegHMtwamtVs2H7nM5ute8f2/aYtCRFB8ItJYUQHrOUKLvWdOowNO
 DucKzZwvIjuBBgBByC/BYuTX//RKzTp3RUoN2YpjGE75d39/Kiod23Rlk
 CtZsDIbSjOXOLrMABjXKJf3eaQ8qs40wKU67IgSwLGASPjPMkDuEiVTEW
 BFb/EfCUkUVAr72D8Isks1W8hi1ObvTNOoNI08jqXpjvBdyIT8dsMRjR5 w==;
X-CSE-ConnectionGUID: OrtN5jEKTxOf+0RVOe4Jqw==
X-CSE-MsgGUID: O8E57sRrRmmTkTC5NUCAnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647892"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647892"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:34 -0800
X-CSE-ConnectionGUID: R90OixgTRlSPNEr7vttAvg==
X-CSE-MsgGUID: zYEYT1/GRKaMxpBegBq1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159902"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:32 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 3/9] tests/intel/xe_evict: Add multi-queue priority test
Date: Wed, 14 Jan 2026 12:29:19 +0530
Message-ID: <20260114065925.197958-4-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
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

Add 2 tests small-multiqueue-priority and small-multiqueue-priority-cm
which sets priority for multiqueue.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_evict.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index bcf13b8cf..2f23538fc 100644
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

