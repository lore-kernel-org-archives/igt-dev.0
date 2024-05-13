Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9D5C25B75
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 10:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1837710E650;
	Mon, 13 May 2024 10:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqKIsyHb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0EF10E650
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 10:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715597398; x=1747133398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b3CY6FBsNO6mgKQ89hvt8KXpwK96c6XUE7S8oB4cBXI=;
 b=ZqKIsyHbhLidfhgGXc2ryA3rLk7JeqQEHI4OPGpV0hDSftjfR/F0EQ31
 Gp17o+qUAqRB+HvbHhMcKt/YJobF1gqNjwvS1ASPJl2BDAZ1d0Q+tirim
 G9bPdQ36kHSIowQlHniwx5c2uBLeQA2Wx/klemMX85GUIEblTX+jW+Nh8
 7fI8/hAVig2nEjVp+dGFDBwefX5Z5Zj3cmRI0KdHb6y9KhR4Wcyf9zler
 TnDUAFBqfI72dpWEAoDdCyRVQ9kwAEJ7Vmcmqqd6xMbks8ha3wt1RN4AW
 QbUerZmLivwg4Z7oscoBhYHmFV+eRkQpX+N41EWJaocFLpKr2y2NgJXW/ w==;
X-CSE-ConnectionGUID: Comr3WdySh6ayAxzQn44JA==
X-CSE-MsgGUID: RgGqAEIDRWiEsA4Qt1cyzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11390893"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11390893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:49:58 -0700
X-CSE-ConnectionGUID: yZ33/H69TT+Y4RyX/V64Tw==
X-CSE-MsgGUID: cgMbWr9YQoyye0RVnqjFgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30138777"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:49:56 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t v3 06/16] tests: Add DRIVER_ANY tests to General Core
 Mega feature
Date: Mon, 13 May 2024 10:48:36 +0000
Message-Id: <20240513104846.362332-7-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
References: <20240513104846.362332-1-katarzyna.piecielska@intel.com>
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

