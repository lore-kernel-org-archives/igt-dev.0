Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4183F94CBB
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 06:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFD110E142;
	Thu, 23 Apr 2026 06:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNNH4gWO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31B010E142
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 06:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776926354; x=1808462354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I6llBwy2tY3+N67rvtAtTBVW49dzI5c9HNZyjiKd0j8=;
 b=TNNH4gWOu9KNMOJpou2AI84+6mFa8uuySWfuSoekw/ts4IAG6zi7HN0Q
 Ycmrcbwbb5e4YlRBXGqPAn+TF5Y2pf2q8Ts3UgCNErjMsoYYVlN4TkX24
 w3w+8PYlzMMYf77FWgYshSVHNgFtnrPDn7du3pKful4U/EvjzWuadV+wi
 IIH28fHi1Juj7IQRPh6gNdZu3daaWvkcnOtiG70d4LKBXggqycW+J01aJ
 MmhxlM5jwUEErbiEcewb4Iws8TwCgCMVTAVGMB4B8EhAO9NrIjCpYt/9D
 NWwsHhaAqaVyVY79TtWB06J0QGP4P2D2UeJ6sLruk4wp3ZQrN6duDqhf2 g==;
X-CSE-ConnectionGUID: ddnAvWlGTgiw9xIKYthCxA==
X-CSE-MsgGUID: Cn+V8SXgQtWSz+BULAA7dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="76921576"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="76921576"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:39:14 -0700
X-CSE-ConnectionGUID: KCgTX8HTSzudc7XenvCDMw==
X-CSE-MsgGUID: tziN1dGKRtu9imZIdrS5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="237557290"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 23:39:13 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arvind.yadav@intel.com, himal.prasad.ghimiray@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t 0/4] tests/intel/xe_madvise: Add atomic madvise subtests
Date: Thu, 23 Apr 2026 12:08:49 +0530
Message-ID: <20260423063904.3944005-1-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add three subtests to validate DRM_XE_MEM_RANGE_ATTR_ATOMIC madvise on
fault-mode SVM VMAs:

  atomic-device — GPU MI_ATOMIC_INC succeeds via fault handler
  atomic-global — CPU atomic increments + GPU MI_ATOMIC_INC with
                  fault-driven SMEM-to-VRAM migration
  atomic-cpu    — GPU MI_ATOMIC_INC rejected (-EACCES), engine reset

Patch 1 generalizes the test metadata and groups existing purgeable
subtests so the atomic subtests can coexist without being gated on
purgeable support.

Varun Gupta (4):
  tests/intel/xe_madvise: Generalize metadata and group purgeable
    subtests
  tests/intel/xe_madvise: Add atomic-device subtest
  tests/intel/xe_madvise: Add atomic-global subtest
  tests/intel/xe_madvise: Add atomic-cpu subtest

 tests/intel/xe_madvise.c | 346 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 305 insertions(+), 41 deletions(-)

-- 
2.43.0

