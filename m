Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CF36F48E
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:52:43 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 20:10:21 +0530
Message-Id: <20210603144022.28176-22-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 22/23] tests/kms_addfb_basic: Add invalid
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, Petri <petri.latvala@intel.com>, Latvala@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Add invalid buffer object test case for discrete, to validate
IOCTL_MODE_ADDFB2 ioctl for LMEM, the framebuffer backing
gem objects should be from local memory for discrete.

v1: Add invalid-bo test case for LMEM framebuffer object
v2: Correcting error value comparing
v3: Addressed review comments <Petri>
v4: Using do_ioctl_err() for addfb2 ioctl <Petri>
v5: Addressed review comments <Modem, Bhanuprakash>
v6: Using size to allocate buffer object
v7: Updated error check value for testcase

Cc: Latvala, Petri <petri.latvala@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_addfb_basic.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 1fb18d668f..c2afa0703e 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -40,6 +40,7 @@
 
 #include "igt_rand.h"
 #include "igt_device.h"
+#include "i915/intel_memory_region.h"
 
 uint32_t gem_bo;
 uint32_t gem_bo_small;
@@ -146,6 +147,21 @@ static void invalid_tests(int fd)
 		igt_assert(f.modifier[0] == 0);
 	}
 
+	igt_subtest("invalid-smem-bo-on-discrete") {
+		int devid;
+		uint32_t handle, stride;
+		uint64_t size;
+
+		igt_require_intel(fd);
+		devid = intel_get_drm_devid(fd);
+		igt_require(HAS_LMEM(devid));
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
