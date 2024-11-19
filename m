Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8A7D60075
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 07:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE58C10E5DE;
	Tue, 19 Nov 2024 07:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxAtrBbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FCE10E5DE
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732002859; x=1763538859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nm1ApEAUKseUHEqRRsdvDBYL6bVAJq2nxmApVaq7FqQ=;
 b=VxAtrBbfxis04R3tHAQrd4fRMQXl+SEZEi4IG9CqsXuHqyQaGxYfQpXv
 Zjtu+yxIk538rKHkmE9rz2ygBEvRazPPQc2V2f4Gf8kieEy4nSlCNV3IE
 qOekX3SYwXXr1WvZOVytlP2wJgK2xroGjSS/er322zKvUtL+qNKP87dkI
 a0uZXuPZzX32uVcqL6j/pbsSe4nHPtGuLp2tZRaqgPg+zRIj2V2bZvKDr
 7Q/KOtSIeWIFUW+rhhXXx00h0uFoOWtl/Ryl+Uc5YmW8bYfdUCyL9094W
 jYhot3A7f36DmK5y6nJnvzZVSLMsIMcQymiZ6ajbATOybqOfQBvLPKJLg g==;
X-CSE-ConnectionGUID: gR8kpVXcTHGE3pgAi2MzdA==
X-CSE-MsgGUID: WWUF+q4aTNGLjAhCx5+teQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32136138"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32136138"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 23:54:19 -0800
X-CSE-ConnectionGUID: AB3b9elGTA6Aaedo0NSQGg==
X-CSE-MsgGUID: iVw0hrLXTmGE+byDxenKuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="90278718"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 23:54:17 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH 3/5] runner/settings: Add function to set IMGDIR environment
 variable
Date: Tue, 19 Nov 2024 13:22:57 +0530
Message-ID: <20241119075259.3048734-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
References: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
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

Introduced set_imgdir() function in settings.c to set the IMGDIR
environment variable. The function uses absolute_path() to convert
the relative path "../share/igt-gpu-tools" to an absolute path.
Added the declaration of set_imgdir() in settings.h with a brief
description.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 runner/runner.c   |  2 ++
 runner/settings.c | 13 +++++++++++++
 runner/settings.h |  8 ++++++++
 3 files changed, 23 insertions(+)

diff --git a/runner/runner.c b/runner/runner.c
index 4855ad641..a52834197 100644
--- a/runner/runner.c
+++ b/runner/runner.c
@@ -49,6 +49,8 @@ int main(int argc, char **argv)
 		exitcode = 1;
 	}
 
+	unsetenv("IMGDIR");
+
 	printf("Done.\n");
 	return exitcode;
 }
diff --git a/runner/settings.c b/runner/settings.c
index dd4b08dd7..d42f3a68a 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -587,6 +587,15 @@ char *absolute_path(const char *path)
 	return result;
 }
 
+int set_imgdir(void)
+{
+	const char *path = "../share/igt-gpu-tools";
+	char *abpath;
+
+	abpath = absolute_path(path);
+	return setenv("IMGDIR", abpath, 1);
+}
+
 static char *bin_path(char *fname)
 {
 	char *path, *p;
@@ -863,6 +872,10 @@ bool parse_options(int argc, char **argv,
 		settings->test_root = absolute_path(env_test_root);
 	}
 
+	if (set_imgdir() != 0) {
+		usage(stderr, "img dir not set");
+	}
+
 	if (!settings->test_root) {
 		usage(stderr, "Test root not set");
 		goto error;
diff --git a/runner/settings.h b/runner/settings.h
index 6246d0c3d..a7abe19fd 100644
--- a/runner/settings.h
+++ b/runner/settings.h
@@ -150,4 +150,12 @@ bool serialize_settings(struct settings *settings);
 bool read_settings_from_file(struct settings *settings, FILE* f);
 bool read_settings_from_dir(struct settings *settings, int dirfd);
 
+/**
+ * set_imgdir:
+ *
+ * The function will set the environment variable.
+ *
+ */
+int set_imgdir(void);
+
 #endif
-- 
2.43.0

