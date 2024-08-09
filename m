Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FDBC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 11:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583C710E0CF;
	Fri,  9 Aug 2024 11:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mT/ouUp/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0DE10E0CF
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723201295; x=1754737295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LrGIDOrJ1FRByGAz9QimE+lbJUFSJBKH69C0kj/inFs=;
 b=mT/ouUp/3FvPhzRu6FA7cGn0O41FZITm9D5cSPtrvvJfVi4Stg5X22Xe
 eEKA7DgmeZbFIuJPKMHvvcrwO3ENWD0gIBwDC9jITQnJ9FqGjxtpoBSoW
 J22orTG3mre4XecUqQK1xzls8xVwN3zX1zvj7aULs5K9VGKo13Shxh+iO
 OLk5QWEqLX8oIvJ4id87vbwezaCYJWSuGgNFyNNNSszIV0tm5auQcvw5T
 poGD0S8IlVH5ESrpk/Z03YkIhhQbsp28QHN3lPSml7rKYZXtgb/2xPk3j
 2muu5342SxV5H/yxlNQQg7Gk3pdWd2P7JZMCd9bF/Vbc1yQ/AkxefMgC0 g==;
X-CSE-ConnectionGUID: /jgYrtF4SgerhsnAZyVOVw==
X-CSE-MsgGUID: fo0ujzdASgug+LZXAfLjWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21495636"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21495636"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:01:33 -0700
X-CSE-ConnectionGUID: ZvbTeZlQQnCbZac9Qwkf6g==
X-CSE-MsgGUID: 0GPHrcCBSa6FwbCBUCOTHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57503158"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 04:01:27 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 2/4] lib/igt_core: Added message to runner about
 ignoring kernel warns
Date: Fri,  9 Aug 2024 13:01:10 +0200
Message-ID: <20240809110112.25685-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240809110112.25685-1-kamil.konieczny@linux.intel.com>
References: <20240809110112.25685-1-kamil.konieczny@linux.intel.com>
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
index 82f474c5f..c12488298 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1540,4 +1540,6 @@ static inline void igt_pci_system_cleanup(void)
 {
 }
 
+void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
+
 #endif /* IGT_CORE_H */
-- 
2.43.0

