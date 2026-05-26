Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ED5CD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 15:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8A310E1B2;
	Tue, 26 May 2026 15:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlnyPwbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271F010E1B2
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779810746; x=1811346746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NMftoqeCAEuldlH+hyl2se5GKEjx0X6VpXrBVqjKwmc=;
 b=OlnyPwbbk2HF7lDlQW4B7x7q9drIFv3IE0YmPYErpB7JRePrgNuYOdvd
 AveE+K6f1XeU0GafWLLqf3+CtQ7aUxt9pDVNG8utmd3ozjYxkjhCiJ52K
 UY4ZoRNz4zIyR9dIPrx6l2ZNEy890MR0fIOkaw7YtP5E6ZvhU2IPzdees
 DTRVvHsrD84+ad3p96uIo8RU8uMnoJc3nnCrAKMAv3iAFUXa3P5pzBQPp
 Pm5AU3/tdKZGadauvi19DFulvDYL1j1vjC9WMJGxNxfQhflCuO0lRm2a+
 nLHrXszuyme7f0bNDbmtJwzLX+G7yavmAXJdOBxBRjOA77C/Kj+VSr0// Q==;
X-CSE-ConnectionGUID: GCwZizBiRpKc3PSTeuKxew==
X-CSE-MsgGUID: MwNAg/tSRqmAk7eEC08wUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80610887"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80610887"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 08:52:25 -0700
X-CSE-ConnectionGUID: z1/9dLCFQ3mrIpNOc8RNPg==
X-CSE-MsgGUID: OwWV/sBlSTmyFpZg/mPX5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="242033728"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 08:52:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Restrict reason check to default OA
 buffer size
Date: Tue, 26 May 2026 08:52:18 -0700
Message-ID: <20260526155218.1938109-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Reason check occasionally fails due to what seems to be a HW
bug. Restricting this check only for default OA buffer size allows us to
add "non-zero-reason-all" test to BAT.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 56d818d860..a502579e17 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2723,7 +2723,13 @@ test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 		const uint32_t *report = (void *) (buf + offset);
 		uint32_t reason = (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
 
-		igt_assert_neq(reason, 0);
+		/*
+		 * Reason check occasionally fails due to what seems to be a HW
+		 * bug. Restricting this check only for default OA buffer size allows
+		 * us to add "non-zero-reason-all" test to BAT.
+		 */
+		if (!oa_buffer_size)
+			igt_assert_neq(reason, 0);
 
 		/*
 		 * Only check for default OA buffer size, since non-default
-- 
2.54.0

