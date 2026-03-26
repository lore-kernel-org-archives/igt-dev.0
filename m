Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7297E106F2EB
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2393510E9A8;
	Thu, 26 Mar 2026 07:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljsziWk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000110E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774511940; x=1806047940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r0okcgvhgpuYJBSIhoxQh4/gacLs49dTe+UtIz8DEs8=;
 b=ljsziWk/wmBcDNgnl0Ic8+fQ6KjJZ5WTVCdRfyPuDyw7qhgcX9RVmZ+a
 hk/CLif2rjRHsGhu1WVFV7cP2380JkmIMDRFZr14GXTf5WJtOVRhq+LTQ
 oMs8C5nHAJCku4/6+kVCJ6SAojEznpKtgTjutUXVWQx/GzGFjCObvVaBt
 ZQwrBuwyPr20T8uviqKNtGSV7QH2WZaXEELKSdBNo0op2pa3kgX0xSf6k
 7XFX18F2C5MxMwjpwxsV/K78+o/aNA5dC7ZndkczEMyAePIYqP4Ur14Hs
 0MmwFKM2R0VU/idx+cqz34UgRI8sU7o6F8o6KuNHpehu+SInXEyqnbecz Q==;
X-CSE-ConnectionGUID: HYCnYyrzRZajXARecMndhA==
X-CSE-MsgGUID: EsQ0Y7fCRU6y+t/ZwSwL1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75757712"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75757712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:59:00 -0700
X-CSE-ConnectionGUID: FGwz2ZuqSMqfQZpo1lAhzw==
X-CSE-MsgGUID: zx/E5E/fTImCPbt9dkRHnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="221623248"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:58:58 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 0/5] ] intel-ci: Add Xe FULL chamelium run type and
 testlist improvements
Date: Thu, 26 Mar 2026 13:49:52 +0530
Message-ID: <20260326081957.860183-1-sowmiya.s@intel.com>
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

This series adds Xe driver support for FULL chamelium CI runs by
introducing the Xe FULL chamelium run type in kms_test_config.json,
sharing the existing chamelium-only.testlist between i915 and Xe,
and using driver-specific blocklists to handle platform differences.

Additionally, it improves testlist reliability by moving suspend/resume
tests to the end to avoid system hangs affecting main test execution,
migrating inline test exclusions to blocklists for consistent filtering,
and adding non-deterministic random-plane tests to xe blocklist.

v2:
-Update commit message

v3:
-Sort tests alphabetically (Kamil)

v4:
-Add detailed comment (Swati)

v5:
-Remove kms_chamelium_frames from i915 blocklist (Swati)

Mohammed Bilal (4):
  intel-ci: Move suspend/resume chamelium tests to end
  intel: Add Xe FULL chamelium run type to kms_test_config
  intel-ci: Add VGA chamelium exclusion to Xe blocklist
  intel-ci: Enable hdmi 4k resolution test in chamelium testlist

Sowmiya S (1):
  tests/intel-ci/i915.blocklist: Remove kms_chamelium_frames from i915
    blocklist

 tests/intel-ci/chamelium-only.testlist | 22 ++++++++++++----------
 tests/intel-ci/i915.blocklist.txt      | 11 -----------
 tests/intel-ci/xe.blocklist.txt        |  4 ++++
 tests/intel/kms_test_config.json       |  9 +++++----
 4 files changed, 21 insertions(+), 25 deletions(-)

-- 
2.48.1

