Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FBDD1CA36
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEE310E523;
	Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9vDJYqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DEC10E520
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787557; x=1762323557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+A1hn4+9Ew75wAeEMZSFLC9nHrRF/pgCuD84VXepryI=;
 b=Y9vDJYqoMW3S+/MQWlOfhJrTYK6/xEWcHVGYIe38pHbUkVIXs5j0RHG4
 aB9no/Z1A2pPzaj/oLk/yaqusvrMOq38t9btMuabH8jodwMCx2JlV5+2j
 O/8SQEykPKcYX25H2BSn0dghpgfWEjbeYlEU4y4NBxcEVV4lNt7y0fOq4
 vxfF9kd8mh3SI8kb0lFthxq4HaJon7elb24zp50m6TI/YOcHwlLp4txtT
 3T7DR0fNC3C+comDxlM9LP5raZA0179HYrdIN0nuG0a1CtDNvbpzvOyqn
 uNifqIICSEcILDPxEBwxGY8YzxUSZJXiPAcUM8EC9W3/EsESW3W9sdnjn w==;
X-CSE-ConnectionGUID: 6TK2vTfnSlOc9c0HOgPnLQ==
X-CSE-MsgGUID: AFXFVAIZRUm+c4iZlT7L9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133566"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133566"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: Dp4ilXB4SkeJGlsuWkaC/g==
X-CSE-MsgGUID: wws67lY9RHqS8XCrs6/qUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781727"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/9] lib/igt_kmod: Share xe's unload logic with i915
Date: Mon,  4 Nov 2024 22:18:39 -0800
Message-ID: <20241105061845.2486557-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105061845.2486557-1-lucas.demarchi@intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
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

Now that xe unbind+unload logic is working, extend it to i915.
Note that there was a buggy call igt_kmod_is_loaded("driver") that would
never trigger: no point fixing that if we are dropping it though.

Another note that we can't still completely drop the old logic since a
few tests rely on it. Example: tests/intel/perf_pmu.c checks for trying
to remove the module with a perf event open and that being blocked by
the module refcount. Doing unbind() first would succeed the module
unload, but also crash the machine since perf doesn't work (yet) with
unplugging the device. That will need to be fixed in the kernel first.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 36 +++---------------------------------
 lib/igt_kmod.h |  6 ++++--
 2 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d031bfe18..0c093ec62 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -703,40 +703,10 @@ int igt_kmod_unbind(const char *mod_name)
 int
 igt_intel_driver_unload(const char *driver)
 {
-	char *who = NULL;
-	int ret;
-
-	ret = __igt_intel_driver_unload(&who, driver);
-	if (ret) {
-		igt_warn("Could not unload %s\n", who);
-		igt_kmod_list_loaded();
-		igt_lsof("/dev/dri");
-		igt_lsof("/dev/snd");
-		free(who);
-		return ret;
-	}
-	free(who);
-
-	if (igt_kmod_is_loaded("intel-gtt"))
-		igt_kmod_unload("intel-gtt");
-
-	igt_kmod_unload("drm_kms_helper");
-	igt_kmod_unload("drm");
-
-	if (igt_kmod_is_loaded("driver")) {
-		igt_warn("%s.ko still loaded!\n", driver);
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
-int igt_xe_driver_unload(void)
-{
-	igt_kmod_unbind("xe");
+	igt_kmod_unbind(driver);
 
-	igt_kmod_unload("xe");
-	if (igt_kmod_is_loaded("xe"))
+	igt_kmod_unload(driver);
+	if (igt_kmod_is_loaded(driver))
 		return IGT_EXIT_FAILURE;
 
 	return IGT_EXIT_SUCCESS;
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 193b95627..88d4a51e6 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -64,8 +64,10 @@ static inline int igt_xe_driver_load(const char *opts)
 	return igt_intel_driver_load(opts, "xe");
 }
 
-
-int igt_xe_driver_unload(void);
+static inline int igt_xe_driver_unload(void)
+{
+	return igt_intel_driver_unload("xe");
+}
 
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
-- 
2.47.0

