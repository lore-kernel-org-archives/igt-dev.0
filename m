Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A84C55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2783C10E7E8;
	Fri, 20 Feb 2026 14:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrmaFmmz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41C110E7E8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596200; x=1803132200;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hxWHmUHEG1F78vNoV2sSeV0uoPalf5upppeO0aZ5qSw=;
 b=DrmaFmmz5vIgHMZbOTIc4H7G/Ur+4kxYdI73Ak5G1Wf4Cc8jfpkPLnkH
 VO8RDpVmkoJ6b+sR0dtJXfomqB1wxuJV0yak8Gbwc5tpoEp43F/iSY/Pz
 4/x4fU51AmgaHs+DFjPzQuajYghAbF+yuRNVxGQ6Guk2ypriDe+nEgkXV
 Zn5F6XrAPF65655nWunAki5cTRLlmFwrHX3wYoAbW4iDCMlJKKtuPmd6t
 QG+uQJKido4FtjG0EJgl4IxZIARIGAruR+X0ZQEonJG3621n2THCUROly
 kCIUWe6fWTxb5GlB+11QUEZPur/QEmUN8I3i9ftNAbXz66GaDiH59L1rN Q==;
X-CSE-ConnectionGUID: fGYa5AcFSn+U6GVcNHCzYg==
X-CSE-MsgGUID: hWw1JgZbTOC+AWwOIk6PZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60261849"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60261849"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:03:18 -0800
X-CSE-ConnectionGUID: 0+P3J7lFRHqZ+Pg/4aREGA==
X-CSE-MsgGUID: mfzpgqCtRhGBu2anJZ2d9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="213416357"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:03:17 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 19/21] tests/kms: Use igt_crtc_t instead of enum pipe,
 part 2
Date: Fri, 20 Feb 2026 16:01:51 +0200
Message-ID: <20260220140154.4138-20-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
References: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
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

Convert several kms tests to use igt_crtc_t instead
of enum pipe. These specific tests already track crtcs
alongside pipes (both in arrays) in their data structure.
Remove the redundant pipe information and just rely on the
crtcs.

 #include "scripts/iterators.cocci"

@@
igt_display_t DISPLAY;
expression _PIPE;
@@
- &DISPLAY.crtcs[_PIPE]
+ igt_crtc_for_pipe(&DISPLAY, _PIPE)

@@
igt_display_t *DISPLAY;
expression _PIPE;
@@
- &DISPLAY->crtcs[_PIPE]
+ igt_crtc_for_pipe(DISPLAY, _PIPE)

@find_data@
typedef igt_crtc_t;
typedef igt_display_t;
identifier DISPLAY, PIPE, CRTC;
type T;
@@
(
T {
  ...
  igt_display_t DISPLAY;
  ...
  igt_crtc_t *CRTC[...];
  ...
- enum pipe PIPE[...];
  ...
};
|
T {
  ...
- enum pipe PIPE[...];
  ...
  igt_display_t DISPLAY;
  ...
  igt_crtc_t *CRTC[...];
  ...
};
)

@depends on find_data@
identifier find_data.PIPE;
identifier find_data.CRTC;
identifier find_data.DISPLAY;
find_data.T S;
find_data.T *P;
expression _PIPE, I;
@@
(
- S.PIPE[I] = _PIPE;
+ S.CRTC[I] = igt_crtc_for_pipe(&S.DISPLAY, _PIPE);
|
- P->PIPE[I] = _PIPE;
+ P->CRTC[I] = igt_crtc_for_pipe(&P->DISPLAY, _PIPE);
)

@depends on find_data@
identifier find_data.PIPE;
identifier find_data.CRTC;
identifier find_data.DISPLAY;
find_data.T S;
find_data.T *P;
expression E;
@@
(
- S.PIPE[I] = E
+ S.CRTC[I] = igt_crtc_for_pipe(&S.DISPLAY, E)
|
- P->PIPE[I] = E
+ P->CRTC[I] = igt_crtc_for_pipe(&P->DISPLAY, E)
|
- igt_crtc_for_pipe(..., S.PIPE[I])
+ S.CRTC[I]
|
- igt_crtc_for_pipe(..., P->PIPE[I])
+ P->CRTC[I]
|
- kmstest_pipe_name(S.PIPE[I])
+ igt_crtc_name(S.CRTC[I])
|
- kmstest_pipe_name(P->PIPE[I])
+ igt_crtc_name(P->CRTC[I])
)

