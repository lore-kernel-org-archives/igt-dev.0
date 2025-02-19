Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03383C021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67B010E7B9;
	Wed, 19 Feb 2025 10:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KB2J3kAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EC410E7B7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739960728; x=1771496728;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QfsXE8KHNNMLOfmJCB01/HrpzOmvDRfXqZEFp+qHlKw=;
 b=KB2J3kAoSUp1Zz292paHA6QkA78m/xpbSA1tDDwr25LO2kZiPlAhXpB5
 UpYxoAhruWjy5n/huS9qC5oxXsre8VAeZ7kFk/2lLeMA4azoC1M95PC2A
 fbN2XfAkCTW6sA7Dnkst8RFSMxN3NOi0Zr29h4MH+4UFTxde7kewaarbi
 OeRB2C6m26K8d4E/hmO/9oqG4/3+xMK36QFW3Irvi7ZAAxShIEIUgh02P
 cavr9+7d/IE1Dl4aIMFhl6Yt5o8t8EKfSb8Qp7uknqTf/3S+zNGo0dumN
 UoMwALMwBx/14J4+cXfRhvuUvdYyjMWI/m8eumCE/wZYGNiD31cyZYGJr w==;
X-CSE-ConnectionGUID: TOhlZOm5STeASgidJTHqyg==
X-CSE-MsgGUID: SJK4p6rDS0+4T73qw4zgug==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40613308"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="40613308"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:25:27 -0800
X-CSE-ConnectionGUID: stNFRm6ERU+nxV6cUnEpcw==
X-CSE-MsgGUID: +UxDPdNJS82H9S/yIO4ttQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137921448"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.91.214.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:25:25 -0800
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: tomasz.lis@intel.com, marcin.bernatowicz@linux.intel.com,
 michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com, satyanarayana.k.v.p@intel.com
Subject: [PATCH i-g-t 0/2] Add SR-IOV simplified VF migration test
Date: Wed, 19 Feb 2025 11:25:32 +0100
Message-Id: <20250219102534.2630181-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.39.1
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

New test validates simplified (a.k.a fake) VF migration scenario,
that doesn't require VM and VFIO driver support, as it relies on
PF and VF driver interfaces.
Test exercise possiblity to restore previously saved GuC state,
cleared during VF states transitions and reset.
Setup involves VF(s) provisioning (either auto or manual), enablement
and driver probe.
Additionally, runtime power management is disabled to prevent VF suspend.
VF run state (pause-resume) is controlled to put VF in a state allowing
to perform save/restore operations. GuC state as well as GGTT and LMEM
raw data is read via relevant debugfs attributes for later restore.
VF health in pre- and post-migration phase is verified by running
simple workload.

SRIOV debugfs library functions added to support tested scenario:
- send VF control commands
- get/set GuC state, GTTT and LMEM data
- trigger GGTT relocation

Note, test currently requires xe driver built with SRIOV debug flag:
CONFIG_DRM_XE_DEBUG_SRIOV=y

Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Adam Miszczak (2):
  lib/xe/xe_sriov_debugfs: Add VF save/restore related functions
  tests/xe_sriov_migration: VF fake migration validation

 lib/xe/xe_sriov_debugfs.c        | 252 ++++++++++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h        |  31 ++++
 tests/intel/xe_sriov_migration.c | 297 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 4 files changed, 581 insertions(+)
 create mode 100644 tests/intel/xe_sriov_migration.c

-- 
2.39.1

