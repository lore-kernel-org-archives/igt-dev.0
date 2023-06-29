Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A8210E417
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:57:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:19:05 +0530
Message-Id: <20230629144910.3055377-77-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 76/81] tests/kms_universal_plane: Document each
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_universal_plane.c | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 957d600f1..358b7ae18 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -28,6 +28,73 @@
 #include <string.h>
 #include <fcntl.h>
 
+/**
+ * TEST: kms universal plane
+ * Category: Display
+ *
+ * SUBTEST: cursor-fb-leak-pipe-%s
+ * Description: Check for cursor leaks after performing cursor operations
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: disable-primary-vs-flip-pipe-%s
+ * Description: Check pageflips while primary plane is disabled before IOCTL or
+ *              between IOCTL and pageflip execution
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: universal-plane-pageflip-windowed-pipe-%s
+ * Description: Check if pageflip succeeds in windowed setting
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @A:
+ * @B:
+ * @C:
+ * @D:
+ * @E:
+ * @F:
+ * @G:
+ * @H:
+ */
+
+/**
+ * SUBTEST: universal-plane-pipe-%s-%s
+ * Description: Check %arg[1]
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @A:
+ * @B:
+ * @C:
+ * @D:
+ * @E:
+ * @F:
+ * @G:
+ * @H:
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
