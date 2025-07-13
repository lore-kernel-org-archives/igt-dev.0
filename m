Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83381C83F20
	for <igt-dev@archiver.kernel.org>; Sun, 13 Jul 2025 11:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7A910E16B;
	Sun, 13 Jul 2025 11:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imz1XcWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4527810E0F6
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Jul 2025 11:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752405856; x=1783941856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VmsEg41jnTg04Pp/H0FmXEacGX+qJ+4fJtvrzHPvDjA=;
 b=imz1XcWTqG4iIrKFVKuTmR6ZzvGbL9jmb0i9Ej7rtqn/vzQFs7dGKHoD
 4sbDVSOKkUBJD7nH50NuG2iIyntBkbBzG9unSZUDxenQb3YVsscf9lQGF
 fM6cmz4WXiL2/1/iAmPJlEMNbUEWX2pTo+R6bLlQfBOqpnsEmoFO46aIZ
 leZfmLWKZqB0WOQeENRxA44aazx66tiTeYSTvzBaF138vXV/x6XTJRzmZ
 sWu6+GWu/e3B9XDV3/fMKyWyzm80ptkyynAjH6WOXxMMbwETPHnCK8O6P
 qyMwiP25lG/qUnUF5Rk6gRg39VLa54QQHoHGq4ZHz/FHsUVqjQ+TW5O2i Q==;
X-CSE-ConnectionGUID: tAY2iwiKRwODsovqKxuhZA==
X-CSE-MsgGUID: 6G3g3NhhQlypfXp8taTu+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72070740"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="72070740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 04:24:16 -0700
X-CSE-ConnectionGUID: VzAIxWBxT3m6mJ4W0aIA9w==
X-CSE-MsgGUID: fxTo4ihyQdus5f7uS7NWYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; d="scan'208";a="156126319"
Received: from bleysen-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.96.65])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 04:24:15 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/2] igt_core_get_igt_hook: igt_hook pointer for
 other libs
Date: Sun, 13 Jul 2025 13:23:53 +0200
Message-ID: <20250713112354.32032-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713112354.32032-1-peter.senna@linux.intel.com>
References: <20250713112354.32032-1-peter.senna@linux.intel.com>
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

Cc: Gustavo Sousa <gustavo.sousa@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---

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

