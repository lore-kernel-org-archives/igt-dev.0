Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64652109E54B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 05:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E2C10E8E5;
	Thu, 26 Mar 2026 05:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBzl9rj/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD1E10E8E5
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 05:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774502973; x=1806038973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vvav4lMtJn65Sw657ZbwQfrxkFwAqW8b5GMoKmp+Ptg=;
 b=kBzl9rj/gUVNmAJ8QWQhK33cqQce4kvtxnAsBjM24v3MepE0KaEMuv/l
 mwbA55f+zR0qg5Xb2UwoIzdfMJ+smQdWnGkMDGzq5R6SpJgSHzqbCBv/g
 6fQ4yrwSwMzIgSNSAOVvIi6LdvyaUin9297yeakA9zEFplLgVibfVuHay
 Gb3KdtNCfDeu0Pcs4Fuh1hLgrH7X7G/2/Bmm/y2C5kQDIzunHPGnzIAcp
 857HWczxFO94FK/so85/7I7ug6irWGSuMvFT+F2cFD9b8ciKJmyiVjqXr
 QR/epKdDcXwkZq22bjEYqGUjd84gPVzK1f8AbrVKViVoSLNyWjpYefgik Q==;
X-CSE-ConnectionGUID: rX1SdYRmRoyznu+J1AfrFQ==
X-CSE-MsgGUID: TFkirccRS2Od1roFht1RXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75665771"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75665771"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:29:32 -0700
X-CSE-ConnectionGUID: NjUYYrz0R+SexHdKPB6Q6w==
X-CSE-MsgGUID: OwiVBy9eSY2of8WRP5mKng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="248338938"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 22:29:30 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: badal.nilawar@intel.com, karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Sk Anirban <sk.anirban@intel.com>, Tauro Riana <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>
Subject: [i-g-t, 0/1] Add fault-injection tests for Freq Throttle Reasons 
Date: Thu, 26 Mar 2026 10:59:16 +0530
Message-Id: <20260326052917.2511216-1-ravi.kishore.koppuravuri@intel.com>
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

Add IGT test to verify frequency throttling reason reporting with
the help of kernel's fault-injection framework.

Dependencies:
        - Requires xe patch https://patchwork.freedesktop.org/patch/711954/
        - Kernel fault injection support (CONFIG_FAIL_FUNCTION=y)


Verified the test and below is the execution result:

$ ./build/tests/xe_fault_injection --run-subtest 'throttle*'
IGT-Version: 2.3-g06706ff21 (x86_64) (Linux: 7.0.0-rc2-throttle-reason-injection-test x86_64)
Using IGT_SRANDOM=1773144939 for randomisation
Opened device: /dev/dri/card0
Starting subtest: throttle-reason-fail-soc_thermal
Injecting error (-1) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : thermal
Subtest throttle-reason-fail-soc_thermal: SUCCESS (0.022s)
Starting subtest: throttle-reason-fail-mem_thermal
Injecting error (-2) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-mem_thermal: SUCCESS (0.023s)
Starting subtest: throttle-reason-fail-vr_thermal
Injecting error (-3) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-vr_thermal: SUCCESS (0.031s)
Starting subtest: throttle-reason-fail-iccmax
Injecting error (-4) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-iccmax: SUCCESS (0.034s)
Starting subtest: throttle-reason-fail-ratl
Injecting error (-5) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : ratl
Subtest throttle-reason-fail-ratl: SUCCESS (0.042s)
Starting subtest: throttle-reason-fail-soc_avg_thermal
Injecting error (-6) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : vr_thermalert
Subtest throttle-reason-fail-soc_avg_thermal: SUCCESS (0.042s)
Starting subtest: throttle-reason-fail-fastvmode
Injecting error (-7) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : vr_tdc
Subtest throttle-reason-fail-fastvmode: SUCCESS (0.030s)
Starting subtest: throttle-reason-fail-pl4_limit
Injecting error (-8) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl4
Subtest throttle-reason-fail-pl4_limit: SUCCESS (0.030s)
Starting subtest: throttle-reason-fail-max_vid
Injecting error (-9) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-max_vid: SUCCESS (0.018s)
Starting subtest: throttle-reason-fail-pkg_pl1
Injecting error (-10) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl1
Subtest throttle-reason-fail-pkg_pl1: SUCCESS (0.033s)
Starting subtest: throttle-reason-fail-pkg_pl2
Injecting error (-11) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl2

Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Tauro Riana <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

Ravi Kishore Koppuravuri (1):
  tests/intel/xe_fault_injection: Add fault-injection tests for Freq
    Throttle Reasons

 tests/intel/xe_fault_injection.c | 172 +++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

-- 
2.34.1

