Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46471D3B7F3
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 18:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A9A10E46B;
	Mon,  8 Dec 2025 18:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUE2bW6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B5D10E23A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765220266; x=1796756266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6rhDiTEmYmaSrqmBfLRvuRwiXlxXmDO2hHdaShSoKk=;
 b=RUE2bW6ZdfttgoJv354RF+4/3nXRDvxZkibbKOGtSX7cx5C8Io+LEkxa
 Xz4/rLlqy6Ez6mwKZQU4AQ0RKNdCa4RufMEAvAYZhjxZVZk416RwdzqRr
 GmiJ6Ld0uY7r1iVj802nd2QOQiFWvyU1p8s4ghHJt52i2JJwvChOgfI4U
 bvxRp+w6PLLnTWr5T49JyVhITI3fAWImIuLFL56UR2cMxBBfEAXA+UAZ7
 51Ip8v9xos1BmsWXQq692f5QJkQBKSdcpvy95/noKgnShybuLSSbrhlbb
 ZRCsEBAQRe9fmd6It/qb2lkR3dqTmlK6E7VSDXizoAOhrmzh63A/AkDnT w==;
X-CSE-ConnectionGUID: oq5AIJfkQFO4Plzux4SIQw==
X-CSE-MsgGUID: 4aFxtLEfQamXPldwe2O9Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67219740"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="67219740"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:45 -0800
X-CSE-ConnectionGUID: b5IspvnYSVqTBBWoue5+Tw==
X-CSE-MsgGUID: cP1UKfr/TzqRg9h5oUUVig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="233384682"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 10:57:44 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_oa: Add MERT OA unit
Date: Mon,  8 Dec 2025 10:57:37 -0800
Message-ID: <20251208185737.966218-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251208185737.966218-1-ashutosh.dixit@intel.com>
References: <20251208185737.966218-1-ashutosh.dixit@intel.com>
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

Add MERT OA unit which allows __for_each_oa_unit() to run the tests also on
the MERT OA unit.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 502fa47323..5a3e021563 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4026,6 +4026,21 @@ static struct xe_oa_regs __oam_regs(u32 base)
 	};
 }
 
+static struct xe_oa_regs __oamert_regs(void)
+{
+	return (struct xe_oa_regs) {
+		.base		= 0,
+		.oa_head_ptr	= 0x1453ac,
+		.oa_tail_ptr	= 0x1453b0,
+		.oa_buffer	= 0x1453b4,
+		.oa_ctx_ctrl	= 0x1453c8,
+		.oa_ctrl	= 0x1453a0,
+		.oa_debug	= 0x1453a4,
+		.oa_status	= 0x1453a8,
+		.oa_mmio_trg	= 0x1453cc,
+	};
+}
+
 static struct xe_oa_regs oa_unit_regs(const struct drm_xe_oa_unit *oau)
 {
 	switch (oau->oa_unit_type) {
@@ -4041,9 +4056,12 @@ static struct xe_oa_regs oa_unit_regs(const struct drm_xe_oa_unit *oau)
 	}
 	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
 		return __oam_regs(XE_OAM_SAG_BASE_ADJ);
+	case DRM_XE_OA_UNIT_TYPE_MERT:
+		return __oamert_regs();
 	case DRM_XE_OA_UNIT_TYPE_OAG:
-	default:
 		return __oag_regs();
+	default:
+		igt_assert_f(0, "Unknown oa_unit_type %d\n", oau->oa_unit_type);
 	}
 }
 
-- 
2.48.1

