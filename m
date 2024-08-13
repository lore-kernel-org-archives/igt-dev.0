Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2F7C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 04:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC01510E25A;
	Tue, 13 Aug 2024 04:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSVrpyxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19E810E245
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 04:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723522923; x=1755058923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=muCBbOi6TV9lBzXZ+6RhLXZrB/KBW07FkPBHKhxqjgI=;
 b=kSVrpyxZ2HxDUHcxkiFjZwUx6MvR2uNSp4Hb4xIVP9usn+g3IFDPCLuc
 sphQ5eVkebIO3JnkAzppCjRn6jb1h4QSbF2hkWtmFZk9xoqas3JtHOhAG
 GRfULTVOZfTiOUdrsK7lJzA4Fh9WyZrFDs4WIzkaoDmDPhb1harz7Tr1E
 Ekhvfp6MOCMI/vj2Vcdlsp+Jlpsjtrj0+a9mHPhtRLmXvKc/2WUI6dvlW
 UJ0oPyYOcq/mQ8vihwHyE9PZmJ5PYShujMA6Ekat5Y/QGEIvk5CQPPSJ0
 IDM7tAql7qiZAgugLOL3i+nV2FJoHyMxuexlF3xXLRD55ayVs+Ld0r6kf A==;
X-CSE-ConnectionGUID: o6F7wNlJTpOY7bHWNT3Z8w==
X-CSE-MsgGUID: ECAyiMcERsiYnAzi9QR59Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44186576"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="44186576"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:22:03 -0700
X-CSE-ConnectionGUID: 9x58NycCQnKbYZWVQDh3ug==
X-CSE-MsgGUID: mcmhnkuJQKOZo0DveSsZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58210036"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 21:22:02 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 1/4] tests/kms_content_protection: Move HDCP output
 checks earlier
Date: Tue, 13 Aug 2024 09:49:32 +0530
Message-ID: <20240813041936.4014668-2-suraj.kandpal@intel.com>
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

