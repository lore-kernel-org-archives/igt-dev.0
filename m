Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EE5D46977
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 12:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDEB10E9A3;
	Thu, 22 Jan 2026 12:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgVzMeNg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0616210E99F
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086788; x=1800622788;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nCv9PeBMsIe1CiPZrKO4359NSXBe35VlfEGPjgFWihQ=;
 b=RgVzMeNgXgatN20aZAANdMJvsXwiaS/L1PIEeEB1Eeb+ZmtHwlzllUsV
 vQa8P/3Y4+jC0hHYcumVGjdnoVhTd3P5vPvSoPRLZdMWUvSjZXhOqKcKl
 /bEJrQ+J4fST8QqgBevcuaQ4d0HEWZQ3ADO6cdsUWd9m6y2faeF3/oejD
 3L4Fm4WEkiuAqLbZTl+noxfzOX/onYSIa1w/JGJvp5ssJKjom1acOKgah
 2iFNeHrjGekOm7TVD4EDF5C8kmyAyy9Zz1DFe62QXvoXYVX68HA5xV5GK
 Qz94ETdYjtuyduSlruCYZwXzrifxU11eLoT+fj5bu7rcj9qUzynw51e0K A==;
X-CSE-ConnectionGUID: cyoVmjJYStag4DVn+T52pQ==
X-CSE-MsgGUID: z5EjsGV/Q3G3TXNt7B1mWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81045325"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81045325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:48 -0800
X-CSE-ConnectionGUID: BGc0D6LRTdOx+wZiht1USg==
X-CSE-MsgGUID: G4Hmh1SzSw6x8jNcfmRw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237987049"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:59:47 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/10] lib/kms: Hide output->pending_pipe from tests
Date: Thu, 22 Jan 2026 14:59:28 +0200
Message-ID: <20260122125937.10807-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
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

We already igt_output_get_driving_pipe() that converts
output->pending_pipe to the igt_crtc_t. Make use of it
so that we can hide the implementation details from the
tests and reduce the amount of code that operates
on pipes (as opposed to crtcs).

Done with cocci:
 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
@@
- static
igt_crtc_t *igt_output_get_driving_pipe(...) {...}

@@
typedef igt_output_t;
@@
+ igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output);
  const char *igt_output_name(...);

@in_lib_kms depends on file in "lib/igt_kms.c"@
igt_output_t *output;
@@
output->pending_pipe

@depends on !in_lib_kms@
expression DISPLAY;
igt_output_t *output;
@@
(
- igt_crtc_for_pipe(DISPLAY, output->pending_pipe)
+ igt_output_get_driving_pipe(output)
|
- output->pending_pipe == PIPE_NONE
+ igt_output_get_driving_pipe(output) == NULL
|
- output->pending_pipe != PIPE_NONE
+ igt_output_get_driving_pipe(output) != NULL
)

@depends on !in_lib_kms@
expression output;
igt_crtc_t *crtc;
@@
- output.pending_pipe == crtc->pipe
+ igt_output_get_driving_pipe(&output) == crtc

@@
expression E;
@@
- igt_output_get_driving_pipe((E))
+ igt_output_get_driving_pipe(E)

@@
expression E,E2;
@@
- if(igt_output_get_driving_pipe(E) != E2)
+ if (igt_output_get_driving_pipe(E) != E2)
{ ... }

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                  | 2 +-
 lib/igt_kms.h                  | 1 +
 tests/intel/gem_pxp.c          | 2 +-
 tests/intel/kms_pm_lpsp.c      | 2 +-
 tests/intel/xe_pxp.c           | 2 +-
 tests/kms_atomic_transition.c  | 4 ++--
 tests/kms_content_protection.c | 2 +-
 tests/kms_cursor_legacy.c      | 2 +-
 tests/kms_debugfs.c            | 2 +-
 tests/kms_feature_discovery.c  | 2 +-
 tests/kms_plane_scaling.c      | 2 +-
 11 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7b6102cb7319..ec6a71f9da2a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3529,7 +3529,7 @@ report_dup:
 	}
 }
 
