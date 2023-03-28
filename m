Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD81E77182
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 13:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B4710E1CB;
	Wed, 11 Dec 2024 13:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLS7s7El";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B3410E1CB
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 13:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733922982; x=1765458982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ii7rnWImGD3WdEtH86fQASo4KQnstxVinWAU66VBqiw=;
 b=QLS7s7Elt3hxDvLmbGf+MOeFQd8azz9IQ1a+FjnLsGtt6R04+yOj9ICD
 FZy4Dxjuc4Q1QiwSbFOi4WpzabytivijEeiugvCrczeslHkn4/LdOi5mL
 CtTASfMdTjYeA1UQ4eJo1vlseN26NgduOMkxSIBQY0pyKVeEh628OFbib
 Nqj9uy2+vQQLQCjPWAtPESaS9cdQeu+27e8pN6uwikdUHO3eMs4lTkchc
 VnQR36tgHtvX2mFy4BDDgdcJJnmrGnBEVsqf/U1XKLw4OiF0t33GfQoIJ
 XonnTi1y367ronFn6/rwOgoqfMn+e9UazbKkzMoYSrAhthNkZojCouaU1 w==;
X-CSE-ConnectionGUID: +FC8sGR6R5mDZbzdsRUqsQ==
X-CSE-MsgGUID: jzenMfI2T3+22Wp1epuJ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59691910"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="59691910"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 05:16:21 -0800
X-CSE-ConnectionGUID: 2mU3gWKKTB2MH+qZuE3XSw==
X-CSE-MsgGUID: L+/kVzxOR3eD6yhLwiRFZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133185682"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by orviesa001.jf.intel.com with ESMTP; 11 Dec 2024 05:16:19 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_dirtyfb: Add skip condition for bmg
 platform
Date: Tue, 28 Mar 2023 07:47:15 +0530
Message-Id: <20230328021715.22290-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113174118.158849-1-mohammed.thasleem@intel.com>
References: <20241113174118.158849-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 35df9be3b..e20fde777 100644
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
@@ -345,6 +345,9 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
 		igt_require(data.display.is_atomic);
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		igt_require_f(!IS_BATTLEMAGE(data.devid),
+			     "FBC isn't supported on BMG\n");
 
 		data.bops = buf_ops_create(data.drm_fd);
 		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
-- 
2.25.1

