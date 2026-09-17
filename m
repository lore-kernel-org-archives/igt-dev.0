Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD97C88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 23:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E5A10E027;
	Thu, 17 Sep 2026 23:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDA7jQnY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E8B10E027
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 23:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789686479; x=1821222479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x51Sxih6PGYPdsfiv8qyKXfwkJQ169XF9WkoxvgbGnU=;
 b=SDA7jQnYxz3nV38JOMh+k+t9ENww70q5wAi63RKlBhMNABom1eWUPf8f
 6ruM4J5/cnTJXIA7RkLHUbqM249dUgiNtwc+NbRKOegVq30yYQ5WV/vWl
 dGtQenXeFqgPn8DnpFnSgjCOUBDnNQJPOFrLuFS2MqALZGSHeETFox1ea
 gy9JQoVNsCnBMRF4RHH2+tIZgbB/W31g1Nq9l/eRm+6d4h7aXVzGTA8a5
 ANpwuTxdeyrhTZhkjn+yA2YrgD5qBr1jfrraLavn6uvHriZ2MIVpaKwd7
 GaVyx3/3GEs6ANvic4JMtKMvWmPjVLwX+yA1CsMHNV0LQqeTNZiu8McPL g==;
X-CSE-ConnectionGUID: xCxEwx66SIej7A8wQ8sdRQ==
X-CSE-MsgGUID: a9uSZUX/TbaYHBDkl3ywCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93993392"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93993392"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 16:07:58 -0700
X-CSE-ConnectionGUID: sLmHgsITTumMxpdP524VyA==
X-CSE-MsgGUID: e2WJ2jpYRTGBH/Jn0s8Y6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2273764"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.54.85])
 by fmviesa012.fm.intel.com with ESMTP; 17 Sep 2026 16:07:59 -0700
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Jia Yao <jia.yao@intel.com>
Subject: [PATCH] tests/xe_exec_system_allocator: skip huge-page multi-process
 tests when memory is low
Date: Thu, 17 Sep 2026 23:07:48 +0000
Message-ID: <20260917230748.1825181-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
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

The process-many-stride-mmap-new-huge subtest forks one child per GPU
engine and, with the MMAP|NEW|HUGE_PAGE flag combination (without FREE),
each child accumulates up to n_execs×SZ_2M of anonymous hugepage mmap
buffers before freeing them at cleanup.  On constrained systems the
total peak memory (n_engines × n_execs × 2 MiB) can exhaust system
RAM, trigger the OOM killer, and cause the surviving processes to time
out waiting on fences (ETIME / errno=62) rather than failing cleanly.

Add igt_require_mem_kb() that skips when MemAvailable is below the
estimated worst-case peak and call it in processes() for the
MMAP|NEW|!FREE path before any children are forked.

Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 305512dfd..1f57ab0a3 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1173,6 +1173,28 @@ static void igt_require_hugepages(void)
 		      "No huge pages available!\n");
 }
 
+/**
+ * igt_require_mem_kb:
+ * @needed_kb: minimum required free memory in kB
+ *
+ * Report whether MemAvailable is sufficient.  Used to avoid OOM kills in
+ * memory-hungry multi-process subtests (MMAP|NEW without FREE).
+ */
+static bool igt_require_mem_kb(uint64_t needed_kb)
+{
+	/* igt_get_meminfo() returns bytes; convert to kB for comparison */
+	uint64_t avail_kb = igt_get_meminfo("MemAvailable") >> 10;
+
+	if (avail_kb < needed_kb) {
+		igt_info("Not enough memory: need %" PRIu64
+			 " kB, have %" PRIu64 " kB; test not run\n",
+			 needed_kb, avail_kb);
+		return false;
+	}
+
+	return true;
+}
+
 static void
 madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
 			size_t bo_size, uint64_t addr, int index)
@@ -2228,6 +2250,23 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	if (flags & HUGE_PAGE) {
 		enable_hugepage();
 		igt_require_hugepages();
+
+		/*
+		 * MMAP|NEW without FREE accumulates up to n_execs hugepage
+		 * buffers per child process (one per engine).  Each buffer is
+		 * at least SZ_2M after the HUGE_PAGE alignment, so the worst
+		 * case peak RSS is n_engines * n_execs * SZ_2M.  Skip early
+		 * if free memory is insufficient to avoid OOM kills that turn
+		 * the test into a timeout rather than a clean failure.
+		 */
+		if ((flags & MMAP) && (flags & NEW) && !(flags & FREE)) {
+			uint64_t n_engines = xe_number_engines(fd);
+			uint64_t need_kb = n_engines * (uint64_t)n_execs *
+					   (SZ_2M / 1024);
+
+			if (!igt_require_mem_kb(need_kb))
+				return;
+		}
 	}
 
 	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
-- 
2.43.0

