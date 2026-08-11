Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA87DC5B572
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 13:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4237889C86;
	Tue, 11 Aug 2026 13:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzktSV1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD3810E500
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 13:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786455013; x=1817991013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGZcc5QAmNzmF4mX6ezqFrA+CiysNEmfnMKZVNGSPdc=;
 b=WzktSV1r/7a2oqFb5xQdKml7pTTCH2YXG6JhYKfQzGALY+34M9GyfYtx
 Q5nsXgl4I3G6g+FIHL1fEX0IOCM0j9VJ/CjReI6N1ZIjLiN59WJ48zNpy
 ZarVJJLokMvHDZ9icZpDedDK0tK1FOhYU/ZBwS/3tImmT/kCDE5G0cWn4
 0RKXazhO8MyQrRmWZv2baJIJjJ8vJFJkuc0FfIzUf0wlgBaIwI23jMkJa
 J887I7ZSfjgc7Pxhq7Ktps6WsQuubMOZ/POU6G5TEqYwfba7v3T3MbI4I
 U7GGpSrmScbd3YLl6MruU9PIK5dL5Py4cxXbwwzEpqSiPcWM9m0POScnA w==;
X-CSE-ConnectionGUID: Gx9eqaU5T4GHY1kXGo7zQw==
X-CSE-MsgGUID: I/2McDFHSWmkuJZzB9EZJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87199908"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87199908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:30:13 -0700
X-CSE-ConnectionGUID: 4LqKGdjaQJGZ4FNjPGN3mw==
X-CSE-MsgGUID: e3111kwxSiGGaIKYnBuCQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="259078057"
Received: from x299.igk.intel.com ([10.211.131.197])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:30:11 -0700
From: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mchehab@kernel.org,
	"Tahvanainen, Jari" <jari.tahvanainen@intel.com>
Subject: [PATCH 2/2] scripts/code_cov_parse_info: add display include and
 exclude in only_xe
Date: Tue, 11 Aug 2026 16:34:11 +0300
Message-ID: <20260811133411.720679-3-jari.tahvanainen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811133411.720679-1-jari.tahvanainen@intel.com>
References: <20260811133411.720679-1-jari.tahvanainen@intel.com>
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

Only_xe was missing display, so let's add that.
Xe build do not include all the files from i915/display, so let's exclude
those as obsolete.

Signed-off-by: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
---
 scripts/code_cov_parse_info | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 97f325c85..5f5d34dfa 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -1548,6 +1548,41 @@ if ($only_xe) {
 	# Please keep in sync with the documentation
 	push @src_exclude_regexes, "selftest";
 	push @src_include_regexes, "drm/xe";
+        push @src_include_regexes, "drm/i915/display";
+        #For xe the following display related sources are not part of the build
+        push @src_exclude_regexes, "drm/i915/display/dvo";
+        push @src_exclude_regexes, "drm/i915/display/g4x";
+        push @src_exclude_regexes, "drm/i915/display/hsw_ips.c";
+        push @src_exclude_regexes, "drm/i915/display/i9xx";
+        push @src_exclude_regexes, "drm/i915/display/.*_dsi";
+        push @src_exclude_regexes, "drm/i915/display/intel_bo.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_crt.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_display_presi.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_display_reset.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_display_rps.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_display_snapshot.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_dp\.h\$";
+        push @src_exclude_regexes, "drm/i915/display/intel_dpio_phy\.";
+        push @src_exclude_regexes, "drm/i915/display/intel_dpll\.c\$";
+        push @src_exclude_regexes, "drm/i915/display/intel_dpt\.c\$";
+        push @src_exclude_regexes, "drm/i915/display/intel_dsb_buffer.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_dvo.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_fb_bo.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_fb_pin.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_fbdev_fb.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_fdi\.c\$";
+        push @src_exclude_regexes, "drm/i915/display/intel_hdcp_gsc\.c\$";
+        push @src_exclude_regexes, "drm/i915/display/intel_load_detect.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_lpe_audio.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_lspcon\.c\$";
+        push @src_exclude_regexes, "drm/i915/display/intel_lvds.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_overlay.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_pch_";
+        push @src_exclude_regexes, "drm/i915/display/intel_pfit\.c\$";
+        push @src_exclude_regexes, "drm/i915/display/intel_plane_initial.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_svdo.c";
+        push @src_exclude_regexes, "drm/i915/display/intel_sprite";
+        push @src_exclude_regexes, "drm/i915/display/intel_tv.c";
 #	push @src_include_regexes, "drm/ttm";
 #	push @src_include_regexes, "drm/vgem";
 }
-- 
2.43.0

