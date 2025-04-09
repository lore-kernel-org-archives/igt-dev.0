Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B74C369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 14:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A589E10E919;
	Wed,  9 Apr 2025 14:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYYkaIUH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA5F10E929
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744210511; x=1775746511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jU6c13AhZY1zJGgljk76sJoKXKux/+WU7xkwWSHYV8Y=;
 b=nYYkaIUH2FPCqeG4mBPq7p0fCz55jcK1MjtJiIBhkyJGMMpLgynzJuvv
 fDulGAzuG+CM4PU5RJJcDqwM/4/4z+dgywQg4c+p9HuH9YRyIUeDXqkSf
 8IgcvnNZ9rj55uHq6AB4Ij1c00wkvHgL1VZZCcYHNOx15mS9D7uI6KtNQ
 okUJEq9JiU5CTTAspfrwJa5jrP5tiP+Etf9sNqLv1MNSdYjFa+S75Y+TR
 0kV5q9tfDk9WCs3jlmDW5HCeflmlRBzhzWV2qiA/AflSsD3Z+q20Irubj
 eimRosFZFjcmrUQyh2ZJXDXcZKiQ3gybZegXDFb6sqpS2TzwoLeS6DBCl Q==;
X-CSE-ConnectionGUID: FCQ+jAAiRRmfP/DdYRGhMA==
X-CSE-MsgGUID: dWeAez6XSrGiO3tOnZ7JKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57062045"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="57062045"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 07:55:10 -0700
X-CSE-ConnectionGUID: PRimg3j3RDODjz2uQxSEyA==
X-CSE-MsgGUID: e1Xmi0ElR6WqG4Tj+7L5Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="151785133"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 07:55:07 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v4,0/2] tests/i915/pm_rc6_residency: Replace waitboost with
Date: Wed,  9 Apr 2025 20:21:01 +0530
Message-Id: <20250409145103.456797-1-sk.anirban@intel.com>
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

Sk Anirban (2):
  tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 125 +++++++++++++++++---------
 2 files changed, 86 insertions(+), 40 deletions(-)

-- 
2.34.1

