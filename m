Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F82AEA3F35
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 10:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEAC10E545;
	Tue, 10 Feb 2026 10:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sh42+qxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EFF10E545
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 10:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770719677; x=1802255677;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gg0wlUtL/LbDnZ4T7YNoB/SY685hu9oLE4Qduruq2cs=;
 b=Sh42+qxxFRCTmcRQXj6lygAkx1nRWjVOXPb8MCbWhrnjc/JBQ03DbVnA
 39v0kxhJrZyDhLqS3WcLmwp7qaB7YNpjjlQqpGJxE6FoA0MIwXZALSoLx
 3GhKTC9GT+BvPcUH0fEoS1KjQtRMx5DbrEskTMMKSHxPUHRCLrKYPDyWN
 CTs0VpeLvcunskBlqzptJdf2XxsBA3T9RB/+N81z6PEk5Tn+qa9eWE5YR
 mOaBm4+j6IQ0Yi4a9aQsx2IXTLzyJdYxPd8zBM5ATEga+DgB2u4kyw4FY
 jzr72JOtXl9W/0jKCbycwXnILjfCECWY7DJFah+f3vN5gIZwAON/lKsYY g==;
X-CSE-ConnectionGUID: HVmPZHDaRsC/l1QM5AgmEw==
X-CSE-MsgGUID: BeTr0A0IS8e8Lwcockw/zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82948887"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82948887"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 02:34:36 -0800
X-CSE-ConnectionGUID: +pZBumOoQ3WjiOgN/gxnFg==
X-CSE-MsgGUID: t1/4GG6vT3C/CEl7e+wC9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216414249"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 02:34:36 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add helpers to
 enable and reset hugepages for test execution
Date: Tue, 10 Feb 2026 10:34:36 +0000
Message-ID: <20260210103436.739323-1-nishit.sharma@intel.com>
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
 tests/intel/xe_exec_system_allocator.c | 43 ++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index fc987ac7f..fa0c49b70 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -55,6 +55,28 @@ struct batch_data {
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
+	set_nr_hugepages(128);
+	is_hugepg_enable = true;
+}
+
 static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
 			int *idx)
 {
@@ -1444,8 +1466,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
 		return;
 
-	if (flags & HUGE_PAGE)
+	if (flags & HUGE_PAGE) {
+		enable_hugepage();
 		igt_require_hugepages();
+	}
 
 	if (flags & EVERY_OTHER_CHECK)
 		igt_assert(flags & MREMAP);
@@ -1984,6 +2008,9 @@ cleanup:
 	}
 	if (free_vm)
 		xe_vm_destroy(fd, vm);
+
+	if (is_hugepg_enable)
+		reset_nr_hugepages();
 }
 
 struct thread_data {
@@ -2036,8 +2063,10 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	if ((FILE_BACKED | FORK_READ) & flags)
 		return;
 
-	if (flags & HUGE_PAGE)
+	if (flags & HUGE_PAGE) {
+		enable_hugepage();
 		igt_require_hugepages();
+	}
 
 	xe_for_each_engine(fd, hwe)
 		++n_engines;
@@ -2115,6 +2144,9 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 			free(alloc);
 	}
 	free(threads_data);
+
+	if (is_hugepg_enable)
+		reset_nr_hugepages();
 }
 
 static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
@@ -2150,8 +2182,10 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	if (flags & FORK_READ)
 		return;
 
-	if (flags & HUGE_PAGE)
+	if (flags & HUGE_PAGE) {
+		enable_hugepage();
 		igt_require_hugepages();
+	}
 
 	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
 	posix_fallocate(map_fd, 0, sizeof(*pdata));
@@ -2171,6 +2205,9 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 
 	close(map_fd);
 	munmap(pdata, sizeof(*pdata));
+
+	if (is_hugepg_enable)
+		reset_nr_hugepages();
 }
 
 /* compute flags */
-- 
2.34.1

