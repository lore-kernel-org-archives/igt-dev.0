Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D81FC3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 12:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86EF10E7EC;
	Thu, 25 Jul 2024 12:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4MPIB0P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8040910E7EC
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 12:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721911821; x=1753447821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgSdA6kyqE7/eAHi+yiNGySW2TTV9zyoAniQMb1oj0o=;
 b=A4MPIB0PLOfe5KBgHDtEjJK/Rcb9ZNeB1s056+w1I6w9nqngtXC0mEnj
 5+AkkT8iGlFtS7zTHRTsT7yGk/0Ri8WU1+5evSjCvwKuyLKA8CrJsaelM
 A2iydre6u8LSBHIxUUd6lpOUY6kSMBn7vrENKk3nHX2mEsf0f//lGGr+6
 /8Sj+clgR6p3uHi1y390+8u8fOg9J7mWskNl1M4YKUgivtm8WlV0FAlAe
 8wUxs/RrsCoaymrUd0b2j9Ru/sqEnPcwjgiCLL5fYOvr9Zss0DllqIppL
 g7dCMbIEyW/v+J//GLyQWitoLq4r9cMfG0IeQj9ilTq7KnTtS/kXySrMK A==;
X-CSE-ConnectionGUID: uZfvIFn4RZCpE59L8Ys7Hg==
X-CSE-MsgGUID: SwpaodZCRfafTpDmgI1FqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19522047"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="19522047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:50:20 -0700
X-CSE-ConnectionGUID: 7GOHdB/QS6CvJBgckhbaHw==
X-CSE-MsgGUID: ey4cxMSERvWZ4bly6QjLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; d="scan'208";a="53686311"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.225])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 05:50:19 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/4] lib/igt_core: Added message to runner about
 ignoring kernel warns
Date: Thu, 25 Jul 2024 14:50:04 +0200
Message-ID: <20240725125006.30041-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
References: <20240725125006.30041-1-kamil.konieczny@linux.intel.com>
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
will encouter such message, it will save it and then temporarily
ignore kernel warnings or errors which matches given regex.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 14 ++++++++++++++
 lib/igt_core.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ff3e0392..647486ba9 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3432,3 +3432,17 @@ int igt_pci_system_init(void)
 
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
+
+	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
+}
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 084d94da7..22bdc0b73 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1522,4 +1522,6 @@ static inline void igt_pci_system_cleanup(void)
 {
 }
 
+void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
+
 #endif /* IGT_CORE_H */
-- 
2.43.0

