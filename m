Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E5EFD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8611110E773;
	Wed, 25 Feb 2026 12:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e25mtbfM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C46810E773
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023926; x=1803559926;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W+JoruUTKYd/O3KQxarAFanA2yRtsWONQcY/v+j90HQ=;
 b=e25mtbfMXlWlW5gfHBNDVJVDCB47TsFUharigBWZpAP+PUJP8tGPYGUd
 vY5qbKb1b8zUL5WkODUPyc0n2iYAzhsRDuEo8ZSsYW2fb1iuKdynGrwtI
 l/z406NdddsuzcZl8M9nnc74/SK83x5iBS4RTHBKsR8t92/5E9/e5LZPa
 KhZWjnA7yt7rGNrpmDmJqmb5uukS4D6c/goe2y6Lzd9tV74ECzZgcLsbY
 m23ZWkPspqNVCPw2rt7gOqxBeZ1EgUFb4x26dxpPZZmxsA0EQ5yp1nbcj
 LFwP5C5Gh67FeNOLqL22tNdew+1A2AiYSAnE/nEGjU9bbyrx7PYip2O0X g==;
X-CSE-ConnectionGUID: 2AVrOHIOSlm3H77coerO/g==
X-CSE-MsgGUID: +AhPBHZeRB2RR6tlPatOxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83772236"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="83772236"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:06 -0800
X-CSE-ConnectionGUID: TU4Jif8eSTCr32GmqC1wLQ==
X-CSE-MsgGUID: WcYkNBQTRE+H8dDGF5biDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213350071"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:52:04 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/19] tests/kms: Replace igt_pipe_connector_valid()
 with igt_crtc_connector_valid()
Date: Wed, 25 Feb 2026 14:51:04 +0200
Message-ID: <20260225125108.31119-16-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

Convert most of the remaining igt_pipe_connector_valid()s
to igt_crtc_connector_valid(). This gets rid of more crtc->pipe
stuff from the tests.

 #include "scripts/iterators.cocci"

