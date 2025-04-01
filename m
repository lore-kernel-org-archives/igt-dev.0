Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366E7C3601A
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DD310E060;
	Tue,  1 Apr 2025 09:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHgq6FjC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327C910E52F
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743499224; x=1775035224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jgLyaGBk8b2rk1IWyeEAa9pTGf27sScRP9qK3/jutHY=;
 b=KHgq6FjCMmDKxQkRUP6XiOgzeI7RUJt3nXNMgGZoH/7/lkXJt2iPYKgQ
 FCyfY/itirMFFfMhKr4QiuQOE/ujnl6eo5K4UwRcoyYdCds5TsNlB0IC5
 BDCGOMoK7eCtkLyA8Yja1iIYFGX3wOidx0cr53N3kSWQ91ya6de1bW/0S
 /8hrfulAp7NZoJcjMbdGhtCgTOt63W3oQcueVIYxsZycOo209xZ5Z0XMR
 46RweQGHHp6cw/LYtq4dgGv1QfcdE95U6WtRfpohUkYJHMkaF41FnQxnR
 ZKUM4UGb2PN6il0FM6uJORGLDT9yZVqyF8U3fOSmgM5vuwCPc8G5hLsz1 Q==;
X-CSE-ConnectionGUID: WhH5usK9QACYwGx4rILcdw==
X-CSE-MsgGUID: k1holyQiSByBCSsG8iCCDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62211740"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62211740"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:20:19 -0700
X-CSE-ConnectionGUID: sWUGzFO4QTmAYXlmtN4EVw==
X-CSE-MsgGUID: sRCt6HSqSpus/HEKV1dpXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126166447"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2025 02:20:16 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 0/5] Refactor DRM Debug Severity Handling for
Date: Tue,  1 Apr 2025 14:50:10 +0530
Message-Id: <20250401092015.818465-1-pranay.samala@intel.com>
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
improved readability and addresses logical inconsistencies. Users can now
pass a bitmask option during execution, enabling dynamic updates to the
debug mask. If no bitmask is provided, the default value is set to 0x4.

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
  lib/igt_sysfs: Usage of Original debug mask to read/reset
  lib/igt_sysfs: Rename debug level APIs/variables to debug mask
  lib/igt_sysfs: Update new debug mask requested by user
  tests/kms: Add parse_bitmask support for user
  lib/igt_sysfs: Move igt_exit_handler into test

 lib/igt_sysfs.c                         | 64 +++++++++++++------------
 lib/igt_sysfs.h                         |  7 +--
 tests/intel/kms_dp_linktrain_fallback.c | 38 +++++++++++----
 tests/kms_atomic_transition.c           | 25 +++++-----
 tests/kms_cursor_legacy.c               | 38 +++++++++++----
 5 files changed, 108 insertions(+), 64 deletions(-)

-- 
2.34.1

