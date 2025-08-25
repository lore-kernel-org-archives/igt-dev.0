Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6DACA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 06:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3158E10E344;
	Mon, 25 Aug 2025 06:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoVH8a7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D0A10E343
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 06:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756103718; x=1787639718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EeIiE3yBFF6dQS+DhEcET2w14028n84StiuP3k7Ik8o=;
 b=FoVH8a7aSn+CeSE9SBlvZpSz9pVeVwAIgbzwipNz+1E+rHpSOpNXcx5E
 jw54xykeRPVYAs7mr4Y6Mysgin85vc8l6i4y+TGosXVEBpkrbfZg30NQN
 oAwDA3FBbqhgrlSWFeLGLSEAqcrnsjZqBE829TkZYxtu2cJ3RcGD9ni9r
 OEMn8Day6U30I6pmq4px+j9Wr10KaanOgvXBNDGstTnkej+MZSwMSTQix
 kbbTIi39B9NwFj9TS3XpwlBhxXLl8lLwJlllg67vrGjaMdfl0Sn6kp/4X
 Td5MmTX14600S1OJnmqTzpUF1pQ1ynIqvWAUA0+sGZQIgz2RhygUu1AC1 w==;
X-CSE-ConnectionGUID: UdIlXkDgQJuLbRhwjU4xLQ==
X-CSE-MsgGUID: 9oK9mvziQV6AbCEBygmR/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75904293"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75904293"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 23:35:13 -0700
X-CSE-ConnectionGUID: 2LkHN+fASAKKueID1xuwBw==
X-CSE-MsgGUID: 5j5wJ5AkTiOuqFGnNb0ylw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="173397066"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2025 23:35:13 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 1/1] tests/xe_evict_ccs:Adjust object size as per VRAM
Date: Mon, 25 Aug 2025 06:35:03 +0000
Message-Id: <20250825063503.484501-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825063503.484501-1-sobin.thomas@intel.com>
References: <20250825063503.484501-1-sobin.thomas@intel.com>
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

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_evict_ccs.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 281d27015..8fc2308f7 100644
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
@@ -500,6 +529,7 @@ igt_main_args("bdDn:p:s:S:V", NULL, help_str, opt_handler, NULL)
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
+		adjust_params_for_vram_size(vram_size);
 		has_flatccs = HAS_FLATCCS(intel_get_drm_devid(fd));
 	}
 
-- 
2.34.1

