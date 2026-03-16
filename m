Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26838F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 07:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C838E10E497;
	Mon, 16 Mar 2026 07:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aB3MThNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A356F10E497
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773647947; x=1805183947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZLLd+R+D9kdmEME7ck3XHCbn27uuY8aJkOsFUxzBK4c=;
 b=aB3MThNhfAsbTEfbXC76ANQXad2W/Y5GKyJFoxEyUcvTFhmcQHrZks8H
 acrAD7lMJFwtF74xzEbB11c5Bb8SnUZzIQTk0QHh+1LgWPK9f3txlFo3y
 y+PwJWadn2ZsyX+aTP4qUEnaSAaE7VfSJp+6UMmujq+Qb8c5ErIfsJH6p
 w2cjfkSs6ypszJG25Rj/mIsz40i6+wZFynpxN6tMNJ9X08IOXyJyAcYtP
 ikUue5zgOfegRvQ4wWI87HsvYWk/qrdtTsmlYaPDOKFl0uHvG0E60+ggD
 QNha37Ro2FKdMCrvO8orVfehGMiB2qbbWkw66HziA8v3AU37qLWJV9e5V Q==;
X-CSE-ConnectionGUID: Ce/gi4PTRDeGij8RLCxEpg==
X-CSE-MsgGUID: AbtPcFI9Sp+lPcBNrtfGrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74541973"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74541973"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:06 -0700
X-CSE-ConnectionGUID: uLUpThg8Rz6ZPrEs2oSPIw==
X-CSE-MsgGUID: 0ARXcngoSTixMzuPqIPCtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226826016"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:05 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com, kamil.konieczny@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 0/5] intel-ci: Add Xe FULL chamelium run type and testlist
 improvements
Date: Mon, 16 Mar 2026 13:26:06 +0530
Message-ID: <20260316075611.3333142-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

Mohammed Bilal (5):
  intel-ci: Move suspend/resume chamelium tests to end
  intel: Add Xe FULL chamelium run type to kms_test_config
  intel-ci: Add VGA chamelium exclusion to Xe blocklist
  intel-ci: Add *-planes-random chamelium test to Xe blocklist
  intel-ci: Enable hdmi 4k resolution test in chamelium testlist

 tests/intel-ci/chamelium-only.testlist | 18 ++++++++----------
 tests/intel-ci/xe.blocklist.txt        | 15 +++++++++++++++
 tests/intel/kms_test_config.json       |  9 +++++----
 3 files changed, 28 insertions(+), 14 deletions(-)

-- 
2.48.1

