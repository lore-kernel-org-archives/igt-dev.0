Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C44C982EE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 13:22:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C64A10E737;
	Mon, 21 Sep 2026 13:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bUo8d1GY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B1310E735
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789996876; x=1821532876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OQhDM1za7LUeTYweX4NdGpym3i80zvWqQOKNOy8G/2c=;
 b=bUo8d1GYo42X6FS+LRMD7E+k2T558Zv/Sd3tloD1M0+SUZ+kqy93K1LF
 43c+Rb2xzJddJZ9Vr2lTqHZeP6fNmm1WiZECDevaVfhdObmGyNxWPAqcw
 8EvyUbjNwPiYan/TwSfgJ1D3BO0ZPNt+RjOYDadwkSG1yOqrnEPbr0RAx
 iKCdVrJCjwauiZfhLPbjOTZGdrt2rK5Dr2sEasLy1aq86RlIgcmlJ+R7/
 6bx/zhcNsfkpiXdV5PHbG+RNp4cjeDbW57So8fJ0jI1MhGwBQ2+q4ALov
 oYw3Yvh+/9p6QgzNCC7NbMGg9TQnE5SXYS34QahXWqDCLSMN4Gu6LVxjX A==;
X-CSE-ConnectionGUID: jhEmLvD8TEqg2AYGA0EgrQ==
X-CSE-MsgGUID: WR/S+rmzSRqytlpd92M61A==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="108007453"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="108007453"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 06:21:16 -0700
X-CSE-ConnectionGUID: UhxxViILTzWJaHO6ltK6QA==
X-CSE-MsgGUID: 2Ae2PV49QomtSlDDl46juw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="298889508"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2026 06:21:15 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH] tests/intel/xe_waitfence: Set ABSTIME flag for abstime subtest
Date: Mon, 21 Sep 2026 18:49:33 +0530
Message-ID: <20260921131933.3321706-1-naresh.kumar.g@intel.com>
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

The abstime subtest computes an absolute CLOCK_MONOTONIC deadline, but
passes flags=0 to DRM_IOCTL_XE_WAIT_USER_FENCE. Without
DRM_XE_UFENCE_WAIT_FLAG_ABSTIME, the kernel interprets the value as a
relative timeout.

Since the absolute monotonic timestamp is much larger than the intended
10 ms wait, the ioctl can sleep until IGT's inactivity timeout kills the
test if the user fence has not already been signaled.

This was observed as:
  igt@xe_waitfence@abstime - timeout -
  Inactivity timeout exceeded. Killing the current test with SIGQUIT.

Pass DRM_XE_UFENCE_WAIT_FLAG_ABSTIME for the abstime subtest, matching the
timeout value being supplied.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 tests/intel/xe_waitfence.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index ecdce9f93..f453a4a2c 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -130,7 +130,8 @@ waitfence(int fd, enum waittype wt)
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
 		timeout = current + 10 * NSEC_PER_MSEC;
 		signalled = wait_ufence_abstime(fd, &wait_fence, 7, 0,
-						   timeout, 0);
+						   timeout,
+						   DRM_XE_UFENCE_WAIT_FLAG_ABSTIME);
 		igt_debug("wait type: ABSTIME - timeout: %" PRId64
 			  ", signalled: %" PRId64
 			  ", elapsed: %" PRId64 "\n",
-- 
2.43.0

