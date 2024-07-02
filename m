Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ACDC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F6110E6F8;
	Tue,  2 Jul 2024 23:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STpxxf5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FA910E6F8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962984; x=1751498984;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=isqT4fHKCqueQfvLBW0+qhDgk6tPZkMYZghAhQT/gb4=;
 b=STpxxf5vejJ43sgDArQ/XAHF4BjdSPF2vPmpjLCSM/MBbE5RIy7cU3oV
 1bo0V12JBNSthLOf9boVVSOYlfTnmVhFG6ghbehDie8yqElWlauCHFFEB
 RKJJinHHIhKUNjGWgYlcrRPOrmM6uFDvubt6iw/XqN7C9tdPlie4ICWRS
 /fzoWI6QsWZUv0Fv37k7Y50q2aclS56+2HUXgvkPLQYO9WJw20XoqaNPY
 xQ1hEZI2BT+aL7t/JtK8E4SvV6BXEVFQgNcZv9oZYPh+Jz6tu/Z+n0Fbe
 G27X1CXb7EksHnbPNEx2/Q5sck3YXHAN/kFogAEEBD4/Ne0+ckiRNoShG Q==;
X-CSE-ConnectionGUID: 3WpFckamQ2Chov/rmKXBRA==
X-CSE-MsgGUID: GKIAA8LqQKeHPz+xZL/e2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559680"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:44 -0700
X-CSE-ConnectionGUID: BsC69chGQOSwPNVaLICTGg==
X-CSE-MsgGUID: AQF+7GXfQ+2vPfqBCqEGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043916"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 30/37] tests/kms_plane: Extract skip_format_mod()
Date: Wed,  3 Jul 2024 02:28:10 +0300
Message-ID: <20240702232817.31147-31-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 56 ++++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index aac8e3ef01f1..8b6fc1cf6aa4 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1002,6 +1002,31 @@ static void check_allowed_plane_size_64x64(data_t *data, igt_plane_t *plane,
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
@@ -1075,33 +1100,18 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
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

