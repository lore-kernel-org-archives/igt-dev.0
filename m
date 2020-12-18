Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 18 Dec 2020 08:49:39 +0000
Message-Id: <20201218084939.1767210-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_perf: Request CLOCK_MONOTONIC when
 opening events
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Ask for CLOCK_MONOTONIC which is more stable than the default perf clock.

(Ability to select a clock has been available since kernel version 4.1.)

The change should not have any significant impact on the IGT as whole
apart from maybe improving the occasional jitter in tests/tools which use
nanosleep(2) and use time slept together with perf reported time delta
either in direct or indirect calculations.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_perf.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index 418c1c18891c..b743859f5d29 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -1,12 +1,13 @@
-#include <stdint.h>
+#include <errno.h>
 #include <fcntl.h>
-#include <unistd.h>
+#include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
-#include <errno.h>
 #include <sys/stat.h>
 #include <sys/sysinfo.h>
 #include <sys/sysmacros.h>
+#include <time.h>
+#include <unistd.h>
 
 #include "igt_perf.h"
 
@@ -111,6 +112,8 @@ _perf_open(uint64_t type, uint64_t config, int group, uint64_t format)
 
 	attr.read_format = format;
 	attr.config = config;
+	attr.use_clockid = 1;
+	attr.clockid = CLOCK_MONOTONIC;
 
 	do {
 		ret = perf_event_open(&attr, -1, cpu++, group, 0);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
