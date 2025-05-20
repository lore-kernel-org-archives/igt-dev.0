Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA16C54E90
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 19:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A194410E5AF;
	Tue, 20 May 2025 19:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJlERjOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6152E10E525
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 19:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747768188; x=1779304188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yVHJD2JVNHmZsZ2xSF3gVGpjBE9THldweXLJsQPxGc4=;
 b=TJlERjOq9931h6+BSy7aZsQ1Wh6S2gzz2qa6DzJRWtGCwI0dAAxYjXh3
 oYmRyU2VwYGwmMtLAZJgTvfQQNPmYkfwYsTV2YBo7JJfOX6vwi7aDhDC8
 i5kTOHGuWB+ji6egFvDkw0idRoSSi95EsMZpyFizOFzWneXTHITnbZX2M
 B3RM3kbmbu4xhYNd70fs0bb9un0RHWvrVP9veaYBv9w8SsMF13Lw2/wXa
 RktDl2zrsQ9WGIiBZjjiSTcOqryh811UrDE4cyO5dBShNRh7uTGKAt9fg
 XGiAVS4qRhMunGY4h1ThPvyRuC+SZu/5KyFHheAIYa9UfHThvPRjwYkge A==;
X-CSE-ConnectionGUID: S5zoOrTnRXe/WMjK2AAmbg==
X-CSE-MsgGUID: LGP7cmMBSj+9GxTRuLzD8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49420900"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49420900"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:09:47 -0700
X-CSE-ConnectionGUID: AoPQ2Hj4TJCBa+J2frWXDw==
X-CSE-MsgGUID: kUDQPc9wTrG3SzXxFbX+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="144524892"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:09:46 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 3/5] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
Date: Wed, 21 May 2025 00:39:09 +0530
Message-ID: <20250520190911.1727232-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
References: <20250520190911.1727232-1-ramanaidu.naladala@intel.com>
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

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 runner/settings.c | 27 +++++++++++++++++++++++++++
 runner/settings.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 1ccf345d9..0e4f39c4c 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -612,6 +612,26 @@ char *absolute_path(const char *path)
 	return result;
 }
 
+int set_tests_datadir(void)
+{
+	const char *datapath = "../share/igt-gpu-tools";
+	char *abpath;
+
+	abpath = absolute_path(datapath);
+	if (!abpath) {
+		fprintf(stderr, "Error: Failed to get absolute path for '%s'\n",
+			datapath);
+		return -EINVAL;
+	}
+
+	if (!getenv("IGT_DATA_PATH"))
+		return -EINVAL;
+
+	return setenv("IGT_DATA_PATH", abpath, 0);
+}
+
+
+
 static char *bin_path(char *fname)
 {
 	char *path, *p;
@@ -654,6 +674,10 @@ void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
 	IGT_INIT_LIST_HEAD(&settings->env_vars);
+
+	if (set_tests_datadir())
+		fprintf(stderr, "Data dir path not set\n");
+
 	igt_vec_init(&settings->hook_strs, sizeof(char *));
 }
 
@@ -671,6 +695,9 @@ void clear_settings(struct settings *settings)
 	free_hook_strs(&settings->hook_strs);
 	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
 
+	if (getenv("IGT_DATA_PATH") != NULL)
+		unsetenv("IGT_DATA_PATH");
+
 	init_settings(settings);
 }
 
diff --git a/runner/settings.h b/runner/settings.h
index 30743fc40..cbcf624b0 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -156,5 +156,6 @@ bool serialize_settings(struct settings *settings);
 
 bool read_settings_from_file(struct settings *settings, FILE* f);
 bool read_settings_from_dir(struct settings *settings, int dirfd);
+int set_tests_datadir(void);
 
 #endif
-- 
2.43.0

