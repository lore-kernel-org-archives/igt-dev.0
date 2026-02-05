Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443ECEC1EB6
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE98810E8A1;
	Thu,  5 Feb 2026 13:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="deOrq4gb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D0B10E8A1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298248; x=1801834248;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uZeiU6qrpWhNgC1Snuz1H4Dwz0IVM+OBZMbOA+kDalw=;
 b=deOrq4gbOOtR86ppnlMHMTWpL8O4deFcLd9sRmmdvASZVxd/4LiXqTM6
 jRUicHBXnlHZicToyRwpKeG6pMU1OJVhlY3At8UeQ3ag2snHi8HlM1Is1
 K7pY2fpmi6yun1viofrdktt3XvrT1WuJmV1h0z0GCKvvSN4gqsUhkKn/2
 9oxwC6sDdjRyuqCfbgciRMgtfnwamXJb8SVvHRmFyBLGnek0RJGUTLiYI
 rjGshxeLc1o60xHu3FCGtRb7RVAeu+ZGQZNhIAKmxdwfbueOE846UA6aF
 m8mHJEG63+T1CMZOT4RkLhI1OwnivkD18Fgkp5GsqYaUYRahjj/4Ap0hg Q==;
X-CSE-ConnectionGUID: SbURBlZ3TfOugs64+xrfQA==
X-CSE-MsgGUID: Qb2R4kHKQDa9mOxWy94yvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693531"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693531"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:48 -0800
X-CSE-ConnectionGUID: gElzwKzXTh+NzxWqg+w94w==
X-CSE-MsgGUID: rK3H104STIySqPzoTcUU2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499290"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/12] tests/kms: Convert to for_each_crtc(), part 2
Date: Thu,  5 Feb 2026 15:30:14 +0200
Message-ID: <20260205133019.9161-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

Convert more for_each_pipe()s into for_each_crtc(). In
these cases the iterator is stored in some kind of data
structure (data.pipe) which we still want to keep up to
date to avoid functional changes.

These specific cases weren't caught by the previous attempt
due to some cocci weirness with curly braces vs. not for the
iterator loop. To catch these stragglers we apparently need
to add more braces ahead of time.

 #include "scripts/iterators.cocci"

@@
iterator name for_each_pipe;
iterator name for_each_crtc;
expression DISPLAY, X;
identifier PIPE;
statement S;
@@
for_each_pipe(DISPLAY, X.PIPE)
+{
S
+}

@change@
identifier PIPE;
expression DISPLAY, X;
@@
- for_each_pipe(DISPLAY, X.PIPE)
+ for_each_crtc(DISPLAY, crtc)
{
+ X.PIPE = crtc->pipe;
<...
(
- igt_crtc_for_pipe(..., X.PIPE)
+ crtc
|
- kmstest_pipe_name(X.PIPE)
+ igt_crtc_name(crtc)
|
- X.PIPE
+ crtc->pipe
)
...>
}

@depends on change@
identifier FUNC, CRTC;
@@
FUNC(...)
{
+ igt_crtc_t *CRTC;
<+...
for_each_crtc(..., CRTC) { ... }
...+>
}

@depends on change@
identifier CRTC;
@@
 igt_crtc_t *CRTC;
...
- igt_crtc_t *CRTC;

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 5 ++++-
 tests/kms_vblank.c                      | 6 ++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 5e6ba922420c..d74575f91d83 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -602,6 +602,7 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
 
 int igt_main()
 {
+	igt_crtc_t *crtc;
 	data_t data = {};
 
 	igt_fixture() {
@@ -611,8 +612,10 @@ int igt_main()
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
-		for_each_pipe(&data.display, data.pipe)
+		for_each_crtc(&data.display, crtc) {
+			data.pipe = crtc->pipe;
 			data.n_pipes++;
+		}
 		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(debug_mask_if_ci);
 
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index ecbd85d031a6..730a0f052a35 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -649,8 +649,10 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_display_require_output(&data.display);
 
 		/* Get active pipes. */
-		for_each_pipe(&data.display, data.pipe)
-			active_pipes[last_pipe++] = data.pipe;
+		for_each_crtc(&data.display, crtc) {
+			data.pipe = crtc->pipe;
+			active_pipes[last_pipe++] = crtc->pipe;
+		}
 		last_pipe--;
 	}
 
-- 
2.52.0

