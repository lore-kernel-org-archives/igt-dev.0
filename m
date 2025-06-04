Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383B5C5B559
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 05:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5843210E0C2;
	Wed,  4 Jun 2025 05:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DE14faPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1787510E0C2
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 05:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749014627; x=1780550627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kxn6h0oCRGd6LstqDUO3mSl/SAtRyfOchlN7EXnJUPk=;
 b=DE14faPl84EI94IrvFNKnaawjNK4ZgzFlxcyXIgRqxyAok49KKobHe4z
 ytK7A6V49JJYeRLzsOu5xx5rheq9YeXcAPDe/wd/EXVrmp2N/HH8X7mNi
 zPS9BBOxg3xndphD6uzSEzSJp87KYzWCFGD84dfFFy5LscckNBnVbRig5
 fHhm78vLbA1Agvs6gaYYc8m5+4tXO3V+99TutHf7Qyzmsm1GVVG8699lv
 6FHntJJjUvwC9+MgzcbXstmCgN0I5MDSiOAvNayoZuHVlg2GcTvoZbyvb
 Q4C83A5oGPaQTab/gKtBOzFcHJEnjDqHS9pjtk2bo2ssiTeFSCJTD1Sh2 A==;
X-CSE-ConnectionGUID: jo5mNW4UQBe5MgpGUopYzw==
X-CSE-MsgGUID: HoUEXZz2QES9ObI+dDOHBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54738305"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="54738305"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:23:45 -0700
X-CSE-ConnectionGUID: q6gkkSIGSaiKyPfVyNo9AA==
X-CSE-MsgGUID: AsGanH/DQk2UVXYd26201Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145551489"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2025 22:23:43 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 0/5] Refactor DRM Debug Severity Handling for
Date: Wed,  4 Jun 2025 11:00:41 +0530
Message-Id: <20250604053046.1702233-1-pranay.samala@intel.com>
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
  tests/kms: Use CI environment variable
  lib/igt_sysfs: Move igt_exit_handler into test

 lib/igt_sysfs.c                         | 63 +++++++++++++------------
 lib/igt_sysfs.h                         | 20 ++++++--
 tests/intel/kms_dp_linktrain_fallback.c | 22 +++++----
 tests/kms_atomic_transition.c           | 23 +++++----
 tests/kms_cursor_legacy.c               | 22 +++++----
 5 files changed, 89 insertions(+), 61 deletions(-)

-- 
2.34.1

