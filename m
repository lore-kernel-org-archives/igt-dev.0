Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0BDC83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 13:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676C710E442;
	Mon, 30 Jun 2025 13:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnRYl1XZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F4A10E228
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751290656; x=1782826656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zd08p4m/0YxyMUc5g1d8rlpeccWIlyDTeYzVkimzBTE=;
 b=BnRYl1XZqhh0nB1PBykKG/w4s1RAfIe/TIeNaDZceTPROCOm3xnwxK7G
 4dDINJ/hQ7/cNEPHUBhGlwq4ICmlD6vW2CDiZylJ2zbDksGUXXXNXYGYS
 FeeElC+KuzHB4LENHkEYhuyODMb4lginjLKLiKRsfpfqAQNwZqP8gs/4K
 U1GPpdapFhBprV5C+CnnUuucYSEoZWluevhQQ/Eu/yvG1orK3mhbozaaZ
 jihDuVoobGPgEUGOF7ioft1s/8ZjGHcBQ/Y42k6MFDxeNiO9Jm1JXrbzq
 SbcCXaEGRkuV6ZmxmLBLBb3ph25LzHvD65m4lzT2HPinRvDjJ7WyDVcjp A==;
X-CSE-ConnectionGUID: 104Ry4tVRwqukBH9F8rvOg==
X-CSE-MsgGUID: QChvB3nyRFGHPHrsdMKqXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57322561"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57322561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:37:36 -0700
X-CSE-ConnectionGUID: 4A/3kc0SSI2YAxeWxowK+w==
X-CSE-MsgGUID: i6g9Jz9FRCy+odjrxAwSUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="159188311"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.227.88.71])
 by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 06:37:35 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH v5 2/7] lib/i915/intel_fbc: Add fbc supported check based on wa
Date: Mon, 30 Jun 2025 19:11:40 +0530
Message-Id: <20250630134145.836-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630134145.836-1-mohammed.thasleem@intel.com>
References: <20250630134145.836-1-mohammed.thasleem@intel.com>
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
v5: Updated function discription and return logic. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/i915/intel_fbc.c | 27 +++++++++++++++++++++++++++
 lib/i915/intel_fbc.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index a8ded0a59..a1a6de90e 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -9,6 +9,7 @@
 #include "igt_psr.h"
 
 #include "intel_fbc.h"
+#include "intel_wa.h"
 
 #define FBC_STATUS_BUF_LEN 128
 
@@ -200,3 +201,29 @@ bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
 
 	return fbc_supported;
 }
+
+/**
+ * intel_is_fbc_disabled_by_wa
+ *
+ * @fd: fd of the device
+ *
+ * This function check if WA is present on some GT, which in turn make
+ * FBC not possible
+ *
+ * Returns:
+ * true: if WA is applied and FBC id disabled
+ * false: otherwise
+ */
+bool intel_is_fbc_disabled_by_wa(int fd)
+{
+	int wa;
+	const char *wa_fbc_disabled = "16023588340";
+
+	if (!is_xe_device(fd))
+		return false;
+
+	wa = igt_has_intel_wa(fd, wa_fbc_disabled);
+	igt_assert_f(wa >= 0, "WA path not found on GTs\n");
+
+	return wa == 1;
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
2.25.1

