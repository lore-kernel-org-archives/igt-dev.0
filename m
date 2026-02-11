Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4CBECD6C8
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DAE10E62C;
	Wed, 11 Feb 2026 16:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFTgDsiB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30FF10E62C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827677; x=1802363677;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wPRxGMUSID5nR/m1C9ETyxPftb3Pq5FI9CLA5uK7SOk=;
 b=VFTgDsiBl0fxgPG/A1CyZzpbyU8kzdvUkIOdFz8DpAZFz3b1rgPIxA31
 h1SSuF0fKDL6AsPlbrTgzG95z9oUHXEn9kHSfzvAwFFNbwUG6y/8HuLHh
 afvFQzkXxSD/ZnqoImi6YP1DreQXpBkBlioqy5AA9EW0JIoPsffzjgKDe
 +2LKnfScpdv0HSFcI56IhFeyJ1PfW9Ugy0Hb6nFRjWMtnOM69iX6/5ty1
 7yTyc+SMnTIWDi4T7qSfpBitIC96zAGwzgB3xCmwYgRiCmWiQgD+QJBav
 9Q7UZHSC3Y0Xk2T5vy3QQ3+igiLjAEthAwS2BSG12yFXyVcvJpsK4tQiP w==;
X-CSE-ConnectionGUID: G3sWWDBoSkmgGSfjlJ7fOg==
X-CSE-MsgGUID: qhfxE/wCR3Ka2q5mX602SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83082187"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83082187"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:37 -0800
X-CSE-ConnectionGUID: 71zZtN3gSM2nnfOcyV0nBg==
X-CSE-MsgGUID: VjAsghD5Suu95rxZbaNIzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211405391"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/17] tests/intel/kms_dsc*: Use igt_crtc_t instead of
 enum pipe
Date: Wed, 11 Feb 2026 18:33:54 +0200
Message-ID: <20260211163404.2018-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Convert the use of enum pipe to igt_crtc_t tests/intel/kms_dsc*.

The data.pipe thing complicates this one, so it was mostly done
by hand. Mainly I wanted to get the tests/intel/kms_dsc_helper.c
part out of the way.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_dsc.c        | 15 +++++++--------
 tests/intel/kms_dsc_helper.c |  8 +++++---
 tests/intel/kms_dsc_helper.h |  3 ++-
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index ab9793f5168a..f832500b7eeb 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -79,7 +79,7 @@ typedef struct {
 	igt_output_t *output;
 	int input_bpc;
 	int disp_ver;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	bool limited;
 } data_t;
 
@@ -164,8 +164,7 @@ static void update_display(data_t *data, uint32_t test_type)
 		force_dsc_fractional_bpp_enable(data->drm_fd, data->output);
 	}
 
-	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, data->pipe));
+	igt_output_set_crtc(output, data->crtc);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
@@ -227,7 +226,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	restore_force_dsc_fractional_bpp_en();
 
 	if (test_type & TEST_DSC_BPC) {
-		current_bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe);
+		current_bpc = igt_get_pipe_current_bpc(data->drm_fd, data->crtc->pipe);
 		igt_skip_on_f(data->input_bpc != current_bpc,
 			      "Input bpc = %d is not equal to current bpc = %d\n",
 			      data->input_bpc, current_bpc);
@@ -236,7 +235,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on connector: %s pipe: %s\n",
 		     output->name,
-		     kmstest_pipe_name(data->pipe));
+		     igt_crtc_name(data->crtc));
 reset:
 	test_reset(data);
 
@@ -265,10 +264,10 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		data->plane_format = plane_format;
 		data->input_bpc = bpc;
 		data->output = output;
-		data->pipe = crtc->pipe;
+		data->crtc = crtc;
 
 		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
-		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
+		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->crtc))
 			continue;
 
 		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC) {
@@ -293,7 +292,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		if (test_type & TEST_DSC_BPC)
 			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
 
-		igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
+		igt_dynamic_f("pipe-%s-%s%s%s%s",  igt_crtc_name(data->crtc), data->output->name,
 			      &name[0][0], &name[1][0], &name[2][0])
 			update_display(data, test_type);
 
diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
index cea4304e48d3..77165b41f4bc 100644
--- a/tests/intel/kms_dsc_helper.c
+++ b/tests/intel/kms_dsc_helper.c
@@ -84,14 +84,16 @@ bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output)
 	return true;
 }
 
-bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe)
+bool check_gen11_dp_constraint(int drmfd, igt_output_t *output,
+			       igt_crtc_t *crtc)
 {
 	uint32_t devid = intel_get_drm_devid(drmfd);
 	drmModeConnector *connector = output->config.connector;
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
-	    (pipe == PIPE_A) && IS_GEN11(devid)) {
-		igt_info("DSC not supported on pipe %s on %s in gen11 platforms\n", kmstest_pipe_name(pipe), output->name);
+	    (crtc->pipe == PIPE_A) && IS_GEN11(devid)) {
+		igt_info("DSC not supported on pipe %s on %s in gen11 platforms\n",
+			 kmstest_pipe_name(crtc->pipe), output->name);
 		return false;
 	}
 
diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
index 4dbd88fe7b95..ee419c849836 100644
--- a/tests/intel/kms_dsc_helper.h
+++ b/tests/intel/kms_dsc_helper.h
@@ -28,7 +28,8 @@ void restore_force_dsc_en(void);
 void kms_dsc_exit_handler(int sig);
 bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output);
 bool is_dsc_supported_by_source(int drmfd);
-bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe);
+bool check_gen11_dp_constraint(int drmfd, igt_output_t *output,
+			       igt_crtc_t *crtc);
 bool check_gen11_bpc_constraint(int drmfd, int input_bpc);
 void force_dsc_output_format(int drmfd, igt_output_t *output,
 			     enum dsc_output_format output_format);
-- 
2.52.0

