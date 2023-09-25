Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B838010E265
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Sep 2023 14:25:48 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 25 Sep 2023 19:56:21 +0530
Message-Id: <20230925142621.479730-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/kms_psr2_su: fix
 igt_require_f() condition
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

The condition holds for display 13+ platforms. Fix that.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_psr2_su.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 321144d6b..834fec1ec 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -331,7 +331,7 @@ igt_main
 			      "Sink does not support PSR2\n");
 
 		igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 13,
-			      "Registers used by this test do not work on display 13\n");
+			      "Registers used by this test do not work on display 13+\n");
 
 		display_init(&data);
 
-- 
2.25.1
