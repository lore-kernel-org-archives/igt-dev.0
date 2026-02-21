Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA28EE9A049
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A43D10E10E;
	Sat, 21 Feb 2026 03:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYU00pEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D815E10E10E
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644080; x=1803180080;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=n7DSufj9hPfeqQXKW1OcoTaa+jEGvrFv6zOxaSzOL7g=;
 b=XYU00pEWQ4ONLS0sU6QCCbIFTHiBPNT4J9umhaCzEfrGJDjQa4sM3S+Q
 GrNOhzUGHtQQ6pLdBQJaiXlljZtRqzBnhxpbw/UmGyElTIvVbl6yp/jVz
 5XnjBYuFMy5M29Juf/N3+HyQ+qkNIgpoSmD5k5a6UxL66bSGubZBf2M/J
 PoSsEG9kGg3XjDShKxvdFQ7ozjDdMk0TsmyTvYqtv70ZbBYHsyQa+8tBB
 iCzxtpW7lPw8m4WlkEJSqmMGRp1EjcA329MyCS4ajV7ylNw0gv+u11u1g
 YIdBqAWtx6PcXLPZbpsfeE+WSfOBjCcotdJ0nq08gk892/8BCUlxlIiE6 A==;
X-CSE-ConnectionGUID: yZEkNuyOTZab3vlA1am0VA==
X-CSE-MsgGUID: fWEZ03lgQGOMZAF1/ijM5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76597968"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="76597968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:20 -0800
X-CSE-ConnectionGUID: XYS4VSa7QMWhl80ZxQ5btQ==
X-CSE-MsgGUID: CMKCFrdeSOydgHc7z/vJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214128821"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:19 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 19/23] tests/chamelium: Use igt_crtc_t instead of
 enum pipe
Date: Sat, 21 Feb 2026 05:19:58 +0200
Message-ID: <20260221032003.30936-20-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
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

Convert the remaining chamelium tests to use igt_crtc_t
instead of enum pipe. Here we specifically deal with changing
the return type of chamelium_get_pipe_for_output().

The mess inside test_hotplug() proved difficult for cocci,
so there is some special sauce for that in the semantic
patch.

 #include "scripts/iterators.cocci"

@ret_pipe@
typedef igt_output_t;
typedef igt_crtc_t;
identifier FUNC;
igt_crtc_t *CRTC;
parameter list[N] P;
@@
- enum pipe
+ igt_crtc_t *
FUNC(P)
{
<...
- return CRTC->pipe;
+ return CRTC;
...>
}

@depends on ret_pipe@
identifier ret_pipe.FUNC;
@@
- enum pipe
+ igt_crtc_t *
FUNC(...);

@depends on ret_pipe@
identifier ret_pipe.FUNC;
@@
FUNC(...)
+ ->pipe

@depends on ret_pipe@
identifier ret_pipe.FUNC, PIPE;
expression list[ret_pipe.N] EP;
@@
{ ...
  enum pipe PIPE;
+ igt_crtc_t *crtc;
<+... when != PIPE = ...
- PIPE = FUNC(EP)->pipe;
+ crtc = FUNC(EP);
+ PIPE = crtc->pipe;
...+>
}

@depends on ret_pipe@
identifier ret_pipe.FUNC;
expression list[ret_pipe.N] EP;
@@
- igt_crtc_for_pipe(..., FUNC(EP)->pipe)
+ FUNC(EP)

@@
identifier PIPE;
igt_crtc_t *CRTC;
@@
{...
if (...) {
...
- PIPE = CRTC->pipe;
...
}
<+... when != PIPE = ...
- PIPE
+ CRTC->pipe
...+>
}

@@
identifier PIPE;
igt_crtc_t *CRTC;
@@
{...
- PIPE = CRTC->pipe;
<+... when != PIPE = ...
- PIPE
+ CRTC->pipe
...+>
}

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
identifier PIPE;
@@
{...
- enum pipe PIPE;
... when != PIPE
}

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/chamelium/kms_chamelium_edid.c   | 13 +++++++------
 tests/chamelium/kms_chamelium_helper.c | 10 +++++-----
 tests/chamelium/kms_chamelium_helper.h |  2 +-
 tests/chamelium/kms_chamelium_hpd.c    |  8 ++++----
 4 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index f5647dde0d9d..e014ba3aa873 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -287,7 +287,7 @@ static void edid_stress_resolution(chamelium_data_t *data,
 		drmModeModeInfo mode;
 		struct igt_fb fb = { 0 };
 		igt_output_t *output;
-		enum pipe pipe;
+		igt_crtc_t *crtc;
 		bool is_video_stable;
 		int screen_res_w, screen_res_h;
 
@@ -311,9 +311,9 @@ static void edid_stress_resolution(chamelium_data_t *data,
 		mode = chamelium_get_mode_for_port(chamelium, port);
 		chamelium_create_fb_for_mode(data, &fb, &mode);
 		output = chamelium_get_output_for_port(data, port);
-		pipe = chamelium_get_pipe_for_output(&data->display, output);
+		crtc = chamelium_get_pipe_for_output(&data->display, output);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(output->display, pipe));
+				    crtc);
 		chamelium_enable_output(data, port, output, &mode, &fb);
 
 		/* Capture the screen resolution and verify. */
