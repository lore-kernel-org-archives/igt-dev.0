Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95629D58D7F
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 18:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4838F10E00C;
	Mon, 25 Nov 2024 18:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Akgl+2Az";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8081210E00C
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 18:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732560876; x=1764096876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N3XLZpNA4V6Mh3QCqpA3EMWiPoTRhZasw6JMJPh0bVw=;
 b=Akgl+2AzzB/oz17EGERFt9RhcoZBRKFT565zAKrgX7n30Ei03wUmW9A4
 dcz5feHmmOqxc6dS1IL4a8Sw1RKF7SHoxiw1EYRKDj3NQkW5t0TPznZYg
 mALOxDYfVilSKTRTgax80YKX4u4ubEqnIpg3jn06nqLZoRoPbMaRbiZEc
 dij+5V2AAiNycojeTQ1+FW9WjdXtpnEAoqGys8vv6vrffTi9/EN2rE+1j
 GZwOT5HBwanAk4mCPgq0AqRIeWLnIGyUQM2l5Evm/+tfsc8bQ1dYEPOl2
 REwEgK5pDykJF5Cg4LtJexXA39S/lehvywEGm22dJQGnSyDt0dRGnMtJr Q==;
X-CSE-ConnectionGUID: iasq9mLKReaTYXD5ESFKDg==
X-CSE-MsgGUID: WexqVoPsRPq48wk8OSrQCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32055905"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="32055905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 10:54:36 -0800
X-CSE-ConnectionGUID: vjYZIBuNRNikUB2MTzh5Kw==
X-CSE-MsgGUID: KqsPUDCqQ16PYG4bp2374Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="122215854"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 10:54:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Pick a valid PAT index
 for vm_bind
Date: Mon, 25 Nov 2024 10:54:32 -0800
Message-ID: <20241125185432.1187252-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.47.0
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

The vm_bind helper function in the fault injection test failed to
specify a PAT index to use for the bind, effectively leaving the index
as 0.  On Xe2 and Xe3 platforms, index 0 provides non-coherent behavior
which is incompatible with vm_bind operations on userptr, resulting in a
test failure before the test even got to the point of intentionally
injecting errors.

Fixes: 13e3d5126 ("tests/intel/xe_fault_injection: Inject errors during vm bind IOCTL")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3499
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 7d6c90276..7ae941367 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -18,6 +18,7 @@
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
+#include "lib/intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -238,6 +239,7 @@ simple_vm_bind(int fd, uint32_t vm)
 		.bind.range = BO_SIZE,
 		.bind.addr = BO_ADDR,
 		.bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
+		.bind.pat_index = intel_get_pat_idx_wb(fd),
 		.bind.flags = 0,
 		.num_syncs = 1,
 		.syncs = (uintptr_t)&syncobj,
-- 
2.47.0

