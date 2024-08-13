Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAFEC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 04:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC11B10E260;
	Tue, 13 Aug 2024 04:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CX7ggqpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C946210E260
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 04:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723522928; x=1755058928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vk5fDgJFNsrG4wtYli/2uFqkI2eTxEWeAGC9gz4ksZQ=;
 b=CX7ggqpLbBKRqDTgtZEo8T7K1E2MyYPEZQAhuNp6r4VCGZ2wvO+RY6gU
 6rJlISDlP+0nVO0dSShoNtTogE1apbeItmQDQ3GMCpzwJpPWErorhKDSs
 6gmQNiYwNqGsp54nols+cBozDCErKmxhRQrlraUrKEM5uFKH3lf7/d2gp
 O2GcNSyP1eHVNKkhvEWd2lN1jg4I7gGr5Iz/OWJCOim1C2cp1AeIR5XXx
 nDI/Jb+G8loNBeSgeLW8QWU/SHSl+TgB5Eie2aamWJpfrSABjRs96tdl+
 3N4AgEW6i4oDT7bCAVDVlp85/pvoX0ZNoeKLhHejPPgA5PFvK56FHx4+C Q==;
X-CSE-ConnectionGUID: JyiMtAtgQYan3hPRexjwDQ==
X-CSE-MsgGUID: xQ9t4UMuSY6bHZHv1eAWHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44186580"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="44186580"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:22:08 -0700
X-CSE-ConnectionGUID: tvvvyiMdTfCfSVdwxgw0tQ==
X-CSE-MsgGUID: RWSmUzmDS2KEHmhuGA07Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58210046"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 21:22:07 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 4/4] tests/kms_content_protection: Set screen red/green
 based on CP Status
Date: Tue, 13 Aug 2024 09:49:35 +0530
Message-ID: <20240813041936.4014668-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813041936.4014668-1-suraj.kandpal@intel.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
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

Set fb as red when HDCP is disabled and green when HDCP is enabled
rather than randomly setting the color.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 82a56167b..ea7f5b984 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -521,12 +521,11 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void prepare_modeset_on_mst_output(igt_output_t *output)
+static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int width, height;
-	enum pipe pipe = output->pending_pipe;
 
 	mode = igt_output_get_mode(output);
 
@@ -535,8 +534,8 @@ static void prepare_modeset_on_mst_output(igt_output_t *output)
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
-	igt_fb_set_size(pipe % 2 ? &data.red : &data.green, primary, width, height);
+	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
+	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
 	igt_plane_set_size(primary, width, height);
 }
 
@@ -733,7 +732,7 @@ test_content_protection_mst(int content_type)
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
 		igt_output_set_pipe(output, pipe);
-		prepare_modeset_on_mst_output(output);
+		prepare_modeset_on_mst_output(output, false);
 		dp_mst_outputs++;
 		if (output_hdcp_capable(output, content_type))
 			hdcp_mst_output[valid_outputs++] = output;
@@ -750,7 +749,7 @@ test_content_protection_mst(int content_type)
 		igt_require_f(found, "No valid mode combo found for MST modeset\n");
 
 		for (count = 0; count < valid_outputs; count++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[count]);
+			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
 
 		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
@@ -760,6 +759,13 @@ test_content_protection_mst(int content_type)
 
 	ret = test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
 
+	if (ret) {
+		for (i = 0; i < valid_outputs; i++)
+			prepare_modeset_on_mst_output(hdcp_mst_output[count], true);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+	}
+
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
 
-- 
2.43.2

