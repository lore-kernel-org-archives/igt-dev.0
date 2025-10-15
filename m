Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC287CCD193
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 10:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DF410E76F;
	Wed, 15 Oct 2025 10:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgVqDOm4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08EF10E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760522537; x=1792058537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lZ/7/erfGDqPysMMWplK/zNS3UcBJSGk2Ze/UepYbxc=;
 b=HgVqDOm4JDJM1NV0khwp6zWa0+lm2I7jHwaPNSouDe7DrLaxO+4jlLc2
 hAJsGBiLsGzUOsV7PFJ5iTF7bae/bDqtW5QPKDZPrJzbp83Wq5HQsFYWz
 H97HcUla9tEqRiIXL1OzQm+Lzlu4ppmS3bz/YfR2SO2O+s624NiYQcwqU
 VRQWUHct8D1ZgrifOYLmFA8wzjzcFSqYwQNRqYAQY2/2y1AybheASvzCA
 kDLU5m1r/ngE6ZGS+TV3TVCM3SgQtP7tgW/RmxIudz+ZDj7vP6Uqz2QWY
 rER8NRYp59Paocv+zLmocHR7NkUSmrZ3M372lrfo0on99+z4Eo2YOj4v8 g==;
X-CSE-ConnectionGUID: 62aJEio0Re6Hl44YLfqB0w==
X-CSE-MsgGUID: ezKKz0iFQI+THdRc3TqsXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62590180"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62590180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:02:17 -0700
X-CSE-ConnectionGUID: rFB2/3inTTqoemJu9QaCGQ==
X-CSE-MsgGUID: TSbzRClnTqSZQ/1NRL4Fkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="205835574"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:02:12 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/6] tests/intel/kms_dp_linktrain_fallback: rename to
 tests/intel/kms_linktrain_fallback
Date: Wed, 15 Oct 2025 15:47:55 +0530
Message-Id: <20251015101759.3982477-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015101759.3982477-1-kunal1.joshi@intel.com>
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
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

rename kms_dp_linktrain_fallback -> kms_linktrain_fallback
and update meson build for compilation

Cc: Imre Deak <imre.deak@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 ...s_dp_linktrain_fallback.c => kms_linktrain_fallback.c} | 0
 tests/meson.build                                         | 8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename tests/intel/{kms_dp_linktrain_fallback.c => kms_linktrain_fallback.c} (100%)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_linktrain_fallback.c
similarity index 100%
rename from tests/intel/kms_dp_linktrain_fallback.c
rename to tests/intel/kms_linktrain_fallback.c
diff --git a/tests/meson.build b/tests/meson.build
index ed66caa21..085716cfb 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -248,7 +248,6 @@ intel_kms_progs = [
 	'kms_ccs',
 	'kms_cdclk',
 	'kms_dirtyfb',
-        'kms_dp_linktrain_fallback',
 	'kms_draw_crc',
 	'kms_dsc',
 	'kms_fb_coherency',
@@ -261,6 +260,7 @@ intel_kms_progs = [
 	'kms_joiner',
 	'kms_legacy_colorkey',
         'kms_link_training',
+        'kms_linktrain_fallback',
 	'kms_mmap_write_crc',
 	'kms_pipe_b_c_ivb',
 	'kms_pipe_stress',
@@ -379,14 +379,14 @@ extra_sources = {
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-	'kms_dp_linktrain_fallback': [
-           join_paths ('intel', 'kms_mst_helper.c'),
-           join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
         'kms_link_training': [
            join_paths ('intel', 'kms_mst_helper.c'),
            join_paths ('intel', 'kms_joiner_helper.c') ],
+        'kms_linktrain_fallback': [
+           join_paths ('intel', 'kms_mst_helper.c'),
+           join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.25.1

