Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F13E64010
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 20:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A051F10E068;
	Thu, 21 Nov 2024 20:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpKFSkW8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F6D10E1FC
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 20:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732220983; x=1763756983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vdXmKDos2TNwreZKtDKja2VRMmphbnLZdSUVb4RUpoo=;
 b=TpKFSkW8BraIxqjDoTrR6iNstVto2Rgtct4bRY1uQKzSHgHJyHrpggMB
 ud6RcakLrCVODogmkLzkIPk1aL13kVBtAWnkALB/0WwwW+Ba9AqfDDQZh
 CjOFRWQITWWpBnjktZn23jTTR10WJHrcED5SmbamS+pkmSWLQETOZ6Me9
 oAx8hErvOhA4PPchFhoOQcC1nYn8rMV73RFDfT8RZ8J00Qq9LyoXFNNOX
 oAUzQNHrplhAbwxtDVyCkGMUw3eNbY6P83GVkhQQ5fixc9RNmHdCl+Udg
 LO6vCg9L2y/2l0VtoF+ADC9xq34LpLzlf4VC0XNT/aH4ym9N+ldg2H8Xh A==;
X-CSE-ConnectionGUID: yXiQTph5SO6K99JsvArDkg==
X-CSE-MsgGUID: 4XuvYd+XT9OpqupvHgrFaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="57759092"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="57759092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 12:29:43 -0800
X-CSE-ConnectionGUID: C5ZgVpwPRO+miEW2+msw7A==
X-CSE-MsgGUID: SMyU5IFcRY2qSmx+bc1/dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="121318528"
Received: from dut4411lnl.fm.intel.com ([10.105.10.69])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 12:29:43 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 francois.dugast@intel.com, nirmoy.das@intel.com
Subject: [PATCH] tests/intel/xe_fault_injection: Use valid pat index
Date: Thu, 21 Nov 2024 20:29:42 +0000
Message-ID: <20241121202943.149868-1-jonathan.cavitt@intel.com>
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

As a part of vm_bind_ioctl_check_args, all vm binds that use the
DRM_XE_VM_BIND_OP_MAP_USERPTR operation must have a coherency mode of
XE_COH_AT_LEAST_1WAY.  This is determined by the pat_index set in the
bind operation before the bind is performed.

The value is usually set by intel_get_pat_idx_wb, as this is the
default used in the various xe_vm_bind helper functions (or, more
specifically, the pat index value DEFAULT_PAT_INDEX is passed, which
translates to using intel_get_pat_idx_wb to generate the true value sent
to the ioctl).  However, when the ioctl is called manually (through
igt_ioctl, for example), it is up to the calling test to ensure the pat
index value is correctly set, and in xe_vm, for example,
intel_get_pat_idx_wb is used as well to set the pat index.

This step was not done in the simple_vm_bind function in
xe_fault_injection, so use intel_get_pat_idx_wb to set the pat index.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3499
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 1b29041745..f8d7278caa 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -17,6 +17,7 @@
 #include "igt_device.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
+#include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -213,6 +214,7 @@ simple_vm_bind(int fd, uint32_t vm)
 		.bind.addr = BO_ADDR,
 		.bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
 		.bind.flags = 0,
+		.bind.pat_index = intel_get_pat_idx_wb(fd),
 		.num_syncs = 1,
 		.syncs = (uintptr_t)&syncobj,
 		.exec_queue_id = 0,
-- 
2.43.0

