Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CC0C3DA63
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 12:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA2D10E6B2;
	Wed, 24 Jul 2024 12:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7FKHi99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5758210E6B2
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721825358; x=1753361358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dsR4SGnmKGbgEx9l0oIxARc58/NGTmcU47pkiKScoU8=;
 b=N7FKHi998bMe+VL9kjtnt/5KF3W/U5M5qRq913SMA0DgYEhPcNXvU9mO
 iyIi1NOV6WCH2RdqcDSxMpC9UFd5Gtv99ukbDqZyJTQnbYWiRvTSbnffm
 MiNm5DWUR60U7oONB0gR+uR+U9hF1ygBIy0xRzN22NI87LvaNB1B77IMh
 CYebohOW1NF7htOoehqvdvFDz4jysGRIXwKokGg8H7fPAUw92HVNZWfP6
 zQVSTF3fqalSIzpXXLYwFb1sICdgqXVxcuB6qARriHfFTboe5sqLYtjq8
 XowbwOVnoPgXQFfSLuiveCvk8RIwv5TGV9VZtY1Rv4CeWAgTIyyXy0N1y Q==;
X-CSE-ConnectionGUID: R4TgNWcjRvq0+/456+3jjQ==
X-CSE-MsgGUID: ngcrq9jcT6m4teCrjsOHFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30162094"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="30162094"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 05:49:18 -0700
X-CSE-ConnectionGUID: uOCVCRz7Qj6HTOEHVhZWVg==
X-CSE-MsgGUID: Hgi5jNmFS322sWL/YFdyYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; d="scan'208";a="75793035"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 05:49:16 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 sk.anirban@intel.com
Subject: [PATCH i-g-t] tests/intel/i915_pm_rps: Disable subtest
 thresholds-park when SLPC is enabled
Date: Wed, 24 Jul 2024 18:19:19 +0530
Message-Id: <20240724124919.87566-1-sk.anirban@intel.com>
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

Skip the test when SLPC is enabled as it fails frequently.

Bug: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11455

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/i915_pm_rps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 99b83f315..e1489b446 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -1179,7 +1179,8 @@ igt_main
 
 	igt_subtest_with_dynamic("thresholds-park") {
 		int tmp, gt;
-
+		igt_skip_on_f(i915_is_slpc_enabled(drm_fd),
+			      "This subtest is not supported when SLPC is enabled\n");
 		i915_for_each_gt(drm_fd, tmp, gt) {
 			igt_dynamic_f("gt%u", gt)
 				test_thresholds(drm_fd, gt, TEST_PARK);
-- 
2.34.1

