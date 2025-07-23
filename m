Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E706CC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 10:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCB510E11C;
	Wed, 23 Jul 2025 10:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCRK+zPv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997C10E11C
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753267462; x=1784803462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q7F9jLfFarfNpm+3yZRftI/IGhBOWdOCt7TT8CNF+zw=;
 b=YCRK+zPvU+cTPZhleNYC39GNGtZCrLeaw7T4UjqT85yZDhiDA8K5PsQM
 dhVqBliscgWtCJfl+1/TueAEllFK44OfNx1korDH9YkUdmc+ibU3hCt13
 umySbhNVqRWZFmj2fvLZf80RjtdvWT0DDXdb5Finth5HJfuIlPwltqJm+
 9ekG5BQFytJG+RiXqnDV+6cttV49SGAjv4SNegOkFhUmgeR+EEJe1a67r
 AcNW4uqe611Z1M1x8+ja19vM8ui+PqOR2mF9Jd0n5knKgfC1tuK5ANctN
 CoJ2N1wkbvHO9mz0HwdycdiWmQ3jfiBr2+cH08RIgjG3QTF0ToAv2wGKw Q==;
X-CSE-ConnectionGUID: eFiCVcVSQa6VpifpPAN+iw==
X-CSE-MsgGUID: zSXH5p3MSE2k+ThXxPxiJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55393780"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55393780"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:44:22 -0700
X-CSE-ConnectionGUID: NzaAcvDwQ3O0VF15zYVO+Q==
X-CSE-MsgGUID: Je0tHt+8S+GFzxjmpkh7gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159984228"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:44:19 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v4 i-g-t 1/3] lib/igt_core: Expose igt_hook pointer for other
 libs
Date: Wed, 23 Jul 2025 12:44:04 +0200
Message-ID: <20250723104406.58784-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723104406.58784-1-peter.senna@linux.intel.com>
References: <20250723104406.58784-1-peter.senna@linux.intel.com>
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

Previously, all igt_hooks were defined, initialized, and freed within
lib/igt_core.c, limiting hook creation to this file. To enable other
libraries to add hooks, introduce a function that returns a pointer to
the main hook structure.

This change allows hooks to be created from external libraries without
requiring separate initialization or teardown of the hook
infrastructure.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v4:
 - changed subject

v3:
 - unchanged

v2:
 - change function name to igt_core_get_igt_hook()
 - remove duplicated documentation from header 

 lib/igt_core.c | 12 ++++++++++++
 lib/igt_core.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index c2674a272..4bfffc3a8 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3604,3 +3604,15 @@ unsigned int igt_measured_usleep(unsigned int usec)
 
 	return igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
 }
+
+/**
+ * igt_core_get_igt_hook: To allow for using hooks from other libraries, this
+ * function returns the pointer to the struct that is likely already
+ * initialized.
+ *
+ * Returns: Pointer to the igt_hook structure.
+ */
+struct igt_hook *igt_core_get_igt_hook(void)
+{
+	return igt_hook;
+}
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 2db579423..e658737b0 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1601,4 +1601,6 @@ void igt_pci_system_cleanup(void);
 void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
 
 unsigned int igt_measured_usleep(unsigned int usec);
+
+struct igt_hook *igt_core_get_igt_hook(void);
 #endif /* IGT_CORE_H */
-- 
2.43.0

