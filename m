Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D08E81BD2
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD7F10E26C;
	Wed, 11 Feb 2026 09:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZLQx7Vw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEF910E26C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770801512; x=1802337512;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vJlc5pqCgGnXDQ0Rp3O5wFx65fW5XuA14K3S6g0WSdM=;
 b=JZLQx7VwyHEt3AxD4g/OlvJkpKPIBnbLteIoko9v7AaLFbvXrW9a4GNq
 6lF24Ipa3I/hMUDtx02IzaykamApPpQMnTAERoZG1ghR/v83r+LhUWeqN
 X4AlecEDJKRSL80ZItZCvGUXzNRVUGcKOSMblYZ8U3VSPss3DG45EnOfl
 pi23nxQ2f8oNbus498OUP03TwRZHGGTI3UoYxvcJD0K8Ij5cbop2txSN6
 6mKnpZDesF3iDl37D4ZcPkBY1UOdppMOn9r7jIttrYLPaLCqDc5cWnoNg
 D0FQJLxZIo14JGLqUr7RJzayCZkGQ77JRTgEpWQLMLCw5A1jTbTcsuxwi Q==;
X-CSE-ConnectionGUID: Bkv8HAf/QfOssWZ6fqqi/Q==
X-CSE-MsgGUID: pXy8rPDqQdOZCsJqB3rphA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83386736"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83386736"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:18:31 -0800
X-CSE-ConnectionGUID: w8NKgidRQSagalTPQqPdVA==
X-CSE-MsgGUID: +L0A2syYTjSiB/9wsPheyQ==
X-ExtLoop1: 1
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2026 01:18:29 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add helpers to
 enable and reset hugepages for test execution
Date: Wed, 11 Feb 2026 09:18:29 +0000
Message-ID: <20260211091829.1003250-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
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

Introduce helper functions to programmatically control the number
of hugepages via /proc/sys/vm/nr_hugepages. This allows tests that
require hugepage-backed memory to be executed reliably instead of
being skipped due to insufficient hugepages. The helpers ensure
hugepages are enabled before relevant subtests and reset after
improving test coverage and robustness.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 44 ++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index fc987ac7f..14f5e358f 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -31,6 +31,7 @@
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 #define QUARTER_SEC		(NSEC_PER_SEC / 4)
 #define FIVE_SEC		(5LL * NSEC_PER_SEC)
+#define NUM_HUGE_PAGES		128
 
 struct test_exec_data {
 	uint32_t batch[32];
@@ -55,6 +56,28 @@ struct batch_data {
 })
 #define READ_VALUE(data__)	((data__)->expected_data)
 
+bool is_hugepg_enable = false;
+
+static void set_nr_hugepages(int n)
+{
+	char cmd[64];
+
+	snprintf(cmd, sizeof(cmd), "echo %d > /proc/sys/vm/nr_hugepages", n);
+	igt_assert(system(cmd) == 0);
+}
+
+static void reset_nr_hugepages(void)
+{
+	set_nr_hugepages(0);
+	is_hugepg_enable = false;
+}
+
+static void enable_hugepage(void)
+{
+	set_nr_hugepages(NUM_HUGE_PAGES);
+	is_hugepg_enable = true;
+}
+
 static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
 			int *idx)
 {
@@ -1444,8 +1467,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
 		return;
 
-	if (flags & HUGE_PAGE)
+	if (flags & HUGE_PAGE) {
+		enable_hugepage();
 		igt_require_hugepages();
+	}
 
 	if (flags & EVERY_OTHER_CHECK)
 		igt_assert(flags & MREMAP);
@@ -1984,6 +2009,9 @@ cleanup:
 	}
 	if (free_vm)
 		xe_vm_destroy(fd, vm);
+
+	if (is_hugepg_enable)
+		reset_nr_hugepages();
 }
 
 struct thread_data {
@@ -2036,8 +2064,10 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	if ((FILE_BACKED | FORK_READ) & flags)
 		return;
 
-	if (flags & HUGE_PAGE)
+	if (flags & HUGE_PAGE) {
+		enable_hugepage();
 		igt_require_hugepages();
+	}
 
 	xe_for_each_engine(fd, hwe)
 		++n_engines;
@@ -2115,6 +2145,9 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 			free(alloc);
 	}
 	free(threads_data);
+
+	if (is_hugepg_enable)
+		reset_nr_hugepages();
 }
 
 static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
@@ -2150,8 +2183,10 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	if (flags & FORK_READ)
 		return;
 
-	if (flags & HUGE_PAGE)
+	if (flags & HUGE_PAGE) {
+		enable_hugepage();
 		igt_require_hugepages();
+	}
 
 	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
 	posix_fallocate(map_fd, 0, sizeof(*pdata));
@@ -2171,6 +2206,9 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 
 	close(map_fd);
 	munmap(pdata, sizeof(*pdata));
+
+	if (is_hugepg_enable)
+		reset_nr_hugepages();
 }
 
 /* compute flags */
-- 
2.34.1

