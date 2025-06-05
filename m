Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA2FC5B543
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 20:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C1B10E314;
	Thu,  5 Jun 2025 20:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOG9s4Sg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FDE10E314
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749154821; x=1780690821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zHjDyrRekZEl0on1dPSHsYyZ9wLzr9nLx2Ayp2Fi82w=;
 b=bOG9s4SgriE92P2cTjgEhsG0PnGPmWCtoB2bo7RR5UyaD6sgB4n622mS
 trT5cJD3Zx3gfrjI/c/r5xIplZXdvoopCYKaEdrDDnt2+DfHTfuXw+t13
 SWud/Rkd6+oGJ4tDpnDV2l/4o86jqUrZGXIFJT1anBoOcFoJEAhnau/IJ
 2MgmCyf3/xhv/QPn6gQwrkT9kYQ3Ep5DW8s89kpMzCnzRZmK4guDNrbKm
 ZmUbw8gqUgFEsaZlk+IzLo8fbrD5ziVzQeZvo0vCbgwx8FJz12IWLpTsv
 UAT5n5Rrt211PpRM9D5unvDk8tqjLP05sa6396ZqAdOr2NEO19sdUe6HY w==;
X-CSE-ConnectionGUID: 0/OgZDeKQXCVL+fBIOSm+g==
X-CSE-MsgGUID: jpo82JI4TsaZYNO9nOkExg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51388632"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51388632"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:20:18 -0700
X-CSE-ConnectionGUID: +QJFBuC7SbO3IyX1IsY5yQ==
X-CSE-MsgGUID: YeeJ2+pbTGGvxXjtz/i/fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="150490610"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:20:16 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, Sk Anirban <sk.anirban@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [i-g-t, v9,
 0/3] tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
Date: Fri,  6 Jun 2025 01:50:25 +0530
Message-ID: <20250605202024.709332-5-sk.anirban@intel.com>
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

Leverage IGT spinner to trigger frequency scaling and
set RPS minimum frequency to RP0 for achieving peak frequency.
This method replaces the existing waitboost mechanism used
to reach maximum frequency.
Restrict the power consumption test to GT0 alone, since we're
evaluating the power usage for the entire GPU at once.

v4: Cosmetic changes (Riana)
v6: Fix frequency restoration (Riana)
v7: Fix variable scope (Riana)
v8: Fix signal handler (Kamil)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Sk Anirban (2):
  tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 117 +++++++++++++++++---------
 2 files changed, 79 insertions(+), 39 deletions(-)

-- 
2.43.0

