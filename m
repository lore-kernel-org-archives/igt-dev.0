Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D183BC19F32
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 04:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5213B10EA2B;
	Thu, 27 Feb 2025 04:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3Ji/XaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060BE10EA3B
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 04:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740629978; x=1772165978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FDS497sDiRuAC+WqBfInokbWafciSCF6AxkAFrr/Ocg=;
 b=a3Ji/XaHEC4eOfXt9G9THIEQHU6a0YPehgqMNsflI0dhEtMaEQHsUW9c
 xFWkPk/7gdNBOYtzbtSoE9HTRoTDt4gUCzijgmC0KEhD7knBjuvq0+vJP
 EGV+aG8DPFzRUEDfWUE1GfjgZJYiXksK0UTqNx490UrpJqm7hsc0h8eso
 E4Z7YOdt+zMe3s/DgOwjDotHU01FqBLqALhiqQGrMJLZ2SmI5N2fnpUD9
 rBVDNBbRojignyFb0rYJ3AsEX3pdtor9d/VE6G2/Lxj3p5guavXWR0b+M
 EmzddYM3OQcCfsgz3jmpn8uyOSJN8e2uIo6H/0g7vjLLOjWwxTHuQV8JP A==;
X-CSE-ConnectionGUID: fQUykffZQVagConRkZByFA==
X-CSE-MsgGUID: ZwXUq9hsTRCGbLz89k+/yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44331557"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="44331557"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:19:37 -0800
X-CSE-ConnectionGUID: f+imtm3ZQJ22zqXzCf9RQg==
X-CSE-MsgGUID: vGf0dRYJTEeI84ow+M1u5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117396421"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 20:19:37 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/kms_async_flips: Use 'IN_FORMATS_ASYNC'
 property
Date: Thu, 27 Feb 2025 09:45:45 +0530
Message-Id: <20250227041545.2465720-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227041545.2465720-1-santhosh.reddy.guddati@intel.com>
References: <20250227041545.2465720-1-santhosh.reddy.guddati@intel.com>
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

Utilise IN_FORMATS_ASYNC property exposed to get the list of
async supported modifier/format pair and improve the test coverage by
iterating through all the supported modifier format pairs.

V2: Improve run_test_with_modifiers to set data formats based on async
    formats.
    Update make_fb to use data formats instead of hard coded format

V3: Update commit message, remove complicated iterations (Chaitanya)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4a72be7b5..692fbb31d 100644
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
@@ -719,16 +720,17 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
 
-		for (int i = 0; i < data->plane->format_mod_count; i++) {
-			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
-				continue;
-
-			data->allow_fail = true;
-			data->modifier = data->plane->modifiers[i];
-
-			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
-				      data->output->name,
-				      igt_fb_modifier_name(data->modifier)) {
+		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
+			data->modifier = data->plane->format_mod_pair[i].modifier;
+			for (int j = 0; j < data->plane->format_mod_pair[i].list.count; j++) {
+				data->plane_format =
+					data->plane->format_mod_pair[i].list.formats[j];
+
+				data->allow_fail = true;
+				igt_dynamic_f("pipe-%s-%s-%s-%s", kmstest_pipe_name(data->pipe),
+					       data->output->name,
+					       igt_fb_modifier_name(data->modifier),
+					       igt_format_str(data->plane_format)) {
 				      /*
 				       * FIXME: joiner+async flip is busted currently in KMD.
 				       * Remove this check once the issues are fixed in KMD.
@@ -739,6 +741,7 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 						    "on joiner mode\n");
 				      test_init_fbs(data);
 				      test(data);
+				}
 			}
 		}
 	}
@@ -761,6 +764,7 @@ igt_main
 
 		if (is_intel_device(data.drm_fd))
 			data.bops = buf_ops_create(data.drm_fd);
+		data.plane_format = DRM_FORMAT_XRGB8888;
 	}
 
 	igt_describe("Verify the async flip functionality and the fps during async flips");
-- 
2.34.1

