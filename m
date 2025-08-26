Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C9FCA0EE4
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 05:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADC810E5C4;
	Tue, 26 Aug 2025 05:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZ4eBOyF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE31610E2C7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 05:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756187459; x=1787723459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Su7MWIHcwtPkkdISbLBOp0I9dHZtsORpk5c4xFhN3g0=;
 b=TZ4eBOyFm0mavi0uh3hs8ViRrLEGO8q7YH7YnEE1wwe0lTJotuPEmt3j
 +675sI8kn09q3LxfzxrjAoneGUXlMvb2GyKQ5dxulIlTeHkruicU/+J9G
 J6fFvYxwCpEy2R9jjPnv8v3fRHxywnobEnuV2nu1oAwrw0HPO//pYQYg8
 tdNuD+GC7W1ALUD3cIjxmQxTi3wYYiZ+tKR2IP8FJRJvQQJ8VlsIjAgfo
 uMr32soXIZ1+XvewFujQIMGdqGphVEovG9WQaO6s3CHOXQQua+4yJ+yHZ
 E7hb7jSqMFDU+J4O1vftJxHsmv7GMierxpQ9ARugrvhOEatcy8H2yqF38 A==;
X-CSE-ConnectionGUID: ltbN6so6QlKtlsQm/rBCqw==
X-CSE-MsgGUID: iA2DeRwORdGcVmmGSb+PFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69784400"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69784400"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:50:59 -0700
X-CSE-ConnectionGUID: m6rByRduRlGOWNLYioB1nA==
X-CSE-MsgGUID: 5n0obAdZTbGh/UW7qm+ncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168989321"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:50:58 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] tests/xe_evict_ccs:Adjust object size as per VRAM
Date: Tue, 26 Aug 2025 05:50:49 +0000
Message-Id: <20250826055049.505047-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826055049.505047-1-sobin.thomas@intel.com>
References: <20250826055049.505047-1-sobin.thomas@intel.com>
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

Some BIOS configurations do not support or enable resizable BAR,
resulting in a maximum BAR size of 256MB. This patch adjusts the
maximum object size used in test conditions based on the available
VRAM.

v2: Adjusted the subject name

v3: Inco-operated review comments [kamil]

v4: Fixed typo.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_evict_ccs.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 281d27015..841ed2997 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -343,6 +343,35 @@ static void set_config(int fd, uint32_t flags, const struct param *param,
 	igt_debug("nproc: %d, mem per proc: %dMB\n", nproc, config->mb_per_proc);
 }
 
+static void adjust_params_for_vram_size(uint64_t vram_size)
+{
+	uint64_t vram_mb = vram_size / (1024 * 1024);
+	int recommended_max_size_kb;
+	bool user_set_max_size = (params.max_size_kb != MAX_OBJ_KB);
+
+	 /* max_object_mb = VRAM_mb / 64, clamped between 2MB and 256MB
+	  * Formula works for all VRAM sizes with consistent behavior
+	  */
+	int max_object_mb = vram_mb / MIN_OBJ_KB;
+
+	max_object_mb = max_t(int, 2, min_t(int, max_object_mb, 256));
+	recommended_max_size_kb = max_object_mb * 1024;
+
+	igt_info("VRAM (%"PRIu64"MB): Calculated %d%% usage, %dMB max objects\n",
+		 vram_mb, params.vram_percent, max_object_mb);
+
+	if (user_set_max_size) {
+		igt_warn("User specified max object size (%dKB) may not be"
+				"optimal for %"PRIu64"MB VRAM (recommended: %dKB)\n",
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
@@ -500,6 +529,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
+		adjust_params_for_vram_size(vram_size);
 		has_flatccs = HAS_FLATCCS(intel_get_drm_devid(fd));
 	}
 
-- 
2.34.1

