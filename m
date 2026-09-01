Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFD3C61DD6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 08:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E2510E3D4;
	Tue,  1 Sep 2026 08:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWh2T173";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D23E10E3C4
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788252415; x=1819788415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XQ5/OtN0Tf6yCJ+X43zS4r+nfc1jvyCjHYV9gkgfviE=;
 b=TWh2T173t4Bwyx0b2769AV19DYj+617uC+wTNv8dywemIApfbAdY5jTK
 zGGfEM+z+kHG6x7oFVfghwJpVpSiFtwONB4i5vAR0n9x42JaInlGxlBdD
 OgmMzq9oEumdyIe//ERlmx/TpqMGMiNY0xzkmjiXIg3mfE5MpbzKo25qH
 E+9cLQkmeYB1kMAhuVm0GsNjjC2HQBvDAx3uLTeWqCwaefimeaHT0+Oxf
 9ErFW7pbt9AL0tujVBDG5DT0M2MM26GJI0yL2fd69Zo/4AdWuQpNg5AzU
 Dk1DDYtCx3uYb0s19qR8+2kHULGyyShPqtYB81UjP3ydQpywhX0vouFrA Q==;
X-CSE-ConnectionGUID: RSRJeAU/TeONr7u2umumCg==
X-CSE-MsgGUID: ENthNjjRTmW4CTlVHdPaPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92541612"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92541612"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:46:54 -0700
X-CSE-ConnectionGUID: s5Be8pf/ThWXF0ysuRGhuw==
X-CSE-MsgGUID: vuze9zNxQXeGupD28dQUoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="264749483"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:46:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/4] tests/kms_chamelium_color_pipeline: prefer
 igt_crtc_name() over kmstest_pipe_name()
Date: Tue,  1 Sep 2026 11:46:37 +0300
Message-ID: <939f7c55bbae51a09e8f0e5001682abf4e7c5450.1788252273.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788252273.git.jani.nikula@intel.com>
References: <cover.1788252273.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Reduce the direct pipe usage.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/chamelium/kms_chamelium_color_pipeline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
index db6107221d51..ee096f711a88 100644
--- a/tests/chamelium/kms_chamelium_color_pipeline.c
+++ b/tests/chamelium/kms_chamelium_color_pipeline.c
@@ -188,7 +188,7 @@ test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
 			continue;
 
-		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
+		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
 			_test_plane_colorops(data, plane, fb_colors,
 					     exp_colors, colorops,
 					     data->ports[port_idx]);
-- 
2.47.3

