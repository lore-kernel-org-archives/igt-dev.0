Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798BBD41C36
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 11:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8C710E6CE;
	Wed, 13 Nov 2024 11:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EelihJvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F1810E6CE
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731495716; x=1763031716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zXppZKdsmbX/kqiKqYzSaR5JknajrF6TPWnfPLmYAtc=;
 b=EelihJvooiGdlhVF9kbtFdcAgpdXat82yiVzmYJUTcF74E52VD1SV5Sn
 k0cmqAcgaYp3oXbmUNBykzG1LzNXaoKXezcLM3Q13oDP/075zO8A0rIxo
 jJRIgz4iLg9t+XmOoGOIMqWuZmoDmVVLQFt3o8eZYIuh+lbItenSF/Gq5
 CgkD3LRYaLqUWGcGsGEpOQpivxn/Fg99axmLS++lqntDhS24iuxl7mhqY
 fGJ4G6iFCUY1hKqsaY5rcpvxbCvhW2LKeBxdYufSmBK1nqs3eyPeJ/A8u
 d8d3n+WwLTKWV1a4aVSXiDWi86estp8ix5fHlG6uFANcDQOOCXbnVwjYw w==;
X-CSE-ConnectionGUID: RMTfjV5dRb6lbeL8HWYYXw==
X-CSE-MsgGUID: hMJ40uqxQveDjWmFnEH5BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35090783"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35090783"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 03:01:56 -0800
X-CSE-ConnectionGUID: DpAqeNTSQzyBVCmbvL99dg==
X-CSE-MsgGUID: OsWyG44nRd+Q0rBDovopbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="88256507"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2024 03:01:31 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Add skip condition for bmg
 platform
Date: Wed, 13 Nov 2024 16:31:04 +0530
Message-Id: <20241113110104.125403-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index ab4819d23..59a000236 100644
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
+	igt_require_f(intel_display_ver(drm->devid) != 14,
+		     "FBC isn't supported on BMG\n");
 
 	drm->res = drmModeGetResources(drm->fd);
 	igt_require(drm->res);
-- 
2.25.1

