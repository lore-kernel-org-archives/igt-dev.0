Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720FCC531DF
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 06:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F77F10E726;
	Thu, 22 Aug 2024 06:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0Day//o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013FD10E726
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 06:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724307263; x=1755843263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FUbrjNGJ4YUpVa79vOGnpwbmWhgmVWqv0nkA3vxj4VE=;
 b=U0Day//oePNhJrwkC3pzJDxJ1wCJWARkrJYo6e1l6g10clOFifrFXWWU
 cDPW1Ar0ZDgpoTPG6/A73AS4FvSNy3im6oePxJr61Hd3+jv9loW0wEwMN
 6ehNvIhaBvdXkefGEJbbaM3MkFycNuZ7WZnH1xKAVjedrv+W6Dmn3nfrO
 +yZGe5WZ+/w2Vgji7BO6xtTdsZampYp0VHuI8e/pKtj2XxjoQlaBZMaSQ
 jRgJhfRXkyxTve7O/ShQL5895q70gCeHtMhIhsqDWgYjrzr3GGfH9iV6O
 e8xHy5KG2mQoFyu3sfAqUcXlcppdCns1Uk8fa0SMqiI6NOCOSTjCYcwdt Q==;
X-CSE-ConnectionGUID: VinOmKpnSh6U84QQS1QseA==
X-CSE-MsgGUID: asdckF0xRUChU8sJ4wFbaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22225621"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22225621"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 23:14:22 -0700
X-CSE-ConnectionGUID: 5HZcr6CNT0yt37FUinnABg==
X-CSE-MsgGUID: 7mS3sJASRYuRBdlnE6tmgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61329162"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2024 23:14:16 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 1/5] tests/kms_content_protection: Move HDCP output
 checks earlier
Date: Thu, 22 Aug 2024 11:41:46 +0530
Message-ID: <20240822061150.4127413-2-suraj.kandpal@intel.com>
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

Move the HDCP output check earlier when no. MST outputs are being
checked this will avoid us using an extra loop and an extra array.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
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

