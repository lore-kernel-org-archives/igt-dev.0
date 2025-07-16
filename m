Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B7CC83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 09:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BA010E70D;
	Wed, 16 Jul 2025 09:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYV+N5eL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BEF10E70D
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752658629; x=1784194629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Ir2Jh66ehrrqXSQGhbCuESMU8xlc+Am3mEELIeTNp0=;
 b=BYV+N5eLZEXx/XKJ8qKpVafQGFwM68qFWAM8E4NKdIkNA1M8ufbU9R7V
 PhiJtDHlSVPCwCPGqiup2iQmivr1fvyWalYsFvz1qV7xgOCeqJaWpdgF9
 cD1dR0ARH1yp91hivvouot5qtcmJVGSXG1kYkGwgRQDivuuZW9uU+Gf3+
 N27Dw5goqVGFrQs1HZgaAzSBOCYFLCs5uUDIVLC9eC2wVF25KcSUXcIx0
 ZUE6m0RE91hlWZaRd69x9S2lWtVpbhrJuDBR9pSTR8lU2DPAa8yzF+F4x
 bjSuWH0v78y5TEOBj852Rm/y3jiOmdI2ddDJP3NIc4igUEnIdFQV+PR4p g==;
X-CSE-ConnectionGUID: 6keh/5c6QPCC0Hwo0j2Cvg==
X-CSE-MsgGUID: 3KPYN9UzTQiO4XfWhcj2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54867844"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54867844"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 02:37:09 -0700
X-CSE-ConnectionGUID: og7i3kJBTO+W7ViBcY2FXw==
X-CSE-MsgGUID: J9QJYhgoR1G6gE+2SZV4aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="157547083"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 02:37:06 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, ewelina.musial@intel.com
Subject: [PATCH v6 i-g-t 0/6] Replace intel_sysfs_debugfs
Date: Wed, 16 Jul 2025 11:36:48 +0200
Message-ID: <20250716093656.169619-1-peter.senna@linux.intel.com>
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

This series:
 - moves shared function to lib/igt_dir
 - creates gpu agnostic tests
   - core_debugfs
   - core_sysfs
   - kms_debugfs
 - creates xe_debugfs (complementary to core_debugfs and kms_debugfs)
 - Updates testlists and scripts
 - deletes tests/intel_sysfs_debugfs

Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Cc: ewelina.musial@intel.com

Simplified changelog:
v6:
 - use the new testlist names
 - kms_debugfs: use the new igt_fit_modes_in_bw()
v5:
 - Added igt_dir_process_files_simple()
v4:
 - kms_debugfs: small changes
v3:
 - kms_debugfs: varios small changes
v2:
 - change comparison to NULL style

Peter Senna Tschudin (6):
  lib/igt_dir: utilities for directory traversal and file handling
  tests: Add core_debugfs
  tests: Add kms_debugfs
  tests: Add core_sysfs
  tests: Add xe_debugfs
  tests/intel: Remove intel_sysfs_debugfs

 docs/code_coverage.md                      |  18 +-
 lib/igt_dir.c                              | 347 +++++++++++++++++
 lib/igt_dir.h                              |  62 +++
 lib/meson.build                            |   1 +
 scripts/code_cov_selftest.sh               |   2 +-
 tests/core_debugfs.c                       |  48 +++
 tests/core_sysfs.c                         |  48 +++
 tests/intel-ci/i915.fast-feedback.testlist |   4 +-
 tests/intel-ci/xe-fast-feedback.testlist   |   8 +-
 tests/intel/intel_sysfs_debugfs.c          | 430 ---------------------
 tests/intel/xe_debugfs.c                   | 207 ++++++++++
 tests/intel/xe_test_config.json            |   2 +-
 tests/kms_debugfs.c                        | 133 +++++++
 tests/meson.build                          |   5 +-
 14 files changed, 867 insertions(+), 448 deletions(-)
 create mode 100644 lib/igt_dir.c
 create mode 100644 lib/igt_dir.h
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_sysfs.c
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c
 create mode 100644 tests/intel/xe_debugfs.c
 create mode 100644 tests/kms_debugfs.c

-- 
2.43.0