@depends on find_data@
identifier find_data.PIPE;
identifier find_data.CRTC;
find_data.T S;
find_data.T *P;
expression I;
@@
(
- S.PIPE[I]
+ S.CRTC[I]->pipe
|
- P->PIPE[I]
+ P->CRTC[I]->pipe
)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@depends on find_data@
identifier find_data.CRTC;
find_data.T S;
find_data.T *P;
expression I, E;
@@
(
  S.CRTC[I] = E;
  ...
- S.CRTC[I] = E;
|
  P->CRTC[I] = E;
  ...
- P->CRTC[I] = E;
)

@depends on find_data@
identifier find_data.CRTC;
find_data.T S;
find_data.T *P;
igt_crtc_t *C;
@@
(
S.CRTC[C->pipe] = ...;
|
P->CRTC[C->pipe] = ...;
|
- S.CRTC[C->pipe]
+ C
|
- P->CRTC[C->pipe]
+ C
)

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_dp_dsc.c  | 12 +++++-------
 tests/amdgpu/amd_hotplug.c |  4 +---
 tests/amdgpu/amd_plane.c   | 14 ++++++--------
 tests/amdgpu/amd_subvp.c   |  4 +---
 tests/kms_bw.c             |  2 --
 5 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index d02d66def18a..4403f9205d83 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -39,7 +39,6 @@ typedef struct data {
 	igt_crtc_t *crtc[MAX_PIPES];
 	igt_pipe_crc_t *pipe_crc[MAX_PIPES];
 	drmModeModeInfo mode[MAX_PIPES];
-	enum pipe pipe_id[MAX_PIPES];
 	int fd;
 } data_t;
 
@@ -65,7 +64,6 @@ static void test_init(data_t *data)
 	int i, n;
 
 	for_each_crtc(display, crtc) {
-		data->pipe_id[crtc->pipe] = crtc->pipe;
 		data->crtc[crtc->pipe] = crtc;
 		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
 								    DRM_PLANE_TYPE_PRIMARY);
@@ -135,7 +133,7 @@ static void test_dsc_enable(data_t *data)
 				      0,
 				      &ref_fb);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
+				    crtc);
 		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
@@ -283,7 +281,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 				      0,
 				      &ref_fb);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
+				    crtc);
 		igt_plane_set_fb(data->primary[crtc->pipe], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
@@ -379,7 +377,7 @@ static void test_dsc_link_settings(data_t *data)
 				      0,
 				      &ref_fb[crtc->pipe]);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
+				    crtc);
 		igt_plane_set_fb(data->primary[crtc->pipe],
 				 &ref_fb[crtc->pipe]);
 	}
@@ -506,7 +504,7 @@ static void test_dsc_bpc(data_t *data)
 					      0,
 					      &ref_fb[crtc->pipe]);
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
+					    crtc);
 			igt_plane_set_fb(data->primary[crtc->pipe],
 					 &ref_fb[crtc->pipe]);
 		}
@@ -529,7 +527,7 @@ static void test_dsc_bpc(data_t *data)
 			/* Check current bpc */
 			igt_info("Verifying display %s has correct bpc\n", output->name);
 			igt_assert_output_bpc_equal(data->fd,
-						    data->pipe_id[crtc->pipe],
+						    crtc->pipe,
 						    output->name,
 						    bpc_vals[bpc]);
 
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index eff4ec42de00..15092cc9fdec 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -42,7 +42,6 @@ typedef struct data {
 	igt_crtc_t *crtc[MAX_PIPES];
 	igt_pipe_crc_t *pipe_crc[MAX_PIPES];
 	drmModeModeInfo mode[MAX_PIPES];
-	enum pipe pipe_id[MAX_PIPES];
 	int w[MAX_PIPES];
 	int h[MAX_PIPES];
 	int fd;
@@ -55,7 +54,6 @@ static void test_init(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		data->pipe_id[crtc->pipe] = crtc->pipe;
 		data->crtc[crtc->pipe] = crtc;
 		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
 								    DRM_PLANE_TYPE_PRIMARY);
@@ -165,7 +163,7 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 				      DRM_FORMAT_XRGB8888, 0,
 				      &ref_fb[crtc->pipe]);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
