Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305D3C87FDA
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 04:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE8610E29D;
	Mon,  4 Aug 2025 04:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZRCYF+o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDDD10E29D
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 04:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754283480; x=1785819480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8tlR6RSrAtJ1015Nu15h3i6JYg/LhWn61y68MzJZ47k=;
 b=WZRCYF+o0z3AGT8BdyNF4O0wjg2X/ftPIEO3dgRIdRDeEaTcED/xMUZe
 kdpNCkX55Nxm9eJLaoICWhJ7gENCMFKChsIhpX2wglWlow/bjjd8Cnyn7
 KcmHEohoRf62QvTPw7wh++76zRi79GBdGdzYrZVKXxW/Cwc6uuAh29GmN
 XnPAbFBQ3dodxHe1qcXEA4w49PZbMGkVEsP5id/WyjV88qH6S8ebTIX1d
 xHj9f9Yy1J7zUzN155Hg/9TeGLcrUYoqYlts8iRVagEMmMsEF1YAwuzC0
 WRYI8y4aSwYTQzEPy21jspEC737sRVGbBRY/xblwe2UpjnAFwEvHNf6Mj w==;
X-CSE-ConnectionGUID: pdkHDRmWSjKsLcIn+862qQ==
X-CSE-MsgGUID: +i0LqF4TQ2WF1l0DPVZdCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56460406"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="56460406"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2025 21:57:59 -0700
X-CSE-ConnectionGUID: TovXwOa3T8CotVdK/c4yKw==
X-CSE-MsgGUID: /4XT8UPqR86822P+nvKt2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164841928"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2025 21:57:58 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, shekhar.chauhan@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_cursor_crc: Rename async cursor crc
 subtests
Date: Mon,  4 Aug 2025 10:26:00 +0530
Message-Id: <20250804045600.945835-1-santhosh.reddy.guddati@intel.com>
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

The original names are misleading as they suggest these tests involve
async flips, when they actually validate cursor update timing to ensure
no visual tearing occurs during framebuffer changes and position updates.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_cursor_crc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 8a465dc6b..239bbd7b7 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -96,12 +96,12 @@
  */
 
 /**
- * SUBTEST: async-cursor-crc-framebuffer-change
+ * SUBTEST: cursor-tearing-framebuffer-change
  * Description: Validate cursor IOCTLs tearing via framebuffer changes.
  */
 
 /**
- * SUBTEST: async-cursor-crc-position-change
+ * SUBTEST: cursor-tearing-position-change
  * Description: Validate cursor IOCTLs tearing via cursor position change.
  */
 
@@ -1113,8 +1113,8 @@ static void run_tests_on_pipe(data_t *data)
 				1.f, 0.f, 0.f, &data->timed_fb[1]);
 	}
 
-	igt_describe("Validate CRC with two cursors");
-	igt_subtest_with_dynamic("async-cursor-crc-framebuffer-change") {
+	igt_describe("Validate cursor updates don't cause tearing with framebuffer changes");
+	igt_subtest_with_dynamic("cursor-tearing-framebuffer-change") {
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			if (execution_constraint(pipe))
 				continue;
@@ -1132,8 +1132,8 @@ static void run_tests_on_pipe(data_t *data)
 		}
 	}
 
-	igt_describe("Validate CRC with two cursors and cursor position change");
-	igt_subtest_with_dynamic("async-cursor-crc-position-change") {
+	igt_describe("Validate cursor updates don't cause tearing with position changes");
+	igt_subtest_with_dynamic("cursor-tearing-position-change") {
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			if (execution_constraint(pipe))
 				continue;
-- 
2.34.1

