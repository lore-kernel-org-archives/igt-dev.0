Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B47CD5BD5
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 14:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BABA10E256;
	Wed, 27 May 2026 14:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niKPyIZ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2850310E256
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779893157; x=1811429157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7SoKASHSJXzxsidBtsJyhn3fIQBE6WNWBfK1wy/RT34=;
 b=niKPyIZ6/DCsQEGRm4ok81nJnKm8ly3RRZIkhvpq1l49yeo+OMcO9sT/
 h3XAY9QD1e+R3ATsqnYCIIjJ+0OikmUyw0B9mnUnTN8ODKxT4EuLJAstI
 RLYXlvppqjbEhu5PB+aIu1KlruLyHm6s7VCt0/TTP9f3JQ+GbRGBYjE0n
 u83PXvil4ZWYfAgTwjRah5FXo5R5nbZ2D5cKlf5qfC0TxyD55j+L1S+zQ
 X0tEEAV8u1XL8sKYmItJCR0HZbbv7eUwO4MqNpsI/MvH2umzlz976BnfO
 mbw3Bf5YReOMwfGYJFQ27NOB8kYBvOV40WlJQBgGCSanpN1C7G/g8G6Ef g==;
X-CSE-ConnectionGUID: dZz7EjHNSCOek7UrIFZaBg==
X-CSE-MsgGUID: Xj3QS3mkRGCYrVeUaD0y1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92112088"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="92112088"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:45:57 -0700
X-CSE-ConnectionGUID: HyDM9qT3RimJ43VMRPE56w==
X-CSE-MsgGUID: KFIKVGn0SLSvQ/DSjm9P0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="244086472"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:45:55 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sk.anirban@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [[i-g-t] v2 0/1] Add fault-injection tests for frequency throttling
 reasons
Date: Wed, 27 May 2026 20:15:29 +0530
Message-Id: <20260527144530.1652574-1-ravi.kishore.koppuravuri@intel.com>
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
        - Requires xe patch https://patchwork.freedesktop.org/series/163247/
        - Kernel fault injection support (CONFIG_FAIL_FUNCTION=y)


Verified the test on Battlemage platform and below is the execution result:
```
root@DUT2017BMGFRD:/home/gta/igt-gpu-tools# ./build/tests/xe_fault_injection --r throttle-reason-fail
IGT-Version: 2.3-gc4a3de72e (x86_64) (Linux: 7.0.0-rc2-throttle-reason-injection-test x86_64)
Using IGT_SRANDOM=1779884198 for randomisation
Opened device: /dev/dri/card2
Starting subtest: throttle-reason-fail
Running throttle-reason-fail with Platform other than CRI mapping
Injecting error (0) into BIT(0) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : prochot
Injecting error (-1) into BIT(1) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : thermal
Injecting error (-5) into BIT(5) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : ratl
Injecting error (-6) into BIT(6) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : vr_thermalert
Injecting error (-7) into BIT(7) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : vr_tdc
Injecting error (-8) into BIT(8) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl4
Injecting error (-10) into BIT(10) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl1
Injecting error (-11) into BIT(11) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl2
Subtest throttle-reason-fail: SUCCESS (0.301s)
root@DUT2017BMGFRD:/home/gta/igt-gpu-tools#
```

Ravi Kishore Koppuravuri (1):
  tests/intel/xe_fault_injection: Add fault-injection tests for Freq
    Throttle Reasons

 tests/intel/xe_fault_injection.c | 242 +++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

-- 
2.34.1

