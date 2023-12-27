Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B33E10E0D6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Dec 2023 13:35:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t 4/4] tests/intel/kms_dirtyfb: Fix few fixtures
Date: Wed, 27 Dec 2023 19:00:20 +0530
Message-Id: <20231227133020.685916-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20231227133020.685916-1-bhanuprakash.modem@intel.com>
References: <20231227133020.685916-1-bhanuprakash.modem@intel.com>
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
List-ID: <igt-dev@lists.freedesktop.org>

As this test is expected that the driver must be atomic and
atleast one display panel connected, fix the igt_fixtures
accordingly.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 42fceb91c..7bf49cb15 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -304,11 +304,11 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		igt_require(data.display.is_atomic);
 
 		data.bops = buf_ops_create(data.drm_fd);
 		data.rendercopy = igt_get_render_copyfunc(intel_get_drm_devid(data.drm_fd));
-
-		igt_display_reset(&data.display);
 	}
 
 	for (data.feature = FEATURE_DEFAULT; data.feature > 0;
-- 
2.40.0
