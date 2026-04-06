Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25140EF4EC2
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 08:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C796B10E184;
	Mon,  6 Apr 2026 08:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7bGnUCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EA510E184
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775465289; x=1807001289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gV3gTOsPOFbRstjhq30ZttabjmY3A7znq5+ZlHBw4Rc=;
 b=Y7bGnUCzaHfR4wv3l80r2pCqbVw6n2L1KsK91MwI6XlCT9eXa00Q3H68
 enJzV8bX8n02FchoVw054xUJIk+X4r3/r//2Kg5emgW/QemCGLuxkhLLQ
 PdhyCs4GNo/gYcCzi4rMVVTAwklcSVuJaJ8IZPmVguFYiQ2OpSx737O7J
 KMXmSUzlcSqo4QE4bD9/Ou7KI9P56xD0ohCPJWqVzIKU9g6zXywrCGaWr
 0O3E1SnYMa2b/DIjQJg8bvjxogwH3EiuhxZ65xCVjyGe7A++LO78mzDft
 9NRlwnPfCmctHtQVvEUgmBufUzSD38R1lQ9gKlQ1IByrVEwtV2g9d0wcR A==;
X-CSE-ConnectionGUID: 9qLUGBAHSnC/j8pcnaNb5Q==
X-CSE-MsgGUID: m/1uSrrFTRe87/c4M89YVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="80276814"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="80276814"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:48:08 -0700
X-CSE-ConnectionGUID: nLChNZRKRZuV/CTRUToJYA==
X-CSE-MsgGUID: w2P810UUT8+6Y97LnLcZRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="265795810"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 01:48:06 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2] README: Document skip message format
Date: Mon,  6 Apr 2026 14:38:55 +0530
Message-ID: <20260406090902.1001161-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

KMS tests currently skip in different ways when a machine does not have
the required connectors or display modes.  Because every test invents its
own wording, capitalisation and punctuation, automated tools cannot
reliably match skip reasons across tests, making bug filing harder.
provide a consistent style for new and updated KMS tests to follow.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 README.md | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/README.md b/README.md
index b4b9a37ea..4812ff0a6 100644
--- a/README.md
+++ b/README.md
@@ -188,3 +188,55 @@ Imported non-DRM uapi headers from airlied's drm-next branch.
 
 Then, commit with a note of which exact commit from airlied's branch
 was used to generate them.
+
+Skip Messages
+-------------
+
+KMS tests currently skip in many different ways when a machine does not
+have the required connectors or display modes.  For example, tests
+checking for a connected output use all of the following today:
+
+```c
+igt_require_f(found, "No valid outputs found\n");
+igt_require_f(found, "No second valid output found\n");
+igt_require_f(first_output, "No display connected to iGPU\n");
+igt_require_f(connector, "No HDMI connector found.\n");
+```
+
+Tests checking for a usable mode or pipe similarly diverge:
+
+```c
+igt_require_f(found, "No valid mode combo found.\n");
+igt_require_f(found, "No valid connector/pipe found\n");
+igt_require_f(found, "No valid pipe/output combo found.\n");
+igt_skip_on_f(!has_supported_mode, "Unsupported mode for all pipes\n");
+```
+
+Different wording, capitalisation and punctuation for the same class of
+skip makes automated bug filing harder — tools cannot reliably match or
+group skip reasons across tests.
+
+For new and updated KMS tests, write skip messages as short,
+human-readable strings, always terminated with `\n`.  Include the
+relevant context (connector name, pipe, format, modifier) inline via
+printf-style format specifiers so that logs identify exactly which
+resource was missing:
+
+```c
+/* no connected output */
+igt_require_f(output, "no connected output found\n");
+
+/* no valid connector/pipe combination */
+igt_require_f(found, "no valid connector/pipe combination found\n");
+
+/* no usable mode on a specific output */
+igt_require_f(mode, "no suitable mode found on %s\n", output->name);
+
+/* feature not supported on a specific pipe/format */
+igt_skip_on_f(!igt_display_has_format_mod(display, fmt, modifier),
+	      "modifier 0x%llx not supported on pipe %s\n",
+	      modifier, kmstest_pipe_name(pipe));
+```
+
+Use the same phrasing for the same class of skip across tests so that
+results can be grouped and tracked reliably.
-- 
2.48.1

