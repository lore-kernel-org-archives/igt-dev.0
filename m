Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F390FC79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 09:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B33310E745;
	Mon,  7 Sep 2026 09:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/sWkPFq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA43110E740
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788774668; x=1820310668;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H6YwwOy6IYwmzuXiFJgeyVpHxbddHHXwH+LcgaVuCCQ=;
 b=f/sWkPFq0hqk9vozxD1RVfGSRJe/Xk6LGSfSFsCKuaaYqMA/ghcYp4v8
 jTUq4LjTc1zPW4jWHwF6yVLcIuWFFDA0Fcl9rSD+Ch5McIqtrM640GyTG
 yysz+xvIZBqNq6fMc0VjwKRJRHFeJekmK7EpCetXopu93SmY7CjYrfgsU
 53vznSuj0IWoC7B4whpQoQbp6qPmsV7oBe4UTpJVNP0y/HBn5dUdOUC13
 D906p2m47oyNXrsYExWt/DBhx1Nhs0Nll7/t3DxX8Cqej97dEPG5pCV1E
 xZOLSnzeugbXYNOe8lRGBsyuPkHW9cpteAeni0ODnmsemb+uIXOL0LZC6 g==;
X-CSE-ConnectionGUID: NLKm9nRlS2S6jfeOynYFKg==
X-CSE-MsgGUID: bg4xFZrQRBqaIH/pwwkEZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106544314"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="106544314"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 02:51:08 -0700
X-CSE-ConnectionGUID: HZ13ohFpQ1W9WppFn9kXRw==
X-CSE-MsgGUID: QUaWaVakTBK3LP21odLYjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="268933184"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa006.jf.intel.com with ESMTP; 07 Sep 2026 02:51:07 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_exec_reset: fix mixed-engine reset stress to
 use actual GT engines
Date: Mon,  7 Sep 2026 09:51:05 +0000
Message-ID: <20260907095105.312933-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch fixes the mixed-engine reset stress subtest by selecting only
engine class/instance pairs that are actually exposed by the target GT
instead of using a hardcoded class list with engine instance 0.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Suggested-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>

I talked with Gajendra and he suggested this change to me, but I made
a mistake and added his s-o-b instead of suggested-by, so resending
this with correct tags
---
 tests/intel/xe_exec_reset.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 34232f433..e12279d23 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -702,17 +702,20 @@ static void bo_ctx_create(int fd, int gt, uint64_t addr, size_t bo_size,
 static void fill_mixed_engine(struct gt_thread_data *t, int iter,
 			      struct drm_xe_engine_class_instance *instance)
 {
-	const uint16_t classes[] = {
-		DRM_XE_ENGINE_CLASS_COPY,
-		DRM_XE_ENGINE_CLASS_RENDER,
-		DRM_XE_ENGINE_CLASS_COMPUTE,
-		DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-		DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	};
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance engines[64];
+	int n = 0;
+
+	xe_for_each_engine(t->fd, hwe) {
+		if (hwe->gt_id != t->gt)
+			continue;
+		engines[n++] = *hwe;
+		if (n == ARRAY_SIZE(engines))
+			break;
+	}
 
-	instance->gt_id = t->gt;
-	instance->engine_instance = 0;
-	instance->engine_class = classes[(iter + t->id) % ARRAY_SIZE(classes)];
+	igt_assert_f(n > 0, "GT %d exposes no engines\n", t->gt);
+	*instance = engines[(iter + t->id) % n];
 }
 
 static void pressure_bo_create(int fd, uint32_t vm, int gt,
-- 
2.43.0

