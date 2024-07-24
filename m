Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27590C3DA61
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jul 2024 14:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2D110E700;
	Wed, 24 Jul 2024 14:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPp5HaKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8811B10E700
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jul 2024 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721831976; x=1753367976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k0pSk21+LPLG681zCgGAO8J9kjARQSPxZTNcIItHFi8=;
 b=iPp5HaKftzvQ5JbPVxRgTRFdy0hrdx86gKNRYNvTsSLNGlrjAhfDNi9w
 E9R8imJ6Uk4Ssocb9of00cFxEuGpIEJxkX+d1DTSY2WfANFXy/rROlU4N
 W1dMuAj5fbWBjLwrEIZKk7/p5pAfn/UwaeGlURl+iVQjkOQXN3IH1tuUA
 xtN86GeYUlHqKlbfi2HsaBHIuFqsoqpo8eaVs/QYuHiX74v2G2wZHN+BW
 5DVAXJqLaYvSPvyzUkqQmWe45SeVXN+X2mCdzMbjtre/fdch304QfqGAU
 BQpvVTDDklYntNeLJjiHo2tTqTZfqtwvRLy5H8CqU2gprO24A2Nf8sMcR g==;
X-CSE-ConnectionGUID: PGacfmTmQgqbwCF3Don2eQ==
X-CSE-MsgGUID: manq45DuTeukya2kmK2TTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19476697"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19476697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:39:36 -0700
X-CSE-ConnectionGUID: qvrmVFSaTGmFn4TxD046+g==
X-CSE-MsgGUID: 4AgufualQ6KiVr7HTxRQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="52828340"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:39:35 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: [PATCH i-g-t 1/1] Add i915_selftest@wip selftests to execution
Date: Wed, 24 Jul 2024 14:39:17 +0000
Message-Id: <20240724143917.3405163-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724143917.3405163-1-katarzyna.piecielska@intel.com>
References: <20240724143917.3405163-1-katarzyna.piecielska@intel.com>
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

Those tests are skipping in CI execution as those were not added to
i915_selftest test in IGT. So let's do that.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
---
 tests/intel/i915_selftest.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index aa29eb36a..47e09f988 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -634,6 +634,13 @@
  * Mega feature: Performance interface
  * Sub-category: Performance tests
  * Functionality: perf
+ *
+ * SUBTEST: wip
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Selftest subcategory
+ * Functionality: wip selftest
+ * Feature: gem_core
  */
 
 IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
@@ -657,4 +664,9 @@ igt_main
 			    "perf_selftests=-1 disable_display=1 st_filter=%s",
 			    env) < sizeof(opts));
 	igt_kselftests("i915", opts, "perf_selftests", "perf");
+
+	igt_assert(snprintf(opts, sizeof(opts),
+			    "wip_selftests=-1 disable_display=1 st_filter=%s",
+			    env) < sizeof(opts));
+	igt_kselftests("i915", opts, "wip_selftests", "wip");
 }
-- 
2.34.1

