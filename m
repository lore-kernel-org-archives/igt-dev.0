Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B5210E4AB
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 05:18:58 +0000 (UTC)
From: pallavi.mishra@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Date: Wed, 29 Mar 2023 10:58:47 +0530
Message-Id: <20230329052848.1076928-2-pallavi.mishra@intel.com>
In-Reply-To: <20230329052848.1076928-1-pallavi.mishra@intel.com>
References: <20230329052848.1076928-1-pallavi.mishra@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] [PATCH i-g-t] tests/i915: Increase timeout
 for GuC submission
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

From: Pallavi Mishra <pallavi.mishra@intel.com>

Increase reset timeout as resets can take a bit longer with GuC
submission because an error capture is done and with a large GuC log
(16MB) these take a while.

Co-authored-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 tests/i915/sysfs_heartbeat_interval.c | 2 +-
 tests/i915/sysfs_timeslice_duration.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index 8cebf627..8a3dd397 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -43,7 +43,7 @@
 #include "sw_sync.h"
 
 #define ATTR "heartbeat_interval_ms"
-#define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for kworker */
+#define RESET_TIMEOUT 1000 /* milliseconds, long enough for error capture */
 
 static bool __enable_hangcheck(int dir, bool state)
 {
diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
index 80d34285..c23424c6 100644
--- a/tests/i915/sysfs_timeslice_duration.c
+++ b/tests/i915/sysfs_timeslice_duration.c
@@ -44,7 +44,7 @@
 #include "sw_sync.h"
 
 #define ATTR "timeslice_duration_ms"
-#define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for kworker */
+#define RESET_TIMEOUT 1000 /* milliseconds, long enough for error capture */
 
 static bool __enable_hangcheck(int dir, bool state)
 {
-- 
2.25.1
