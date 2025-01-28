Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211D3C02193
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 15:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20EA10E689;
	Tue, 28 Jan 2025 15:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P96j3VPC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DBB10E684
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738077400; x=1769613400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qU0FWNVJtFjQ3p0jhufg3iySW0t1vlHVliwFTFJ0cbI=;
 b=P96j3VPC7paqtpBgj8zl8uJd6S5PoN1AUEjZI87PaP/tZVyFmYwqY/30
 q7751rPqGO9ikGbLnOkw/ynwHSq7SwHApyAmCddTWug5mLugN/5ZKglov
 UIiHdHbZT5d6rsVpEZc2GaKq/6+igaHLimoWKxtfOKvbovJ0hV4WR7Vn4
 lLRGzhxl0VnBPJ7B1S1gu963o54BhsPStAh0HmHoBkBhJE2YMz/KtakZ6
 iX8Yf4OIoNvEOHSupp1UrYwHxGXioUuQpeVVTaeeYAK2VRzKS06xJZPoc
 h52+1xTKYV9lRGXeJPq5C8ORQABFbXmbIwkfq32QFUhZBocjQCsV74dHB w==;
X-CSE-ConnectionGUID: O9al4heOSZW6tpvJQ+5/nw==
X-CSE-MsgGUID: 0W5J4KiaTt2YtbaWUOOlCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38667832"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38667832"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:16:37 -0800
X-CSE-ConnectionGUID: i3z27F7nSIGXcvXRZIg6Zg==
X-CSE-MsgGUID: uH7hzWPfS5iz+WWa3aAKiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="113763892"
Received: from hpabst-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.246.21.97])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:16:35 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v4 0/2] Integrate kmemleak scans in igt_runner
Date: Tue, 28 Jan 2025 16:15:35 +0100
Message-Id: <20250128151537.515639-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch series introduces a library to interact with the Linux
kernel's kmemleak feature and integrates it into igt_runner. If
kmemleaks are detected, they will be saved in the igt_runner results
directory in a file named kmemleak.txt.

During testing, the size of the kmemleak.txt file varied significantly.
Larger files, up to 2 MB, were observed when running i915-BAT on a
Tiger Lake DUT. Conversely, smaller files, typically under 100 KB, were
generated when running Xe BAT on the same DUT.

Large files often contain numerous false positives, with the e1000
driver being a frequent source of noise. The time required for the
Linux kernel to complete a kmemleak scan ranges from 5 to 60 seconds.
This variability can cause igt_runner to slow down by a factor of 4
when using the -keach option.

Transient leaks are a common phenomenon but are mostly undetected by
the current version of this library. A typical transient leak occurs
when pointers are reused, such as in linked lists. For example, if 10
calls to kmalloc are made, storing the address in the same variable
and freeing only the final allocation, the previous 9 allocations
become transient leaks. These leaks will go undetected unless the
kernel thread performs continuous scanning.

To enable continuous scanning:
 # echo scan=1 > /sys/kernel/debug/kmemleak

This configures the kmemleak kernel thread to scan the memory
continuously with 1 second pauses. While this may increase the
likelihood of detecting transient leaks, it can significantly impact
system performance. In most cases, the igt_runner slowdown remains in
the 4x range, but the kernel thread will consume 100% of a CPU core,
as observed with tools like top.

When using scan=1, transient leaks that exist during an active scan
will be detected. However, detection remains non-deterministic due
to timing. It is recommended to reset the scan interval to the
default value of 600 seconds after completing your tests.

v4:
 - Cleaned-up CC list
 - Fixed typo in patch numbering
 - Fixed Reviewed-by tag
 - Reintroduced ',' after "results-path". It was removed by accident
 - Changed unit testing for calling igt_kmemleak() with and without
   sync.

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

CC: ryszard.knop@intel.com
CC: lucas.demarchi@intel.com
CC: katarzyna.piecielska@intel.com
CC: jonathan.cavitt@intel.com

Peter Senna Tschudin (2):
  lib/igt_kmemleak: library to interact with kmemleak
  runner/executor: Integrate igt_kmemleak scans

 lib/igt_kmemleak.c       | 274 +++++++++++++++++++++++++++++++++++++++
 lib/igt_kmemleak.h       |  16 +++
 lib/meson.build          |   1 +
 lib/tests/igt_kmemleak.c | 267 ++++++++++++++++++++++++++++++++++++++
 lib/tests/meson.build    |   1 +
 runner/executor.c        |  25 +++-
 runner/runner_tests.c    |  16 ++-
 runner/settings.c        |  31 ++++-
 runner/settings.h        |   2 +
 9 files changed, 629 insertions(+), 4 deletions(-)
 create mode 100644 lib/igt_kmemleak.c
 create mode 100644 lib/igt_kmemleak.h
 create mode 100644 lib/tests/igt_kmemleak.c

-- 
2.34.1

