Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4818C369A2
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 06:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEE410E35F;
	Thu, 10 Apr 2025 06:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afZoYN/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E54510E35F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744266573; x=1775802573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N5UAKyjVnglQKCUKUSAMzyIFKRKz54JIQ+oPQ2Axlzk=;
 b=afZoYN/ilkcRNPyzZmdAfseOStgpgoEhAwngtSC5Tpc1wkozo92qp9Qa
 nTX3ecOpcBi2SISaYC+XFyNzFaJSNRAIVWGUgCQwvWespNhrkbyB49o0V
 SnUCAYyxSOiiRrFs0ONyJEmsOYKViO5rerC4lD2ivhGj8xSXtM00nE0E4
 smNiXmdSi7pfxp4VC9MasXQK2fZEY31pQUrqa0r9iurTOSe6BYN58sJ+x
 E4axmVpKCM8YqiDh59CFFO2dMyniCD2cRYJ2FhLittAvfqu8wZNTO1B7M
 aP03gPGFffxP1MIzVv2j3jUGSWdwtmDnKhEpEcpm/FM60exnAHeLO9+J5 A==;
X-CSE-ConnectionGUID: Yc5A8lwcSmqv61lRVzdDVQ==
X-CSE-MsgGUID: 0DTkuKXsRAykvWRiLOTdQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57136975"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57136975"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 23:29:32 -0700
X-CSE-ConnectionGUID: hrefNvoWTPmcYXAGupigSQ==
X-CSE-MsgGUID: CdCQmog+SmqxEiBZcKtABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="166018574"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 23:29:30 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,0/2] tests/i915/pm_rc6_residency: Use sysfs to achieve peak
Date: Thu, 10 Apr 2025 11:55:20 +0530
Message-Id: <20250410062522.715836-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Leverage IGT spinner to trigger frequency scaling and
set RPS minimum frequency to RP0 for achieving peak frequency.
This method replaces the existing waitboost mechanism used
to reach maximum frequency.

v2:
 - Disable power consumption check for dgfx

v3:
 - Implement igt exit handler

v4:
 - Cosmetic changes (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 134 +++++++++++++++++---------
 2 files changed, 90 insertions(+), 45 deletions(-)

-- 
2.34.1

