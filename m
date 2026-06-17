Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08456CD98F0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 08:36:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F910EEBC;
	Wed, 17 Jun 2026 08:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXiMUFe7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1A010EEBC
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 08:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781685353; x=1813221353;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yrMm9JHVZEWV//DgpWsT9XmSpPKoClxGb2cfsaislA0=;
 b=WXiMUFe7FX7bdyiUt5os1o0tVVqn+ExI6YhjAO7Rd6uDVEJa47Lsj6qY
 NQhK8IbA+Fij6evP4gBrOxF1BfJcUREP5NprwqQ33wBAGDg/h4GENqYQx
 yJjcnmzEi9cPdFhMk6Sw36BNulAKFkD8hMZw6oqBmBr/wCpdLgjT0jew9
 DfwwQZBVQMc6U6ehitzZ8YXuPWV6y3GNp8VekmIwGvSCqrj1GkxGz37mR
 0+NL/7b/DFmR6TmzOXyh4R3c0LTglHYIVOMQypv1rEPMD2bR9QngdrvO5
 GY2hqMQlwjTPv84gbsoeUNp1QeWRDLTcmIVYtJKPGVQXehrWngulmz9Bl Q==;
X-CSE-ConnectionGUID: cygr2hq3QLOXv9+NzXtXtw==
X-CSE-MsgGUID: taXVE1t4R7qK9AYEqVJH3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="85030543"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="85030543"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 01:35:52 -0700
X-CSE-ConnectionGUID: dxDFt2H7Sp6lL7+FZe+gfQ==
X-CSE-MsgGUID: 7EEPgU/ESh+uDsRwLfKi7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="272069441"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2026 01:35:51 -0700
From: priyanka.dandamudi@intel.com
To: ramadevi.gandi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/2] Rename MultiQ to Multi-Queue in docs
Date: Wed, 17 Jun 2026 14:05:50 +0530
Message-ID: <20260617083549.1347431-4-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Update MultiQ to Multi-Queue in docs of xe_exec_multi_queue test.
Add Multi-Queue Mega feature and sub-category for the other multi queue
tests in documentation.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (2):
  tests/intel/xe_exec_multi_queue: Rename MultiQ to Multi-Queue in docs
  tests/intel/xe*.c: Add documentation to multi-queue tests and
    subtests.

 tests/intel/xe_evict.c            | 72 +++++++++++++++++++++------
 tests/intel/xe_exec_fault_mode.c  | 81 +++++++++++++++++++++----------
 tests/intel/xe_exec_multi_queue.c |  4 +-
 tests/intel/xe_exec_reset.c       | 28 +++++++++++
 tests/intel/xe_exec_threads.c     | 44 ++++++++++-------
 5 files changed, 169 insertions(+), 60 deletions(-)

-- 
2.43.0

