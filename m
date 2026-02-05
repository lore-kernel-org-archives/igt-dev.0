Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A401EC1EB3
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BB710E8A3;
	Thu,  5 Feb 2026 13:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMfOoCsD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116E810E8A1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298244; x=1801834244;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LtXE9rUwD+zSwE6ooK2SL0VUhXs95bBU6hSVWKgP2Cw=;
 b=HMfOoCsDpQeOmytirvSeTnyjwoAMqIO05Mvh1ZDkNCNEM81svsM3vdcn
 2VKuzPrb6gTDVqtWRvLYuLl3joPLIHxao8HnFB9BCSaTIh3tqIlwYkc/4
 Kr5upLGQr//ru3af4xYtNYv0NDFQncBdbiiwKuHNci3l1Tzxc50nLVTcl
 U2fOG4Wk1Sa9twCi6mBd9qX0y/tWS1qCvmByKhVYpWXhqqGaOQ2PZgDMQ
 GSr9KKMLSiGD23Qu25RDaiwnzMA2V+DiKXBRFs2lCSMcGMIZs8xqCao/s
 +gfQmpOd0g4fJYxoFILHBzuNYx1kDXY1ndaG9i8foVefnCITO+VILCrRe Q==;
X-CSE-ConnectionGUID: hvkFWpivTwSVrheCl/W8bA==
X-CSE-MsgGUID: a50aUyE8SLa80EINn9HptA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71390591"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71390591"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:29 -0800
X-CSE-ConnectionGUID: ZxUdbWFtQ5KWPCbMO/b8Sg==
X-CSE-MsgGUID: fyAxbK1CSle2zgXWpGTvbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215020995"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:28 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/12] tests/intel/kms_legacy_colorkey: Convert to
 for_each_crtc()
Date: Thu,  5 Feb 2026 15:30:09 +0200
Message-ID: <20260205133019.9161-3-ville.syrjala@linux.intel.com>
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

Replace the for_each_pipe() with for_each_crtc().
kms_legacy_colorkey is a bit of a special case becasue
the iterator is a file level static variable.

Done with cocci:
 #include "scripts/iterators.cocci"

@find@
iterator name for_each_pipe;
identifier PIPE;
@@
for_each_pipe(..., PIPE) { ... }

@change depends on find@
typedef igt_crtc_t;
identifier find.PIPE;
@@
- static int PIPE;
+ static igt_crtc_t *crtc;

@depends on find && change@
iterator name for_each_crtc;
identifier find.PIPE;
expression DISPLAY;
@@
- for_each_pipe(DISPLAY, PIPE)
+ for_each_crtc(DISPLAY, crtc)
{
<...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_legacy_colorkey.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
index b720ccf4394b..15def4f35936 100644
--- a/tests/intel/kms_legacy_colorkey.c
+++ b/tests/intel/kms_legacy_colorkey.c
@@ -44,7 +44,7 @@ IGT_TEST_DESCRIPTION("Check that the legacy set colorkey ioctl only works on spr
 
 static int drm_fd;
 static igt_display_t display;
-static int p;
+static igt_crtc_t *crtc;
 static igt_plane_t *plane;
 static uint32_t max_id;
 
@@ -66,8 +66,8 @@ int igt_main()
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&display, drm_fd);
-		for_each_pipe(&display, p) {
-			for_each_plane_on_pipe(&display, p, plane) {
+		for_each_crtc(&display, crtc) {
+			for_each_plane_on_pipe(&display, crtc->pipe, plane) {
 				max_id = max(max_id, plane->drm_plane->plane_id);
 			}
 		}
@@ -77,9 +77,10 @@ int igt_main()
 	igt_describe("Test to check the legacy set colorkey ioctl "
 		     "only works for sprite planes.\n");
 	igt_subtest_with_dynamic("basic") {
-		for_each_pipe(&display, p) {
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(p)) {
-				for_each_plane_on_pipe(&display, p, plane) {
+		for_each_crtc(&display, crtc) {
+			igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
+				for_each_plane_on_pipe(&display, crtc->pipe,
+						       plane) {
 					bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
 							 plane->type == DRM_PLANE_TYPE_CURSOR);
 
-- 
2.52.0

