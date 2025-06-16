Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6FFC71135
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 07:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1604F10E2A6;
	Mon, 16 Jun 2025 07:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwEJbXeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AB810E2A6
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 07:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750059814; x=1781595814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GzqjcQdeq/dGbNuuOL7LD3aqVk4m6VZsgcZ6PN6KL4Y=;
 b=iwEJbXeYqXdjEiqo4sWVQTDSYHgINZ0efQKIQbLeQtUVBUIB8WWg2eai
 1B01mIYDp/5dvqNWsHNlRuNX/fuZvJj7aZ1uAuGbuRp8Q1UvAgWEwPPIb
 zCo8GWVhAN0U/79a71wYSLQY6HW8ikTzf0mHzlsxDR/Rqy0h2V/d1xzPe
 zwpIW/9OMMUgDD1T8y9pjhTWD+owSPPAsye91Dj3uL6t6EpDGjbKHHEXW
 qyrBciGh9tVq2HVIGaRSEnT0cKlj/QPdxBWkAaGJ58hcqp+UZD7VqGQlG
 gAyVH6exF1bffV5Z2t/D8o8bSyDhdRMNa1+VSDusP+U9ZUKuPKJFNKmDB w==;
X-CSE-ConnectionGUID: nmbNW7NSQ/mBVKVv5Sp9hg==
X-CSE-MsgGUID: k7gjugm6Qoux7q1lg4ol0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="77589874"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="77589874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:43:34 -0700
X-CSE-ConnectionGUID: 23nUvJX4S0uzUZR0Y+A/Kg==
X-CSE-MsgGUID: rCoesjZiRfa2Jer7cWEMZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153360427"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:43:31 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 michal.wajdeczko@intel.com, marcin.bernatowicz@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, ewelina.musial@intel.com
Subject: [PATCH v3 resend i-g-t 0/6] Replace intel_sysfs_debugfs
Date: Mon, 16 Jun 2025 09:42:32 +0200
Message-ID: <20250616074240.45818-1-peter.senna@linux.intel.com>
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

