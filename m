Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4863FD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1AA10EA53;
	Fri, 27 Feb 2026 08:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeUoNJqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8580A10EA53
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179626; x=1803715626;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=OrHaGuTKizmWuVh0Qf58CkcNi8YkBnwDJwcicKqhTw0=;
 b=QeUoNJqopGmOnT3W36goMpJbKQfuY1jv4XCeW1sDpw5u2d+hpHFdXXhs
 xkfB8bBMgNx9+KiRY+6Nhq1Ywz83g1U5J021qLc7Huy+NE4pWxB6VMy7k
 PUyZfOXaWPLCgUytFElZhakxuPhVxpVsEyh918qvjyCAs1Dj4vciCIW6f
 mpJmXwnrLQzE/L3BmxIPZTVnK3saWe+9ADRkugZRQTaIcXg4/cIutzYCq
 XCWkpt++5eWoZF1AFK9c4ql+J4rPbTJy884okIKzM73H+UfgSeTgWwDCc
 Fl2Sb1dTz1b7H9q2d/fmXXGvlU9kf4sgvCnf8muFl9p/hB4samGXoKrDD g==;
X-CSE-ConnectionGUID: 1l0E/GWQRLSqhvvSZHBB2w==
X-CSE-MsgGUID: A26D+bb1RC+hZou9X08KkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75859383"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="75859383"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:06 -0800
X-CSE-ConnectionGUID: +iwJnHICQ/CfeDw2CqKiwA==
X-CSE-MsgGUID: s0OiJZ/hQyuiqOLWmhM7Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216731061"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:05 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/17] lib/kms: Replace
 igt_display_require_output_on_pipe() with
 igt_display_require_output_on_crtc()
Date: Fri, 27 Feb 2026 10:06:38 +0200
Message-ID: <20260227080653.30389-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

Replace the pipe based igt_display_require_output_on_pipe()
with igt_display_require_output_on_crtc().

 #include "scripts/iterators.cocci"

@@
expression DISPLAY, PIPE;
@@
- igt_display_require_output_on_pipe(DISPLAY, PIPE)
+ igt_display_require_output_on_crtc(igt_crtc_for_pipe(DISPLAY, PIPE))

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
type T;
@@
T igt_display_require_output_on_pipe(...);
+void igt_display_require_output_on_crtc(igt_crtc_t *crtc);

@@
@@
igt_display_require_output_on_pipe(...) { ... }
+/**
+ * igt_display_require_output_on_crtc:
+ * @crtc: CRTC
+ *
+ * Checks whether there's a valid @crtc/@output combination for the given @crtc
+ */
+void igt_display_require_output_on_crtc(igt_crtc_t *crtc)
+{
+       if (!igt_crtc_has_valid_output(crtc))
+               igt_skip("No valid connector found on CRTC %s\n", igt_crtc_name(crtc));
+}

@@
@@
- igt_display_require_output_on_pipe(...) { ... }

@@
@@
- igt_pipe_has_valid_output(...) { ... }

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                 | 17 +++++++----------
 lib/igt_kms.h                 |  2 +-
 tests/intel/kms_ccs.c         |  3 +--
 tests/kms_plane_alpha_blend.c |  2 +-
 tests/nouveau_crc.c           |  3 +--
 5 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7454d16780f9..11ed109d74fb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3254,19 +3254,16 @@ void igt_display_require_output(igt_display_t *display)
 }
 
 /**
- * igt_display_require_output_on_pipe:
- * @display: A pointer to an #igt_display_t structure
- * @pipe: Display pipe
+ * igt_display_require_output_on_crtc:
+ * @crtc: CRTC
  *
- * Checks whether there's a valid @pipe/@output combination for the given @display and @pipe
- * Skips test if a valid @pipe is not found
+ * Checks whether there's a valid @crtc/@output combination for the given @crtc
  */
-void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe)
+void igt_display_require_output_on_crtc(igt_crtc_t *crtc)
 {
-	igt_require_pipe(display, pipe);
-
-	if (!igt_crtc_has_valid_output(igt_crtc_for_pipe(display, pipe)))
-		igt_skip("No valid connector found on pipe %s\n", kmstest_pipe_name(pipe));
+	if (!igt_crtc_has_valid_output(crtc))
+		igt_skip("No valid connector found on CRTC %s\n",
+			 igt_crtc_name(crtc));
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1e1f3ead5c99..c79c8664e9a9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -570,7 +570,7 @@ void igt_display_commit_atomic(igt_display_t *display, uint32_t flags, void *use
 int  igt_display_try_commit2(igt_display_t *display, enum igt_commit_style s);
 int  igt_display_drop_events(igt_display_t *display);
 void igt_display_require_output(igt_display_t *display);
-void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
+void igt_display_require_output_on_crtc(igt_crtc_t *crtc);
 int igt_display_n_crtcs(igt_display_t *display);
 
 const char *igt_crtc_name(igt_crtc_t *crtc);
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 2b570af355fc..4d0bda6a78f7 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1171,8 +1171,7 @@ static void test_output(data_t *data, const int testnum)
 						igt_info("Testing with seed %d\n", data->seed);
 
 					if (data->flags & TEST_ALL_PLANES) {
-						igt_display_require_output_on_pipe(&data->display,
-										   crtc->pipe);
+						igt_display_require_output_on_crtc(crtc);
 
 						for_each_plane_on_crtc(crtc,
 								       data->plane) {
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 41a3b71c3861..8b16a35ea70c 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -659,7 +659,7 @@ static bool pipe_check(data_t *data, igt_crtc_t *crtc,
 	igt_plane_t *plane;
 	bool plane_alpha = false, plane_blend = false, multiply = false;
 
-	igt_display_require_output_on_pipe(display, crtc->pipe);
+	igt_display_require_output_on_crtc(crtc);
 	for_each_plane_on_crtc(crtc, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 3137884dcfc6..98394674e463 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -340,8 +340,7 @@ int igt_main()
 			int dir;
 
 			data.crtc = igt_crtc_for_pipe(&data.display, pipe);
-			igt_display_require_output_on_pipe(&data.display,
-							   data.crtc->pipe);
+			igt_display_require_output_on_crtc(data.crtc);
 
 			/* Disable the output from the previous iteration of pipe tests, if there is
 			 * one
-- 
2.52.0

