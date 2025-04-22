Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8ABC369CB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 06:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA86710E505;
	Tue, 22 Apr 2025 06:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDFOAo+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8514C10E505
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 06:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745303796; x=1776839796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kP63SCKaneqzgJe2n4apZdUb1AkAuRIZ0qCxC8XxZeY=;
 b=WDFOAo+ERCDRbsqd+TrVRJFrQAtP80RbDwREgFueYdPKlXK87udkFLW1
 wC8daUJb8MLwkFxCXLhMBY1uamWphHrxvOoIQRsfdtDiL3atIvXdv14Ly
 GyRdDqITYfZ1+6m4KK13EJ3FeKWFMngFPYVaRLFNouF2bn0JvGfDnxmSq
 r41ILc3aAQcDPNnGjC50RnrLl/jjLqV7nH+tE4fDZcsqvbsuBJbuSlNfE
 fJaXPJrNvcTmFS8+1y5YtVhOgmL2fTa8TndgVnJ4laej9qoPKgLlilEA4
 YkIQGwkYqTk7oSSG5N+xSe0gDHqB2V1GqBTGJ3QVLPVHb8Sx2Grhbsvvj w==;
X-CSE-ConnectionGUID: HGfGwUOUQEu3XELL2uTneA==
X-CSE-MsgGUID: rWI+YuF0Q6iTFN2PRf7mNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46978639"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46978639"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 23:36:36 -0700
X-CSE-ConnectionGUID: kAuLQLuBS/2jhZuOddNIMQ==
X-CSE-MsgGUID: JMKbMtQaQMqULTdX8NAp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="137012831"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 23:36:34 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t 0/2] tests/i915/pm_rc6_residency: Use sysfs to achieve peak
 frequency
Date: Tue, 22 Apr 2025 12:01:33 +0530
Message-Id: <20250422063135.2502377-1-sk.anirban@intel.com>
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

v5:
 - Limit the power consumption test to GT0 only

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 141 ++++++++++++++++++--------
 2 files changed, 97 insertions(+), 45 deletions(-)

-- 
2.34.1

