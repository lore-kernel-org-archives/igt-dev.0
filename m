Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C169CD98C7
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 08:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2669110E794;
	Wed, 10 Jun 2026 08:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpuPmGRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1328510E794
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781078539; x=1812614539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y5YTW4L+j0Ji64wfBGcYvhwL30gqPIDOB5ByUUJ9Vm4=;
 b=YpuPmGRHikwABbpKQy4vK6+DqigUc/99ot3BHkjYmrJwHuBKM5DIr+fR
 pVRMk1ROCoPLg3BTaepH+oQYDik8EpIA0bKnYWne/E0Rtgch286sDsHqM
 dhJod4ZU4qPVB/PLaS91iTMNjN0gueGJgzw/Qgn0tOpMgrQo7ulIEwuXM
 P2o37gbM0qAXXbRZP6Rgm7aCI7uQXTAQis/yC5RT/EMgO59xebMzILSUP
 Qyh/hS1PXCcVPNK5nRXSBv/cyOoZ4b4jX/HZRoZYdIHGQmamPMiZVYvrr
 lVQgjOp8o0/R/8GKcF9rPXmpL6LyTBN6+oQyMCWI9zyvsTX+fAjFPzhoy w==;
X-CSE-ConnectionGUID: KsCas4MUTsmRBi4MtJG9lw==
X-CSE-MsgGUID: YX/8a8JhQIq2/vo5AN/vOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81866918"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81866918"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 01:02:18 -0700
X-CSE-ConnectionGUID: PgcMlRARQyWl8WSBDtacKA==
X-CSE-MsgGUID: iQonNKPeSGmWkMa0tfnpHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="243638092"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 01:02:16 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	pravalika.gurram@intel.com
Subject: [i-g-t] tests/intel/xe_madvise: Skip purge tests under low RAM
Date: Wed, 10 Jun 2026 13:32:06 +0530
Message-ID: <20260610080206.1470008-1-arvind.yadav@intel.com>
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

The purge tests create memory pressure to trigger BO eviction. If the
system is already low on RAM, this extra pressure can push the machine
into OOM and kill the test before it can clean up.

Check available RAM before starting the pressure allocation and skip when
there is not enough memory.

Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index cdb115d7e..f9e2c4735 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -83,7 +83,7 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
 static void trigger_memory_pressure(int fd)
 {
 	uint64_t mem_size, overpressure;
-	const uint64_t chunk = 8ull << 20; /* 8 MiB */
+	const uint64_t chunk = 8ULL << 20; /* 8 MiB */
 	int max_objs, n = 0;
 	uint32_t *handles;
 	uint64_t total;
@@ -98,14 +98,18 @@ static void trigger_memory_pressure(int fd)
 
 	/* dGPU: fill VRAM + 50 % to force TTM eviction */
 	mem_size = xe_visible_vram_size(fd, 0);
-	overpressure = mem_size / 2;
-	if (overpressure < (64 << 20))
-		overpressure = 64 << 20;
+	overpressure = max_t(uint64_t, mem_size / 2, 64ULL << 20);
+	max_objs = DIV_ROUND_UP(mem_size + overpressure, chunk);
+
+	/*
+	 * Pressure BOs are faulted in and kept alive until cleanup. If the
+	 * system is already low on RAM, this can cause OOM.
+	 */
+	igt_require_memory(max_objs, chunk, CHECK_RAM);
 
 	/* Separate VM so pressure BOs don't interfere with the test */
 	vm = xe_vm_create(fd, 0, 0);
 
-	max_objs = (mem_size + overpressure) / chunk + 1;
 	handles = malloc(max_objs * sizeof(*handles));
 	igt_assert(handles);
 
-- 
2.43.0

