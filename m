Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE865CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 12:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9B10E077;
	Thu,  6 Nov 2025 12:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gd3bC8tT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7D10E141
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762432253; x=1793968253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=15V23DTsYfLqGNINHkJzVVKWvg7QC5DRT98nj8aPiCw=;
 b=gd3bC8tTCDp7sZl6u0izbKCR/r3wArkkbFplIvgYg0OeHP5tWtOSuTt7
 EgLUaG0Xseid8s7y4Qei0QUv4/YomM9wdAsQxB7KBUKdzMM1sm20MTWpB
 jNjdadzHPrsTsdsFzMIytX3ea/hdZqVI5TdlyyreSBo6c4sALW7N6ovsq
 Old4cWVk0g6ay/iHeoTGZdkFPET4rIW2y215MTXeXZWL6lnp5jbxb+3lk
 l44LPPQBUGj7JV+IbkpFBK2NGhMAnFKZJdYFtXTdeS+CCfa7Ioq/CW7i5
 RzEi07WihrpF7D0S94exhu1ns7Ak+Z+2al7rJ3pLKlv+aYyh3d58f/i3g g==;
X-CSE-ConnectionGUID: 8nzR+6UQSyWlysDbuyRCuA==
X-CSE-MsgGUID: COnArZFDTViF9qINw8MxtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63577920"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="63577920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:30:53 -0800
X-CSE-ConnectionGUID: Q5AdIoq7Q3ONA63J70WXeg==
X-CSE-MsgGUID: Nx0YlMhCQ5azrruRHf2OhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188464678"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:30:51 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel-ci/xe: Drop xe_survivability from fast feedback
Date: Thu,  6 Nov 2025 17:55:57 +0530
Message-ID: <20251106122556.2307208-2-sk.anirban@intel.com>
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

Remove xe_survivability tests from xe-fast-feedback.testlist.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5f27baafb..017e3ba2a 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -185,8 +185,6 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
 igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
 igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
-igt@xe_survivability@i2c-functionality
-igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0

