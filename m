Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88583EC1EB5
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D41810E8A2;
	Thu,  5 Feb 2026 13:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N60iIPx3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C47C10E8A1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298244; x=1801834244;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Tyfo8nxwSRtGoiaqkUl/leaXyOYUbbSgtPzNBS+Z0Y4=;
 b=N60iIPx3DOP/u76/GnJVzGTSo1fV1Jp12XR9W23FkBRMLZZNITtfsioZ
 mUQo65Ev6rxSJO79gyTYJkgr2u9jNOHBlPc2zlYZ0oooSrhmni1zpjkJ6
 wmuqj2Zxgpck6GMZPY7I2a4x/2SuwuWnObD1frKKlmbCA5CxA9mfFzk3K
 ediV3PlVhrK2LGdIZbXV2LjGEMeAwoOH0Eo/cyKIXhKg2PvmfH2H3YjnN
 Uaee+qRlHTj4wsGXKeS6MLTT41ntPghWxosGhNMRg3FQIWQd61UPv4fRw
 fuXs24WOh+egnsat2E6YNnBdLqHnfuIndO4ZZoDFEl/EMgSztrXTa6BXV Q==;
X-CSE-ConnectionGUID: YN/4fXLDTeCfNbIBP+RjNw==
X-CSE-MsgGUID: AgtsPEdYTru0wbk2Cuvbhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693529"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693529"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:44 -0800
X-CSE-ConnectionGUID: MC/cRyRMQYqIla3pcWaCnQ==
X-CSE-MsgGUID: Bjt1ssToSqu3w68HotgHLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499285"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:43 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/12] tests/kms: Convert to for_each_crtc(), part 1
Date: Thu,  5 Feb 2026 15:30:13 +0200
Message-ID: <20260205133019.9161-7-ville.syrjala@linux.intel.com>
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

Done with cocci, with a slight manual fix up the data.pipe
assignment vs. variable declaration order within the loop
(couldn't come up with a good way to get coccinelle to do
that for me).

 #include "scripts/iterators.cocci"

@change@
iterator name for_each_pipe;
iterator name for_each_crtc;
expression DISPLAY, X;
identifier PIPE;
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_dirtyfb.c        | 11 +++++++----
 tests/intel/kms_fbc_dirty_rect.c | 25 ++++++++++++++++---------
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 407338affd6b..2611884ea8c4 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -353,6 +353,7 @@ static void run_test(data_t *data)
 
 int igt_main()
 {
+	igt_crtc_t *crtc;
 	data_t data = {};
 
 	igt_fixture() {
@@ -373,11 +374,13 @@ int igt_main()
 	     data.feature = data.feature >> 1) {
 		igt_describe_f("Test dirtyFB ioctl with %s", feature_str(data.feature));
 		igt_subtest_with_dynamic_f("%s-dirtyfb-ioctl", feature_str(data.feature)) {
-			for_each_pipe(&data.display, data.pipe) {
+			for_each_crtc(&data.display, crtc) {
 				int valid_tests = 0;
 
+				data.pipe = crtc->pipe;
+
 				for_each_valid_output_on_pipe(&data.display,
-							      data.pipe,
+							      crtc->pipe,
 							      data.output) {
 					data.mode = igt_output_get_mode(data.output);
 
@@ -396,13 +399,13 @@ int igt_main()
 
 					igt_display_reset(&data.display);
 					igt_output_set_crtc(data.output,
-							    igt_crtc_for_pipe(data.output->display, data.pipe));
+							    crtc);
 					if (!intel_pipe_output_combo_valid(&data.display))
 						continue;
 
 					valid_tests++;
 					igt_dynamic_f("%s-%s",
-						      kmstest_pipe_name(data.pipe),
+						      igt_crtc_name(crtc),
 						      igt_output_name(data.output)) {
 						prepare(&data);
 						run_test(&data);
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index c43acb7e9cb5..6c59a32bda16 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -439,6 +439,7 @@ static void fbc_dirty_rectangle_test(data_t *data, void (*test_func)(data_t *))
 
 int igt_main()
 {
+	igt_crtc_t *crtc;
 	data_t data = {0};
 
 	igt_fixture() {
@@ -458,14 +459,16 @@ int igt_main()
 		bool single_pipe = false;
 		data.feature = FEATURE_FBC;
 
-		for_each_pipe(&data.display, data.pipe) {
+		for_each_crtc(&data.display, crtc) {
+			data.pipe = crtc->pipe;
 			if (single_pipe)
 				break;
-			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
+			for_each_valid_output_on_pipe(&data.display,
+						      crtc->pipe, data.output) {
 				data.format = DRM_FORMAT_XRGB8888;
 
 				igt_dynamic_f("pipe-%s-%s",
-					       kmstest_pipe_name(data.pipe),
+					       igt_crtc_name(crtc),
 					       igt_output_name(data.output)) {
 					fbc_dirty_rectangle_test(&data,
 						fbc_dirty_rectangle_outside_visible_region);
@@ -481,14 +484,16 @@ int igt_main()
 		bool single_pipe = false;
 		data.feature = FEATURE_FBC;
 
-		for_each_pipe(&data.display, data.pipe) {
+		for_each_crtc(&data.display, crtc) {
+			data.pipe = crtc->pipe;
 			if (single_pipe)
 				break;
-			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
+			for_each_valid_output_on_pipe(&data.display,
+						      crtc->pipe, data.output) {
 				data.format = DRM_FORMAT_XRGB8888;
 
 				igt_dynamic_f("pipe-%s-%s",
-					       kmstest_pipe_name(data.pipe),
+					       igt_crtc_name(crtc),
 					       igt_output_name(data.output)) {
 					fbc_dirty_rectangle_test(&data,
 							fbc_dirty_rectangle_dirtyfb);
@@ -506,17 +511,19 @@ int igt_main()
 		bool single_pipe = false;
 		data.feature = FEATURE_FBC;
 
-		for_each_pipe(&data.display, data.pipe) {
+		for_each_crtc(&data.display, crtc) {
+			data.pipe = crtc->pipe;
 			if (single_pipe)
 				break;
-			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
+			for_each_valid_output_on_pipe(&data.display,
+						      crtc->pipe, data.output) {
 				for (int i = 0; i < num_formats; i++) {
 					/* on simulation platforms , limit to single format */
 					if (data.is_simulation && i > 0)
 						break;
 
 					igt_dynamic_f("pipe-%s-%s-format-%s",
-						       kmstest_pipe_name(data.pipe),
+						       igt_crtc_name(crtc),
 						       igt_output_name(data.output),
 						       igt_format_str(formats[i])) {
 						data.format = formats[i];
-- 
2.52.0

