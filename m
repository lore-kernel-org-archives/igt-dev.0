Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9928CFF885A
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 05:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D11810E0CF;
	Tue,  5 May 2026 05:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzdm0AuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9057910E0CF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 05:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777960074; x=1809496074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sPo33kV1qScrr7KLC6dvpILfFaGc3NbnlK+8yo6CcFk=;
 b=mzdm0AuXWwq4ji+opN/BxmC5QvOVjBVf6w6g8Q4knWgxO/BSX1UaLFRv
 SfG4MmV8fScuJs3FOFQJL8+EeuAgM/qyAkDXHDkm4pcFrPOcM1RBXOx9j
 oF+IFfzFDscoxsB5hyBp42UYOxzHx9evp48Cjd7M/vvGiE7lMs2vQX5uf
 aQbOkL7Y7vKmviJXBmlSnr1QDbw/KrDWWc4NO4piPH5hu9qpk73PuYuuH
 /qhwc5p/8Im9A8nDD27vURBlwCs3KAHbFVjM7NUXxJg+dNQLrnwoSEeqx
 BUnnE4kGBb61/wBGdCJcDOMveP7arWjP9aqINUY83MtWcT2DYWeIv11ON g==;
X-CSE-ConnectionGUID: WitfdnRFQT2oIiMBN4hBqQ==
X-CSE-MsgGUID: M32WJDQFSsSPI4dpxv6jbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="79013921"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="79013921"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:47:54 -0700
X-CSE-ConnectionGUID: NqgtZzl+SQeomUKPTSonMw==
X-CSE-MsgGUID: C7nn881bTxay7hGo3VEXVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="232579942"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:47:52 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com,
 gustavo.sousa@intel.com
Subject: [PATCH v4 2/2] tests/intel/xe_oa: Wa_14026633728
Date: Tue,  5 May 2026 11:17:41 +0530
Message-ID: <20260505054741.486361-3-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505054741.486361-1-shekhar.chauhan@intel.com>
References: <20260505054741.486361-1-shekhar.chauhan@intel.com>
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
index 988c46df6..c7e756426 100644
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
+			       igt_has_intel_wa(drm_fd, "14026633728") > 0) ? 8 : 0);
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	size_t report_size = get_oa_format(fmt).size;
-- 
2.53.0

