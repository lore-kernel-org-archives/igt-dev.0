Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC71FF8850
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 05:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9E010E199;
	Mon, 27 Apr 2026 05:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EN9BRiOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2487E10E199
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 05:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777266012; x=1808802012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gX1w2ASVjhZOg3JThtyUGA7NAuqhrjjxuLupCI5nUp8=;
 b=EN9BRiOoUS0e/+ZMCR9TpWuY1ex5X5jW/iCCri/4bQIZqAxdLMAeKJxx
 jZE32MUhoqdK9Phz2PangVThXZt9YkGNPf+aDdTcxdknTeo4lq0kpBCKc
 yKGuKTpAYfEu/FF34fIJz3Xb8DqVE+/8sTj2GlvW0xULpa/bLpJebRq+x
 mfiXyubjMLCrHOfJXHOkS+24GE9U1OnyULlMeVfCxQPxruZoeQBMyZR1T
 2bmWO05b6urXTvMElu3eTelrOhlRoQAEhVXrx8e3339HGjqwvLGe3kIrt
 6UMYtlJY4/gxPN+zxvKeuigkK+d8IWSrFQ4OAqHwm3zU/XcuTpsKUqr2f Q==;
X-CSE-ConnectionGUID: oJbyYK9yT4uMTTaHF7aEaQ==
X-CSE-MsgGUID: i+iuM6j5TxuB/BC/tlaUJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78336378"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78336378"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:00:11 -0700
X-CSE-ConnectionGUID: I5bw4KqnS4GBOrIRLlHxPw==
X-CSE-MsgGUID: hww7f4ZxTC2bnP4x7AlpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="233356743"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:00:09 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH v2] tests/intel/xe_oa: Wa_14026633728
Date: Mon, 27 Apr 2026 10:30:02 +0530
Message-ID: <20260427050002.3391994-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

v2: Fix commit title, description and code description.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/intel/xe_oa.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 988c46df6..cbc1e0d3e 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2645,6 +2645,16 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 {
 	/* ~20 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+
+	/*
+	 * Wa_14026633728: For MERTOA in CRI, oa buffer can be in device memory.
+	 * Because of slower device mem access, OA exponent values lower than 8 can
+	 * result in buffer overflows.
+	 */
+
+	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT && IS_CRESCENTISLAND(devid))
+		oa_exponent = max(oa_exponent, 8);
+
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	size_t report_size = get_oa_format(fmt).size;
-- 
2.53.0

