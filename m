Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204A0E77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 15:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39EE10E362;
	Tue, 14 Jan 2025 15:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLi2n628";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A1910E362
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 15:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736867421; x=1768403421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7FJksURJJT5urE96Gq+Dhc68LTUO4q67MvsIqPD6VZQ=;
 b=HLi2n628FJ6KO21OU46WMoBTlXT2wv/hFEjn2EXtsWIOuiTR3tMJJYGV
 RQoqIPuIsKyu4+WNA4smQIV2UTTuXmPxrHItU9zg3WTr63/3iosZCm2XU
 BheEHjEMork7Z59ABZQQB1RN+VUT1dda8UCexd9mqna+k+2EkP5DRdVc2
 HbCC/FhiA01xa91rXZ08oN/3VTH7sVzhx8GNnoXOn68G7U73p1ZtXP1s+
 acTysdtD5E72a09iZCTUCQ2ufyxEIHamqFAfOKGYxiH39w+wz7xS6FCdX
 Zfy5277aqfdtpEegJsVR5NiHrhxcR9R8A536YJGewE1c2/HW6I8oKWmOi g==;
X-CSE-ConnectionGUID: 20JaYEQkSdq0sVqiwHzd3w==
X-CSE-MsgGUID: w4pzItPVRRymh2TEQjIoGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37323208"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="37323208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:01 -0800
X-CSE-ConnectionGUID: mBfNofgdQOqpYw+/JTeLYQ==
X-CSE-MsgGUID: FdJ1goAWQEK3D8HnPK8aLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="104660427"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.29])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:09:58 -0800
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
Subject: [PATCH v2 i-g-t 0/7] Add xe_sriov_auto_provisioning tests
Date: Tue, 14 Jan 2025 16:08:41 +0100
Message-Id: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
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

v2:
- Update DEFINE_XE_SRIOV_PF_DEBUGFS_FUNC macro comment (Lukasz)
- Simplify range validation in test (Lukasz)
  (moved validation of provisioned ranges to library
  `xe_sriov_pf_debugfs_read_check_ranges`)
- Rename subtests for clarity (Lukasz)
- Add 'extended' command line option to enable dynamic subtests with
  arbitrary num_vfs

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

Marcin Bernatowicz (7):
  lib/xe/xe_sriov_debugfs: Add debugfs get/set functions for u32, u64,
    bool
  lib/xe/xe_sriov_debugfs: Add validation for provisioned ranges
  lib/xe/xe_sriov_provisioning: Add accessors for quota/spare attributes
  lib/xe/xe_sriov_provisioning: Add shared resource provisionability
    check
  lib/igt_sriov_device: Add helper functions for VF range validation
  tests/xe_sriov_auto_provisioning: Add tests for SR-IOV
    auto-provisioning
  tests/xe_sriov_auto_provisioning: Add 'extended' command line option

 lib/igt_sriov_device.h                   |  82 +++++-
 lib/xe/xe_sriov_debugfs.c                | 267 ++++++++++++++++++
 lib/xe/xe_sriov_debugfs.h                |  22 ++
 lib/xe/xe_sriov_provisioning.c           | 146 ++++++++++
 lib/xe/xe_sriov_provisioning.h           |  43 +++
 tests/intel/xe_sriov_auto_provisioning.c | 328 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 7 files changed, 882 insertions(+), 7 deletions(-)
 create mode 100644 tests/intel/xe_sriov_auto_provisioning.c

-- 
2.31.1

