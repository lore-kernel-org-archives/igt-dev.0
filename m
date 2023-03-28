Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D70E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 13:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD66E10EB51;
	Wed, 11 Dec 2024 13:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FePtlI/b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AFA10EB51
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733924234; x=1765460234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zKwFKhQlaSIO/iRQFECF8kQFLc4/BCFHLFshqOH98cY=;
 b=FePtlI/bDxviW0Vkzfw9L9zEff27cb4BrrcN2A2FmnS3OJH1v2312Vpl
 HAhkTx2mdvcVqYxP7oqD6pg6iwsKbiSUENCMd0eAbRAIZnaLaDPIUfTZa
 aueecCcBJA9o6TVZOvXp44zTzljVsA9OYVOyI+Yiq7lBNt6ZB9yW5qdyO
 mUlb5K61coi/gqq9fBqRWDRyVeW/SsN5M1xr4TkIV23QKMpOfzEk5Uv2C
 nwtKaVvmuKNWShDqsFePvpknD2RWuEISiTWOWQROyaCj3eLmkxDXzxTH0
 Rsk9PA7TrmfvGp5gI+uwiiaOpWPQqTpabiMSed4Sz2LERGJG38L6AglZs A==;
X-CSE-ConnectionGUID: 2/4BWoB8QiSc114FKDkajg==
X-CSE-MsgGUID: /JXxk1PRQBW0e/GtEmNbmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33634407"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="33634407"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:37:14 -0800
X-CSE-ConnectionGUID: 5KZLnMTFSpuFx9guWVQj5Q==
X-CSE-MsgGUID: fzlcoSJMTrqBYHZm386Y8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="126641628"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by orviesa002.jf.intel.com with ESMTP; 11 Dec 2024 05:37:13 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Add skip condition for
 bmg platform
Date: Tue, 28 Mar 2023 08:08:11 +0530
Message-Id: <20230328023811.46847-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index ab4819d23..8b792d868 100644
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
@@ -418,6 +418,9 @@ static void setup_environment(struct drm_info *drm)
 	igt_require(drm->fd >= 0);
 	drm->debugfs_fd = igt_debugfs_dir(drm->fd);
 	igt_require(drm->debugfs_fd >= 0);
+	drm->devid = intel_get_drm_devid(drm->fd);
+	igt_require_f(!IS_BATTLEMAGE(drm->devid),
+		      "FBC isn't supported on BMG\n");
 
 	drm->res = drmModeGetResources(drm->fd);
 	igt_require(drm->res);
-- 
2.25.1

