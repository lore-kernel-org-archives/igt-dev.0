Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43425C3ABAC
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 03:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF2810E246;
	Mon,  5 May 2025 03:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myAKhfk1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B4F10E246
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 03:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746415661; x=1777951661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JaF6U7ejSUTQP7Hf/1r/eQzRPkMByhJUuZi/fWaHAtI=;
 b=myAKhfk1EEStb5NKS3X8hq2OY/BmZpimaMUOGZ12uxW/6WWRSqfIpRwf
 TatuNGmoAnGfW0Tm20dxnAXEBtXnn/5d203c2jV8wziOTrtAxceJKfHcD
 vpFV1PYrbHvJUR7TvSoUg3qyTGyGK9Rmwks/y0AREzaS+Md9CzasGLOco
 rIdw8eQwX8KDLmdD5yQt9QFb+kuE2iTXuzhCsu6QkLgUZ81+neU5bfF7U
 RIAx53I02V+gXWd0++BKyu9zuOEtIUBbkiH4vmtuGp+Z11oCJErcUMl7j
 dU5E2WBaXXrDL+YqHE7T6SLm6FElGdfYJG5zoOvg9ijJLFtAEUn+yxXuC g==;
X-CSE-ConnectionGUID: KqsUtBpLTA6f5BF1zEOVWQ==
X-CSE-MsgGUID: uhnY20i+SKai3OsI784Yqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65412747"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="65412747"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 20:27:41 -0700
X-CSE-ConnectionGUID: 5fgs8Op0TmGVJzYdWkyTWg==
X-CSE-MsgGUID: 3daJ26twQ56zTlKl2S/j4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="166038738"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa002.jf.intel.com with ESMTP; 04 May 2025 20:27:39 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/kms_plane_multiple: Pass subtest name for
 better test context
Date: Mon,  5 May 2025 09:04:35 +0530
Message-Id: <20250505033435.929953-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250505033435.929953-1-pranay.samala@intel.com>
References: <20250505033435.929953-1-pranay.samala@intel.com>
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

Include subtest name in function call and utilize it in the skip message
for improved logging.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane_multiple.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 5767318e4..4e6ca780a 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -504,7 +504,7 @@ static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pi
 	for_each_connected_output_local((display), (output)) \
 		for_each_if(igt_pipe_connector_valid((pipe), (output)))
 
-static void run_2_display_test(data_t *data, uint64_t modifier)
+static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
 {
 	enum pipe pipe1, pipe2;
 	igt_output_t *output1, *output2;
@@ -547,7 +547,7 @@ static void run_2_display_test(data_t *data, uint64_t modifier)
 	}
 }
 
-static void run_test(data_t *data, uint64_t modifier)
+static void run_test(data_t *data, uint64_t modifier, const char *name)
 {
 	enum pipe pipe;
 	igt_output_t *output;
@@ -647,7 +647,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			     "reflected immediately after each commit.");
 
 		igt_subtest_with_dynamic(subtests[i].name)
-			run_test(&data, subtests[i].modifier);
+			run_test(&data, subtests[i].modifier, subtests[i].name);
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
@@ -660,7 +660,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 			igt_require(valid_outputs > 1);
 
-			run_2_display_test(&data, subtests[i].modifier);
+			run_2_display_test(&data, subtests[i].modifier, subtests[i].name);
 		}
 	}
 
-- 
2.34.1

