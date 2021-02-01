Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E926E6E419
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Feb 2021 06:33:48 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon,  1 Feb 2021 08:33:39 +0200
Message-Id: <20210201063339.19874-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] meson: Turn off -Werror
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

No, we don't want all warnings ever to be errors. While being rid of
compile warnings (especially the more obscure ones from future
compilers) is great, having it on always is not acceptable. It's not
even on "by default", it was non-overrideably set on.

Not to mention adding -Werror to compiler flags is the incorrect way
of turning it on. Use the meson command line flag --werror instead on
whatever local checkout or company-internal fork you're using, where
you have control over which compilers are used. Turning it on
unconditionally in an upstream repository for all current and future
compilers is never ok.

This partially reverts commit e02612921a4e95aef3a368e7468f4337c9dcee7d.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 meson.build | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index 3f3693f9..f4ee14f1 100644
--- a/meson.build
+++ b/meson.build
@@ -51,21 +51,19 @@ cc_args = [
 	'-Wno-unused-parameter',
 	'-Wno-unused-result',
 
-	'-Waddress',
-	'-Warray-bounds',
-	'-Wimplicit',
-	'-Winit-self',
-	'-Wint-to-pointer-cast',
-	'-Wmain',
-	'-Wmissing-braces',
-	'-Wnonnull',
-	'-Wpointer-to-int-cast',
-	'-Wreturn-type',
-	'-Wsequence-point',
-	'-Wtrigraphs',
-	'-Wwrite-strings',
-
-	'-Werror',
+	'-Werror=address',
+	'-Werror=array-bounds',
+	'-Werror=implicit',
+	'-Werror=init-self',
+	'-Werror=int-to-pointer-cast',
+	'-Werror=main',
+	'-Werror=missing-braces',
+	'-Werror=nonnull',
+	'-Werror=pointer-to-int-cast',
+	'-Werror=return-type',
+	'-Werror=sequence-point',
+	'-Werror=trigraphs',
+	'-Werror=write-strings',
 # Disable the memory allocating builtins as they may cause unexpected behavior
 # with our framework. They *may* get optimized out in favor of a register or
 # stack variable, making them effectively local. Local variables do not play
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
