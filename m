Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1711EA3F27
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCA310E5C7;
	Tue, 10 Feb 2026 16:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dc+9K+zy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326B210E5D5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770739834; x=1802275834;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oIRqu06bueEXRkl4uBRqqds37o/o72LH4SRLuGVaYv0=;
 b=Dc+9K+zypY8wfGhBx5kwWYxtCQ58C8N3iVC5TfSBCv8Eo09h9JbLMRsf
 iwbECUpix1FE+lQX10vq+lAEtyFIbrAZlYhdBM2DYdJjNuNKmyF66486o
 NmnXux3E/j6qGg/pZ2WauAaT79ssjoj54+pPpOSNEKDTl6sr89fsoXc0e
 t3nwhhWcVqXnqF5r+fPHBBlDYFfvyUXusu+sMnWSpZYMzECzfMaC4mPRQ
 Hh7GifFl1tgg3xG9MQkXt2co9vXpD483gvGOOhUTocuvJPoNcXq+KpARY
 KVLrp5zBRoDfx/7KDXRJmUkkD0DZQLOJu8+XWFHJJDr7IR72Azoz+7WV7 w==;
X-CSE-ConnectionGUID: q8qP1CMQQNS6EV8vegT9Nw==
X-CSE-MsgGUID: N+656YEsQYyA/FtDbOxdlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71770685"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71770685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:33 -0800
X-CSE-ConnectionGUID: S537BlbcTOm5OZomkfT3lg==
X-CSE-MsgGUID: sOT+DK+qRqyfebJdeweCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211061329"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:32 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/5] tests/kms: Pull the igt_crtc_for_pipe() call earlier
Date: Tue, 10 Feb 2026 18:10:14 +0200
Message-ID: <20260210161016.29459-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
References: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
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

Do the 'crtc = igt_crtc_for_pipe(...)' assignment
as early as possible.

This can make subsequent cocci cleanups around
igt_crtc_for_pipe() usage a bit easier.

 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
identifier FUNC, DISPLAY, PIPE, CRTC;
expression E;
@@
FUNC(..., enum pipe PIPE, ...)
{
...
igt_display_t *DISPLAY = E;
...
- igt_crtc_t *CRTC;
+ igt_crtc_t *CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
<+... when != PIPE = ...
- CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
...+>
}

@@
typedef igt_crtc_t;
identifier DISPLAY, CRTC;
constant PIPE;
expression E;
@@
{
...
igt_display_t *DISPLAY = E;
...
- igt_crtc_t *CRTC;
+ igt_crtc_t *CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
<+... when != PIPE = ...
- CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
...+>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_assr.c                          | 4 +---
 tests/chamelium/kms_chamelium_color.c            | 4 +---
 tests/chamelium/kms_chamelium_sharpness_filter.c | 4 +---
 tests/kms_color.c                                | 4 +---
 tests/kms_color_pipeline.c                       | 4 +---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index f6b39412d6ba..f02a30e8fea3 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -161,14 +161,12 @@ static void present_visual_pattern(data_t *data, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, PIPE_A);
 	drmModeModeInfo *mode;
 	igt_fb_t fb;
 
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
-
-	crtc = igt_crtc_for_pipe(display, PIPE_A);
 	primary =
 		igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 	igt_output_set_crtc(output,
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 8f4e2ac29229..6bcf3226d858 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -452,13 +452,11 @@ prep_pipe(data_t *data, enum pipe p)
 static int test_setup(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	int i = 0;
 
 	igt_display_reset(&data->display);
 	prep_pipe(data, p);
-
-	crtc = igt_crtc_for_pipe(display, p);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index d405e6311380..de8cf7fc1199 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -182,12 +182,10 @@ static void test_t(data_t *data, igt_plane_t *primary,
 static int test_setup(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	int i = 0;
 
 	igt_display_reset(&data->display);
-
-	crtc = igt_crtc_for_pipe(display, p);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_color.c b/tests/kms_color.c
index aa65a70ab790..4f44997124a7 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -734,12 +734,10 @@ prep_pipe(data_t *data, enum pipe p)
 static void test_setup(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 
 	prep_pipe(data, p);
 	igt_require_pipe_crc(data->drm_fd);
-
-	crtc = igt_crtc_for_pipe(display, p);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index f0bf500af8bf..733ead1cd55c 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -49,11 +49,9 @@ static void test_cleanup(data_t *data)
 static void test_setup(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 
 	igt_require_pipe_crc(data->drm_fd);
-
-	crtc = igt_crtc_for_pipe(display, p);
 	igt_require(crtc);
 	igt_require(crtc->n_planes > 0);
 
-- 
2.52.0

