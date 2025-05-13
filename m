Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B637AC3ABCC
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 11:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6688710E1F3;
	Tue, 13 May 2025 11:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIAY71MM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AB610E1F3
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747137135; x=1778673135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oDCcU1Ckh+G9PeK3p6NoxB/kaBAVLFU3GNd7ABNOLUo=;
 b=DIAY71MMR8PO0Altt1d9VE74yo+NS34IN8mdMp9goYbeazOK4xDctxjQ
 R5HQTMaYXsp1yPjNwzeBsLulwme07ECSfkY/6HqUj7NHZf67F+4/3Kqzx
 KcpuhtiIeh2glLruIDgoRnrCWEMqAOdcm96KmrhS17IOtk3yjByXQnKGK
 K6/QLcls0eEgAWRbllrRdPgNXTIdVY6s6aT/LM7tOduwePnEhpsdM4H1Q
 VKXinHxrxWX/c8rSi5yYNiyvqMnjGPHX4TsjmSyJb6tGZReG571x/rDpp
 RqABJmAO78dxFkjg+BH1wmdkNDCGJGDDb7eb2A3N0HrfkkEDSuRd22BY8 Q==;
X-CSE-ConnectionGUID: VMYZtr8SSGSK7sNuFCk1/A==
X-CSE-MsgGUID: ApibZQFOR8un8hSUfEvlAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36603542"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="36603542"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 04:52:15 -0700
X-CSE-ConnectionGUID: 8mXP+XfFQMy++jYpQAW1WA==
X-CSE-MsgGUID: +7fmziY2Tp67vr/DE8s+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="138610376"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 04:52:14 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/intel/xe_render_copy: Skip tests on PVC
Date: Tue, 13 May 2025 11:52:52 +0000
Message-Id: <20250513115252.9095-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

As PVC doesn't have render, these tests will fail by definition.

Skip render tests on PVC.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_render_copy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index fadfd162c..c36520c92 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -697,6 +697,10 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+
+		/* As PVC doesn't have render, we should skip here */
+		igt_require(!IS_PONTEVECCHIO(xe_dev_id(xe)));
+
 		bops = buf_ops_create(xe);
 		srand(time(NULL));
 		set = xe_get_memory_region_set(xe, DRM_XE_MEM_REGION_CLASS_SYSMEM);
-- 
2.34.1

