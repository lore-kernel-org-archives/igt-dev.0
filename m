Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A9CD49C9E
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899B110E9BB;
	Fri, 30 Jan 2026 10:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AfV4u2DR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6656F10E9BB
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769770409; x=1801306409;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SE41H5olP64BWTeMSU1E5m4hDDJqANMsoNBfn5Kjn4Y=;
 b=AfV4u2DRei+IpNBXLD0yULQdG0sCko/tpxECvxbxZGG7igrTBiHOpfMi
 VbRNEcvHHwR/1/vQaFAf7Me4u+2BrJgyUvxQ5rhhKl+oRgCT3lwNb69R3
 RySaR1InX9u33O3nICJCG4tR4jtvlZKcUAMjR1I+56A2dklZRN0ZwtFTd
 bjPj+FvlVPZq1iHXMI+z4DUrMwDopA71MrCgpIXMSwX+WM1Hgj7Nx3eG/
 9VYY6DmDgF9UZmCyNT7kUBk2bANueUD/cUxFW0xem/Ndip5L/nOnsM8bk
 ra+E0JoUfqK0EZ25lSdDzqOabODBln0Z3naRZIsgJuUbhvWN1qWI1gJ3O g==;
X-CSE-ConnectionGUID: Eg4lVifCQoqJhPEJkYF8JA==
X-CSE-MsgGUID: ksCR3G7tQuKF4ez8kzzS6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81653042"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="81653042"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:29 -0800
X-CSE-ConnectionGUID: 3qNTYCFWQAe+84RC2Sp14g==
X-CSE-MsgGUID: kLiz88mATaiIMR4WJagyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208826849"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.42])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:53:28 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/15] lib/kms: Use for_each_crtc_with_valid_output(),
 part 1
Date: Fri, 30 Jan 2026 12:52:33 +0200
Message-ID: <20260130105237.14481-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
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

Convert some uses of for_each_pipe_with_valid_output()
to for_each_crtc_with_valid_output(). Take care of the
cases where we (presumably) still have to keep some
kind of 'data.pipe' thingy still up to date.

Eventually we should probably replace 'data.pipe' with
'data.crtc' but I didn't want to go that far here.

Done with cocci:
 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe_with_valid_output;
iterator name for_each_crtc_with_valid_output;
typedef igt_crtc_t;
identifier PIPE;
expression DISPLAY, OUTPUT, X;
@@
- for_each_pipe_with_valid_output(DISPLAY, X.PIPE, OUTPUT)
+ for_each_crtc_with_valid_output(DISPLAY, crtc, OUTPUT)
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
identifier FUNC;
@@
FUNC(...)
{
+ igt_crtc_t *crtc;
<+...
for_each_crtc_with_valid_output(...) { ... }
...+>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_psr2_sf.c |  7 +++++--
 tests/kms_lease.c         | 15 +++++++++------
 tests/kms_vblank.c        | 26 +++++++++++++++++---------
 3 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index f42863874e5e..e23999544370 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -1175,6 +1175,7 @@ static void run_plane_update_continuous(data_t data, int i, int coexist_features
 
 int igt_main()
 {
+	igt_crtc_t *crtc;
 	bool output_supports_pr_psr2_sel_fetch = false;
 	bool pr_psr2_sel_fetch_supported = false;
 	data_t data = {};
@@ -1219,11 +1220,13 @@ int igt_main()
 		igt_info("Big framebuffer size %dx%d\n",
 			 data.big_fb_width, data.big_fb_height);
 
-		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
+		for_each_crtc_with_valid_output(&data.display, crtc,
+						data.output) {
+			data.pipe = crtc->pipe;
 			coexist_features[n_pipes] = 0;
 			output_supports_pr_psr2_sel_fetch = check_pr_psr2_sel_fetch_support(&data);
 			if (output_supports_pr_psr2_sel_fetch) {
-				pipes[n_pipes] = data.pipe;
+				pipes[n_pipes] = crtc->pipe;
 				outputs[n_pipes] = data.output;
 
 				if (is_dsc_supported_by_sink(data.drm_fd, data.output))
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 6d45d041b5b4..951159e97779 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1240,6 +1240,7 @@ static void lease_uevent(data_t *data)
 
 int igt_main()
 {
+	igt_crtc_t *crtc;
 	data_t data;
 	igt_output_t *output;
 	igt_display_t *display = &data.master.display;
@@ -1288,21 +1289,23 @@ int igt_main()
 
 			igt_describe(f->desc);
 			igt_subtest_with_dynamic_f("%s", f->name) {
-				for_each_pipe_with_valid_output(display, data.pipe, output) {
+				for_each_crtc_with_valid_output(display, crtc,
+								output) {
+					data.pipe = crtc->pipe;
 					igt_display_reset(display);
 
 					igt_output_set_crtc(output,
-							    igt_crtc_for_pipe(output->display, data.pipe));
+							    crtc);
 					if (!intel_pipe_output_combo_valid(display))
 						continue;
 
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe),
+					igt_dynamic_f("pipe-%s-%s",
+						      igt_crtc_name(crtc),
 						      igt_output_name(output)) {
-						data.crtc_id = igt_crtc_for_pipe(display,
-										 data.pipe)->crtc_id;
+						data.crtc_id = crtc->crtc_id;
 						data.connector_id = output->id;
 						data.plane_id =
-							igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.master.display, data.pipe),
+							igt_crtc_get_plane_type(crtc,
 										DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 						f->func(&data);
 					}
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index ed72c3576784..1e4ccd83b554 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -625,6 +625,7 @@ const char *help_str =
 
 int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
+	igt_crtc_t *crtc;
 	int fd;
 	data_t data;
 
@@ -642,11 +643,14 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Negative test for vblank request.");
 	igt_subtest_with_dynamic("invalid") {
-		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
-			if (!pipe_output_combo_valid(&data.display, data.pipe, data.output))
+		for_each_crtc_with_valid_output(&data.display, crtc,
+						data.output) {
+			data.pipe = crtc->pipe;
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, data.output))
 				continue;
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe), data.output->name)
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      data.output->name)
 				invalid_subtest(&data, fd);
 			/* one pipe/output combination is enough */
 				break;
@@ -655,17 +659,21 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Check the vblank and flip events works with given crtc id.");
 	igt_subtest_with_dynamic("crtc-id") {
-		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
-			if (!pipe_output_combo_valid(&data.display, data.pipe, data.output))
+		for_each_crtc_with_valid_output(&data.display, crtc,
+						data.output) {
+			data.pipe = crtc->pipe;
+			if (!pipe_output_combo_valid(&data.display, crtc->pipe, data.output))
 				continue;
 
-			if (!all_pipes && data.pipe != active_pipes[0] &&
-					  data.pipe != active_pipes[last_pipe]) {
-				igt_info("Skipping pipe %s\n", kmstest_pipe_name(data.pipe));
+			if (!all_pipes && crtc->pipe != active_pipes[0] &&
+					  crtc->pipe != active_pipes[last_pipe]) {
+				igt_info("Skipping pipe %s\n",
+					 igt_crtc_name(crtc));
 				continue;
 			}
 
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe), data.output->name)
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      data.output->name)
 				crtc_id_subtest(&data, fd);
 		}
 	}
-- 
2.52.0

