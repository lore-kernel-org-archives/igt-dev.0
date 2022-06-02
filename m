Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD0B112BC7
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jun 2022 08:22:43 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Thu,  2 Jun 2022 10:22:22 +0200
Message-Id: <20220602082224.387953-2-ryszard.knop@intel.com>
In-Reply-To: <20220602082224.387953-1-ryszard.knop@intel.com>
References: <20220602082224.387953-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/drm_read: pthread_yield ->
 sched_yield
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

pthread_yield is deprecated, use the standard sched_yield instead.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 tests/drm_read.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/drm_read.c b/tests/drm_read.c
index 3186e609..250806d2 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -44,6 +44,7 @@
 #include <sys/time.h>
 #include <sys/poll.h>
 #include <pthread.h>
+#include <sched.h>
 #include "drm.h"
 
 IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
@@ -221,7 +222,7 @@ static void test_short_buffer_wakeup(int in, enum pipe pipe)
 		pthread_mutex_unlock(&w.mutex);
 
 		/* Give each thread a chance to sleep in drm_read() */
-		pthread_yield();
+		sched_yield();
 
 		/* One event should wake all threads as none consume */
 		generate_event(w.fd, pipe);
-- 
2.36.1
