Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AB0FB44C8
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 08:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E3F10F3D2;
	Fri, 24 Apr 2026 08:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjESuKwX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB83010F3D2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777018445; x=1808554445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NDlAf49Tz8EeRuDuxGgth2U9G8ITxLPkFSjp53JH8U8=;
 b=bjESuKwXgeemLmdfBWdLjC2sJEXtkDZgoUl0RVFgtC9LRVQeHU50NRaC
 RII7WzqrHDtFOKpJqbkNo6KYoDzX8hEIakbmC6r+s8kFdSYVBCaYOjKmy
 0oG1bg/VJU62BYEHZvpFZovtp0q6o0YMz70PcSI2aEwoQy8rspPbb8nxd
 uHg1YP1whRYdfkC3CTMghG5RVZCwOHKFtSf1C6MUciprm4E77EpkK+DvZ
 JzIqrnP+kWeRTaKDwWTQsaPEa73Lo8rnHdnScx9XAJS907rybGEkHzxNs
 3iZJMS84MTEucztnqokUVDrWpzaaCFWnHaoTCEopKIkmueCXRueOxP2iN Q==;
X-CSE-ConnectionGUID: OxHJ5Q9rRn+VvpKB5BKfhQ==
X-CSE-MsgGUID: P4Ge8JRrSGOD9kxA6AiQrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77875011"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="77875011"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 01:14:04 -0700
X-CSE-ConnectionGUID: Cu1DBT28SbaIHQJP6W1nUg==
X-CSE-MsgGUID: KDw38HrnRyOo8oHecgzMBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="228562038"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 01:14:03 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	ashutosh.dixit@intel.com
Subject: [PATCH] drm/xe/oa: Wa_14026633728
Date: Fri, 24 Apr 2026 13:43:54 +0530
Message-ID: <20260424081354.3033523-1-shekhar.chauhan@intel.com>
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

For MERT_OA in CRI, the OA_Buffer is in device memory. The minimum
exponent needed for it is 8. Bump it up.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/intel/xe_oa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 988c46df6..7bd9d17c4 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2645,6 +2645,12 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 {
 	/* ~20 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+
+	/* Wa_14026633728: MERTOA buffer on CRI is in device memory,
+	 * minimum exponent to avoid overflow is 8 */
+	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT && IS_CRESCENTISLAND(devid))
+		oa_exponent = max(oa_exponent, 8);
+
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	size_t report_size = get_oa_format(fmt).size;
-- 
2.53.0

