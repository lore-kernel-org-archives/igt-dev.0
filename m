Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A6DD73612
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 18:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0870410E80C;
	Mon,  2 Dec 2024 18:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7/WEGpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B73910E301
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733162898; x=1764698898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Aho72gkrWW0Wu3c01QRXFBfFJoTh7lDvMCu6D3rg3TU=;
 b=N7/WEGpaB+9fURcBG+H+ntNLIfGlyr8Wr9UODOvYJ9Aj1LNdwQKnqDrZ
 qFQW2eQWt9x9CCNTOjg6RcjnUEdkLKEytwfQx/rTDC6mKsJ9+A7LSlgkB
 j/3CP8BLhjaOso/GmXhO1zQI1UojvEC1AmgZzrvP45s44CgQP89ZTTWWM
 gr9Z11mwyCKfH4yWvHSe9jHpFU4WJQa6kPIMTga0KImve+2mMoY1Ar7BN
 aaXbdAyRTHJT3snk1XKwI0f40UAN5Bccy8Z2jY+jLrpWkZQ2+jNxqi1fR
 rGvL+2qSatthGlmh461Vby09piOejplokOllWc/Vq5snmjNqISda6pNyD Q==;
X-CSE-ConnectionGUID: ZpJuvr+VTjGKJeTHhhe0Bg==
X-CSE-MsgGUID: /WU9BLNAQmWOtRbL6J9s1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43957022"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="43957022"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 10:08:17 -0800
X-CSE-ConnectionGUID: PvRIHBB2RuqxOjl8+T7U7g==
X-CSE-MsgGUID: 0pXl6c7UQjS+Tl/3m5KmEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="124021970"
Received: from dut4066lnl.fm.intel.com ([10.105.8.51])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 10:08:18 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v8 0/4] test/intel/xe_sysfs: Restore sysfs params correctly
Date: Mon,  2 Dec 2024 18:08:12 +0000
Message-ID: <20241202180816.47538-1-jonathan.cavitt@intel.com>
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

The xe_sysfs_timeslice_duration, xe_sysfs_preempt_timeout, and
xe_sysfs_scheduler tests do not correctly restore modified sysfs params on
test failure.
Additionally, xe_sysfs_timeslice_duration modifies but does not restore
preempt_timeout_us.
Finally, while xe_sysfs_scheduler does attempt to restore all modified
sysfs params at the end of the tests, no guarantee is made that the
restorations are successful.
Repair these issues.

v3: Fix several formatting issues (Kamil)

v4: Do not compare possibly unassigned variable (Kamil)
    Whitespace and commit name fixes (Kamil)

v5: Add new helper funciton, igt_sysfs_get_next_engine
    Fix igt_sysfs_scanf/printf usage in tests (Kamil)

v6: Replace helper function igt_sysfs_get_next_engine with new helper
    functions that return and destroy engine lists (Kamil)

v7: Also fix xe_sysfs_scheduler

v8: Update igt_sysfs_get_engine_list to no longer require reporting
    size (Kamil)
    Remove assertion for some sysfs writes to succeed, as we only
    require that the end result is correct.

Jonathan Cavitt (4):
  lib/igt_sysfs: Add engine list helpers
  tests/intel/xe_sysfs*: Restore values on test failure
  tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout
  tests/intel/xe_sysfs_scheduler: Assert sysfs params are restored

 lib/igt_sysfs.c                           | 60 ++++++++++++++++
 lib/igt_sysfs.h                           |  3 +
 tests/intel/xe_sysfs_preempt_timeout.c    | 64 ++++++++++++++---
 tests/intel/xe_sysfs_scheduler.c          | 88 ++++++++++++++++++++---
 tests/intel/xe_sysfs_timeslice_duration.c | 79 +++++++++++++++++---
 5 files changed, 264 insertions(+), 30 deletions(-)

-- 
2.43.0

