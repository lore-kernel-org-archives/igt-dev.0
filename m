Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 27 May 2021 20:02:26 +0530
Message-Id: <20210527143226.25548-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/4] [RFC] tests/kms_prime: Aligned pitch to 64
 byte for Intel platforms
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
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

For Intel platforms, pitch needs to be 64 byte aligned.
Kernel code vgem_gem_dumb_create which is platform generic code
doesnt do the alignment. This causes frame buffer creation to fail
on Intel platforms where the pitch is not 64 byte aligned.

tests: test run on Intel platforms with panel resolution 1366x768

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
Change-Id: Ie8f938b9672127537f433a5674b60e88275cc2c7
---
 tests/kms_prime.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 8cb2ca2a9dc3..fdc941fe8100 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -51,6 +51,8 @@ static struct {
 	{ .r = 1.0, .g = 0.0, .b = 0.0, .color = 0xffff0000 },
 };
 
+bool check_platform;
+
 IGT_TEST_DESCRIPTION("Prime tests, focusing on KMS side");
 
 static bool has_prime_import(int fd)
@@ -101,7 +103,7 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 	scratch->bpp = 32;
 
 	scratch->handle = kmstest_dumb_create(exporter_fd,
-			scratch->width,
+			check_platform? ALIGN(scratch->width, 64): scratch->width,
 			scratch->height,
 			scratch->bpp,
 			&scratch->pitch,
@@ -262,6 +264,7 @@ igt_main
 
 		/* ANY = anything that is not VGEM */
 		first_fd = __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
+		check_platform = is_i915_device(first_fd);
 		igt_require(first_fd >= 0);
 
 		second_fd = __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
