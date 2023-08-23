Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBFA10E239
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 06:23:07 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com,
	igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 11:50:48 +0530
Message-Id: <20230823062049.1755138-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] xe/xe_sysfs: Update test documentation
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added missing category fields.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/xe/xe_sysfs_defaults.c  | 2 +-
 tests/xe/xe_sysfs_scheduler.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_sysfs_defaults.c b/tests/xe/xe_sysfs_defaults.c
index 0fc2918b6..a9d4d4f80 100644
--- a/tests/xe/xe_sysfs_defaults.c
+++ b/tests/xe/xe_sysfs_defaults.c
@@ -5,7 +5,7 @@
 
 /**
  * TEST: xe sysfs defaults
- * Category: Infrastructure
+ * Category: Software building block
  * Functionality: sysman defaults
  * Run type: FULL
  * Sub-category: sysman
diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.c
index 0315ce915..ec2190113 100644
--- a/tests/xe/xe_sysfs_scheduler.c
+++ b/tests/xe/xe_sysfs_scheduler.c
@@ -5,6 +5,7 @@
 
 /**
  * TEST: xe sysfs scheduler
+ * Category: Software building block
  * Sub-category: sysman
  * Functionality: scheduler control interface
  * Test category: functionality test
-- 
2.25.1
