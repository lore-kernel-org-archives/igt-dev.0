Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3674BC83F03
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 03:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89A310E083;
	Mon,  7 Jul 2025 03:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IX1r+9Kl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C259710E083
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 03:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751858710; x=1783394710;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=idj6g5wNElEw9pbykqQQhMbhdsexPU5Asd9h/zitzE4=;
 b=IX1r+9KlokowTlUEUtgbfx/G9qaFxghQ98lBfUEdPE3lA1RF35yQh9zU
 M+2s6d7XRA6rWKULwkmGgS4m875MbcloCbtXMXU9ah/zliwfCJ2UdmnXh
 ypMb7VZoqHt5kdWgPx2ZcYChnVDhmvnjQoAzy/1OOP4N1sILiLd4juf4V
 ynMFdOCIB0KpRIt2UruuCrYLvb44AtADn6ZvR3M23aN214f3XH9/ec8s2
 j+Omzs8uckunrIW3Rw5ZtsZYEKUu9WkJsVZRC7x8MIftJWFqOSn8zDSDU
 Dm4v6QX4IWJc9gHzfgJYWvsF9ZgxnDOVyVnp5dhTbYRyirt9UtS33zH6e A==;
X-CSE-ConnectionGUID: Za9Wct+ySOW7kuLRZzXYGA==
X-CSE-MsgGUID: P2RbU77sSkWKLFa2wJipUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65134971"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65134971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:25:09 -0700
X-CSE-ConnectionGUID: YpJdISQgTHWZezOT/Qty6w==
X-CSE-MsgGUID: d5e5Bi/JTUmSBovIgkecag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="192288677"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 06 Jul 2025 20:25:07 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 0/5] Refactor DRM Debug Severity Handling for
Date: Mon,  7 Jul 2025 09:02:41 +0530
Message-Id: <20250707033246.751156-1-pranay.samala@intel.com>
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

This update refactors the debug mask handling in the test framework for
improved readability and addresses logical inconsistencies. The test now 
leverages the IGT_CI_RUN environment variable to control the debug mask 
dynamically, according to the test's internal requirements.

Additionally, the exit handler has been modified to restore the original
debug mask after the test completes, ensuring consistency. These changes
enhance the flexibility and robustness of the DRM debug logic, making it
easier to control the debug mask throughout the test.

v2:
- Implementated to allow flexible bitmask usage during execution. (Jani)
- Update the commit message (Jani)
- Using mask to update instead of a single category (Jani)
- To handle nested updates, exit_handler is set before the update
  process (Jani)

v3:
- Refactored for readability and address logical comment.

v4:
- Remove custom command-line option handler (Jani & Kunal)
- Have different masks documented (Kunal)
- Use an environment variable for CI jobs where disk space is tight (Kunal)
- Improve variable name for original debug mask saving (Kunal)
- Rename debug_level parameter to mask (Kunal)

v5:
- Move function to shared library to avoid duplication (Rama)
- Solve compilation issue (Rama)
 
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")

Pranay Samala (5):
  lib/igt_sysfs: Rename log_level to saved_drm_debug_mask
  lib/igt_sysfs: Rename debug level APIs/variables to debug mask
  lib/igt_sysfs: Update new debug mask requested by user
  tests/kms: Use CI environment variable
  lib/igt_sysfs: Move igt_exit_handler into test

 lib/igt_sysfs.c                         | 70 ++++++++++++++-----------
 lib/igt_sysfs.h                         | 21 ++++++--
 tests/intel/kms_dp_linktrain_fallback.c | 11 ++--
 tests/kms_atomic_transition.c           | 13 ++---
 tests/kms_cursor_legacy.c               | 12 ++---
 5 files changed, 67 insertions(+), 60 deletions(-)

-- 
2.34.1

