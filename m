Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570EE6E271
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 14:13:13 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 19 May 2020 15:12:52 +0100
Message-Id: <20200519141252.2032914-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200519141252.2032914-1-chris@chris-wilson.co.uk>
References: <20200519141252.2032914-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib: Remove early
 has_known_intel_chipset() check
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

When opening a specific driver, open that driver. Once we have the
device fd, we can then do feature checks that the tests *actually*
require.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Acked-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/drmtest.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 040ca39c2..70fd64c95 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -118,24 +118,6 @@ bool is_vc4_device(int fd)
 	return __is_device(fd, "vc4");
 }
 
-static bool has_known_intel_chipset(int fd)
-{
-	struct drm_i915_getparam gp;
-	int devid = 0;
-
-	memset(&gp, 0, sizeof(gp));
-	gp.param = I915_PARAM_CHIPSET_ID;
-	gp.value = &devid;
-
-	if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp)))
-		return false;
-
-	if (!intel_gen(devid))
-		return false;
-
-	return true;
-}
-
 static char _forced_driver[16] = "";
 
 /**
@@ -636,7 +618,7 @@ void igt_require_amdgpu(int fd)
 
 void igt_require_intel(int fd)
 {
-	igt_require(is_i915_device(fd) && has_known_intel_chipset(fd));
+	igt_require(is_i915_device(fd));
 }
 
 void igt_require_vc4(int fd)
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
