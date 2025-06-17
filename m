Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0E0C71157
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 19:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863FD10E15B;
	Tue, 17 Jun 2025 19:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/llEwP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14EC10E15B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750188410; x=1781724410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JaWOly7N3XsqRd47/IIJTP/HjWol9TqHFRrlpQEPBok=;
 b=Q/llEwP/sFvYmb4rfkZQvfUg4xhKl5UTbuKCHYK19VPCo9CMkpySSxXw
 JqQ6b+caGcRppVSaR7fIgr4pLkRZiC/7c5bI+Z2ifdpUghr9+wOEdMBo0
 Z3TIXbmsf8h9/c9OdTIxr/glaRZfy7ux7pmYNsXLtaWuG/AA/kVHQm3hx
 IPyH3qk4smJqWJS4QXbjud+qDxnaZR1uf/ddPM4N6LBnomN/YTArrDQQJ
 JJ+tR3EJPABhC++AE9/wO+VMKlViKZa/PAhpctJiAqyRrWVFRem24Xd7q
 jUG7GGKH1LAxg0GtVSuD2yxASWQJYPvqGHQyg6pQoBRoeEQK70P7zj9h6 w==;
X-CSE-ConnectionGUID: snoxsH1GQ1+EcIx6ADiWIg==
X-CSE-MsgGUID: 0PgO6gCcTLKZDfJgvNpRjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52523992"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52523992"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:26:50 -0700
X-CSE-ConnectionGUID: e88khuG2To+8wq5U23hXZQ==
X-CSE-MsgGUID: QLRlmdWsSu2VR8pWaQI/zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148807873"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 12:26:49 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH v2 2/7] lib/i915/intel_fbc: Add fbc supported check based on wa
Date: Wed, 18 Jun 2025 01:00:23 +0530
Message-Id: <20250617193028.107483-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617193028.107483-1-mohammed.thasleem@intel.com>
References: <20250617193028.107483-1-mohammed.thasleem@intel.com>
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

This will check the fbc supported based on given workarunds.

v2: Add intel_wa header file.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/i915/intel_fbc.c | 22 ++++++++++++++++++++++
 lib/i915/intel_fbc.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index a8ded0a59..623eabed4 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -9,6 +9,7 @@
 #include "igt_psr.h"
 
 #include "intel_fbc.h"
+#include "intel_wa.h"
 
 #define FBC_STATUS_BUF_LEN 128
 
@@ -200,3 +201,24 @@ bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
 
 	return fbc_supported;
 }
+
+/**
+ * intel_is_fbc_supported
+ *
+ * @fd: fd of the device
+ * @wa_fbc_disabled : WA to be checked
+ *
+ * This function pass the WA to igt_has_intel_wa to check WA on available GTs
+ *
+ * Returns:
+ * true if wa is not equal to 1, and false if wa is equal to 1
+ */
+bool intel_is_fbc_supported(int fd, const char *wa_fbc_disabled)
+{
+	int wa;
+
+	wa = igt_has_intel_wa(fd, wa_fbc_disabled);
+	igt_assert_f(wa >= 0, "WA path not found on GTs\n");
+
+	return wa != 1;
+}
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index fcafe6049..0db1fa14a 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -19,5 +19,6 @@ bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
 void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
 bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
+bool intel_is_fbc_supported(int fd, const char *wa_fbc_disabled);
 
 #endif
-- 
2.34.1

