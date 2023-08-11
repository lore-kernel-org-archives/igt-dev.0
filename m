Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFB910E6F1
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:56:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:50 +0530
Message-Id: <20230811184655.157060-77-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 76/81] tests/kms_universal_plane: Document each
 subtest for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Fix test description

Cc: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_universal_plane.c | 68 +++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 957d600f1..a23a0d8cd 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -28,6 +28,74 @@
 #include <string.h>
 #include <fcntl.h>
 
+/**
+ * TEST: kms universal plane
+ * Category: Display
+ * Description: Check pageflip & modeset on universal plane
+ *
+ * SUBTEST: cursor-fb-leak-pipe-%s
+ * Description: Check for cursor leaks after performing cursor operations on %arg[1]
+ * Driver requirement: any
+ * Functionality: cursor, plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: disable-primary-vs-flip-pipe-%s
+ * Description: Check pageflips while primary plane is disabled before IOCTL or
+ *              between IOCTL and pageflip execution on %arg[1]
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: universal-plane-pageflip-windowed-pipe-%s
+ * Description: Check if pageflip succeeds in windowed setting on %arg[1]
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @A:    pipe A
+ * @B:    pipe B
+ * @C:    pipe C
+ * @D:    pipe D
+ * @E:    pipe E
+ * @F:    pipe F
+ * @G:    pipe G
+ * @H:    pipe H
+ */
+
+/**
+ * SUBTEST: universal-plane-pipe-%s-%s
+ * Description: Check %arg[2] on %arg[1]
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @A:    pipe A
+ * @B:    pipe B
+ * @C:    pipe C
+ * @D:    pipe D
+ * @E:    pipe E
+ * @F:    pipe F
+ * @G:    pipe G
+ * @H:    pipe H
+ *
+ * arg[2]:
+ *
+ * @functional: the switching between different primary plane fbs with CRTC off
+ * @sanity:     for scale-up or scale-down using universal plane API without
+ *              covering CRTC
+ */
 
 typedef struct {
 	int drm_fd;
-- 
2.40.0
