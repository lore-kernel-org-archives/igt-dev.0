Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F3C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 16:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC8E10EB7A;
	Thu, 22 Aug 2024 16:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZOPcSST";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0509510EB7A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724345664; x=1755881664;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IxETzb6e1hi8D2hruOwcYDIelDwBjGkshRDJ5ScBUOc=;
 b=fZOPcSSTsmZmT7dx1eznTyk5lBwS/OzRJ97NjY3MFQs8AEVxb1dW201p
 zHVhS+jNRogYJBstVB/jQajlU0OGovKcZ+znAEXBUWceFd+GtX9RxO603
 R63GU5Z1AKsY16oSWgKuNMUhZPkMwSeuIO4ow+p/mmct2Gb+qo27dKM/M
 WsiuQv5JibbNzCRAnf5CWi6nkYg9GUAJmg4fjqWZ/27Xp6tME2dqYQpx6
 W1knwTb8vY7tm5Rh9ifPfophwJbU/+BOioBbzZC2hHIo5a1MgH2N/nK6a
 yqMbtJIFS/V3o0Xuba1zcs6Q/3eoL59bZnYKS1L2grXjkR4ojhgle7IJZ Q==;
X-CSE-ConnectionGUID: M2GjscT5Sf+fE/BHHu/Fsg==
X-CSE-MsgGUID: waL//uTnRxOtCcuUV+wnwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34158868"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="34158868"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 09:54:24 -0700
X-CSE-ConnectionGUID: iCzrdyDcQASffm2CD4ZJNQ==
X-CSE-MsgGUID: 7rGSDPUdRP+HrRfKcoHooA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="66349380"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 09:54:22 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_fault_mode: Print engine name on
 error
Date: Thu, 22 Aug 2024 18:26:02 +0200
Message-ID: <20240822162602.24246-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Print engine name the test is running on to help with debugging.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1461
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 87375ed17..1f1f1e50b 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -140,6 +140,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	int i, j, b;
 	int map_fd = -1;
 
+	igt_debug("%s running on: %s\n", __func__, xe_engine_class_string(eci->engine_class));
 	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
 
 	if (flags & ENABLE_SCRATCH)
-- 
2.42.0

