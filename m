Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B0CECD6C1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A78B10E62E;
	Wed, 11 Feb 2026 16:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LslNbbYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9800B10E62C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827708; x=1802363708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2CuPjO9ozTglKMT8Apj1jmK6MwNdJSmysVUbOeQXhaQ=;
 b=LslNbbYDLx5uwCSI7bxLyWy4AeAN1PouR684QIIKwcWhE6DOD2Oq3alZ
 ZfZFVTH79gNJJSisOSQGcmXxlH7YIFDrpE93QdYmXJAbnI977G9xRorlh
 ITfY6U2l+PgKt/W7I/YaJBnitRxWQ7whEqWhDATJ2eWZyDHmmoYQXX9fL
 mpAE7oBM2Kemdr5envBU7o6cEU6uB2crV7NHgf9hBct705tplm6FyXNJT
 +Nj5Vgm+vYbe6btm+4KeIfAg9708Fnn+oc7pKnDXH7R5Ro0CiMUaF+O+4
 hLgdV6AmGLCypWO/xmKLSRLUKSOhEZanYc6+ek2U2jotPo2KcGzIcgHwv Q==;
X-CSE-ConnectionGUID: RG8Jlf9mQ1icxcxw9BB31A==
X-CSE-MsgGUID: RyuVh5whRc+UcQ5Vrw27jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71879822"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71879822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:08 -0800
X-CSE-ConnectionGUID: F1fiQs9ARpei/Lt46RArug==
X-CSE-MsgGUID: /+se8YwsQeS+ractUdAHsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212394409"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:07 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 14/17] tests/kms_display_modes: Use igt_crtc_t instead
 of enum pipe
Date: Wed, 11 Feb 2026 18:34:01 +0200
Message-ID: <20260211163404.2018-15-ville.syrjala@linux.intel.com>
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
tests/kms_display_modes.

The complication here is the use of multiple pipes/crtcs
simultaneously.

 #include "scripts/iterators.cocci"

@func@
typedef igt_crtc_t;
identifier FUNC, PIPE1, PIPE2;
parameter list[N] P;
parameter list[N2] P2;
@@
FUNC(P
-	,enum pipe PIPE1
+	,igt_crtc_t *crtc1
	,P2
-	,enum pipe PIPE2
+	,igt_crtc_t *crtc2
	,...)
{
<+...
(
- igt_crtc_for_pipe(..., PIPE1)
+ crtc1
|
- kmsetst_crtc_name(PIPE1)
+ igt_crtc_name(crtc1)
|
- PIPE1
+ crtc1->pipe
|
- igt_crtc_for_pipe(..., PIPE2)
+ crtc2
|
- kmsetst_crtc_name(PIPE2)
+ igt_crtc_name(crtc2)
|
- PIPE2
+ crtc2->pipe
)
...+>
}

@depends on func@
identifier func.FUNC;
expression PIPE1, PIPE2;
expression list[func.N] EP;
expression list[func.N2] EP2;
@@
 FUNC(EP
-	,PIPE1
+	,igt_crtc_for_pipe(display, PIPE1)
	,EP2
-	,PIPE2
+	,igt_crtc_for_pipe(display, PIPE2)
	,...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
typedef igt_display_t;
identifier DISPLAY;
expression E;
@@
- igt_display_t *DISPLAY = E;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_display_modes.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index f3888375c966..60585bed0218 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -72,9 +72,9 @@ static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
 	return true;
 }
 
-static void run_extendedmode_basic(data_t *data,
-				   enum pipe pipe1, igt_output_t *output1,
-				   enum pipe pipe2, igt_output_t *output2)
+static void run_extendedmode_basic(data_t *data, igt_crtc_t *crtc1,
+				   igt_output_t *output1, igt_crtc_t *crtc2,
+				   igt_output_t *output2)
 {
 	struct igt_fb fb, fbs[2];
 	drmModeModeInfo *mode[2];
@@ -88,18 +88,18 @@ static void run_extendedmode_basic(data_t *data,
 	igt_display_reset(display);
 
 	igt_output_set_crtc(output1,
-			    igt_crtc_for_pipe(display, pipe1));
+			    crtc1);
 	igt_output_set_crtc(output2,
-			    igt_crtc_for_pipe(display, pipe2));
+			    crtc2);
 
 	mode[0] = igt_output_get_mode(output1);
 	mode[1] = igt_output_get_mode(output2);
 
 	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in bw\n");
 
-	pipe_crc[0] = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe1),
+	pipe_crc[0] = igt_crtc_crc_new(crtc1,
 				       IGT_PIPE_CRC_SOURCE_AUTO);
-	pipe_crc[1] = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe2),
+	pipe_crc[1] = igt_crtc_crc_new(crtc2,
 				       IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
@@ -107,9 +107,9 @@ static void run_extendedmode_basic(data_t *data,
 	igt_create_color_fb(data->drm_fd, mode[1]->hdisplay, mode[1]->vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &fbs[1]);
 
-	plane[0] = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe1),
+	plane[0] = igt_crtc_get_plane_type(crtc1,
 					   DRM_PLANE_TYPE_PRIMARY);
-	plane[1] = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe2),
+	plane[1] = igt_crtc_get_plane_type(crtc2,
 					   DRM_PLANE_TYPE_PRIMARY);
 
 	igt_plane_set_fb(plane[0], &fbs[0]);
@@ -163,10 +163,10 @@ static void run_extendedmode_basic(data_t *data,
 	igt_output_set_crtc(output1, NULL);
 	igt_output_set_crtc(output2, NULL);
 
-	igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe1),
+	igt_plane_set_fb(igt_crtc_get_plane_type(crtc1,
 						 DRM_PLANE_TYPE_PRIMARY),
 			 NULL);
-	igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe2),
+	igt_plane_set_fb(igt_crtc_get_plane_type(crtc2,
 						 DRM_PLANE_TYPE_PRIMARY),
 			 NULL);
 	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in bw\n");
@@ -224,10 +224,10 @@ static void run_extendedmode_test(data_t *data) {
 						      igt_crtc_name(crtc2),
 						      igt_output_name(output2))
 						run_extendedmode_basic(data,
-								crtc->pipe,
-								output1,
-								crtc2->pipe,
-								output2);
+								       crtc,
+								       output1,
+								       crtc2,
+								       output2);
 				}
 			}
 			/*
-- 
2.52.0