+				    crtc);
 		igt_plane_set_fb(data->primary[crtc->pipe],
 				 &ref_fb[crtc->pipe]);
 	}
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 296deb898e1d..6831fc43e4a6 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -47,7 +47,6 @@ typedef struct data {
         igt_crtc_t *crtc[MAX_PIPES];
         igt_pipe_crc_t *pipe_crc[MAX_PIPES];
         drmModeModeInfo mode[MAX_PIPES];
-        enum pipe pipe_id[MAX_PIPES];
         int w[MAX_PIPES];
         int h[MAX_PIPES];
         int fd;
@@ -156,7 +155,6 @@ static void test_init(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		data->pipe_id[crtc->pipe] = crtc->pipe;
 		data->crtc[crtc->pipe] = crtc;
 		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
 								    DRM_PLANE_TYPE_PRIMARY);
@@ -570,7 +568,7 @@ static void test_multi_mpo_invalid(data_t *data)
 	igt_skip_on(!data->overlay2[0]);
 
 	igt_output_set_crtc(data->output[0],
-			    igt_crtc_for_pipe(display, data->pipe_id[0]));
+			    data->crtc[0]);
 
 	igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1.0, &fb[0].test_primary);
 	igt_create_fb(data->fd, w, h, DRM_FORMAT_NV12, 0, &fb[0].test_overlay);
@@ -647,7 +645,7 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 		}
 
 		igt_output_set_crtc(data->output[n],
-				    igt_crtc_for_pipe(display, data->pipe_id[n]));
+				    data->crtc[n]);
 
 		igt_create_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, &fb[n].ref_primary);
 		igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1.0, &fb[n].ref_primary);
@@ -735,7 +733,7 @@ static void test_mpo_4k(data_t *data)
 			 0.00, 0.00, 0.00, 0.00);
 
 	igt_output_set_crtc(data->output[0],
-			    igt_crtc_for_pipe(display, data->pipe_id[0]));
+			    data->crtc[0]);
 	igt_plane_set_fb(data->primary[0], &r_fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
@@ -801,9 +799,9 @@ static void test_mpo_swizzle_toggle_multihead(data_t *data)
 
 	/* Initial modeset */
 	igt_output_set_crtc(data->output[0],
-			    igt_crtc_for_pipe(display, data->pipe_id[0]));
+			    data->crtc[0]);
 	igt_output_set_crtc(data->output[1],
-			    igt_crtc_for_pipe(display, data->pipe_id[1]));
+			    data->crtc[1]);
 	force_output_mode(data, data->output[0], &test_mode_1);
 	force_output_mode(data, data->output[1], &test_mode_2);
 
@@ -872,7 +870,7 @@ static void test_mpo_swizzle_toggle(data_t *data)
 
 	/* Initial modeset */
 	igt_output_set_crtc(data->output[0],
-			    igt_crtc_for_pipe(display, data->pipe_id[0]));
+			    data->crtc[0]);
 	force_output_mode(data, data->output[0], &test_mode_1);
 
 	igt_plane_set_fb(data->primary[0], &fb_1920_xb24_linear);
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 6249490a4e5e..37879d167e08 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -19,7 +19,6 @@ struct data {
 	igt_crtc_t *crtc[IGT_MAX_PIPES];
 	igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
 	drmModeModeInfo mode[IGT_MAX_PIPES];
-	enum pipe pipe_id[IGT_MAX_PIPES];
 	int fd;
 };
 
@@ -65,7 +64,6 @@ static void test_init(struct data *data)
 	bool subvp_en = false;
 
 	for_each_crtc(display, crtc) {
-		data->pipe_id[crtc->pipe] = crtc->pipe;
 		data->crtc[crtc->pipe] = crtc;
 		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
 								    DRM_PLANE_TYPE_PRIMARY);
@@ -141,7 +139,7 @@ static void test_subvp(struct data *data)
 					&rfb);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, data->pipe_id[crtc->pipe]));
+				    crtc);
 		igt_plane_set_fb(data->primary[crtc->pipe], &rfb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	}
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 11f055b23464..778900d8c9f1 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -70,7 +70,6 @@ typedef struct data {
         igt_crtc_t *crtc[IGT_MAX_PIPES];
         igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
         drmModeModeInfo mode[IGT_MAX_PIPES];
-        enum pipe pipe_id[IGT_MAX_PIPES];
         int w[IGT_MAX_PIPES];
         int h[IGT_MAX_PIPES];
         int fd;
@@ -126,7 +125,6 @@ static void test_init(data_t *data, bool physical)
 	data->connected_outputs = 0;
 
 	for_each_crtc(display, crtc) {
-		data->pipe_id[crtc->pipe] = crtc->pipe;
 		data->crtc[crtc->pipe] = crtc;
 		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
 								    DRM_PLANE_TYPE_PRIMARY);
-- 
2.52.0

