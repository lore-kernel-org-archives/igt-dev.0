Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5090EC3DA61
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 11:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A31E10E788;
	Thu, 18 Jul 2024 11:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyLLYXpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9908310E788
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721300862; x=1752836862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GxJqcm7pyP8lWSbA9YxPaPo8ezPjI1fydeUUIG+JLeg=;
 b=HyLLYXpHAMX072MXzrOCGVFe8kgdk1BfRsNUmYIh3oyVXX1TByZteUYm
 QOIjUIztBN9+o6A9CsbX9Zf41kOAVc2L4K7TWhrqEX/Uaq9HE31OmDWMG
 GnAKVX4rrkC/ht5kBCTpD93FttyYRK8VeqfIZ0A5O6HhZj58pC+pRktRr
 C7abgoz0qRX0BPL/29PSVn2i2zBdFyxcBLY0/clNIKrdcn0pJSal+qam6
 lcM6D2yEMHb6npRtxQDtv50APKpHwWH0ZvXPPwTUPUzXMcCxtborxbbUU
 bjQR+gnzj5T5SQOF5K19SUIyulbUjfI5hfaDRiRDhehjokUzW0VraHXfA w==;
X-CSE-ConnectionGUID: jV7aDla7R8GZ4NZT+wCP+Q==
X-CSE-MsgGUID: 40a8kP8lTUezRarnboqaww==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="44277916"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="44277916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 04:07:42 -0700
X-CSE-ConnectionGUID: 2UXhBGSWRRauVi69wU8SKA==
X-CSE-MsgGUID: wZyttyzNRg2rd2NRvwD0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50678069"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:07:40 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 3/5] tests/kms_plane_scaling: Find display mode
 fitting in BW
Date: Thu, 18 Jul 2024 16:41:44 +0530
Message-ID: <20240718111146.665240-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
References: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
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

Ensure compatibility with driver scaling restrictions by setting
lower resolution for downscaling. Adjust test_planes_scaling_combo
function to lower resolution when cdclk requirements exceed
platform limits. Address issues caused by cdclk exceeding platform
capabilities.

Example for failure:
[drm:intel_compute_min_cdclk [xe]] required cdclk (1066500 kHz) exceeds max (652800 kHz)

v2: Fix some styling issues in the patch (Ankit)
v3: Split single plane and multi plane scaling
    functions arguments in separate patch (Ankit)
v4: Split single plane and multi plane scaling
    functions in separate patch (Ankit)
v5: Add return value to function __test_planes_scaling_combo,
    update test_planes_scaling_combo function, and add
    igt_debug prints
v6: Update commit subject/message and add return value on the
    igt_skp and igt_debug print (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 105 +++++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 48 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 8a69aacfd..2c4490fd3 100644
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
@@ -899,9 +899,10 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	igt_plane_set_fb(p1, NULL);
 	igt_plane_set_fb(p2, NULL);
 
-	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
-		      "Scaling op not supported by driver\n");
-	igt_assert_eq(ret, 0);
+	if (ret == -EINVAL || ret == -ERANGE)
+		igt_debug("Scaling op not supported by driver with %s\n",
+			 (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+	return ret;
 }
 
 static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
@@ -923,59 +924,67 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
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
+	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE, "Unsupported scaling operation "
+		      "in driver with return value %s\n",
+		      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 }
 
 static void
-- 
2.43.0

