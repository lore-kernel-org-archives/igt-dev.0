Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E705C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 15:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD7E10E424;
	Mon, 15 Jul 2024 15:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnI9VoZU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F079310E424
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 15:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721058153; x=1752594153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=021lB6YkNv3B3+0LMTqB3ho41vj/B5UEHELT4NpJP6s=;
 b=FnI9VoZUCCc25+92GUDSnCNruq26T9dLvWx+fdDNRVyvak6i4O43haX5
 /yRfuEIY0eIvf48iw3usEi1bZVyKiKZv/8Hey/2bsFgpn8ryAsoN15gDs
 WEcRQnVw8uYRT/C7uABgCU7xLXMASPdzG6nnO9awGaA1b+Xk9sZwRANlh
 0G5NaTEigByzXh1YOZDUnWxgdvtzeQ4jU0oqJ3AAmfAHg3FE20BLFIMOR
 MarFPMHnwbQ+tD0VTWG8MwqZoIDM2v2CeBgw3pYx06SqJpHTdEZcsQYM5
 Wb5FnqR/exJOfxPhea5k7tVvO1GWPQn8pLe2FJCSUw/dcLNJe9bvnn70g g==;
X-CSE-ConnectionGUID: D5P8kVIITpqHiNPywhFO4w==
X-CSE-MsgGUID: 4x/QclNvQUSITsMVfMf9Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="35987968"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="35987968"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 08:42:24 -0700
X-CSE-ConnectionGUID: bAMfz8CES329kcBkcv4VHQ==
X-CSE-MsgGUID: aknQf55LRB6SgbdMKc4DeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49408721"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 08:42:22 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 3/5] tests/kms_plane_scaling: Improvise the planes
 scaling BW issues
Date: Mon, 15 Jul 2024 21:16:26 +0530
Message-ID: <20240715154628.583682-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
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
address these failures, we will switch to the next lowest display
modes. Some higher display modes will be identified as insufficient
for downscaling operations on multi-plane scaling. As a solution,
we will implement a fix: when bandwidth is inadequate for current
modes, the system will automatically attempt the next lower
display mode.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 72 +++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 33 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 0048e6e51..1702ec8c8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -865,43 +865,49 @@ __test_planes_scaling_combo(data_t *d, double sf_plane1,
 	int ret;
 	int w1, h1, w2, h2;
 
-	mode = igt_output_get_mode(output);
-	w1 = get_width(mode, sf_plane1);
-	h1 = get_height(mode, sf_plane1);
-	w2 = get_width(mode, sf_plane2);
-	h2 = get_height(mode, sf_plane2);
-
-	igt_plane_set_fb(p1, fb1);
-	igt_plane_set_fb(p2, fb2);
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		w1 = get_width(mode, sf_plane1);
+		h1 = get_height(mode, sf_plane1);
+		w2 = get_width(mode, sf_plane2);
+		h2 = get_height(mode, sf_plane2);
+
+		igt_plane_set_fb(p1, fb1);
+		igt_plane_set_fb(p2, fb2);
+
+		switch (test_type) {
+		case TEST_PLANES_UPSCALE:
+			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
+			igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
+			break;
+		case TEST_PLANES_DOWNSCALE:
+			igt_plane_set_size(p1, w1, h1);
+			igt_plane_set_size(p2, w2, h2);
+			break;
+		case TEST_PLANES_UPSCALE_DOWNSCALE:
+			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
+			igt_plane_set_size(p2, w2, h2);
+			break;
+		case TEST_PLANES_DOWNSCALE_UPSCALE:
+			igt_plane_set_size(p1, w1, h1);
+			igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
+			break;
+		default:
+			igt_assert(0);
+		}
 
-	switch (test_type) {
-	case TEST_PLANES_UPSCALE:
-		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
-		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
-		break;
-	case TEST_PLANES_DOWNSCALE:
-		igt_plane_set_size(p1, w1, h1);
-		igt_plane_set_size(p2, w2, h2);
-		break;
-	case TEST_PLANES_UPSCALE_DOWNSCALE:
-		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
-		igt_plane_set_size(p2, w2, h2);
-		break;
-	case TEST_PLANES_DOWNSCALE_UPSCALE:
-		igt_plane_set_size(p1, w1, h1);
-		igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
-		break;
-	default:
-		igt_assert(0);
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+		if (ret == 0)
+			break;
 	}
-
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
 	igt_plane_set_fb(p1, NULL);
 	igt_plane_set_fb(p2, NULL);
-
-	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
-		      "Scaling op not supported by driver\n");
+	igt_plane_set_position(p1, 0, 0);
+	igt_plane_set_position(p2, 0, 0);
+	cleanup_fbs(d);
+	igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+			"Unsupported scaling factor\n");
 	igt_assert_eq(ret, 0);
 }
 
-- 
2.43.0

