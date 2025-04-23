Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF3FC369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 12:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E9810E1B7;
	Wed, 23 Apr 2025 12:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDM+X1I3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7599010E1B7
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745412738; x=1776948738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qEr9HnevDQTK7zaMv9i9qSnoSTBYW3IOpo2Qn/4z+Fg=;
 b=XDM+X1I3wrc8vQYbGhqC1+vaHP9VRc2W7fUTXoQJPcz2Z2kuNY5O6UOZ
 Eajgx9xK1+p7LP4IuRpMHL1l+21GMEjzyVSbAhLKgJYmTlHH9PsGgXi0D
 B/HU9WfnB1bA8M4EH7Lkaooyzyjfd1sQB1IzZ7BE6xNSV4rIXgnJWSoa6
 3ovs8mAd9hI1c5XzCLF0aueLA6BZnD0tlVHYCXozCD9LDSg3PaApknnHB
 GYUC62gkrkgTWOQ8uepkYJjS4+ndPLHhxcUXsFqKF7T7TxQwASM1Ahv0G
 Ms880a+3FJ40iNWfxfs1g/b/zaSn4U9caFAD4BFbFlakq9SAxYNoQlf3z Q==;
X-CSE-ConnectionGUID: BAi6gQluRRCb53h1aF2GSQ==
X-CSE-MsgGUID: uncrqcitR/CrgAblr1JFNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50803465"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="50803465"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 05:52:16 -0700
X-CSE-ConnectionGUID: BOQiNhhiRoKZ/IdhpmtaLw==
X-CSE-MsgGUID: aMSD6L/dRR+5gR+YRpMkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132191491"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.80.187])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 05:52:15 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Nakshtra Goyal <nakshtra.goyal@intel.com>
Subject: [PATCH i-g-t] tests/xe_fault_injection: Skip OA test if Xe OA
 interface is not available
Date: Wed, 23 Apr 2025 14:52:10 +0200
Message-Id: <20250423125210.1385220-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Handle the case where the Xe OA interface is not available by checking
for ENODEV and skipping the test gracefully. This avoids test failures
on platforms where the OA feature is not supported.

No functional change to platforms where the interface is present.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Nakshtra Goyal <nakshtra.goyal@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 24d3df572..42b467e73 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -349,6 +349,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
 	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
 	struct drm_xe_oa_config config;
 	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
+	int ret;
 
 	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
 	/* Destroy previous configuration if present */
@@ -361,7 +362,10 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
 	config.n_regs = 1;
 	config.regs_ptr = to_user_pointer(mux_regs);
 
-	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
+	ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
+	igt_skip_on_f(ret == -1 && errno == ENODEV, "Xe OA interface not available\n");
+
+	igt_assert_lt(0, ret);
 	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 
-- 
2.31.1