@@ -350,7 +350,7 @@ static void edid_resolution_list(chamelium_data_t *data,
 	int count_modes;
 	int i;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	chamelium_unplug(chamelium, port);
 	chamelium_set_edid(data, port, IGT_CUSTOM_EDID_FULL);
@@ -366,8 +366,9 @@ static void edid_resolution_list(chamelium_data_t *data,
 	count_modes = connector->count_modes;
 
 	output = chamelium_get_output_for_port(data, port);
-	pipe = chamelium_get_pipe_for_output(&data->display, output);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+	crtc = chamelium_get_pipe_for_output(&data->display, output);
+	igt_output_set_crtc(output,
+			    crtc);
 
 	for (i = 0; i < count_modes; ++i)
 		igt_debug("#%d %s %uHz\n", i, modes[i].name, modes[i].vrefresh);
diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms_chamelium_helper.c
index c15a3096c5fe..ea30ff42d9a9 100644
--- a/tests/chamelium/kms_chamelium_helper.c
+++ b/tests/chamelium/kms_chamelium_helper.c
@@ -133,7 +133,7 @@ igt_output_t *chamelium_prepare_output(chamelium_data_t *data,
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 
 	/* The chamelium's default EDID has a lot of resolutions, way more then
 	 * we need to test. Additionally the default EDID doesn't support HDMI
@@ -152,8 +152,8 @@ igt_output_t *chamelium_prepare_output(chamelium_data_t *data,
 	/* Refresh pipe to update connected status */
 	igt_output_set_crtc(output, NULL);
 
-	pipe = chamelium_get_pipe_for_output(display, output);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	crtc = chamelium_get_pipe_for_output(display, output);
+	igt_output_set_crtc(output, crtc);
 
 	return output;
 }
@@ -201,7 +201,7 @@ void chamelium_enable_output(chamelium_data_t *data,
 }
 
 /* Return pipe attached to @outpu.t */
-enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
+igt_crtc_t * chamelium_get_pipe_for_output(igt_display_t *display,
 					igt_output_t *output)
 {
 	igt_crtc_t *crtc;
@@ -216,7 +216,7 @@ enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
 		}
 
 		igt_output_set_crtc(output, NULL);
-		return crtc->pipe;
+		return crtc;
 	}
 
 	igt_assert_f(false, "No pipe found for output %s\n",
diff --git a/tests/chamelium/kms_chamelium_helper.h b/tests/chamelium/kms_chamelium_helper.h
index 7941ca9d3139..6060796661c4 100644
--- a/tests/chamelium/kms_chamelium_helper.h
+++ b/tests/chamelium/kms_chamelium_helper.h
@@ -97,7 +97,7 @@ igt_output_t *chamelium_prepare_output(chamelium_data_t *data,
 void chamelium_enable_output(chamelium_data_t *data,
 			     struct chamelium_port *port, igt_output_t *output,
 			     drmModeModeInfo *mode, struct igt_fb *fb);
-enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
+igt_crtc_t * chamelium_get_pipe_for_output(igt_display_t *display,
 					igt_output_t *output);
 
 int chamelium_get_pattern_fb(chamelium_data_t *data, size_t width,
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 29028ce6f7da..bd8731c0216b 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -230,7 +230,7 @@ static void test_hotplug(chamelium_data_t *data, struct chamelium_port *port,
 			 int toggle_count, enum test_modeset_mode modeset_mode)
 {
 	int i;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct igt_fb fb = { 0 };
 	drmModeModeInfo mode;
 	struct udev_monitor *mon = igt_watch_uevents();
@@ -259,15 +259,15 @@ static void test_hotplug(chamelium_data_t *data, struct chamelium_port *port,
 				 * connected */
 				output = chamelium_get_output_for_port(data,
 								       port);
-				pipe = chamelium_get_pipe_for_output(
-					&data->display, output);
+				crtc = chamelium_get_pipe_for_output(&data->display,
+								     output);
 				mode = chamelium_get_mode_for_port(
 					data->chamelium, port);
 				chamelium_create_fb_for_mode(data, &fb, &mode);
 			}
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(output->display, pipe));
+					    crtc);
 			chamelium_enable_output(data, port, output, &mode, &fb);
 		}
 
-- 
2.52.0

