Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E96AC61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 20:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFD510EAF7;
	Mon, 31 Aug 2026 20:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5Hw7evu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A332510EAF7
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788209103; x=1819745103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j+vj/QIJLMmVarxSJe5tgBKp0deOAU8GRZlbMMDPfsg=;
 b=C5Hw7evuVjUTaHP7Ask063RqabXwgmPQW87n8rlTBohl/rx76YKccW4j
 Ti+KuEuprMn8Ny1Rc7H2cXqDfjNULxXGwe7sI5aJpJwYFCnStecN3zVBr
 KtTBYk4p5kEWQTWCkuco75gBhtLebtfeSZ1ULcJBdXC0OhE8zIrQh4vk2
 rPLSRVCsIrNmupeSL4286YCBrjmdD8QGiAFDKemNDPH1bx5YCTQUnQS7/
 up5X+IMKrDwVu0rP/QatzHrcPIfCD+sbCqRZKoo82jUqG+G9dLkgqTj+1
 7KeJQ1WRgVGrdzwzZXH1X5WN22CPZTi7l/3qV1kuPbPyjnfvW0zSAFb57 Q==;
X-CSE-ConnectionGUID: RZFtCNb8TtGPF4l8EmA91Q==
X-CSE-MsgGUID: /MVu9t6DTuiovPgOPNRsFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="106147112"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="106147112"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 13:45:03 -0700
X-CSE-ConnectionGUID: udR8lGTOS8ao0bSkqTeRZA==
X-CSE-MsgGUID: db7xFG1PTaWieleV8QRy+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="268345625"
Received: from mdroper-desk1.fm.intel.com ([10.121.64.167])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 13:45:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pmu: Ensure stash_gt_freq allocates
 sufficient storage
Date: Mon, 31 Aug 2026 13:44:56 -0700
Message-ID: <20260831204455.1242947-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.55.0
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

stash_gt_freq() malloc's arrays based on the number of GTs returned by
the kernel's query ioctl and then indexes into the arrays by uapi GT ID.
This works fine if all GT IDs are consecutive (which is always the case
on platforms today), but will be insufficient if future platforms allow
the list to contain non-consecutive IDs (e.g., 0, 2, ...).  Allocate
storage based on the maximum GT ID returned, not the number of GTs
returned.  Some of the array indices will remain unused, but the
xe_for_each_gt() loops will already skip over those unused entries
properly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index a8ceac46c..ea8950ee5 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1039,12 +1039,12 @@ static void unprovision_and_disable_vfs(int fd)
 
 static void stash_gt_freq(int fd, uint32_t **stash_min, uint32_t **stash_max)
 {
-	int num_gts, gt;
+	int max_gt, gt;
 
-	num_gts = xe_number_gt(fd);
+	max_gt = xe_dev_max_gt(fd);
 
-	*stash_min = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
-	*stash_max = (uint32_t *) malloc(sizeof(uint32_t) * num_gts);
+	*stash_min = (uint32_t *)calloc(max_gt + 1, sizeof(uint32_t));
+	*stash_max = (uint32_t *)calloc(max_gt + 1, sizeof(uint32_t));
 
 	igt_skip_on(*stash_min == NULL || *stash_max == NULL);
 
-- 
2.55.0

