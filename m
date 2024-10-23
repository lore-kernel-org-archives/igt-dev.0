Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEA2CDDE66
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 10:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AD210E353;
	Wed, 23 Oct 2024 10:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jL7arBUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1893910E353
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729680746; x=1761216746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GWm7zJK/iwDkKNGujd1BVI02m4dOsTqmO74LnrmYJEA=;
 b=jL7arBUIrX6W2s1n6SM0dqP6zJebU/Yhq1sQVHjqt68Gc4HBq8FI6cPM
 t9iqcgoLP7kOCpj3mbLXvVw5Q71r/lMiW/rqE0fRcuxfYjuwcpooTZlip
 aNR4QxEro5EzLn+u/UkcAS1vko4oCQo8LUbteKn4W8klAK2V/7BPa4Eok
 2wY9ZY6kFEYUzV9bGQSqzycFGY6Kqu7IncLcG2OJnIT5mATr4gmO0CDXa
 3l+fEB/YSX1+fwm3iX+fJAXh6KrNaH+Um1mgfWTm/SAtb+wByJuWquxCQ
 DlxWCQpmigmf6sqwDvFdMqJeccq+9+XLEo4APL5I4chbLk3RpV15n9T23 A==;
X-CSE-ConnectionGUID: PWHWrh3lRye2rjSpO005qA==
X-CSE-MsgGUID: FiHRyf2QQlarBraUXTeWeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39809120"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39809120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 03:52:25 -0700
X-CSE-ConnectionGUID: 5X1VcL31RqGGr+DFxAwoOA==
X-CSE-MsgGUID: 6ryN12rFSDqwAMHZx1Bkpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="79828635"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 03:52:23 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: gsse.core.kmd.power.telemetry.india@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v5,
 0/2] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Wed, 23 Oct 2024 16:16:02 +0530
Message-Id: <20241023104604.2145733-1-sk.anirban@intel.com>
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

Implement test cpg-basic to validate coarse power gating status
after S3 cycle.
Add test cpg-gt-toggle to check if GT coarse power gating is up when
forcewake is acquired and down when released.

v2: Address cosmetic review comments (Riana)
    Fix suspend state (Riana)
    Add exit handler for test cpg-gt-toggle (Riana)

v3: Address cosmetic review comments (Riana)
    Fix commit message & test name (Konieczny)

v4: Address cosmetic review comments (Riana)

v5: Remove unnecessary openings and assertions of gt directories (Riana)

Sk Anirban (2):
  tests/intel/xe_pm_residency: Add GT coarse power gating validation
  HAX: Add Coarse power gating tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 tests/intel/xe_pm_residency.c            | 80 ++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

-- 
2.34.1

