Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073FDEEB571
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 20:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B4310E91C;
	Wed, 31 Dec 2025 20:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdyGSeUy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2395610E412
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767212413; x=1798748413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q5XUZ+OzE+aXSzq+CGRR3yjBlPL5Uiis1uYkPf4PLRY=;
 b=BdyGSeUytZXdsZzMjDqPC0pRMD+Z4ssm05B2nyPu5djOLP0FLa84jim1
 hpBJdo8XOoYccwtzCxoDk5heWmOZWMK3QbU4YzoAedgUfuXkn5vO1++Zi
 fiixDwnpAckTbS+B3w82Hdt85Gxn+sM3MSTFMQfEqSIQfbjtMEpLSWYKL
 5qvwTzs23t71j5n2MmHY3kFi+swGD5/QOydHEd+kcbkcMfDQC/V77UgtD
 eGuQGQ8bS5iqzkDZFVRy89sAcANRmjeqQFeUHNLOoZiSH2wohYpEDXL1Z
 l66mCVkWE/+F1X84jQAaseqKxZGdHY0RKgjRHQmez2JPCYkS21fxmY/NJ Q==;
X-CSE-ConnectionGUID: 9yt/9HjYTdm89A8zZNZY2Q==
X-CSE-MsgGUID: wAdHulPmTl2c0CsRjshQdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68844911"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68844911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 12:20:13 -0800
X-CSE-ConnectionGUID: Vwoyg5aHRaqa7DMBrTLHNg==
X-CSE-MsgGUID: Dt5h5+pMQTelO8QsTlDIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="224998659"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa002.fm.intel.com with ESMTP; 31 Dec 2025 12:20:12 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v10 3/5] tests/xe_pat: add pat-sanity subtest for debugfs vs
 getters
Date: Wed, 31 Dec 2025 20:20:08 +0000
Message-ID: <20251231202010.115619-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231202010.115619-1-x.wang@intel.com>
References: <20251231202010.115619-1-x.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a new pat-sanity subtest that reads the Xe PAT software
configuration from debugfs and validates it against the
existing PAT index helper getters.

V2: (Matt Roper)
 - Use igt_assert_f() instead of igt_require_f() for PAT debugfs
parsing failures (treat as test failure, not skip).
 - Drop PAT entry dumping to reduce test noise.
 - Use igt_assert_eq() to improve failure diagnostics.

CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_pat.c | 80 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2fd3635fd..cb2159aca 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -18,6 +18,7 @@
 #include "intel_blt.h"
 #include "intel_mocs.h"
 #include "intel_pat.h"
+#include "linux_scaffold.h"
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -76,6 +77,82 @@ static void userptr_coh_none(int fd)
 	munmap(data, size);
 	xe_vm_destroy(fd, vm);
 }
+#define REG_FIELD_GET(__mask, __val) \
+	((uint32_t)FIELD_GET(__mask, __val))
+
+#define XE2_NO_PROMOTE	REG_BIT(10)
+#define XE2_COMP_EN	REG_BIT(9)
+#define XE2_L3_CLOS	GENMASK(7, 6)
+#define XE2_L3_POLICY	GENMASK(5, 4)
+#define XE2_L4_POLICY	GENMASK(3, 2)
+#define XE2_COH_MODE	GENMASK(1, 0)
+
+#define L3_CLOS1		1
+#define L3_CLOS2		2
+#define L3_CLOS3		3
+
+#define L3_CACHE_POLICY_WB	0
+#define L3_CACHE_POLICY_XD	1
+#define L3_CACHE_POLICY_UC	3
+
+#define L4_CACHE_POLICY_WB	0
+#define L4_CACHE_POLICY_WT	1
+#define L4_CACHE_POLICY_UC	3
+
+#define COH_MODE_NONE	  	0
+#define COH_MODE_1WAY		2
+#define COH_MODE_2WAY		3
+
+static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
+{
+	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
+
+	igt_assert_f(parsed > 0, "Couldn't get Xe PAT software configuration\n");
+
+	return parsed;
+}
+
+/**
+ * SUBTEST: pat-sanity
+ * Test category: functionality test
+ * Description: Test debugfs PAT config vs getters
+ */
+static void pat_sanity(int fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	struct intel_pat_cache pat_sw_config = {};
+	int32_t parsed;
+	bool has_uc_comp = false, has_wt = false;
+
+	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
+
+	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
+		for (int i = 0; i < parsed; i++) {
+			uint32_t pat = pat_sw_config.entries[i].pat;
+			if (pat_sw_config.entries[i].rsvd)
+				continue;
+			if (!!(pat & XE2_COMP_EN) &&
+			    REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
+			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC) {
+				has_uc_comp = true;
+			}
+			if (REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
+			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT) {
+				has_wt = true;
+			}
+		}
+		if (has_uc_comp)
+			igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
+	}
+	else {
+		has_wt = true;
+	}
+	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
+	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
+	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
+	if (has_wt)
+		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
+}
 
 /**
  * SUBTEST: pat-index-all
@@ -1230,6 +1307,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		xe_device_get(fd);
 	}
 
+	igt_subtest("pat-sanity")
+		pat_sanity(fd);
+
 	igt_subtest("pat-index-all")
 		pat_index_all(fd);
 
-- 
2.43.0

