Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A7089D99
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 21:42:26 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Wed, 29 Jan 2020 13:41:16 -0800
Message-Id: <20200129214116.29107-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_largeobject: Skip when
 aperture is not supported
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rearrange code to allocate buffer after aperture check.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/i915/gem_largeobject.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_largeobject.c b/tests/i915/gem_largeobject.c
index fc9296cd..ded00f07 100644
--- a/tests/i915/gem_largeobject.c
+++ b/tests/i915/gem_largeobject.c
@@ -77,11 +77,12 @@ igt_simple_main
 {
 	int fd;
 
+	fd = drm_open_driver(DRIVER_INTEL);
+	gem_require_mappable_ggtt(fd);
+
 	data = malloc(OBJ_SIZE);
 	igt_assert(data);
 
-	fd = drm_open_driver(DRIVER_INTEL);
-
 	test_large_object(fd);
 
 	free(data);
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
