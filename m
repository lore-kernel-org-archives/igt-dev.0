Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFA7CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 03:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0837610E0FD;
	Fri, 24 Oct 2025 03:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Emqr7+en";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC3210E0FD
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 03:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761276710; x=1792812710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I3nzn3ed0PQ8u+p91uGR5pMHYv7aOa2P7Y7hv6gc6KA=;
 b=Emqr7+enWM1g8Dz6fpIa8Tws12rmV6T+9+0pVmEtlcQSP9ovxH+Z1xz/
 rV17zecM+2RpqdmTgfPFMGfRpFc0NMQcU7bIWD7nGe/aiE37UGfUyk+Ts
 XUEa5bzgeHW+yonwLMGE7Pcf/Pw1lN6Aor5AjA6x8l1suggAd1M7CxhbF
 smpiZKmKp4/GuxwNg7OCKlA+1DlUtYe/pNe1mfkj7yYc3v3/CwvLYg41W
 5WJ75v1lhuAZniz9F07imwBgmxrnRt8DolywwE8NbBHZWDH1nvHCIdqJC
 xer2PYfLCnOoDTvqEXOwlqxj/xsxM3bLpTNKrB42gxxk5bBKo1cl3FRfo w==;
X-CSE-ConnectionGUID: LSEcFKRWRZmLErkTiOkoqA==
X-CSE-MsgGUID: 95e6bubdQWS2I3pxAB+6bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73746185"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="73746185"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:50 -0700
X-CSE-ConnectionGUID: W6gds+RARcOFduRbZqyIgA==
X-CSE-MsgGUID: NtvEIIA3QGWTYlU9C4TnyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184221606"
Received: from dut2143ptlh.iind.intel.com ([10.223.34.2])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 20:31:48 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, priyanka.dandamudi@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v5 i-g-t 0/5] benchmarks/intel_latency: Add xe latency
 measurement tests
Date: Fri, 24 Oct 2025 03:31:18 +0000
Message-ID: <20251024033118.15674-7-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
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

AAdd latency tests to measure latency of xe driver uAPI calls
for regression detection and performance analysis. These tests
help identify performance bottlenecks in critical graphics
operations.

Test modules included:
- xe_blt: Block transfer latency
- xe_create: Device initialization overhead
- xe_vm_bind: Virtual memory bind timing
- xe_execqueue: Execution/Command queue management
- xe_bo_create_destroy: Buffer object allocation/deallocation
- xe_vm_create_destroy: VM lifecycle
- xe_exec_ctx: Execution context latency

Default test parameters applicable for some tests:
- Buffer sizes: 4KB to 8MB except xe_blt (1MB)
- Iterations: 13 repetitions
- Inner loops: 1000 per iteration
- Parallelism: configurable via command-line options

Updated benchmarks/ meson.build for build integration.

This v5 series supersedes the previous v4 series and should be 
reviewed instead of the earlier version.

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
- Consolidated patch series from 7 to 6 patches

Changes in v5
- Fixed and removed unused options (Priyanka)
- Renamed xe_vm to xe_vm_bind for clarity (Priyanka)
- Fixed meson.build to build as per added tests (Kamil)
- Reduced patch series for cleaner organization

Gajendra Uttamchand (5):
  benchmarks: Relocate xe latency tests and add meson build
  benchmarks/intel_latency: Add xe_execqueue test
  benchmarks/intel_latency: Add xe_vm_bind latency test
  benchmarks/intel_latency:Add xe_vm_create_destroy test
  benchmarks/intel_latency: Add xe_bo_create_destroy test

 benchmarks/intel_latency/meson.build          |  19 +++
 benchmarks/{ => intel_latency}/xe_blt.c       |   0
 .../intel_latency/xe_bo_create_destroy.c      | 125 +++++++++++++++++
 benchmarks/{ => intel_latency}/xe_create.c    |   0
 benchmarks/{ => intel_latency}/xe_exec_ctx.c  |   0
 benchmarks/intel_latency/xe_execqueue.c       | 121 +++++++++++++++++
 benchmarks/intel_latency/xe_vm_bind.c         | 126 ++++++++++++++++++
 .../intel_latency/xe_vm_create_destroy.c      |  72 ++++++++++
 benchmarks/meson.build                        |   7 +-
 9 files changed, 467 insertions(+), 3 deletions(-)
 create mode 100644 benchmarks/intel_latency/meson.build
 rename benchmarks/{ => intel_latency}/xe_blt.c (100%)
 create mode 100644 benchmarks/intel_latency/xe_bo_create_destroy.c
 rename benchmarks/{ => intel_latency}/xe_create.c (100%)
 rename benchmarks/{ => intel_latency}/xe_exec_ctx.c (100%)
 create mode 100644 benchmarks/intel_latency/xe_execqueue.c
 create mode 100644 benchmarks/intel_latency/xe_vm_bind.c
 create mode 100644 benchmarks/intel_latency/xe_vm_create_destroy.c

-- 
2.43.0

