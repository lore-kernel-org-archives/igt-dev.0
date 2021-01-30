Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16376EC87
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Jan 2021 06:44:25 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 29 Jan 2021 22:44:21 -0800
Message-Id: <20210130064421.30389-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] meson: Turn on -Werror
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

We can choose which compile warnings to enable, but once they are enabled
treat all warnings as error. This enforces stricter checks against compile
warnings creeping in.

v2: Fix redefinition warning errors from i915/gem_userptr_blits

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 meson.build                    | 28 +++++++++++++++-------------
 tests/i915/gem_userptr_blits.c |  2 --
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index f4ee14f14a..3f3693f99d 100644
--- a/meson.build
+++ b/meson.build
@@ -51,19 +51,21 @@ cc_args = [
 	'-Wno-unused-parameter',
 	'-Wno-unused-result',
 
-	'-Werror=address',
-	'-Werror=array-bounds',
-	'-Werror=implicit',
-	'-Werror=init-self',
-	'-Werror=int-to-pointer-cast',
-	'-Werror=main',
-	'-Werror=missing-braces',
-	'-Werror=nonnull',
-	'-Werror=pointer-to-int-cast',
-	'-Werror=return-type',
-	'-Werror=sequence-point',
-	'-Werror=trigraphs',
-	'-Werror=write-strings',
+	'-Waddress',
+	'-Warray-bounds',
+	'-Wimplicit',
+	'-Winit-self',
+	'-Wint-to-pointer-cast',
+	'-Wmain',
+	'-Wmissing-braces',
+	'-Wnonnull',
+	'-Wpointer-to-int-cast',
+	'-Wreturn-type',
+	'-Wsequence-point',
+	'-Wtrigraphs',
+	'-Wwrite-strings',
+
+	'-Werror',
 # Disable the memory allocating builtins as they may cause unexpected behavior
 # with our framework. They *may* get optimized out in favor of a register or
 # stack variable, making them effectively local. Local variables do not play
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 2f3954c5d6..31bca3b78f 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -55,8 +55,6 @@
 #include <pthread.h>
 #include <time.h>
 
-#include <linux/memfd.h>
-
 #include "drm.h"
 #include "i915_drm.h"
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
