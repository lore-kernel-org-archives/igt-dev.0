Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D7FECD6C1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F5010E62C;
	Wed, 11 Feb 2026 16:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjxqiCOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559A610E62C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827715; x=1802363715;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OAdm1eu/hyVRzH36emGIo1rMK0SMDwO46Oy/FZLCjFE=;
 b=jjxqiCOKoWYUC9igOtFqdWbkrZccFw/YrrrpxvqCRSLW7QZ0W2aUCsY4
 aak6kTfhiGTClh39zqgrzbJGBLNP51dxLO8DLZoc3pC2kdJiW5lVDccaP
 g/O7La5Wnkg8+GFa9FLKpBH3nRjhJ6blM/5oeFsRZv1vZ249iTo5swMAe
 XK6vQ6RTI5nvF7zN8rJA+40XD4TgvTZMIiYDv1mc5SwcsuWp5DZugmdpt
 NiWNIBiw0Sd0evgEUJeeb7Vrmci56O7ZVqxwIXiUEU+CXPlc0yvNjIpHz
 0M/+Rm/u49eU6sTCAx+yBtDcJOZbL6SJf2x9Xpip99ZGvUTYo/C4oe3sn w==;
X-CSE-ConnectionGUID: XZh6da3uRoO8wLelhQO6YA==
X-CSE-MsgGUID: M94zk0JkRg2e/58vhv64hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71695380"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71695380"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:15 -0800
X-CSE-ConnectionGUID: epsv1CJkT7K5d2KfLhsiwQ==
X-CSE-MsgGUID: W/N4v45/T6eeew7ioFBGNA==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:14 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/17] tests/kms_properties: Use igt_crtc_t instead of
 enum pipe
Date: Wed, 11 Feb 2026 18:34:03 +0200
Message-ID: <20260211163404.2018-17-ville.syrjala@linux.intel.com>
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

Convert the use of enum pipe to igt_crtc_t in
tests/kms_properties.

The explicit use of pipe==PIPE_NONE (now converted to
crtc==NULL) complicates this one a bit.

 #include "scripts/iterators.cocci"

@func@
typedef igt_crtc_t;
identifier FUNC, PIPE;
parameter list[N] P;
@@
FUNC(P
- ,enum pipe PIPE
+ ,igt_crtc_t *crtc
 ,...)
{
<+... when != PIPE = ...
(
- igt_crtc_for_pipe(..., PIPE);
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...+>
}

@depends on func@
identifier func.FUNC;
expression PIPE;
expression list[func.N] EP;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
	,...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
@@
- igt_crtc_for_pipe(..., PIPE_NONE)
+ NULL

@@
igt_crtc_t *CRTC;
binary operator OP = { ==, != };
@@
- CRTC->pipe OP PIPE_NONE
+ CRTC OP NULL

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_properties.c | 91 ++++++++++++++++++++++++++++--------------
 1 file changed, 60 insertions(+), 31 deletions(-)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 34bb6ac42618..2fbcce6ad864 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -73,25 +73,27 @@ struct additional_test {
 			  uint32_t prop_id, uint64_t prop_value, bool atomic);
 };
 
-static void prepare_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *output, struct igt_fb *fb)
+static void prepare_pipe(igt_display_t *display, igt_crtc_t *crtc,
+			 igt_output_t *output, struct igt_fb *fb)
 {
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
-static void cleanup_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *output, struct igt_fb *fb)
+static void cleanup_pipe(igt_display_t *display, igt_crtc_t *crtc,
+			 igt_output_t *output, struct igt_fb *fb)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_each_plane_on_pipe(display, crtc->pipe, plane)
 		igt_plane_set_fb(plane, NULL);
 
 	igt_output_set_crtc(output, NULL);
@@ -231,7 +233,9 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, boo
 	}
 }
 
-static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+static void run_colorop_property_tests(igt_display_t *display,
+				       igt_crtc_t *crtc, igt_output_t *output,
+				       bool atomic)
 {
 	struct igt_fb fb;
 	igt_plane_t *plane;
@@ -239,11 +243,13 @@ static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, i
 	int i;
 	int colorop_id = 0;
 
-	prepare_pipe(display, pipe, output, &fb);
+	prepare_pipe(display, crtc, output,
+		     &fb);
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
-			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+			 igt_crtc_name(crtc), plane->index,
+			 kmstest_plane_type_name(plane->type), output->name);
 
 		/* iterate over all color pipelines on plane */
 		for (i = 0; i < plane->num_color_pipelines; ++i) {
@@ -251,7 +257,8 @@ static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, i
 			colorop = plane->color_pipelines[i];
 			while (colorop) {
 				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
-					  kmstest_pipe_name(pipe), plane->index, colorop->id,
+					  igt_crtc_name(crtc), plane->index,
+					  colorop->id,
 					  kmstest_plane_type_name(plane->type), output->name);
 				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id,
 						atomic, display->has_plane_color_pipeline);
