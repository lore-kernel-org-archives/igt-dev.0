Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D025CD5B874
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75CB10E289;
	Mon, 15 Dec 2025 22:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1n3E8j9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EB510E160
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765837780; x=1797373780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hq0Bh5E9JHRqnK0iA0A1Kw63kWyo83pD3eaXqCWA9FE=;
 b=e1n3E8j9XtTiYgh651JqXsoA1HHRefpXYpWdhp/OmXEEWD1E3bEiIsnD
 +s7ysukVU4FP1hfoedYepHvop7K5gEDTq1KVC3bqZ15WX/XcHiDNnavLs
 zn/kc5iSLr1/gNwGaacX3PAPonHECJ4Afd+CJR5uzd89XQ07aZ4GL0ogZ
 fdvhbfhns+JOOCkb690gt5b1GiuM4wCusJkN9GZVvQjR2F+kB87Pqyph+
 ALbc1rJSB2k8f4rd2KQAZ4BJf2k8VG0xlw96p5GH3TfpaBHbco8FTsqqG
 pi0aRissGjDG2id4KbPUDFTCMaNHtHyMZDBFR8tpSuGrHmk0TrlqHJhje A==;
X-CSE-ConnectionGUID: pXT4Ylu9RDOKBv4ELC+Plw==
X-CSE-MsgGUID: k2HxppQeRz273Mga6T6yIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55315059"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="55315059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:29:39 -0800
X-CSE-ConnectionGUID: +a7r5s/RQuiGuRlFMoLatg==
X-CSE-MsgGUID: TVaOD95QRzmCKf48PF2ywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197836367"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:29:40 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_oa: Add MERT OA unit
Date: Mon, 15 Dec 2025 14:29:34 -0800
Message-ID: <20251215222935.2002656-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
References: <20251215222935.2002656-1-ashutosh.dixit@intel.com>
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
 tests/intel/xe_oa.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index a9362f2045..474070e238 100644
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
@@ -4041,6 +4056,8 @@ static struct xe_oa_regs oa_unit_regs(const struct drm_xe_oa_unit *oau)
 	}
 	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
 		return __oam_regs(XE_OAM_SAG_BASE_ADJ);
+	case DRM_XE_OA_UNIT_TYPE_MERT:
+		return __oamert_regs();
 	case DRM_XE_OA_UNIT_TYPE_OAG:
 		return __oag_regs();
 	default:
-- 
2.48.1

