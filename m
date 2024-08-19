Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38AEC5320E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 10:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3D010E204;
	Mon, 19 Aug 2024 10:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjtJ8ywt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E58010E204
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724063751; x=1755599751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xV6w7ZD/YPG1xB6JRSHqhIn7bd9h3naUdGgmPJbFXlE=;
 b=gjtJ8ywt1+t+mrAI6P0gBC/95Z7L2ucb7JqM8tfqbUQIlKtubc3pmvxP
 tZCgFPIbVy2yBUW2zLOysB2oMC0S6iZAYg44rEE7wxhvvSPUPLjfqnb9F
 xTkwMveY9eESmguwJvOh1zrZOwsPDBzY5F9icJvBfUZJm1RJsf8iY02zj
 96v4ExpZ5XhqpuT9yOJTdX9yNNLp+MFLkBKYvtTZ5w0a/RrJvjeLgo2cv
 UUkQM5MrP+bq3b2vAtdKDLRQM9SKCh9XAWoOI53x5xVSegtjgJbc2IMOf
 1oCjbI7eBrmAIPPlAk/l4UywROJQR1JCITNAEI8CXIYi8RHauyessUfp3 A==;
X-CSE-ConnectionGUID: ybBf/WlgSkimvgllQWI31w==
X-CSE-MsgGUID: UW+E8evySJa0/mdM0cKD/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="39763268"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="39763268"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 03:35:50 -0700
X-CSE-ConnectionGUID: d5Er9jvbTamSGNeKh/NiyA==
X-CSE-MsgGUID: PQXwm24QTOelszhZMZOEcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65286321"
Received: from opintica-mobl1 (HELO localhost) ([10.245.244.144])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 03:35:50 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v5 2/4] lib/igt_core: Added message to runner about
 ignoring kernel warns
Date: Mon, 19 Aug 2024 12:32:40 +0200
Message-ID: <20240819103242.26527-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
References: <20240819103242.26527-1-kamil.konieczny@linux.intel.com>
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

Allow a test to emit regex into dmesg to be read by runner when
it will be generating results based on kernel dmesg. When it
will encounter such message, runner will save it and then
temporarily ignore kernel warnings or errors which matches given
regex.

v2: check creation of regex in subtest run and bail out quickly
on error, fix description (Zbigniew)
v3: print error when compiling regex fails (Zbigniew)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 24 ++++++++++++++++++++++++
 lib/igt_core.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ff3e0392..6eef25dd5 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3432,3 +3432,27 @@ int igt_pci_system_init(void)
 
 	return pthread_once(&once_control, __pci_system_init);
 }
+
+/**
+ * igt_emit_ignore_dmesg_regex:
+ * @ignore_dmesg: string regex
+ *
+ * Emits a string for igt_runner to ignore next dmesg warns or errors which
+ * matches it.
+ */
+void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex)
+{
+	static const char mark_ignore_dmesg[] = "add ignored dmesg regex: ";
+	GError *err = NULL;
+	GRegex *re;
+
+	re = g_regex_new(ignore_dmesg_regex, G_REGEX_OPTIMIZE, 0, &err);
+	if (err) {
+		igt_debug("regexp: '%s'\n", err->message);
+		g_error_free(err);
+		igt_assert_f(re, "Error in regexp\n");
+	}
+
+	g_regex_unref(re);
+	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
+}
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 06c5314bf..a437ff8ed 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1542,4 +1542,6 @@ static inline void igt_pci_system_cleanup(void)
 {
 }
 
+void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
+
 #endif /* IGT_CORE_H */
-- 
2.43.0

