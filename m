Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3BF6EB84
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 06:12:23 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Sat, 10 Jul 2021 23:12:07 -0700
Message-Id: <20210711061211.2879015-6-lucas.demarchi@intel.com>
In-Reply-To: <20210711061211.2879015-1-lucas.demarchi@intel.com>
References: <20210711061211.2879015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 5/9] benchmarks/gem_exec_tracer: nuke
 LOCAL_IOCTL_I915_GEM_EXECBUFFER2_WR
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

Use DRM_IOCTL_I915_GEM_EXECBUFFER2_WR from kernel header.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 benchmarks/gem_exec_tracer.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c
index c8f4e84b..e6973991 100644
--- a/benchmarks/gem_exec_tracer.c
+++ b/benchmarks/gem_exec_tracer.c
@@ -266,9 +266,6 @@ static int is_i915(int fd)
 	return strcmp(name, "i915") == 0;
 }
 
-#define LOCAL_IOCTL_I915_GEM_EXECBUFFER2_WR \
-    DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER2, struct drm_i915_gem_execbuffer2)
-
 int
 ioctl(int fd, unsigned long request, ...)
 {
@@ -327,7 +324,7 @@ ioctl(int fd, unsigned long request, ...)
 
 	switch (request) {
 	case DRM_IOCTL_I915_GEM_EXECBUFFER2:
-	case LOCAL_IOCTL_I915_GEM_EXECBUFFER2_WR:
+	case DRM_IOCTL_I915_GEM_EXECBUFFER2_WR:
 		trace_exec(t, argp);
 		break;
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
