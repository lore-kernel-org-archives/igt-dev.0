Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B52FC71130
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 21:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AA610E07E;
	Mon,  7 Jul 2025 21:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMBftBqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A75510E07E
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 21:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751922493; x=1783458493;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RowRDnXaRm9iQiO9CsGD7Rp9a48G+ADMUZYZSdUt238=;
 b=lMBftBqwzQVVf9wIUD1wBkyTVA5TPyIP/usENEjnZC1J7d8oWt9rpaxq
 PrIgm2bzK0Q6Y3xUhk6+S5esrXXW1Z+4eQFEhWgF4v46qSX48qEvs5hE+
 e7Nswd+VD9XLNhcbNJ8hJ7WKGhJq6XBQh+kB7LUcl/v7CphA8PE7zpulA
 PaBJZlfPmsSEjhrVZ2xaiLUm4MedSicAiy+EIEOtCGVOZlQJJIzm0tG2l
 ZFSx5JVjixCE/COKgFgWxQuIHSK4BiU1m8vWcRxUSmt23q6rnNct650TG
 gEcr7o/7tQk2yZiQN/esuQIQ0NBFoW6XdEU+6AptDPWShIcewPJVxG/iO g==;
X-CSE-ConnectionGUID: 6Z+iltNFQMGfwwUui73guw==
X-CSE-MsgGUID: JWMkw+mESIax450JtfoAzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54123752"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="54123752"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:08:12 -0700
X-CSE-ConnectionGUID: QscBGZ73T024Vsicl6/TPQ==
X-CSE-MsgGUID: tneCRKHkTg+FQqV4UdOrzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="155442517"
Received: from jmkrefta-mobl2.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.255.250])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:08:10 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, ewelina.musial@intel.com
Subject: [PATCH v4 i-g-t 0/6] Replace intel_sysfs_debugfs
Date: Mon,  7 Jul 2025 23:07:19 +0200
Message-ID: <20250707210726.55334-1-peter.senna@linux.intel.com>
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
   - core_sysfs
   - kms_debugfs
 - creates xe_debugfs (complementary to core_debugfs and kms_debugfs)
 - Updates testlists and scripts
 - deletes tests/intel_sysfs_debugfs

Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Cc: ewelina.musial@intel.com

Peter Senna Tschudin (6):
  lib/igt_dir: Directory processing and flexible file handling
  tests: Add core_debugfs
  tests: Add kms_debugfs
  tests: Add core_sysfs
  tests: Add xe_debugfs
  tests/intel: Remove intel_sysfs_debugfs

 docs/code_coverage.md                    |  18 +-
 lib/igt_dir.c                            | 260 ++++++++++++++
 lib/igt_dir.h                            |  61 ++++
 lib/meson.build                          |   1 +
 scripts/code_cov_selftest.sh             |   2 +-
 tests/core_debugfs.c                     |  54 +++
 tests/core_sysfs.c                       |  58 +++
 tests/intel-ci/fast-feedback.testlist    |   4 +-
 tests/intel-ci/xe-fast-feedback.testlist |   8 +-
 tests/intel/intel_sysfs_debugfs.c        | 430 -----------------------
 tests/intel/xe_debugfs.c                 | 208 +++++++++++
 tests/intel/xe_test_config.json          |   2 +-
 tests/kms_debugfs.c                      | 157 +++++++++
 tests/meson.build                        |   5 +-
 14 files changed, 820 insertions(+), 448 deletions(-)
 create mode 100644 lib/igt_dir.c
 create mode 100644 lib/igt_dir.h
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_sysfs.c
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c
 create mode 100644 tests/intel/xe_debugfs.c
 create mode 100644 tests/kms_debugfs.c

-- 
2.43.0

