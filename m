Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B42CD6A221
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDA910E35D;
	Thu, 14 Nov 2024 19:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VD2hmE4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C355F10E359
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611025; x=1763147025;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hgqUNafMXojn9AWsTUt6z6/+9WXuuhIAy/0CjJwni4s=;
 b=VD2hmE4zL+ytZ1O4nF8l5KSGcOmgtBdDZtjrfTsfORVsfGen/3xKqq6g
 MNtBcwaA7zpG6JQdL7tHAGP7jNRAAdW5H+NRw6VEmn53/NEtGLU34F6qI
 2kah5omFX4Tu3mAAjm4jQobKJexuuHKOquFKAUs3NKJC5a4lD2TLBBX19
 xqLwra24iP9K5V1hirSgPqt8kXi66696Wz6hOnFzEQcMtqLg3mdUIGg6k
 JkbsLSnJ6MsR2hSqscPsVJ8CjyEKSGAQoyOdUYa1WxBlCI7DoXbZ7D0Sv
 00By0nuVQS30tI4cJIA3eNvr8/wfx2OsuD2gV09zjVoqPFRzSG7R1KVic w==;
X-CSE-ConnectionGUID: /K3AqvP/RUC6Ljy4URUmrQ==
X-CSE-MsgGUID: 4IQlYG9CQCmB21wi5pCuOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442567"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442567"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:44 -0800
X-CSE-ConnectionGUID: FfBQlpc+TheAisk2MCKFVA==
X-CSE-MsgGUID: dEMgmp3IRPyFTWnIPrDNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242108"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 5/9] XE3: tests/kms_addfb_basic: fix x-tiled tests
 for case when there is no x-tile
Date: Thu, 14 Nov 2024 11:03:35 -0800
Message-Id: <20241114190339.3885752-6-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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

From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

On Xe3 display no more support x-tile and will disable such framebuffers

Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/kms_addfb_basic.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index b22818592..3ba87117b 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -217,6 +217,12 @@ static int legacy_addfb(int fd, struct drm_mode_fb_cmd *arg)
 	return err;
 }
 
+static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
+{
+	return igt_display_has_format_mod(disp, f->pixel_format,
+					  f->modifier[0]) ? 0 : -1;
+}
+
 static void invalid_tests(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -735,8 +741,10 @@ static void addfb25_tests(int fd)
 		igt_describe("Check if addfb2 call works for x-tiling");
 		igt_subtest("addfb25-x-tiled-legacy") {
 			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
-			do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f);
-			do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
+			igt_assert_eq(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f),
+				      addfb_expected_ret(&display, &f));
+			if (!addfb_expected_ret(&display, &f))
+				do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id);
 			f.fb_id = 0;
 		}
 
@@ -756,12 +764,6 @@ static void addfb25_tests(int fd)
 		gem_close(fd, gem_bo);
 }
 
-static int addfb_expected_ret(igt_display_t *disp, struct drm_mode_fb_cmd2 *f)
-{
-	return igt_display_has_format_mod(disp, f->pixel_format,
-					  f->modifier[0]) ? 0 : -1;
-}
-
 static void addfb25_ytile(int fd)
 {
 	struct drm_mode_fb_cmd2 f = {};
@@ -1012,8 +1014,6 @@ igt_main
 
 	master_tests(fd);
 
-	addfb25_tests(fd);
-
 	tiling_tests(fd);
 
 	igt_subtest_group {
@@ -1025,6 +1025,8 @@ igt_main
 		igt_fixture
 			igt_require_intel(fd);
 
+		addfb25_tests(fd);
+
 		addfb25_ytile(fd);
 
 		addfb25_4tile(fd);
-- 
2.25.1

