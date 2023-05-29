Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3061F10E0A9
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 11:30:54 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 17:08:09 +0530
Message-Id: <20230529113809.5538-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_vrr: Increase time test
 measurement step runs to ~7 seconds
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

Increase time test measurement step runs to ~7 seconds.
This gives a decent sample size + enough time for any
adaptation to occur if necessary.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_vrr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d2d79c4eb..9b909e21f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -28,10 +28,10 @@
 #define NSECS_PER_SEC (1000000000ull)
 
 /*
- * Each test measurement step runs for ~5 seconds.
+ * Each test measurement step runs for ~7 seconds.
  * This gives a decent sample size + enough time for any adaptation to occur if necessary.
  */
-#define TEST_DURATION_NS (5000000000ull)
+#define TEST_DURATION_NS (7000000000ull)
 
 #define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x"
 #define DRM_MODE_ARG(m) \
-- 
2.39.0
