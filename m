Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C61CFD377
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C1010E3A6;
	Tue, 25 Nov 2025 10:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/tzxyYO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A523310E39F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066202; x=1795602202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zD9Zb+k2le1pMcdE+kzxDP+xjlhPkEWVYFh1q0CSplQ=;
 b=A/tzxyYOwb3PrLQTXkGlarx6NVXN0+oFcQicR50uAU3Y6vccWBfk0ExS
 8r/ciXLeNz7XHABJxZqBXUPN0UAGTDts9U0x2RdAYm2HNzHKFrtmb33Qq
 6Ho+xYmW7uvYO2i5w6rAWQF1We2oKUd/enMnR/M7B7byG8YZDaTwgrVjY
 3oCKynDeFbfotjtICgzdQI+wSpTqu1SueZsKekkhEzVMpT+0u6GK3RznV
 kOMbRVmzhIbVQf2mTFfHoGMC3iZP9i4Rh8eONTiH2TeJqqebFaxePKAxC
 etj8ZSitbT8xzIV/ZxZDAn28Yo3YLzHRkbRB1VqrK0b1rl2OgCFIHY9nr Q==;
X-CSE-ConnectionGUID: GdO9teytTkmlk/nrhj5JXw==
X-CSE-MsgGUID: 9bplN2hLQ4K8NIWoOckFvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65080897"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="65080897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:22 -0800
X-CSE-ConnectionGUID: 8Q1LlruZTH2wnKO8h0Qjfw==
X-CSE-MsgGUID: yEuctVz/R5enxJps0GSu5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="193033634"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:20 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 00/10] Xe SR-IOV admin scheduling helpers and test
 updates
Date: Tue, 25 Nov 2025 11:22:59 +0100
Message-ID: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
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

This v2 series introduces a generic helper for sysfs "choice" attributes
and wires Xe SR-IOV scheduling helpers and tests to the SR-IOV admin
sysfs interface.

Patches 1–2 add igt_sysfs_choice and unit tests for parsing and
formatting enumerated sysfs values such as sched_priority.
Patches 3–4 convert the existing sched_priority helpers in
xe_sriov_provisioning into thin wrappers around igt_sysfs_choice.
Patch 5 adds a small PF/VF sysfs path helper used by the SR-IOV code.
Patch 6 exposes SR-IOV admin sysfs accessors for execution quantum,
preemption timeout, scheduling priority, VF stop and restoring defaults,
following recent kernel changes:

Link: https://lore.kernel.org/intel-xe/20251030222348.186658-1-michal.wajdeczko@intel.com/

Patches 7–10 update the xe_sriov_scheduling and xe_pmu tests to prefer
the admin interface, improve cleanup, and add coverage for SR-IOV
admin sysfs scheduling attributes in xe_sriov_admin_profile.

v2:
- Added generic igt_sysfs_choice helper and unit tests.
- Reworked sched_priority helpers to use igt_sysfs_choice wrappers.
- Introduced igt_sriov_func_str() PF/VF sysfs path helper.
- Extended SR-IOV admin helpers with scheduling accessors.
- Updated xe_sriov_scheduling and xe_pmu to prefer SR-IOV admin sysfs.
- Added xe_sriov_admin_profile tests for admin sysfs scheduling
  attributes (defaults, write->readback, bulk updates).

Marcin Bernatowicz (10):
  lib/igt_sysfs_choice: Add helpers for sysfs enumerated choice
    attributes
  lib/tests/igt_sysfs_choice: Add test coverage
  lib/xe/xe_sriov_provisioning: Add string conversion helpers for
    scheduling priority
  lib/xe/xe_sriov_provisioning: Add sched priority mask to string helper
  lib/igt_sriov_device: Add helper for PF/VF sysfs path formatting
  lib/xe/xe_sriov_admin: Add SR-IOV admin sysfs accessors
  tests/intel/xe_sriov_scheduling: Avoid assert on scheduling params
    restore in cleanup
  tests/intel/xe_sriov_scheduling: Prefer SR-IOV admin sysfs accessors
  tests/intel/xe_pmu: Prefer SR-IOV admin sysfs accessors
  tests/intel/xe_sriov_admin_profile: Add SR-IOV admin sysfs scheduling
    attributes tests

 lib/igt_sriov_device.c               |  19 +
 lib/igt_sriov_device.h               |   1 +
 lib/igt_sysfs_choice.c               | 429 ++++++++++++++++++
 lib/igt_sysfs_choice.h               |  52 +++
 lib/meson.build                      |   2 +
 lib/tests/igt_sysfs_choice.c         | 387 +++++++++++++++++
 lib/tests/meson.build                |   1 +
 lib/xe/xe_sriov_admin.c              | 623 +++++++++++++++++++++++++++
 lib/xe/xe_sriov_admin.h              |  60 +++
 lib/xe/xe_sriov_provisioning.c       |  90 ++++
 lib/xe/xe_sriov_provisioning.h       |  15 +
 tests/intel/xe_pmu.c                 |  43 +-
 tests/intel/xe_sriov_admin_profile.c | 414 ++++++++++++++++++
 tests/intel/xe_sriov_scheduling.c    |  43 +-
 tests/meson.build                    |   1 +
 15 files changed, 2147 insertions(+), 33 deletions(-)
 create mode 100644 lib/igt_sysfs_choice.c
 create mode 100644 lib/igt_sysfs_choice.h
 create mode 100644 lib/tests/igt_sysfs_choice.c
 create mode 100644 lib/xe/xe_sriov_admin.c
 create mode 100644 lib/xe/xe_sriov_admin.h
 create mode 100644 tests/intel/xe_sriov_admin_profile.c

-- 
2.43.0

