Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB4410E1FF
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 07:53:44 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 13:24:07 +0530
Message-Id: <20230918075411.247122-3-swati2.sharma@intel.com>
In-Reply-To: <20230918075411.247122-1-swati2.sharma@intel.com>
References: <20230918075411.247122-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/kms_atomic: rename subtest
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

Follow IGT rules, to use '-' instead of '_' for subtest naming.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 951014685..f984d34f0 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1170,7 +1170,7 @@ static void atomic_invalid_params(igt_pipe_t *pipe,
 }
 
 /**
- * SUBTEST: atomic_plane_damage
+ * SUBTEST: atomic-plane-damage
  * Description: Simple test cases to use FB_DAMAGE_CLIPS plane property
  * Driver requirement: i915, xe
  * Functionality: kms_core, plane
@@ -1550,7 +1550,7 @@ igt_main
 	}
 
 	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
-	igt_subtest("atomic_plane_damage") {
+	igt_subtest("atomic-plane-damage") {
 		igt_require(igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS));
 
 		atomic_setup(&display, pipe, output, primary, &fb);
-- 
2.25.1
