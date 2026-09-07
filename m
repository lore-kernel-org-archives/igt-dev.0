Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4D8C79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 06:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3341310E32A;
	Mon,  7 Sep 2026 06:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkbfttvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7DF10E32A
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 06:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788760905; x=1820296905;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1TbNNuhvOK20qA1ank1ijeuxyS6zzcaqAZ3m898xO1U=;
 b=TkbfttvXi6mMLkwDkeJFwN3RKfvMxvHHO8eAA9+6/SL+fa2VxzTR2O+i
 t1VN6bKcqyhsAzBqCQc3ZzcOt90LPWLtXS3t4JJi11g9z+swvdcGbOFKI
 04Vy4OCKma1HHFSwQXqrmQBIfbBG3bu88QESriD4hAig/oQHT8ID/1FMb
 7Sl0noQK2fRtuuhH37xp0NWaBHEbm0GgBXfkqdcVeO0fw5Wd2TFO5cc/o
 RYDQR7pqNFx1HQgTeuFnxp8n1H2QXbN6pKZ28dlCxfSGSLoE5C78bgbw2
 f/WZ4AFtswJvnqHNEdsUJiFcm3GfnSCW82yijRdmVFragN8GIapPiel6k w==;
X-CSE-ConnectionGUID: O1Ib031FStyjDGFGgLap9g==
X-CSE-MsgGUID: X+k/0USjQ0+RLEwwSQtG3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88302861"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="88302861"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:01:45 -0700
X-CSE-ConnectionGUID: OJ0qbUpfSg+aMQc+MwjH8w==
X-CSE-MsgGUID: vOtIZexoT+eSm+oiL6HO9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="294092164"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa002.fm.intel.com with ESMTP; 06 Sep 2026 23:01:43 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_exec_reset: fix mixed-engine reset stress to
 use actual GT engines
Date: Mon,  7 Sep 2026 06:01:42 +0000
Message-ID: <20260907060142.311888-1-nishit.sharma@intel.com>
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
Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
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

