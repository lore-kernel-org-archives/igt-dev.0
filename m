Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D73EE77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 11:57:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BE610E895;
	Fri,  3 Jan 2025 11:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wi5Ym9/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3E410E895
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735905419; x=1767441419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YD8taKhOdDGtPOVKb03ocEsvRDiuxHRyB8905DKu3L8=;
 b=Wi5Ym9/s19EEuVrBrfdiup05jsZhwuyy9zswem1ujoxGxevVsrnclWJ+
 9CV6RmUYJwTuOM2ODwyiZj/LF5Fa59Wxwtm+XEu97x/nmvzy3Mk10Bsmk
 m35yQit8/kDxFFSFg70UOckbiDZvU9NuRC6pPpKFRyfAdRdR4f1E0E5qm
 7jSvZo6r2hSnVF2JAUx8yLaVyqm3l52pxa+YFZu5ZJHOTcMGPmJdC5RAp
 wBOg6nQA59eTLiFfxYipfb8oZJKQ+Ai+PHqHG8/vkju5lWQ9rvosqy0eq
 qivuCo48/usJgYIPkGi90q7mFU9qjVhLHHXc816g+lFsrHq4zqke7sjIN Q==;
X-CSE-ConnectionGUID: G3tWtwQMTMSXI2yCeyL2fg==
X-CSE-MsgGUID: KQ9GtZ7DQ9SR78SXxszK7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39919938"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="39919938"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 03:56:59 -0800
X-CSE-ConnectionGUID: 6AbaUTzPTxK9JNIcci5Ndg==
X-CSE-MsgGUID: V90aA2FxTvOfTXJC8VtQxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="101644195"
Received: from unknown (HELO linux-System-Product-Name.iind.intel.com)
 ([10.190.239.15])
 by fmviesa007.fm.intel.com with ESMTP; 03 Jan 2025 03:56:56 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition for
 bmg platform
Date: Fri,  3 Jan 2025 17:27:10 +0530
Message-Id: <20250103115710.84108-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328023811.46847-1-mohammed.thasleem@intel.com>
References: <20230328023811.46847-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
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

