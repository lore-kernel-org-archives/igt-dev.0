Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDD3C83F04
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 15:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEB210E86C;
	Thu,  3 Jul 2025 15:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbgA6Y2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83EE10E869
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751555062; x=1783091062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qRFCTksYE6BsB5EAwhm5t8cIs6ejfO47+9m9GuWtm+Y=;
 b=JbgA6Y2l18A+qx74zLfGhNwsJqWoPQHW0sNIIf0SY2Lqe3rQ+cETbIuV
 2ut38ziPKLC2oP3TaCOs9jcUL2WmLdcEk4pSFyqrMgQGk9vJe4OV/nIqD
 E3aK6ZJH7nZy9Kljdcx9b7t89SgckO9akuF2AfO413mE93cWsHL6V4oeF
 8IYfebq/6XC9W8fAIMhEMwmJZI0v3IscLgL0w6EXUU0g37+Mv7xO8Q7QC
 mGFylFGbiTEldxRPe/Mp7sU0PZi3BA042++a7D49jAd4bgXlNn/8Ys8Az
 I+5JuJAULCl5aKXJrlz4vWcwXOSvYBRs9/7MAcFye53/1PreyHBeRX5u7 w==;
X-CSE-ConnectionGUID: R5cGMubwSFWT6ZNGPE3HFQ==
X-CSE-MsgGUID: Q3Lseg4xQruHfRtqzlJxfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53603453"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="53603453"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:04:21 -0700
X-CSE-ConnectionGUID: oM5XUlk3QpS+L1aeTZ+O0w==
X-CSE-MsgGUID: 5Dt4OhxaSQusedywErK8XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="158952502"
Received: from jmkrefta-mobl2.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.255.250])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:04:20 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@linux.intel.com>,
 Lucas de Marchi <lucas.demarchi@linux.intel.com>
Subject: [PATCH i-g-t 1/2] igt_core: igt_hook_get_pointer() for external hooks
Date: Thu,  3 Jul 2025 17:03:03 +0200
Message-ID: <20250703150304.101208-2-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703150304.101208-1-peter.senna@linux.intel.com>
References: <20250703150304.101208-1-peter.senna@linux.intel.com>
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
Cc: Lucas de Marchi <lucas.demarchi@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_core.c | 12 ++++++++++++
 lib/igt_core.h |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index c2674a272..f7a1ee36c 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3604,3 +3604,15 @@ unsigned int igt_measured_usleep(unsigned int usec)
 
 	return igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
 }
+
+/**
+ * igt_hook_get_pointer: To allow for using hooks from other libraries, this
+ * function returns the pointer to the struct that is likely already
+ * initialized.
+ *
+ * Returns: Pointer to the igt_hook structure.
+ */
+struct igt_hook *igt_hook_get_pointer(void)
+{
+	return igt_hook;
+}
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 2db579423..2e65c89dd 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1601,4 +1601,13 @@ void igt_pci_system_cleanup(void);
 void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
 
 unsigned int igt_measured_usleep(unsigned int usec);
+
+/**
+ * igt_hook_get_pointer: To allow for using hooks from other libraries, this
+ * function returns the pointer to the struct that is likely already
+ * initialized.
+ *
+ * Returns: Pointer to the igt_hook structure.
+ */
+struct igt_hook *igt_hook_get_pointer(void);
 #endif /* IGT_CORE_H */
-- 
2.43.0

