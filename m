Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4DAD767FC
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA57010EF69;
	Fri, 19 Dec 2025 12:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGQfn8u+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2742310EF8C
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145723; x=1797681723;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OkuZ+41cy+zxZmBlT7YAwFjV/otXmwOj/iqJ5eBf8+c=;
 b=fGQfn8u+BjA1W5a/MVTK/xLlP8RIF+AGDfqR4M8cAnr9XIvme4ZxUtA0
 YWo75z6TwtAHL1cTDUffKa+fRSiYtXFOC2G3FEJnB6qbm1XsYsM0l5iZz
 jM6+5aUG+rNwXBxsT0P6vyJQwOG/+ABL4y97kLxclmC15ml/hN8AAdLCi
 D3LY9lnzjLm1UmLYAOyNxDseFACG7LBc9U8ii5jDjW/NHMUfwhaBSWGrD
 ihhkgxkvD5phIqxKII5JmNTPSy776ei3r2mjFTtslrbPVnxqohmcECiR5
 A+JaveSG6PKip8griQg0PCKKG86+76s94fOgUsoe0yLNtVjFn/GppZRH4 Q==;
X-CSE-ConnectionGUID: OfJRyg9SS6G6MKb5Ljzk1w==
X-CSE-MsgGUID: qF1B/KP2Te+IX74vPwSQeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79473869"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79473869"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:02:03 -0800
X-CSE-ConnectionGUID: 1DwicRTURiKe9QK3Z2dbcA==
X-CSE-MsgGUID: nT2IGvUPTC2PyHjRqosVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203746976"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2025 04:02:01 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/7] tests/intel/xe_evict: Enhance testing of multi
 queue functionality
Date: Fri, 19 Dec 2025 17:31:51 +0530
Message-ID: <20251219120154.695287-5-priyanka.dandamudi@intel.com>
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

Extend testing of multi queue functionality with flags
like EXTERNAL_OBJ, THREADED, MIXED_THREADS and COMPUTE_THREAD.
Rename multiq to multi queue across for better readability.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_evict.c | 159 ++++++++++++++++++++++++++++++-----------
 1 file changed, 119 insertions(+), 40 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 35192aad0..26b6091a9 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -7,8 +7,7 @@
  * TEST: Check VMA eviction
  * Category: Core
  * Mega feature: General Core features
- * Sub-category: VMA
- * Functionality: eviction
+ * Sub-category: Memory management tests
  * GPU requirements: GPU needs to have dedicated VRAM
  */
 
@@ -84,12 +83,12 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm ,
 						      eci, 0);
 		else if (flags & MULTI_QUEUE) {
-			struct drm_xe_ext_set_property multiq = {
+			struct drm_xe_ext_set_property multi_queue = {
 				.base.next_extension = 0,
 				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
 			};
-			uint64_t ext = to_user_pointer(&multiq);
+			uint64_t ext = to_user_pointer(&multi_queue);
 
 			if (flags & PRIORITY) {
 				struct drm_xe_ext_set_property mq_priority = {
@@ -97,10 +96,10 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 					.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
 					.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
 				};
-				multiq.base.next_extension = to_user_pointer(&mq_priority);
+				multi_queue.base.next_extension = to_user_pointer(&mq_priority);
 				mq_priority.value = XE_EXEC_QUEUE_PRIORITY_NORMAL + (rand() % 2);
 			}
-			multiq.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
 			igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci,
 							     ext, &exec_queues[i]), 0);
 		} else
