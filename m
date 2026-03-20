Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1032D108B901
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B185810EADD;
	Fri, 20 Mar 2026 11:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIB+9czA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765C210EAD1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774005976; x=1805541976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qb9J2byDvuYByw/VmBVJFChqECNKxqlUN2W04+dcHlA=;
 b=UIB+9czApukONjmvdsEZzaFHt+XIgiZgOIeJ3drCQj2/wiToZrrju+Nx
 g+//KtZ+weaKS3PMxHNxBYtimBEAcGrDDUQGc5Ez5yUO+yh8kbazhjqjc
 VtGXlOs3/+1gobPWN314+K4L/QwKrgbBPPqkvWJUoc8eYnx/ho6IsG5EW
 A+7edQ8WOEnfCAuiM1vL+QdgSv4LAZd+SXMhUDrjjCtLYV6gB9dgGQbHs
 QEBjescd3xtVln71ebghPIlrlfOT39tLaIgUsr73zMbj2HBrSceJIyAq8
 DasbCUfjyJd9mvWWyt+S4TtRkQgF35eK7Ew/dEkkvdZoLo46H0VKkSzhT g==;
X-CSE-ConnectionGUID: xaoN6LP7S2ShfEhagy075Q==
X-CSE-MsgGUID: Jbj4B+W8SgmYfYxWwGjqfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="97706111"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="97706111"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:24 -0700
X-CSE-ConnectionGUID: g5jTMNORREus4WMq9tSxiA==
X-CSE-MsgGUID: UP4/JN2uQlmz03KCEkRo8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253759138"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t 3/7] tests/amdgpu/amd_subvp:
 s/crtc->pipe/crtc->crtc_index/
Date: Fri, 20 Mar 2026 13:24:53 +0200
Message-ID: <dece05509fa1a30906b1c6f30a05685a983b1b1c.1774005763.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774005763.git.jani.nikula@intel.com>
References: <cover.1774005763.git.jani.nikula@intel.com>
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

For amdpgu, crtc->crtc_index == crtc->pipe always. Use the generic and
GPU agnostic crtc->crtc_index instead of the vendor specific crtc->pipe.

This allows us to better highlight the places where crtc->pipe is
actually needed and valid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Hung <alex.hung@amd.com>

Review tip: apply and use this to ignore the whitespace changes:

git show --color-words --word-diff-regex="\w+"
---
 tests/amdgpu/amd_subvp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 37879d167e08..61b93e6af509 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -64,11 +64,11 @@ static void test_init(struct data *data)
 	bool subvp_en = false;
 
 	for_each_crtc(display, crtc) {
-		data->crtc[crtc->pipe] = crtc;
-		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-								    DRM_PLANE_TYPE_PRIMARY);
-		data->pipe_crc[crtc->pipe] = igt_crtc_crc_new(crtc,
-							      IGT_PIPE_CRC_SOURCE_AUTO);
+		data->crtc[crtc->crtc_index] = crtc;
+		data->primary[crtc->crtc_index] =
+			igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		data->pipe_crc[crtc->crtc_index] =
+			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0,
@@ -107,7 +107,7 @@ static void test_fini(struct data *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
+		igt_pipe_crc_free(data->pipe_crc[crtc->crtc_index]);
 	}
 
 	igt_display_reset(display);
@@ -127,7 +127,7 @@ static void test_subvp(struct data *data)
 
 	for_each_crtc(&data->display, crtc) {
 		/* Setup the output */
-		output = data->output[crtc->pipe];
+		output = data->output[crtc->crtc_index];
 		if (!output || !igt_output_is_connected(output))
 			continue;
 
@@ -140,7 +140,7 @@ static void test_subvp(struct data *data)
 
 		igt_output_set_crtc(output,
 				    crtc);
-		igt_plane_set_fb(data->primary[crtc->pipe], &rfb);
+		igt_plane_set_fb(data->primary[crtc->crtc_index], &rfb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	}
 
-- 
2.47.3

