Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0F8C52D7B
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 16:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25B710E794;
	Thu,  8 Aug 2024 16:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKoU5eA7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D234510E794
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Aug 2024 16:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723135697; x=1754671697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LrGIDOrJ1FRByGAz9QimE+lbJUFSJBKH69C0kj/inFs=;
 b=WKoU5eA7ZmlcAtyMMUjzr3fCHfTg6l+gynWAn5jqZlxdwsCMlvariAHW
 /0Tj6q3uKco2risR0Lbi7ICBNx1T2BPYi4xZNSz1VxosBxSSx0UwyhxY+
 kN/O8SGasuJsxFI0EOa14+tQ47EvSkVFdLNNBiHIiiPFUw4nVtEHVvoSZ
 vMgm936ZfDqCbZ7yCl3DqaOaQZIHKKRlRSbxJuBd6fW4EKdUTS4Vnqo1v
 cKsgPkYuEPZjlEx+7LFtobH8hVn2MfTQiqxGgHuwcgmYWoPqCqIzv+4x5
 NCoqUbeMSaBLi/qKA2crQlIyhHJhM8NNjv+AQIacz3mulWpDnjSO+XDro w==;
X-CSE-ConnectionGUID: OdokS4IzQ3GA7OwlL7wtiw==
X-CSE-MsgGUID: e1VQPAgSSnuLDR2v8slU9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43794160"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="43794160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:48:16 -0700
X-CSE-ConnectionGUID: I25IDKZ/RhqG8oyOqkf4bg==
X-CSE-MsgGUID: khjgsz2hTWGWg4i+Qr87Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57520173"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.125.108.94])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 09:48:16 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 2/4] lib/igt_core: Added message to runner about
 ignoring kernel warns
Date: Thu,  8 Aug 2024 18:47:57 +0200
Message-ID: <20240808164759.133621-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808164759.133621-1-kamil.konieczny@linux.intel.com>
References: <20240808164759.133621-1-kamil.konieczny@linux.intel.com>
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

