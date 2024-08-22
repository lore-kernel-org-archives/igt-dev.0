Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B07FC5320E
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 06:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB3510E72C;
	Thu, 22 Aug 2024 06:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHjJW3ot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8440610E72A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 06:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724307268; x=1755843268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qFrW5yL+nwMD0dITr2c0D/kOhRt7yOUfYQH9e3oSnIs=;
 b=ZHjJW3otvKT+qWQBjNrvu7/gPmoDaEASIEjxD3e7tmAuXz+B1x8WDQFS
 +YDNGbRRpHqZ9g09Z7SybXuMf4ssxIvTmTJ/7nRmYraDjalynMj9Viu/1
 xSUCVdom9Jy/TXdmtPkpvTtqNanwWY7swq8girtn7iqMBc80uXLIYlqoH
 trUA6giWwIvEQdEEsUSgiofxYF75Csxwm03V7VlMvOzgSpbuZoygPiphq
 EqcLRGKK8bIzLF028Q9Z16KGqwRWj6szjGW6ub106aru1dOBNaFwX+CJP
 iuPXXrDca7ffopWkDQoFEeosLU20SAlWcG8buiv51mE0SwAs7qp9NeBgP w==;
X-CSE-ConnectionGUID: v4Aix9jgQZ+6/uzLaP40Ag==
X-CSE-MsgGUID: kzQcY3dqQuuNoBA3O2wdNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22225659"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22225659"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 23:14:28 -0700
X-CSE-ConnectionGUID: rywARDLnSL+QFUr6WI9uAw==
X-CSE-MsgGUID: lEj+8B56Ti2POo1bJrCF+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61329208"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2024 23:14:27 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 5/5] tests/kms_content_protection: Set screen red/green
 based on CP Status
Date: Thu, 22 Aug 2024 11:41:50 +0530
Message-ID: <20240822061150.4127413-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240822061150.4127413-1-suraj.kandpal@intel.com>
References: <20240822061150.4127413-1-suraj.kandpal@intel.com>
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
rather than randomly setting the color. This helps to visually
verify HDCP's enablement status rather than having to look at the
logs.

--v2
-Add reason for this change in commit message [Jeevan]

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_content_protection.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index d6c8344e2..3cb432ded 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -524,12 +524,11 @@ static bool sink_hdcp2_capable(igt_output_t *output)
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
 
@@ -538,8 +537,8 @@ static void prepare_modeset_on_mst_output(igt_output_t *output)
 
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

