Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE54E77172
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 22:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAA310ED64;
	Wed,  4 Dec 2024 22:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqVzwCS0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7DF10E5AE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 22:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733351029; x=1764887029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yx7fsDu/5SycXWKP88yWiL5RNc85yd8OUn4niDygIY0=;
 b=OqVzwCS00ctc6JJun+H3RhW9xllE2b3ZtRiGg0LtieskMMdaDQ368x5z
 VZya+RmebnBTZpjVOvdiFMJVOQHxRtys7h0KjBDpWyt6BvEfhDkBuuFog
 mpuJYoLKyZwn2GNUHlMqzcsy1R5zty/KRBJilZKoAbf613zUWgsfahDvJ
 AtUpBlROMuVCouFvbfJI1c8fuxd0eWi9V48bEG75xBMaGPCGWPZaSOZKV
 pxvKhVQoHbjESbI2l8ek8Qy2Tgd/g5+hERjXgUudY3PRCi+u0mt7ryl0c
 HeMLijAXIGa0Y2rSA3F+FebKalVYCFCmWkLS56DNHxx/RbfkZcyq13+sZ g==;
X-CSE-ConnectionGUID: 1sFV50OTTE+pGrhLjKFozg==
X-CSE-MsgGUID: c0vWizNUQIKbk9QFrRFA4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37415822"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="37415822"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:23:48 -0800
X-CSE-ConnectionGUID: GjLcDPuET22yw+aCmStLhw==
X-CSE-MsgGUID: jFO+O+nzTqyw1tf80nx4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="94084687"
Received: from dut4066lnl.fm.intel.com ([10.105.8.83])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:23:48 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v10 0/4] test/intel/xe_sysfs: Restore sysfs params correctly
Date: Wed,  4 Dec 2024 22:23:43 +0000
Message-ID: <20241204222347.108788-1-jonathan.cavitt@intel.com>
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

v9: Store engine lists (Kamil)

v10: Minor formatting fix

Jonathan Cavitt (4):
  lib/igt_sysfs: Add engine list helpers
  tests/intel/xe_sysfs*: Restore values on test failure
  tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout
  tests/intel/xe_sysfs_scheduler: Assert sysfs params are restored

 lib/igt_sysfs.c                           | 61 ++++++++++++++++
 lib/igt_sysfs.h                           |  3 +
 tests/intel/xe_sysfs_preempt_timeout.c    | 65 ++++++++++++++---
 tests/intel/xe_sysfs_scheduler.c          | 89 ++++++++++++++++++++---
 tests/intel/xe_sysfs_timeslice_duration.c | 81 ++++++++++++++++++---
 5 files changed, 269 insertions(+), 30 deletions(-)

-- 
2.43.0

