Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0432FD530E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488FE10EA52;
	Fri, 27 Feb 2026 08:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsxTWwZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5011710EA52
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179622; x=1803715622;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uGYD1wh+yD462hK22pKJ7Xwaz3ysjIX0+hxQTQ5f1ag=;
 b=jsxTWwZXeYxTBuNHO0FjlQTmevn+VfFaFkEyGw3UB0+F6AlKWA2vROmh
 RltITF6/dz1uL/r5VUntyzN90ZGisXR5D7HKlHy8EGveXGdz4IrIAFoPy
 sdHMUbXMMRIGn13c+b3EV9FIo1hyRWKuLWbtTWRDHRnQvp5XljoJ6zfxV
 dknPpJ6hlaFd+1de8Y0YbFeVhmLB84I+pqAnXRwtfnCv1FioBdcuuzl29
 X6mdbI636CC3XB7OqHx2o9mEHWeoR8+Ft2UaysBIHA3iWkgZCiKWq8DGm
 qXzVWPy0wQPzSqUQ2T7bERrUPGNWcxrNp+UmJOrmHJpx1kniW8KunOMFQ g==;
X-CSE-ConnectionGUID: 2T5nAYnhQcOfG+ff3FJ5bg==
X-CSE-MsgGUID: R3tIMhLSRa2CdM6PVE+Y4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83964461"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="83964461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:02 -0800
X-CSE-ConnectionGUID: TofQdIGORBO9+eq+rtsLuA==
X-CSE-MsgGUID: 0gdUHPLxR/OTQ7mkL8eFuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="247348507"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:01 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/17] lib/kms: Replace igt_pipe_has_valid_output() with
 igt_crtc_has_valid_output()
Date: Fri, 27 Feb 2026 10:06:37 +0200
Message-ID: <20260227080653.30389-2-ville.syrjala@linux.intel.com>
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

Rename igt_pipe_has_valid_output() into igt_crtc_has_valid_output()
and pass in the full igt_crtc_t*.

And since we already have the crtc the igt_require_pipe() call
no longer makes any sense. Move that into the one caller
(igt_display_require_output_on_pipe()) where it might matter.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6087de365a82..7454d16780f9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2821,15 +2821,12 @@ static void igt_require_pipe(igt_display_t *display, enum pipe pipe)
 			kmstest_pipe_name(pipe));
 }
 
-static bool igt_pipe_has_valid_output(igt_display_t *display, enum pipe pipe)
+static bool igt_crtc_has_valid_output(igt_crtc_t *crtc)
 {
+	igt_display_t *display = crtc->display;
 	igt_output_t *output;
 
-	igt_require_pipe(display, pipe);
-
-	for_each_valid_output_on_crtc(display,
-				      igt_crtc_for_pipe(display, pipe),
-				      output)
+	for_each_valid_output_on_crtc(display, crtc, output)
 		return true;
 
 	return false;
@@ -2949,7 +2946,7 @@ void igt_display_reset_outputs(igt_display_t *display)
 	for_each_crtc(display, crtc) {
 		igt_output_t *output;
 
-		if (!igt_pipe_has_valid_output(display, crtc->pipe))
+		if (!igt_crtc_has_valid_output(crtc))
 			continue;
 
 		output = igt_get_single_output_for_pipe(display, crtc->pipe);
@@ -3266,7 +3263,9 @@ void igt_display_require_output(igt_display_t *display)
  */
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe)
 {
-	if (!igt_pipe_has_valid_output(display, pipe))
+	igt_require_pipe(display, pipe);
+
+	if (!igt_crtc_has_valid_output(igt_crtc_for_pipe(display, pipe)))
 		igt_skip("No valid connector found on pipe %s\n", kmstest_pipe_name(pipe));
 }
 
-- 
2.52.0

