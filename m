Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26118C87FDA
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 05:47:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65A310E2DA;
	Mon, 11 Aug 2025 05:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTAmTzXv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE81110E2DA
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 05:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754891219; x=1786427219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EofHmQY1U/W+1Fj83tUcFzL83k5vnDCM/maeASTb9rk=;
 b=WTAmTzXvyhVuVIb2Iqs6o0WLPT3j9+/eVXYgS+u6nSjW/Zjo3kZ4ZOoF
 fXgNyRMhH/s5VQGrEaVrtkKJ3Tsow8kHgLnvhaHVpA43w8MPbpo+Q4TKq
 QlCTdnAN2uV2RHwHdtqV2Xryxt4ilI96NFlqgcZiFitwwh3E9WvNss8Cp
 6OffFyt0+ydWOwe3BLiNcDnhTG/2rUi+FAWpAzN2p+fkAANO/X49LBsaR
 YdNqhFxR8dXK4ti3zjYTDWDYbVqiz7hBqzWPEiBWDddAn14wP9+8gZRxv
 4792EEc6yIJCldYI/qfwhXaQLZWcc3OSwg/uZibQtzjXXGorv/6tKbERu Q==;
X-CSE-ConnectionGUID: AfMisbBkSvaZy8hInC0Fug==
X-CSE-MsgGUID: IK31QzDwS6SY+WKfNq+NMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="60937564"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="60937564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 22:46:59 -0700
X-CSE-ConnectionGUID: Rl/VvuJ+ThaFSL7kKaTE3w==
X-CSE-MsgGUID: nl/fiuHESGe+yLXig0zBfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166188571"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.84])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2025 22:46:57 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH i-g-t] tests/xe_compute_preempt: remove WMTP check in
 multiprocess tests
Date: Mon, 11 Aug 2025 07:46:51 +0200
Message-ID: <20250811054650.37114-2-zbigniew.kempczynski@intel.com>
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

Before forking we test WMTP preemption in test_compute_preempt()
which is synchronous. Remove this check as it is redundant, there's
dedicated 'compute-preempt' subtest which does it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Daniel Charles <daniel.charles@intel.com>
---
 tests/intel/xe_compute_preempt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 7a468e7426..c9b194869c 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -102,7 +102,6 @@ igt_main
 				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
 					  ram_mb, child_count);
 
-				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
 				igt_fork(child, child_count)
 					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
 				igt_waitchildren();
@@ -129,7 +128,6 @@ igt_main
 				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
 					  ram_mb, child_count);
 
-				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
 				igt_fork(child, child_count)
 					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
 				igt_waitchildren();
@@ -156,7 +154,6 @@ igt_main
 				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
 					  vram_mb, child_count);
 
-				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
 				igt_fork(child, child_count)
 					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
 				igt_waitchildren();
@@ -183,7 +180,6 @@ igt_main
 				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
 					  vram_mb, child_count);
 
-				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
 				igt_fork(child, child_count)
 					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
 				igt_waitchildren();
-- 
2.43.0

