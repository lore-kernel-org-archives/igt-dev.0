Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F4AF8DFEA
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A7010E992;
	Fri, 17 Apr 2026 08:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhWnd+lL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B486010E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776415427; x=1807951427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GVxKmaRaMmcUvxYSfUYqBqz/x9sFIjUXLlii7v7LRQs=;
 b=AhWnd+lLcoTOoqUPGDUBTTKrBg2w04GrzJ92OuxQhyKjRM+0WnSI+GwT
 Erwp94huprgysqgAAWFHp5gGi0KnvhXmrf2Ecu/ARWo/VADSEOpYxhUl1
 0lkp+HeaAurEavFtKNBEH/N3+z1I2BIlk31HWWt/YPViEpuEyfu2VvBto
 fA66M0ZBTpZ83SocBgx2jpwhnQ1p4KcSyW4gRBvi9j13dKZatfTADQuXo
 Ol7nf2HkO6dYHnjwoUJ3tMx+c1BJRD6pNBFDv4QV3/t9PC7r51JqU6jdM
 QZQ4bzWLm0DxPJJ52I9Un+8SXqNHFIEu463A1GztdquheceKJC2bSvFnn Q==;
X-CSE-ConnectionGUID: o2IsYxbXRT6A66FBdxDWWQ==
X-CSE-MsgGUID: 9rpNALBJTG2LZ9paq935uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81308429"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="81308429"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:43:46 -0700
X-CSE-ConnectionGUID: rHLUKsg/Rz63lcJuUFTmPg==
X-CSE-MsgGUID: lqH72L9YTv+7BsIBKk128A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235361706"
Received: from unknown (HELO linux-Meteor-Lake-Client-Platform.iind.intel.com)
 ([10.223.55.75])
 by orviesa004.jf.intel.com with ESMTP; 17 Apr 2026 01:43:45 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 0/7] Remove deep-pkgc subtest
Date: Fri, 17 Apr 2026 14:04:59 +0530
Message-ID: <20260417083506.33404-1-mohammed.thasleem@intel.com>
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

Mohammed Thasleem (7):
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
  tests/intel/kms_pm_dc: Remove unused pkgc functions

 tests/intel/kms_pm_dc.c | 98 -----------------------------------------
 1 file changed, 98 deletions(-)

-- 
2.43.0

