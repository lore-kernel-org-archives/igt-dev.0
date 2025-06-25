Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471D0C7EE31
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 20:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2B710E121;
	Wed, 25 Jun 2025 20:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRPMt5An";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CE210E121
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 20:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750882112; x=1782418112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FuF/xt2vwvi0BX3+FxW/poy0QRghzkIczSNIQffbR0o=;
 b=iRPMt5Ani0H4LwiVUUAp0+TCEOYByG2jpUyLxA+nO1DfYuwLNTIDsy+q
 /QiBfqHK1ng5c5OjqDBrPLyeGbuh5bx0QW5PpVqaewUc3jEt5mGNdBNA3
 NP4wHY/+Ab+89tX/pEWUg73m/aWmGlVdwnU8X6OKRZ9qMIbo0511YgTg2
 IBfDVusBuK/twyjDMwW2pXUYXV5mQiRgvhAX6z1031MGb9lUlaD1FbAm0
 h94WJ9hFcJ3oTJ7kRixDpbesLviezCcOVqDqaYjG9mv5dukh28rQlEqFW
 R26nXZr23+PLtcqiHzxnh30sxbNwYmZqqAQqjSugO++m3X+/EWj1JHxDJ g==;
X-CSE-ConnectionGUID: WastX7gAQ5K0eZjdY49UVw==
X-CSE-MsgGUID: TxFPw8jfT42BtnWCqg6eiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63766183"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63766183"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:08:32 -0700
X-CSE-ConnectionGUID: BRi8wCRCRHSkhyfB/kjRTQ==
X-CSE-MsgGUID: T7X79jNjRfyH2OB5+1q/8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="153033367"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2025 13:08:31 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH v3 2/7] lib/i915/intel_fbc: Add fbc supported check based on wa
Date: Thu, 26 Jun 2025 01:37:33 +0530
Message-Id: <20250625200738.34381-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625200738.34381-1-mohammed.thasleem@intel.com>
References: <20250625200738.34381-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/i915/intel_fbc.c | 25 +++++++++++++++++++++++++
 lib/i915/intel_fbc.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index a8ded0a59..33cef5034 100644
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
+	if (!is_xe_device(fd))
+		return true;
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

