Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646C6C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 11:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2057C10E1F3;
	Thu, 25 Jul 2024 11:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akSLtLyO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E973C10E1F3
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 11:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721908027; x=1753444027;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F1Rtx56SNWrXbKAI2DJShL5KWSoh6kGLsiWhLnk0drQ=;
 b=akSLtLyOMsrMD28dr/XJ5xTg697bYCIoa5EXyLA+x/Blr67RIdYAF3pO
 EW//YMu9KodQf+yq8FOh/kgZkv7D/SHuAQQ3I4rKgyV3YESj4PQUy7HVu
 563mXczALbaQEUNDc5/DpGQj4Vjk2I1Bb12of1Tnm1By9vu+hoS+HF1sQ
 8czmoCUIZRHKfzfOPVIGCf6FdDAfm9Xd9ctc/IMB55EFSNcpSgoudF+p5
 UUEY4FhqeFWrsXhb9+eSy9xePMhpoIzh3JMO/Ps/T+ULV+lkBQXhzrxth
 B49ZrIEC5jVA6jgkgb1YKWGmd3MeiYpCeI4o30RMxF+ZLZ1gY4Rf50Y/F g==;
X-CSE-ConnectionGUID: 0bEVVjxvSfqpNwjMzhFzdg==
X-CSE-MsgGUID: cgrBvz1JQLGke6te/QstQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19789145"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="19789145"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 04:47:07 -0700
X-CSE-ConnectionGUID: l8QSXzLBQPydFIPvKNKMhg==
X-CSE-MsgGUID: ik4UNkZHSpWhkvXk+efkng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="52587633"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 04:47:03 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 sk.anirban@intel.com, riana.tauro@intel.com
Subject: [PATCH i-g-t] tests/intel/i915_pm_rps: Disable subtest thresholds
 tests when SLPC is enabled
Date: Thu, 25 Jul 2024 17:17:07 +0530
Message-Id: <20240725114707.102373-1-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Sk Anirban <sk.anirban@intel.com>

Skip these tests when SLPC is enabled as it fails frequently. These tests
are designed for host turbo and sysfs is not available for SLPC.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11455

v2: Add a skip all the threesolds subtests
    provide explanations for failures (Riana)
    Addressed cosmetic review comments (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/i915_pm_rps.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 99b83f315..ace22b00c 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -1161,7 +1161,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds-idle") {
 		int tmp, gt;
-
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
 				test_thresholds(drm_fd, gt, TEST_IDLE);
@@ -1170,7 +1171,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds") {
 		int tmp, gt;
-
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
 				test_thresholds(drm_fd, gt, 0);
@@ -1179,7 +1181,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds-park") {
 		int tmp, gt;
-
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
 				test_thresholds(drm_fd, gt, TEST_PARK);
@@ -1188,6 +1191,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds-idle-park") {
 		int tmp, gt;
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
-- 
2.34.1

