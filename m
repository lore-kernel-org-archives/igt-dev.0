Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F032CD5BDF
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 16:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3BE10E8C8;
	Thu,  5 Sep 2024 16:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pd0tpDNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C22810E8C8
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725554705; x=1757090705;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w5LDoBQP4sUWNv20lxHI+Rwgh53i+pKWfHA+Wz/jfjM=;
 b=Pd0tpDNyrPr1dIOOs5EQYRc4Z3+JvrfJJ2ObbHRbvJDbIxSX1dO/JMDE
 1W+cttVdvWyfceA0NP3mKRTuuFuxeDRDmVz4AFyS5lS7H9HdDyDru7WIP
 1Du2xkvjCcmJ5V6pZHQ0mEp1T9JGi6xH7iZUpSBjIW4A186NANe3VkmVd
 0UxPQrC00RswZvt2YaSGH8LUW+GcJy2kWY1ZfVpLewcvQCyC4t7e1/svV
 aWqnf5EFNqQ/Dh7agdtBTuQf7eEbewK+r5gA9I81UKHP+TDDwHBcKMAVw
 M1QoCJVaLdhW8zhEs/PSeI4UpkhmxZBJyOwh0dQAPGXCeCanNj53wKQL0 w==;
X-CSE-ConnectionGUID: ot2MaSTtRYCy9637ziAHKg==
X-CSE-MsgGUID: tmMHdclxQoicQn6gDLbswg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41764580"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="41764580"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:45:05 -0700
X-CSE-ConnectionGUID: xQxYef5KQCaHkhs5IPz4Ig==
X-CSE-MsgGUID: UEPEwqnsSdOBy820hk+qTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70485535"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:45:05 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/4] tests/xe_oa: Drop TestOa from metric_set()
Date: Thu,  5 Sep 2024 09:44:55 -0700
Message-ID: <20240905164458.2406145-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

From: José Roberto de Souza <jose.souza@intel.com>

Some platforms don't provide TestOa and Renderbasic and ComputeBasic
are better tests for render and compute engine and available in all
platforms.

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
2.41.0

