Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADB8C61DB2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 07:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2BC10E368;
	Mon,  9 Jun 2025 07:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPmt0Jkv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D93E10E368
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 07:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749454455; x=1780990455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pw0InNSZ4feYFXwgtNOOzdhtXnHkagRjQaU9aoZbXqc=;
 b=RPmt0Jkv/KxzyKj1BpH7Zmg2cGS1TVhaBbWrqX9NToLrBZHs6enpkRR/
 lYRRV0vv0FYALt9RiHVfS7bJOgTTfkjSt7YzDNzntQ6wpQrJNH42/VtMV
 w8bRhpInhW2zjyTU6qdMcG6tdFredSveNdV/Xg77KcuVVqUXtH5Y/u1gi
 eUj4j+KpHS+bNhJ5OpNA8sEHAkjkOf5BLS2lx03FoSGQxm8dOwpDKz9rD
 fKpl9m36+rOrAZ/VEjumTTnLzpAY+8gxTTcWwrPshF//2o2rK96o1fmnn
 Z4ct8VZMJZCz4KrN7uPYzzZ+JoYOJ8mShoNUKbJz/6Of81fQh+S1n6s1Y g==;
X-CSE-ConnectionGUID: 9Z96FUjTRVSvCqQuLWoS5w==
X-CSE-MsgGUID: bn6DIbl5Qzin2npiB0kolA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="74055368"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="74055368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:34:15 -0700
X-CSE-ConnectionGUID: Iz+V2Xp9QHO9V9jxFzmIzw==
X-CSE-MsgGUID: JNAqnsBGRPKqwLf/LIUQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146368217"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:34:13 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_content_protection: Skip empty vendor
 names in blocklist
Date: Mon,  9 Jun 2025 13:02:28 +0530
Message-Id: <20250609073228.416135-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
References: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
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

Avoids false positives by returning false early when the vendor name is
NULL, empty, or a single whitespace character.

log message in kms_content_protection by printing skipped outputs instead
of asserting.

V2: Add Fixes tag (Suraj)

Fixes: 6a256bfe3 (tests/kms_content_protection: Whitelist check for panel
support)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_panel.c                | 8 ++++++--
 tests/kms_content_protection.c | 9 ++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/igt_panel.c b/lib/igt_panel.c
index c89bf9123..c51fd7d54 100644
--- a/lib/igt_panel.c
+++ b/lib/igt_panel.c
@@ -20,11 +20,15 @@
  * true if the vendor name is found in the blocklist, false otherwise.
  */
 bool igt_is_panel_blocked(const char *vendor_name,
-			    const char *const blocklist[],
-			    size_t blocklist_size)
+				const char *const blocklist[],
+				size_t blocklist_size)
 {
 	int i;
 
+	if (!vendor_name || vendor_name[0] == '\0' ||
+		(vendor_name[0] == ' ' && vendor_name[1] == '\0'))
+			return false;
+
 	for (i = 0; i < blocklist_size; i++) {
 		if (strstr(blocklist[i], vendor_name) != NULL)
 			return true;
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index b0d0b0234..51fc1d3be 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -637,9 +637,6 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 	}
 
 	for_each_connected_output(display, output) {
-		igt_require_f(!is_output_hdcp_test_exempt(output),
-			      "Skipped as the panel is blacklisted");
-
 		for_each_pipe(display, pipe) {
 			igt_display_reset(display);
 
@@ -652,6 +649,12 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 
+			if (is_output_hdcp_test_exempt(output)) {
+				igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
+					  output->name);
+				continue;
+			}
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_content_protection_on_output(output, pipe, commit_style, content_type);
 
-- 
2.34.1

