Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75F5CD8CB9
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 16:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E0310E3CC;
	Tue,  9 Jun 2026 16:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZ9fU9M+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE41F10E325
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781022308; x=1812558308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4icUiQlmHE3Wd/uboOQgoaYefCicp/ncLm6Io7A9+KU=;
 b=NZ9fU9M+xZaeAfgA5naWqqn5rd48e8nRJqJZ/MCRWHNS/biPDdN9Rfhe
 8xWh/i86LidKdeW54uCC9LxcWHh7u8NWqB7v946ox6q6wzAoLPVe7UnpU
 J86Txd6KmTygQSjejaA8A50Wkc8M/5mEZRwBaJKqWzXW0Ke+szOkv31Co
 qwoCyQX2/3lDAu8+qe9fbBQGPj1xE0y0FqtfbOGOSVlRGOsQcYiPkmdh+
 2N6vuTDZvCKeQBN/xHJ/u/3fSFs5koQVTJ/8exU/T1fccA1poHRdIpCB4
 TTbHKhBbZrh3j7pRsJO2gtm6FZNtGxmobkVQmRS6AcMFifAqyAd+2Tjo/ w==;
X-CSE-ConnectionGUID: yo9qHZh+RWyeDCY5DsCRLw==
X-CSE-MsgGUID: 0VUOKbPJT0266JGFtTWjCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104455315"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="104455315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:25:07 -0700
X-CSE-ConnectionGUID: oVLwTshMQi+dByPW/+yhCA==
X-CSE-MsgGUID: Zw4KfCdjQHC6OIoqPKHDDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="245757954"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa008.jf.intel.com with ESMTP; 09 Jun 2026 09:25:07 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] tests/xe_exec_reset: Replace fixed usleep with dynamic GT
 idle wait
Date: Tue,  9 Jun 2026 09:25:01 -0700
Message-ID: <20260609162501.2182610-1-x.wang@intel.com>
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

The CLOSE_FD subtests simulate a user abruptly closing the DRM file
descriptor (e.g. via Ctrl+C) while GPU work is still in flight. After
closing the fd, the kernel begins tearing down the VM and releasing
resources including the ASID. If the next test starts before this
cleanup completes, ASID reuse can cause hardware-level collisions and
trigger a cascade of CAT errors, corrupting the subsequent test.

The previous workaround of a fixed 150ms sleep was fragile: on some
platforms or under varying system load, cleanup takes longer and the
sleep is insufficient. Replace it with a dynamic poll that waits until
the GT enters the C6 idle state, which is a reliable hardware signal
that all GPU activity has ceased and resources have been reclaimed.
The poll checks every 10ms with a 1 second timeout, adapting to actual
hardware completion time rather than guessing.

v2: Fix regression on VF where GT C6 idle status is not available.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_exec_reset.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index dc1ae7e99c..19643b8874 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -15,6 +15,7 @@
 #include <fcntl.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
@@ -157,6 +158,20 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
  * @parallel:	parallel
  */
 
+static void
+wait_gt_idle(int gt_id)
+{
+	int fd = drm_open_driver(DRIVER_XE);
+
+	if (xe_sysfs_gt_has_node(fd, gt_id, "gtidle/idle_status"))
+		igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10);
+	else
+		/* GT C6 idle status not available (e.g. VF), fall back to fixed delay */
+		usleep(150000);
+
+	drm_close_driver(fd);
+}
+
 static void
 test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	      unsigned int flags)
@@ -277,8 +292,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 		}
 		drm_close_driver(fd);
-		/* FIXME: wait for idle */
-		usleep(150000);
+		wait_gt_idle(gt);
 		return;
 	}
 
@@ -542,8 +556,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_exec_queue_destroy(fd, exec_queues[i]);
 		}
 		drm_close_driver(fd);
-		/* FIXME: wait for idle */
-		usleep(150000);
+		wait_gt_idle(eci->gt_id);
 		return;
 	}
 
-- 
2.43.0

