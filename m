Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E07C5B542
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 12:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E6210E4BE;
	Tue, 27 May 2025 12:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3E8NBOy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5909C10E4DC
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748347407; x=1779883407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y32OPgi5U6oUyA8owYSIq7r0+859T6U7fkEhNITs+bo=;
 b=l3E8NBOyAlm2Kq9XzZMvyGE0r6evqMXl4nxKXuo3vAYIc3K3rJfEJOJP
 /zMPpgrOGmaPBkey5vLuLJRWJ3UAGesv5DevUMe6UrJ+Bznzjg8kdUfIa
 x3u08fDcM8rR7F08xWw/oxxgk3Atsew3XneGM596xL1dsG0xJlPFu0bRM
 jyf7zSs8RuQmTP6/LxImgqmPtf/yCBPoivvrN9ssyxqvJ6Rcu8/oVT6wx
 ygGAtPIWLQ0RjOwB2aaxrF/VF4UkMIu2xAYSyDi3JA3UrQEeQXANNR6n9
 Z79W4cVumOuFOpENDeCwdXKEQfTdHb1JKmQF0PZOoFD/bT4mzbsft7u1c g==;
X-CSE-ConnectionGUID: oCuwsu5aQ7yw/cVbqLLl2A==
X-CSE-MsgGUID: F0kqZUknSqiiICGXfU3VCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="61687784"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="61687784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:26 -0700
X-CSE-ConnectionGUID: uYp+vFpGRICv9dW3KBULcw==
X-CSE-MsgGUID: YU7TewUSTcGoar1JYwFztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147557996"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 05:03:25 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 George Zhang <george.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t v4 1/9] lib/amdgpu: fixup print formatting for files in
 lib
Date: Tue, 27 May 2025 12:04:13 +0000
Message-Id: <20250527120421.79026-2-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527120421.79026-1-jan.sokolowski@intel.com>
References: <20250527120421.79026-1-jan.sokolowski@intel.com>
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

Compiling on other architectures than x86-64 causes a lot
of print formatting warnings.

Fix formatting by using proper formatters, eg. PRIu64.

Cc: George Zhang <george.zhang@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
Reviewed-by Vitaly Prosyak <vitaly.prosyak at amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 98251061c..3b4822ca0 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -4,6 +4,7 @@
  */
 
 #include <amdgpu.h>
+#include <inttypes.h>
 #include "amdgpu_drm.h"
 #include "amd_PM4.h"
 #include "amd_sdma.h"
@@ -249,13 +250,13 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 			if (support_page) {
 				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 							0x3 << ring_id, sysfs);
-				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
+				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
 				ring_id++;
 
 			} else {
 				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 							0x1 << ring_id, sysfs);
-				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
+				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
 			}
 			r = system(cmd);
 			igt_assert_eq(r, 0);
@@ -266,7 +267,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 
 	/* recover the sched mask */
 	if (sched_mask > 1) {
-		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
 	}
@@ -523,12 +524,12 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 			if (support_page) {
 				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x3 << ring_id, sysfs);
-				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
+				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
 				ring_id++;
 			} else {
 				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x1 << ring_id, sysfs);
-				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
+				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
 			}
 
 			r = system(cmd);
@@ -540,7 +541,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 
 	/* recover the sched mask */
 	if (sched_mask > 1) {
-		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
 	}
@@ -592,12 +593,12 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 			if (support_page) {
 				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x3 << ring_id, sysfs);
-				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
+				igt_info("Disable other rings, keep ring: %" PRIu64 " and %" PRIu64 " enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
 				ring_id++;
 			} else {
 				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x1 << ring_id, sysfs);
-				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
+				igt_info("Disable other rings, keep only ring: %" PRIu64 " enabled, cmd: %s\n", ring_id, cmd);
 			}
 
 			r = system(cmd);
@@ -609,7 +610,7 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 
 	/* recover the sched mask */
 	if (sched_mask > 1) {
-		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s", sched_mask, sysfs);
+		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%" PRIx64 " > %s", sched_mask, sysfs);
 		r = system(cmd);
 		igt_assert_eq(r, 0);
 	}
-- 
2.34.1

