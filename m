Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58149C677C4
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 17:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B27110E2D2;
	Tue, 10 Jun 2025 17:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEFHRcoV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1594210E288
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 17:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749577142; x=1781113142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wTtHOrFwlWl7BeUR9se5mCBzu9YAPegauQaiDu3e3TA=;
 b=fEFHRcoVBlj+yw+vELaHV3crckpCbvaeGWN9YtBs8UIyOfA4IlNCYVEO
 0TA5pIvxSqGHBdxL/CNKbgmqkPML17l+aOutCbJw4usDQUjw10VQEaoO3
 xt6xNv2mIIHQEcb14HCgur4xSi8ZNQcM0GCXPjE0S4y+U14WTIEXEdEI9
 S/OU6IaRF46BLr88z85l7uy3ZOTqoX0UyhKHNfP/Mh5FqS0+Hni/eTN2s
 pF9/PUl4E3/CiDPAfhWJlkxPaDKIHmifjbO1/s2HDnXBF885jSQBqjCBb
 CBNYXK+R6Zqb5EU7Q7nXochiMXff6XMC3CiYcjduBxcB1hREAUtj/Zv+U w==;
X-CSE-ConnectionGUID: LlfMBePkSLyaPmOy2rFRIg==
X-CSE-MsgGUID: pilhU9G3Rum3VyfhIR0Iiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55505942"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="55505942"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 10:39:02 -0700
X-CSE-ConnectionGUID: HZgrDPyxSWyz26Ev+qz7+A==
X-CSE-MsgGUID: LY/ZgicBQ/mHLrDxvIE80g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147854435"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 10:39:01 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 2/7] lib/i915/intel_fbc: Add fbc supported check based on wa
Date: Tue, 10 Jun 2025 23:12:39 +0530
Message-Id: <20250610174244.1292-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610174244.1292-1-mohammed.thasleem@intel.com>
References: <20250610174244.1292-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/i915/intel_fbc.c | 21 +++++++++++++++++++++
 lib/i915/intel_fbc.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index a8ded0a59..015523773 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -200,3 +200,24 @@ bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
 
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

