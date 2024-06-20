Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372BBC41513
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 03:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12810E249;
	Thu, 20 Jun 2024 03:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dx30KRLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6942010E155
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 03:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718855422; x=1750391422;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UBNOyk7/P982hyYeC2Q+oURzyxQ9CYmH+Yluz2aeZ6w=;
 b=dx30KRLYyUCK+tAxd0LRm9TZg2ROPqFTJXDc3dQsiXhqzrvfOKX3DnHm
 6bvNKpYhau7/z9q/GlY9dUFk10tNi3pJbEnB+/Qo89BzeRNGHyo1KVph0
 FrL3oXVnN68YXVfFFajP5vWraslAX12aMZhrkUSi7g4glOLTnvsTnJ7Zr
 z908FKbKxKreehEcjwYJEKQmhrePxVqwE02DmfAuWubKSpX5ESCfvpWNB
 ua4qQ6Rz8OQ2UJ2rlXKvU8Y6xLr9nxmyNG7e85R5FkFWZRCw5QEWz0jSO
 BGE2+UUQWEE/x0QnaC8WVaJi21viIM4noxpb8epEFOQ6DiRoiEOqnV+ao g==;
X-CSE-ConnectionGUID: RO4pGKHsTOeCIEQb0yypcA==
X-CSE-MsgGUID: PLvHQ6GYSF279yKivyOEyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="18725859"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="18725859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 20:50:20 -0700
X-CSE-ConnectionGUID: 0iI2S3vJQeSi2dN/7GWn5Q==
X-CSE-MsgGUID: p4qkWvupQvOD3ng4SaCwXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="65360022"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 20:50:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] xe_exec_system_allocator: Add benchmark
Date: Wed, 19 Jun 2024 20:50:57 -0700
Message-Id: <20240620035057.3609916-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620035057.3609916-1-matthew.brost@intel.com>
References: <20240620035057.3609916-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 31 +++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 7b85f85e5e..1b93d6d87a 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -13,6 +13,7 @@
 
 #include <fcntl.h>
 #include <linux/mman.h>
+#include <time.h>
 
 #include "igt.h"
 #include "lib/igt_syncobj.h"
@@ -62,7 +63,8 @@ static void check_all_pages(void *ptr, uint64_t alloc_size, uint64_t stride)
 }
 
 static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
-			    uint64_t alloc_size, uint64_t stride)
+			    uint64_t alloc_size, uint64_t stride,
+			    struct timespec *tv, uint64_t *submit)
 {
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -97,6 +99,9 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 		igt_assert(b <= ARRAY_SIZE(data->batch));
 	}
 
+	igt_nsec_elapsed(tv);
+	*submit = igt_nsec_elapsed(tv);
+
 	addr = to_user_pointer(ptr);
 	for (i = 0; i < n_writes; ++i, addr += stride) {
 		struct batch_data *data = ptr + i * stride;
@@ -147,6 +152,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 #define odd(__i)	(__i & 1)
 
 #define MIX_BO_ALLOC	(0x1 << 0)
+#define BENCHMARK	(0x1 << 1)
 
 #define SYNC_FILE	"/tmp/xe_exec_system_allocator_sync"
 
@@ -185,9 +191,12 @@ evict(int fd, struct drm_xe_engine_class_instance *eci, uint64_t total_alloc,
       unsigned int flags)
 {
 	uint32_t vm, exec_queue;
-	int num_allocs = (9 * (total_alloc / alloc_size)) / 8;
+	int num_allocs = flags & BENCHMARK ? 1 :
+		(9 * (total_alloc / alloc_size)) / 8;
 	void **allocs;
 	uint32_t *bos = NULL;
+	struct timespec tv = {};
+	uint64_t submit, read, elapsed;
 	int i;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
@@ -227,14 +236,24 @@ evict(int fd, struct drm_xe_engine_class_instance *eci, uint64_t total_alloc,
 		}
 		allocs[i] = alloc;
 
-		touch_all_pages(fd, exec_queue, allocs[i], alloc_size, stride);
+		touch_all_pages(fd, exec_queue, allocs[i], alloc_size, stride,
+				&tv, &submit);
 	}
 
 	if (barrier)
 		pthread_barrier_wait(barrier);
 
 	for (i = 0; i < num_allocs; ++i) {
+		if (flags & BENCHMARK)
+			read = igt_nsec_elapsed(&tv);
 		check_all_pages(allocs[i], alloc_size, stride);
+		if (flags & BENCHMARK) {
+			elapsed = igt_nsec_elapsed(&tv);
+			printf("Execution took %.3fms (submit %.1fus, read %.1fus, total %.1fus, read_total %.1fus)\n",
+			       1e-6 * elapsed, 1e-3 * submit, 1e-3 * read,
+			       1e-3 * (elapsed - submit),
+			       1e-3 * (elapsed - read));
+		}
 		if (bos && bos[i]) {
 			munmap(allocs[i], alloc_size);
 			gem_close(fd, bos[i]);
@@ -1262,6 +1281,12 @@ igt_main
 			break;
 		}
 
+	igt_subtest_f("fault-benchmark")
+		xe_for_each_engine(fd, hwe) {
+			evict(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL, BENCHMARK);
+			break;
+		}
+
 	for (const struct section *s = esections; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name)
 			xe_for_each_engine(fd, hwe) {
-- 
2.34.1

