Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B858CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 13:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB2710E317;
	Tue, 16 Sep 2025 13:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEI1ldZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA2B10E317
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758028157; x=1789564157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQnlo5djhvSTmh3DbAhiBkVwH8MIlIQgkMYQwyuKXwM=;
 b=jEI1ldZtnnAAbM6KtFD8boKyyPslBDkPNJBFE7+zCjppVBlGqXqCZts7
 5M6y0QkhkLqtGUUuTHDR2Ta18aSuvf1RV9r+wYSfFzbEssfsZQ4cgqzdD
 qVAH63H1EYI+S7yg7t2fCV54/MYoKhj7N4nF/S85dtqIi51Y1PTZzLtUe
 Qx3cdR3nLHwMa0i1WQ8T6vNHpPluRqawQ/j6gbCds4zZWN6x9iHa+WaPT
 a0Nv132g8Hr9tkul7a2OxYanoR5qK7eQEr4YFAdfWekJ85B6vKWkCQT9F
 IGT5RsLn/1TvObTvq9cK29d6/6sTIWtm0UFGW2077NIQv8u1A7YMyrdoc g==;
X-CSE-ConnectionGUID: YQuutYn8Q1aN/RD8c2E75A==
X-CSE-MsgGUID: 8y4as/6xTX+p5/AxWivHMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70929027"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="70929027"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:09:17 -0700
X-CSE-ConnectionGUID: aiIAVXkXSyG0glzK5xRdlw==
X-CSE-MsgGUID: A1tVjw2GRfCWl5qgvXxupA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="180074634"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.193])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 06:09:16 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/1] Revert "runner/settings: Add function to set
 IGT_DATA_PATH environment variable"
Date: Tue, 16 Sep 2025 15:09:04 +0200
Message-ID: <20250916130904.166885-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916130904.166885-1-kamil.konieczny@linux.intel.com>
References: <20250916130904.166885-1-kamil.konieczny@linux.intel.com>
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

This reverts commit eacde5c2acc37c1570e27b68b8b6c39d8b61fb32.

IGT_DATA_PATH is currently used only when loading PNG images
by kms_3d test. It looks like more proper way would be to
place such path discovery into igt library, not in runner.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 85980dc96..3ccf71870 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -90,8 +90,6 @@ static const char settings_filename[] = "metadata.txt";
 static const char env_filename[] = "environment.txt";
 static const char hooks_filename[] = "hooks.txt";
 
-static bool igt_data_path_set_by_runner;
-
 static bool set_log_level(struct settings* settings, const char *level)
 {
 	typeof(*log_levels) *it;
@@ -614,31 +612,6 @@ char *absolute_path(const char *path)
 	return result;
 }
 
-static int set_tests_datadir(void)
-{
-	const char *datapath = "../share/igt-gpu-tools";
-	char *abpath;
-
-	if (getenv("IGT_DATA_PATH"))
-		return 0;
-
-	abpath = absolute_path(datapath);
-	if (!abpath) {
-		fprintf(stderr, "Error: Failed to get absolute path for '%s'\n",
-			datapath);
-		return -EINVAL;
-	}
-
-	if (setenv("IGT_DATA_PATH", abpath, 0) == 0) {
-		igt_data_path_set_by_runner = true;
-		return 0;
-	}
-
-	return -EINVAL;
-}
-
-
-
 static char *bin_path(char *fname)
 {
 	char *path, *p;
@@ -681,10 +654,6 @@ void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
 	IGT_INIT_LIST_HEAD(&settings->env_vars);
-
-	if (set_tests_datadir())
-		fprintf(stderr, "Data dir path not set\n");
-
 	igt_vec_init(&settings->hook_strs, sizeof(char *));
 }
 
@@ -702,11 +671,6 @@ void clear_settings(struct settings *settings)
 	free_hook_strs(&settings->hook_strs);
 	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
 
-	if (igt_data_path_set_by_runner) {
-		unsetenv("IGT_DATA_PATH");
-		igt_data_path_set_by_runner = false;
-	}
-
 	init_settings(settings);
 }
 
-- 
2.51.0

