Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31345FD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C563810E76F;
	Wed, 25 Feb 2026 12:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI6QUwXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA3110E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023894; x=1803559894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bam/gb2QBSpkdPU71vQuzexOiBgy74CUdXe4R2YVMoE=;
 b=gI6QUwXm96TWif490F9iYjD28DTn1v4nUti1F795yAZ08/YWCd+Owrsc
 3NwD8owz1leCRdf02KVxlWOg0GyL+aDYaZysHPqTITQlhiYB5eiAdnVBe
 Edroq4fxn+05a3xfhchU0yGBFU/2xtJVEv/40WbdZzheOwGmqAQpCjGe1
 y6KXXY40bKJawZ0J7oCc5THb+haskR54dCCV31Ig9rFNzLtMFrDte6uJz
 t3OHqbMtyx1PlBOU66ku7TNDG8TFaKkSjQ2KQNzL7KWkuEVStnsZZJvG9
 To6uBL3zrbBJKvpRzgzEDBajvB/R/cnGu5Y2o9Fq949n/lahCpH47PkDU w==;
X-CSE-ConnectionGUID: EPcwUzImTzOh1KttdWmpJg==
X-CSE-MsgGUID: hxF9Sa3WRvS6soJkTIdGUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72934503"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72934503"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:34 -0800
X-CSE-ConnectionGUID: i7pZ6/CDRK6d47ffzr+z7w==
X-CSE-MsgGUID: NlEEmOTASaGfiEEYFz8q+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215331992"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:33 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/19] tests/kms: Use igt_first_crtc_with_single_output()
Date: Wed, 25 Feb 2026 14:50:55 +0200
Message-ID: <20260225125108.31119-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

A few kms tests (at least) don't really care what CRTC they run
on, as long as it's something with an output.

Replace the fixed 'igt_crtc_for_pipe(display, PIPE_A) +
igt_get_single_output_for_pipe()' combo (which may very well
fail) with igt_first_crtc_with_single_output() that will give
you something as long there's one valid CRTC+output combo
available.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/gem_exec_reloc.c | 6 ++----
 tests/kms_plane.c            | 6 +++---
 tests/kms_plane_scaling.c    | 9 +++------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index 53d8a1e9aa7e..ed4e77ec93d3 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -1516,10 +1516,8 @@ static void scanout(int i915,
 
 	igt_display_reset(dpy);
 
-	crtc = igt_crtc_for_pipe(dpy, PIPE_A);
-
-	output = igt_get_single_output_for_pipe(dpy, crtc->pipe);
-	igt_require(output);
+	crtc = igt_first_crtc_with_single_output(dpy, &output);
+	igt_require(crtc);
 
 	igt_output_set_crtc(output, crtc);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 8cef94a1f37e..30655b75c7ea 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1341,7 +1341,7 @@ test_pixel_formats(data_t *data, igt_crtc_t *crtc)
 static void test_planar_settings(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, PIPE_A);
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	igt_fb_t fb, fb_ref;
 	igt_plane_t *primary;
@@ -1363,8 +1363,8 @@ static void test_planar_settings(data_t *data)
 		igt_require(display_ver >= 9);
 	}
 
-	output = igt_get_single_output_for_pipe(&data->display, crtc->pipe);
-	igt_require(output);
+	crtc = igt_first_crtc_with_single_output(display, &output);
+	igt_require(crtc);
 
 	igt_output_set_crtc(output, crtc);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 893f2830b446..1d91ad1493b1 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1181,13 +1181,10 @@ static void invalid_parameter_tests(data_t *d)
 	};
 
 	igt_fixture() {
-		crtc = igt_crtc_for_pipe(display, PIPE_A);
-		output = igt_get_single_output_for_pipe(&d->display,
-							crtc->pipe);
-		igt_require(output);
+		crtc = igt_first_crtc_with_single_output(display, &output);
+		igt_require(crtc);
 
-		igt_output_set_crtc(output,
-				    crtc);
+		igt_output_set_crtc(output, crtc);
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_require(get_num_scalers(&d->display, crtc->pipe) >= 1);
-- 
2.52.0

