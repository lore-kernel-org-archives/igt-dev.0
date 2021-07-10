Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B006EAAC
 for <igt-dev@lists.freedesktop.org>; Sat, 10 Jul 2021 00:48:38 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Fri,  9 Jul 2021 17:47:06 -0700
Message-Id: <20210710004708.2871237-8-lucas.demarchi@intel.com>
In-Reply-To: <20210710004708.2871237-1-lucas.demarchi@intel.com>
References: <20210710004708.2871237-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/9] benchmarks/gem_busy: nuke
 LOCAL_IOCTL_SYNCOBJ_WAIT
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

This is DRM_IOCTL_SYNCOBJ_WAIT.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 benchmarks/gem_busy.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
index d417bfe9..514e3387 100644
--- a/benchmarks/gem_busy.c
+++ b/benchmarks/gem_busy.c
@@ -131,22 +131,10 @@ static uint32_t syncobj_create(int fd)
 	return ret;
 }
 
-#define LOCAL_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
-#define LOCAL_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
-struct local_syncobj_wait {
-       __u64 handles;
-       /* absolute timeout */
-       __s64 timeout_nsec;
-       __u32 count_handles;
-       __u32 flags;
-       __u32 first_signaled; /* only valid when not waiting all */
-       __u32 pad;
-};
-#define LOCAL_IOCTL_SYNCOBJ_WAIT	DRM_IOWR(0xC3, struct local_syncobj_wait)
-static int __syncobj_wait(int fd, struct local_syncobj_wait *args)
+static int __syncobj_wait(int fd, struct drm_syncobj_wait *args)
 {
 	int err = 0;
-	if (drmIoctl(fd, LOCAL_IOCTL_SYNCOBJ_WAIT, args))
+	if (drmIoctl(fd, DRM_IOCTL_SYNCOBJ_WAIT, args))
 		err = -errno;
 	return err;
 }
@@ -285,7 +273,7 @@ static int loop(unsigned ring, int reps, int ncpus, unsigned flags)
 					for (int inner = 0; inner < 1024; inner++)
 						poll(&pfd, 1, 0);
 				} else if (flags & SYNCOBJ) {
-					struct local_syncobj_wait arg = {
+					struct drm_syncobj_wait arg = {
 						.handles = to_user_pointer(&syncobj.handle),
 						.count_handles = 1,
 					};
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
