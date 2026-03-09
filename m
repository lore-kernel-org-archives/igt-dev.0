Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30A9FC9EDF
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 06:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998DD10E0ED;
	Mon,  9 Mar 2026 06:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjyE7eX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB93C10E0ED
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773036506; x=1804572506;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0kfpIrCC0kMWR4MZ2ysBh6Znh+QA6kdKTQFpqV1mOU0=;
 b=mjyE7eX0yqD0t4shE3W8dDGh9SOgGk9joZsG7wc0pnc7UKNSF9HPEVFH
 2mQTIFaDCaLBpPDe2FmIYk7SPd4eg3LyM2frNgtPNq6zR6PB7+nSgMOFu
 nQooSgbZep7JBfZHCpGCvpcOrNv+C3gr6+zIVZau2kMFwD5oOqOfFQlEE
 VQjp4pRAbjoCVI+DZtEkYOJhyd3Qd2yBDgCHObJqhzAcJv/wiwxK2ybIL
 VG1srsPOwaIQ9h6pe5/3c5IwbWvFtPXp8XCarqMMTcFc1z92webpBL9Ax
 q4aM/QJ8YXxJGXIA96utY/uM0p6TVhWQeWIvyTGV9J22MW8pOCvAne/fo w==;
X-CSE-ConnectionGUID: A2K3jAHWR72tFZ7znBTOhQ==
X-CSE-MsgGUID: Txb1xmDESS2jT5XhxswhAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77653528"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77653528"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 23:08:26 -0700
X-CSE-ConnectionGUID: lCYYKXWRTnOkrV99H6ewpw==
X-CSE-MsgGUID: qYO9ypJ0SYGGJmkzR2z3ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217273016"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2026 23:08:24 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 0/3] Implementation of Negative tests for VM_BIND Decomp
Date: Mon,  9 Mar 2026 11:38:58 +0530
Message-ID: <20260309060901.642399-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND Decompression.

Patch 1 introduces temporary helpers and UAPI definitions required
for the tests while the corresponding positive test series is still
under review.

Patch 2 adds resource management structures and helper utilities
used by the VM_BIND Decomp Negative tests.

Patch 3 implements the actual negative tests covering invalid uapi parameters and
ccs corruption scenarios.

Smitha Balasubramanyam (3):
  igt/xe: Add temporary helpers for VM_Bind neg test
  tests/intel : Add data structs & helper utilities for VM_Bind Neg
    tests
  tests/intel : Add Neg tests for VM_Bind Decomp

 include/drm-uapi/xe_drm.h |    1 +
 tests/intel/xe_ccs.c      | 1395 +++++++++++++++++++++++++++++++++----
 2 files changed, 1275 insertions(+), 121 deletions(-)

-- 
2.43.0

