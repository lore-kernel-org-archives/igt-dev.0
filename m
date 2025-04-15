Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5F4C369B4
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD52810E70D;
	Tue, 15 Apr 2025 10:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/YGCx5T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8FD10E70C
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712130; x=1776248130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8hkdCWdlO5DbQsnhHBdSzxVRW+Dh+IEj155kfq78/Ag=;
 b=M/YGCx5TGCo6TR1f06Y0ZRObtSnvDAJg35z33JM1xDDi5vdmSxu6fCFs
 QN40TH3FKDGLX7tkTlss7PdGFCyaK3QVDQxMFKKleQlMXJjeAvlQ0pEvx
 krMfvw4Qg7iqgWlxBd+rMp0MCHe3oSQMlKG+ZgOpFlkJldTWo0IlZXWhr
 9MyhEMWOmle5TF3If6RBjAa7tDloCsafeayx14AaJUy3NnDWZI3rTB/bV
 E+7VREylJoq5fJodp3I89BlBR7qk3JlU8LWVEHaH7sQJNBEa8cIf1wW3f
 /yOp5oCd7L9wPn64XqnJMKbi58+V+lKeKVoybdvBIHkX2nX9rab7MMQrp g==;
X-CSE-ConnectionGUID: 4mAtonqURVOeTUIEgPErBw==
X-CSE-MsgGUID: O6OFMmZORD2l5p21bo2QBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927087"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927087"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:30 -0700
X-CSE-ConnectionGUID: 7Z/uL56rQ4eaQkgJbE+Lzg==
X-CSE-MsgGUID: wEjKwSqmTSm+FN2mSoy1ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131060043"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:29 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v3 10/11] lib/intel_compute: Use constants for thread groups and
 local work size
Date: Tue, 15 Apr 2025 12:13:26 +0200
Message-ID: <20250415101457.141107-11-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415101457.141107-1-francois.dugast@intel.com>
References: <20250415101457.141107-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 71 ++++++++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 30 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 6b779c340..d4609da15 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -55,6 +55,17 @@
 
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
 #define MAGIC_LOOP_STOP			0x12341234
+
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
@@ -784,9 +795,9 @@ static void xehp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00000400;
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1061,9 +1072,9 @@ static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00000400;
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
@@ -1071,9 +1082,9 @@ static void xehpc_create_indirect_data(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
 	addr_bo_buffer_batch[b++] = addr_output >> 32;
 	addr_bo_buffer_batch[b++] = loop_count;
-	addr_bo_buffer_batch[b++] = 0x00000400;
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 }
 
 static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
@@ -1164,7 +1175,7 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00180000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x0c000020;
+	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 
 	addr_bo_buffer_batch[b++] = 0x00000008;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1275,9 +1286,9 @@ static void xelpg_create_indirect_data(uint32_t *addr_bo_buffer_batch,
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
@@ -1357,10 +1368,10 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
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
@@ -1375,7 +1386,7 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00010080;
-	addr_bo_buffer_batch[b++] = 0x0c000020;
+	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 
 	addr_bo_buffer_batch[b++] = 0x00000008;
 	addr_bo_buffer_batch[b++] = 0x00000000;
@@ -1388,9 +1399,9 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00000400;
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 
@@ -1495,10 +1506,10 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
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
@@ -1519,7 +1530,7 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x0c000020;
+	addr_bo_buffer_batch[b++] = 0x0c000000 | THREADS_PER_GROUP;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00001047;
@@ -1530,9 +1541,9 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00000400;
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 
@@ -1554,9 +1565,9 @@ static void xe2_create_indirect_data_inc_kernel(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00000400;
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
+	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-- 
2.43.0

