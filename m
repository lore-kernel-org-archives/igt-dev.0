Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8397CD37AE
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 20:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537E10E5EE;
	Tue,  3 Sep 2024 20:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cDFXEsoJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDBE10E0E3
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725396904; x=1756932904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ithv7tnYAsP3unLYlHBc6SJqiH58qn+c/RrR8J2MiEM=;
 b=cDFXEsoJr0NGh8jHspaKj4r1NH4huGGqR1fWm4UeETPphhHCAdCSQUnU
 jN7BlS+4AXVDmfM63rDwR0x1+UcnZ6d3oz2ewyVcG19JBrJXeoqlFUjrg
 nZNQdZrJCiL9LMqKvbUZWVI7xC/AeaRK99XVN+JhDatOFMEIDaQ6QjkqX
 NHarj2PFpy6X/cXhuoTpinv6OD9mJdcIgA5bwgJ9PB5V6X9ZOH5H6o+SW
 jUDnOa6f+iybiM5ebO+zVFpwuO0d3m9svw98NjDlKeCtpSCP64rFZy4wM
 Sm3U/+nIWrhYylofcgMbq+rMf7nP3nHCF0SfNY72TBaSaVrS3e54LgA/s A==;
X-CSE-ConnectionGUID: qDIu2du1RgadaegepEtscA==
X-CSE-MsgGUID: 6/cU5pc1Ry+PDeLuLXfm1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13353498"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="13353498"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 13:55:03 -0700
X-CSE-ConnectionGUID: AVpPPUHpSpmQKwp5RLaBMw==
X-CSE-MsgGUID: 0617ZKQ8SXOr5ZH35w1liw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="95841870"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 13:55:02 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t v3 1/4] tests/xe_oa: Drop TestOa from metric_set()
Date: Tue,  3 Sep 2024 13:54:54 -0700
Message-ID: <20240903205457.109320-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Some platforms don't provide TestOa and Renderbasic and ComputeBasic
are better tests for render and compute engine and available in all
platforms.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/intel/xe_oa.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index f2c6d53007..aae9be2c40 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -311,15 +311,20 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
 	struct intel_xe_perf_metric_set *metric_set_iter;
 	struct intel_xe_perf_metric_set *test_set = NULL;
 
-	if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
-	    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
-		test_set_name = "TestOa";
-	else if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
-		  hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) &&
-		 HAS_OAM(devid))
-		test_set_name = "MediaSet1";
-	else
-		igt_assert(!"reached");
+	switch (hwe->engine_class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		test_set_name = "RenderBasic";
+		break;
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		test_set_name = "ComputeBasic";
+		break;
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		if (HAS_OAM(devid))
+			test_set_name = "MediaSet1";
+	default:
+		igt_assert(!"missing");
+	}
 
 	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
 		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
-- 
2.46.0

