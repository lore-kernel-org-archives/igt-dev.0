Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F2A10E1AD
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Oct 2023 05:58:57 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 Oct 2023 11:29:36 +0530
Message-Id: <20231010055940.41997-3-swati2.sharma@intel.com>
In-Reply-To: <20231010055940.41997-1-swati2.sharma@intel.com>
References: <20231010055940.41997-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 2/6] tests/kms_atomic: rename subtest
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
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
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
