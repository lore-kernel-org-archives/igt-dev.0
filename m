Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B09C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 18:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EE710ECBB;
	Wed, 26 Aug 2026 18:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2aApLK8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8A10EB88
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 18:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787769041; x=1819305041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XCVGVRlX0a+FqS2HqkAQtDme8DzoChPTLIY2nn29yNs=;
 b=G2aApLK8T9XNu7qeIlbGXU2+vKCc7mceBwsoiKUqx3emBdcwIUode08I
 ceSN6hpnMUGQWbpIe7in4t24ZJhvJiNa/g5QdX79qcScT3dWTy7Ow++a9
 TxdrNIKT9eBDRyaKV4QOy9w5WAjvmRRS2M5tOQwciK0cL7XGOfUW8rnvU
 FWfFJQWHlbmOnjNuquvqUd+CKNX49EVo37uTe872YMN+RaC6O3OJKYmOk
 rCgsqF/f75UQE/NjcFRjduj3xUUg6lYk5Gfl7TVvPd4W8CCP0Cr4I0bRK
 fxXLPHhyvjZ+jZMKjAYqK7hoVsYVPuEoZfoE6Hx9UguQVGXbVl53G83mI Q==;
X-CSE-ConnectionGUID: KFqQvUnPRa2Nb7wzdFnr2g==
X-CSE-MsgGUID: G+QUByZuRwSOf/iPrNBH0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88314778"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88314778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 11:30:41 -0700
X-CSE-ConnectionGUID: rfetppjbSr6e6/bi1Z//tw==
X-CSE-MsgGUID: NbxompeZSUOBtBwJ2xc7yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="271159690"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:30:39 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 6/7] tests/kms_color_pipeline: Remove unused color_depth and
 drm_format
Date: Thu, 27 Aug 2026 00:09:31 +0530
Message-Id: <20260826183932.351933-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260826183932.351933-1-swati2.sharma@intel.com>
References: <20260826183932.351933-1-swati2.sharma@intel.com>
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

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color_pipeline.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index c8ee68992..f983bb0be 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -343,9 +343,6 @@ run_tests_for_plane(data_t *data)
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

