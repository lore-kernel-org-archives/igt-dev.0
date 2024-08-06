Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD6BC3DA64
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 14:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BFA10E3AD;
	Tue,  6 Aug 2024 14:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMSOCRdT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0CE10E39D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722955428; x=1754491428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EwFImq7P9tSd6Na4CPcYMFbn4avUWGWKYGDUWUe5W3Y=;
 b=dMSOCRdTsD4OuSCcpHWXu4rpg9MyHo09UvyQa82+4fIQLkh47Qc5K4xu
 KYhZ6D9HvVKuHRfGySbwTY+Us/FqF3tk3q/IvmfPMUr6Kx8cvhrILYmy0
 p9QNiDe6R8MkhlOpHtbB04aJg0D+rnSGc397LJ0xBbkBGF6F11xxP1LzM
 K0Bekq9+smw14kGKnQbxo0S8d3zra5D6jIDzJzhJbGIftpmQQmv7OUEsg
 GkQHQe7FfZ2Jyj09XKGJZiG1qXSqKPReNpWoDylpNBhfUxVunxsbsEVtC
 uxBaDthCTPRyL34cU8KAAhjdt5NbFldRK4XkOfUqW2iSm3bp34X7dvQ3c Q==;
X-CSE-ConnectionGUID: Vu9GjqinSyOOvdga5TvS1Q==
X-CSE-MsgGUID: 6ScbfdeQSW+eXkTmFRB/1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24766617"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="24766617"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:43:47 -0700
X-CSE-ConnectionGUID: +EyiVnW4RVysEMqj/X2CZA==
X-CSE-MsgGUID: ij2LEy+QThifkJdHirF1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="56606678"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 07:43:46 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/4] lib/igt_core: Added message to runner about
 ignoring kernel warns
Date: Tue,  6 Aug 2024 16:43:30 +0200
Message-ID: <20240806144332.80609-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
References: <20240806144332.80609-1-kamil.konieczny@linux.intel.com>
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

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 19 +++++++++++++++++++
 lib/igt_core.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ff3e0392..6523e33df 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3432,3 +3432,22 @@ int igt_pci_system_init(void)
 
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
+	GRegex *re;
+
+	re = g_regex_new(ignore_dmesg_regex, G_REGEX_OPTIMIZE, 0, NULL);
+	igt_assert_f(re, "Error in regexp '%s'\n", ignore_dmesg_regex);
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

