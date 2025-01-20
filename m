Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149C5C02185
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 07:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB4710E32D;
	Mon, 20 Jan 2025 07:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InYb8Zmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FD110E31F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737357535; x=1768893535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZX7YyVpixTz4Hbs0BuyV8zqumJXew/FbK+Y+FO371Yk=;
 b=InYb8ZmtK4G7ixwLo5NAANZh6/64ZqLoFMgkrrN55o7/NA1UJlGnUe9k
 IROlWw/sNzlFlhE7fKM1JtJhc8LOaxKFObUZpWyTQmnXXSJYd9XKeJxnM
 06cnzkyQJcysyZYCJY3yYf8w9QKTpwpEN6PzIfJkyAtIGk2I1/vsDf046
 BPHQj3T6UxRziDis7Sp3lb77V7y8J4QZQGZlEkQla/XVen7Oh+jkqcE/X
 sROXLkJRnNQYgfLVH275ibAKWRZj3swh9q8VeH5rG83P1ts17BxWsC90Q
 mpw2juvHxs/23Ki0tWxo0c3ebbH1nyDzHWw/w1sNX96UlaGQujfjS9lSN A==;
X-CSE-ConnectionGUID: EengoPAlTjW5PrWdgdJ+qw==
X-CSE-MsgGUID: taRr+W2QQ5mBI7fWG1dKDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41647485"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="41647485"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 23:18:55 -0800
X-CSE-ConnectionGUID: yexGlgY+TgS8Qb/KAEoh7w==
X-CSE-MsgGUID: hHNULVU8TGWj5H5q0EunXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111494906"
Received: from unknown (HELO linux-System-Product-Name.iind.intel.com)
 ([10.190.239.15])
 by orviesa005.jf.intel.com with ESMTP; 19 Jan 2025 23:18:54 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v4] tests/intel/kms_dirtyfb: Skip FBC testing on BMG
 platform
Date: Mon, 20 Jan 2025 12:49:38 +0530
Message-Id: <20250120071938.5358-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103104335.61694-1-mohammed.thasleem@intel.com>
References: <20250103104335.61694-1-mohammed.thasleem@intel.com>
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

v2: Add workaround id: Wa_16023588340. (Swati)
v3: Add workaround id in code.
v4: Update subject. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 4cbd1a2f9..f2bdd4546 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -54,7 +54,7 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
 #endif
 
 typedef struct {
-	int drm_fd;
+	int drm_fd, devid;
 	int debugfs_fd;
 	igt_display_t display;
 	drmModeModeInfo *mode;
@@ -364,6 +364,7 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		igt_require(data.display.is_atomic);
+		data.devid = intel_get_drm_devid(data.drm_fd);
 
 		data.bops = buf_ops_create(data.drm_fd);
 		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
@@ -381,6 +382,10 @@ igt_main
 							      data.output) {
 					data.mode = igt_output_get_mode(data.output);
 
+					/* FBC disabled: Wa_16023588340 */
+					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
+						       "FBC isn't supported on BMG\n");
+
 					if (!check_support(&data))
 						continue;
 
-- 
2.34.1

