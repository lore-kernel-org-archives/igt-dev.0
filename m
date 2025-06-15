Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23564C71157
	for <igt-dev@archiver.kernel.org>; Sun, 15 Jun 2025 17:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D361510E00D;
	Sun, 15 Jun 2025 17:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gH8WCJO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2B310E00D
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Jun 2025 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750007719; x=1781543719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GzqjcQdeq/dGbNuuOL7LD3aqVk4m6VZsgcZ6PN6KL4Y=;
 b=gH8WCJO6906l6coNlhILYQCGnuDs4Yt/A2kJmFwUwrosQpHcidlwI5/o
 1yBpBSOJVREuVv3OKFkuGY7p+R3Jx73iDY1xP0XMf52HZSGRQ6guDUVie
 jb5tcJcBBe8mrhi1DHxlU7YfjIeltHkOO3uNKY8JCK/sp+XJT2oKNtLL+
 bEYypjD9cowBZSarT8ob895jzSJoV0lmHZg5l7hcab13x1w/tievun85u
 rj+URacxsFHRSpKZeDGABIBVUZ9hkz/IUBKHqOU2WOA8W33h0QTN2sMFq
 hOG+MSbS0tRDaI58PMSjyhhB7SycWIBUHOUDo7g9Ta3iILl6IRnUU3+gP Q==;
X-CSE-ConnectionGUID: p8jF5QVQQjyiRAjAwL4R7Q==
X-CSE-MsgGUID: nPo+oiHmQYma2qxV7RSokg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52298204"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="52298204"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 10:15:10 -0700
X-CSE-ConnectionGUID: 12IPG50yRc6DUJVI8VCANA==
X-CSE-MsgGUID: CyBgvacYTdi64+x0PrOdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="171476454"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 10:15:07 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 michal.wajdeczko@intel.com, marcin.bernatowicz@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, ewelina.musial@intel.com
Subject: [PATCH v3 i-g-t 0/6] Replace intel_sysfs_debugfs
Date: Sun, 15 Jun 2025 19:14:45 +0200
Message-ID: <20250615171452.44751-1-peter.senna@linux.intel.com>
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

This series:
 - moves shared function to lib/igt_dir
 - creates gpu agnostic tests
   - core_debugfs
   - core_debugfs_display_on_off
   - core_sysfs
 - creates the xe-specific test
   - xe_debugfs (complementary to core_debugfs*)
 - Updates testlists and scripts
 - deletes tests/intel_sysfs_debugfs

Cc: michal.wajdeczko@intel.com
Cc: marcin.bernatowicz@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com

Peter Senna Tschudin (6):
  lib/igt_dir: Directory processing and flexible file handling
  tests: Add core_debugfs
  tests: Add core_debugfs_heads_power
  tests: Add core_sysfs
  tests: Add xe_debugfs
  tests/intel: Remove intel_sysfs_debugfs

 docs/code_coverage.md                    |  18 +-
 lib/igt_dir.c                            | 260 ++++++++++++++
 lib/igt_dir.h                            |  61 ++++
 lib/meson.build                          |   1 +
 scripts/code_cov_selftest.sh             |   2 +-
 tests/core_debugfs.c                     |  54 +++
 tests/core_debugfs_heads_power.c         | 156 ++++++++
 tests/core_sysfs.c                       |  58 +++
 tests/intel-ci/fast-feedback.testlist    |   4 +-
 tests/intel-ci/xe-fast-feedback.testlist |   8 +-
 tests/intel/intel_sysfs_debugfs.c        | 430 -----------------------
 tests/intel/xe_debugfs.c                 | 208 +++++++++++
 tests/intel/xe_test_config.json          |   2 +-
 tests/meson.build                        |   5 +-
 14 files changed, 819 insertions(+), 448 deletions(-)
 create mode 100644 lib/igt_dir.c
 create mode 100644 lib/igt_dir.h
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_debugfs_heads_power.c
 create mode 100644 tests/core_sysfs.c
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c
 create mode 100644 tests/intel/xe_debugfs.c

-- 
2.43.0