-static igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output)
+igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output)
 {
 	igt_display_t *display = output->display;
 	enum pipe pipe;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b291673c2f7f..ef2654dd3948 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -588,6 +588,7 @@ typedef struct _igt_pipe_crc igt_pipe_crc_t;
 igt_pipe_crc_t *igt_crtc_crc_new(igt_crtc_t *crtc, const char *source);
 igt_pipe_crc_t *igt_crtc_crc_new_nonblock(igt_crtc_t *crtc, const char *source);
 
+igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output);
 const char *igt_output_name(igt_output_t *output);
 bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index d41a07b4c012..b1bd094798b7 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1244,7 +1244,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_crtc_for_pipe(display, output->pending_pipe);
+		pipe = igt_output_get_driving_pipe(output);
 		pipe_crc = igt_crtc_crc_new(pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index a8801261dafa..e65597b9fded 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -139,7 +139,7 @@ static void test_cleanup(data_t *data)
 {
 	igt_plane_t *primary;
 
-	if (!data->output || data->output->pending_pipe == PIPE_NONE)
+	if (!data->output || igt_output_get_driving_pipe(data->output) == NULL)
 		return;
 
 	primary = igt_output_get_plane_type(data->output,
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 6aadf691a3ae..3aee74b849a0 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -845,7 +845,7 @@ static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_f
 
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_crtc_for_pipe(display, output->pending_pipe);
+		pipe = igt_output_get_driving_pipe(output);
 		pipe_crc = igt_crtc_crc_new(pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 60f743c6c614..07889fe87caa 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -840,7 +840,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 		event_mask |= 1 << pipe;
 
 		for_each_valid_output_on_pipe(&data->display, pipe, output) {
-			if (output->pending_pipe != PIPE_NONE)
+			if (igt_output_get_driving_pipe(output) != NULL)
 				continue;
 
 			igt_output_set_crtc(output,
@@ -933,7 +933,7 @@ retry:
 							      IGT_PIPE_CRC_SOURCE_AUTO);
 
 		for_each_valid_output_on_pipe(&data->display, i, output) {
-			if (output->pending_pipe != PIPE_NONE)
+			if (igt_output_get_driving_pipe(output) != NULL)
 				continue;
 
 			igt_output_set_crtc(output,
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index f324bc6de65f..16b174266a33 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -397,7 +397,7 @@ static bool igt_crtc_is_free(igt_crtc_t *crtc)
 	int i;
 
 	for (i = 0; i < display->n_outputs; i++)
-		if (display->outputs[i].pending_pipe == crtc->pipe)
+		if (igt_output_get_driving_pipe(&display->outputs[i]) == crtc)
 			return false;
 
 	return true;
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 667fc0344c9a..dbcb4bbf243c 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -439,7 +439,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 
 	for_each_pipe(display, pipe) {
 		for_each_valid_output_on_pipe(display, pipe, *output) {
-			if((*output)->pending_pipe != PIPE_NONE)
+			if (igt_output_get_driving_pipe(*output) != NULL)
 				continue;
 
 			igt_output_set_crtc(*output,
diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 8cdb020fe482..e2e7daf44e24 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -45,7 +45,7 @@ static void igt_display_all_on(igt_display_t *display)
 			igt_plane_t *primary;
 			drmModeModeInfo *mode;
 
-			if (output->pending_pipe != PIPE_NONE)
+			if (igt_output_get_driving_pipe(output) != NULL)
 				continue;
 
 			igt_output_set_crtc(output,
diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index da80ecf66855..b63af75cdac3 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -99,7 +99,7 @@ int igt_main() {
 				/* this is what most of the 2x tests are doing */
 				for_each_pipe(&display, pipe) {
 					for_each_valid_output_on_pipe(&display, pipe, output) {
-						if (output->pending_pipe == PIPE_NONE) {
+						if (igt_output_get_driving_pipe(output) == NULL) {
 							igt_output_set_crtc(output,
 									    igt_crtc_for_pipe(output->display, pipe));
 							output_count++;
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 32bb120cdfdd..eea557e7a0c2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -851,7 +851,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 
 	for_each_pipe(display, pipe) {
 		for_each_valid_output_on_pipe(display, pipe, *output) {
-			if((*output)->pending_pipe != PIPE_NONE)
+			if (igt_output_get_driving_pipe(*output) != NULL)
 				continue;
 
 			igt_output_set_crtc(*output,
-- 
2.52.0

