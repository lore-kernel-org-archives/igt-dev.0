Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EACC4451F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 11:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC37610E1FC;
	Wed, 21 Jan 2026 11:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkmN2jXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FD210E1FC
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 11:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768996001; x=1800532001;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lD/KHsdu3Om1RcrOD/X9CA0xeQ8fqCmZ80/pxQzCWO8=;
 b=nkmN2jXyw/G+GvTX3/o1dKHgvSIgRRK2X90l4C6xS8N5uI34ucAJOFrF
 KVp0DmabdI/1lrmzfQfsRtlUV7WrCtPJoAscnSkphiGteS1iIym0OuChh
 ltmunqBBRaW7FAqBh7nWvscnqzNjMMZNPU/qWK7N4UlzGdyl+58NrTTUc
 r9uz6QoDtK0VZ2FGolG6f/ZzlNqtnLLOj7AZDHj9WPH4QTKoBUH8HRON9
 CiB+inPlr6/VjJcQ/l/8HlxtT9IgWBsOLlTX87E3+w4R/DWjdPIFkHTlg
 TDeVc6EQ1f5xASqoZWQeP9LEFrNWWy30yndTPz6wjE7Iw4E/NZmtxXxA+ g==;
X-CSE-ConnectionGUID: s9uEhuKcTXOWM0qt+wVq/g==
X-CSE-MsgGUID: sWVl/bm6Q0Orl1DmeLqjXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92889035"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="92889035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 03:46:41 -0800
X-CSE-ConnectionGUID: TD/AiceeSYyG182l1kyxyw==
X-CSE-MsgGUID: dbeKy8sORp2YyaSQMyiBGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206347437"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jan 2026 03:46:39 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH v3 4/6] tests/intel/xe_evict: Enhance testing of multi-queue
 functionality
Date: Wed, 21 Jan 2026 17:16:29 +0530
Message-ID: <20260121114631.277272-5-priyanka.dandamudi@intel.com>
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

Extend testing of multi queue functionality with flags
like EXTERNAL_OBJ, THREADED, MIXED_THREADS and COMPUTE_THREAD.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_evict.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 25c729459..4a5ee132f 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -563,6 +563,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * @small-multi-queue-priority:
  * 				small multi queue priority
  * @small-external:		small external
+ * @small-external-multi-queue: small external multi queue
  * @small-multi-vm:		small multi VM
  * @beng-small:			small bind exec_queue
  * @beng-small-external:	small external bind exec_queue
@@ -596,6 +597,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * @small-multi-queue-priority-cm:
  * 				small multi queue priority compute machine
  * @small-external-cm:		small external compute machine
+ * @small-external-multi-queue-cm:
+ * 				small external compute machine multi queue
  * @small-multi-vm-cm:		small multi VM compute machine
  * @beng-small-cm:		small bind exec_queue compute machine
  * @beng-small-external-cm:	small external bind exec_queue compute machine
@@ -626,6 +629,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * arg[1]:
  *
  * @mixed-threads-small:	mixed threads small
+ * @mixed-threads-small-multi-queue:
+ * 				mixed threads small multi queue
  * @mixed-many-threads-small:	mixed many threads small
  * @mixed-threads-small-multi-vm:
  * 				mixed threads small multi vm
@@ -663,6 +668,8 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  *
  * arg[1]:
  * @cm-threads-small:		compute mode threads small
+ * @cm-threads-small-multi-queue:
+ * 				compute mode threads small multi queue
  * @cm-threads-small-multi-vm:	compute mode threads small multi vm
  * @beng-cm-threads-small:	bind exec_queue compute mode threads small
  * @beng-cm-threads-small-multi-vm:
@@ -693,6 +700,7 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  *
  * @threads-small:		threads small
  * @beng-threads-small:		bind exec_queue threads small
+ * @threads-small-multi-queue:	threads small multi queue
  * @threads-small-multi-vm:	threads small multi vm
  * @beng-threads-small-multi-vm:
  *				bind exec_queue threads small multi vm
@@ -740,6 +748,7 @@ int igt_main()
 		{ "small-multi-queue", 16, 448, 1, 128, MULTI_QUEUE },
 		{ "small-multi-queue-priority", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
 		{ "small-external", 16, 448, 1, 128, EXTERNAL_OBJ },
+		{ "small-external-multi-queue", 16, 448, 1, 128, EXTERNAL_OBJ | MULTI_QUEUE },
 		{ "small-multi-vm", 16, 256, 1, 128, MULTI_VM },
 		{ "large", 4, 16, 1, 4, 0 },
 		{ "large-external", 4, 16, 1, 4, EXTERNAL_OBJ },
@@ -767,6 +776,7 @@ int igt_main()
 		{ "small-multi-queue-cm", 16, 448, 1, 128, MULTI_QUEUE },
 		{ "small-multi-queue-priority-cm", 16, 448, 1, 128, MULTI_QUEUE | PRIORITY },
 		{ "small-external-cm", 16, 448, 1, 128, EXTERNAL_OBJ },
+		{ "small-external-multi-queue-cm", 16, 448, 1, 128, EXTERNAL_OBJ | MULTI_QUEUE },
 		{ "small-multi-vm-cm", 16, 256, 1, 128, MULTI_VM },
 		{ "large-cm", 4, 16, 1, 4, 0 },
 		{ "large-external-cm", 4, 16, 1, 4, EXTERNAL_OBJ },
@@ -794,10 +804,16 @@ int igt_main()
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

