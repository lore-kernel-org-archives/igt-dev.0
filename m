Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97232C83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 13:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD7B10E5CB;
	Tue, 15 Jul 2025 13:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="je6o99Ni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902A710E5C6
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752586665; x=1784122665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N8SV29Dnmun/1xrgYFSfjOORjABdeWP0x+Jtsgd+ol0=;
 b=je6o99Nikb7W1Je5Zpe6dwxBAAdmaL/0LeWz0BJLaILhYm7D1sLCR+tW
 OWEhkBDHifH9H05H9+r+FW5bA3jmh9IexOsJuTK2PE2cPKLvF2DBTaQ2e
 toXhUtO+3S+86/PaCIniyxTi9tL8abCjPrhnElbl9T16gB5hDs8B/bsD+
 zkawu4AmkjrtHJ3Wk2T8vNkzPowbr6a+0LGjWHxz3g9IgG1yX9YPgdOcM
 Wwf/k6NJD9Z93hcZSgB8TEAKIeS2ucpBIjWEHw9ID23h6Tdg5rnMfguvb
 dB7WzlAU5B9BvTJbD3154C9ADK/5x4aPxLXLbOZ0U3QU9Tuza3JEwXzEO g==;
X-CSE-ConnectionGUID: yHDC0rNjRJmROE1i+U0srQ==
X-CSE-MsgGUID: IyKOVqWETt++W15mmk6T5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54779991"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54779991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:37:45 -0700
X-CSE-ConnectionGUID: GR86QX2sQnqV/GTvg9+3hg==
X-CSE-MsgGUID: OGX/LKFkQTKqYMHDnLoO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="156886357"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 06:37:43 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 i-g-t 1/2] igt_core_get_igt_hook: igt_hook pointer for
 other libs
Date: Tue, 15 Jul 2025 15:37:21 +0200
Message-ID: <20250715133722.32559-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715133722.32559-1-peter.senna@linux.intel.com>
References: <20250715133722.32559-1-peter.senna@linux.intel.com>
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
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
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