@@
expression PIPE;
@@
- igt_pipe_connector_valid(PIPE
+ igt_crtc_connector_valid(igt_crtc_for_pipe(display, PIPE)
	,...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
expression PIPE, CRTC;
@@
{...
CRTC = igt_crtc_for_pipe(..., PIPE)
<... when != PIPE = ...
- igt_crtc_for_pipe(..., PIPE)
+ CRTC
...>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                          | 2 +-
 tests/amdgpu/amd_freesync_video_mode.c | 2 +-
 tests/amdgpu/amd_ilr.c                 | 2 +-
 tests/amdgpu/amd_link_settings.c       | 2 +-
 tests/intel/gem_pxp.c                  | 4 ++--
 tests/intel/kms_pm_lpsp.c              | 2 +-
 tests/intel/xe_pxp.c                   | 6 +++---
 tests/kms_content_protection.c         | 2 +-
 tests/kms_tiled_display.c              | 2 +-
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b6d3467c598d..ab27928e777f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7274,7 +7274,7 @@ bool intel_pipe_output_combo_valid(igt_display_t *display)
 		if (output->pending_pipe == PIPE_NONE)
 			continue;
 
-		if (!igt_pipe_connector_valid(output->pending_pipe, output)) {
+		if (!igt_crtc_connector_valid(igt_crtc_for_pipe(display, output->pending_pipe), output)) {
 			igt_info("Output %s is disconnected (or) pipe-%s & %s cannot be used together\n",
 				 igt_output_name(output),
 				 kmstest_pipe_name(output->pending_pipe),
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 3a82464e8d69..fe92dd0329e3 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -845,7 +845,7 @@ run_test(data_t *data, uint32_t scene)
 		}
 
 		for_each_crtc(&data->display, crtc)
-			if (igt_pipe_connector_valid(crtc->pipe, output)) {
+			if (igt_crtc_connector_valid(crtc, output)) {
 				igt_display_reset(&data->display);
 				igt_output_set_crtc(output,
 						    crtc);
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index d6f96cc33804..5dd467b43d10 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -87,7 +87,7 @@ static void test_init(data_t *data, igt_output_t *output)
 	set_all_output_pipe_to_none(data);
 
 	for_each_crtc(&data->display, crtc) {
-		if (igt_pipe_connector_valid(crtc->pipe, output)) {
+		if (igt_crtc_connector_valid(crtc, output)) {
 			data->crtc = crtc;
 			break;
 		}
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index eaeddfb1599b..ae5f4bb5e0bb 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -89,7 +89,7 @@ static void test_init(data_t *data, igt_output_t *output)
 	set_all_output_pipe_to_none(data);
 
 	for_each_crtc(&data->display, crtc) {
-		if (igt_pipe_connector_valid(crtc->pipe, output)) {
+		if (igt_crtc_connector_valid(crtc, output)) {
 			data->crtc = crtc;
 			break;
 		}
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index c094d18e5b10..69a16d3420ce 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1228,7 +1228,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 		mode = igt_output_get_mode(output);
 		crtc = igt_crtc_for_pipe(display, i);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
-		igt_require(igt_pipe_connector_valid(i, output));
+		igt_require(igt_crtc_connector_valid(crtc, output));
 		igt_output_set_crtc(output,
 				    crtc);
 
@@ -1248,7 +1248,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 		pipe_crc = igt_crtc_crc_new(crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
-		igt_require(igt_pipe_connector_valid(crtc->pipe, output));
+		igt_require(igt_crtc_connector_valid(crtc, output));
 		igt_output_set_crtc(output, crtc);
 
 		igt_plane_set_fb(plane, &ref_fb);
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 595c81f0e693..b0f79124e9e5 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -232,7 +232,7 @@ int igt_main()
 				continue;
 
 			for_each_crtc(display, crtc) {
-				if (!igt_pipe_connector_valid(crtc->pipe, output))
+				if (!igt_crtc_connector_valid(crtc, output))
 					continue;
 
 				/* LPSP is low power single pipe usages i.e. PIPE_A */
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 48a045e11c51..d45bd8feab97 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -849,7 +849,7 @@ static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_f
 		pipe_crc = igt_crtc_crc_new(crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
-		igt_require(igt_pipe_connector_valid(crtc->pipe, output));
+		igt_require(igt_crtc_connector_valid(crtc, output));
 		igt_output_set_crtc(output, crtc);
 
 		commit_fb(display, plane, ref_fb, mode);
@@ -904,7 +904,7 @@ static void test_display_pxp_fb(int fd, igt_display_t *display)
 		mode = igt_output_get_mode(output);
 		crtc = igt_crtc_for_pipe(display, i);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
-		igt_require(igt_pipe_connector_valid(i, output));
+		igt_require(igt_crtc_connector_valid(crtc, output));
 		igt_output_set_crtc(output,
 				    crtc);
 
@@ -962,7 +962,7 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 		mode = igt_output_get_mode(output);
 		crtc = igt_crtc_for_pipe(display, i);
 		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
-		igt_require(igt_pipe_connector_valid(i, output));
+		igt_require(igt_crtc_connector_valid(crtc, output));
 		igt_output_set_crtc(output,
 				    crtc);
 
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 2c2ffa150c41..f35c9fa73a57 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -880,7 +880,7 @@ test_content_protection_mst(int content_type)
 		pipe_found = false;
 		for_each_crtc(display, crtc) {
 			if (igt_crtc_is_free(crtc) &&
-			    igt_pipe_connector_valid(crtc->pipe, output)) {
+			    igt_crtc_connector_valid(crtc, output)) {
 				pipe_found = true;
 				break;
 			}
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index 374ea0bf6a85..8aae2bcaadba 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -246,7 +246,7 @@ static void setup_mode(data_t *data)
 					continue;
 			}
 
-			if (igt_pipe_connector_valid(crtc->pipe, output)) {
+			if (igt_crtc_connector_valid(crtc, output)) {
 				conns[count].crtc = crtc;
 				conns[count].output = output;
 
-- 
2.52.0

