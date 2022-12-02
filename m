Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8C710E700
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Dec 2022 15:43:10 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Dec 2022 12:42:25 -0300
Message-Id: <20221202154228.45766-3-mcanal@igalia.com>
In-Reply-To: <20221202154228.45766-1-mcanal@igalia.com>
References: <20221202154228.45766-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/5] tests/vc4: Remove unused or
 redundant includes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The VC4 test files contain some includes that aren't required for
compilation: some includes are simply not used and others are included
through other headers. Simplify the code by removing unused includes.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_vc4.c                | 14 --------------
 lib/igt_vc4.h                |  2 ++
 tests/vc4/vc4_create_bo.c    | 10 ----------
 tests/vc4/vc4_dmabuf_poll.c  | 10 ----------
 tests/vc4/vc4_label_bo.c     | 11 -----------
 tests/vc4/vc4_lookup_fail.c  | 10 ----------
 tests/vc4/vc4_purgeable_bo.c | 10 ----------
 tests/vc4/vc4_tiling.c       | 11 -----------
 tests/vc4/vc4_wait_bo.c      |  9 ---------
 tests/vc4/vc4_wait_seqno.c   | 11 +----------
 10 files changed, 3 insertions(+), 95 deletions(-)

diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
index 4415fa32..54718cee 100644
--- a/lib/igt_vc4.c
+++ b/lib/igt_vc4.c
@@ -21,25 +21,11 @@
  * IN THE SOFTWARE.
  */
 
-#include <assert.h>
-#include <string.h>
-#include <signal.h>
-#include <errno.h>
-#include <sys/mman.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <fcntl.h>
-
 #include "drmtest.h"
 #include "igt_aux.h"
-#include "igt_core.h"
 #include "igt_fb.h"
 #include "igt_vc4.h"
 #include "ioctl_wrappers.h"
-#include "intel_reg.h"
-#include "intel_chipset.h"
-#include "vc4_drm.h"
 #include "vc4_packet.h"
 
 #if NEW_CONTEXT_PARAM_NO_ERROR_CAPTURE_API
diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
index f32bf398..a088d0a3 100644
--- a/lib/igt_vc4.h
+++ b/lib/igt_vc4.h
@@ -24,6 +24,8 @@
 #ifndef IGT_VC4_H
 #define IGT_VC4_H
 
+#include "vc4_drm.h"
+
 uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
 int igt_vc4_create_bo(int fd, size_t size);
 void *igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
index 99d180a8..46d1c954 100644
--- a/tests/vc4/vc4_create_bo.c
+++ b/tests/vc4/vc4_create_bo.c
@@ -23,16 +23,6 @@
 
 #include "igt.h"
 #include "igt_vc4.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include "vc4_drm.h"
 
 igt_main
 {
diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
index 260e30c3..da99964b 100644
--- a/tests/vc4/vc4_dmabuf_poll.c
+++ b/tests/vc4/vc4_dmabuf_poll.c
@@ -23,17 +23,7 @@
 
 #include "igt.h"
 #include "igt_vc4.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include <poll.h>
-#include "vc4_drm.h"
 
 static void
 poll_write_bo_test(int fd, int poll_flag)
diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
index 7510f87d..6fc53ce8 100644
--- a/tests/vc4/vc4_label_bo.c
+++ b/tests/vc4/vc4_label_bo.c
@@ -23,17 +23,6 @@
 
 #include "igt.h"
 #include "igt_vc4.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <poll.h>
-#include "vc4_drm.h"
 
 static void
 set_label(int fd, int handle, const char *name, int err)
diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
index f0234ee5..e5a03540 100644
--- a/tests/vc4/vc4_lookup_fail.c
+++ b/tests/vc4/vc4_lookup_fail.c
@@ -22,16 +22,6 @@
  */
 
 #include "igt.h"
-#include <assert.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
 #include "vc4_drm.h"
 #include "vc4_packet.h"
 
diff --git a/tests/vc4/vc4_purgeable_bo.c b/tests/vc4/vc4_purgeable_bo.c
index d9f7547f..676bc1f3 100644
--- a/tests/vc4/vc4_purgeable_bo.c
+++ b/tests/vc4/vc4_purgeable_bo.c
@@ -23,17 +23,7 @@
 
 #include "igt.h"
 #include "igt_vc4.h"
-#include <unistd.h>
 #include <signal.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include "vc4_drm.h"
 
 struct igt_vc4_bo {
 	struct igt_list_head node;
diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
index b96fe4ad..0d37c8b1 100644
--- a/tests/vc4/vc4_tiling.c
+++ b/tests/vc4/vc4_tiling.c
@@ -23,17 +23,6 @@
 
 #include "igt.h"
 #include "igt_vc4.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <poll.h>
-#include "vc4_drm.h"
 
 igt_main
 {
diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
index 65a085a3..8c7437f8 100644
--- a/tests/vc4/vc4_wait_bo.c
+++ b/tests/vc4/vc4_wait_bo.c
@@ -23,16 +23,7 @@
 
 #include "igt.h"
 #include "igt_vc4.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
-#include "vc4_drm.h"
 
 static void
 test_used_bo(int fd, uint64_t timeout)
diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
index bcc263cb..61485bbf 100644
--- a/tests/vc4/vc4_wait_seqno.c
+++ b/tests/vc4/vc4_wait_seqno.c
@@ -22,16 +22,7 @@
  */
 
 #include "igt.h"
-#include <unistd.h>
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <fcntl.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include "vc4_drm.h"
+#include "igt_vc4.h"
 
 igt_main
 {
-- 
2.38.1
