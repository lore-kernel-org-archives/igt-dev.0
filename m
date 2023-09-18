Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E7810E249
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 09:50:04 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 15:20:33 +0530
Message-Id: <20230918095033.257372-3-swati2.sharma@intel.com>
In-Reply-To: <20230918095033.257372-1-swati2.sharma@intel.com>
References: <20230918095033.257372-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_universal_plane: update
 testplan doc
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

After converting tests to dynamic subtests, hardcoded pipe
names are removed. Update testplan documentation accordingly.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_universal_plane.c | 38 ++++++++-----------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 45278916d..85d986456 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -33,43 +33,32 @@
  * Category: Display
  * Description: Check pageflip & modeset on universal plane
  *
- * SUBTEST: cursor-fb-leak-pipe-%s
- * Description: Check for cursor leaks after performing cursor operations on %arg[1]
+ * SUBTEST: cursor-fb-leak
+ * Description: Check for cursor leaks after performing cursor operations
  * Driver requirement: i915, xe
  * Functionality: cursor, plane
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: disable-primary-vs-flip-pipe-%s
+ * SUBTEST: disable-primary-vs-flip
  * Description: Check pageflips while primary plane is disabled before IOCTL or
- *              between IOCTL and pageflip execution on %arg[1]
+ *              between IOCTL and pageflip execution
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: universal-plane-pageflip-windowed-pipe-%s
- * Description: Check if pageflip succeeds in windowed setting on %arg[1]
+ * SUBTEST: universal-plane-pageflip-windowed
+ * Description: Check if pageflip succeeds in windowed setting
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:    pipe A
- * @B:    pipe B
- * @C:    pipe C
- * @D:    pipe D
- * @E:    pipe E
- * @F:    pipe F
- * @G:    pipe G
- * @H:    pipe H
  */
 
 /**
- * SUBTEST: universal-plane-pipe-%s-%s
- * Description: Check %arg[2] on %arg[1]
+ * SUBTEST: universal-plane-%s
+ * Description: Check %arg[1]
  * Driver requirement: i915, xe
  * Functionality: plane
  * Mega feature: General Display Features
@@ -77,17 +66,6 @@
  *
  * arg[1]:
  *
- * @A:    pipe A
- * @B:    pipe B
- * @C:    pipe C
- * @D:    pipe D
- * @E:    pipe E
- * @F:    pipe F
- * @G:    pipe G
- * @H:    pipe H
- *
- * arg[2]:
- *
  * @functional: the switching between different primary plane fbs with CRTC off
  * @sanity:     for scale-up or scale-down using universal plane API without
  *              covering CRTC
-- 
2.25.1
