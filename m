Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C7710E496
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 16:14:04 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Jul 2023 21:44:00 +0530
Message-Id: <20230726161400.900442-2-swati2.sharma@intel.com>
In-Reply-To: <20230726161400.900442-1-swati2.sharma@intel.com>
References: <20230726161400.900442-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/intel-ci: blocklist hang and
 tiling tests
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

Hang and tiling tests are not enabled yet. Blocklist
these tests till we have feature supported.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 02edeb6b6..b40dd4f70 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -64,7 +64,7 @@ igt@kms_busy@.*
 igt@kms_psr@.*_mmap_(cpu|gtt)
 igt@kms_legacy_colorkey@basic
 igt@kms_legacy_colorkey@invalid-plane
-igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf)tile-.*
+igt@kms_flip_scaled_crc@flip-(32|64)bpp-(4|x|y|yf|tileccs)tile-.*
 igt@kms_big_fb@(4|x|y|yf)-tiled-.*
 igt@kms_flip@2x-flip-vs-fences
 igt@kms_flip@flip-vs-fences(-interruptible)
@@ -79,6 +79,7 @@ igt@kms_rotation_crc@exhaust-fences
 igt@kms_force_connector_basic@force-load-detect
 igt@kms_getfb@.*-ccs
 igt@kms_plane_lowres@tiling-(4|x|y|yf)
+igt@kms_.*@.*hang.*
 ##################################################################
 igt@xe_sysfs*
 ##################################################################
-- 
2.25.1
