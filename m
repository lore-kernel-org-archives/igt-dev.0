Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A114AC55173
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 09:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5478E10E7A9;
	Fri, 20 Feb 2026 09:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0n/qOF8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B2C10E7A9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771579847; x=1803115847;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=U6dRNQXeBqLr41kwBcXpJnNVlA3jtW2ia7RgAtHre58=;
 b=L0n/qOF8rF+TE4F9scon+/cj82sm376TjICFDjckadgS4oeMTnlPe8U4
 rvshl2bDKf+eN9eea9lMcj2GQSr0m5vEilsJUP+6RGHrdSAbFXO1a9LAl
 GOX5uqyO4ZyPi45QmI9j4UiMAtT7dbwQwrooOXdZh8QunZYP1wyyxFbrV
 Q6EDyCFoEM8ktRzjFj32BrQKt0vvYu6zrnhAWaWhU57zC3lJpGt+C22Y8
 KIL4bTRLvnanlRukapwksjcx3Q/tbKPgexHjPyJnrkn9D00BQrJqQlh38
 IfOYim+88uznD84y/ZtXc7C/fnQv+Yl7CiKQQx8yukquzTd8a4AbgP0Sp g==;
X-CSE-ConnectionGUID: 0bomV9RAS9uXENq8WYqP+A==
X-CSE-MsgGUID: Vcy43Bt4Q3+bovE/mzDovw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72373788"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72373788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 01:30:47 -0800
X-CSE-ConnectionGUID: pi+ai/UrSvqGa2dJbrQ5yg==
X-CSE-MsgGUID: DOE8kCGVQwi8ZS8yanr7Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214030428"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.6])
 by orviesa010.jf.intel.com with ESMTP; 20 Feb 2026 01:30:46 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_exec_store: Enforce per-instruction
 copy limit for MEM_COPY
Date: Fri, 20 Feb 2026 09:30:40 +0000
Message-Id: <20260220093041.1911492-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220093041.1911492-1-nishit.sharma@intel.com>
References: <20260220093041.1911492-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

In this test the copy limit for MEM_COPY instruction is enforced to max
data for linear mode.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_store.c | 38 +++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 989d9e6b9..5930f16e5 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -28,6 +28,7 @@
 
 #define STORE 0
 #define COND_BATCH 1
+#define MAX_DATA_WRITE ((size_t)(262143)) //Maximum data MEM_COPY operate for linear mode
 
 struct data {
 	uint32_t batch[16];
@@ -437,13 +438,17 @@ static void mem_transection_ordering(int fd, size_t bo_size, bool fence)
 	int count = 3; // src, bounce, dest, batch
 	int i, b = 0;
 	uint64_t offset[count];
+	uint64_t dst_offset;
+	uint64_t src_offset;
 	uint32_t exec_queues, vm, syncobjs;
 	uint32_t bo[count], *bo_map[count];
 	uint64_t ahnd;
 	uint32_t *batch_map;
 	int src_idx = 0, dst_idx = 1;
+	size_t bytes_written, size;
 
-	bo_size = xe_bb_size(fd, bo_size);
+	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
+	bytes_written = bo_size;
 	vm = xe_vm_create(fd, 0, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 	exec_queues = xe_exec_queue_create(fd, vm, &inst, 0);
@@ -467,16 +472,25 @@ static void mem_transection_ordering(int fd, size_t bo_size, bool fence)
 	for (i = 0; i < bo_size; i++)
 		((uint8_t *)bo_map[src_idx])[i] = i % bo_size;
 
-	batch_map[b++] = MEM_COPY_CMD;
-	batch_map[b++] = bo_size - 1;// src # of bytes
-	batch_map[b++] = 0; //src height
-	batch_map[b++] = -1; // src pitch
-	batch_map[b++] = -1; // dist pitch
-	batch_map[b++] = offset[src_idx];
-	batch_map[b++] = offset[src_idx]  >> 32;
-	batch_map[b++] = offset[dst_idx];
-	batch_map[b++] = offset[dst_idx]  >> 32;
-	batch_map[b++] = intel_get_uc_mocs_index(fd) << 25 | intel_get_uc_mocs_index(fd);
+	dst_offset = offset[dst_idx];
+	src_offset = offset[src_idx];
+	while (bo_size) {
+		size = min(MAX_DATA_WRITE, bo_size);
+		batch_map[b++] = MEM_COPY_CMD;
+		batch_map[b++] = size - 1;// src # of bytes
+		batch_map[b++] = 0; //src height
+		batch_map[b++] = -1; // src pitch
+		batch_map[b++] = -1; // dist pitch
+		batch_map[b++] = src_offset;
+		batch_map[b++] = src_offset  >> 32;
+		batch_map[b++] = dst_offset;
+		batch_map[b++] = dst_offset  >> 32;
+		batch_map[b++] = intel_get_uc_mocs_index(fd) << 25 | intel_get_uc_mocs_index(fd);
+
+		src_offset += size;
+		dst_offset += size;
+		bo_size -= size;
+	}
 	if (fence)
 		batch_map[b++] = MI_MEM_FENCE | MI_WRITE_FENCE;
 
@@ -489,7 +503,7 @@ static void mem_transection_ordering(int fd, size_t bo_size, bool fence)
 	igt_assert(syncobj_wait(fd, &syncobjs, 1, INT64_MAX, 0, NULL));
 
 	if (fence) {
-		igt_assert(memcmp(bo_map[src_idx], bo_map[dst_idx], bo_size) == 0);
+		igt_assert(memcmp(bo_map[src_idx], bo_map[dst_idx], bytes_written) == 0);
 	} else {
 		bool detected_out_of_order = false;
 
-- 
2.34.1

