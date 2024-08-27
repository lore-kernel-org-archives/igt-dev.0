Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A36CC5472F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 06:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0735910E235;
	Tue, 27 Aug 2024 06:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fu+So856";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D421410E235
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 06:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724739695; x=1756275695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FUbrjNGJ4YUpVa79vOGnpwbmWhgmVWqv0nkA3vxj4VE=;
 b=Fu+So856+rdehNckD96bJLfMREfHSRg2JVI5B8bLPuiMPgXGedrPwf6S
 sKzx9hX/koSnmvsmgd6MvfsWSwpqas1fn8H8ZB3XB3GbSoFOAMuIMlz68
 Qq1cXwuptPbwwG+xdin7sePf61A4pfC7arzbw8+lkKPvcMBlbngL38IEz
 Gqjv+Mhb/qtsy0sggEuC/olGE/qkqY+VTchraW5yF47TUGSmCoWDj3Cy9
 ucKJ+6o2slzT4sc6fysBeNGJJN80SDLLvnOg7YRfplA+mrad6tjVrUQwT
 RTHFgeDvDg0eySJdgYGZ4zj2XGVox9ofc9tnAkR0f2HVQFYAIO6+gAdq4 A==;
X-CSE-ConnectionGUID: kJnIfGKnTsChHUZYZWTWTg==
X-CSE-MsgGUID: 2B1GvNeiRrSNMGwuaH4BBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40700486"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="40700486"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 23:21:35 -0700
X-CSE-ConnectionGUID: V5Zznq7fSISPMa7gnleAgg==
X-CSE-MsgGUID: KJDpjBKBRzOsX3jsgr2/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62916006"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa010.fm.intel.com with ESMTP; 26 Aug 2024 23:21:33 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 1/5] tests/kms_content_protection: Move HDCP output
 checks earlier
Date: Tue, 27 Aug 2024 11:49:00 +0530
Message-ID: <20240827061904.4170393-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240827061904.4170393-1-suraj.kandpal@intel.com>
References: <20240827061904.4170393-1-suraj.kandpal@intel.com>
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

