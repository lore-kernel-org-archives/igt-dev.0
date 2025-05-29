Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B614BC5AD49
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 09:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D62610E113;
	Thu, 29 May 2025 09:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bx4M7tgZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE0210E113
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748510176; x=1780046176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=efxQP/BX/DtW6G7VCCTl8T1a4E2nPZGZnsufY1zp8cA=;
 b=Bx4M7tgZ2wjXjwnqKQsWsHGW5hbI4pjXzIZNgi4xR2RXdupOEGVKHmWx
 iTYMGho6CL4PSxHJYzNOKs3HrXPKt1UxdUr5Pe9FjICetY0pYL1PRjxOE
 oRE6XWvvA/HLeQosRrEHhJInZpODu1Bj3fGgVEPy1X3rC3sCKhYJMOqMk
 p22d7JGMH25FieIbtPQlevpFOKIW1NeyWtmLm0U/CKChLD59OoKpe1xoL
 rsPhZZywRenG83/3HjXDR65lhiG2U2LN4hpgWdZbzZH/v3ydOBw09vTn/
 Ygmjg0Moa1/rQHq9YOwTNJ37NWDmoDt5S3v7Vzl9VjLHZrsZ4DIhsSZ2N g==;
X-CSE-ConnectionGUID: KGfnRzlYSiuRyqffCnKtfg==
X-CSE-MsgGUID: f1We8O+yRR2Z+G8BbtD0HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54360203"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="54360203"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 02:16:15 -0700
X-CSE-ConnectionGUID: XX8KlCV/TEefm9LHcYjhVA==
X-CSE-MsgGUID: mPYXkugSQt6HkRU73VPAHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="143974140"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 02:16:13 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v7,
 0/2] tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
Date: Thu, 29 May 2025 14:38:39 +0530
Message-Id: <20250529090841.4177513-1-sk.anirban@intel.com>
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

Leverage IGT spinner to trigger frequency scaling and
set RPS minimum frequency to RP0 for achieving peak frequency.
This method replaces the existing waitboost mechanism used
to reach maximum frequency.

v4:
 - Cosmetic changes (Riana)

v5:
 - Limit the power consumption test to GT0 only

v6:
 - Fix frequency restoration (Riana)

v7:
 - Fix variable scope (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 125 ++++++++++++++++++--------
 2 files changed, 87 insertions(+), 39 deletions(-)

-- 
2.34.1

