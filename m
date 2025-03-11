Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F50C28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE7A10E5C5;
	Tue, 11 Mar 2025 15:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4pwJEh8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5A710E5C4
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706629; x=1773242629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xl8TcwnCs7ZJsnx6RJxqYZgE0enw29SR6L99fO1ODm0=;
 b=G4pwJEh80SFuqluvY/LoXILmsyhOuu6LpFtqHhz845ttuXfX6i37AMyu
 3XLFw/8n0A41+iGGYGAI9+UVP3+FOhGQbaSiIpSnRmLIWFxLgFt4W8pUv
 NnBtzMYGFPoxNORjS2kYVgsUXAJFZQ/sX+KiDnm3eYZ+GfYJB0hNiB0fz
 ap1YW2RLfXuP2FMpTvu7438QlUVRJUuo3iYwuuhhDTnlGK0zQQv5/s2S+
 7V05PZAdGwVe9hsxCLjUmhqMSjNUiBSZCYLn9JI57lb424jLZBcKIEjbF
 UllhKMqVIAgizEq7QEF7eC/mscQCYXrSrsfwBBlyozSs4311oMHqLrD6r g==;
X-CSE-ConnectionGUID: waZdcniVQwmuLEwPTyJN9A==
X-CSE-MsgGUID: lgJPkNMwQLK62fQYIbHccg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377181"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377181"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:49 -0700
X-CSE-ConnectionGUID: XF/BRJ9US8SU50PvIuxwdg==
X-CSE-MsgGUID: vyVGKym6TWqzi+eYvUVQkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066317"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:49 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 10/11] lib/intel_compute: Use constants for thread
 groups and local work size
Date: Tue, 11 Mar 2025 16:21:30 +0100
Message-ID: <20250311152321.16497-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311152321.16497-1-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
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

Define new constants and use them to build the pipeline instead of
magic values. This also helps homogenize the code to enforce a
similar execution across GPUs. Having them grouped together in the
file makes it easier to experiment with different values, as they
depend on each other but where previously distributed.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index f5b3a88f0..068d64b24 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -55,6 +55,16 @@
 
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
 
+#define THREADS_PER_GROUP		32
+#define THREAD_GROUP_X			MAX(1, SIZE_DATA / (ENQUEUED_LOCAL_SIZE_X * \
+							    ENQUEUED_LOCAL_SIZE_Y * \
+							    ENQUEUED_LOCAL_SIZE_Z))
+#define THREAD_GROUP_Y			1
+#define THREAD_GROUP_Z			1
+#define ENQUEUED_LOCAL_SIZE_X		1024
+#define ENQUEUED_LOCAL_SIZE_Y		1
+#define ENQUEUED_LOCAL_SIZE_Z		1
+
 /*
  * TGP  - ThreadGroup Preemption
  * WMTP - Walker Mid Thread Preemption
@@ -781,9 +791,9 @@ static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
 	addr_bo_buffer_batch[b++] = addr_output >> 32;
 	addr_bo_buffer_batch[b++] = loop_count;
-	addr_bo_buffer_batch[b++] = 0x00000400; // Enqueued local size X
-	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Y
-	addr_bo_buffer_batch[b++] = 0x00000001; // Enqueued local size Z
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1164,7 +1174,7 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00180000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x0c000020;
+	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 
 	addr_bo_buffer_batch[b++] = 0x00000008;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1332,10 +1342,10 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0xbe040000;
 	addr_bo_buffer_batch[b++] = 0xffffffff;
 	addr_bo_buffer_batch[b++] = 0x000003ff;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = THREAD_GROUP_X;
 
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y;
+	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1350,7 +1360,7 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00001080;
-	addr_bo_buffer_batch[b++] = 0x0c000020;
+	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 
 	addr_bo_buffer_batch[b++] = 0x00000008;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1470,10 +1480,10 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 		 */
 		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
 	else
-		addr_bo_buffer_batch[b++] = 0x00000002;
+		addr_bo_buffer_batch[b++] = THREAD_GROUP_X;
 
-	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Y Dimension
-	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Z Dimension
+	addr_bo_buffer_batch[b++] = THREAD_GROUP_Y;
+	addr_bo_buffer_batch[b++] = THREAD_GROUP_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1494,7 +1504,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x0c000020;
+	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00001047;
-- 
2.43.0

