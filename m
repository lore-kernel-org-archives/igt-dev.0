Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A394AE9B357
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 10:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C68710E35E;
	Mon,  2 Mar 2026 10:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpVobP4Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEB810E35E
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772446917; x=1803982917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gcxFMUKvTJTGb0OPN2wLohaMzROihMKr31DUP6kQ2Qk=;
 b=MpVobP4QvsT9Bb6/Xb+lmar7shXofmlwJlyU258FWd39m3HCFDk9C01t
 1q2loJ3VCdCXuy6oOYfXM0VwK4QiyDzD4HDuilafOYhDj3pSN0PFMxus6
 ltuP4GisbHbNbBgqjKge8SOY4ECs6/AYO1r/fihs4spwzgy2RxJx6/T4R
 zwOQTAXTCC3EwnsHYWunF2SzI3VQRUPdUN1ttY6ZQJHAlif8c0mvi0Ctm
 cGiEiGkdkJOwmZtCbRv0uWYZCjDeMhCKA4XkcBWRYKmjWcE4YZGHRJb+0
 FmfjvzuyvxgtVFpn9Dz5C+84k1V47+eYR02uOU+RB2RKOlM5IVQy2Xyq/ Q==;
X-CSE-ConnectionGUID: ceDROqY1RGqMH0imkmH6cA==
X-CSE-MsgGUID: 7Y7nk9CCQwSpFdYxvEOL9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84917518"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84917518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:21:56 -0800
X-CSE-ConnectionGUID: dJdx0G4xTzemnXOYgyFHRw==
X-CSE-MsgGUID: BepaWyMgQDGmy5fEcyi3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="214844298"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:21:53 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v4 0/5] intel-ci: Split chamelium-only testlist for i915 and xe
Date: Mon,  2 Mar 2026 15:49:21 +0530
Message-ID: <20260302101926.3015380-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

v2:
- Move suspend resume tests to the end of the testlist (Kunal)
- Comment out random-plane test (Kunal)

v3:
-Use move-fix-add approach (Kamil)
-Remove symlinks first before renaming (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)
-Rename run-type labels(Swati)

Mohammed Bilal (5):
  intel-ci: Remove chamelium testlist symlinks
  intel-ci: Rename chamelium-only testlist to i915 specific
  intel-ci: Apply i915 chamelium delta changes
  intel-ci: Copy i915 chamelium testlist for xe
  intel-ci: Apply xe chamelium delta changes

 tests/intel-ci/chamelium-only.testlist      | 77 --------------------
 tests/intel-ci/i915.chamelium-only.testlist | 81 ++++++++++++++++++++-
 tests/intel-ci/meson.build                  |  3 +-
 tests/intel-ci/xe.chamelium-only.testlist   | 72 +++++++++++++++++-
 tests/intel/kms_test_config.json            |  9 ++-
 5 files changed, 158 insertions(+), 84 deletions(-)
 delete mode 100644 tests/intel-ci/chamelium-only.testlist
 mode change 120000 => 100644 tests/intel-ci/i915.chamelium-only.testlist
 mode change 120000 => 100644 tests/intel-ci/xe.chamelium-only.testlist

-- 
2.48.1

