Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990DFCA0EE8
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 12:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412AC10E1B1;
	Wed, 17 Sep 2025 12:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2n2fF/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1553110E1B1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758111404; x=1789647404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AT5OFZlixacERJgMF62/LAFmJyTZO1l42/PYuvYKtXI=;
 b=m2n2fF/L8OHAbMFIMS9O6+FgzaxvzQcS3Mox53HugaQhFDW3BdsKxYJX
 bWisRlJj0GdPyxK9sAO0gsjcBC8BPuDvzg3kIi0SqE8hsYoo/V6WnDiYe
 tXZk3PSub1yAyWX8U2LdYi+1NQGZEmiZYz3y70w1AtvZx3O7DOwxrzOOo
 VQWEdo0AdAGpV2s34zUL06G1vmwSHdCeBLy/YaTo0pjl5esMkzx++19er
 0cqVhMYCoT4jtgTPeB8WYNH1JS4Nk7wDLb3GZxbbecPTahvOx4LQpXXO7
 tUUVpEtvvaqxt6uKx5uCqd5dsVEsBdvD1HNjJV6Yufk3TQMK/hxC2eWzC w==;
X-CSE-ConnectionGUID: X1mtHtP3QOOuHcdEygzPUA==
X-CSE-MsgGUID: T7Dj6q6tTaePW02//w1hkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71840421"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71840421"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:16:44 -0700
X-CSE-ConnectionGUID: XI37xKuuQ/q4DpnnM/3zyQ==
X-CSE-MsgGUID: zcTKo2QmTN+kiJa3eo+15g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175309015"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:16:43 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 0/6] benchmarks/intel_latency: Add xe latency
 measurement tests
Date: Wed, 17 Sep 2025 12:16:24 +0000
Message-ID: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
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

Add latency tests to measure latency of xe driver uAPI calls
for regression detection and performance analysis. These tests
help identify performance bottlenecks in critical graphics
operations.

New test modules included:
- xe_blt: Block transfer latency
- xe_create: Device initialization overhead
- xe_vm: Virtual memory timing
- xe_execqueue: Execution/Command queue management
- xe_bo_create_destroy: Buffer object allocation/deallocation
- xe_vm_create_destroy: VM lifecycle

Default test parameters:
- Buffer sizes: 4KB to 8MB except xe_blt (1MB)
- Iterations: 13 repetitions
- Inner loops: 1000 per iteration
- Parallelism: configurable via command-line options

Updated benchmarks/ meson.build for build integration.

Changes in v2:
- Fixed trailing whitespace and formatting issues in several files
- Added original author attribution to preserve credits for applicable files
- Moved tests from benchmarks/ to benchmarks/latency/ subfolder structure
- Updated build system integration paths for new directory layout
- Preserved git history during file relocations to maintain authorship

Changes in v3:
- Added original author attribution to preserve credits for applicable files

Changes in v4:
- Fixed folder name to intel_latency (Kamil)
- Fixed From, Author and name (Kamil)
- Fixed some alignment and white space (Priyanka)

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>

Gajendra Uttamchand (6):
  benchmarks: Move xe tests to intel_latency folder
  benchmarks/intel_latency: Add xe_execqueue test
  benchmarks/intel_latency: Add xe_vm latency test
  benchmarks/intel_latency:Add xe_vm_create_destroy test
  benchmarks/intel_latency: Add xe_bo_create_destroy test
  benchmarks/intel_latency: Integrate xe latency tests with build system

 benchmarks/intel_latency/meson.build          |  18 +++
 benchmarks/{ => intel_latency}/xe_blt.c       |   0
 .../intel_latency/xe_bo_create_destroy.c      | 130 ++++++++++++++++++
 benchmarks/{ => intel_latency}/xe_create.c    |   0
 benchmarks/{ => intel_latency}/xe_exec_ctx.c  |   0
 benchmarks/intel_latency/xe_execqueue.c       | 127 +++++++++++++++++
 benchmarks/intel_latency/xe_vm.c              | 128 +++++++++++++++++
 .../intel_latency/xe_vm_create_destroy.c      | 122 ++++++++++++++++
 benchmarks/meson.build                        |   6 +-
 9 files changed, 528 insertions(+), 3 deletions(-)
 create mode 100644 benchmarks/intel_latency/meson.build
 rename benchmarks/{ => intel_latency}/xe_blt.c (100%)
 create mode 100644 benchmarks/intel_latency/xe_bo_create_destroy.c
 rename benchmarks/{ => intel_latency}/xe_create.c (100%)
 rename benchmarks/{ => intel_latency}/xe_exec_ctx.c (100%)
 create mode 100644 benchmarks/intel_latency/xe_execqueue.c
 create mode 100644 benchmarks/intel_latency/xe_vm.c
 create mode 100644 benchmarks/intel_latency/xe_vm_create_destroy.c

-- 
2.43.0

