Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05057C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 15:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35DE10E17D;
	Wed, 23 Jul 2025 15:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6jdqRCG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E7B10E17D
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 15:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753283123; x=1784819123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YbEK+1dv2pRmVtuwcoTWApAlrQGFjyl/Jwz7iRZR3Rk=;
 b=O6jdqRCGLXDQc5lqCd3oRHk+8W00MGfjPzutDY6p7pld+ZjgRxaB9uVa
 n0xIyLq/q+d5E8Q2Kfj6cwm+h1ozHkNc0ptAVxWQaf4OTGsb4jKjn/Ptn
 Z9mXgbm4vTNe0WcGck0Jpes19u5s90gDPW5YN60zOMZScn5RxCFbh5680
 PNiuYFVzQXRnGdQfx+n+KDzX8sFEhPg4wy9YgllI7gBdHf6avp8Lcz5Ia
 yHCFe10o3cvmwzN7FQg3JHrn2fe74GZ9Wc6hD2ttLNIhRUyYoIl754tQ5
 4TC+2LcaQEEiE+DyWeGYP1LhRimN9bz0YLInm4vU7Ymhq5PyakO5oDOO4 g==;
X-CSE-ConnectionGUID: 7xVrr05mQ8a0WIe7tfJUkg==
X-CSE-MsgGUID: SiUfaCKuTPSdFvjFLPTTWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73149475"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="73149475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:05:16 -0700
X-CSE-ConnectionGUID: h9gT2awURPSSQQWr2nfEYQ==
X-CSE-MsgGUID: USq1D6WLSOaV5tLffF2eCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="163816767"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:05:16 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] tests/xe_evict_ccs:Add check to update object param
 as per visible RAM
Date: Wed, 23 Jul 2025 15:05:08 +0000
Message-Id: <20250723150508.552862-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723150508.552862-1-sobin.thomas@intel.com>
References: <20250723150508.552862-1-sobin.thomas@intel.com>
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

This change will modify the parameters for the test based on the
available visible ram and update the max object size that is calculated
based on the existing method

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_evict_ccs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 281d27015..9abff1389 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -343,6 +343,31 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
 	igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, config->mb_per_proc);
 }
 
+static void adjust_params_for_vram_size(uint64_t vram_size)
+{
+	uint64_t vram_mb = vram_size / (1024 * 1024);
+	int recommended_max_size_kb;
+	bool user_set_max_size = (params.max_size_kb != MAX_OBJ_KB);
+	int max_object_mb = vram_mb / 64;
+
+	max_object_mb = max_t(int, 2, min_t(int, max_object_mb, 256));
+	recommended_max_size_kb = max_object_mb * 1024;
+
+	igt_info("VRAM (%"PRIu64"MB): Calculated %d%% usage, %dMB max objects\n",
+		 vram_mb, params.vram_percent, max_object_mb);
+
+	if (user_set_max_size) {
+		igt_warn("User specified max object size (%dKB) may not be
+				optimal for %"PRIu64"MB VRAM (recommended: %dKB)\n",
+				params.max_size_kb, vram_mb, recommended_max_size_kb);
+	} else {
+		params.max_size_kb = recommended_max_size_kb;
+	}
+
+	igt_info("Final settings: %d%% VRAM, %dMB max object\n",
+		 params.vram_percent, params.max_size_kb / 1024);
+}
+
 static void evict_ccs(int fd, uint32_t flags, const struct param *param)
 {
 	struct config config;
@@ -500,6 +525,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
+		adjust_params_for_vram_size(vram_size);
 		has_flatccs = HAS_FLATCCS(intel_get_drm_devid(fd));
 	}
 
-- 
2.34.1

