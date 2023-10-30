Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A3210E0F9
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 16:44:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 22:04:58 +0530
Message-Id: <20231030163458.4101383-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/intel/kms_ccs: Avoid i915 calls on XE device
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

For XE device, use XE specific APIs to create the BO.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/812
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_ccs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 09b98fbec..64489b7a3 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -33,6 +33,7 @@
 
 #include "i915/gem_create.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 /**
  * SUBTEST: %s-%s-%s
@@ -431,7 +432,10 @@ static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plan
 
 	/* Put the CCS buffer on a different BO. */
 	if (data->flags & TEST_BAD_CCS_HANDLE) {
-		bad_ccs_bo = gem_create(data->drm_fd, fb.size);
+		bad_ccs_bo = is_i915_device(data->drm_fd) ?
+				gem_create(data->drm_fd, fb.size) :
+				xe_bo_create_flags(data->drm_fd, 0, fb.size,
+						   visible_vram_if_possible(data->drm_fd, 0));;
 		f.handles[ccs_plane] = bad_ccs_bo;
 	}
 
-- 
2.40.0
