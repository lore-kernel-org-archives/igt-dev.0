Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AE4C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 18:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A677410E305;
	Fri, 10 May 2024 18:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aupGlbv9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D0710E0E7
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715366396; x=1746902396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7oNGHoitG2GqCptdZXowgPDSsWSgedR3E8eTeHE3d7M=;
 b=aupGlbv9zXc4LXAkKvTFBbT71aEwq+su1d6xhPUfmdf4i0GUKDbUemib
 3i0dw6nTijluGzeQ4xIAJqgzPL4nsvBg0Ug5X7ndKx7ZPtCuumW7NfKhr
 KPnz46ZFDyeRVYJ0ljqstfxXp7Wt89J/xqf1ptoU859D6p1q3jB6umJ4K
 NtFo3u6/6uPf3jEsI6bESJ0Mvmtfmffp8e49fsJacXJTp1lO7g6g7VOAe
 E7wsPPl7PvWJiSKkjGg7SwZ1Rw9FRrRvG5eqr/D4KGyrBMvY4ki+rOUyA
 fzkViHAjtQkehNLUkLRB8ZvLr7er9js3hNvZL0GNDjKvwlKjJ2E1SHzlw w==;
X-CSE-ConnectionGUID: SV50XXd7QWWcpOVOfFyJMA==
X-CSE-MsgGUID: xCG8pg7RTDe5YH0dkyCC9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11489595"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11489595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:39:55 -0700
X-CSE-ConnectionGUID: bjoNbFVJQGmBeYnrN8CsHg==
X-CSE-MsgGUID: sv+h9ARgTrutWQNVgyCmLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29764425"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:39:55 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, brian.welty@intel.com,
 tomasz.mistat@intel.com, himanshu.girotra@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t v2 0/2] lib/xe/xe_query: Wait for xe_supports_faults
Date: Fri, 10 May 2024 11:24:36 -0700
Message-Id: <20240510182438.3178575-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

It's possible for xe_supports_faults to return false if the system is
busy with multiple running tests.  This is because the check looks for
all active VMs and searches for VMs that do not have faults enabled,
returning false if any exist.  Recently, this check has been changed to
return EBUSY when the check fails in this way, so wait for up to ten
seconds for all the active VMs to flush out before proceeding.

v2:
- Remove loop from lib version of xe_supports_faults.
- Change xe_supports_faults to instead return the return value of the
  ioctl call used for the check.
- Loop when xe_supports_faults is called instead if the return value is
  -EBUSY.

v3:
- Add missing newlines.
- Split series into two patches.
- Make timeout depend on simulation status.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1562
Test-with: 20240503190138.1958302-1-jonathan.cavitt@intel.com
Suggested-by: Brian Welty <brian.welty@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>


Jonathan Cavitt (2):
  lib/xe/xe_query: return errno from xe_supports_faults check
  tests/intel/xe_exec_fault_mode: account for EBUSY in support check

 lib/xe/xe_query.c                | 15 ++++++++-------
 lib/xe/xe_query.h                |  2 +-
 tests/intel/xe_exec_fault_mode.c | 12 +++++++++++-
 3 files changed, 20 insertions(+), 9 deletions(-)

-- 
2.25.1

