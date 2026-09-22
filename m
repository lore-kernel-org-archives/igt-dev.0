Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9523DC982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 17:17:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3723E10E4F6;
	Tue, 22 Sep 2026 17:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgN5hfmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F84D10E4F8
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790097415; x=1821633415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wxkMTlVnEINtK8Ef8XO9okQM9UzpSe+D7XXV2CrjqrQ=;
 b=YgN5hfmUK5cUVhuK2J0j3S9ReWLqzCEUay12+X94T+12bmWlSn5Kkrh2
 x5dunCCukdZCbZMQad6zuoXF2YfFGnLofomZVwBEnlLYjTLgasuL7Yo9S
 sOWQvlYPiyju7oYLw2y0N22DcVRtz+fXQ0LhOqAfSEpQd2sW5t/WPwonC
 Np06eYs3ZoOd2HLUgrS5U6qxz8kPXa7VTSdF5sses/LSMioM5eMuiDcHx
 qxxruGPfCIgELnD64NwSAbZ+DOErL7eQU0I4HPrUduY+BFHMmfKC+Czlj
 UwP9qSQTueixML146XtLyuRtfHh10na7sOKMYL/FqB7b0eSAk7N4zoXfO w==;
X-CSE-ConnectionGUID: FFrkQ+fVTyKN+2i5vp3kBg==
X-CSE-MsgGUID: QDsfvO8oTpKvV6h/iToGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93223910"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="93223910"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 10:16:54 -0700
X-CSE-ConnectionGUID: Gx2a9j1mTi+A/KZrGTiN1g==
X-CSE-MsgGUID: Ud5tHh9CRWC5epKBQKxHkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="281298521"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.54.85])
 by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 10:16:54 -0700
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Jia Yao <jia.yao@intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_system_allocator: skip huge-page
 multi-process tests when memory is low
Date: Tue, 22 Sep 2026 17:16:49 +0000
Message-ID: <20260922171649.2215034-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
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

The process-many-stride-mmap-new-huge subtest forks one child per GPU
engine and, with the MMAP|NEW|HUGE_PAGE flag combination (without FREE),
each child accumulates up to n_execs * SZ_2M of anonymous hugepage mmap
buffers before freeing them at cleanup.  On constrained systems the
total peak memory (n_engines * n_execs * 2 MiB) can exhaust system
RAM, trigger the OOM killer, and cause the surviving processes to time
out waiting on fences (ETIME / errno=62) rather than failing cleanly.

Add igt_require_mem_kb() that skips when MemAvailable is below the
estimated worst-case peak and call it in processes() for the
MMAP|NEW|!FREE path before any children are forked.

v2:
 - use igt_skip() instead of silently returning (Nishit)
 - also check available memory in test_exec() for the non-forked
   (many-/threads-) HUGE_PAGE|MMAP|NEW paths (Nishit)
 - fix subject prefix and use ASCII '*' in commit message (Kamil)

Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 305512dfd..45ec62813 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1173,6 +1173,24 @@ static void igt_require_hugepages(void)
 		      "No huge pages available!\n");
 }
 
+/**
+ * igt_require_mem_kb:
+ * @needed_kb: minimum required free memory in kB
+ *
+ * Skip the test if MemAvailable is below @needed_kb.  Used to avoid OOM
+ * kills in memory-hungry multi-process subtests (MMAP|NEW without FREE).
+ */
+static void igt_require_mem_kb(uint64_t needed_kb)
+{
+	/* igt_get_meminfo() returns bytes; convert to kB for comparison */
+	uint64_t avail_kb = igt_get_meminfo("MemAvailable") >> 10;
+
+	igt_skip_on_f(avail_kb < needed_kb,
+		      "Not enough memory: need %" PRIu64
+		      " kB, have %" PRIu64 " kB\n",
+		      needed_kb, avail_kb);
+}
+
 static void
 madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
 			size_t bo_size, uint64_t addr, int index)
@@ -1508,6 +1526,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & HUGE_PAGE) {
 		enable_hugepage();
 		igt_require_hugepages();
+
+		/*
+		 * MMAP | NEW without FREE accumulates n_execs hugepage buffers
+		 * before cleanup; skip if that would exhaust memory.  The
+		 * PROCESSES path is checked before forking in processes(),
+		 * since igt_skip() is not allowed from a forked child.
+		 */
+		if ((flags & MMAP) && (flags & NEW) && !(flags & FREE) &&
+		    !(flags & PROCESSES))
+			igt_require_mem_kb((uint64_t)n_execs * (SZ_2M / 1024));
 	}
 
 	if (flags & EVERY_OTHER_CHECK)
@@ -2228,6 +2256,17 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	if (flags & HUGE_PAGE) {
 		enable_hugepage();
 		igt_require_hugepages();
+
+		/*
+		 * MMAP | NEW without FREE accumulates up to n_execs hugepage
+		 * buffers per child process (one per engine), so the worst
+		 * case peak RSS is n_engines * n_execs * SZ_2M.  Check before
+		 * forking and skip if that would exhaust memory, since
+		 * igt_skip() cannot be used from the forked children.
+		 */
+		if ((flags & MMAP) && (flags & NEW) && !(flags & FREE))
+			igt_require_mem_kb(xe_number_engines(fd) *
+					   (uint64_t)n_execs * (SZ_2M / 1024));
 	}
 
 	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
-- 
2.43.0

