Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A90FFEFB5D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 15:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AF310EBC0;
	Fri, 27 Feb 2026 15:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hz7wdOYJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE36310EBC0
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772206061; x=1803742061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cAOa8vz7TFyMJn+45y0bcSZ62ZGNCIfmy8CbKiIPEqA=;
 b=Hz7wdOYJeGR57lkRndg9irgYSHgbo8fFL54Ov0FTdrCJZCZvMH3Lbila
 tlUwY9kGFCnZiAd3W2PJOCPNQM/Eoo0V9izkd5cc8IPpBqQOTD4QeQYnF
 sXXUIw1RmBJAKav7pTm3TtVJZBRMMVBC7DItp7QhHZUesxqHHOFB5to1C
 HyKH/E0HqMh5EWUR09j0j2MjoLd8sNQXoiunr1jvxPZTW3vA9tqO5/4dM
 KFoLllRw9rCq4KW6yVqm0cviet8HIjWvj64Ehluchi/opI7v6NQJFUP6d
 TV6M4Z9cpBPGrYYAe73xFnIQNtjJHWukc/ec23gsUWO0Kccjh/wtRXFsR w==;
X-CSE-ConnectionGUID: VVH5k+UGRSm4ioaGVz4SpQ==
X-CSE-MsgGUID: CxOJf50mSCqZChQwCVFhaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="76899220"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="76899220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 07:27:40 -0800
X-CSE-ConnectionGUID: hjgNpIrPTnqBDU7hU5Mw+g==
X-CSE-MsgGUID: Av6NZ1WoQvW+ZSSnLbDVEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="247438879"
Received: from pdudkiew-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.25.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 07:27:39 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lukasz.laguna@intel.com, piotr.piorkowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/2] xe_sriov_flr: basic FLR smoke test
Date: Fri, 27 Feb 2026 16:27:32 +0100
Message-ID: <20260227152734.256604-1-marcin.bernatowicz@linux.intel.com>
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

This series adds a minimal FLR smoke test to xe_sriov_flr.

Patch 1 introduces the flr-basic subtest intended as a minimal smoke
test for the VF reset sysfs write path while still using the xe-vfio-pci
based synchronization.

Patch 2 adds --extended to generate additional dynamic variants (numvfs-%u)
beyond the default numvfs-1.

v2: Rename flr-reset-only to flr-basic, and adjust commit messages.

Marcin Bernatowicz (2):
  tests/intel/xe_sriov_flr: Add basic FLR subtest
  tests/intel/xe_sriov_flr: Add --extended for flr-basic

 tests/intel/xe_sriov_flr.c | 79 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

-- 
2.43.0

