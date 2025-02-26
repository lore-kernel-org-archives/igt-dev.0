Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC7C021BF
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 13:26:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038B010E911;
	Wed, 26 Feb 2025 13:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kI0cfW0l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7355310E911
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 13:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740576394; x=1772112394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TxNu9kOhTxrCZX3YnuSYH1MIPSpCIY+NZtGkP3BCbqs=;
 b=kI0cfW0lcPS/29jSvFT2cFW5FaljyNx97Y+eiN+7uzi598zvFSdPZndD
 ZMk42m26ojRatatuOpEFpILdz2WvSBBSwUg8UnqmkeJ1Hv6KchM7lzZGV
 y5DuvPjpbNrlT8brbza2Ericoqzr6j4XjzJNmn8922oohgeFoO2AFaS84
 zUyVnSV92VnxhXqz0bXm7g3ZB5VOoB/qbjOOX8dgLnU486BDrDxP1t1Qw
 Ur06JHPtbu4ujB8+rJKyXoG0uCV93emybIZs6sG2g0aPflzJ6w+80+Q+X
 J+V1/XBCzCK8M/oAlzwe/MY6Xenhsg88OqiQW/U9JW4YDwixK4Ip09Wkm A==;
X-CSE-ConnectionGUID: ayscB/b9S0OGJ45xPrSnnQ==
X-CSE-MsgGUID: q2Mvx+yGRiah2mewPacbzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41296437"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="41296437"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 05:26:29 -0800
X-CSE-ConnectionGUID: vF1LESKWT96bh14DqDLwIA==
X-CSE-MsgGUID: XOi9+S0ZS+qLEZK2UNesyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="147522868"
Received: from hedwards-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.96.245])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 05:26:25 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 christian.koenig@amd.com, alexander.deucher@amd.com, jesse.zhang@amd.com,
 harry.wentland@amd.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH v6 i-g-t 0/2] Integrate kmemleak scans in igt_runner
Date: Wed, 26 Feb 2025 14:25:50 +0100
Message-Id: <20250226132552.41294-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch series introduces a library to interact with the Linux kernel's
kmemleak feature and integrates it into igt_runner. If kmemleaks are
detected, they will be saved in the igt_runner results directory in a file
named kmemleak.txt.

During testing, the size of the kmemleak.txt file varied significantly.
Larger files, up to 2 MB, were observed when running i915-BAT on a Tiger
Lake DUT. Conversely, smaller files, typically under 100 KB, were generated
when running Xe BAT on the same DUT.

Large files often contain numerous false positives, with the e1000 driver
being a frequent source of noise. The time required for the Linux kernel to
complete a kmemleak scan ranges from 5 to 60 seconds.  This variability can
cause igt_runner to slow down by a factor of 4 when using the -keach
option.

Transient leaks are a common phenomenon but are mostly undetected by the
current version of this library. A typical transient leak occurs when
pointers are reused, such as in linked lists. For example, if 10 calls to
kmalloc are made, storing the address in the same variable and freeing only
the final allocation, the previous 9 allocations become transient leaks.
These leaks will go undetected unless the kernel thread performs continuous
scanning.

To enable continuous scanning:
 # echo scan=1 > /sys/kernel/debug/kmemleak

This configures the kmemleak kernel thread to scan the memory continuously
with 1 second pauses. While this may increase the likelihood of detecting
transient leaks, it can significantly impact system performance. In most
cases, the igt_runner slowdown remains in the 4x range, but the kernel
thread will consume 100% of a CPU core, as observed with tools like top.

When using scan=1, transient leaks that exist during an active scan will be
detected. However, detection remains non-deterministic due to timing. It is
recommended to reset the scan interval to the default value of 600 seconds
after completing your tests.

v6:
 - Update copyright year to 2025
 - Remove double newline from runner/executor.c
 - Fix indentation issues caused by renaming igt_kmemleak* to runner_kmemleak*

v5:
 - move the code from lib/ to runner/
 - rename igt_* to runner_*
 - replace calls to igt_info() with calls to fprintf(stderr, ...)
 - #includes on kmemleak.c:
   - remove #include "igt_core.h"
   - sort includes aplhabetically
 - refacor the if statement for handling the optional argument to -k
 - changed where 'k::' is located inside the string for getopt_long()
 - fix one ident error
 - use two separate assignments instead of making two at the same time
 - replaced two calls to errf() by a single call with a multiline string
 - commit message: explain the changes to runner unit testing

v4:
 - Cleaned-up CC list
 - Fixed typo in patch numbering
 - Fixed Reviewed-by tag
 - Reintroduced ',' after "results-path". It was removed by accident
 - Changed unit testing for calling igt_kmemleak() with and without sync.

v3:
 - Removed '>' from the end of one of the email addresses in the cc list
 - Removed email addresses that no longer exist

v2:
 - Pass igt_kmemleak_sync as a function variable to igt_kmemleak instead of
   keeping it stored as a global variable
 - igt_kmemleak_found_leaks(): Remove call to fseek() after close()
 - igt_kmemleak_write(): Increase retry counter when writing 0 bytes
 - igt_kmemleak_write(): change type to bool
 - Unit Testing: Move the call to igt_kmemleak_init() to a fixture.
 - igt_kmemleak_append_to(): Add brackets to the if statement for improved
   readability

Cc: christian.koenig@amd.com
Cc: alexander.deucher@amd.com
Cc: jesse.zhang@amd.com
Cc: harry.wentland@amd.com
Cc: zbigniew.kempczynski@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: ryszard.knop@intel.com
Cc: lucas.demarchi@intel.com
Cc: katarzyna.piecielska@intel.com
Cc: jonathan.cavitt@intel.com

Peter Senna Tschudin (2):
  runner/kmemleak: library to interact with kmemleak
  runner/executor: Integrate igt_kmemleak scans

 runner/executor.c             |  26 +++-
 runner/kmemleak.c             | 273 ++++++++++++++++++++++++++++++++++
 runner/kmemleak.h             |  16 ++
 runner/meson.build            |  11 +-
 runner/runner_kmemleak_test.c | 267 +++++++++++++++++++++++++++++++++
 runner/runner_tests.c         |  13 +-
 runner/settings.c             |  31 +++-
 runner/settings.h             |   2 +
 8 files changed, 634 insertions(+), 5 deletions(-)
 create mode 100644 runner/kmemleak.c
 create mode 100644 runner/kmemleak.h
 create mode 100644 runner/runner_kmemleak_test.c

-- 
2.34.1

