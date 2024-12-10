Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4562E7717D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 02:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4534510E5B7;
	Tue, 10 Dec 2024 02:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHITkLer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C4810E5B7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 02:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733796508; x=1765332508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WmY78uhUkErlfXDJmnYzRt0tsJUyVs9ZgZgSujC2cGs=;
 b=GHITkLerkU3NM17rOKYaknfP+r7IeyWhwpaxvD93oSnNnl0pnZc87u6k
 3hoRAkw+0yRlcLV5QWb4ynqk1ARObC9Xxc35BfQ2glEgXoeN3sWMwVPzT
 LwJgBtuTNjxNynawUzDy4+g1kOz+aCIRKvntt6X5BSLCGChKVLKSWkszV
 Ez04AznNKZqcFPNsXZYnKcFVsLYfZVdS5obBsoo/eNRV4IdEZAjSNZ2Ko
 Ut+h7Ccg5HpVjxwV2ChEZKzriColSBTvaWGiXNUGcyZoRtAdTC4ZDGd8i
 oncErsLsiLDuZGNO34gXy+cWURW9AcHzVR79mcXXayrQIZl5RHJH5VZWv w==;
X-CSE-ConnectionGUID: /sm7JdppQaWMPjBEz5m6hQ==
X-CSE-MsgGUID: 323kZ1S9QNqCVk0nBmCqOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="44724568"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="44724568"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 18:08:18 -0800
X-CSE-ConnectionGUID: 8VT/SzmRRAeLT2RgbqXFoQ==
X-CSE-MsgGUID: W1ZOJSoTSJucFaBxeQPwzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; d="scan'208";a="100203711"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 18:08:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/3] Revert "tests/xe_oa: Drop TestOa from metric_set()"
Date: Mon,  9 Dec 2024 18:08:11 -0800
Message-ID: <20241210020812.1513475-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210020812.1513475-1-ashutosh.dixit@intel.com>
References: <20241210020812.1513475-1-ashutosh.dixit@intel.com>
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

This reverts commit d226604a63fbd5c37c9f5d60b6fc23acffc49f0a.

Re-instate TestOa metric set. IGT needs to work with TestOa since it has
special properties which help with OA data validation. Remaining parts of
d226604a63fb were already reverted in 4942fc57c20f ("lib/xe/oa: Re-instate
TestOa metric sets in LNL/BMG XML's").

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9e7c2ae1e6..c660720ea0 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -310,20 +310,15 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
 	struct intel_xe_perf_metric_set *metric_set_iter;
 	struct intel_xe_perf_metric_set *test_set = NULL;
 
-	switch (hwe->engine_class) {
-	case DRM_XE_ENGINE_CLASS_RENDER:
-		test_set_name = "RenderBasic";
-		break;
-	case DRM_XE_ENGINE_CLASS_COMPUTE:
-		test_set_name = "ComputeBasic";
-		break;
-	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
-	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		if (HAS_OAM(devid))
-			test_set_name = "MediaSet1";
-	default:
-		igt_assert(!"missing");
-	}
+	if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+	    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+		test_set_name = "TestOa";
+	else if ((hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
+		  hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE) &&
+		 HAS_OAM(devid))
+		test_set_name = "MediaSet1";
+	else
+		igt_assert(!"reached");
 
 	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
 		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
-- 
2.47.1

