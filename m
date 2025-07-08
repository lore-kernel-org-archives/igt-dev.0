Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CA2C8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 14:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BEE10E676;
	Tue,  8 Jul 2025 14:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3XOeKnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2DD10E666
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751985489; x=1783521489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hnIFOapO/+uUDuDZYFr/2wCAZPlYaPON42cG1lHhE7Y=;
 b=j3XOeKnlLmWjEQwgHTTcDLMxfsKRZm31khPLDKzmepQpIkB81a2GLp9C
 Gz7DOaXtVE/dTwfVw6kmVY8SZLEcrO27sJWhSx7HKFdzqVltcAEiijPlP
 xlGYVMMOwYq8LdEYJBe9blq8sggVufGzJVqlnMnhmqHEyaPnuX1TjFRlV
 liu5Py7yam+IjciTrO2FZCMCNR9gI1Hz7R5VFPHMcy7NrDv9oHsdlJCKD
 Dc7M1i7GetMinJJCNEIKia7YkCDJfszoVz43tBn7K88mJ53irFN5+eHNl
 UysVbkbYR5TcRbg5nhMWM3KIkYY5K63Yzsl9viOztvz2ytF0lMz5UY75T A==;
X-CSE-ConnectionGUID: b15+DmQqQrW/yJ9hT/rASA==
X-CSE-MsgGUID: NpaTJgiWQlqUHHbrJBRZhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53433321"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="53433321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:38:09 -0700
X-CSE-ConnectionGUID: rChD78xfQSixoHyLBMEhww==
X-CSE-MsgGUID: DwzVUEUVQg+Zjs+lyW/37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="156001415"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 07:38:05 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com, ewelina.musial@intel.com
Subject: [PATCH v5 i-g-t 0/6] Replace intel_sysfs_debugfs
Date: Tue,  8 Jul 2025 16:37:29 +0200
Message-ID: <20250708143737.52338-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707210726.55334-1-peter.senna@linux.intel.com>
References: <20250707210726.55334-1-peter.senna@linux.intel.com>
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
 lib/igt_dir.c                            | 287 +++++++++++++++
 lib/igt_dir.h                            |  62 ++++
 lib/meson.build                          |   1 +
 scripts/code_cov_selftest.sh             |   2 +-
 tests/core_debugfs.c                     |  48 +++
 tests/core_sysfs.c                       |  49 +++
 tests/intel-ci/fast-feedback.testlist    |   4 +-
 tests/intel-ci/xe-fast-feedback.testlist |   8 +-
 tests/intel/intel_sysfs_debugfs.c        | 430 -----------------------
 tests/intel/xe_debugfs.c                 | 208 +++++++++++
 tests/intel/xe_test_config.json          |   2 +-
 tests/kms_debugfs.c                      | 151 ++++++++
 tests/meson.build                        |   5 +-
 14 files changed, 827 insertions(+), 448 deletions(-)
 create mode 100644 lib/igt_dir.c
 create mode 100644 lib/igt_dir.h
 create mode 100644 tests/core_debugfs.c
 create mode 100644 tests/core_sysfs.c
 delete mode 100644 tests/intel/intel_sysfs_debugfs.c
 create mode 100644 tests/intel/xe_debugfs.c
 create mode 100644 tests/kms_debugfs.c

-- 
2.43.0

