Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45706108B8F7
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 11:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E2B10EAD7;
	Fri, 20 Mar 2026 11:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTtwjiid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAA410EAD7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774006015; x=1805542015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oveWcOVU0pd83etP2BlxnOx6YzaIlL3QeEDFbfFBrPY=;
 b=iTtwjiidzmi8J1/l+M98b1D7tymLraTZn/fiKv6uZFh0BPG9bm7FSKE4
 fn5O6kPj5Ll3PUzk+EoKYaAwxmlrJaIL+dDRpBMZTWKe2B0GO8K7m3Cxs
 t+TEIiW1CWnMhrReLhyECJdOMGajzIcoaMeQ3euatlor3ERAGXLTsYnfn
 4sA81+Skq9qg1vH/BMM9FKfDbD5nkp38pN3r2mrOhwMFEeLpWHXkDGlXF
 s87TLpd8UcGRDJdk08HbMwihDf9CvgMYwah2Y6k0ndFfOzsDGqswqcXkD
 OSUEi3LPd5QuYZVxxmX8kBzRp9WmNMLrDzV6c+deWYgaVrMRkQ7moVtz4 w==;
X-CSE-ConnectionGUID: vp1t0W+2RCO65t5RnoO5mw==
X-CSE-MsgGUID: IDY7wDRST+elXEY8+4inoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75162693"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75162693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:36 -0700
X-CSE-ConnectionGUID: SMPWW1lESOq4wtBlY9bZSg==
X-CSE-MsgGUID: 94t1ggASQNmgC3X7l0Yr+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227390044"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 04:25:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t 5/7] tests/amdgpu/amd_multidisplay_modeset:
 s/crtc->pipe/crtc->crtc_index/
Date: Fri, 20 Mar 2026 13:24:55 +0200
Message-ID: <67f9e10aed3f6d98b9891839bc6ad24c722bdffb.1774005763.git.jani.nikula@intel.com>
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
 tests/amdgpu/amd_multidisplay_modeset.c | 30 ++++++++++++-------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 40d1e5d7f42b..98ca2c79470b 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -160,9 +160,9 @@ static void test_init(struct data_t *data)
 		 * tested
 		 */
 		output = igt_get_single_output_for_crtc(crtc);
-		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-							   DRM_PLANE_TYPE_PRIMARY);
-		data->output[crtc->pipe] = output;
+		data->primary[crtc->crtc_index] =
+			igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		data->output[crtc->crtc_index] = output;
 
 		/* dp rx crc only available for eDP, SST DP, MST DP */
 		if ((output->config.connector->connector_type ==
@@ -173,24 +173,24 @@ static void test_init(struct data_t *data)
 			ret = dpcd_read_byte(data->fd, output->config.connector,
 				DPCD_TEST_SINK_MISC, &dpcd_246h);
 			if (ret && ((dpcd_246h & 0x20) != 0x0))
-				data->pipe_crc_dprx[crtc->pipe] = igt_crtc_crc_new(crtc,
-									  AMDGPU_PIPE_CRC_SOURCE_DPRX);
+				data->pipe_crc_dprx[crtc->crtc_index] =
+					igt_crtc_crc_new(crtc, AMDGPU_PIPE_CRC_SOURCE_DPRX);
 		}
 
-		data->pipe_crc_otg[crtc->pipe] = igt_crtc_crc_new(crtc,
-							 IGT_PIPE_CRC_SOURCE_AUTO);
+		data->pipe_crc_otg[crtc->crtc_index] =
+			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 		/* disable eDP PSR */
-		if (data->output[crtc->pipe]->config.connector->connector_type ==
-				DRM_MODE_CONNECTOR_eDP) {
+		if (data->output[crtc->crtc_index]->config.connector->connector_type ==
+		    DRM_MODE_CONNECTOR_eDP) {
 			kmstest_set_connector_dpms(display->drm_fd,
-				data->output[crtc->pipe]->config.connector,
+				data->output[crtc->crtc_index]->config.connector,
 				DRM_MODE_DPMS_OFF);
 
 			igt_amd_disallow_edp_enter_psr(data->fd,
-				data->output[crtc->pipe]->name, true);
+				data->output[crtc->crtc_index]->name, true);
 
 			kmstest_set_connector_dpms(display->drm_fd,
-				data->output[crtc->pipe]->config.connector,
+				data->output[crtc->crtc_index]->config.connector,
 				DRM_MODE_DPMS_ON);
 		}
 	}
@@ -205,9 +205,9 @@ static void test_fini(struct data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		if (data->pipe_crc_dprx[crtc->pipe])
-			igt_pipe_crc_free(data->pipe_crc_dprx[crtc->pipe]);
-		igt_pipe_crc_free(data->pipe_crc_otg[crtc->pipe]);
+		if (data->pipe_crc_dprx[crtc->crtc_index])
+			igt_pipe_crc_free(data->pipe_crc_dprx[crtc->crtc_index]);
+		igt_pipe_crc_free(data->pipe_crc_otg[crtc->crtc_index]);
 	}
 
 	igt_display_reset(display);
-- 
2.47.3

