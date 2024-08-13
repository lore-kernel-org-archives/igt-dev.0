Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6FDC52D7C
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 04:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E36310E25E;
	Tue, 13 Aug 2024 04:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXZryNgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9810E25E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 04:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723522926; x=1755058926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gzxFvdhsCnpCvMZtlZK95iHcIbiyhRUk4Gh/x+6tH48=;
 b=JXZryNgrfIS6+SdjgQxLROmp1OTe4O6N/kSSG+yvQqC3Z2Jx57CSNMA3
 Dz+aNiWHsGBgPzboFFP9QvUv+zW5lNu5qqK4KgBWfsG50Hf9MPch2R27O
 xdl0zN8bR5O4ZoggqNUvl7NGDrrGaaw0Ck3h89mj3xlYJJA3c34PuyoYB
 fFcYQrSyr9Hvk7GHBklboHfXWv5/lIXv1XdxUiIfOm7cYbsq9+9hzpUZI
 TiJOneP/OLhA7V3HexRmNZbm0TukBTMYklLaF2h0w8pELY0G5ojWGfWmE
 fzmS3F9PTE+HH+yUCgdp5KOvAxTOM0pViQo6Qn8hJtEQhLqt5NeMzZw62 g==;
X-CSE-ConnectionGUID: 6MfRHHuHQ8mnuhVlPfiYOw==
X-CSE-MsgGUID: 1O86+4pLTfKrZO/+vkruyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44186579"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="44186579"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:22:06 -0700
X-CSE-ConnectionGUID: XDNoY2GCQ5CuOTtO/APBeQ==
X-CSE-MsgGUID: ONGS1d+1SHKErJMg33Sllw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58210043"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 21:22:05 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_content_protection: Add retry logic for
 mst usecase
Date: Tue, 13 Aug 2024 09:49:34 +0530
Message-ID: <20240813041936.4014668-4-suraj.kandpal@intel.com>
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

Add mst retry logic where it retries 3 times before failing the test.
After every retry mst setup needs to be disabled so we need to add a
function which disables mst in one commit.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 84 +++++++++++++++++++++++++++++-----
 1 file changed, 73 insertions(+), 11 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index db6dc17b1..82a56167b 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -278,6 +278,35 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style s,
 	return ret;
 }
 
+static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[], enum igt_commit_style s,
+				int valid_outputs)
+{
+	igt_display_t *display = &data.display;
+	igt_plane_t *primary;
+	bool ret;
+	int count;
+	u64 val;
+
+	for (count = 0; count < valid_outputs; count++) {
+		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, &data.red);
+		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
+					  CP_UNDESIRED);
+	}
+
+	igt_display_commit2(display, s);
+
+	ret = wait_for_prop_value(hdcp_mst_output[0], CP_UNDESIRED,
+				  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+	for (count = 1; count < valid_outputs; count++) {
+		val = igt_output_get_prop(hdcp_mst_output[count],
+					  IGT_CONNECTOR_CONTENT_PROTECTION);
+		ret &= (val == CP_UNDESIRED);
+	}
+
+	igt_assert_f(ret, "Content Protection not cleared\n");
+}
+
 static void test_cp_disable(igt_output_t *output, enum igt_commit_style s)
 {
 	igt_display_t *display = &data.display;
@@ -630,6 +659,49 @@ static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, b
 	}
 }
 
+static bool
+test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs,
+			      int retries, int content_type)
+{
+	igt_display_t *display = &data.display;
+	int retry_orig = retries, count;
+	bool ret;
+	u64 val;
+
+	do {
+		if (retry_orig != retries)
+			test_mst_cp_disable(hdcp_mst_output, COMMIT_ATOMIC, valid_outputs);
+
+		for (count = 0; count < valid_outputs; count++) {
+			igt_output_set_prop_value(hdcp_mst_output[count],
+						  IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
+
+			if (hdcp_mst_output[count]->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
+				igt_output_set_prop_value(hdcp_mst_output[count],
+							  IGT_CONNECTOR_HDCP_CONTENT_TYPE,
+							  content_type);
+		}
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+		ret = wait_for_prop_value(hdcp_mst_output[0], CP_ENABLED,
+					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		for (count = 1; count < valid_outputs; count++) {
+			val = igt_output_get_prop(hdcp_mst_output[count],
+						  IGT_CONNECTOR_CONTENT_PROTECTION);
+			ret &= (val == CP_ENABLED);
+		}
+
+		retries -= 1;
+		if (!ret || retries)
+			igt_debug("Retry %d/3\n", 3 - retries);
+	} while (retries && !ret);
+
+	igt_assert_f(ret, "Content Protection not enabled on MST output\n");
+
+	return ret;
+}
+
 static void
 test_content_protection_mst(int content_type)
 {
@@ -684,19 +756,9 @@ test_content_protection_mst(int content_type)
 		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
 	}
 
-	for (count = 0; count < valid_outputs; count++) {
-		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
-
-		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
-			igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
-	}
-
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	for (count = 0; count < valid_outputs; count++) {
-		ret = wait_for_prop_value(hdcp_mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
-		igt_assert_f(ret, "Content Protection not enabled on %s\n", hdcp_mst_output[count]->name);
-	}
+	ret = test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
 
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
-- 
2.43.2

