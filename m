Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6BEF55810
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D33910E50E;
	Mon, 20 Apr 2026 11:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOvhLFKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008BF10E53A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776685023; x=1808221023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JuDNKmHmfix2PSS4Noo74SJBUFdGhHluknbpdmZEAOA=;
 b=WOvhLFKRLNt7iVlDY4pOp5vDnq+2gnN5fT2QbGODLlFdf7m5jDlu6I6V
 xxOQT9zZsis8AuzKJn8EXSwf8mCG4/wSYmM5J2j8+DjgyYQjejbai0frX
 uMF7z+Z53MCsjw4AmAPY5hwWS3UxOXO+3FRsiWdUxJpfilEDlzgDrbf0P
 p5RPr+h8ew72Q5uMhv2xGqb3pJBBhDwiG60R0ezZ4D3402gpNH9QHE7EY
 lbMFeHWe+dY2/p8TZYacXIWMTMPzAa5km0aOK7aeWAe87eNDmWUV0iNHo
 BvhGdSFK6MGVuIAfZhgkzRc6MoxN6i7awW5YCB3FjzamJVAbUxmORi9Go g==;
X-CSE-ConnectionGUID: OViSMY/uRteGwQGMJE+lOg==
X-CSE-MsgGUID: GFvNjqj1RImC+hcyQnKLFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89064531"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89064531"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:37:02 -0700
X-CSE-ConnectionGUID: R1Qc/uIVS6utKP23LIRXFw==
X-CSE-MsgGUID: /5tnCRr0TrukV4/sHwQZyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228550950"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 04:37:00 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, jani.nikula@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 0/6] Remove deep-pkgc subtest
Date: Mon, 20 Apr 2026 16:58:20 +0530
Message-ID: <20260420112826.35220-1-mohammed.thasleem@intel.com>
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

Remove the deep-pkgc subtest as it depends on other display IPs which makes
testing unreliable. Current validation uses Package C-state counters that
are affected by unrelated system components and requires platform-specific
checks that vary across different platforms.
A redesigned test with proper display IP isolation will be implemented
in a future patch.

Mohammed Thasleem (6):
  Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
    test"
  Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
  Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
  Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
    check"
  Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
    calculation"
  Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
    sleep state during extended vblank"

 tests/intel/kms_pm_dc.c | 98 -----------------------------------------
 1 file changed, 98 deletions(-)

-- 
2.43.0

