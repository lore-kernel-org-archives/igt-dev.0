Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10284CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 18:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B028510F032;
	Tue, 29 Sep 2026 18:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8qw6QSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2191410E130
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790707668; x=1822243668;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MGVStmZ3ZccObFTZX3HFld37N1LU1th//xOpM3HrNvE=;
 b=b8qw6QSdnXrZQmFtTD5EnDlWdCfeziwB1x7gEa71fPMVd12j92z7XxUu
 5inqaePjLCWzA8IpaQmf5k/A1PPDs3xsEOlPKYRr35Nba0rv8YXabTNlm
 BI3DY0/oV46jYtjWuf5WzJMHJV3O0ZIadnAUkKrGZVYAvCmYLQmk6BbwB
 UeWlSzXZb8Cw4hN8uxS3ID8XLy79uE2KXwRZnG6XsTZBAVbAuYhTWDxJv
 QZAdAuS92JzEAgPVgvjmAxIMp0HpBJp7asKr6uo45hBrYN6EePa9rhIGX
 Ybgf7hO2fYeY+HM96452nGT3zOdl5DBLzLDtTF6HOYcqHjrKKNQiWN1TQ w==;
X-CSE-ConnectionGUID: GUfHePdjRVigqw+MNbpqhg==
X-CSE-MsgGUID: SApN3Kq+S8K2GCOI6XZZlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93925880"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="93925880"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:47:48 -0700
X-CSE-ConnectionGUID: GOJ9uztVR4apgxn0PJ8mVg==
X-CSE-MsgGUID: Ut4cW7rUR0mTmAV49Hai+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="304963689"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa002.jf.intel.com with ESMTP; 29 Sep 2026 11:47:47 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t 1/1] intel-ci: remove pxp from NVL blocklist
Date: Tue, 29 Sep 2026 11:47:45 -0700
Message-ID: <20260929184745.2208854-2-alan.previn.teres.alexis@intel.com>
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

We plan to added GSC FW with PXP support for NVL-S now.
However, it was still in the block list so let's remove this.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 7de332352..17d34b99b 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -63,15 +63,10 @@ igt@xe_compute@eu-busy-10s
 #     balancing, which NVL does not expose.
 #   - xe_oa@oa-tlb-invalidate: OA TLB invalidation test relies
 #     on a specific OA unit configuration not present on NVL.
-#   - xe_pxp@.*: PXP (Protected Xe Path) content protection
-#     requires a TEE (Trusted Execution Environment) and
-#     associated firmware, which NVL does not support.
 ##################################################################
 igt@xe_exec_balancer@.*
-igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 igt@xe_huc_copy@huc_copy
 igt@xe_oa@oa-tlb-invalidate
-igt@xe_pxp@.*
 ##################################################################
 # Valid skip: test applicable only for i2c capable systems
 ##################################################################

base-commit: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2
-- 
2.43.0

