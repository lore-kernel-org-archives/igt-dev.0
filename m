Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE22CCD193
	for <igt-dev@archiver.kernel.org>; Wed, 15 Oct 2025 10:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB2910E773;
	Wed, 15 Oct 2025 10:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b9wsAJKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C6010E771
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Oct 2025 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760522542; x=1792058542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+T0G3oxZutsKY9F2JoctZM3LlG8NcghaEGicqpX7RD4=;
 b=b9wsAJKKgqwnwNcuSgd5Mit+r3TeAgKYhH0+JlH/ufz6amod2e7v65tT
 x/OdvyBVPmU7zkennxuM79dGeFHC+tULvFQW7icWJBBnC9Lwsz5+q4rJJ
 fE00vC192xvCHSUELChEbCnCPktJkMgRVJ6lcBgVub1CVDWvZDa1flFK2
 UXOhJ3QFNsZYPWVWG3OQjC8s8ThPOTDR55vsNLiKdxVSsaSv8wQSV+TpZ
 ukAc/DKOwCMywDHohfaFMhO9Tt0SsLB/+nrhk6NG6LHtSwXun5Zqj/zjy
 REb9jFDXOd+N9DP9QfmcuZjUCrZbjQOwRN/3Gpk9k+ibmveACDJo5obBU A==;
X-CSE-ConnectionGUID: UAgLudn9QVGZGZjGGP79RQ==
X-CSE-MsgGUID: gOxQ5kFqQvmpU+fJk4ze7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62590187"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62590187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 03:02:21 -0700
X-CSE-ConnectionGUID: DG1bEAunTImrVfKyXRV/mw==
X-CSE-MsgGUID: 6gCa5GlDRBKUy+Rk+Bc8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="205835596"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:02:20 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 6/6] HAX: Do not merge
Date: Wed, 15 Oct 2025 15:47:59 +0530
Message-Id: <20251015101759.3982477-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015101759.3982477-1-kunal1.joshi@intel.com>
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
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

---
 tests/intel-ci/i915.fast-feedback.testlist | 7 +++++++
 tests/intel-ci/xe-fast-feedback.testlist   | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/tests/intel-ci/i915.fast-feedback.testlist b/tests/intel-ci/i915.fast-feedback.testlist
index 2799bbaa5..b0c366a2b 100644
--- a/tests/intel-ci/i915.fast-feedback.testlist
+++ b/tests/intel-ci/i915.fast-feedback.testlist
@@ -1,6 +1,13 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_link_training@uhbr-sst
+igt@kms_link_training@uhbr-mst
+igt@kms_link_training@non-uhbr-sst
+igt@kms_link_training@non-uhbr-mst
+igt@kms_linktrain_fallback@lt-fallback
+igt@kms_linktrain_fallback@dsc-fallback
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@core_debugfs@read-all-entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a..3bb171fcf 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,13 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_link_training@uhbr-sst
+igt@kms_link_training@uhbr-mst
+igt@kms_link_training@non-uhbr-sst
+igt@kms_link_training@non-uhbr-mst
+igt@kms_linktrain_fallback@lt-fallback
+igt@kms_linktrain_fallback@dsc-fallback
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.25.1