@@ -553,14 +552,13 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 
 /**
  * SUBTEST: evict-%s
+ * Functionality: eviction
  * Description:  %arg[1] evict test.
  * Test category: functionality test
  *
  * arg[1]:
  *
  * @small:			small
- * @small-multiqueue:		small multi queue
- * @small-multiqueue-priority:	small multi queue priority
  * @small-external:		small external
  * @small-multi-vm:		small multi VM
  * @beng-small:			small bind exec_queue
@@ -569,6 +567,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  */
 /**
  * SUBTEST: evict-%s
+ * Functionality: eviction
  * Description:  %arg[1] evict test.
  * Test category: stress test
  *
@@ -584,15 +583,13 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 /**
  *
  * SUBTEST: evict-%s
+ * Functionality: compute VM eviction
  * Description:  %arg[1] evict test.
- * Feature: compute machine
  * Test category: functionality test
  *
  * arg[1]:
  *
  * @small-cm:			small compute machine
- * @small-multiqueue-cm:	small multi queue compute machine
- * @small-multiqueue-priority-cm:	small multi queue priority compute machine
  * @small-external-cm:		small external compute machine
  * @small-multi-vm-cm:		small multi VM compute machine
  * @beng-small-cm:		small bind exec_queue compute machine
@@ -601,8 +598,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  */
 /**
  * SUBTEST: evict-%s
+ * Functionality: compute VM eviction
  * Description:  %arg[1] evict test.
- * Feature: compute machine
  * Test category: stress test
  *
  * arg[1]:
@@ -617,27 +614,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 /**
  *
  * SUBTEST: evict-%s
+ * Functionality: mixed threads eviction
  * Description:  %arg[1] evict test.
- * Feature: mixted threads
- * Test category: functionality test
- *
- * arg[1]:
- *
- * @mixed-threads-small:	mixed threads small
- * @mixed-many-threads-small:	mixed many threads small
- * @mixed-threads-small-multi-vm:
- * 				mixed threads small multi vm
- * @beng-mixed-threads-small:	bind exec_queue mixed threads small
- * @beng-mixed-many-threads-small:
- *				bind exec_queue mixed many threads small
- * @beng-mixed-threads-small-multi-vm:
- *				bind exec_queue mixed threads small multi vm
- */
-/**
- *
- * SUBTEST: evict-%s
- * Description:  %arg[1] evict test.
- * Feature: mixted threads
  * Test category: stress test
  *
  * arg[1]:
@@ -655,8 +633,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 /**
  *
  * SUBTEST: evict-%s
+ * Functionality: compute mode threads eviction
  * Description:  %arg[1] evict test.
- * Feature: compute mode threads
  * Test category: functionality test
  *
  * arg[1]:
@@ -669,8 +647,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 /**
  *
  * SUBTEST: evict-%s
+ * Functionality: compute mode threads eviction
  * Description:  %arg[1] evict test.
- * Feature: compute mode threads
  * Test category: stress test
  *
  * arg[1]:
@@ -680,11 +658,31 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * @beng-cm-threads-large-multi-vm:
  *				bind exec_queue compute mode threads large multi vm
  */
+
 /**
  *
  * SUBTEST: evict-%s
+ * Functionality: mixted threads eviction
+ * Description:  %arg[1] evict test.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @mixed-threads-small:       mixed threads small
+ * @mixed-many-threads-small:  mixed many threads small
+ * @mixed-threads-small-multi-vm:
+ *                             mixed threads small multi vm
+ * @beng-mixed-threads-small:  bind exec_queue mixed threads small
+ * @beng-mixed-many-threads-small:
+ *                             bind exec_queue mixed many threads small
+ * @beng-mixed-threads-small-multi-vm:
+ *                             bind exec_queue mixed threads small multi vm
+*/
+/**
+ *
+ * SUBTEST: evict-%s
+ * Functionality: threads eviction
  * Description:  %arg[1] evict test.
- * Feature: threads
  * Test category: functionality test
  *
  * arg[1]:
@@ -699,8 +697,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
 /**
  *
  * SUBTEST: evict-%s
+ * Functionality: threads eviction
  * Description:  %arg[1] evict test.
- * Feature: threads
  * Test category: stress test
  *
  * arg[1]:
@@ -712,6 +710,79 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * @beng-threads-large:		bind exec_queue threads large
  *
  */
