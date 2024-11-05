Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DDDD36136
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 20:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B105A10E424;
	Tue,  5 Nov 2024 20:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbA6zseG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3849510E424
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730837504; x=1762373504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z784s8W+KHrVR6+xg1X7wnDPUhKjHuiQXfXINZUZG30=;
 b=mbA6zseGe6ebXkBEYLgiZTIo5A5wZ8fQh6uHWIbnrJBjiqEzKOkBBU5l
 sKlOhiZ1IW2w9aYhQ/NbkiE9+0N+XrH7tAWL2uhBd+NeUHcpe2aVi2wQX
 UxZA6JeaHM0WadV73q9tgbNr+zDnoGKtZY0+RExYnTM2y+e5CNdVAQIel
 mHC09d2OnCIemmd1o0xsmM+5weS/9ssI6B1t8VTUQyLuX7oZgbDqjVUXH
 fTA+93HpgmmTcE6VTucppeGfFsxtE6Tys9V5+tHIGGH3dqkvVHNiiv5Kv
 GjjSIJMNxUrHOqCN8MmS5AJe6Xn47BHsG8IqhBbb+gxDfH7IHwd0qnnod w==;
X-CSE-ConnectionGUID: /1ZWM0Y1R+CplC03+ccFNA==
X-CSE-MsgGUID: oR8INijjSD6ML4bee0R5Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34537515"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="34537515"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:11:44 -0800
X-CSE-ConnectionGUID: xodlipU0SLCS8d0tLmqfeg==
X-CSE-MsgGUID: pVsRLKvURjyK1C/1N2Jfsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88108723"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:11:44 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v4 0/2] test/intel/xe_sysfs: Restore sysfs params correctly
Date: Tue,  5 Nov 2024 20:11:41 +0000
Message-ID: <20241105201143.159491-1-jonathan.cavitt@intel.com>
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

The xe_sysfs_timeslice_duration and xe_sysfs_preempt_timeout tests do
not correctly restore modified sysfs params on test failure.
Additionally, xe_sysfs_timeslice_duration modifies but does not restore
preempt_timeout_us.  Repair these issues.

v3: Fix several formatting issues (Kamil)

v4: Do not compare possibly unassigned variable (Kamil)
    Whitespace and commit name fixes (Kamil)

Jonathan Cavitt (2):
  tests/intel/xe_sysfs*: Restore values on test failure
  tests/intel/xe_sysfs_timeslice_duration: Restore preempt timeout

 tests/intel/xe_sysfs_preempt_timeout.c    | 44 +++++++++++++----
 tests/intel/xe_sysfs_timeslice_duration.c | 58 +++++++++++++++++++----
 2 files changed, 82 insertions(+), 20 deletions(-)

-- 
2.43.0

