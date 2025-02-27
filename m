Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9D5C021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 13:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6479510E352;
	Thu, 27 Feb 2025 13:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C00I7qSP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461A910E369
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740661457; x=1772197457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SVI9+UAnQZvPzp1XvACpD8RHI5qvruGTq9w2Z0Ta8Pc=;
 b=C00I7qSPOVDL5ZGl3MvoziRLvBys1CBG/BhK2sZwMjYysbXshBYo4AAG
 68ImAGTeoPH0g6fLlur7OcnnCrFgioGx8zHm0X+K0YBT7IRD6MwTXyTrJ
 ZRlwrI9l8BXNVefHEQiLuisLhdtFZqGmFDxb4cHWbgHsz4vwNifHuv0cg
 xwaI7tfSHsfK7p8Cx7BsjMvosGzUFBywmHAD/1zAlocLAD01SBFELjdoh
 IIuatWYWuBP5r1KaXz3Un3v3CqwzDy2QLQzj1kbsgloHWo3eaP6wrdfNQ
 gW17Q5EmF1GFmtcr38nb7kWqiOG1lTCRENSH0zBincbOJWjLWTjc+fuRH A==;
X-CSE-ConnectionGUID: nJH/1fRtTMGda1IkVxrzjQ==
X-CSE-MsgGUID: 0dtHLKJeRBethl3FGdcwtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52536192"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52536192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 05:04:17 -0800
X-CSE-ConnectionGUID: NGXCQABYTqOxUPlsSyztMQ==
X-CSE-MsgGUID: b5umnh/XTJOqWgKr898Seg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121149990"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.211.135.227])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 05:04:14 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>
Subject: [PATCH i-g-t 0/2] Adjustments in test documentation
Date: Thu, 27 Feb 2025 13:03:52 +0000
Message-Id: <20250227130354.1169897-1-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
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

There is a need to fix pairs Mega feature <-> Sub-category to make
them unique.
While I was checking test documentation I've noticed few places with
wrong formatting, so let's fix that as well.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>

Katarzyna Piecielska (2):
  tests: xe_compute* Update test documentation
  tests/intel: Adjust test documentation

 tests/intel/xe_compute.c                 |  6 +--
 tests/intel/xe_compute_preempt.c         |  2 +-
 tests/intel/xe_debugfs.c                 |  2 +-
 tests/intel/xe_drm_fdinfo.c              |  2 +-
 tests/intel/xe_exec_atomic.c             |  7 ++-
 tests/intel/xe_exec_balancer.c           |  1 -
 tests/intel/xe_exec_basic.c              |  4 +-
 tests/intel/xe_exec_queue_property.c     | 14 +++--
 tests/intel/xe_exec_store.c              | 11 ++--
 tests/intel/xe_fault_injection.c         |  6 ++-
 tests/intel/xe_media_fill.c              |  2 +-
 tests/intel/xe_oa.c                      |  2 +-
 tests/intel/xe_peer2peer.c               |  2 +-
 tests/intel/xe_pm_residency.c            |  6 ++-
 tests/intel/xe_pmu.c                     |  3 +-
 tests/intel/xe_query.c                   | 58 ++++++++-------------
 tests/intel/xe_spin_batch.c              |  7 ++-
 tests/intel/xe_sriov_auto_provisioning.c | 24 ++++-----
 tests/intel/xe_sriov_scheduling.c        |  1 -
 tests/intel/xe_sysfs_scheduler.c         |  6 ++-
 tests/intel/xe_vm.c                      | 65 ++++++++++++------------
 tests/intel/xe_waitfence.c               | 15 +++---
 22 files changed, 122 insertions(+), 124 deletions(-)

-- 
2.34.1

