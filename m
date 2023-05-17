Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFF810E3D9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:03:18 +0530
Message-Id: <20230517063323.4146387-77-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 76/81] tests/kms_universal_plane: Document each
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_universal_plane.c | 67 +++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 635a136ab..c7344477d 100644
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