Add tests with DRIVER_ANY to 'General Core feature' mega feature.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/core_auth.c              | 7 ++++---
 tests/core_getclient.c         | 7 ++++---
 tests/core_getstats.c          | 7 ++++---
 tests/core_getversion.c        | 7 ++++---
 tests/core_hotunplug.c         | 5 +++--
 tests/core_setmaster.c         | 7 ++++---
 tests/core_setmaster_vs_auth.c | 7 ++++---
 tests/device_reset.c           | 9 ++++-----
 tests/dumb_buffer.c            | 7 ++++---
 tests/intel/i915_selftest.c    | 9 ++++++---
 tests/prime_vgem.c             | 7 ++++---
 tests/sw_sync.c                | 9 +++++----
 tests/syncobj_basic.c          | 7 ++++---
 tests/syncobj_timeline.c       | 9 +++++----
 tests/syncobj_wait.c           | 9 +++++----
 tests/vgem_basic.c             | 5 +++--
 tests/vgem_slow.c              | 7 ++++---
 17 files changed, 71 insertions(+), 54 deletions(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index f4381bba0..9831c3b17 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -44,11 +44,12 @@
 #include "drm.h"
 /**
  * TEST: core auth
- * Category: Desktop client
  * Description: Call drmGetMagic() and drmAuthMagic() and see if it behaves.
- * Feature: core
- * Functionality: permission management for clients
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-auth
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 591433572..8735bcc94 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -33,11 +33,12 @@
 
 /**
  * TEST: core getclient
- * Category: Desktop client
  * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
- * Feature: core
- * Functionality: permission management for clients
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index 05e0eae34..a8eaa9bf8 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -34,11 +34,12 @@
 
 /**
  * TEST: core getstats
- * Category: Desktop client
  * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
- * Feature: core
- * Functionality: DRM memory management
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: DRM memory management
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 94cedff8c..bb2e6013d 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -30,11 +30,12 @@
 #include <sys/ioctl.h>
 /**
  * TEST: core getversion
- * Category: Desktop client
  * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
- * Feature: core
- * Functionality: permission management for clients
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 9af857e67..afd7c3faa 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -42,11 +42,12 @@
 /**
  * TEST: core hotunplug
  * Description: Examine behavior of a driver on device hot unplug
- * Feature: SMI, core
- * Test category: functionality test
  * Category: Software building block
+ * Mega feature: General Core features
  * Sub-category: driver
  * Functionality: device hotplug
+ * Feature: SMI, core
+ * Test category: functionality test
  *
  * SUBTEST: hotrebind
  * Description: Check if the driver can be cleanly rebound to a device with a
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 707c2305f..21c62036e 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -40,11 +40,12 @@
 #include <sys/stat.h>
 /**
  * TEST: core setmaster
- * Category: Desktop client
  * Description: Check that Drop/SetMaster behaves correctly wrt root/user access
- * Feature: core
- * Functionality: permission management for clients
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST: master-drop-set-root
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index 4605f8453..2eb613034 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -42,11 +42,12 @@
 #include "igt_device.h"
 /**
  * TEST: core setmaster vs auth
- * Category: Desktop client
  * Description: Check that drop/setMaster correctly transfer master state
- * Feature: core
- * Functionality: permission management for clients
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/device_reset.c b/tests/device_reset.c
index 6a63a5925..84d42fa3a 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -16,12 +16,12 @@
 #include "igt_kmod.h"
 /**
  * TEST: device reset
- * Category: Hardware building block
  * Description: Examine behavior of a driver on device sysfs reset
- * Category: Server
- * Feature: reset
+ * Category: Hardware building block
+ * Mega feature: General Core features
+ * Sub-category: Reset tests
  * Functionality: sysfs reset
- * Sub-category: Reset
+ * Feature: reset
  * Test category: GEM_Legacy
  *
  * SUBTEST: cold-reset-bound
@@ -38,7 +38,6 @@
  *   Unbinds driver from device, initiates reset then rebinds driver to device
  *   validating device resets
  * Category: Infrastructure
- * Sub-category: SysMan
  * Feature: reset, sriov-reset
  */
 
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 8e243459c..f27e113d4 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -51,11 +51,12 @@
 #include "ioctl_wrappers.h"
 /**
  * TEST: dumb buffer
- * Category: Desktop client
  * Description: This is a test for the generic dumb buffer interface.
- * Feature: prime
- * Functionality: ioctl
+ * Category: Desktop client
+ * Mega feature: General Core features
  * Sub-category: uapi
+ * Functionality: ioctl
+ * Feature: prime
  * Test category: Compositor
  *
  * SUBTEST: create-clear
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index d1489e343..7097622a9 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -154,6 +154,8 @@
  * SUBTEST: live@gt_heartbeat
  * Category: Selftest
  * Description: Stall detection interface validation
+ * Mega feature: General Core features
+ * Sub-category: Reset tests
  * Functionality: heartbeat
  * Test category: i915
  * Sub-category: Reset
@@ -242,7 +244,7 @@
  * Description: reset handling after stall detection
  * Functionality: hangcheck
  * Test category: i915
- * Sub-category: Reset
+ * Sub-category: Reset tests
  *
  * SUBTEST: live@hugepages
  * Description: Large page support validation
@@ -328,11 +330,12 @@
  * Test category: i915
  *
  * SUBTEST: live@reset
- * Category: Selftest
  * Description: engine/GT resets
+ * Category: Selftest
+ * Mega feature: General Core features
+ * Sub-category: Reset tests
  * Functionality: engine/GT reset
  * Test category: HW
- * Sub-category: Reset
  *
  * SUBTEST: live@sanitycheck
  * Description: Checks the selftest infrastructure itself
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 8f1cf8552..8cea7f584 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -32,11 +32,12 @@
 #include "intel_batchbuffer.h"	/* igt_blitter_copy() */
 /**
  * TEST: prime vgem
- * Category: Infrastructure
  * Description: Basic check of polling for prime/vgem fences.
- * Feature: prime
+ * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: Core
  * Functionality: mock device
- * Sub-category: DRM
+ * Feature: prime
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-blt
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index a276c4a22..e01397460 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -40,11 +40,12 @@
 
 /**
  * TEST: sw sync
- * Category: Infrastructure
  * Description: Test SW Sync Framework
- * Feature: semaphore
- * Functionality: sw sync framework
- * Sub-category: uapi
+ * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: alloc_fence
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index d1ea872cf..9e905a939 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -28,11 +28,12 @@
 #include "drm.h"
 /**
  * TEST: syncobj basic
- * Category: Infrastructure
  * Description: Basic check for drm sync objects.
- * Feature: semaphore
- * Functionality: drm sync object
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-create-flags
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index f7e33604d..e9c3ac740 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -32,11 +32,12 @@
 #include "drm.h"
 /**
  * TEST: syncobj timeline
- * Category: Infrastructure
  * Description: Tests for the drm timeline sync object API
- * Feature: synchronization feature
- * Functionality: sync_object
- * Sub-category: uapi
+ * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: 32bits-limit
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index 571e3c2af..26fce89fe 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -32,11 +32,12 @@
 #include "drm.h"
 /**
  * TEST: syncobj wait
- * Category: Infrastructure
  * Description: Tests for the drm sync object wait API
- * Feature: synchronization feature
- * Functionality: object wait
- * Sub-category: uapi
+ * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 6d4b89976..07ba5dcb3 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -33,10 +33,11 @@
 #include <dirent.h>
 /**
  * TEST: vgem basic
- * Category: Infrastructure
  * Description: Basic sanity check of Virtual GEM module (vGEM).
- * Functionality: mock device
+ * Category: Infrastructure
+ * Mega feature: General Core features
  * Sub-category: Core
+ * Functionality: mock device
  * Test category: GEM_Legacy
  * Feature: vgem
  *
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 91c3fc501..2de512754 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -32,11 +32,12 @@
 #include <dirent.h>
 /**
  * TEST: vgem slow
- * Category: Infrastructure
  * Description: Extended sanity check of Virtual GEM module (vGEM).
- * Feature: vgem
+ * Category: Infrastructure
+ * Mega feature: General Core features
+ * Sub-category: Core
  * Functionality: mock device
- * Sub-category: DRM
+ * Feature: vgem
  * Test category: GEM_Legacy
  *
  * SUBTEST: nohang
-- 
2.34.1

