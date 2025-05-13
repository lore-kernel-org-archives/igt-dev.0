Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1612C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 17:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5310E230;
	Tue, 13 May 2025 17:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDQtJ+Fu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EC510E221
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 17:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747156038; x=1778692038;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qeA6cAFHaBRV75obNP2u3qrjQdu2Jaged6LNACGFr4A=;
 b=bDQtJ+FuFnzBXQlIvZniUT/NspAu0aTxBgEMM6BynULkTYcIfIGNmrLB
 zWHUyJhu8paUhz/Bm7u1ZqkOqLF7FINtDa+iG9xOR9+/NQ2HYdt7Ic0Vk
 V2ZyAxt0LZLctBSY151sCUw50RY8Gy6iCh3PTIApg0cuYHN9hHk3YOsEZ
 JjHvAwIBjuNH90wnrR2bGmFODEyJd8u1i89oEocxsukmgg/7pGIne0qj2
 LZDCU3Zp7JWt+ZrzrqpUcaExG24+rEjp1o+7BQ2BfQ4xuU/1TGGyD678h
 Q3Z49TeuIduGaTW+mQtGicUifGLmtqrBP0HYul4hVB+V7sNGjOoUQ22ES Q==;
X-CSE-ConnectionGUID: 1nyoNf/cRIOXllJo6v0c2g==
X-CSE-MsgGUID: eK9vNbo4SRGRqbH6Gr8psA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48269611"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48269611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 10:07:17 -0700
X-CSE-ConnectionGUID: qh0pqZqfQfG2tcEQ7XAYPQ==
X-CSE-MsgGUID: VJTAbdZ9RgSJ60auOZQZRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="174894243"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa001.jf.intel.com with ESMTP; 13 May 2025 10:07:17 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: [PATCH 3/3] tests/intel/xe_exec_system_allocator: Rebind the prefetch
 ranges
Date: Tue, 13 May 2025 17:07:11 +0000
Message-Id: <20250513170711.14518-4-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test rebinds the prefetch ranges to check the ideal behaviour of prefetch mechanisim,
expecting address ranges in the corresponding mem regions has to be created again and
use those address ranges to submit workloads.

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 47 +++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index c3f0e61f3..94907847c 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -484,6 +484,24 @@ static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
  * Description: Prefetch of mutliple ranges within arg[1] size and check if multiple ranges are created
  * Test category: functionality test
  *
+ * SUBTEST: bind-vram-%s
+ * Description: Validate prefetch-smem of size arg[1] by rebinding them with prefetch-vram to
+ * 		check the behaviour, ideal behaviour is to migrate ranges
+ * Test category: functionality test
+ *
+ * SUBTEST: bind-smem-%s
+ * Description: Validate prefetch-smem of size arg[1] by rebinding them with prefetch-vram
+ * 		check the behaviour, ideal behaviour is to migrate ranges
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-bind-vram-%s
+ * Description: Validate multiple ranges of size arg[1] by binding them with multiple ranges at vram
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-bind-smem-%s
+ * Description: Validate multiple ranges of size arg[1] by binding them with multiple ranges at smem
+ * Test category: functionality test
+ *
  * arg[1]:
  *
  * @SZ_4K: SZ_4K
@@ -492,7 +510,7 @@ static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
  */
 #define MAX_BATCH_DWORDS 16
 static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
-		     size_t bo_size, unsigned int flags, int num_dwords)
+		     size_t bo_size, unsigned int flags, int num_dwords, bool bind)
 {
 	struct batch_data *data;
 	uint64_t target_addr;
@@ -542,6 +560,13 @@ static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[0].addr = to_user_pointer(exec_ufence);
 	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
 	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	if (bind) {
+		exec_ufence[0] = 0;
+		sync[0].addr = to_user_pointer(exec_ufence);
+		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 0 : 1);
+		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		exec_ufence[0] = 0;
+	}
 	exec.exec_queue_id = exec_queues;
 
 	for (int i = 0; i < num_dwords; i++) {
@@ -2045,16 +2070,28 @@ igt_main
 
 	for (m = mode; m->name; m++) {
                 igt_subtest_f("prefetch-smem-%s", m->name)
-                        prefetch(fd, &engine->instance, m->size, 0, 1);
+                        prefetch(fd, &engine->instance, m->size, 0, 1, 0);
 
                 igt_subtest_f("prefetch-vram-%s", m->name)
-                        prefetch(fd, &engine->instance, m->size, VRAM, 1);
+                        prefetch(fd, &engine->instance, m->size, VRAM, 1, 0);
 
                 igt_subtest_f("multi-range-smem-%s", m->name)
-                        prefetch(fd, &engine->instance, m->size, 0, 10);
+                        prefetch(fd, &engine->instance, m->size, 0, 10, 0);
 
                 igt_subtest_f("multi-range-vram-%s", m->name)
-                        prefetch(fd, &engine->instance, m->size, VRAM, 10);
+                        prefetch(fd, &engine->instance, m->size, VRAM, 10, 0);
+
+		igt_subtest_f("bind-vram-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, 0, 1, 1);
+
+		igt_subtest_f("bind-smem-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, VRAM, 1, 1);
+
+		igt_subtest_f("multi-range-bind-vram-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, 0, 10, 1);
+
+		igt_subtest_f("multi-range-bind-smem-%s", m->name)
+			prefetch(fd, &engine->instance, m->size, VRAM, 10, 1);
         }
 
 	igt_fixture {
-- 
2.34.1

