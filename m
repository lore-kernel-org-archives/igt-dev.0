Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86266C7115D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 21:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3950F10E458;
	Mon, 16 Jun 2025 21:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dS1fdR1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1693F10E458
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 21:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750108161; x=1781644161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JJ4ggj9lTeWVBJw8e+5YA+2zotfpEiSvkmsO2Mr6ar0=;
 b=dS1fdR1Z+z7ccTj3eTcd07vDwywg6eRcOrGqsZQyus+Pi6EXr4h2NDFD
 8tqK8MHRhEGSYw+6k5su25/kdnzO0hrO/E/trWfsDYRky/zRMnQKK8mhl
 s4zDUL9gize6jheSIEQX/md0uF6Eb86E/Joe0341i7pt5dP9ayfmStfYq
 mJqf7gFfT/X6ooLcr+MXqeHzJmhA51FUYkGYMG6GyZrf1TtgbKvvxEPRM
 15mV9kr9Kb2FtR3/B18NpZG4kIOArVOxky0Ou5tMku1JlsuwZ7cR7f7OQ
 GMMf7bHhv5TGYo/EI2q2hd4nbb3B0IG0qjSRQLb439LYu7WYEQbbVXg1N g==;
X-CSE-ConnectionGUID: RLI8K6AvSRaMRpK8n0PTFA==
X-CSE-MsgGUID: tXHmWhwBRWWYnzEFxzra3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52351462"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52351462"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:09:21 -0700
X-CSE-ConnectionGUID: cDyhDj7kRa+b5rQGcvrMew==
X-CSE-MsgGUID: 7lPUqyeuR8unODFWjyq1kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153344567"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:09:19 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 4/5] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
Date: Tue, 17 Jun 2025 02:38:39 +0530
Message-ID: <20250616210840.3335978-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616210840.3335978-1-ramanaidu.naladala@intel.com>
References: <20250616210840.3335978-1-ramanaidu.naladala@intel.com>
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
---
 runner/settings.c | 36 ++++++++++++++++++++++++++++++++++++
 runner/settings.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index b151218cc..28b031a29 100644
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
 
+int set_tests_datadir(void)
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
 
diff --git a/runner/settings.h b/runner/settings.h
index 6c58c3282..e8e87d3a5 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -160,5 +160,6 @@ bool serialize_settings(struct settings *settings);
 
 bool read_settings_from_file(struct settings *settings, FILE* f);
 bool read_settings_from_dir(struct settings *settings, int dirfd);
+int set_tests_datadir(void);
 
 #endif
-- 
2.43.0

