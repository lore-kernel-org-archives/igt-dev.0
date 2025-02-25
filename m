Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D26C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 18:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBAE10E725;
	Tue, 25 Feb 2025 18:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5hyaMlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B92910E725
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 18:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740507041; x=1772043041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0TonV8TEd/2HA5hlbkAd2gT1sfkMl3HdEcKUyWD5n9c=;
 b=i5hyaMlvc3tElN4R9n5qulizpALGp+LJVIYNWZSqB2ltC7W3BsML0XBB
 /ZIQxi8iy8zy3vxYmF0MWdsYXePOt5mNDTIHReQ3N2IB1ud5N7jDzBKzB
 eRLaYNGXnWRujjeP/nuqGOmcwyTlH7IxZtDFKSF0OO7mGhtCdtIYr9qjz
 cZnBRGDh2R54oK0e3dvdoHAaZfUR2Scxi6GnFyBYDHIATSVyTjQ+nFbIy
 JiT3P14dCnZ1hgvuCs7JCtHVD/4YNt7nrg/UzYG/gOfFEOK04E9/+QZ1V
 vTb9OI5XhzXKlQYPVn0D0O5T35AEx8OQQUcgBU+G8YW7TVB95XQmlrZmn g==;
X-CSE-ConnectionGUID: WfHMQOiARQ6znCyBP/gjww==
X-CSE-MsgGUID: cWHFCoiRRfOsagjYddstow==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="44151794"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="44151794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:10:41 -0800
X-CSE-ConnectionGUID: faI2vr9GRyKzD+QkmAjXyA==
X-CSE-MsgGUID: 67DJumTpTIGTvmL5gKalHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116477452"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 10:10:38 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, chris.p.wilson@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 0/2] tests/i915/pm_rc6_residency: Replace waitboost with
Date: Tue, 25 Feb 2025 23:39:28 +0530
Message-Id: <20250225180930.1966111-1-sk.anirban@intel.com>
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
  tests/i915/pm_rc6_residency: Replace waitboost with igt spinner and
    sysfs to achieve peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 111 +++++++++++++++++---------
 2 files changed, 73 insertions(+), 39 deletions(-)

-- 
2.34.1

