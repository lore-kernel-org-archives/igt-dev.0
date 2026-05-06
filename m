Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934BCCD3427
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 02:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A53210E4D6;
	Wed,  6 May 2026 02:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2bvIKDv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3A410E4D6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 02:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778035503; x=1809571503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zoFuN1YE1LgxpIXjoATXNX3O6VvT5X8i5EGz7MaR0LE=;
 b=C2bvIKDv44WrA/NQhjiil+Fx+EVEMJhP0/C60Jb9QP9EXNR4o+/pnQrk
 bbvADmE0ABQmvwIPve+Ex9tSkeGJD+UwfbyXzdxuXB/Bu1buIVz6pzTH1
 BOrXkDXaT7HmkCisjd/6nXO+mdxcAsqQadp+p01cLEmLQMz6RgLjM91CM
 QxrOOMDBxbr3/ESBcYm750u7rPWFLGHILqvJDjbvdb4RNZ0/2j8xZ1d4L
 7yYTnWpZ8DMmVczlgk0eYGGnaIuGNwfIS+zqM5t1CznwBg4Blz4Rhww7F
 6WgREnj6qe8WKTzRotq7Xfkw4oRZFAa6e3qO/cyKqkxanONLiu4vXT8Ao A==;
X-CSE-ConnectionGUID: Hyily6vrQPqy4wBut377OQ==
X-CSE-MsgGUID: nZCd/Q7LThaOm206r8nANg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78780570"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78780570"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 19:44:56 -0700
X-CSE-ConnectionGUID: rRNkZF4lSH6mf3I9zfxKTg==
X-CSE-MsgGUID: VZkkWkB1QbuePYIeAOZ6Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="239964089"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 19:44:56 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com,
 gustavo.sousa@intel.com
Subject: [PATCH v5 2/2] tests/intel/xe_oa: Wa_14026633728
Date: Wed,  6 May 2026 08:14:43 +0530
Message-ID: <20260506024443.612636-3-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506024443.612636-1-shekhar.chauhan@intel.com>
References: <20260506024443.612636-1-shekhar.chauhan@intel.com>
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

For MERTOA in CRI, oa buffer can be in device memory. Because of slower
device mem access, OA exponent values lower than 8 can result in buffer
overflows. Bump the OA exponent value.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/intel/xe_oa.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 988c46df6..67db20168 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -24,6 +24,7 @@
 #include "igt_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
+#include "intel_wa.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_oa.h"
@@ -2643,8 +2644,15 @@ test_buffer_fill(const struct drm_xe_oa_unit *oau)
 static void
 test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 {
-	/* ~20 micro second period */
-	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+	/*
+	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
+	 * Because of slower device mem access, OA exponent values lower than 8 can
+	 * result in buffer overflows.
+	 * By default, use ~20 micro second period.
+	 */
+	int oa_exponent = max(max_oa_exponent_for_period_lte(20000),
+			      (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
+			       igt_has_intel_wa(drm_fd, "14026633728")) ? 8 : 0);
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	size_t report_size = get_oa_format(fmt).size;
-- 
2.53.0

