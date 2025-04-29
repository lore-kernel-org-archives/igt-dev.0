Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF004C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 23:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4823A10E1E0;
	Tue, 29 Apr 2025 23:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuCwOMVe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F97210E1E0
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 23:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745970576; x=1777506576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R7UESXvhG/hvIQVhgSWctrQdS7d7mtCND1w/p288bKk=;
 b=SuCwOMVekiVdJzs8y6xVQ8uDTwNtgYzM9G7ieUbRzN845yA3aVOs+78h
 g/0TzXf3vRCU/VrjrbJpsDuc00EYZw4svI0+e31bl2thT+ToYnfk9JDWa
 +G3dglacUX6BHrAVZwarWMqibR8+HB/a9OEBj+AvmehSzlX+RYErRg5fL
 nYOEBWyAhW6DsP1kdjHp4PUxRsSZx3Ch5CCloz2S0jT07g0o+UbFB9Uv2
 MWbKxG39evtAcvz7ocIVjTSOfsgzJScBGX6ccWyB6eIiujzpqFr2dbfhx
 2GhsdnHyn5DZL3nuPWJ0WupnFO1Qma/mKNSLsTWVK2vH6WAiLJeMD4oQY Q==;
X-CSE-ConnectionGUID: FLIGNCHUS7eMJIVCdZg89w==
X-CSE-MsgGUID: WOBtdlrOR4i9BBNzOJJx0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="72997938"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="72997938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 16:49:34 -0700
X-CSE-ConnectionGUID: sFS9r5qzTW6mMRVlIF3ECA==
X-CSE-MsgGUID: cJI4f3pdTNqBie5JMimCcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133853258"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 16:49:35 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_pxp: Terminate PXP on exit
Date: Tue, 29 Apr 2025 16:49:24 -0700
Message-ID: <20250429234924.2049502-1-daniele.ceraolospurio@intel.com>
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

Most of out tests expect to start their execution from a clean GPU state.
However, the PXP tests currently leave a PXP session running when they
complete, so follow up tests will not have a clean starting state; given
that PXP can impact the timing of some operations (e.g. suspend/resume),
this could pollute the results of those tests. Therefore, let's make
sure that PXP is de-activated before we exit.

While at it, update the fd cleanup to use drm_close_driver() instead
of close().

v2: only do the termination if PXP is supported.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com> #v1
---
 tests/intel/xe_pxp.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 458d32322..9eddc03fc 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -1140,9 +1140,23 @@ static void termination_tests(int fd, bool pxp_supported, drmModeResPtr res,
 		}
 }
 
+int xe_fd = -1;
+
+static void exit_handler(int sig)
+{
+	/*
+	 * PXP can interact with some operations (e.g. suspend/resume), which
+	 * could impact the behavior of other tests if they unknowingly start
+	 * when PXP is already active. Therefore, let's make sure PXP is
+	 * de-activated before we exit.
+	 */
+	trigger_termination(xe_fd, PXP_TERMINATION_IRQ);
+	drm_close_driver(xe_fd);
+	usleep(50 * 1000); /* give time for the termination to be processed */
+}
+
 igt_main
 {
-	int xe_fd = -1;
 	bool pxp_supported = true;
 	drmModeResPtr res;
 
@@ -1151,6 +1165,8 @@ igt_main
 		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
 		pxp_supported = is_pxp_hw_supported(xe_fd);
 		res = drmModeGetResources(xe_fd);
+		if (pxp_supported)
+			igt_install_exit_handler(exit_handler);
 	}
 
 	igt_subtest_group {
@@ -1215,6 +1231,7 @@ igt_main
 
 	igt_fixture {
 		drmModeFreeResources(res);
-		close(xe_fd);
+		if (!pxp_supported)
+			drm_close_driver(xe_fd);
 	}
 }
-- 
2.43.0

