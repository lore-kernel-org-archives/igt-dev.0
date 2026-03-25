Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A97FEA80C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 05:56:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B48310E77D;
	Wed, 25 Mar 2026 05:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPKFiC6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92AA10E1EB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 05:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774418187; x=1805954187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RVUbYb6JkNhdu2OYwMG0ByajvbROJl9DM//8tlwNN/g=;
 b=HPKFiC6hpH7OgQkY9YtGooNPQ38xub8hdAm04EN7Tz5+QkXlYeFxXnEE
 hfp0V2CFWbn2vxqoF5z5U+McVFeuRCuz+YRuoeJ6LJzwxihSVtolZYpFA
 pSgqrTtQ3QSNQ5VC1PmZl6iEI2mSozalRJE2SUKOlvcKnTkw9ypEYe/aH
 0yKCjynGUdbNF5M9ghXFmcHf9F55utVHlc0Bq5kbsy8xibQlMXzAn/w+i
 cjGjjaXEoOQHflYeJD6pySiRuttveRyLTocjOxDRmVBXZHfK+Ar9psIfY
 OZ6iL3ZHQvIfNj5ZL/V2gkXpRi5ZF4AeK32yYNkKHT28eGCyWOm1GW9iJ Q==;
X-CSE-ConnectionGUID: dX+OUxMkTGCoj+5AItnegw==
X-CSE-MsgGUID: TTDe+8eORQGb/Zs8yId42Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62999226"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="62999226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:56:26 -0700
X-CSE-ConnectionGUID: AC/2aa8zTIKmZ8oKZuTnZQ==
X-CSE-MsgGUID: oN+JELoyRrmTgDU8+/+gVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224842540"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:56:26 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v7 i-g-t 0/3] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Wed, 25 Mar 2026 05:55:47 +0000
Message-ID: <20260325055552.2496156-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320100554.2427448-1-sobin.thomas@intel.com>
References: <20260320100554.2427448-1-sobin.thomas@intel.com>
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

Current tests focus on VM creation and basic mode selection, but do not
cover overcommit scenarios.

This change adds tests to verify overcommit behavior across different VM
modes.

Non-fault mode tests:
 - vram-lr-defer: DEFER_BACKING rejects overcommit at bind time
 - vram-lr-external-nodefer: Long-running mode with an external BO and
                             no deferred backing
 - vram-no-lr: Non-long-running mode

Fault mode tests:
 - vram-lr-fault: Fault handling allows graceful overcommit via page faults
 - vram-lr-fault-no-overcommit: Verifies NO_VM_OVERCOMMIT blocks same-VM
   BO eviction during VM_BIND, while still allowing eviction during
   page-fault OOM handling

These tests validate that VMs respond correctly to memory pressure based
on their configuration—by rejecting at bind time, failing during execution,
or handling overcommit gracefully via page faults.

Currently, overcommit behavior is tested for VRAM only.

--------------------------------------
Link (historical context):
https://patchwork.freedesktop.org/series/161557/


Sobin Thomas (3):
  drm-uapi/xe: sync with kernel header
  lib/xe: Add failable variant of xe_vm_bind_lr_sync
  tests/intel/xe_vm: Add support for overcommit tests

 include/drm-uapi/xe_drm.h |  22 +-
 lib/xe/xe_ioctl.c         |  36 ++++
 lib/xe/xe_ioctl.h         |   2 +
 tests/intel/xe_vm.c       | 417 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 465 insertions(+), 12 deletions(-)

-- 
2.43.0

