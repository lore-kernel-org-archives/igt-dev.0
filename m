Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1F1C282DC
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EBD10E4EF;
	Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mIRuAPUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72F710E0A0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043707; x=1772579707;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rnL06pvR8er1shLQGCDod3FMbmn/SvwKvkASPhk57A8=;
 b=mIRuAPUxPJSksG/fS6NbXX78nhVYwVg0i9xScdvbe+ZY4s0Mm9Yu1YCl
 zrRdT5EKHw4hK5V6uVMUOaaHYKUffKyNfcv+fhXFqIln317jmuzCH68WR
 hzcM9OhNBQ3niQiRfCp+SAPLRNtGY+GMdxShyRsINTplOFNfaWau2Pr2Z
 1TLUfwMy76Z60AeZN8onlss4JDl3lDrb5NREgo4FZeyWc7m4/5MbyCRo+
 ut2mvdrUuedsjK8v5buT7ipw4q8FAWr/YxZXctvlwrvSnFwyldUuCJoLd
 M3ZKbMdM3RwtNcfSg1j5ZWVxqaHUoyFrjxwyMXjobescsLKx0SAMBf9r4 A==;
X-CSE-ConnectionGUID: QIeek4D0QY+POG08yJKzdA==
X-CSE-MsgGUID: rkF1w6SSRvubXUEvjA+8aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793038"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793038"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:07 -0800
X-CSE-ConnectionGUID: dVTQc1VFTd+8mPjD7fr63g==
X-CSE-MsgGUID: pEe5deIaRgefh1b8IcAcwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716684"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 03/14] tests/intel/xe_oa: Use period_ns in
 max_oa_exponent_for_period_lte
Date: Mon,  3 Mar 2025 15:14:51 -0800
Message-Id: <20250303231502.135720-4-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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

Rename the argument in max_oa_exponent_for_period_lte() to period_ns to
specify the units of the period.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 5c68f1d79..b15958de6 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -688,10 +688,10 @@ timebase_scale(uint64_t delta)
 }
 
 /* Returns: the largest OA exponent that will still result in a sampling period
- * less than or equal to the given @period.
+ * less than or equal to the given @period_ns.
  */
 static int
-max_oa_exponent_for_period_lte(uint64_t period)
+max_oa_exponent_for_period_lte(uint64_t period_ns)
 {
 	/* NB: timebase_scale() takes a uint64_t and an exponent of 30
 	 * would already represent a period of ~3 minutes so there's
@@ -700,7 +700,7 @@ max_oa_exponent_for_period_lte(uint64_t period)
 	for (int i = 0; i < 30; i++) {
 		uint64_t oa_period = timebase_scale(2 << i);
 
-		if (oa_period > period)
+		if (oa_period > period_ns)
 			return max(0, i - 1);
 	}
 
-- 
2.34.1

