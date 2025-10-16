Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1DBCCD199
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 16:06:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE9710E9EB;
	Thu, 16 Oct 2025 16:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHeHcFZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B280F10EA36
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760630781; x=1792166781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BWUX/lmpEHRS4K90BlUZm03Gc+zRzqbz0Teso6lD9xM=;
 b=CHeHcFZCq+TBQYi6Jo7tKeWzWK0HKOAp+CSDfcopRJRLDnmzaicfkvdR
 +QA5pJiL0MkFpCK6E7ugcR6DGZQBjaObyT4gO/XLaxqXcoe1S11HC/oZ+
 0zPkJklggjuozlKpr6DSq/Zn82FqpRF9zs7VZajRvGyB9h5Duqvtuoyo3
 EX40tFHSd8X/uDbLUNKhxTjqFOaJtX0D7zZKBqeiOQ77v2XzExO3McHYB
 TeXmulFLA4dgB/H0y2AxXSeKR+p5SKJ5hM0fTIbdQ4dYoWbDpbH/+u2Bu
 LzedhUCMGnNgWeMbUylNcwMbXYzXs6WJp5WAGFXw3AIQfgXGP0SM/LIqL w==;
X-CSE-ConnectionGUID: ZESVdRbkSK2gj54Q706XXA==
X-CSE-MsgGUID: G5+aQ0prTeKb2PkNyGelLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62877289"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62877289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:06:20 -0700
X-CSE-ConnectionGUID: dIbMVMwKRwmRU1l37Zo3kA==
X-CSE-MsgGUID: S4aWQTNjTYalRLJnUwSwzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182906773"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:06:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 matthew.brost@intel.com
Subject: [PATCH] tests/intel/xe_exec_reset: Fix LR queue not running in
 cm-gt-reset test
Date: Thu, 16 Oct 2025 16:06:20 +0000
Message-ID: <20251016160619.96782-2-jonathan.cavitt@intel.com>
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

Long-running exec queues don't get properly reset during a GT reset if
they haven't started yet, so wait for it to start before performing the
GT reset in the cm-gt-reset test.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6325
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_reset.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 9bed79af57..8f5c32389d 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -445,8 +445,10 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_exec(fd, &exec);
 	}
 
-	if (flags & GT_RESET)
+	if (flags & GT_RESET) {
+		xe_spin_wait_started(&data[0].spin);
 		xe_force_gt_reset_sync(fd, eci->gt_id);
+	}
 
 	if (flags & CLOSE_FD) {
 		if (flags & CLOSE_EXEC_QUEUES) {
-- 
2.43.0

