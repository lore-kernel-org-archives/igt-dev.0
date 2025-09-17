Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC62CAC598
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 03:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3767510E405;
	Wed, 17 Sep 2025 03:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrSW+IOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E5C10E405
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 03:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080303; x=1789616303;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0EPjV0odNWmTT5sZsKbd1PpxUR3Mj/0j6w6XjFRS95k=;
 b=GrSW+IOqezzh4Ur9N6j+VYJQoUrzmW92kP3jpjIU7uAVOglqHNG2RbWK
 EeS21aDg+DZBhGEZBYlV5RT7xTour78Ze9X/QKNgZ3fAiWx/QZ9nOcn2C
 2ekouVbkWkYFUYsVYfONihoiiDLwgvi/2+Oqzcq7MuTww2C3ZpwjM2Ly+
 UXAlSq0Tyuv9o+AH/cZzYwqOuym1ZX8e4y8DmclyLsleqfbTXNr9d4WLB
 B25jgP3hwYYJ0BdWE/d8fwXnAw35ZPHcqnHpgNvaJruE9vicDIea4Mqnj
 KjN/MyKP2snDjWPV82o7oMAb0mYeq1vWHRG4xsWIqZZkjvk4sLdWqrwfG g==;
X-CSE-ConnectionGUID: o6VGU9uMSquGiYbpEZuwdA==
X-CSE-MsgGUID: 2Z71mNa2QX6YN1XYmZNX5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060315"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060315"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:38:22 -0700
X-CSE-ConnectionGUID: mllqxVsvQL2JgunTiRdyww==
X-CSE-MsgGUID: weNYGp3QQDajDOOanH0yvg==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:38:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 0/3] Add tests to help verify VF migration
Date: Tue, 16 Sep 2025 20:38:15 -0700
Message-Id: <20250917033818.3977464-1-matthew.brost@intel.com>
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

These are proving helpful to find VF migration issues.

Matt

Matthew Brost (3):
  tests/intel/xe_exec_reset: Add job cancel tests
  tests/intel/xe_exec_reset: Add timeslice preempt test
  tests/intel/xe_exec_reset: Long spin tests

 lib/xe/xe_legacy.c          |  56 ++++++++-
 tests/intel/xe_exec_reset.c | 225 +++++++++++++++++++++++++++++++++++-
 2 files changed, 273 insertions(+), 8 deletions(-)

-- 
2.34.1

