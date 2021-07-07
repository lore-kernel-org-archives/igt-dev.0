Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed,  7 Jul 2021 11:52:38 +0100
Message-Id: <20210707105238.1694091-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: pass the actual fd
 to gem_has_lmem
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, intel-gfx@lists.freedesktop.org, Latvala Petri <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Currently we pass the devid as if it were the fd, which doesn't work.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: Latvala Petri <petri.latvala@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 tests/kms_addfb_basic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 91fb6ac9..eff1d9b2 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -150,13 +150,11 @@ static void invalid_tests(int fd)
 	igt_describe("Check if addfb2 with a system memory gem object "
 		     "fails correctly if device requires local memory framebuffers");
 	igt_subtest("invalid-smem-bo-on-discrete") {
-		int devid;
 		uint32_t handle, stride;
 		uint64_t size;
 
 		igt_require_intel(fd);
-		devid = intel_get_drm_devid(fd);
-		igt_require(gem_has_lmem(devid));
+		igt_require(gem_has_lmem(fd));
 		igt_calc_fb_size(fd, f.width, f.height,
 				DRM_FORMAT_XRGB8888, 0, &size, &stride);
 		handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
-- 
2.26.3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
