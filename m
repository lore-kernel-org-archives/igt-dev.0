Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAC1C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 21:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB4B10E779;
	Tue, 18 Feb 2025 21:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMLB623E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F1510E783
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 21:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739915652; x=1771451652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uOUbggYAd3CpLJ7ldK9BROirQ1iPr1/LLYq09eAnbcg=;
 b=mMLB623E8Ejaqvt0JSLvudGk2upQTHDZrehRea6WGijvRRQVMtrSfO93
 O1vg9yR4VbsCnFEq/6aOLusjWV2ZHz1CxUN5tFuUZhA0Yt/epNCN2U9vs
 rkkiDjioWQ1FIE5hoveBz4sQEQMkzOz9rePk+YGml6f8htqgA+UM75hI1
 /cenRAXJXLeZQIe+uzdBRNWHq9dXY4lqaXEd7T5X//JzCkco/gL3s0S9H
 jESibH9hU17Ym9wnROvgPKAVdY+r5lImHfpQBGtXypFzWIeNT/ITWxF1U
 Rzsv0jyqGIae90L/t5wHRReygy0OiH7Ud/HzseoMaVz6TcbXSOsq3akUs w==;
X-CSE-ConnectionGUID: Mc4wI74LTk2BmcoeFJZC+g==
X-CSE-MsgGUID: jeHgWdZ7SweMayR+PeRxsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58170185"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="58170185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:54:12 -0800
X-CSE-ConnectionGUID: isFi9TzASjadzA8gvieT0Q==
X-CSE-MsgGUID: pCXEotNgTsSuEloHqEEQQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119465938"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 13:54:10 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, swati2.sharma@intel.com,
 santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 3/5] runner/settings: Add function to set
 IGT_DATA_PATH environment variable
Date: Wed, 19 Feb 2025 03:23:47 +0530
Message-ID: <20250218215349.1063788-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
References: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
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

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 runner/settings.c | 13 +++++++++++++
 runner/settings.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index c1f3be77a..77fabafb0 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -601,6 +601,15 @@ char *absolute_path(const char *path)
 	return result;
 }
 
+int set_runner_datadir(void)
+{
+	const char *datapath = "../share/igt-gpu-tools";
+	char *abpath;
+
+	abpath = absolute_path(datapath);
+	return setenv("IGT_DATA_PATH", abpath, 1);
+}
+
 static char *bin_path(char *fname)
 {
 	char *path, *p;
@@ -643,6 +652,8 @@ void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
 	IGT_INIT_LIST_HEAD(&settings->env_vars);
+	if (set_runner_datadir())
+		fprintf(stderr, "Data dir path not set\n");
 	igt_vec_init(&settings->hook_strs, sizeof(char *));
 }
 
@@ -660,6 +671,8 @@ void clear_settings(struct settings *settings)
 	free_hook_strs(&settings->hook_strs);
 	free_array_deep((void **)settings->cmdline.argv, settings->cmdline.argc);
 
+	unsetenv("IGT_DATA_PATH");
+
 	init_settings(settings);
 }
 
diff --git a/runner/settings.h b/runner/settings.h
index 42c96665a..7b8292509 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -154,5 +154,6 @@ bool serialize_settings(struct settings *settings);
 
 bool read_settings_from_file(struct settings *settings, FILE* f);
 bool read_settings_from_dir(struct settings *settings, int dirfd);
+int set_runner_datadir(void);
 
 #endif
-- 
2.43.0

