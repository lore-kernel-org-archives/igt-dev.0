Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C3CCAC581
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 13:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B492F10E528;
	Mon,  8 Sep 2025 13:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhzRtfra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D93510E525
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757339526; x=1788875526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JM4cl1p8Bo7Gs4ueVA+bdaCssMyTmcGvqaOd6PPUnto=;
 b=WhzRtfra816rCNBAyNiZ4A2S23EOWKezVFnd5mb9v8Us7jUkM9GDADPj
 nql9q1OjmfOvAthsjcCk+NImTu6erHAnteTJadwbQ8bx3QNo50V7NLSzO
 UkPVIYAPmpaWlw0dnOFFqsB5gk4Lnt5cjpPIc8+wMowQsabxoLRs44Z85
 7FnAVvnJ+RhNwiZym0flZ6lfTu+Kw/RP61TUfyIrOx89VhbgLoqObNeHU
 9HoojsgMNIs6419gcTjsVJ/YZHmdvs52wlyS3l6HyN1y7tUVKKfcq1Ern
 u8k43l7aE7cV6V8sxsrUzIuCHdhag9mDrPOlz/m7Nj2GSF6B7BPcvXt3k g==;
X-CSE-ConnectionGUID: CtNyAYGTTGS9QEv+q4XU3g==
X-CSE-MsgGUID: zPGLiQnsQoSAOJCBVqjoXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="85041084"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85041084"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:52:05 -0700
X-CSE-ConnectionGUID: f/XXzPjlS6GKeIqHd4TkgA==
X-CSE-MsgGUID: sBZ+gsy3Ra2mWgiowSG8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="171968328"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2144PTLH.iind.intel.com) ([10.190.232.53])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 06:52:04 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dwarakanath.ramadeva@intel.com, pravalika.gurram@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v2 i-g-t 0/7] benchmarks/latency: Add xe latency measurement
 tests
Date: Mon,  8 Sep 2025 13:51:38 +0000
Message-ID: <20250908135142.38997-9-gajendra.uttamchand@intel.com>
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

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>

Gajendra Uttamchand (4):
  benchmarks/latency: Add xe_vm latency test
  benchmarks/latency: Add xe_bo_create_destroy latency test
  benchmarks/latency: Add xe_vm_create_destroy latency test
  benchmarks/latency: Integrate xe latency tests with build system

Gurram Pravalika (3):
  benchmarks/latency: Add xe_blt latency test
  benchmarks/latency: Add xe_create latency test
  benchmarks/latency: Add xe_execqueue latency test

 benchmarks/latency/meson.build            |  19 ++++
 benchmarks/{ => latency}/xe_blt.c         |   0
 benchmarks/latency/xe_bo_create_destroy.c | 130 ++++++++++++++++++++++
 benchmarks/{ => latency}/xe_create.c      |   0
 benchmarks/latency/xe_execqueue.c         | 127 +++++++++++++++++++++
 benchmarks/latency/xe_vm.c                | 128 +++++++++++++++++++++
 benchmarks/latency/xe_vm_create_destroy.c | 122 ++++++++++++++++++++
 benchmarks/meson.build                    |   7 +-
 8 files changed, 530 insertions(+), 3 deletions(-)
 create mode 100644 benchmarks/latency/meson.build
 rename benchmarks/{ => latency}/xe_blt.c (100%)
 create mode 100644 benchmarks/latency/xe_bo_create_destroy.c
 rename benchmarks/{ => latency}/xe_create.c (100%)
 create mode 100644 benchmarks/latency/xe_execqueue.c
 create mode 100644 benchmarks/latency/xe_vm.c
 create mode 100644 benchmarks/latency/xe_vm_create_destroy.c

-- 
2.43.0

