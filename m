Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB70FEE49A6
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 13:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F3D10E197;
	Wed, 11 Sep 2024 13:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkkjXg+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F32110E197
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726061849; x=1757597849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wyr+pZe0oyh0lorkAda7QvyQTsB8Zjhl+HhWYGLzA4g=;
 b=TkkjXg+i3siJ+A3VYmh6VR12EsL1Ump4s8qymELgyo2fv+b79aV8cP4y
 Y9bjFghaECzudrxpej/3yONIeijlHUGr1GrrCcNR9q4wY6GlRYMmMmy1o
 dJCG9VaB+jEs7YMj3pvflR41H2y8DXC8KdZ8wdCsJGXY7VZhHQFs3n2OS
 G5P1F8Y6ZGtnu0kWs0ulcnwQQPEFERiE6GfkBgnGdVOtMARem+NqjpGhH
 VHAS2vQf7eHvuco3hcfDCTMGT8R09dGPkWOOA8bsSoOQaRHaC70/YlZl9
 DaacTAMxBv7JkXIirwIrJ+oRPq3Cf4vwJpgx1QUmmjshABnJw9Jeopg27 g==;
X-CSE-ConnectionGUID: e1FOkB9dRM+QArt5Nu5khw==
X-CSE-MsgGUID: GItjutVtQ32q8GnkHlpuzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27782857"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="27782857"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 06:37:29 -0700
X-CSE-ConnectionGUID: oRMzk3iSRYKBF3D7USZ++A==
X-CSE-MsgGUID: 72Xbw0BuRrmcAqMcBLYvhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67315288"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 06:37:27 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: switch modeset from uj to bj
 and vice-versa
Date: Wed, 11 Sep 2024 19:03:11 +0530
Message-Id: <20240911133311.569568-1-santhosh.reddy.guddati@intel.com>
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

Add a subtest to validate switching from ultra joiner to big joiner
and vice-versa.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 07b49fb08..3c3186418 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -499,6 +499,31 @@ igt_main
 				test_ultra_joiner(&data, false, false, false);
 	}
 
+	igt_subtest_with_dynamic("switch-modeset") {
+		igt_require_f(force_joiner_supported,
+					  "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(data.ultra_joiner_output_count > 0 && data.big_joiner_output_count > 0,
+					  "No ultra joiner or big joiner output found\n");
+		igt_require_f(data.n_pipes > 1,
+					  "Minimum 2 pipes required\n");
+
+		igt_dynamic_f("ultra_joiner_to_big_joiner") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, false, false, true);
+			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+			test_single_joiner(&data, data.big_joiner_output_count, true);
+			igt_reset_connectors();
+		}
+
+		igt_dynamic_f("big_joiner_to_ultra_joiner") {
+			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+			test_single_joiner(&data, data.big_joiner_output_count, true);
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, false, false, true);
+			igt_reset_connectors();
+		}
+	}
+
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
-- 
2.34.1

