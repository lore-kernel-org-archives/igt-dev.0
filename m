Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08993C5DF70
	for <igt-dev@archiver.kernel.org>; Sat, 21 Feb 2026 03:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD6310E865;
	Sat, 21 Feb 2026 03:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYuGkCXT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6310E865
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Feb 2026 03:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771644076; x=1803180076;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=k2Lq4IHnait7LOn9ffgxUebn65lk8QtFwZcgblux8ZE=;
 b=dYuGkCXTTV/8sVIsTEngPBi2HFWPqubYgUjOyG1b7/x63VBdghJgC6Gx
 ppeFUpDptlFOm6Bxr01Fg0i/x5sdZFWITl0OHeeWBsHiAJFobHNRaWTJM
 B8k6aO6u/5IC78e4EPettlXyN5SzvmjxxWwyKqkTX/S17ByLcJcq+M37h
 F2RCMjAG1HRGLhxhXpVxmgdkJJZY9bLWG/9JOt67G7ilWqqWKvdhonVsn
 U/0L6tfNKNc6gyv1AljWsXS0BDPwTZBdJqdFmIJct5ht99od8xNYZKtEn
 5ZfRnPrxp5L9WffRVqhTrxCMtCX+cxnlKv3ELy27CilfdM028QFM70hMx g==;
X-CSE-ConnectionGUID: oSK2iG9LTOKi69c3zKZU2A==
X-CSE-MsgGUID: SyfYM49ORqegQsS1UGEG6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76597966"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="76597966"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:16 -0800
X-CSE-ConnectionGUID: pJKQd4GqTKCVNsCrfxvJ2w==
X-CSE-MsgGUID: Jc841AePTMO95+Uz4arZCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214128815"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.139])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 19:21:15 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 18/23] tests/kms_prime: Use igt_crtc_t instead of
 enum pipe
Date: Sat, 21 Feb 2026 05:19:57 +0200
Message-ID: <20260221032003.30936-19-ville.syrjala@linux.intel.com>
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

Convert kms_prime to use igt_crtc_t instead of enum pioe .

The complication here is that setup_display() returns
the pipe/crtc via a pointer passed as a function argument.

 #include "scripts/iterators.cocci"

@ret_pipe@
typedef igt_output_t;
typedef igt_crtc_t;
identifier FUNC, PIPE;
expression CRTC;
parameter list[N] P;
@@
FUNC(P
- ,enum pipe *PIPE
+ ,igt_crtc_t **ret_crtc
   ,...)
{
<...
- *PIPE = CRTC->pipe;
+ *ret_crtc = CRTC;
...>
}

@depends on ret_pipe@
identifier ret_pipe.FUNC, PIPE;
expression list[ret_pipe.N] EP;
expression E;
@@
  enum pipe PIPE;
+ igt_crtc_t *crtc;
...
FUNC(EP,
- &PIPE
+ &crtc
  ,...)
<...
- PIPE
+ crtc->pipe
...>

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
 tests/kms_prime.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 7b13e9f538e1..bb85b2e2e0da 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -116,14 +116,14 @@ static bool has_prime_export(int fd)
 }
 
 static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
-				   enum pipe *pipe)
+				   igt_crtc_t **ret_crtc)
 {
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 	bool found = false;
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
-		*pipe = crtc->pipe;
+		*ret_crtc = crtc;
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
@@ -388,7 +388,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 	igt_display_t display;
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct igt_fb fb;
 	int dmabuf_fd;
 	struct dumb_bo scratch = {};
@@ -400,10 +400,10 @@ static void test_crc(int exporter_fd, int importer_fd)
 	igt_require_pipe_crc(importer_fd);
 	igt_display_require(&display, importer_fd);
 
-	output = setup_display(importer_fd, &display, &pipe);
+	output = setup_display(importer_fd, &display, &crtc);
 
 	mode = igt_output_get_mode(output);
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&display, pipe),
+	pipe_crc = igt_crtc_crc_new(crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for (i = 0; i < ARRAY_SIZE(colors); i++) {
@@ -458,7 +458,7 @@ static void test_basic_modeset(int drm_fd)
 {
 	igt_display_t display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
 	uint32_t bo;
@@ -468,7 +468,7 @@ static void test_basic_modeset(int drm_fd)
 	igt_device_set_master(drm_fd);
 	igt_display_require(&display, drm_fd);
 
-	output = setup_display(drm_fd, &display, &pipe);
+	output = setup_display(drm_fd, &display, &crtc);
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
-- 
2.52.0

