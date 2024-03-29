Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095CDC6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 05:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F92010EF51;
	Fri, 29 Mar 2024 05:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xpp+hKme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB1710FAA4
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 05:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711690155; x=1743226155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GWa2nAhZzvcHLZ++9SVcZhWTgHB4dOyDBWO9jz2taeM=;
 b=Xpp+hKmeCk81xCJSG1FmlUAr/3eDWVh+vycltX178gd1KOWt3YsupFxG
 F2TlWUer2tAOG33Phx63yt45daSAi2GeSr+l6ZzLchAG+UXu3d4DMOSOZ
 bgqLxKUsJPoCTyaNoPRkTmzRVUsPMAFOi+EoZ1oIBQQ4J7ySNN04yek2G
 zDdKy0MNnJE/dT+3i1n5vuxX3KnLdpVrDxcHkJX17dH4T88lPVgykfzAC
 LAmbadtmtbtDd2x04JRkXA0mEIcPDQmC0qEIRTl/ccdlOBRFe+TEexnYw
 5HAl1D64XPH+VkbRWH3BCiBLhzAOxFtXOY59t6x24+DC1zKZts2Qz3lo7 w==;
X-CSE-ConnectionGUID: zaYNg4MVRlSWiKuW5U0g4Q==
X-CSE-MsgGUID: XoNxikvqSwihH4DUAq1Q8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6731325"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="6731325"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="16757700"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:28:53 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/xe_ccs: Update compression in config based
 on flat-ccs enablement
Date: Fri, 29 Mar 2024 10:27:01 -0700
Message-Id: <f1b977863136bc70c9aae20be72a2fbf1b4b606f.1711733054.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711733054.git.akshata.jahagirdar@intel.com>
References: <cover.1711733054.git.akshata.jahagirdar@intel.com>
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

In Xe2+ platforms, we need to run this test regardless of the status of
flat-ccs. Check if the platform supports compression and has flat ccs enabled,
before the execution and if it doesn't, then update to compression
disabled and proceed with the test.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index ad2eeb259..073eca355 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -116,7 +116,6 @@ static void surf_copy(int xe,
 	uint16_t cpu_caching = __xe_default_cpu_caching(xe, sysmem, 0);
 	int result;
 
-	igt_assert(mid->compression);
 	if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression) {
 		comp_pat_index  = intel_get_pat_idx_uc_comp(xe);
 		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
@@ -193,7 +192,8 @@ static void surf_copy(int xe,
 	intel_ctx_xe_sync(ctx, true);
 	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
-	igt_assert(result != 0);
+	if(mid->compression)
+		igt_assert(result != 0);
 
 	/* retrieve back ccs */
 	memcpy(ccsmap, ccscopy, ccssize);
@@ -747,6 +747,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("block-copy-compressed") {
 		struct test_config config = { .compression = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
@@ -756,6 +759,10 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 					      .width_increment = 15,
 					      .width_steps = 512 };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			config.compression = false;
+
+		igt_info("p1: config.compression:%d\n",config.compression);
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
@@ -763,6 +770,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("block-multicopy-compressed") {
 		struct test_config config = { .compression = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
 	}
 
@@ -771,6 +781,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		struct test_config config = { .compression = true,
 					      .inplace = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
 	}
 
@@ -779,6 +792,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		struct test_config config = { .compression = true,
 					      .surfcopy = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
@@ -789,6 +805,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 					      .surfcopy = true,
 					      .new_ctx = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
@@ -798,6 +817,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 					      .surfcopy = true,
 					      .suspend_resume = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_has_flat_ccs_enabled(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
-- 
2.34.1

