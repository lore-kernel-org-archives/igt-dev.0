Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10D4CD8C8E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 07:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9460A10EE7F;
	Mon,  8 Jun 2026 07:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDnR9A4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D63310EE7E
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780905435; x=1812441435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KcUWmyZJQ/JKu4SPoQWwgjx4C35BdQqVDrfQ97cqEq8=;
 b=aDnR9A4eS/rbarL3fxp5xcV4sy0ZkWt6VJcU6blGjlyq6vAkp65kzY0V
 PVcsYy7K7AWm0YZSrv77h+XtelxgAKkTC2hJntb+76PKAEggPF87KkUf3
 RmRwJKzWo06rDn2pxMwOBrF1lQVSI/R9nfqQ8wfOZ585lsYgmkh/3Ercg
 qRPpMQJB6OjSyuNKAPSX+mwlnhNmK8dIPS4PdGSIbnqVsRCD/JdE00eFW
 crFBW/TBf6FB5apkVg1MRuGR0ZpQUUrYbuylgSysLixRGQJCTz5b1SXN3
 nevGc5IIl4EBSnlZ+GD6bEo/7G/EhjuKxC0Ixu+No9SEaer+anpCDbUv5 A==;
X-CSE-ConnectionGUID: AIs6L8lvT46Q4SyYv+qz8A==
X-CSE-MsgGUID: rZr/UYzWTzGSPl1Ay+fB/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81680148"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81680148"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 00:57:15 -0700
X-CSE-ConnectionGUID: j9AW2N4STLuwBTERE/+4CQ==
X-CSE-MsgGUID: GOPhG5aVTwyHKIlnbzJYNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="245530371"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by orviesa009.jf.intel.com with ESMTP; 08 Jun 2026 00:57:14 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Balance PSR enable/disable calls
 in DC tests
Date: Mon,  8 Jun 2026 13:17:22 +0530
Message-ID: <20260608074722.9216-1-mohammed.thasleem@intel.com>
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

Add psr_disable() calls to properly cleanup PSR state
after DC5/DC6 PSR tests complete.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 423a5c4a4..d326ca488 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -675,6 +675,7 @@ int igt_main()
 					     data.op_psr_mode, NULL));
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC5);
+		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
 	}
 
 	igt_describe("This test validates display engine entry to DC6 state "
@@ -687,6 +688,7 @@ int igt_main()
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
 		test_dc_state_psr(&data, IGT_INTEL_CHECK_DC6);
+		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
 	}
 
 	igt_describe("This test validates display engine entry to PKGC10 state "
@@ -715,6 +717,7 @@ int igt_main()
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require(!psr_disabled_check(data.debugfs_fd));
 		test_dc5_retention_flops(&data, IGT_INTEL_CHECK_DC5);
+		psr_disable(data.drm_fd, data.debugfs_fd, NULL);
 	}
 
 	igt_describe("This test validates negative scenario of DC5 display "
-- 
2.43.0

