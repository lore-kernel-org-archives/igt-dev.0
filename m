Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E84CD11DD
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D25510FCD9;
	Wed, 27 Mar 2024 12:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LwTsYSMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873FA10FCD6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542517; x=1743078517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJOwYEqDVUSZt5aoiTwxgX5b5WAh9Dmb6CFZFIztcBg=;
 b=LwTsYSMrDOwLzOgTsTI+oTQAam+tg+vqFmmwTTAp9CzbcBeM1e+ilVEt
 k402fQc+I5Tc7rgcum0k3sddjF8r2Q5x/GlohwblolRkvX40alsn30kOw
 cv7z8SQ53aaPZf8vKac/FgXmQaVO9P7Rr+VB3hH2tAA/qVw0hZyy6xFc6
 hw5LOHHFAMUmNAnwcwuwUzMbNqEVLaDYa+jAU6xax7FeHOQG093G3ikki
 h/IIzWqdwgg9x2jTBgA9Ivn/ty2NixEr7WbklgPHkOkWIKwyx2JhcBPKI
 Gl8kQA7vWrHrNZt/jqvLiQ5uJr0a0b1n49OhTm3Y8Jbe+SG3gBgM7GKN6 A==;
X-CSE-ConnectionGUID: vj3+0/YBSCm4L47rbaX+lQ==
X-CSE-MsgGUID: rbZ64XvLSSGMAjetawR/zA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6771275"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6771275"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16118475"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:34 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 06/16] tests: Introduce General mega feature
Date: Wed, 27 Mar 2024 12:27:21 +0000
Message-Id: <20240327122731.2104614-7-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

Add tests to 'General feature' mega feature.
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
 tests/device_reset.c           | 8 ++++----
 tests/dumb_buffer.c            | 7 ++++---
 tests/prime_vgem.c             | 7 ++++---
 tests/sw_sync.c                | 9 +++++----
 tests/syncobj_basic.c          | 7 ++++---
 tests/syncobj_timeline.c       | 9 +++++----
 tests/syncobj_wait.c           | 9 +++++----
 tests/vgem_basic.c             | 5 +++--
 tests/vgem_slow.c              | 7 ++++---
 16 files changed, 65 insertions(+), 50 deletions(-)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index 2d6ad83e9..9dfc1b484 100644
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
+ * Mega feature: General features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-auth
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 308f2c0e4..0e440e433 100644
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
+ * Mega feature: General features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index b2d26a826..1e2afa8da 100644
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
+ * Mega feature: General features
  * Sub-category: uapi
+ * Functionality: DRM memory management
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index 94cedff8c..1d2b0f5f1 100644
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
+ * Mega feature: General features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 9af857e67..2d8f88768 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -42,11 +42,12 @@
 /**
  * TEST: core hotunplug
  * Description: Examine behavior of a driver on device hot unplug
- * Feature: SMI, core
- * Test category: functionality test
  * Category: Software building block
+ * Mega feature: General features
  * Sub-category: driver
  * Functionality: device hotplug
+ * Feature: SMI, core
+ * Test category: functionality test
  *
  * SUBTEST: hotrebind
  * Description: Check if the driver can be cleanly rebound to a device with a
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 707c2305f..a9833b4fe 100644
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
+ * Mega feature: General features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST: master-drop-set-root
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index 592d850f6..28a1f866d 100644
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
+ * Mega feature: General features
  * Sub-category: DRM
+ * Functionality: permission management for clients
+ * Feature: core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/device_reset.c b/tests/device_reset.c
index 583a59039..2e1619f60 100644
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
- * Functionality: sysfs reset
+ * Category: Hardware building block
+ * Mega feature: General features
  * Sub-category: Reset
+ * Functionality: sysfs reset
+ * Feature: reset
  * Test category: GEM_Legacy
  *
  * SUBTEST: cold-reset-bound
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 8e243459c..04816cb17 100644
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
+ * Mega feature: General features
  * Sub-category: uapi
+ * Functionality: ioctl
+ * Feature: prime
  * Test category: Compositor
  *
  * SUBTEST: create-clear
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index fa19d8e64..8c25516e6 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -32,11 +32,12 @@
 #include "intel_batchbuffer.h"	/* igt_blitter_copy() */
 /**
  * TEST: prime vgem
- * Category: Infrastructure
  * Description: Basic check of polling for prime/vgem fences.
- * Feature: prime
- * Functionality: mock device
+ * Category: Infrastructure
+ * Mega feature: General features
  * Sub-category: DRM
+ * Functionality: mock device
+ * Feature: prime
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-blt
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index a276c4a22..666c0d408 100644
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
+ * Mega feature: General features
+ * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: alloc_fence
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index d1ea872cf..d4d4c2d66 100644
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
+ * Mega feature: General features
  * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-create-flags
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index f7e33604d..397966bab 100644
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
+ * Mega feature: General features
+ * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: 32bits-limit
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index 571e3c2af..a95fe2f3b 100644
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
+ * Mega feature: General features
+ * Sub-category: Synchronization
+ * Functionality: semaphore
+ * Feature: synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index cb92efbf5..49d528a7c 100644
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
+ * Mega feature: General features
  * Sub-category: Core
+ * Functionality: mock device
  * Test category: GEM_Legacy
  * Feature: vgem
  *
diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
index 35761a4ee..d13f92c74 100644
--- a/tests/vgem_slow.c
+++ b/tests/vgem_slow.c
@@ -32,11 +32,12 @@
 #include <dirent.h>
 /**
  * TEST: vgem slow
- * Category: Infrastructure
  * Description: Extended sanity check of Virtual GEM module (vGEM).
- * Feature: vgem
- * Functionality: mock device
+ * Category: Infrastructure
+ * Mega feature: General features
  * Sub-category: DRM
+ * Functionality: mock device
+ * Feature: vgem
  * Test category: GEM_Legacy
  *
  * SUBTEST: nohang
-- 
2.34.1

