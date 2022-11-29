Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F358C10E1D1
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 18:41:21 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 15:40:36 -0300
Message-Id: <20221129184038.72946-6-mcanal@igalia.com>
In-Reply-To: <20221129184038.72946-1-mcanal@igalia.com>
References: <20221129184038.72946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 5/7] lib/igt_v3d: Add PAGE_SIZE macro to
 V3D
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Some V3D tests use the page memory size, so create a macro to define the
page size as 4096 and replace this value for the macro in the V3D tests.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.h                 | 2 ++
 tests/v3d/v3d_get_bo_offset.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index 20429951..202c5e22 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -26,6 +26,8 @@
 
 #include "v3d_drm.h"
 
+#define PAGE_SIZE 4096
+
 struct v3d_bo {
 	int handle;
 	uint32_t offset;
diff --git a/tests/v3d/v3d_get_bo_offset.c b/tests/v3d/v3d_get_bo_offset.c
index f0318016..5c208f94 100644
--- a/tests/v3d/v3d_get_bo_offset.c
+++ b/tests/v3d/v3d_get_bo_offset.c
@@ -37,8 +37,8 @@ igt_main
 		     "the same as the offset returned by the IOCTL");
 	igt_subtest("create-get-offsets") {
 		struct v3d_bo *bos[2] = {
-			igt_v3d_create_bo(fd, 4096),
-			igt_v3d_create_bo(fd, 4096),
+			igt_v3d_create_bo(fd, PAGE_SIZE),
+			igt_v3d_create_bo(fd, PAGE_SIZE),
 		};
 		uint32_t offsets[2] = {
 			igt_v3d_get_bo_offset(fd, bos[0]->handle),
-- 
2.38.1
