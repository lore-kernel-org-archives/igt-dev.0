Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB43CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 12:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F8D10E822;
	Wed, 17 Sep 2025 12:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9atIVXV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D87910E822
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758112408; x=1789648408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AT5OFZlixacERJgMF62/LAFmJyTZO1l42/PYuvYKtXI=;
 b=I9atIVXVVtxL+ycGxgJ/D1mcFxa9XavEYeYcSHcJl24UWFMXiOwmsDHg
 22xwtLmzDVLffKtkh3MOzh/nF3JWlH92gDwOP5v9QM51w4ZzSMnPcmkyb
 qAFZkT73YjJVUU2twPQCVc7jrU9y3dmYlXneN1ekx6hlcTO8UvZl9HIkn
 BogywB4jUxmUza1aFJ+9hnE47k1k+l2GTZkuZwe4vrT6z6eYU/DWdtshd
 DqkhMCZuCg3zG1Y0nGvl/wvgM5Jh+P0pn9MxgiWouVr4hhsw2Th2AL/ja
 yqicH7d/Jwg0IX1Qj4pjMlQlrgpsjL/+nRBY5czCR/+yxMHW6KxAlXMVX g==;
X-CSE-ConnectionGUID: ShhBZ68XQwiGfCWBxF9uyQ==
X-CSE-MsgGUID: hcWQ/Z02SnOT/JYCAC9lMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71781628"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71781628"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:33:28 -0700
X-CSE-ConnectionGUID: 20RVBx9QSQKVu2PyJ7WEjQ==
X-CSE-MsgGUID: wq71/MM3QyK8HEqX5HTjDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="212379544"
Received: from dut2144ptlh.iind.intel.com ([10.190.232.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 05:33:27 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v4 i-g-t 0/6] benchmarks/intel_latency: Add xe latency
 measurement tests
Date: Wed, 17 Sep 2025 12:33:11 +0000
Message-ID: <20250917123312.68977-8-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
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