@@ -263,54 +270,69 @@ static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, i
 		}
 	}
 
-	cleanup_pipe(display, pipe, output, &fb);
+	cleanup_pipe(display, crtc, output,
+		     &fb);
 }
 
-static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+static void run_plane_property_tests(igt_display_t *display, igt_crtc_t *crtc,
+				     igt_output_t *output, bool atomic)
 {
 	struct igt_fb fb;
 	igt_plane_t *plane;
 
-	prepare_pipe(display, pipe, output, &fb);
+	prepare_pipe(display, crtc, output,
+		     &fb);
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		igt_info("Testing plane properties on %s.#%d-%s (output: %s)\n",
-			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+			 igt_crtc_name(crtc), plane->index,
+			 kmstest_plane_type_name(plane->type), output->name);
 
 		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
 	}
 
-	cleanup_pipe(display, pipe, output, &fb);
+	cleanup_pipe(display, crtc, output,
+		     &fb);
 }
 
-static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+static void run_crtc_property_tests(igt_display_t *display, igt_crtc_t *crtc,
+				    igt_output_t *output, bool atomic)
 {
 	struct igt_fb fb;
 
-	prepare_pipe(display, pipe, output, &fb);
+	prepare_pipe(display, crtc, output,
+		     &fb);
 
-	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_name(pipe), output->name);
+	igt_info("Testing crtc properties on %s (output: %s)\n",
+		 igt_crtc_name(crtc), output->name);
 
 	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC,
-			igt_crtc_for_pipe(display, pipe)->crtc_id, atomic,
+			crtc->crtc_id,
+			atomic,
 			false);
 
-	cleanup_pipe(display, pipe, output, &fb);
+	cleanup_pipe(display, crtc, output,
+		     &fb);
 }
 
-static void run_connector_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+static void run_connector_property_tests(igt_display_t *display,
+					 igt_crtc_t *crtc,
+					 igt_output_t *output, bool atomic)
 {
 	struct igt_fb fb;
 
-	if (pipe != PIPE_NONE)
-		prepare_pipe(display, pipe, output, &fb);
+	if (crtc != NULL)
+		prepare_pipe(display, crtc,
+			     output, &fb);
 
-	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name, kmstest_pipe_name(pipe));
+	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name,
+		 igt_crtc_name(crtc));
 
 	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic, false);
 
-	if (pipe != PIPE_NONE)
-		cleanup_pipe(display, pipe, output, &fb);
+	if (crtc != NULL)
+		cleanup_pipe(display, crtc,
+			     output, &fb);
 }
 
 static void colorop_properties(igt_display_t *display, bool atomic)
@@ -338,7 +360,8 @@ static void colorop_properties(igt_display_t *display, bool atomic)
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
 				run_colorop_property_tests(display,
-							   crtc->pipe, output,
+							   crtc,
+							   output,
 							   atomic);
 			}
 		}
@@ -362,7 +385,9 @@ static void plane_properties(igt_display_t *display, bool atomic)
 
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output)) {
-			run_plane_property_tests(display, crtc->pipe, output,
+			run_plane_property_tests(display,
+						 crtc,
+						 output,
 						 atomic);
 		}
 	}
@@ -383,7 +408,9 @@ static void crtc_properties(igt_display_t *display, bool atomic)
 
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output)) {
-			run_crtc_property_tests(display, crtc->pipe, output,
+			run_crtc_property_tests(display,
+						crtc,
+						output,
 						atomic);
 		}
 	}
@@ -410,7 +437,7 @@ static void connector_properties(igt_display_t *display, bool atomic)
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
 				run_connector_property_tests(display,
-							     crtc->pipe,
+							     crtc,
 							     output, atomic);
 			}
 
@@ -422,7 +449,9 @@ static void connector_properties(igt_display_t *display, bool atomic)
 		igt_display_reset(display);
 
 		igt_dynamic_f("pipe-None-%s", igt_output_name(output))
-			run_connector_property_tests(display, PIPE_NONE, output, atomic);
+			run_connector_property_tests(display,
+						     NULL,
+						     output, atomic);
 
 	}
 }
-- 
2.52.0

