Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6763510D14A2
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 11:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1906410E67E;
	Mon, 30 Mar 2026 11:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AI8pSBPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25CC10E678
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 11:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774870960; x=1806406960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xofBBqRw8lN+g/oA6DUifWt5P75wvNTccNWjHl9qxFI=;
 b=AI8pSBPuNFU2J5/EsxJutCmF3Z6cwRd26DOAl6GSixD4l/AkpJcVDhJY
 Q+QawfRjb9MqxVqQNRI04lh7eOE31zg/C7iC2sx6DD/h6BLqeiSoE1Qb9
 VZHV4ehTtGCc17bO4yKxEDspwXAy3Jr1+adBo+oAHugbr4qYd6bOWoxNg
 xewb1aMTB5fw95Agjm0YbIo+xlTRTXXs+fngdccwYnpVAwxYlQsfFhahO
 Hf8Wt89G3CF3yWEdV8mpuA2D7p0UmvFLiiykYTa8hkrlYTCKCZvRsGKGJ
 na/w+QASxQeY9+AHAiqwwbDkE1SPCKoo5vmM2b5eT63HFZNfO3LaM7CVb A==;
X-CSE-ConnectionGUID: kX5URWBjQ0a7EdfjOzjhaQ==
X-CSE-MsgGUID: lABODgLXThKEYC6ediSflg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75572012"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75572012"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 04:42:39 -0700
X-CSE-ConnectionGUID: MKYtJio1TtuXEDd/32e6vw==
X-CSE-MsgGUID: LGRf3Q7wT+G+DFdLlAGTHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230080373"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:42:39 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH i-g-t 5/5] tests/kms_color_pipeline: Remove unused
 color_depth and drm_format
Date: Mon, 30 Mar 2026 17:20:57 +0530
Message-Id: <20260330115057.963395-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260330115057.963395-1-swati2.sharma@intel.com>
References: <20260330115057.963395-1-swati2.sharma@intel.com>
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

Remove the data->color_depth and data->drm_format assignments from
run_tests_for_plane() as they are not used anywhere in the color
pipeline test path.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Co-developed-by: Claude Opus 4.6
---
 tests/kms_color_pipeline.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 85accef27..bf411d988 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -336,9 +336,6 @@ run_tests_for_plane(data_t *data)
 				test_setup(data,
 					   crtc);
 
-				data->color_depth = 8;
-				data->drm_format = DRM_FORMAT_XRGB8888;
-
 				test_plane_colorops(data, crtc,
 						    plane_colorops_tests[i].fb_colors,
 						    plane_colorops_tests[i].exp_colors,
-- 
2.25.1

