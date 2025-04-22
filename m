Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C625C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 19:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FC810E618;
	Tue, 22 Apr 2025 19:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBrWdCsh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA93010E3A3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745350512; x=1776886512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v1252W16TkD3wS+8u3QbF6qs3QxnqVWD6Yymgxqn1Ko=;
 b=fBrWdCshFrJnjWptY8ol5Wir6XjSQAQwgv/31b8Olw22znhOhEtwAhqq
 Jhuu4JvYbdzOcmKJ7yb7EyYUXuRoWrnrTDewRoLaZ5/iw2vIMJSGmxkI3
 s2FvSMd+9GNGTLQv9zGWW2MxGA6PtzfhySDOvQe9WDpTXV+bdKwhIdAtT
 zYZaFPHhpXmvSxFqEXi18TilkK1DgexOk49SGhpOW27sYe+jxz9akEoaL
 iAgl1OutZ/DHKQdfxoFXr6xIe9/IyMsgX7xSpUmuuXKP4dAiICBH2elac
 Tu/JtdJMpd/1eRu1ZGVxu8xF5o0OeByn0A5dnk31c885TUv+qS1E4eWgF w==;
X-CSE-ConnectionGUID: G03ATvOPRpaTkA4jX2pxvg==
X-CSE-MsgGUID: uKcN81paT0mBPQ4X3vQ7pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57584545"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="57584545"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:12 -0700
X-CSE-ConnectionGUID: j32ql1hLQ6G0AdMkgBpXNA==
X-CSE-MsgGUID: gNPKAiyfRxmNzkHZQQetnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136892143"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:35:12 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 0/6] Sanity check Xe2 PEC OA reports
Date: Tue, 22 Apr 2025 12:34:52 -0700
Message-ID: <20250422193458.1467567-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (6):
  tests/intel/xe_oa: Rename check_reports to mmap_check_reports
  tests/intel/xe_oa: Fix oa_tick_delta
  tests/intel/xe_oa: Sanity check PEC report data for TestOa metric set
  tests/intel/xe_oa: Only sanity check timer PEC reports
  tests/intel/xe_oa: Reduce test_non_zero_reason execution time
  tests/intel/xe_oa: Drop pec_sanity_check_one

 tests/intel/xe_oa.c | 125 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 117 insertions(+), 8 deletions(-)

-- 
2.48.1

