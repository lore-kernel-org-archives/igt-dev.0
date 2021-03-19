Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230826E9AD
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 12:43:13 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Fri, 19 Mar 2021 18:03:17 +0530
Message-Id: <20210319123317.118694-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t,
 v3] tests/kms_content_protection: Initialize fb height width to 0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

While requesting for framebuffer height and width should be in
kernel expected limit. As the test is not initializing height
and width to 0 garbage framebuffer size is getting requested and
fails. Addressed same, initalizing height and width to 0.

"Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3144"
"Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3137"

Changes since V2:
	- Add bug close notes to commit message
Changes since V1:
	- Added igt_display_require_output(&data.display)
	- Removed extra newlines

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/kms_content_protection.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 0c2173fb..0fdbacdd 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -707,7 +707,7 @@ static void test_content_protection_cleanup(void)
 static void create_fbs(void)
 {
 	igt_output_t *output;
-	int width, height;
+	int width = 0, height = 0;
 	drmModeModeInfo *mode;
 
 	for_each_connected_output(&data.display, output) {
@@ -730,9 +730,8 @@ igt_main
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-
 		igt_display_require(&data.display, data.drm_fd);
-
+		igt_display_require_output(&data.display);
 		create_fbs();
 	}
 
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
