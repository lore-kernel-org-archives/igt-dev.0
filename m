Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62339C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 09:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0105910E102;
	Fri, 14 Aug 2026 09:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2KNdvYG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079A10E102
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786699165; x=1818235165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vYVCAccEfbiaeVk6ffHsp9hpDIpn5gcn4IgPOjieOm0=;
 b=m2KNdvYGjkVAwKrxyHOWlFtvCQZbYAM6vdJHnXQEFJzowBuRsYee9iq3
 YEpeVcZXHWn+Ap+lZObQL/HB0hj8PzhrMWI4QaWEaSizJgbxlJS7rkfVX
 N9sVD5CqE1E7zKlRV+AgpPvFvg42C6llZyGhjhu2XHopD14E2N3g437DY
 NpER3/fVeBr3ixTcHYQwzrAU8V531vePSn48qofBcModDyEZ3OcWTguun
 ti+sFYWw0y5c5fLuAIYENzoUekAY9Pq6r6S7MBxqjDhFTKEhyr0T/C4Fx
 NJQQhSTOkxx6TFIv1doSTVsk9+VtXuXGjBs9MIRvZqTHfCne/Y5EN1e6r A==;
X-CSE-ConnectionGUID: A5G7aHkxSwK+4/iNTeF18A==
X-CSE-MsgGUID: vT6PRo5sRX6CpJFJGOxYvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97869345"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97869345"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:19:25 -0700
X-CSE-ConnectionGUID: MjEMyry6RWutCpYuo62SuA==
X-CSE-MsgGUID: ntMog6X/Ry66Yy2STauWwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="267666124"
Received: from x299.igk.intel.com ([10.211.131.197])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:19:24 -0700
From: Jari Tahvanainen <jari.tahvanainen@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mchehab@kernel.org, Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v2 2/2] scripts/code_cov_parse_info: add display include and
 exclude in only_xe
Date: Fri, 14 Aug 2026 12:23:26 +0300
Message-ID: <20260814092326.839864-3-jari.tahvanainen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814092326.839864-1-jari.tahvanainen@intel.com>
References: <20260814092326.839864-1-jari.tahvanainen@intel.com>
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

v2: fixing name on email for submitter. 

Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

