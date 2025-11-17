Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA45FCEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 08:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7EE10E2F3;
	Mon, 17 Nov 2025 08:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hf+1J9gH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD5910E18C
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 05:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763357139; x=1794893139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RWIU2HPBLw/kVhPdJSVapP9ez5g9Q/QLlJLql6LL/IE=;
 b=Hf+1J9gHXyWeJvLcpTgOibzRVSc9txmCbT3U+VU2c9OqRQAgl63KXIEy
 UDbrxSar0p5ipsUwWbQ+CpMtV/xeYAFN2Q5SvYc7hMuZbwjHiS5CWF2qL
 V7J+D0EqHfRmXg7qkpyrOU4qDU0ytnskGbES3l2UA+/eECoZOqr9LSJa6
 5G2zCAgTZa/w4o29dtCTlQDuHaHIbsNhyuIzH1B7MyqItnFBpdAYYf6XG
 mNyxe6OWmKwdBlJm6yEGi86ULOcgRIY/ktIqRAGHRtQxQKrq6/bG9FUB/
 zfGuKLL57ndziHkfGD6AIL96yRA7TnZmOikBL/PVXeZdG/nueKZM6/l4d Q==;
X-CSE-ConnectionGUID: 767SoJgTQwuDwEe5wYNFUA==
X-CSE-MsgGUID: /Z8EH1McReiSZ/1sKqV5hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="67955870"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="67955870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:25:38 -0800
X-CSE-ConnectionGUID: /11oKgWWRCaPdNJBnSdETw==
X-CSE-MsgGUID: TI2D0ZMySLeVJFMCc8A2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="190372743"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 16 Nov 2025 21:25:37 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [v14 i-g-t 0/2] tests/intel/i915_pm_rps: Added Multi-GT support
Date: Mon, 17 Nov 2025 10:55:07 +0530
Message-ID: <20251117052506.578422-4-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Nov 2025 08:08:03 +0000
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

Multi-GT support for various functions.

- Adding Multi-GT support for waitboost functionality validation
- Extending reset test case to ensure compatibility with multi-GT setups
- Refactoring global frequency arrays to per-GT data structures
- Adding GT enumeration and initialization logic
- Updating all frequency validation functions to operate per-GT
- Extending min-max configuration tests across multiple GT tiles
- Ensuring frequency scaling verification works for each GT independently

v2: Split the patches based on test cases. (Vinay/Anirban)

v3: Remove while loop in restore and boost_freq functions. (Anirban)

v4: Refactor GT initialization to use detection loop for proper
    multi-tile suppor. (Vinay)

v5: Consistently use gt_id instead of sysfs_gt. (Vinay)

v6: Refactor Multi-GT code.

v7: Use GT in load runner. (Vinay)

v8: Refactor first and second patch.

v9: Replace sysfs_gt to gt_id. (Vinay)
  - Add read sysfs file code to separate function. (Vinay)
  - Move GT initialization function to first patch. (Vinay)
  - Remove the comment. (Vinay)

v10: Change generic description of each patch. (Vinay)
   - Rename read_sysfs_to_origfreq to read_sysfs_freq
   - Move load_helper_run function to first patch
   
v11: Remove expected_val variable. (Vinay)
   - The restore_sysfs_on_each_gt function required for waitboost
     and reset test cases only.

v12: Use Single spinner in boost_freq function. (Vinay)

v13: Add the 4 spinners back since freq was not ramping.

v14: Revert igt_spin_free function. (Vinay).
   - Add GT-specific context binding to properly trigger
     waitboost mechanism in multi-GT scenarios.

Mallesh Koujalagi (3):
  tests/intel/i915_pm_rps: Add Multi-GT support for freq scaling tests
  tests/intel/i915_pm_rps: Extend Multi-GT support to waitboost and
    reset tests

 tests/intel/i915_pm_rps.c | 430 ++++++++++++++++++++++++--------------
 1 file changed, 274 insertions(+), 156 deletions(-)

-- 
2.45.2

