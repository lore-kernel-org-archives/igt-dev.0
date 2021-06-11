Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4505B6EE7B
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 11:59:58 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 11 Jun 2021 17:19:38 +0530
Message-Id: <20210611114939.11009-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-7-venkata.sai.patnana@intel.com>
References: <20210611052005.303-7-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 07/17] tests/kms_addfb_basic: Add invalid
 buffer object test for discrete
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Add invalid buffer object test case for discrete, to validate
IOCTL_MODE_ADDFB2 ioctl for LMEM, the framebuffer backing
gem objects should be from local memory for discrete.

Cc: Latvala Petri <petri.latvala@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 tests/kms_addfb_basic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 1fb18d668f..85c14be505 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -40,6 +40,7 @@
 
 #include "igt_rand.h"
 #include "igt_device.h"
+#include "i915/intel_memory_region.h"
 
 uint32_t gem_bo;
 uint32_t gem_bo_small;
@@ -146,6 +147,23 @@ static void invalid_tests(int fd)
 		igt_assert(f.modifier[0] == 0);
 	}
 
+	igt_describe("Check if addfb2 with a system memory gem object "
+		     "fails correctly if device requires local memory framebuffers");
+	igt_subtest("invalid-smem-bo-on-discrete") {
+		int devid;
+		uint32_t handle, stride;
+		uint64_t size;
+
+		igt_require_intel(fd);
+		devid = intel_get_drm_devid(fd);
+		igt_require(gem_has_lmem(devid));
+		igt_calc_fb_size(fd, f.width, f.height,
+				DRM_FORMAT_XRGB8888, 0, &size, &stride);
+		handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
+		f.handles[0] = handle;
+		do_ioctl_err(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
+	}
+
 	igt_describe("Check if addfb2 call works for legacy formats");
 	igt_subtest("legacy-format") {
 		struct {
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
