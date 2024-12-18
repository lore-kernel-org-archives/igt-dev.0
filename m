Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C89EE77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 12:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B4110E26C;
	Wed, 18 Dec 2024 12:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6eQVtuk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D02D10E26C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 12:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734523264; x=1766059264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rkji3bHsd62ryxOD6wXDcuWSPF9KiCoqI8xgZJ3zDxo=;
 b=O6eQVtukbr0ZtyiCY4DSk8mNY23X5k7o092KDHor10NOHqzeHBKceJp4
 nyzlrAnJ9v6Tfz9pVeIBZe3rOnDCE7ZkCYR8X3hqjbVeDp8Sw/zIuKvwW
 MKAlDQqyda4M8EHqX1waN8gW9L1ydUkZSMmGOay2sRa/VnzvXjEvSgvyS
 xFQT+dtzSbQSgWmnA3Ejw8v+HQc+7UimM3VSHu57tyA+nJT0XjJljoDwW
 /FMWfqvXa+3sg6pmuruLnYy7NssBs8zEwZActHrFJUDGuDyA3cz+wkmXY
 AYEUF2J7AUIHUAyhnEHvxLpDwb/ab29atYw7aIeI7bNIE2PT2KlEos9N/ g==;
X-CSE-ConnectionGUID: g+vHEwzyQcekB9VAjjcXbQ==
X-CSE-MsgGUID: /uNU0DEMQkmMgYQxXcNykg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34896644"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="34896644"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:01:04 -0800
X-CSE-ConnectionGUID: ReJHzGYgSAazjbBsIRs9VQ==
X-CSE-MsgGUID: VpF3X+mvRumYC5I8Fuy4Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="102831375"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:01:01 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 0/5] Add xe_sriov_auto_provisioning tests
Date: Wed, 18 Dec 2024 13:00:51 +0100
Message-Id: <20241218120056.779962-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This patch series introduces several enhancements to the SR-IOV
provisioning and validation functionalities. The changes include
debugfs accessors, quota/spare attribute accessors, shared resource
provisionability checks, and helper functions for VF range validation.

Additionally, the xe_sriov_auto_provisioning tests validate the
following scenarios:
- Auto-provisioned resources are allocated by the PF driver in a fair
  manner.
- Auto-provisioned resources are released once VFs are disabled.
- Verify that ranges of auto-provisioned resources are exclusive.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

Marcin Bernatowicz (5):
  lib/xe/xe_sriov_debugfs: Add debugfs get/set functions for u32, u64,
    bool
  lib/xe/xe_sriov_provisioning: Add accessors for quota/spare attributes
  lib/xe/xe_sriov_provisioning: Add shared resource provisionability
    check
  lib/igt_sriov_device: Add helper functions for VF range validation
  tests/xe_sriov_auto_provisioning: Add tests for SR-IOV
    auto-provisioning

 lib/igt_sriov_device.h                   |  82 ++++-
 lib/xe/xe_sriov_debugfs.c                | 151 +++++++++
 lib/xe/xe_sriov_debugfs.h                |  18 +
 lib/xe/xe_sriov_provisioning.c           | 146 +++++++++
 lib/xe/xe_sriov_provisioning.h           |  43 +++
 tests/intel/xe_sriov_auto_provisioning.c | 399 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 7 files changed, 833 insertions(+), 7 deletions(-)
 create mode 100644 tests/intel/xe_sriov_auto_provisioning.c

-- 
2.31.1

