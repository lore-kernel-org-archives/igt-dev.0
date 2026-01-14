Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2EED31A13
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FAD10E5C7;
	Wed, 14 Jan 2026 06:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dx6Ob/Cs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DB110E5C7
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373976; x=1799909976;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PYskLYF7UePm7v7+qMackV2ickk7ozOx95V5uLDNQOk=;
 b=Dx6Ob/CsjUPSRfdKk2RwebssKeXgEkKOHHY157XuULId5Rt1l2HTIy/s
 wkQn8IZLBIA/ZrEDu0k/BbgjnJdQc+tQ1CHyFsrBAF/dEOHCQJaMYIjeV
 AQ+J3WSVnWLTkrABL3ur+/ivZIDHggx3CuQXSWotsBU0TDgzkRl1mSYAo
 GEddMmmspl5oidMTHSH0BQLv4EzbjszCVWXE27Ic9yEHv1qr1BQshFI5S
 uvO44JBPxFRPoNoivTxgFCdLsZm1LNpAde5/Qmj0pK5E/9K148Dhp25H6
 lRvrKTfO+OuqKrCutY0IWhTFjsjWVskhbuKte86XFE3fy+FlXj+LPVL3k Q==;
X-CSE-ConnectionGUID: LrC41O9iS8iatGyS+YIlDQ==
X-CSE-MsgGUID: Oq+dO6NCQtyozOVJhv+cOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647893"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647893"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:36 -0800
X-CSE-ConnectionGUID: iCAB2KMNQJadb9CWdBvDAg==
X-CSE-MsgGUID: HWcL3J+MQbSW543/H/J4Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159909"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:34 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 4/9] tests/intel/xe_evict: Enhance testing of
 multi-queue functionality
Date: Wed, 14 Jan 2026 12:29:20 +0530
Message-ID: <20260114065925.197958-5-priyanka.dandamudi@intel.com>
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

Extend testing of multi queue functionality with flags
like EXTERNAL_OBJ, THREADED, MIXED_THREADS and COMPUTE_THREAD.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_evict.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2f23538fc..f3c8b8eae 100644
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

