Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF8ACD128E
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 04:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD35010E89B;
	Fri, 29 Mar 2024 04:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJRBau1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0309A10EADE
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 04:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711686728; x=1743222728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CwSb6cHq9xFXScy/Mh+zcyDzgWK1Gj1mUjCAuhL8LIU=;
 b=QJRBau1mAdQshXhL6O7lg/ylUzaDWAu3x73VpSQS+OBa7g8tFFlulByi
 Q+xhx1EkyWUk75RP3QZlZSGUI1Kpz8atDG+Z/+zayt5LfF2P5UP9AsmEh
 Y3VIRWXcAZQfXNZG5n22DES3CyCYWXrCZUON5yeg6c0BjucWQXJ5KQNa1
 3TUOi7qbkNnRezzEt1Y1IfG1yulPKqQZ0URCn8XZh5bZN3e5ePKWDB6bu
 P2Xssdn/lAZeIYGzUEfnFTha2dqpfTY6s4/y6InB/DZEvUcY+xzVip8Tg
 0TG12x8nqYWg1q0t6zncCd3/PSpjgeEXbx4esJBRzmTozElR/VNZiVTKF A==;
X-CSE-ConnectionGUID: Vq0F00Y0SUqSNoR0xU81Ww==
X-CSE-MsgGUID: xQBf55umRCiZNATBuzEF/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17501427"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17501427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 21:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16829104"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 21:32:05 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/xe_ccs: Update compression in config based
 on platform
Date: Fri, 29 Mar 2024 09:30:13 -0700
Message-Id: <cb8e514071a09bbcf1492005daaf53083616b1a9.1711729400.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711729399.git.akshata.jahagirdar@intel.com>
References: <cover.1711729399.git.akshata.jahagirdar@intel.com>
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
flat-ccs. The entore flow of the test should work even in case of flat-ccs
disabled, Everything should "just work".
Check if the platform supports compression and has flat ccs enabled, before
the execution if this test, and if it doesn't, then update to compression
disabled and proceed with the test.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel/xe_ccs.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index ad2eeb259..9f427e730 100644
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
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
@@ -756,6 +759,10 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 					      .width_increment = 15,
 					      .width_steps = 512 };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
+			config.compression = false;
+
+		igt_info("p1: config.compression:%d\n",config.compression);
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
@@ -763,6 +770,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("block-multicopy-compressed") {
 		struct test_config config = { .compression = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
 	}
 
@@ -771,6 +781,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		struct test_config config = { .compression = true,
 					      .inplace = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_MULTICOPY);
 	}
 
@@ -779,6 +792,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 		struct test_config config = { .compression = true,
 					      .surfcopy = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
@@ -789,6 +805,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 					      .surfcopy = true,
 					      .new_ctx = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
@@ -798,6 +817,9 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 					      .surfcopy = true,
 					      .suspend_resume = true };
 
+		if(AT_LEAST_GEN(xe, 20) && !blt_platform_supports_compression(xe))
+			config.compression = false;
+
 		block_copy_test(xe, &config, set, BLOCK_COPY);
 	}
 
-- 
2.34.1

