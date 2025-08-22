Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B88DCA0FE1
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 20:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FC310EBB8;
	Fri, 22 Aug 2025 20:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8m47860";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBD410EBB2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755896230; x=1787432230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4NmmmQWpvh/Bj69bOjuEHNIGv3AvyjoKxHJr872Ako=;
 b=d8m47860w57DB0JzL3T3auaS5YGY/U4hlbPOqMV7vft57p/5PI51vZc9
 d3in93n5Ac4msjFVv73NoslOILdiJEyYM9ublSLuCR1tAWndZe66RO6Pb
 /vDfxtJ2vXP7dMhDQQlcEOfBy+cjouCUgGVygwvOY8q3VF5ntZdxabIgV
 G49ZXsv7vqZc9Ujd2Ra+t/L9Ky1wIMaVhDnBVvwAiSGYIxgAhsS4vxesE
 sb1C4FjnHeLVlQzcdb5T8+/77GTtTzIhxezZNR3ywNWRDyY/PjJSPFCqJ
 UGwErHjGe0Mr8IqKbUJnFK3Rbt56fTHFbKYxK6hvGnO1f9y8VfbT2RdEy w==;
X-CSE-ConnectionGUID: bVs+HyrXR/6Gj/K1FCBMaw==
X-CSE-MsgGUID: piRBdTPQThy/rD20CnGsxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58306990"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58306990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:57:09 -0700
X-CSE-ConnectionGUID: 715Q3qm1Q2e+2QwY/jGFHg==
X-CSE-MsgGUID: f/njd4IPS8icebaHggWB9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="172989860"
Received: from dut4086lnl.fm.intel.com ([10.105.10.28])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:57:09 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH 2/4] tests/intel/xe_vm: Use fault injection interface for
 error injection test
Date: Fri, 22 Aug 2025 20:57:08 +0000
Message-ID: <20250822205706.167042-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822205706.167042-6-jonathan.cavitt@intel.com>
References: <20250822205706.167042-6-jonathan.cavitt@intel.com>
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

The test xe_vm@bind-array-conflict-error-inject currently uses a
separate error injection mechanism that isn't unified with the existing
error injection framework.  This separate error injection framework is
disabled when CONFIG_DRM_XE_DEBUG is not set, which violates the
guarantee CONFIG_DRM_XE_DEBUG has no functional impact.  Modify the test
to use the fault injection framework that the other xe_fault_injection
tests use.

Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7a37bfe052..7271ee4123 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -16,6 +16,7 @@
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
+#include "xe/xe_fault_injection.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
@@ -1177,14 +1178,14 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 
 		if (error_inject) {
+			const char *func_name = "vm_bind_ioctl_ops_lock_and_prep";
 			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-			bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS - 1].flags |=
-				0x1 << 31;
+			injection_list_add(func_name);
+			injection_set_retval(func_name, -ENOSPC);
 			xe_vm_bind_array_err(fd, vm, 0, bind_ops,
 					     BIND_ARRAY_CONFLICT_NUM_BINDS,
 					     sync, 1, ENOSPC);
-			bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS - 1].flags &=
-				~(0x1 << 31);
+			injection_list_remove(func_name);
 
 			/* Verify existing mappings still works */
 			i = 1;
@@ -2673,9 +2674,13 @@ igt_main
 		xe_for_each_engine(fd, hwe)
 			test_bind_array_conflict(fd, hwe, true, false);
 
-	igt_subtest("bind-array-conflict-error-inject")
+	igt_subtest("bind-array-conflict-error-inject") {
+		igt_require(fail_function_injection_enabled());
+		injection_setup_fault(&default_fault_params);
+		injection_exit_handler();
 		xe_for_each_engine(fd, hwe)
 			test_bind_array_conflict(fd, hwe, false, true);
+	}
 
 	igt_subtest("bind-array-flag-invalid")
 		test_bind_flag_invalid(fd, 16);
-- 
2.43.0

