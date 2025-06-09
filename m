Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B564EC5B552
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 07:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6310110E23D;
	Mon,  9 Jun 2025 07:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnPuwMB/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF94810E23D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 07:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749452457; x=1780988457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z3ZzkCH6n8/vlvNsdDEteiED+fnjyf2nf/X1ACEIs8Y=;
 b=KnPuwMB/ozyJ5u5iS5mrEqBlAHHpZSQ4xmBoz1CpWog2gDUlEXRstLt4
 7McQhzFKtX53OF9i/CcUIlxzpV7bWD9FfjNdqxJGiopLqB6Huzl5lWDj3
 RgfFhVunHTNHhuqGxFLXwhyHD0nUBqCXx/WMUARPgZYASSnesdha1lC+7
 VvaKMuIxww4LiFrbAJazCDRFwQqBJl9ldwHtjOW/+d6tgfsQyfMhPr6vF
 3aZ3c6Fig70Z+/eTT4D1n/arBwx7+JpYwtOXW0OKLpAEqtGSoB+SD/RzA
 0Qiy+3k5gTCk+fUcxqs70t//dJBCJEJ6/L+evEN9jogMSQcmOPmi1hbZB Q==;
X-CSE-ConnectionGUID: tCNYPm96T/m1htI5pm/usA==
X-CSE-MsgGUID: IDeXyCNXTlWGTiFUkZ/y+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="55320900"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="55320900"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:00:56 -0700
X-CSE-ConnectionGUID: f3wXFcwiSbSjF/UvaavK3g==
X-CSE-MsgGUID: pPx9NM5OQqOjC69USVjtBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; d="scan'208";a="147360233"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 00:00:54 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_content_protection: Skip empty vendor names
 in blocklist
Date: Mon,  9 Jun 2025 12:29:36 +0530
Message-Id: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

