Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9709CC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 17:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409FF10E7A5;
	Tue, 12 Mar 2024 17:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3VvJIxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9294010E7A5
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710265506; x=1741801506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ch/Iz/OJqtdy4Lvxfy2753mNhe69dZiLbPiVQ/uF8D0=;
 b=h3VvJIxrVPSot3AbwID/jg1DentIfgyEijTIyTeoFDPk18Bj/NbN57SE
 5a5Vpv2/WVeul8r0kcXv0l+wy574opyLnA9pNYDVHQML3MbZVawAYBu5I
 F866H/Bbj6Fwv+vgDYtXuecxPZSzogO7lsUsyCIzWD1vWmTUPpBzYXWp3
 oY/aK3lGqNL5gc6SFRCve/YlgigKZNIuia6McQeUsosJLwEpypspJHJed
 eOGDzYZBqUCLLT18rou3CkCW/Fom0uErEUqQxDTbEDd+5RKy8mQ5KsEw7
 ziVapDuzSFplNS4Tg1kXkyQoIVYYgrAYEENJDYJjTFO6KwMuS0HnUblVC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4843300"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4843300"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 10:44:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12047219"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 10:44:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel module
Date: Tue, 12 Mar 2024 10:45:33 -0700
Message-ID: <20240312174533.2417630-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

https://patchwork.freedesktop.org/patch/582554/?series=131032&rev=1
groups all the live tests into a single kernel module. Use that
module to run any of the tests triggered by igt.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_live_ktest.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index bb612bae3..08b80d4e0 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -31,16 +31,11 @@
  * Functionality: mocs
  */
 
-struct kunit_tests {
-	const char *kunit;
-	const char *name;
-};
-
-static const struct kunit_tests live_tests[] = {
-	{ "xe_bo_test",		"xe_bo" },
-	{ "xe_dma_buf_test",	"xe_dma_buf" },
-	{ "xe_migrate_test",	"xe_migrate" },
-	{ "xe_mocs_test",	"xe_mocs" },
+static const char *live_tests[] = {
+	"xe_bo",
+	"xe_dma_buf",
+	"xe_migrate",
+	"xe_mocs"
 };
 
 igt_main
@@ -48,5 +43,5 @@ igt_main
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
-		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
+		igt_kunit("xe_live_test", live_tests[i], NULL);
 }
-- 
2.43.0

