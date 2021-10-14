Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38856E8AC
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 08:19:48 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 14 Oct 2021 10:19:16 +0200
Message-Id: <20211014081917.15977-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211014081917.15977-1-zbigniew.kempczynski@intel.com>
References: <20211014081917.15977-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/7] benchmarks/gem_exec_fault: Add timeout
 argument
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add timeout argument and change elapsed time to inner loop to
be more precise in timeout processing.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 benchmarks/gem_exec_fault.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/benchmarks/gem_exec_fault.c b/benchmarks/gem_exec_fault.c
index d53fab964..fe940b44c 100644
--- a/benchmarks/gem_exec_fault.c
+++ b/benchmarks/gem_exec_fault.c
@@ -49,6 +49,7 @@
 #include "ioctl_wrappers.h"
 
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
+#define DEFAULT_TIMEOUT 2.f
 
 static double elapsed(const struct timespec *start,
 		      const struct timespec *end)
@@ -64,7 +65,8 @@ static uint32_t batch(int fd, uint64_t size)
 	return handle;
 }
 
-static int loop(uint64_t size, unsigned ring, int reps, int ncpus, unsigned flags)
+static int loop(uint64_t size, unsigned ring, int reps, int ncpus,
+		unsigned flags, float timeout)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
@@ -128,10 +130,14 @@ static int loop(uint64_t size, unsigned ring, int reps, int ncpus, unsigned flag
 					/* fault out */
 					obj.alignment = 1ull << 63;
 					__gem_execbuf(fd, &execbuf);
-				}
 
-				clock_gettime(CLOCK_MONOTONIC, &end);
-			} while (elapsed(&start, &end) < 2.);
+					clock_gettime(CLOCK_MONOTONIC, &end);
+					if (elapsed(&start, &end) >= timeout) {
+						timeout = -1.0;
+						break;
+					}
+				}
+			} while (timeout > 0);
 
 			gem_sync(fd, obj.handle);
 			clock_gettime(CLOCK_MONOTONIC, &end);
@@ -156,8 +162,9 @@ int main(int argc, char **argv)
 	int reps = 1;
 	int ncpus = 1;
 	int c;
+	float timeout = DEFAULT_TIMEOUT;
 
-	while ((c = getopt (argc, argv, "e:r:s:f")) != -1) {
+	while ((c = getopt (argc, argv, "e:r:s:ft:")) != -1) {
 		switch (c) {
 		case 'e':
 			if (strcmp(optarg, "rcs") == 0)
@@ -190,10 +197,15 @@ int main(int argc, char **argv)
 				size = 4096;
 			break;
 
+		case 't':
+			timeout = atof(optarg);
+			igt_assert_f(timeout > 0, "Timeout must be > 0\n");
+			break;
+
 		default:
 			break;
 		}
 	}
 
-	return loop(size, ring, reps, ncpus, flags);
+	return loop(size, ring, reps, ncpus, flags, timeout);
 }
-- 
2.26.0
