Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E51C52D1D
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A556610E59B;
	Tue, 30 Jul 2024 21:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qbmif00m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466610E597
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375360; x=1753911360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=txyMl4vzJ5y5biv/Ii+wYdXMfQY/kD4unCo8E8bJpMw=;
 b=Qbmif00miI6wKsIooqkqnwHuZbA31ogFE7k3P9OJEzCtaaIBJvwv61QE
 JO77zwCebcDzkxuteyWy94rFTVNrOto1eRk7LHKHeK+WOO4uaaQ7WTXvS
 v8DFEqI0rvMNG+60fBoWJbELZnT5fLsAlXq8z1oZ7x4LOrmOGoALRKwyb
 +hjTCkOoRf/qI4e6BOynZBPE1tE1ho16NZFgd0y35qNNynCVOdwkt6ZxA
 OyzZvCSn9e7ZyqRH4kvzLv0mtyoRf54RTgq40fIcujPBMZz4piwm5W+Dr
 rLf4QQe9pEJMIXnovKez3OfUcrAwhRPmBo+zyHAJ7QezL0Lk9Zb4BV2cq w==;
X-CSE-ConnectionGUID: uGNkAQcfQPCVF/3i4sjKdQ==
X-CSE-MsgGUID: VRTH1ufjRTWR5DXAQkC3Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694602"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694602"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:59 -0700
X-CSE-ConnectionGUID: mHyB27mwTKmVamNElq3+kA==
X-CSE-MsgGUID: npSVIhPDSIiojfYcYivKoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321742"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:58 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 10/10] HAX: Do not merge
Date: Wed, 31 Jul 2024 02:43:41 +0530
Message-ID: <20240730211343.58703-11-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730211343.58703-1-kunal1.joshi@intel.com>
References: <20240730211343.58703-1-kunal1.joshi@intel.com>
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
 tests/intel-ci/fast-feedback.testlist    | 3 +++
 tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..f7b0d40b1 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_dp_fallback@dp-fallback
+igt@kms_dp_fallback@mst-fallback
+igt@kms_dp_fallback@uhbr-fallback
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..387f612ff 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,10 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_dp_fallback@dp-fallback
+igt@kms_dp_fallback@mst-fallback
+igt@kms_dp_fallback@uhbr-fallback
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.43.0

