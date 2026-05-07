Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5116CD343B
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 05:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E0610E21C;
	Thu,  7 May 2026 05:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1F0e5jG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B670D10E167
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 05:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778132114; x=1809668114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Awar4RCvmWBdrB23OW0hbpmZlSbSyKSv8TsiCRBvM9I=;
 b=N1F0e5jGbrAbtJLhTeySvG+G1nek2IbC01jdixnD0cfaHG5mwUiRViGd
 Hk8FkvarAyXoO5xf7Bs07gXAy+AELj7ehaeXz29rgqhEsfs3Xch9xehw5
 gvx+nw2WEZ0D4g83WZ75i/w6dszqm0Dh65baWVFkHBCUNYGq3UYqpwjnP
 bxcP+uKJDwnG8O3C32IUKvMuZWo2KqQmnD6+m8cDmIqMz6sv4fhQVx187
 U4dqHm7WbffSLczAr8oAUtFVr3b5J4fUz1CxkOlJZRmredeAAx3PY59xV
 brxw5QNpdkPmL3a3BEUD9XkMBNgn56J3kZMbzL/PBDrkbhNa+2IO0rFM5 g==;
X-CSE-ConnectionGUID: t5ABng5FQPawlYPl9a90BQ==
X-CSE-MsgGUID: wX02qA/pSiKjViTdAdivQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82916167"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="82916167"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 22:35:14 -0700
X-CSE-ConnectionGUID: 0PsKnmO5S76j5fgyDUdVQg==
X-CSE-MsgGUID: dbEYPkcOQNeHBOctHfhVrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="236621257"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 22:35:12 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH v6 2/2] tests/intel/xe_oa: Wa_14026633728
Date: Thu,  7 May 2026 11:04:59 +0530
Message-ID: <20260507053459.766300-3-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507053459.766300-1-shekhar.chauhan@intel.com>
References: <20260507053459.766300-1-shekhar.chauhan@intel.com>
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
 tests/intel/xe_oa.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 988c46df6..c464d5a0d 100644
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
@@ -2648,6 +2649,11 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	size_t report_size = get_oa_format(fmt).size;
+	/*
+	 * If modifying the indices or order of items inside properties[],
+	 * ensure that a corresponding change is made for oa_exponent index
+	 * in the workaround Wa_14026633728 below as well.
+	 */
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
@@ -2671,6 +2677,18 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	int len, check_idx;
 	u32 oa_status;
 
+	/*
+	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
+	 * Because of slower device mem access, OA exponent values lower than 8
+	 * can result in buffer overflows. Also, update the value of oa_exponent
+	 * in properties[].
+	 */
+	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT &&
+        igt_has_intel_wa(drm_fd, "14026633728")) {
+        oa_exponent = max(oa_exponent, 8);
+        properties[9] = oa_exponent;
+    }
+
 	igt_assert(buf);
 
 	igt_debug("Ready to read about %u bytes\n", buf_size);
-- 
2.53.0

