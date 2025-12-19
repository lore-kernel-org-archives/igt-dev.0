Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475D9D767FE
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E935310EF8A;
	Fri, 19 Dec 2025 12:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGdiw5Al";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8C410EF80
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145722; x=1797681722;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fN4wN/hV0fcOLLZPeZUAEXYxa3pEws9a5v5LjkuyFZU=;
 b=dGdiw5Al/5fmynIH/zP2hXYf7UKw97M1zQoGTiax2ENpqpi7ScUnfaNG
 CEhgpfDAT4olYrco9b7pTP2+d0Nk3OJ/7y6FXOEAJQhQt195mPBuqbrEO
 gzYT/ihb/P2snOLlCaIWmjt3yjfvgtN0P+q5i6uE3dbapCUOXvMgM8b0F
 9N0BqlF+w9jf3Ok81MfyAN5nPYQtuIO81dLb4hQ3vZPp30jdZBKND0erg
 598+zf3Rp0DsUKU8lStoSM/ZktHNN7bliy0AKUHyZNIGGDFjGnipSt66Y
 IuTfuqVjeMJeFFOO30MI919TPYoMkZyJWtb9Wn7wrwZcZ4T7wGQLjdjAk g==;
X-CSE-ConnectionGUID: GzgtN1nzRuKY4DPcbhZxjA==
X-CSE-MsgGUID: bP45Oq0LTaOvknj47XV/JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79473867"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79473867"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:02:01 -0800
X-CSE-ConnectionGUID: KWHYIfl+TwGB86v1jOXtig==
X-CSE-MsgGUID: IwIPkRiZSBCWb8hm+snDTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203746969"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2025 04:02:00 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/7] tests/intel/xe_evict: Add priority for multi queue
Date: Fri, 19 Dec 2025 17:31:50 +0530
Message-ID: <20251219120154.695287-4-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
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
which sets priority for multi queue.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_evict.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index a62230ec6..35192aad0 100644
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
 			uint64_t ext = to_user_pointer(&multiq);
 
+			if (flags & PRIORITY) {
+				struct drm_xe_ext_set_property mq_priority = {
+					.base.next_extension = 0,
+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+				};
+				multiq.base.next_extension = to_user_pointer(&mq_priority);
+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
+			}
 			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
 							     ext, &exec_queues[i]), 0);
@@ -279,6 +290,15 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 			};
 			uint64_t ext = to_user_pointer(&multiq);
 
+			if (flags & PRIORITY) {
+				struct drm_xe_ext_set_property mq_priority = {
+					.base.next_extension = 0,
+					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
+				};
+				multiq.base.next_extension = to_user_pointer(&mq_priority);
+				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
+			}
 			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
 							     ext, &exec_queues[i]), 0);
@@ -540,6 +560,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  *
  * @small:			small
  * @small-multiqueue:		small multi queue
+ * @small-multiqueue-priority:	small multi queue priority
  * @small-external:		small external
  * @small-multi-vm:		small multi VM
  * @beng-small:			small bind exec_queue
@@ -571,6 +592,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  *
  * @small-cm:			small compute machine
  * @small-multiqueue-cm:	small multi queue compute machine
+ * @small-multiqueue-priority-cm:	small multi queue priority compute machine
  * @small-external-cm:		small external compute machine
  * @small-multi-vm-cm:		small multi VM compute machine
  * @beng-small-cm:		small bind exec_queue compute machine
@@ -714,6 +736,7 @@ int igt_main()
 	} sections[] = {
 		{ "small", 16, 448, 1, 128, 0 },
 		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
+		{ "small-multiqueue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY},
 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
 		{ "large", 4, 16, 1, 4, 0 },
@@ -740,6 +763,7 @@ int igt_main()
 	} sections_cm[] = {
 		{ "small-cm", 16, 448, 1, 128, 0 },
 		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
+		{ "small-multiqueue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY},
 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
 		{ "large-cm", 4, 16, 1, 4, 0 },
-- 
2.43.0

