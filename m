Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92903CD3430
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 13:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B7F10E5A6;
	Tue,  3 Sep 2024 13:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cW1jyMGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796B010E5A6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725369893; x=1756905893;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Fp/WEo4i2YIIWC9yfyuOw+w5ojUBZ3w8yGF8sJ/SU0=;
 b=cW1jyMGdF3RQyuRDZoknRj9LCybCgEtE63cp5UriQoBAvD4MpCfHkuZu
 YeUy7tNch/kdcZBGGu/pf5IOiiZOptBF+l6aDk4q1CL5DMz3qdekduB5b
 cW9Eq9rKdFOauHB3ohXmfhkUyYTC6ueGkksKdXkg2yxQX2efjaMEr6msK
 4MT+MpAfrofZhhkgARd7O9X0CtXO5V3wmpI7bNkcu4nmh0O6ZL5610JXV
 OVwnW9p6yOqYT5rEj5uhlEGvRRmNijWcGVjBSYFGAb+U00R7Jwk19NgZc
 8ldw/AyjzzmknEF4z96XYt72MVQYt6SC3KIPc7+DPLOaZGtRAnFPAmUDN A==;
X-CSE-ConnectionGUID: HQaYaVQ7TIaRTfloVNMLCg==
X-CSE-MsgGUID: k57w1uBZR9+VEvmCltEeng==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23842586"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="23842586"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:24:53 -0700
X-CSE-ConnectionGUID: AVbpiJDzTKuqbnI33LZezw==
X-CSE-MsgGUID: 7crRDxXzQQyiDikGkiOzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="69540726"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 06:24:51 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH i-g-t v2 1/4] tests/xe_oa: Drop TestOa from metric_set()
Date: Tue,  3 Sep 2024 06:24:33 -0700
Message-ID: <20240903132436.8337-1-jose.souza@intel.com>
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
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/intel/xe_oa.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index f2c6d53007..dac3fb6bd5 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -311,15 +311,21 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
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
+		break;
+	default:
+		igt_assert(!"missing");
+	}
 
 	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
 		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
-- 
2.46.0

