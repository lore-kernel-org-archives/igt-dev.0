Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Feb 2020 09:41:33 +0000
Message-Id: <20200220094134.1560435-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200220094134.1560435-1-chris@chris-wilson.co.uk>
References: <20200220094134.1560435-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] igt/kms_flip_tiling: Check GEM
 availability before use
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We use the GPU to convert between tiling formats, indirectly via the
call to igt_create_pattern_fb. So before we try and execute commands on
the GPU, we should check that the GPU is available.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/kms_flip_tiling.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
index 17cf816de..1465e73a1 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -154,6 +154,7 @@ igt_main
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.gen = intel_gen(intel_get_drm_devid(data.drm_fd));
+		igt_require_gem(data.drm_fd);
 
 		data.testformat = DRM_FORMAT_XRGB8888;
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
