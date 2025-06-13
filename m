Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EC5C61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 10:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C2510E988;
	Fri, 13 Jun 2025 10:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jd29bCl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9656910E988
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 10:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749811925; x=1781347925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7Tt9C5+a/mZ3n9mwTqkjfWvJpx8kcW9HEX+gwi4RsRQ=;
 b=Jd29bCl3wW/rfSQOuujst2bI46UgrFycV5uK1PL39lgqitnFSWp3ft3T
 SaKHQAirw9OQ262UG/E1UodW2UCu7YMgP9fZZtkCiEnCpkyRzakW8Kdp2
 sq4uUeMtfWEk3W2mmh9Ed6OviJkZVyiYaSAUOO7qja9gUkYnVyFBMly5Z
 PzGGaiPnqdaLYmQz4G2soSNIeOpONJjXV1RsyEbFFuTc3FU4DRECwNGxL
 p6YaT81kzo8w3vxLEjgUfL6HbcvjQ/GdEdNAJlVcmCVdD3PxBhyZ360Jm
 aw7dMcxfnexozPMCQMjwptTpzIObPxNRlqZV5kBX9s3u+TNskm9YdMJ5a A==;
X-CSE-ConnectionGUID: yG/QoGkZRJi7nQ+GiTlcvQ==
X-CSE-MsgGUID: pedlf4SIT+6WhGu7hKcWcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69467206"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69467206"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:52:04 -0700
X-CSE-ConnectionGUID: UFHrvqjlTf+Qq4oMMM4yvw==
X-CSE-MsgGUID: Ui+b1PfESSilviwNvsk5WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="178772173"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:52:01 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com, zbigniew.kempczynski@intel.com,
 ewelina.musial@intel.com
Subject: [PATCH v2 i-g-t 0/6] Replace intel_sysfs_debugfs
Date: Fri, 13 Jun 2025 12:51:39 +0200
Message-ID: <20250613105146.106581-1-peter.senna@linux.intel.com>
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

Cc: marcin.bernatowicz@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: ewelina.musial@intel.com

Peter Senna Tschudin (6):
  lib/igt_dir: Directory processing and flexible file handling
  tests: Add core_debugfs
  tests: Add core_debugfs_display_on_off
  tests: Add core_sysfs
  tests: Add xe_debugfs
  tests/intel: Remove intel_sysfs_debugfs

 docs/code_coverage.md                    |  18 +-
 lib/igt_dir.c                            | 260 ++++++++++++++
 lib/igt_dir.h                            |  61 ++++
 lib/meson.build                          |   1 +
 scripts/code_cov_selftest.sh             |   2 +-
 tests/core_debugfs.c                     |  54 +++
 tests/core_debugfs_display_on_off.c      | 171 +++++++++
 tests/core_sysfs.c                       |  58 +++
 tests/intel-ci/fast-feedback.testlist    |   4 +-
 tests/intel-ci/xe-fast-feedback.testlist |   8 +-
 tests/intel/intel_sysfs_debugfs.c        | 430 -----------------------
 tests/intel/xe_debugfs.c                 | 208 +++++++++++
 tests/intel/xe_test_config.json          |   2 +-
 tests/meson.build                        |   5 +-
 14 files changed, 834 insertions(+), 448 deletions(-)
 create mode 100644 lib/igt_dir.c
 create mode 100644 lib/igt_dir.h
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_debugfs_display_on_off.c
 create mode 100644 tests/core_sysfs.c
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c
 create mode 100644 tests/intel/xe_debugfs.c

-- 
2.43.0

