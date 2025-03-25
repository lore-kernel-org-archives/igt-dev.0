Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51DBC36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 21:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D4210E600;
	Tue, 25 Mar 2025 21:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E453Vr2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF72610E600
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 21:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742936533; x=1774472533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VB0xLpp4SQYOe7dvxSKAtGl7t90iruQIKfl+79S3IjY=;
 b=E453Vr2qFoa8FhZwh5bGUJceKmWGhBPfkxKXEcC9sZOlyH1BQA9FzQc5
 p6Jl8ilcpzIa5HKxGwkOePts1yNe/atRWxYvnym2CwrLgNOX/HeyANLg0
 E8dt+FYy0G1MdPP+tWzYN7AtQgVVeRzI9Ni8NkfthkCuguXvNeLg8Emsu
 6QLa5VqtztspRaaQGtJQJzdK8EAd7zSQePDj3bCxP5rlSbBXtUh/nED8i
 un8o8AFLCb/7kyx+3IXJeQUxyyyGadgusIFZHXTqewvPnL0rVCbHHFqMg
 v70oLTRRNOVq3vlKkntPNM506n0oQ+F9KgCPXg0VgxkxoLoin85+8uZdN A==;
X-CSE-ConnectionGUID: isNkNSW5RpCNEJFq51uH6g==
X-CSE-MsgGUID: kCc7MWabTsmK4Q0MKhgltg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55584501"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="55584501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:02:13 -0700
X-CSE-ConnectionGUID: LV37K2dvQF2khurKI9iDdw==
X-CSE-MsgGUID: JRVy3qZHQqCqMNuwfybsnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129164694"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 14:02:11 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 3/5] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
Date: Wed, 26 Mar 2025 02:31:44 +0530
Message-ID: <20250325210146.3338454-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
References: <20250325210146.3338454-1-ramanaidu.naladala@intel.com>
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
V4: Fix review comments. (kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 runner/settings.c | 22 ++++++++++++++++++++++
 runner/settings.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 1ccf345d9..94c95f26e 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -612,6 +612,21 @@ char *absolute_path(const char *path)
 	return result;
 }
 
+int set_tests_datadir(void)
+{
+	const char *datapath = "../share/igt-gpu-tools";
+	char *abpath;
+
+	abpath = absolute_path(datapath);
+
+	if (getenv("IGT_DATA_PATH") == NULL)
+		return setenv("IGT_DATA_PATH", abpath, 1);
+
+	return 0;
+}
+
+
+
 static char *bin_path(char *fname)
 {
 	char *path, *p;
@@ -654,6 +669,10 @@ void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
 	IGT_INIT_LIST_HEAD(&settings->env_vars);
+
+	if (set_tests_datadir())
+		fprintf(stderr, "Data dir path not set\n");
+
 	igt_vec_init(&settings->hook_strs, sizeof(char *));
 }
 
@@ -671,6 +690,9 @@ void clear_settings(struct settings *settings)
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

