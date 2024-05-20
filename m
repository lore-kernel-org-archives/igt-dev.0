Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CE7C04FFE
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 06:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EF510E0B8;
	Mon, 20 May 2024 06:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eytH8BQn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5666710E0B8
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 06:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716187740; x=1747723740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WAx7bYY4mjO9hy1/804iClkqiI0K2rmGilCEVKu84o8=;
 b=eytH8BQnStb+3f+QzYNrxzP67fwPTgGyIMhVBn3lIOim2QXV9NCXpZ4c
 nLx4j3zfKJcjW5J8lLDEa5lI+I7tebzCfDsywPySsMmmRfkTB1j+UiO9V
 Vig0qrmUNHbNt5COsgeHG1Xa3GTUgU4cDUafq2+wS8sHHP9C93FUkFeeP
 xb+MqgxSa0ruTUwjrKuq2TQTWuG1LqEmjogcGwxKUso8tf6rvbHT6zPLq
 WgWKbw2NNYYy7MyX0Bf5gWOwscVHm9glREZA8j1W8MjA08TDLOMDM437P
 zBmN4FT8Fc6DWPmCJLmeaQKzz6ARDMnzUEslkyuhFvY0KT3LzIXWNiK7A Q==;
X-CSE-ConnectionGUID: mnj5IiulQFWThE3CfWUyEg==
X-CSE-MsgGUID: cR4TT6PQQHqM1AyN0e8tRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="29815136"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="29815136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2024 23:48:59 -0700
X-CSE-ConnectionGUID: i7HcwoeiS86cLJzdoj1O+g==
X-CSE-MsgGUID: +tr3jY4TSs246ZNe4Dx29Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="32333430"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2024 23:48:58 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/kms: Move kms_plane_scaling to intel directory
Date: Mon, 20 May 2024 12:11:50 +0530
Message-ID: <20240520064150.2519210-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

As kms_plane_scaling is limited to run on Intel hw only,
move this test to tests/intel directory.

Cc: Mark Yacoub <markyacoub@chromium.org>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/{ => intel}/kms_plane_scaling.c | 6 ++----
 tests/meson.build                     | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename tests/{ => intel}/kms_plane_scaling.c (99%)

diff --git a/tests/kms_plane_scaling.c b/tests/intel/kms_plane_scaling.c
similarity index 99%
rename from tests/kms_plane_scaling.c
rename to tests/intel/kms_plane_scaling.c
index acb4a1da1..620dba911 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/intel/kms_plane_scaling.c
@@ -1291,10 +1291,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	enum pipe pipe;
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		igt_display_require(&data.display, data.drm_fd);
-		data.devid = is_intel_device(data.drm_fd) ?
-			intel_get_drm_devid(data.drm_fd) : 0;
+		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_require(data.display.is_atomic);
 	}
 
@@ -1464,7 +1463,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(intel_paramtests); index++) {
 			igt_describe("Test for validating max source size.");
 			igt_subtest_with_dynamic(intel_paramtests[index].testname) {
-				igt_require_intel(data.drm_fd);
 				for_each_pipe(&data.display, pipe) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
 						drmModeModeInfo *mode = NULL;
diff --git a/tests/meson.build b/tests/meson.build
index 758ae090c..c53e3bc3c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -47,7 +47,6 @@ test_progs = [
 	'kms_plane_cursor',
 	'kms_plane_lowres',
 	'kms_plane_multiple',
-	'kms_plane_scaling',
 	'kms_prime',
 	'kms_prop_blob',
 	'kms_properties',
@@ -262,6 +261,7 @@ intel_kms_progs = [
 	'kms_legacy_colorkey',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
+	'kms_plane_scaling',
 	'kms_pm_backlight',
 	'kms_pm_dc',
 	'kms_pm_lpsp',
-- 
2.43.2

