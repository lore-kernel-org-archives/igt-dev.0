Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CBFC3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 08:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F9D10E738;
	Fri, 23 May 2025 08:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NViShzot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C50310E738
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747989303; x=1779525303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OA/ia+X4YpaL+CvrMfp1UhUKf/m1OVXofTSnwR+Bm24=;
 b=NViShzotEQVn/sxJm1Kjr8ke0WqFjwvMs2qmcRjhRN5vLL5Nrf2U+eIu
 ZNVuChYnCrrFf03KsAWDfTQIxCNUybej/ot+RER8JRHkXXfvH1gL3j7c9
 LHG+oOtupDsIRH1WmJXnOoyxyCM15+R1k9XkqpdC49BYjtk84xZt6FwfY
 XWcoUQCmVSrL5jRtaOJ9jjfrBY8kmpf9+qmP4gLTxF0v36n6KmzycgrVZ
 i0oxST1yHnwtgAG3vmCF2rbkuVliB6tzqXOGXGYFGEBJjDgpF++ZZ5JoA
 JSvDDh0qVrFivmBvplSVxTr3XjaMEdMZOU2d0DIHqwKlBVU1MweZrdN6J g==;
X-CSE-ConnectionGUID: bSfkdvKPQ+2G8nOq0C3Cbg==
X-CSE-MsgGUID: FRhTD2cIS+mGEpWqWEXRnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75437450"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="75437450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:35:03 -0700
X-CSE-ConnectionGUID: kQ+boDZbQwON/WV4BgxOmg==
X-CSE-MsgGUID: H6chSFv0TvapGbkb/vBELQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="140931333"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 01:35:02 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 1/1] lib/igt_ktap: fix parsing problems for parametrized
 tests with no params
Date: Fri, 23 May 2025 08:35:44 +0000
Message-Id: <20250523083544.13787-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

In some cases, parametrized test might have no params and therefore no
results to be reported, which causes parser failures.

Add a condition that checks for that in the parser.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/igt_ktap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index 300fb2bb5..34306a1a0 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -250,6 +250,10 @@ int igt_ktap_parse(const char *buf, struct igt_ktap_results *ktap)
 		return -EINPROGRESS;
 	}
 
+	/* in case of parametrized test having no params and hence no results */
+	if (igt_debug_on(ktap->expect == SUB_RESULT && code == IGT_EXIT_SKIP))
+		ktap->expect = CASE_RESULT;
+
 	/* neither a test case name nor result */
 	if (ktap->expect != SUB_RESULT && code == IGT_EXIT_INVALID)
 		return -EINPROGRESS;
-- 
2.34.1

