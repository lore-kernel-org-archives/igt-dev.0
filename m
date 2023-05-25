Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2CD10EDD5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 06:38:14 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.20.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BA3B0580DAB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 23:38:12 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q24by-00Bbxf-2I
 for igt-dev@lists.freedesktop.org; Thu, 25 May 2023 08:38:10 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 25 May 2023 08:38:00 +0200
Message-Id: <20230525063805.2767417-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230525063805.2767417-1-mauro.chehab@linux.intel.com>
References: <20230525063805.2767417-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/7] tests: better document core_* tests
 used for i915 validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Merge data from some ancillary internal documentation to improve
core test descriptions.

This patch was auto-generated via script.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/core_auth.c              | 4 ++++
 tests/core_getclient.c         | 4 ++++
 tests/core_getstats.c          | 4 ++++
 tests/core_getversion.c        | 4 ++++
 tests/core_hotunplug.c         | 8 ++++++++
 tests/core_setmaster.c         | 4 ++++
 tests/core_setmaster_vs_auth.c | 4 ++++
 7 files changed, 32 insertions(+)

diff --git a/tests/core_auth.c b/tests/core_auth.c
index ee7fbaabfa92..ed736e1ae39f 100644
--- a/tests/core_auth.c
+++ b/tests/core_auth.c
@@ -44,8 +44,12 @@
 #include "drm.h"
 /**
  * TEST: core auth
+ * Category: Desktop client
  * Description: Call drmGetMagic() and drmAuthMagic() and see if it behaves.
  * Feature: core
+ * Functionality: permission management for clients
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
  *
  * SUBTEST: basic-auth
  * Description: Test magic numbers for master and slave.
diff --git a/tests/core_getclient.c b/tests/core_getclient.c
index 1ab56e9f304c..993801ead5a0 100644
--- a/tests/core_getclient.c
+++ b/tests/core_getclient.c
@@ -33,9 +33,13 @@
 
 /**
  * TEST: core getclient
+ * Category: Desktop client
  * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
  * Feature: core
+ * Functionality: permission management for clients
  * Run type: FULL
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
  *
  * SUBTEST:
  */
diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index f2b1abac738e..fef12258356e 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -34,9 +34,13 @@
 
 /**
  * TEST: core getstats
+ * Category: Desktop client
  * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
  * Feature: core
+ * Functionality: permission management for clients
  * Run type: FULL
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
  *
  * SUBTEST:
  */
diff --git a/tests/core_getversion.c b/tests/core_getversion.c
index ae6fc8f8d7d9..36ba01b865c5 100644
--- a/tests/core_getversion.c
+++ b/tests/core_getversion.c
@@ -30,9 +30,13 @@
 #include <sys/ioctl.h>
 /**
  * TEST: core getversion
+ * Category: Desktop client
  * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
  * Feature: core
+ * Functionality: permission management for clients
  * Run type: FULL
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
  *
  * SUBTEST:
  */
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 472e9237ddc2..4d6a721f0d28 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -48,11 +48,15 @@
  * Description:
  *   Check if the driver can be cleanly rebound to a device with a still open hot unbound driver
  *   instance
+ * Functionality: device hotplug
  * Run type: FULL
+ * Test category: SysMan
  *
  * SUBTEST: hotrebind-lateclose
  * Description: Check if a hot unbound driver instance still open after hot rebind can be cleanly released
+ * Functionality: device hotplug
  * Run type: FULL
+ * Test category: SysMan
  *
  * SUBTEST: hotreplug
  * Description: Check if a hot unplugged and still open device can be cleanly restored
@@ -64,7 +68,9 @@
  *
  * SUBTEST: hotunbind-rebind
  * Description: Check if the driver can be cleanly unbound from an open device, then released and rebound
+ * Functionality: device hotplug
  * Run type: FULL
+ * Test category: SysMan
  *
  * SUBTEST: hotunplug-rescan
  * Description: Check if an open device can be cleanly unplugged, then released and restored
@@ -72,7 +78,9 @@
  *
  * SUBTEST: unbind-rebind
  * Description: Check if the driver can be cleanly unbound from a device believed to be closed, then rebound
+ * Functionality: device hotplug
  * Run type: BAT
+ * Test category: SysMan
  *
  * SUBTEST: unplug-rescan
  * Description: Check if a device believed to be closed can be cleanly unplugged, then restored
diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
index 95a131a4d3c9..621bc24696a8 100644
--- a/tests/core_setmaster.c
+++ b/tests/core_setmaster.c
@@ -40,9 +40,13 @@
 #include <sys/stat.h>
 /**
  * TEST: core setmaster
+ * Category: Desktop client
  * Description: Check that Drop/SetMaster behaves correctly wrt root/user access
  * Feature: core
+ * Functionality: permission management for clients
  * Run type: FULL
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
  *
  * SUBTEST: master-drop-set-root
  * Description: Ensure that root can Set/DropMaster
diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
index 37bb378ab011..adca1c1117d3 100644
--- a/tests/core_setmaster_vs_auth.c
+++ b/tests/core_setmaster_vs_auth.c
@@ -42,9 +42,13 @@
 #include "igt_device.h"
 /**
  * TEST: core setmaster vs auth
+ * Category: Desktop client
  * Description: Check that drop/setMaster correctly transfer master state
  * Feature: core
+ * Functionality: permission management for clients
  * Run type: FULL
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
  *
  * SUBTEST:
  */
-- 
2.40.1
