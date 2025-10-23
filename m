Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F194CCF9E0
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 07:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA49410E365;
	Thu, 23 Oct 2025 07:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0irNKlf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B07810E1D7
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761203266; x=1792739266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/+m6q5YOKqjW5yDqJ8bIu6go+hdX4FxpXsPfulG/NvY=;
 b=P0irNKlfpQOMY70t3dwz4auWEk8J+1Qj3RZ2dBWYFEfyxdAE6L3UtLgr
 BNEloBQeLz2k/OSu3LTp/C3G855oRIL3YxLm0LsZ1arrQmBcECxZviY5h
 APp8iaGEjc3LDKzil8pGc3bUfa/Dimk6EzfAlwpnyt0WtTsZJmbjkAnlR
 8GFes/Kjgtvti/vgFUJwfHyv3qf1NFL7YkIWRLLH6lwOyITLRYoq7jJ8m
 2tHLXXu7UX75RTkz1A2twJfvKRIkFjeErjLO7UusDkDb/Aa5hnrJUCW9K
 py1ybkVy415Iz9efa+1vDQOro0jdO5j4P8wJtw9Juj5L9i0WZzuptMlIH A==;
X-CSE-ConnectionGUID: ZfYlEIpUSXGi5uJZw1Tx5Q==
X-CSE-MsgGUID: RQeReSK0QRucxS7TVWnv7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63402293"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63402293"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 00:07:46 -0700
X-CSE-ConnectionGUID: 7bJA/stIQ0qTJgyh9o79jA==
X-CSE-MsgGUID: URoWfZGFTyOU2u3ueWy6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184143379"
Received: from dut2143ptlh.iind.intel.com ([10.223.34.2])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 00:07:44 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gajendra.uttamchand@intel.com
Subject: [PATCH v5 i-g-t 0/5] benchmarks/intel_latency: Add xe latency
 measurement tests
Date: Thu, 23 Oct 2025 07:07:26 +0000
Message-ID: <20251023070727.159678-7-gajendra.uttamchand@intel.com>
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

Changes in v5
- Fixed and removed unused options (Priyanka)
- Renamed xe_vm to xe_vm_bind for clarity (Priyanka)
- Fixed meson.build to build as per added tests (Kamil)

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>

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

