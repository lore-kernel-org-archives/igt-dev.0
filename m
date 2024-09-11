Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4AEE0209
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:50:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADA910E963;
	Wed, 11 Sep 2024 05:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7gHsVII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507E210E963
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033820; x=1757569820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RQnYY1mzooKW6Rj1LJjNX6ppKGYsnWGpm/JUb+DmANA=;
 b=Y7gHsVIIPPDZiZv5WG/1gLS8ACydDl14YmMJ/bDAu57tYJvJpErrWPA4
 lGrglrXOT+f00O/WaCnTDtdOWoSfcAkeCT3FZxRddvSEcOnvp3H+DLuPs
 vlF56Gogsr7sVwJTgiqkHivhr1J2aZtUfnxIdewqixu7uP45iksyfDDSk
 TXWa88IYB654pqopTFzeM5CeRfNFfcs0Kku95j878WnUmfLEO3IAkFdWI
 EEpkJ6KUSWnf1ZsLxqERl/LK0ryyrzvFpAIP2ZVJ9XpMMo6vw8kPnekDF
 rQRROc1LZv/PzKCmq/m4BmMNFty867CvNB3BeFJUuIKeQ3ZmOL0VyBBhx g==;
X-CSE-ConnectionGUID: mwpO9ZuSRbGmWpw1rtW6eA==
X-CSE-MsgGUID: KOEPGfP9SiCUe4RMGjV+vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25009352"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="25009352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:20 -0700
X-CSE-ConnectionGUID: LlBaewCuTtOCH1KkL2WSnQ==
X-CSE-MsgGUID: lFxfoO+eQt6joSIhNuOTuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67540656"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 jhogande-mobl1..) ([10.245.244.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:19 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 0/5] PSR testing improvement by checking sink status
Date: Wed, 11 Sep 2024 08:49:53 +0300
Message-Id: <20240911054958.1023925-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are not checking panel status in our PSR testcases. This
might lead to situation where panel is not even aware of PSR being
used. Also possible errors detected by a sink are ignored by our
testcase. This patch set is trying to address this.

v2: split kms_fbt and kms_pm_dc to separate patches

Jouni Högander (5):
  lib/igt_psr: Add mechanism to check sink status as well
  tests/intel/kms_psr*: Add psr_sink_error_check to PSR tests
  tests/intel/kms_fbt: Add psr_sink_error_check to PSR tests
  test/intel/kms_pm_dc: Add psr_sink_error_check to PSR tests
  tests/intel/kms_dirtyfb: Check features after rendering

 lib/igt_psr.c                          | 52 +++++++++++++++++++++++++-
 lib/igt_psr.h                          |  1 +
 tests/intel/kms_dirtyfb.c              | 33 +++++++++++++++-
 tests/intel/kms_frontbuffer_tracking.c |  5 ++-
 tests/intel/kms_pm_dc.c                |  2 +
 tests/intel/kms_psr.c                  |  2 +
 tests/intel/kms_psr2_sf.c              |  2 +
 tests/intel/kms_psr2_su.c              |  2 +
 tests/intel/kms_psr_stress_test.c      |  1 +
 9 files changed, 95 insertions(+), 5 deletions(-)

-- 
2.34.1

