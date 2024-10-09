Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31B4CEDD89
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 12:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708BE10E6EF;
	Wed,  9 Oct 2024 12:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFRv+SVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED4410E6E7
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 12:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728477134; x=1760013134;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TM9UGRK5yHy/J8I4rb2Rrlji9AekxLRS5ylZJHsD4ps=;
 b=UFRv+SVaY5gaEro+3PGk/2AJx2LWIAOqB4+ndoDg+CHcHLDHcZMUENX1
 2KfuE7xgObTuVvTthx48wOn0bUiOMWhaB44t8QNp1CPzRuvQnHNfnCs8W
 F3zZ1+uALVMaPcBNwdTMbHRlEFkOP68OQLLn0t+2EaNdWJRiQDJFBPohW
 h2AAz00ugoeLtcoJEx0wjesng4bSL+0BHK1UJqOLHoGkbPUKNRdKv8KYy
 HZfEd7DXv59fGiTSUqGHhhvQeezx1beKMeDyMud0GOimjGIwWrjho2QJ9
 c8JrvpYl2aAIGC1uItqkAXtvPK40Gs3+rqfACtYAyagxEmJBtdMSOy+b5 g==;
X-CSE-ConnectionGUID: ffw+6HnlQ9uRZy3a+ZnoHg==
X-CSE-MsgGUID: +nD5haJDRC+otb/gG2jlLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38336508"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="38336508"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:32:14 -0700
X-CSE-ConnectionGUID: 3aevBPE1Rxi1bBAkXaUmLw==
X-CSE-MsgGUID: iYDk19SATEaMSW0axWKQww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="75831904"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fdugast-desk.intel.com) ([10.245.244.97])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:32:12 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/3] xe_fault_injection improvements
Date: Wed,  9 Oct 2024 14:28:46 +0200
Message-ID: <20241009123141.86800-1-francois.dugast@intel.com>
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

Make existing xe_fault_injection tests more robust and do some cleanup to
prepare for new tests.

Francois Dugast (3):
  tests/intel/xe_fault_injection: Use a static list of functions
  lib/igt_sysfs: Add igt_sysfs_{get,set}_s32
  tests/intel/xe_fault_injection: Use igt_sysfs helpers

 lib/igt_sysfs.c                  |  71 +++++++++++
 lib/igt_sysfs.h                  |   5 +
 tests/intel/xe_fault_injection.c | 197 ++++++++++++++++---------------
 3 files changed, 177 insertions(+), 96 deletions(-)

-- 
2.43.0

