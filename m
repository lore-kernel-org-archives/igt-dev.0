Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2E3CA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 08:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0823910E999;
	Thu,  4 Sep 2025 08:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtoXhhnF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7D10E235
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756973620; x=1788509620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=amCObBi2Fm8pHKOZwZ1GKv4xCue6x3zP2b8Iia/5b9M=;
 b=gtoXhhnFF62iTFvDGRvKRnnf6LochD3sU9mYatd6VWOWVkOwoZs73tdZ
 mHFA9J5ctXHRm6cw4bB3JVlsZ4O2XKXniRNr0Y/3XB27SGM6b1yp4pGTr
 88P9rfVw4OPu6cRoTKXYdTl6Q3GbedBfcOAtqpP8Cabr3dlpnfK38FS9J
 zpRXRZ+Vk4m5yOkDmN/Hx3PtvvmoeESJuIcZEpERXvIB94toC7HDKu6vp
 p/iMZjuFQwRT1KmYjEPpkYCrdtuFFJ6qAhKg8vdQ0Vnz6kUaZX84R3yU1
 n93moemcyXQwt/QEUobuIzzX8U5udYjI9k/bw0eN/xPt6kcc0uLGb2ZiC g==;
X-CSE-ConnectionGUID: BAtuT3cIQmmVu3Bnkx//rg==
X-CSE-MsgGUID: byBCXOvqRlCO/Qvx7llD8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76907619"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76907619"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:13:40 -0700
X-CSE-ConnectionGUID: I9bvyzvvRRCxD5+TMrmYcQ==
X-CSE-MsgGUID: K3rHgukMTUiBYr2S7EDgiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="172278846"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2146PTLH.iind.intel.com) ([10.190.234.52])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:13:39 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH i-g-t 0/7] benchmarks/latency: Add xe latency measurement tests
Date: Thu,  4 Sep 2025 08:13:18 +0000
Message-ID: <20250904081319.1320131-9-gajendra.uttamchand@intel.com>
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

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>

Gajendra Uttamchand (7):
  benchmarks/latency: Add xe_blt latency test
  benchmarks/latency: Add xe_create latency test
  benchmarks/latency: Add xe_vm latency test
  benchmarks/latency: Add xe_execqueue latency test
  benchmarks/latency: Add xe_bo_create_destroy latency test
  benchmarks/latency: Add xe_vm_create_destroy latency test
  benchmarks/latency: Integrate xe latency tests with build system

 benchmarks/latency/meson.build            |  19 ++
 benchmarks/latency/xe_blt.c               | 314 ++++++++++++++++++++++
 benchmarks/latency/xe_bo_create_destroy.c | 130 +++++++++
 benchmarks/latency/xe_create.c            | 156 +++++++++++
 benchmarks/latency/xe_execqueue.c         | 127 +++++++++
 benchmarks/latency/xe_vm.c                | 128 +++++++++
 benchmarks/latency/xe_vm_create_destroy.c | 122 +++++++++
 benchmarks/meson.build                    |   5 +-
 8 files changed, 1000 insertions(+), 1 deletion(-)
 create mode 100644 benchmarks/latency/meson.build
 create mode 100644 benchmarks/latency/xe_blt.c
 create mode 100644 benchmarks/latency/xe_bo_create_destroy.c
 create mode 100644 benchmarks/latency/xe_create.c
 create mode 100644 benchmarks/latency/xe_execqueue.c
 create mode 100644 benchmarks/latency/xe_vm.c
 create mode 100644 benchmarks/latency/xe_vm_create_destroy.c

-- 
2.43.0

