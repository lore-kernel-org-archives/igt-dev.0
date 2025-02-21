Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9191AC021AA
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 06:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10010E0E8;
	Fri, 21 Feb 2025 06:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VccGBF5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363D110E0E8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 06:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740117621; x=1771653621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PLIAYq1ixVJO7pMU5aGOX7iVLdHD4ec7O/B2UHJmTZs=;
 b=VccGBF5QWm26ZaeqV2s0JFUPEG4PZ1kLLMXjBIaoXeUO2zVmzCo4i1MI
 akow+n51doNwIwspDkXr76A8K0F11a2QmpRssUBMzNNFiYG/pvSJIjAsV
 rF9Xrr3TkF4mVgJstsV2x8JnjgYKtyvlQ/FlhvwKDQGnEQ+NrKSS4CFz4
 roANv9hDjNA+W+HnKXD1bQMjItLRptxaUmWEqybxjlMcTUyl9o5ebxwvC
 i7NhrsCbqGbf8GcLnLiVwzKUlFZYEL9m1pRYFBwfVQGA+xt1Ug+EMlHlQ
 dQw3ok15MosKF6qbpsP0myTLpcd3YgZ262xYK1TO0TatvjNRPhMvDyTMW A==;
X-CSE-ConnectionGUID: xz+zFeZBRwKloFP2bBq5eg==
X-CSE-MsgGUID: cOA2gIuTRJm7jo6SQYLX+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="28520836"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="28520836"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:00:20 -0800
X-CSE-ConnectionGUID: 0VgMptHQSy6pBWNmtOWdIw==
X-CSE-MsgGUID: H61ZzBdTT1S3dlD41g4CYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146173899"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 22:00:16 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: use in_formats_async for
 async modifiers
Date: Fri, 21 Feb 2025 11:26:47 +0530
Message-Id: <20250221055647.2014355-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221055647.2014355-1-santhosh.reddy.guddati@intel.com>
References: <20250221055647.2014355-1-santhosh.reddy.guddati@intel.com>
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

Add support for dynamic plane and modifiers in async flip with modifiers

V2: Improve run_test_with_modifiers to set data formats based on async
    formats.
    Update make_fb to use data formats instead of hard coded format

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4a72be7b5..38fc2ced4 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -126,6 +126,7 @@ typedef struct {
 	bool allow_fail;
 	struct buf_ops *bops;
 	bool atomic_path;
+	unsigned int plane_format;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -197,7 +198,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 
 	rec_width = width / (NUM_FBS * 2);
 
-	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
 			    data->modifier, 0.0, 0.0, 0.5, fb);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, fb);
@@ -718,17 +719,34 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
+		static int j;
 
-		for (int i = 0; i < data->plane->format_mod_count; i++) {
-			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+
+			/* Check if the format is already tested */
+			bool format_already_tested = false;
+
+			for ( ; j < i; j++) {
+				if (data->plane->async_formats[j] == data->plane->async_formats[i] &&
+				    data->plane->async_formats[j] != data->plane->async_modifiers[i]) {
+					format_already_tested = true;
+					j = i+1;
+					break;
+				}
+			}
+
+			if (format_already_tested)
 				continue;
 
 			data->allow_fail = true;
-			data->modifier = data->plane->modifiers[i];
+			data->modifier = data->plane->async_modifiers[i];
+			data->plane_format = data->plane->async_formats[i];
+
 
-			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
+			igt_dynamic_f("pipe-%s-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
-				      igt_fb_modifier_name(data->modifier)) {
+				      igt_fb_modifier_name(data->modifier),
+				      igt_format_str(data->plane_format)) {
 				      /*
 				       * FIXME: joiner+async flip is busted currently in KMD.
 				       * Remove this check once the issues are fixed in KMD.
@@ -761,6 +779,7 @@ igt_main
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+		data.plane_format = DRM_FORMAT_XRGB8888;
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
-- 
2.25.1

