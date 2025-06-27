Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417FCC7EE3A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 06:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8D810E96B;
	Fri, 27 Jun 2025 06:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOE9kq7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52010E96B
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 06:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751004044; x=1782540044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/DUCUNZwA6zzddKQO4k1QwJ07nmGUJSPwr15SMUoEg=;
 b=JOE9kq7lLYXMrpClyvf9Ih+lttLIZg9PyBqD4/DJc1nEGPybfrdGecQQ
 u3MeWFxQ4bad1dPnfAxDkuZq4atE1cYznjD51bCiW5BKyLioV04GrJKyG
 XTEhyD8HDuMj3tttdhN6MzYoiDNbZUWGuttp6ZGGmClBJ8voaiK1UfcaS
 fgPALpM3YWsNqqZkjd3g4solV32O8kWUWhocwlfPlBb/b2uCQOW9ojFif
 Knhp22mT+a1vLkyMQQjyhDj3uIW8pdmn7x7Uj+Y9iX1LUBe+xI9rvz8iE
 INbaNvz8xPQYXV4bEj4Tp93/hjfmY8812rtbxh50nEQ1zznaFcXAXU3nS Q==;
X-CSE-ConnectionGUID: efQV9z+DTtqKeSWwcUnpzQ==
X-CSE-MsgGUID: DuU3prInR2mOHWv//m9X2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53278507"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="53278507"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:00:43 -0700
X-CSE-ConnectionGUID: RyrUnarOS7+YEL8gafjpBA==
X-CSE-MsgGUID: XbMSI9i/Suu4NFXmBPCupQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152809442"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 23:00:42 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH v4 2/7] lib/i915/intel_fbc: Add fbc supported check based on wa
Date: Fri, 27 Jun 2025 11:34:41 +0530
Message-Id: <20250627060446.29615-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627060446.29615-1-mohammed.thasleem@intel.com>
References: <20250627060446.29615-1-mohammed.thasleem@intel.com>
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
v3: Add xe check. (Kamil)
v4: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/i915/intel_fbc.c | 25 +++++++++++++++++++++++++
 lib/i915/intel_fbc.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index a8ded0a59..722899432 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -9,6 +9,7 @@
 #include "igt_psr.h"
 
 #include "intel_fbc.h"
+#include "intel_wa.h"
 
 #define FBC_STATUS_BUF_LEN 128
 
@@ -200,3 +201,27 @@ bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
 
 	return fbc_supported;
 }
+
+/**
+ * intel_is_fbc_disabled_by_wa
+ *
+ * @fd: fd of the device
+ *
+ * This function pass the WA to igt_has_intel_wa to check WA on available GTs
+ *
+ * Returns:
+ * true if wa is not equal to 1, and false if wa is equal to 1
+ */
+bool intel_is_fbc_disabled_by_wa(int fd)
+{
+	int wa;
+	const char *wa_fbc_disabled = "16023588340";
+
+	if (!is_xe_device(fd))
+		return true;
+
+	wa = igt_has_intel_wa(fd, wa_fbc_disabled);
+	igt_assert_f(wa >= 0, "WA path not found on GTs\n");
+
+	return wa != 1;
+}
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index fcafe6049..fe9edcbc3 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -19,5 +19,6 @@ bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
 void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
 bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
+bool intel_is_fbc_disabled_by_wa(int fd);
 
 #endif
-- 
2.34.1

