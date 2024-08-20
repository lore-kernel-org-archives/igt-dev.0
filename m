Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955BBC5320E
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 08:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5045410E4F9;
	Tue, 20 Aug 2024 08:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QFiKQlQU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086C510E501
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 08:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724141708; x=1755677708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=muCBbOi6TV9lBzXZ+6RhLXZrB/KBW07FkPBHKhxqjgI=;
 b=QFiKQlQUetMONw7GLQJSu5zadlchCr/gboK4vNW2uRmXUR0nMSxCK1/f
 lvwuiLDPjcZW0gKILoIesWMlXiuq28fWMHYGIU5UBXPnCzjhvgdBv+zhs
 EZNIeeu7euwQ6OJVTk8ew+6j5o6T8jPgz9/bDZRgt5l2RU2OBX7K2wnte
 Tc8jDqoG4bah3bGn10GSS3w70Z/qkY2XNi0wLNdhJ4vTd+pL9M6aJYOlE
 jTy0miUfzw9w6Z553znX1L1zmgLZ/r+gj5wIGOvDB2yN4GPi655auvn9a
 RjW04UfeeoZXo4geFFUk8ggzee01jrg5SLOLriVy4fFZn99Nu64TwdZo3 A==;
X-CSE-ConnectionGUID: HRB0bALETIG2MY+DA1s9mA==
X-CSE-MsgGUID: hh4vVV5kSNSHVfGAToFy2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44948234"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="44948234"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:15:02 -0700
X-CSE-ConnectionGUID: fKQfpX6aTUqWN4UArW4J0g==
X-CSE-MsgGUID: rs7pEFDYTB+mxzBseIiIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="91418364"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2024 01:15:00 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 1/5] tests/kms_content_protection: Move HDCP output
 checks earlier
Date: Tue, 20 Aug 2024 13:42:28 +0530
Message-ID: <20240820081233.4092203-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240820081233.4092203-1-suraj.kandpal@intel.com>
References: <20240820081233.4092203-1-suraj.kandpal@intel.com>
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

Move the HDCP output check earlier when no. MST outputs are being
checked this will avoid us using an extra loop and an extra array.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index e9a468eb0..6bd744351 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -638,7 +638,7 @@ test_content_protection_mst(int content_type)
 	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
 	enum pipe pipe;
 	bool pipe_found;
-	igt_output_t *mst_output[IGT_MAX_PIPES], *hdcp_mst_output[IGT_MAX_PIPES];
+	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
 
 	for_each_pipe(display, pipe)
 		max_pipe++;
@@ -662,10 +662,13 @@ test_content_protection_mst(int content_type)
 
 		igt_output_set_pipe(output, pipe);
 		prepare_modeset_on_mst_output(output);
-		mst_output[dp_mst_outputs++] = output;
+		dp_mst_outputs++;
+		if (output_hdcp_capable(output, content_type))
+			hdcp_mst_output[valid_outputs++] = output;
 	}
 
 	igt_require_f(dp_mst_outputs > 1, "No DP MST set up with >= 2 outputs found in a single topology\n");
+	igt_require_f(valid_outputs > 1, "DP MST outputs do not have the required HDCP support\n");
 
 	if (igt_display_try_commit_atomic(display,
 				DRM_MODE_ATOMIC_TEST_ONLY |
@@ -674,22 +677,13 @@ test_content_protection_mst(int content_type)
 		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
 		igt_require_f(found, "No valid mode combo found for MST modeset\n");
 
-		for (count = 0; count < dp_mst_outputs; count++)
-			prepare_modeset_on_mst_output(mst_output[count]);
+		for (count = 0; count < valid_outputs; count++)
+			prepare_modeset_on_mst_output(hdcp_mst_output[count]);
 	}
 
 	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 	igt_require_f(ret == 0, "Commit failure during MST modeset\n");
 
-	for (count = 0; count < dp_mst_outputs; count++) {
-		if (!output_hdcp_capable(mst_output[count], content_type))
-			continue;
-
-		hdcp_mst_output[valid_outputs++] = mst_output[count];
-	}
-
-	igt_require_f(valid_outputs > 1, "DP MST outputs do not have the required HDCP support\n");
-
 	for (count = 0; count < valid_outputs; count++) {
 		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
 
-- 
2.43.2

