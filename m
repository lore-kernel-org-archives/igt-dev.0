Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645D0E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 10:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073A010E295;
	Fri,  3 Jan 2025 10:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnjXW0cS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E268510E295
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735900996; x=1767436996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FejXnZ3O3MqgOMqITShDkKVEdaTTwU/KqUSR6Men9ts=;
 b=RnjXW0cSSQUV5oMrMh3ndjenqRwmVUjuC9bztI7ROU3y9FHob0VdkS/N
 CN2WMCpOJH5GzsWaRlJ/c50deEHd7e85bIzNOu87ghu5+YtZfGdNmsz+H
 5kj1zYmdgA0smhO9i1FicONPlrSe/5h16UIKToOUQQHwqJipZBxEx3KOR
 SgBmSxgN9jsX12HmaBlHnCFcIyvhax5K6zhmwEQLW5sXBS6nSIMxVWTnG
 8SeFR0o8vg+fQyeciMOK9T4lPK2RSaFrppPzu6Uq3VIHbAgtLq3HgVYaO
 V7YulWzj8WnVOcMaOf+LB09zGoGeC8lpM4MDP3d/pr8eNT7NbOjQXL0Qb g==;
X-CSE-ConnectionGUID: SUGf+HgCSC+U8clJxb4uvw==
X-CSE-MsgGUID: Y6wtzCcZRX20RJI5Nt9LqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36374155"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="36374155"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 02:43:15 -0800
X-CSE-ConnectionGUID: EARlQ3PhSey4k+F2gXaoXw==
X-CSE-MsgGUID: DjDqMVawTVGrz45lsuWXfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="106801712"
Received: from unknown (HELO linux-System-Product-Name.iind.intel.com)
 ([10.190.239.15])
 by orviesa003.jf.intel.com with ESMTP; 03 Jan 2025 02:43:14 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_dirtyfb: Add skip condition for bmg
 platform
Date: Fri,  3 Jan 2025 16:13:35 +0530
Message-Id: <20250103104335.61694-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328021715.22290-1-mohammed.thasleem@intel.com>
References: <20230328021715.22290-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 35df9be3b..877ec8081 100644
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
@@ -345,6 +345,7 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		igt_require(data.display.is_atomic);
+		data.devid = intel_get_drm_devid(data.drm_fd);
 
 		data.bops = buf_ops_create(data.drm_fd);
 		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
@@ -362,6 +363,10 @@ igt_main
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

