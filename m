Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8EDC54740
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5753910E3B7;
	Tue, 27 Aug 2024 16:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFI6leAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516D310E3AF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777696; x=1756313696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2bKJ0L6CuMFpR9qrzetlREkZQd+KrF8iQsJIxNq4/1A=;
 b=RFI6leAcaCINwhiu86NydMeW6iDusU+06mCz9SRPrPAukBi55BagkBHY
 B9aU+3d1+6LqE2im8/5POIwFVD9C85VobN5ujgSEjnusz4vwA1VdRFk8/
 TWVWmX0YfRB/te4nkMAYlARffSJWiogLqk1qbqkyuTfADE5I76oLtG7ZF
 tjuARzEvlSP7TtD2KbTDEfX11TuszQz/5AI7Z7+TyCqIuU/4BqH+jvR9K
 z+u5+fLG5qFUlTXnWunCczewl/JEuPYlMOndJCg/3fp6gmnnaAXhz/Fcf
 /fBiAVAKNs82fHoF8l3btyehBdh+7MpEFzFbcuvCA2YRGQ91k8MZNnKPh w==;
X-CSE-ConnectionGUID: RmfJMf2uQ8OXioXPGdqxCA==
X-CSE-MsgGUID: iYiwgB5USqWmPq3Qo8wXtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45787328"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45787328"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:56 -0700
X-CSE-ConnectionGUID: f2JNzFbSTOChozKiFzFKZg==
X-CSE-MsgGUID: 8C+7R30+TYq+5g2R+y8/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63640408"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 00/10] tests/intel/xe_drm_fdinfo: Fix noise and
 improve
Date: Tue, 27 Aug 2024 09:54:39 -0700
Message-ID: <20240827165449.1706784-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

2 patch series together:
1) https://patchwork.freedesktop.org/series/137750/
2) https://patchwork.freedesktop.org/series/137742/

The first one was a single patch fixing a bug. It's the same fix here,
but now with a proper justification in the commit message.  I found a
(LNL) machine reproducing the failures every 2 or 3 runs and executed 50
times successfully with patch 1.

Patch 3 was a suggestion from Matt Roper, but for that to work we need
patch 2, as we don't have the relevant assert in igt. Patch 4 comes
as a bonus.

Other patches are the same as the second patch series.

With all patches applied I executed 100 times in that machine and
didn't have any failure.

v2: Remove bogus patch
v3: Fix the stricter == 0 check

Lucas De Marchi (10):
  tests/intel/xe_drm_fdinfo: Extend mercy to the upper end
  tests/intel/xe_drm_fdinfo: Print timestamp for debug
  lib/igt_core: Add igt_assert_lt_double()
  tests/intel/xe_drm_fdinfo: Use igt_assert_lt_double()
  tests/intel/xe_drm_fdinfo: Be strict on == 0 comparison
  tests/intel/xe_drm_fdinfo: Use usec for batch duration
  tests/intel/xe_drm_fdinfo: Half the execution time
  tests/intel/xe_drm_fdinfo: Remove unused flags
  tests/intel/xe_drm_fdinfo: Use enum with expected load
  tests/intel/xe_drm_fdinfo: Rename and reorder tests

 lib/igt_core.h              |  12 ++
 tests/intel/xe_drm_fdinfo.c | 260 +++++++++++++++++++-----------------
 2 files changed, 153 insertions(+), 119 deletions(-)

-- 
2.43.0

