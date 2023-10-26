Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C5810E842
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 17:15:55 +0000 (UTC)
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 19:14:40 +0200
Message-Id: <20231026171440.4046190-7-bernd@kuhls.net>
In-Reply-To: <20231026171440.4046190-1-bernd@kuhls.net>
References: <20231026171440.4046190-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 6/6] benchmarks/gem_exec_tracer.c: Fix musl
 build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mohammed Anas <triallax@tutanota.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mohammed Anas <triallax@tutanota.com>

Original patch was added to void-linux:
https://github.com/void-linux/void-packages/commit/111918317d06598fe1459dbe139923404f3f4b9d

Fixes build error:
../benchmarks/gem_exec_tracer.c:274:1: error: conflicting types for ‘ioctl’; have ‘int(int,  long unsigned int, ...)’
  274 | ioctl(int fd, unsigned long request, ...)

Bug report with request to split the original patch into some
functional changes:
Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138

Signed-off-by: Mohammed Anas <triallax@tutanota.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 benchmarks/gem_exec_tracer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c
index 7e86473e4..3156dfc23 100644
--- a/benchmarks/gem_exec_tracer.c
+++ b/benchmarks/gem_exec_tracer.c
@@ -271,7 +271,11 @@ static int is_i915(int fd)
 }
 
 int
+#ifdef __GLIBC__
 ioctl(int fd, unsigned long request, ...)
+#else
+ioctl(int fd, int request, ...)
+#endif
 {
 	struct trace *t, **p;
 	va_list args;
-- 
2.39.2
