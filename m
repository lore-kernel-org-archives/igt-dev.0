Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D989FCAC5AA
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 06:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E92F10E107;
	Thu, 25 Sep 2025 06:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBxekxgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93F610E107
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 06:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758780788; x=1790316788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I0EN+7aqA84hYkC61pSpjmY1Qb51QQMLcJ0tst2/1Co=;
 b=XBxekxgxjB9qFk789jUHjH+EdvKd1uQyXtL3v1OGcZqhnkExaVumr2ml
 RBXUMw0IneQMpJbB5UD6eC0MVfo/NdevEQ2VFXI0R5dX8pNw8XdGp5T6r
 WElrFjFj9OfGS+AswPPwTiJ/aAOun++ELn/6IrnDYNPWY46xrPYn/0yrt
 P1r2yBVCpMYAvSu9PsQA/ZIrPSQnohrRJBldSWjO57ce4ekXUY2vlPaY5
 4lrCvSQGiWmc4OuQdd5awiRFOMjjqCxbpozVpLEsd6dNU8+bS789qHwTV
 CN7zAcsmoUSptdcRqWmI4HCCZwTrvzAhtIpHsTYZgSitX0qsaG0nXKPMi Q==;
X-CSE-ConnectionGUID: BH9d+bmhTomNLN6rKKkD5Q==
X-CSE-MsgGUID: A6mCRMcJRNm2uCzQs6iL7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61036598"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61036598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 23:13:07 -0700
X-CSE-ConnectionGUID: /i+Fb5FKRDaelBOBJqk6fA==
X-CSE-MsgGUID: qn0hvsv8TfiTrWYEDZ0GGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177173717"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.41])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 23:13:05 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tools/lsgpu: iterate over all matching devices
Date: Thu, 25 Sep 2025 08:13:02 +0200
Message-ID: <20250925061301.77009-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

At the moment only 'device:' filter allows to collect all matching
cards in the igt_devs.filtered view. Before this filter was introduced
we were mostly using 'pci:' which doesn't allow to put 'card=all'
and filter out all matching devices. Another limitation was in lsgpu,
which allows to display only single matching device.

Add loop around all matching cards and try to open them in lsgpu.
This allows testing filters which supports 'card=all' argument.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/lsgpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 6cfbf31420..6d869c9f37 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -369,27 +369,31 @@ int main(int argc, char *argv[])
 	igt_devices_scan_all_attrs();
 
 	if (igt_device != NULL) {
-		struct igt_device_card card;
+		struct igt_device_card *cards;
+		int matched;
 
 		printf("=== Device filter ===\n");
 		printf("%s\n\n", igt_device);
 
 		printf("=== Testing device open ===\n");
 
-		if (!igt_device_card_match(igt_device, &card)) {
+		matched = igt_device_card_match_all(igt_device, &cards);
+		if (!matched) {
 			printf("No device found for the filter\n\n");
 			ret = -1;
 			goto out;
 		}
 
-		printf("Device detail:\n");
-		print_card(&card);
-		test_device_open(&card);
-		if (fmt.type == IGT_PRINT_DETAIL) {
-			printf("\n");
-			igt_devices_print(&fmt);
+		for (int i = 0; i < matched; i++) {
+			printf("Device detail:\n");
+			print_card(&cards[i]);
+			test_device_open(&cards[i]);
+			if (fmt.type == IGT_PRINT_DETAIL) {
+				printf("\n");
+				igt_devices_print(&fmt);
+			}
+			printf("-------------------------------------------\n");
 		}
-		printf("-------------------------------------------\n");
 
 	} else {
 		igt_devices_print(&fmt);
-- 
2.43.0

