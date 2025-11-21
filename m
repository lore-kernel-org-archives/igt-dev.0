Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FA2CFA475
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 05:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D056010E058;
	Fri, 21 Nov 2025 05:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xlr97/LX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB2D10E058
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 05:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763703670; x=1795239670;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QKULHt3LmNa1cEnD1m1uXWmnDIX8trdjrufcZo88RZE=;
 b=Xlr97/LXr8HXsGamtZ6enfxBZySub1jpA6oc5ii2vtME17PMwYyKYYEE
 pPBmYE4XjUPStjyjnhKsDwIheEDA7N+U6kRSMchLVIS2Cb4XY1vw83Eg8
 38ydrt1lJpDvwXeWta3LPgCpQh4hsrpumb/CpBrIwvKcelu7Ly1tFPuMD
 dS7dVraUftxHOKE+zgvOziKcm9wGvLbpIzyYsyvCzwLLYaLetFe1xghiK
 G8ggv9+KesvsuivPU0/lMPmWOWnjOxMbhPGy6IooUEH7AJ2MiMTKlfHtB
 m6jQrD+WDHX/d9WLMeAPJ9b6nrWDfGwPXTh/hTWAmuQ/L+yx9Gryfzlpg A==;
X-CSE-ConnectionGUID: kV6qdMguQuajPkRNQ2j/kg==
X-CSE-MsgGUID: Eg6zkh2PRpuNTP/qmN3SWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69658161"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="69658161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:10 -0800
X-CSE-ConnectionGUID: Bi6l+RtYRImfDExbbHM5qg==
X-CSE-MsgGUID: 1M5j52teQJCQr5KbEwNjxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="214961910"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 21:41:09 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 12/12] tests/kms_writeback: Refactored
 writeback-pixel-format
Date: Fri, 21 Nov 2025 11:28:39 +0530
Message-ID: <20251121055839.3116906-13-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121055839.3116906-1-sowmiya.s@intel.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
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

Refactored the writeback-pixel-format subtest to
verify the supported list of format against kernel

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_writeback.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 98fcf8a52..aaced0f57 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -691,26 +691,34 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	igt_describe("Check the writeback format");
 	igt_subtest("writeback-pixel-formats") {
 		unsigned int i;
-		char *c;
 		drmModePropertyBlobRes *formats_blob;
-		const char *valid_chars;
+		uint32_t format;
+		int count = 0;
 
 		igt_skip_on(data.dump_check || data.list_modes);
 		formats_blob = igt_get_writeback_formats_blob(output);
 		igt_assert_f(formats_blob, "No writeback pixel formats\n");
-		valid_chars = "01234568 ABCGNRUVXY";
 
 		/*
-		 * We don't have a comprehensive list of formats, so just check
-		 * that the blob length is sensible and that it doesn't contain
-		 * any outlandish characters
+		 * We have a comprehensive list of formats(fourcc) and verify
+		 * how many of them match the format blob, validating them
+		 * against supported_colors.
 		 */
 		igt_assert(!(formats_blob->length % 4));
-		c = formats_blob->data;
-		for (i = 0; i < formats_blob->length; i++)
-			igt_assert_f(strchr(valid_chars, c[i]),
-				     "Unexpected character %c\n", c[i]);
+		for (i = 0; i < formats_blob->length; i++) {
+			format = ((uint32_t *)formats_blob->data)[i];
+			if (format == 0 || strcmp(igt_format_str(format), "invalid") == 0)
+				continue;
+			for (int j = 0; j < ARRAY_SIZE(fourcc); j++) {
+				if (format == fourcc[j]) {
+					count++;
+					break;
+				}
+			}
+		}
 		drmModeFreePropertyBlob(formats_blob);
+		igt_assert_f(count == __builtin_popcount(data.supported_colors),
+			     "writeback pixel formats mismatch\n");
 	}
 
 	igt_describe("Writeback has a couple of parameters linked together"
-- 
2.43.0

