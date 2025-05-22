Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C66C54E90
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 11:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72F610E7B9;
	Thu, 22 May 2025 11:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inU3uCfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8823410E7B9
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 11:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747911705; x=1779447705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nKbQjmMmieOCqEu1k3FxUdJTJ2nYvf/KJ/2AL7+UxXU=;
 b=inU3uCfvS6YasLz/77kDkJMlYQmiEQz4cvzbcuOP94PozBPSn/vXYb38
 IWJHDHLQGynT6bPPTT42rTXOuynf4Im9JmOljwPHZMKrLfwwxhPygFtLr
 cxQnnT10DM4IdisEUMnTE3LUIQ/ojmLCUM2gX02LvLwDRfwVlbu78RENZ
 QI0Aczh/a0BdgkHr0K483PQOV3wrak3f0V4rDACh0uovht0QveGLip3Ay
 UUDj1rW3r3sRY1twl+yU/qyNltmZSepOCISGpxzmRlJX4Imc5aiEMdsuk
 gDGqPixzCrvrrHnydN+7nf5wDi/wTFJsp9FdR5NqOdW+vXc4tQP7dBHPc g==;
X-CSE-ConnectionGUID: SSwML0khTW2RaQIACsQ96w==
X-CSE-MsgGUID: iYypLPCYQbanpuEKnWbpvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61274928"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="61274928"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:01:44 -0700
X-CSE-ConnectionGUID: GmVpsgkpT1CiLVQIlgrkCQ==
X-CSE-MsgGUID: tW+Jy3l+SZK38HJEZgV2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="145788812"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 04:01:42 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
Subject: [PATCH i-g-t 0/5] Replace intel_sysfs_debugfs
Date: Thu, 22 May 2025 13:00:43 +0200
Message-ID: <20250522110126.628720-1-peter.senna@linux.intel.com>
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

intel_sysfs_debugfs was created with the intention of unifying i915 and
xe tests to close testing gaps between the two. This series goes a few
steps further making the sysfs and the debugfs tests gpu agnostic. This
series also creates xe_debugfs that preserves the tests that
are exclusive to xe.

This series:
 - deletes tests/intel_sysfs_debugfs
 - moves shared function to lib/igt_dir_explorer
 - creates gpu agnostic tests
   - core_debugfs
   - core_debugfs_display_on_off
   - core_sysfs
 - creates the xe-specific test
   - xe_debugfs (complementary to core_debugfs*)
 - Updates testlists and scripts

Cc: marcin.bernatowicz@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com

Peter Senna Tschudin (5):
  Remove tests/intel/intel_sysfs_debugfs
  lib/igt_dir: Directory processing and flexible file handling
  Add tests: core_debugfs and core_debugfs_display_on_off
  tests/core_sysfs: Add GPU-agnostic sysfs testing
  tests/intel/xe_debugfs: Add Xe-specific debugfs test

 docs/code_coverage.md                    |  18 +-
 lib/igt_dir.c                            | 260 ++++++++++++++
 lib/igt_dir.h                            |  61 ++++
 lib/meson.build                          |   1 +
 scripts/code_cov_selftest.sh             |   2 +-
 tests/core_debugfs.c                     |  54 +++
 tests/core_debugfs_display_on_off.c      | 171 +++++++++
 tests/core_sysfs.c                       |  58 +++
 tests/intel-ci/fast-feedback.testlist    |   4 +-
 tests/intel-ci/xe-fast-feedback.testlist |   9 +-
 tests/intel/intel_sysfs_debugfs.c        | 430 -----------------------
 tests/intel/xe_debugfs.c                 | 208 +++++++++++
 tests/intel/xe_test_config.json          |   2 +-
 tests/meson.build                        |   5 +-
 14 files changed, 835 insertions(+), 448 deletions(-)
 create mode 100644 lib/igt_dir.c
 create mode 100644 lib/igt_dir.h
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_debugfs_display_on_off.c
 create mode 100644 tests/core_sysfs.c
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c
 create mode 100644 tests/intel/xe_debugfs.c

-- 
2.43.0

