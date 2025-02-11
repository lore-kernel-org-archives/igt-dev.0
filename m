Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDF4C021A1
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 17:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA63110E73D;
	Tue, 11 Feb 2025 17:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cc79h5JZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF2610E73D
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 17:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739296212; x=1770832212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C32SNXDqeMsbh9t+iZ7VUSnxtBe/i5WUFH1immRwlIY=;
 b=cc79h5JZS3voUp2mWh46MTeQvWuThaVi9rY+q7ZMz4eNv6Hm5dRo8vAu
 Wq8A4qTMp5PJGEaUbnKPlqmNVnU+rgoP3zKv4SCI8Z9jhRryKEYG3LGXU
 hWaKmzkQoB5KUzvznA7ugKntR8K5bz2D73ZyWmq46KsN/CeXQl7sTQNe9
 hfcWde7eWE+mJgu76NYnvy6mprJ+HSxIIBbxIyZyXLtkkbrgtkcIRvSUG
 9C/fF5qKevxOCM+85TEwRZsFjN+PSRRipuxLOeigzNph4Ghls8M7Ims43
 EvilH7qYv/nq5Q8Q6tsoMiQvEQ6CsiAr3LO5GwdxINgsJDrRVKNm2AfOi g==;
X-CSE-ConnectionGUID: IAwq4NXKSxKD5A1EvCfhnw==
X-CSE-MsgGUID: azA3+k+aSdKFiLjqiblFTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57339100"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="57339100"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:12 -0800
X-CSE-ConnectionGUID: vbK8/rcdQqG7t8N+JQlV9Q==
X-CSE-MsgGUID: +yL97YCwSheR/YwoOMEVIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="149767509"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:50:11 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 4/7] tests/intel/kms_dp_linktrain_fallback: fix typo
Date: Tue, 11 Feb 2025 23:35:39 +0530
Message-Id: <20250211180542.1430676-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211180542.1430676-1-kunal1.joshi@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
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

fix typo : %s/primarys/primaries

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 55a71e35b..c6e9fba53 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -358,7 +358,7 @@ static void test_fallback(data_t *data, bool is_mst)
 	igt_output_t *outputs[IGT_MAX_PIPES];
 	drmModeModeInfo * modes[IGT_MAX_PIPES];
 	struct igt_fb fbs[IGT_MAX_PIPES];
-	struct igt_plane *primarys[IGT_MAX_PIPES];
+	struct igt_plane *primaries[IGT_MAX_PIPES];
 	struct udev_monitor *mon;
 
 	retries = SPURIOUS_HPD_RETRY;
@@ -367,7 +367,7 @@ static void test_fallback(data_t *data, bool is_mst)
 	igt_reset_link_params(data->drm_fd, data->output);
 	if (!setup_outputs(data, is_mst, outputs,
 			   &output_count, modes, fbs,
-			   primarys))
+			   primaries))
 		return;
 
 	igt_info("Testing link training fallback on %s\n",
@@ -409,7 +409,7 @@ static void test_fallback(data_t *data, bool is_mst)
 							  &output_count,
 							  modes,
 							  fbs,
-							  primarys), "modeset failed\n");
+							  primaries), "modeset failed\n");
 		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
 		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
 		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
-- 
2.25.1

