Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92A6C3DA63
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 06:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8441B10E92D;
	Fri, 26 Jul 2024 06:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXIHUKtF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EE810E92D
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 06:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721976672; x=1753512672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ttJXIinG6/n5gz9ZV4yw8KZPYAT2K212AS3Fduu0aGE=;
 b=IXIHUKtF8496zZsjZ9K+DgIsRmLyrb0S43JYoWWyIeF180BoOIHHnboW
 36wU4PpTG2vcDTl+LMfKccdlHgmxFp+2m/3HjGUT/35Bv1l7huySf3TqV
 z9JYHV68YxB69rDO51Re6dJsi+6h2JM8bd3zTimIQykRbLVyNyEOrt7Us
 qBwaNhXvlUqyhQeJCZXHnBkHol8nfwCy6YWTbZE+zakxom/QUSviK/fcn
 juenFtARjUAP0/THfZVNjhwairf9ZGK1Zw5lmk1gj7lzGM5TssK+7KkLm
 r6ICvg2SM4PaoTjPhJSTc11BkCAhKMohxD3vd+Uamg/mbOPXEXVoMkGiX w==;
X-CSE-ConnectionGUID: mTu1lDbATJSdCTcDaNEMaA==
X-CSE-MsgGUID: knvNI5RkQDmZA9Ix5XSwmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37227343"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="37227343"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:51:12 -0700
X-CSE-ConnectionGUID: FlFi4wa/QSetWBKpzMUXXQ==
X-CSE-MsgGUID: WXEk17Q8SjuvVOYx0uzLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57325125"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:51:09 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
	sk.anirban@intel.com, riana.tauro@intel.com, Tauro@freedesktop.org
Subject: [PATCH i-g-t,
 v3] tests/intel/i915_pm_rps: Disable threshold subtests when SLPC is
 enabled
Date: Fri, 26 Jul 2024 12:21:12 +0530
Message-Id: <20240726065112.106444-1-sk.anirban@intel.com>
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

Skip these tests when SLPC is enabled as it fails frequently. 
These tests are designed for host turbo and sysfs is not available 
when SLPC is enabled.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11455

v2: Add a skip all the threesold subtests
    Provide explanations for failures (Riana)
    Addressed cosmetic review comments (Riana)
v3: Addressed cosmetic review comments (Riana)

Reviewed-by: Tauro, Riana <riana.tauro@intel.com>
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

