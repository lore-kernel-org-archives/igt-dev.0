Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E5610E28B
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Nov 2023 08:30:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Tue, 21 Nov 2023 13:50:47 +0530
Message-Id: <20231121082047.2037754-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/intel/kms_psr: Use blitter if rendercopy
 isn't present
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

As Rendercopy support in IGT is not present for few latest
platforms. So, fallback to use Blitter if Rendercopy isn't
present.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 6b80f6f4b..afd74eaff 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -957,7 +957,7 @@ igt_main
 				igt_display_reset(&data.display);
 				data.output = output;
 				igt_dynamic_f("%s", data.output->name) {
-					data.op = RENDER;
+					data.op = igt_get_render_copyfunc(data.devid) ? RENDER : BLT;
 					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 					test_setup(&data);
 					dpms_off_on(&data);
-- 
2.40.0
