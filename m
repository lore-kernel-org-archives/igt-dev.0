Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CA5C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 14:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675CA10ECDA;
	Wed, 19 Jun 2024 14:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyJETOfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D765A10ECDE
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 14:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718807758; x=1750343758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a3JtmJohrAhawhqeV9J5NKOAKWEg9ahWK3wxOIlqt/w=;
 b=cyJETOfQww1TEEJgEtsyRV28ytKRHZqXCc+mJ3WxuIPBntw0gr28E8v0
 I9pFRjpSqXPXZCYk4LtEb+AeU0w3q7nnU/n7ep5dqgsbsoWPxas21Kqyn
 uDCCoxKAuEDHJo0bP9ks+DcKth00idX2G/VpntCBO2Cj/cpjDeZfyERYI
 LIP31+3Az87EQNWBRrlwDmqyWWyHjU3PppbeyS0LC+N4B02A2q9IlHBll
 /qhWX9j1iiu+3/X//pzOmCUe2ugqCA0CoUsVNUcQUQdQ2O0jlXLvMfXqe
 OHzYflMf78X8V6aw/3LwUYx9a1xXrqjTCa0y+6ORG1npbJj4AlUTyOEGS Q==;
X-CSE-ConnectionGUID: f9LNmrCPR02pPwoBgyc3NQ==
X-CSE-MsgGUID: GQYn08hCTzWcGJaJFtCmGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="26342577"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="26342577"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 07:35:58 -0700
X-CSE-ConnectionGUID: Vozca3tCQDuKzCDVYoZa9w==
X-CSE-MsgGUID: J7nXr61CRHKTyB7N/B3zNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="47074575"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.146])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 07:35:58 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pat: account for Wa_16023588340
Date: Wed, 19 Jun 2024 15:35:42 +0100
Message-ID: <20240619143542.110461-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240619143542.110461-1-matthew.auld@intel.com>
References: <20240619143542.110461-1-matthew.auld@intel.com>
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

We can't use the CLOS3 entries on BMG g21.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_pat.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index fe6a367aa..82155f1d5 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -929,6 +929,18 @@ const struct pat_index_entry xe2_pat_index_modes[] = {
 	{ NULL, 31, false, "c3-2way",     XE_COH_AT_LEAST_1WAY       },
 };
 
+const struct pat_index_entry bmg_g21_pat_index_modes[] = {
+	XE_COMMON_PAT_INDEX_MODES,
+
+	/* Too many, just pick some of the interesting ones */
+	{ NULL, 1,  false, "1way",        XE_COH_AT_LEAST_1WAY       },
+	{ NULL, 2,  false, "2way",        XE_COH_AT_LEAST_1WAY       },
+	{ NULL, 2,  false, "2way-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
+	{ NULL, 5,  false, "uc-1way",     XE_COH_AT_LEAST_1WAY       },
+	{ NULL, 12, true,  "uc-comp",     XE_COH_NONE                },
+	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
+};
+
 /*
  * Depending on 2M/1G GTT pages we might trigger different PTE layouts for the
  * PAT bits, so make sure we test with and without huge-pages. Also ensure we
@@ -1169,8 +1181,13 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("pat-index-xe2") {
 		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
 		igt_assert(HAS_FLATCCS(dev_id));
-		subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
-						     ARRAY_SIZE(xe2_pat_index_modes));
+
+		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
+			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
+							     ARRAY_SIZE(bmg_g21_pat_index_modes));
+		else
+			subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
+							     ARRAY_SIZE(xe2_pat_index_modes));
 	}
 
 	igt_subtest("display-vs-wb-transient")
-- 
2.45.1

