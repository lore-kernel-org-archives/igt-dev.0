Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB93C02188
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 07:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FD810E31F;
	Mon, 20 Jan 2025 07:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKYW/Vft";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B131210E31F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 07:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737357205; x=1768893205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YzwL1ORuGR5xCq0BLlMR7LU0JvF1guv7g+gFm438Z4A=;
 b=WKYW/VftGT/9h85kKkXKPiIgFVs/yUfw4HbxgjnYvXHFRcqkHrquMPK7
 TYiFCZpdXeG9czH1lHOxRWYydAg8g5JF6aitLJ7bY0D5FQxQwcd3oolfL
 GwuECUPLgRuFfuJrjWYZmuPyxK+PHGmWvQB46j9pPEsSGNsZhbhUZOc3/
 u3gSS6sKMHEWzFTOqVJiz2kSSdOXs+s4NagYARvdEe3rUecvCwZzOFr+c
 Z6r4WTboxsn8bYyQTrb6vjSh8O2Dqevq+JpY2n2tfxJV3HP4q3oHc/NDK
 hti6AuLLjs8gaBYAImh0zHXZA8bSrjT29gdLxzyKCFTI6eKCXnSEoNfAP A==;
X-CSE-ConnectionGUID: oZ5CjNLkQSK0tmF8Z/wXPg==
X-CSE-MsgGUID: VjTELXveSbiLV7dTs/QWyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48311795"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="48311795"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 23:13:25 -0800
X-CSE-ConnectionGUID: O8f21B0GTeGGUst2A5ajCQ==
X-CSE-MsgGUID: Yf0feKZiR7C/mtcC1MIuUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="106239672"
Received: from unknown (HELO linux-System-Product-Name.iind.intel.com)
 ([10.190.239.15])
 by fmviesa006.fm.intel.com with ESMTP; 19 Jan 2025 23:13:23 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t v4] tests/intel/kms_fbcon_fbt: Skip FBC testing on BMG
 platform
Date: Mon, 20 Jan 2025 12:44:07 +0530
Message-Id: <20250120071407.3434-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113110104.125403-1-mohammed.thasleem@intel.com>
References: <20241113110104.125403-1-mohammed.thasleem@intel.com>
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

FBC test isn't supported on bmg, skip the test on this platform.

v2: Add workaround id: Wa_16023588340. (Pranay)
    Use IS_BATTLEMAGE check instead using devid.
v3: Add workaround id in code.
v4: Update subject. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index ab4819d23..9c3ff7a21 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
 #define MAX_CONNECTORS 32
 
 struct drm_info {
-	int fd, debugfs_fd, crtc_id;
+	int fd, debugfs_fd, crtc_id, devid;
 	struct igt_fb fb;
 	drmModeResPtr res;
 	drmModeConnectorPtr connectors[MAX_CONNECTORS];
@@ -418,6 +418,8 @@ static void setup_environment(struct drm_info *drm)
 	igt_require(drm->fd >= 0);
 	drm->debugfs_fd = igt_debugfs_dir(drm->fd);
 	igt_require(drm->debugfs_fd >= 0);
+	drm->devid = intel_get_drm_devid(drm->fd);
+	igt_require(drm->devid >= 0);
 
 	drm->res = drmModeGetResources(drm->fd);
 	igt_require(drm->res);
@@ -457,16 +459,25 @@ igt_main
 
 	igt_describe("Test the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure with fbc enabled.");
-	igt_subtest("fbc")
+	igt_subtest("fbc") {
+		/* FBC disabled: Wa_16023588340 */
+		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
 		subtest(&drm, &fbc, false);
+	}
+
 	igt_describe("Test the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure with psr enabled.");
 	igt_subtest("psr")
 		subtest(&drm, &psr, false);
+
 	igt_describe("Suspend test to validate  the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure with fbc enabled.");
-	igt_subtest("fbc-suspend")
+	igt_subtest("fbc-suspend") {
+		/* FBC disabled: Wa_16023588340 */
+		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
 		subtest(&drm, &fbc, true);
+	}
+
 	igt_describe("Suspend test to validate the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure with psr enabled.");
 	igt_subtest("psr-suspend")
-- 
2.34.1

