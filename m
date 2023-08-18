Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE0610E445
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 05:09:52 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Fri, 18 Aug 2023 10:41:52 +0530
Message-Id: <20230818051152.2439611-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Improve test
 documentation
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add missing category, sub-category and functionality fields.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/core_hotunplug.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 4d6a721f0..30d9a6a57 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -45,44 +45,60 @@
  * Feature: SMI, core
  *
  * SUBTEST: hotrebind
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: device hotplug
  * Description:
  *   Check if the driver can be cleanly rebound to a device with a still open hot unbound driver
  *   instance
- * Functionality: device hotplug
  * Run type: FULL
- * Test category: SysMan
  *
  * SUBTEST: hotrebind-lateclose
- * Description: Check if a hot unbound driver instance still open after hot rebind can be cleanly released
+ * Category: Software building block
+ * Sub-category: driver
  * Functionality: device hotplug
+ * Description: Check if a hot unbound driver instance still open after hot rebind can be cleanly released
  * Run type: FULL
- * Test category: SysMan
  *
  * SUBTEST: hotreplug
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: device hotplug
  * Description: Check if a hot unplugged and still open device can be cleanly restored
  * Run type: FULL
  *
  * SUBTEST: hotreplug-lateclose
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: device hotplug
  * Description: Check if an instance of a still open while hot replugged device can be cleanly released
  * Run type: FULL
  *
  * SUBTEST: hotunbind-rebind
- * Description: Check if the driver can be cleanly unbound from an open device, then released and rebound
+ * Category: Software building block
+ * Sub-category: driver
  * Functionality: device hotplug
+ * Description: Check if the driver can be cleanly unbound from an open device, then released and rebound
  * Run type: FULL
- * Test category: SysMan
  *
  * SUBTEST: hotunplug-rescan
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: device hotplug
  * Description: Check if an open device can be cleanly unplugged, then released and restored
  * Run type: FULL
  *
  * SUBTEST: unbind-rebind
- * Description: Check if the driver can be cleanly unbound from a device believed to be closed, then rebound
+ * Category: Software building block
+ * Sub-category: driver
  * Functionality: device hotplug
+ * Description: Check if the driver can be cleanly unbound from a device believed to be closed, then rebound
  * Run type: BAT
- * Test category: SysMan
  *
  * SUBTEST: unplug-rescan
+ * Category: Software building block
+ * Sub-category: driver
+ * Functionality: device hotplug
  * Description: Check if a device believed to be closed can be cleanly unplugged, then restored
  * Run type: FULL
  */
-- 
2.25.1
