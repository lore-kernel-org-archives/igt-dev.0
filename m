Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D4C28B24
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 19:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C47F10E1B9;
	Thu,  6 Mar 2025 19:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8KDpsFs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D1310E8D1
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741287688; x=1772823688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pH9/rKWbGs7z1pbqLPdhLTwmuyCHqgOE9lEz55NHD44=;
 b=F8KDpsFs11Fu6kUm7qxR4QSDfzm1P1lcEQXuMSa5MDhxjYppcQ0bgWda
 OcVNBHAtpby3qMQso8F213jwxADqhFvUCq6ZGMyoJ3odY1Cs1qcTlzccr
 PzqkVlydQPs06XwBEGKeSWDI9y+N3FGDGFBnWtf2mwnKnwKI4+Ym5T1cR
 P4uVeewEM80JbsarnVfw/1iPOc/UR3jbH3plA/EMLAUXAizIlVnjlpVkF
 19ogL+Px6QcfJ5OlTKjt/MIIitfg+6DhFk0Pi2kFhMc2xQWbNkxBVVNqp
 2mMxtmUIx/L1HkeJeBMEz7XJ2I419xHUiExoQmdzxByHUqG19vR7W+wKw w==;
X-CSE-ConnectionGUID: gfCNPd0KRn+eVb8FxIPUFw==
X-CSE-MsgGUID: ibozfdrRSZaHGXiCM1foYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52959760"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="52959760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:01:26 -0800
X-CSE-ConnectionGUID: K5RW2XyMQgGXs0HKXqdalg==
X-CSE-MsgGUID: JMfzKwWkTBGhusfuBziidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120025503"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:01:24 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sk.anirban@intel.com
Subject: [i-g-t,v3,0/2] tests/i915/pm_rc6_residency: Replace waitboost with
Date: Fri,  7 Mar 2025 00:29:42 +0530
Message-Id: <20250306185944.2581304-1-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 127 ++++++++++++++++++--------
 2 files changed, 89 insertions(+), 39 deletions(-)

-- 
2.34.1

