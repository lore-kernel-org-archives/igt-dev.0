Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF30C6EB87
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 06:12:23 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Sat, 10 Jul 2021 23:12:08 -0700
Message-Id: <20210711061211.2879015-7-lucas.demarchi@intel.com>
In-Reply-To: <20210711061211.2879015-1-lucas.demarchi@intel.com>
References: <20210711061211.2879015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 6/9] benchmarks/gem_busy: nuke
 LOCAL_IOCTL_SYNCOBJ_CREATE
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

This is DRM_IOCTL_SYNCOBJ_CREATE.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 benchmarks/gem_busy.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/benchmarks/gem_busy.c b/benchmarks/gem_busy.c
index 70885e25..d417bfe9 100644
--- a/benchmarks/gem_busy.c
+++ b/benchmarks/gem_busy.c
@@ -114,13 +114,10 @@ static int sync_merge(int fd1, int fd2)
 
 static uint32_t __syncobj_create(int fd)
 {
-	struct local_syncobj_create {
-		uint32_t handle, flags;
-	} arg;
-#define LOCAL_IOCTL_SYNCOBJ_CREATE        DRM_IOWR(0xBF, struct local_syncobj_create)
+	struct drm_syncobj_create arg;
 
 	memset(&arg, 0, sizeof(arg));
-	ioctl(fd, LOCAL_IOCTL_SYNCOBJ_CREATE, &arg);
+	ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &arg);
 
 	return arg.handle;
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
