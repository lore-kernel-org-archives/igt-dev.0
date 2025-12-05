Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F13AD37492
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3D10EBA8;
	Fri,  5 Dec 2025 19:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3IaBtHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953AA10EBA8
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963991; x=1796499991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2LQVWHCnhspy5Q5JDeDTT4KX8EUI2vJs0xcjPJVE8vM=;
 b=C3IaBtHZvvFdrjgY/CCJPDIvQuKblZ38fCdSSJ/N77cWIZKq1y2EGf9i
 8S+eB6sc1qc2n4NxBY4oK+9LXMblXZ+Rn7++yGTvm2P3cX7GdJj6UIezJ
 jZ2cD/HOF8FQRtXtqSEfJAiRl1o/X77sgk4NWxcRo0j7fST8O0Ak2pCpQ
 2IdBxbwc8WBl1g9W+4AVUt4/u2+jAjSjOCBSMlvJQ2KZXxc96IQKd0S9U
 OIt6vYEQrueLPuMFpbHw66hAZbvjdiivzI5S7Nb93VrvuFbGkogCA/crA
 c96DyWe6OTlmkGmELa1bWBay618E+jKV6Ux9S3PfXg7tNutlnvveQ6L6A A==;
X-CSE-ConnectionGUID: DgOX3xqnTrGfL78w6giA1Q==
X-CSE-MsgGUID: FoBEu6svTKCc8NnZkcTyaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606667"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:31 -0800
X-CSE-ConnectionGUID: qyowkmqjTR2462kqzfiOEw==
X-CSE-MsgGUID: IvsUiQv0QTiMkYHtH9MKZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624898"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:30 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 09/13] tests/kms_color: Add helper for plane color pipeline tests
Date: Sat,  6 Dec 2025 01:23:08 +0530
Message-Id: <20251205195312.1234330-10-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205195312.1234330-1-swati2.sharma@intel.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
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

Add a helper to run plane color pipeline tests across
all pipes and outputs.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 576fd5329..a47c71f33 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -891,6 +891,10 @@ static void test_setup(data_t *data, enum pipe p)
 					  data->primary->pipe->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
+	igt_display_require_output_on_pipe(&data->display, p);
+	data->output = igt_get_single_output_for_pipe(&data->display, p);
+	igt_require(data->output);
+
 	igt_display_reset(&data->display);
 }
 
@@ -984,6 +988,40 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	test_cleanup(data);
 }
 
+__maybe_unused
+static void run_plane_color_tests(data_t *data,
+				  const color_t *fb_colors,
+				  const color_t *exp_colors,
+				  kms_colorop_t *colorops[])
+{
+	enum pipe pipe;
+
+	data->color_depth = 8;
+	data->drm_format = DRM_FORMAT_XRGB8888;
+
+	for_each_pipe(&data->display, pipe) {
+		test_setup(data, pipe);
+
+		data->mode = igt_output_get_mode(data->output);
+
+		if (!pipe_output_combo_valid(data, pipe)){
+			test_cleanup(data);
+			continue;
+		}
+
+		 /* TODO: extend the test to multiple planes (HDR & SDR) */
+		if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s",
+			      kmstest_pipe_name(pipe),
+			      igt_output_name(data->output))
+			igt_assert(test_plane_colorops(data, fb_colors, exp_colors, colorops));
+	}
+
+	test_cleanup(data);
+}
+
 static void
 run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 {
-- 
2.25.1

