Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0323DEA3F22
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E3F10E5D4;
	Tue, 10 Feb 2026 16:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUZU3BTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BBF10E5D4
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770739838; x=1802275838;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=96GT7H05KfgeyTC3dWXgo9yxMlpsx0rNJikkOI6FFJ0=;
 b=BUZU3BTRTt9dgqKb5DjphfRGmvSV5JW9hsygtW5yqfn/0/nTqAY6WURd
 kyd5/M9+4yHE9ix3mdCaN7y8zIIMB1v5k4twCQTxS5kIqwG/XSepQ4TWm
 6sTqW1C6J95War/3SofULZOG0nyFDkcVvjY94qNzLf3Cq++UtH3mQ2JBT
 xh7pOZQvrsfecrUiZ8jXqoaQq5mokEYvBXenwPk0unCQf/THbW1BRWipa
 dn3Fv7072yyHaf+706M/TOTO03U1ID2mNCxgBi0pMN2YA4FtKOdnEsJJC
 FhhkDOB/AJuPiSmKyT3jfUWYdfp3TiiV1aGi9Ki3o1/gIK8lEPHByAw8Z A==;
X-CSE-ConnectionGUID: ZH0JvpoNTtObevbDFGIsLA==
X-CSE-MsgGUID: BmFA+EDoQUapKNEYxVYJlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71770698"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71770698"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:37 -0800
X-CSE-ConnectionGUID: 5jnLkcBvSne1XiTslvalHg==
X-CSE-MsgGUID: OOZOspeNS72JosuycCAsWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211061336"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:36 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/5] tests/kms: Pull igt_crtc_for_pipe() calls earlier,
 when dealing with planes
Date: Tue, 10 Feb 2026 18:10:15 +0200
Message-ID: <20260210161016.29459-5-ville.syrjala@linux.intel.com>
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

Do the igt_crtc_for_pipe() calls as early as possible.
In this case we specifically deal witht the case where
the local 'crtc' variable is populated via a plane->crtc
pointer.

This can make subsequent cocci cleanups around
igt_crtc_for_pipe() usage a bit easier.

 #include "scripts/iterators.cocci"

@@
typedef igt_display_t;
identifier DISPLAY;
expression DISPLAY2, E;
@@
igt_display_t* DISPLAY = E;
<+...
igt_crtc_for_pipe(
- DISPLAY2
+ DISPLAY
  ,...)
...+>

@find_1@
identifier FUNC, DISPLAY, PIPE, CRTC, PLANE;
expression E;
@@
FUNC(..., enum pipe PIPE, ...)
{
...
igt_display_t *DISPLAY = E;
...
igt_crtc_t *CRTC;
...
PLANE = igt_output_get_plane_type(...);
...
CRTC = PLANE->crtc;
...
}

@change_1 depends on find_1@
identifier find_1.FUNC, find_1.DISPLAY, find_1.PIPE, find_1.CRTC, find_1.PLANE;
expression find_1.E;
@@
FUNC(..., enum pipe PIPE, ...)
{
...
igt_display_t *DISPLAY = E;
+ igt_crtc_t *CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
...
- igt_crtc_t *CRTC;
<+...
(
- CRTC = PLANE->crtc;
|
- igt_crtc_for_pipe(DISPLAY, PIPE)
+ CRTC
)
...+>
}

@@
identifier CRTC;
@@
- igt_crtc_t *CRTC = CRTC;

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_concurrent.c     | 5 ++---
 tests/kms_plane_multiple.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 572d61d831d3..81f3944c29f6 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -158,8 +158,8 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	       igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
-	igt_crtc_t *crtc;
 	igt_plane_t *primary;
 	int *x;
 	int *y;
@@ -167,10 +167,9 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	int i;
 	int format, modifier;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	crtc = primary->crtc;
 
 	x = malloc(crtc->n_planes * sizeof(*x));
 	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n",
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 624c1d42efb9..105ea50d464e 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -206,8 +206,8 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
 	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_t *fb)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
 	drmModeModeInfo *mode;
-	igt_crtc_t *crtc;
 	igt_plane_t *primary;
 	int *x;
 	int *y;
@@ -216,9 +216,8 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
 	int* suffle;
 
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(display, pipe_id));
+			    crtc);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	crtc = primary->crtc;
 
 	x = malloc(crtc->n_planes * sizeof(*x));
 	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n",
-- 
2.52.0

