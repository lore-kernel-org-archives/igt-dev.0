Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D6610E60C
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 08:12:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms: fix pixel format functionality
Date: Wed, 17 Jan 2024 13:44:16 +0530
Message-Id: <20240117081416.234172-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Pixel format functionality is used in different ways. Align all.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_psr2_su.c  | 2 +-
 tests/kms_pipe_crc_basic.c | 2 +-
 tests/kms_plane.c          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 96b4fd2b4..936b5beb3 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -47,7 +47,7 @@
  *
  * SUBTEST: page_flip-%s
  * Description: Test the selective update with %arg[1] when screen changes
- * Functionality: pixel-format, psr2, selective_update
+ * Functionality: pixel_formats, psr2, selective_update
  *
  * arg[1]:
  *
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 3c12d8098..0c19745bc 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -68,7 +68,7 @@
 /**
  * SUBTEST: compare-crc-sanitycheck-%s
  * Description: Basic sanity check for CRC mismatches with %arg[1]
- * Functionality: crc, pixel_format
+ * Functionality: crc, pixel_formats
  *
  * arg[1]:
  *
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 51ca082ae..406aecc04 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -44,7 +44,7 @@
 /**
  * SUBTEST: planar-pixel-format-settings
  * Description: verify planar settings for pixel format are handled correctly
- * Functionality: pixel_format, plane
+ * Functionality: pixel_formats, plane
  *
  * SUBTEST: plane-position-%s
  * Description: Verify plane position using two planes to create a %arg[1]
@@ -80,7 +80,7 @@
 /**
  * SUBTEST: pixel-%s
  * Description: verify the pixel formats for given plane and pipe
- * Functionality: pixel_format, plane
+ * Functionality: pixel_formats, plane
  *
  * arg[1]:
  *
-- 
2.25.1


