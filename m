Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7605C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E7010E1EB;
	Wed, 17 Jul 2024 14:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbKdkR4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DA010E1C3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721228385; x=1752764385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zZ4ZCYbmpbOFDCxSPHrA4PbU0TjN+y1YlOiU1mTfPC8=;
 b=SbKdkR4A46AqTzlyHdGcUUex3ckHQ4y18KG29PrgB2hrOzTTjBDZ0h9t
 riVHvTjoQF/6PyZleGJWDwEuPlefhbXhlbHlFMEmDHr3533Xpg2JUZSYM
 IFaRX8KXX8aUU8DL5sMSZEOsT3b82doyzwlR/meUg26LOcVnFca5iSd7l
 9gc2iimDloRcm+wKID8eoVzFdY/BiBO1W55LurNOsTnCkPXqYgSJNgcMO
 CU8e3hVAQBpD0ziRaZOH61x/OiBD2FF0ZTeEFjxfZ24Lp/IZVTLJ9svLR
 sLK9pkIrjkR48SSXDPmT52V8napzbxeSuM0Y9ViBW/GHpqv7y8TNwtV5E g==;
X-CSE-ConnectionGUID: A9VvnKEkTbC16km+94btdw==
X-CSE-MsgGUID: ym36uT1RQLSu28HmSp2Xuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18354554"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18354554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:59:45 -0700
X-CSE-ConnectionGUID: uYi3ATdTThyunudNYWydCw==
X-CSE-MsgGUID: xJHRNfIUSW2tJwP+7C+94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87890820"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:59:43 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 3/5] tests/kms_plane_scaling: Improvise the planes
 scaling BW issues
Date: Wed, 17 Jul 2024 20:33:44 +0530
Message-ID: <20240717150346.650276-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717150346.650276-1-ramanaidu.naladala@intel.com>
References: <20240717150346.650276-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
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

Anticipating bandwidth issues, we expect many tests to fail. To
address these failures, we will switch to the next lower display
mode. Some higher display modes will be identified as insufficient
for downscaling operations on multi-plane scaling. As a solution,
we will implement a fix: when bandwidth is inadequate for current
modes, the test will automatically attempt the next lower
display mode.

v2: Fix some styling issues in the patch (Ankit)
v3: Split single plane and multi plane scaling
    functions arguments in separate patch (Ankit)
v4: Split single plane and multi plane scaling
    functions in separate patch (Ankit)
v5: Add return value to function __test_planes_scaling_combo,
    update test_planes_scaling_combo function, and add
    igt_debug prints.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 103 ++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 48 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 8a69aacfd..385f02df9 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -857,7 +857,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 	return pipe;
 }
 
-static void
+static int
 __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 			    enum pipe pipe, igt_output_t *output,
 			    igt_plane_t *p1, igt_plane_t *p2,
@@ -899,9 +899,9 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	igt_plane_set_fb(p1, NULL);
 	igt_plane_set_fb(p2, NULL);
 
-	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
-		      "Scaling op not supported by driver\n");
-	igt_assert_eq(ret, 0);
+	if (ret == -EINVAL || ret == -ERANGE)
+		igt_debug("Scaling op not supported by driver\n");
+	return ret;
 }
 
 static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
@@ -923,59 +923,66 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 	drmModeModeInfo *mode;
 	int n_planes;
 	int w1, h1, w2, h2;
+	int ret;
 
 	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
-	mode = igt_output_get_mode(output);
-
-	w1 = get_width(mode, sf_plane1);
-	h1 = get_height(mode, sf_plane1);
-	w2 = get_width(mode, sf_plane2);
-	h2 = get_height(mode, sf_plane2);
-
-	n_planes = display->pipes[pipe].n_planes;
-	igt_require(n_planes >= 2);
-
-	switch (test_type) {
-	case TEST_PLANES_UPSCALE:
-		setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
-		setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
-		break;
-	case TEST_PLANES_DOWNSCALE:
-		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
-		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
-		break;
-	case TEST_PLANES_UPSCALE_DOWNSCALE:
-		setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
-		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
-		break;
-	case TEST_PLANES_DOWNSCALE_UPSCALE:
-		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
-		setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
-		break;
-	default:
-		igt_assert(0);
-	}
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		igt_output_override_mode(output, mode);
+		igt_debug("Trying mode %dx%d\n",
+			  mode->hdisplay, mode->vdisplay);
+		w1 = get_width(mode, sf_plane1);
+		h1 = get_height(mode, sf_plane1);
+		w2 = get_width(mode, sf_plane2);
+		h2 = get_height(mode, sf_plane2);
+
+		n_planes = display->pipes[pipe].n_planes;
+		igt_require(n_planes >= 2);
+
+		switch (test_type) {
+		case TEST_PLANES_UPSCALE:
+			setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
+			setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
+			break;
+		case TEST_PLANES_DOWNSCALE:
+			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
+			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
+			break;
+		case TEST_PLANES_UPSCALE_DOWNSCALE:
+			setup_fb(display->drm_fd, w1, h1, &d->fb[1]);
+			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[2]);
+			break;
+		case TEST_PLANES_DOWNSCALE_UPSCALE:
+			setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, &d->fb[1]);
+			setup_fb(display->drm_fd, w2, h2, &d->fb[2]);
+			break;
+		default:
+			igt_assert(0);
+		}
 
-	for (int k = 0; k < n_planes - 1; k += 2) {
-		igt_plane_t *p1, *p2;
+		for (int k = 0; k < n_planes - 1; k += 2) {
+			igt_plane_t *p1, *p2;
 
-		p1 = &display->pipes[pipe].planes[k];
-		igt_require(p1);
-		p2 = &display->pipes[pipe].planes[k+1];
-		igt_require(p2);
+			p1 = &display->pipes[pipe].planes[k];
+			igt_require(p1);
+			p2 = &display->pipes[pipe].planes[k+1];
+			igt_require(p2);
 
-		if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
+			if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
 				continue;
-
-		__test_planes_scaling_combo(d, w1, h1, w2, h2,
-					    pipe, output, p1, p2,
-					    &d->fb[1], &d->fb[2],
-					    test_type);
+			ret = __test_planes_scaling_combo(d, w1, h1, w2, h2,
+							  pipe, output, p1, p2,
+							  &d->fb[1], &d->fb[2],
+							  test_type);
+			if (ret != 0)
+				break;
+		}
+		cleanup_fbs(d);
 	}
-
-	cleanup_fbs(d);
+	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
+		      "Scaling op not supported by driver\n");
 }
 
 static void
-- 
2.43.0

