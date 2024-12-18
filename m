Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D3CE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756F210EC56;
	Wed, 18 Dec 2024 21:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+Q71dX9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C65910E460
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734557820; x=1766093820;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7kuvWcn6zniCsy/JqXSBVFgohYE5JeoRWKy8406aDx4=;
 b=V+Q71dX9cQkRKNRAzkcQ2dukaq786gTFqmH6cNa8/QmMskY5W5I6r2B2
 fVH7SCs0Iz7fRuLzPKUrZ6Z6pMy5GlfqDYq2R059K9gUYlEEAexmp17Br
 HM37g++82m7RXi3P+6JGoI5mC1J0YqQibIvMI5nAAqjnVkIO+HSiAgk4U
 PkfygoT9Fbp8z0BOfGYmBxxm9tnol9GYxzkqW7R1oxQLVLAa4agxdRQ67
 1Su9vGSzmDK4UphdtoiQz+DYAYVBMEF7oDafVG2IWe9lscWpxBDB44BOl
 E8/xPWoUTSsiHCw9IVk4/4hKu/80Gq+Yg+TFJWNJ/jtgl0d/EKIfuwq5W A==;
X-CSE-ConnectionGUID: YWkAIJugSkSpWxdS9s0DXA==
X-CSE-MsgGUID: ZuoMFDL1QDuS7o9gRfDd8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34379759"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34379759"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
X-CSE-ConnectionGUID: +hfQ2JYFQUaJjKcBatwmxg==
X-CSE-MsgGUID: +CM8jHF8RtONTf5hvjbwYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128973919"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 4/7] tests/kms_addfb_basic: fix x-tiled tests for
 case when there is no x-tile
Date: Wed, 18 Dec 2024 13:36:51 -0800
Message-Id: <20241218213654.2734573-5-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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

From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

On Xe3 display no more support x-tile and will disable such framebuffers

Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
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