+/**
+ *
+ * SUBTEST: evict-%s
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Functionality: threads eviction
+ * Description:  %arg[1] evict test.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @threads-small-multi-queue:	threads small multi queue
+ *
+ */
+/**
+ *
+ * SUBTEST: evict-%s
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Functionality: compute mode threads eviction
+ * Description:  %arg[1] evict test.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ * @cm-threads-small-multi-queue:
+ * 				compute mode threads small multi queue
+ */
+/**
+ * SUBTEST: evict-%s
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Functionality: eviction
+ * Description:  %arg[1] evict test.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @small-multi-queue:		small multi queue
+ * @small-multi-queue-priority:
+ * 				small multi queue priority
+ * @small-external-multi-queue: small external multi queue
+ */
+/**
+ *
+ * SUBTEST: evict-%s
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Functionality: mixed threads eviction
+ * Description:  %arg[1] evict test.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @mixed-threads-small-multi-queue:
+ * 				mixed threads small multi queue
+ */
+/**
+ *
+ * SUBTEST: evict-%s
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Functionality: compute VM eviction
+ * Description:  %arg[1] evict test.
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @small-multi-queue-cm:	small multi queue compute machine
+ * @small-multi-queue-priority-cm:
+ * 				small multi queue priority compute machine
+ * @small-external-multi-queue-cm:
+ * 				small external compute machine multi queue
+ */
 
 /*
  * Table driven test that attempts to cover all possible scenarios of eviction
@@ -735,9 +806,10 @@ int igt_main()
 		unsigned int flags;
 	} sections[] = {
 		{ "small", 16, 448, 1, 128, 0 },
-		{ "small-multiqueue", 16, 448, 1, 128, MULTI_QUEUE },
-		{ "small-multiqueue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY},
+		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
+		{ "small-multi-queue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
+		{ "small-external-multi-queue", 16, 448, 1, 128, EXTERNAL_OBJ | MULTI_QUEUE },
 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
 		{ "large", 4, 16, 1, 4, 0 },
 		{ "large-external", 4, 16, 1, 4, EXTERNAL_OBJ },
@@ -762,9 +834,10 @@ int igt_main()
 		unsigned int flags;
 	} sections_cm[] = {
 		{ "small-cm", 16, 448, 1, 128, 0 },
-		{ "small-multiqueue-cm", 16, 448, 1, 128, MULTI_QUEUE },
-		{ "small-multiqueue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY},
+		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
+		{ "small-multi-queue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
+		{ "small-external-multi-queue-cm", 16, 448, 1, 128, EXTERNAL_OBJ | MULTI_QUEUE },
 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
 		{ "large-cm", 4, 16, 1, 4, 0 },
 		{ "large-external-cm", 4, 16, 1, 4, EXTERNAL_OBJ },
@@ -792,10 +865,16 @@ int igt_main()
 	} sections_threads[] = {
 		{ "threads-small", 2, 16, 128, 1, 128,
 			THREADED },
+		{ "threads-small-multi-queue", 2, 16, 128, 1, 128,
+			THREADED | MULTI_QUEUE },
 		{ "cm-threads-small", 2, 16, 128, 1, 128,
 			COMPUTE_THREAD | THREADED },
+		{ "cm-threads-small-multi-queue", 2, 16, 128, 1, 128,
+			COMPUTE_THREAD | THREADED | MULTI_QUEUE },
 		{ "mixed-threads-small", 2, 16, 128, 1, 128,
 			MIXED_THREADS | THREADED },
+		{ "mixed-threads-small-multi-queue", 2, 16, 128, 1, 128,
+			MIXED_THREADS | THREADED | MULTI_QUEUE },
 		{ "mixed-many-threads-small", 3, 16, 128, 1, 128,
 			THREADED },
 		{ "threads-large", 2, 2, 16, 3, 32,
-- 
2.43.0

