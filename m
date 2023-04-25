Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FED10E6BB
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 06:54:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:19:34 +0530
Message-Id: <20230425064953.2121947-22-bhanuprakash.modem@intel.com>
In-Reply-To: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
References: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 21/40] tests/i915/kms_mmap_write_crc: Add XE
 support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_mmap_write_crc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index 4f7a86bf4..bc51975f6 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -102,7 +102,7 @@ static void test(data_t *data)
 	igt_plane_set_fb(data->primary, &data->fb[0]);
 	igt_display_commit(display);
 
-	if (!gem_has_lmem(data->drm_fd)) {
+	if (is_i915_device(data->drm_fd) && !gem_has_lmem(data->drm_fd)) {
 		uint32_t caching;
 
 		/* make sure caching mode has become UC/WT */
@@ -259,7 +259,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 	enum pipe pipe;
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
 
-- 
2.40.0
