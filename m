Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781BBC83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 07:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDCF10E7DD;
	Thu,  3 Jul 2025 07:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5ymN9rT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB9610E7DD
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751529226; x=1783065226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aEqaB/Lht9ahtnff7LnU4pqtlF15Yrhta4UMt9vbwvU=;
 b=W5ymN9rTHAaYZNsn1gW1W1DdfRcPE1yNeI+0zk7Yz4YdPNZUVxxPGpgC
 MmMOYUkAJc/Hs8IhyK5C+VwVmVyFXfwSRydnWt3CyMR5t08q+XvdOFncg
 CEMKgBGmeO478kNErK+ONZmAZIsk5I5mujfRz7G+sm0zhEgXEXjfwdanE
 7wpwvnJxWdJOFJsV7SdkhYcxIrl1pJTxRB9a1XiAEn6DLtf+iPjIrB1lk
 NSaSmLFaYCuGQqTWCh4bG4PVvqDFE3dMa8azzx/ao6vJueNlewvEdB/z1
 vXW0tXhntqGsPQ6Bn6Q25I3BmVsjfFt1E8umh3GH6AAtKeLRARVR8LNtm g==;
X-CSE-ConnectionGUID: 8SqpgMTuTim2hrQZAetKKg==
X-CSE-MsgGUID: gWQNJsKVR1OVUozgsVAxhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71279221"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="71279221"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:46 -0700
X-CSE-ConnectionGUID: Pcfd31mySPe3Hxu07HWp0A==
X-CSE-MsgGUID: 8Csz45G/Th6xDva7v19xQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153732186"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:53:45 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 4/4] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
Date: Thu,  3 Jul 2025 13:23:44 +0530
Message-ID: <20250703075344.95774-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
References: <20250703075344.95774-1-ramanaidu.naladala@intel.com>
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

Add environment variable to obtain absolute path for PNG files
at runtime.

v2: Fix review comments. (Kamil)
v3: Fix review comments. (kamil)
v4: Fix review comments. (kamil)
v5: Make code simpler.	 (Kamil)
v6: Update env only if not exists.    (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/settings.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 3ccf71870..85980dc96 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -90,6 +90,8 @@ static const char settings_filename[] = "metadata.txt";
 static const char env_filename[] = "environment.txt";
 static const char hooks_filename[] = "hooks.txt";
 
+static bool igt_data_path_set_by_runner;
+
 static bool set_log_level(struct settings* settings, const char *level)
 {
 	typeof(*log_levels) *it;
@@ -612,6 +614,31 @@ char *absolute_path(const char *path)
 	return result;
 }
 
+static int set_tests_datadir(void)
+{
+	const char *datapath = "../share/igt-gpu-tools";
+	char *abpath;
+
+	if (getenv("IGT_DATA_PATH"))
+		return 0;
+
+	abpath = absolute_path(datapath);
+	if (!abpath) {
+		fprintf(stderr, "Error: Failed to get absolute path for '%s'\n",
+			datapath);
+		return -EINVAL;
+	}
+
+	if (setenv("IGT_DATA_PATH", abpath, 0) == 0) {
+		igt_data_path_set_by_runner = true;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+
+
 static char *bin_path(char *fname)
 {
 	char *path, *p;
@@ -654,6 +681,10 @@ void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
 	IGT_INIT_LIST_HEAD(&settings->env_vars);
+
+	if (set_tests_datadir())
+		fprintf(stderr, "Data dir path not set\n");
+
 	igt_vec_init(&settings->hook_strs, sizeof(char *));
 }
 
@@ -671,6 +702,11 @@ void clear_settings(struct settings *settings)
 	free_hook_strs(&settings->hook_strs);
 	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
 
+	if (igt_data_path_set_by_runner) {
+		unsetenv("IGT_DATA_PATH");
+		igt_data_path_set_by_runner = false;
+	}
+
 	init_settings(settings);
 }
 
-- 
2.43.0

