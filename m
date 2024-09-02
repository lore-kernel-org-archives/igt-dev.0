Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E5FCD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2D410E340;
	Mon,  2 Sep 2024 14:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbokNrpV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3F410E345
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287939; x=1756823939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n9Gu+B2QewNWWbu2OAVVTspGj+ZjG5UZvWgzXS3KSu0=;
 b=BbokNrpVmx8//p4bjFAV6lcmVGIegvjvkgKC/hClGIDbMI9GPiRrHBgn
 25AWFWth7w0/ROrMVQVBH5Pl9pAhXH8Gii1mSTez5p+fFipCb6lmHvbT7
 CLCITZLKGQGlidSYGovjpd2IrCprxqYZJBfvGVPxwxIzybAZdZsPFuC+Q
 Io2qDlj2CuB9SMIOO5t2QKOFZFM9yc1ikrEhJkFal9HMlBqvaeKLhDPlZ
 bT5n9rRU9tPziGjtecPGFbaSDPTzqAiieK9+LWeedjzRCc5oX6bXxj7ZW
 5cg33T4FuPa1tFujovVHH/PCIhg1rdZ9L4DGJgTdicWx5wvwcsvHENbhN A==;
X-CSE-ConnectionGUID: XY2nw/RGQy2dtdEf0w67cQ==
X-CSE-MsgGUID: hsyPGN7zQIeY2QOAfWHg0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009525"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009525"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:59 -0700
X-CSE-ConnectionGUID: fS5qGKQ/ST6WTNkldTNW/A==
X-CSE-MsgGUID: tcILW68mTUu/h/O5GKKuPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639491"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 20/23] tests/kms_plane: Extract skip_format_mod()
Date: Mon,  2 Sep 2024 17:37:55 +0300
Message-ID: <20240902143758.21036-21-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We have a few different cases why format/modifier combos
need to be skipped. Pull the code to determine that into
a helper.

This also gives better debug logging for the msm UBWC case,
as previously there was none.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 56 ++++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 28df846d3a16..a6b5d4f8aa2a 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1003,6 +1003,31 @@ static void check_allowed_plane_size_64x64(data_t *data, igt_plane_t *plane,
 	igt_remove_fb(data->drm_fd, &test_fb);
 }
 
+static bool skip_format_mod(data_t *data,
+			    uint32_t format, uint64_t modifier,
+			    struct igt_vec *tested_formats)
+{
+	/* igt doesn't know how to sw generate UBWC: */
+	if (is_msm_device(data->drm_fd) &&
+	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
+		return true;
+
+	/* test each format "class" only once in non-extended tests */
+	if (!data->extended && modifier != DRM_FORMAT_MOD_LINEAR) {
+		struct format_mod rf = {
+			.format = igt_reduce_format(format),
+			.modifier = modifier,
+		};
+
+		if (igt_vec_index(tested_formats, &rf) >= 0)
+			return true;
+
+		igt_vec_push(tested_formats, &rf);
+	}
+
+	return false;
+}
+
 static bool test_format_plane(data_t *data, enum pipe pipe,
 			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
 {
@@ -1076,33 +1101,18 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			.modifier = plane->modifiers[i],
 		};
 
-		/* igt doesn't know how to sw generate UBWC: */
-		if (is_msm_device(data->drm_fd) &&
-		    f.modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
-			continue;
-
 		if (f.format == ref.format &&
 		    f.modifier == ref.modifier)
 			continue;
 
-		/* test each format "class" only once in non-extended tests */
-		if (!data->extended && f.modifier != DRM_FORMAT_MOD_LINEAR) {
-			struct format_mod rf = {
-				.format = igt_reduce_format(f.format),
-				.modifier = f.modifier,
-			};
-
-			if (igt_vec_index(&tested_formats, &rf) >= 0) {
-				igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
-					IGT_MODIFIER_FMT " on %s.%u\n",
-					IGT_FORMAT_ARGS(f.format),
-					IGT_MODIFIER_ARGS(f.modifier),
-					kmstest_pipe_name(pipe),
-					plane->index);
-				continue;
-			}
-
-			igt_vec_push(&tested_formats, &rf);
+		if (skip_format_mod(data, f.format, f.modifier, &tested_formats)) {
+			igt_debug("Skipping format " IGT_FORMAT_FMT " / modifier "
+				  IGT_MODIFIER_FMT " on %s.%u\n",
+				  IGT_FORMAT_ARGS(f.format),
+				  IGT_MODIFIER_ARGS(f.modifier),
+				  kmstest_pipe_name(pipe),
+				  plane->index);
+			continue;
 		}
 
 		if (f.format == DRM_FORMAT_C8) {
-- 
2.44.2

