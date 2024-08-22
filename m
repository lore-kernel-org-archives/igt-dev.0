Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59880C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 06:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C02710E72A;
	Thu, 22 Aug 2024 06:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DF47X3wT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD3B10E729
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 06:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724307266; x=1755843266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IbmkyjApP9W7E/VXv8FgB9vbtR92BdE4jGD6ej/IurU=;
 b=DF47X3wT0GIGixeQGv5YbcqLXOc7bT3HYH10kRoxAALN7Z1ZKO31hdSS
 iTETb6s9jubMw6O5ryGclZ7tJX0tjp6c3hvl+RCWSedqEZ/D7KVMeZjN4
 mlWB3azDl4p6dVB21PHBNjjWwcGDYM6pLIbMT0ZBhF8qX8Tns4fPg8j2Q
 HyhGQvTvS0Zcu6qSj5/kj9/XhbnY6tqECeujANP6B+NFWpZkb4s56sszn
 yWwxUfhvjli4ScGkBvdNBdqhjjC4CPfVGg6IN8QoCZvtRN09hGGjAQPNZ
 bVXhpOR29gAfXYwB9m+5vnYgC0R8foVpO9m/rigwOLVEpbC5CQgwdkfq7 w==;
X-CSE-ConnectionGUID: 7kI55DSjS2eIMsWK9g2oBQ==
X-CSE-MsgGUID: CN+wvoUBQ0igBY+i9iaDEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22225648"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22225648"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 23:14:26 -0700
X-CSE-ConnectionGUID: SlSOL807SwWPq4CdEXINEw==
X-CSE-MsgGUID: bNMzDuXmSa+H9CxlVtpdAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61329195"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2024 23:14:24 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 4/5] tests/kms_content_protection: Add retry logic for
 mst usecase
Date: Thu, 22 Aug 2024 11:41:49 +0530
Message-ID: <20240822061150.4127413-5-suraj.kandpal@intel.com>
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

Add mst retry logic where it retries 3 times before failing the test.
After every retry mst setup needs to be disabled so we need to add a
function which disables mst in one commit.

--v2
-Fix enum declaration name [Jeevan]
-Add more elaborate debug message [Jeevan]

--v3
-Instead of removing wait time for subsequent CP connector status
check reduce it to 100msec

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 83 +++++++++++++++++++++++++++++-----
 1 file changed, 72 insertions(+), 11 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 473686939..d6c8344e2 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -124,6 +124,7 @@ struct data {
 #define LIC_PERIOD_MSEC				(4 * 1000)
 /* Kernel retry count=3, Max time per authentication allowed = 6Sec */
 #define KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6 * 1000)
+#define KERNEL_AUTH_TIME_ADDITIONAL_MSEC	100
 #define KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
 #define FLIP_EVENT_POLLING_TIMEOUT_MSEC		1000
 
@@ -278,6 +279,36 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
 	return ret;
 }
 
+static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
+				enum igt_commit_style commit_style,
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
+	igt_display_commit2(display, commit_style);
+
+	ret = wait_for_prop_value(hdcp_mst_output[0], CP_UNDESIRED,
+				  KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+	for (count = 1; count < valid_outputs; count++) {
+		val = igt_output_get_prop(hdcp_mst_output[count],
+					  IGT_CONNECTOR_CONTENT_PROTECTION);
+		ret &= (val == CP_UNDESIRED);
+	}
+
+	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
+}
+
 static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
@@ -631,6 +662,46 @@ static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, b
 	}
 }
 
+static bool
+test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs,
+			      int retries, int content_type)
+{
+	igt_display_t *display = &data.display;
+	int retry_orig = retries, count;
+	bool ret;
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
+		for (count = 1; count < valid_outputs; count++)
+			ret &= wait_for_prop_value(hdcp_mst_output[count], CP_ENABLED,
+						  KERNEL_AUTH_TIME_ADDITIONAL_MSEC);
+
+		retries -= 1;
+		if (!ret || retries)
+			igt_debug("Retry %d/3\n", 3 - retries);
+	} while (retries && !ret);
+
+	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
+
+	return ret;
+}
+
 static void
 test_content_protection_mst(int content_type)
 {
@@ -685,19 +756,9 @@ test_content_protection_mst(int content_type)
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

