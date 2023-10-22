Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EA110E043
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Oct 2023 16:01:30 +0000 (UTC)
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 22 Oct 2023 17:52:23 +0200
Message-Id: <20231022155226.3484622-5-bernd@kuhls.net>
In-Reply-To: <20231022155226.3484622-1-bernd@kuhls.net>
References: <20231022155226.3484622-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/7] lib/igt_x86.c: Fix musl/uclibc build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Stefano Ragni <st3r4g@protonmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Stefano Ragni <st3r4g@protonmail.com>

Original patch was added to void-linux:
https://github.com/void-linux/void-packages/commit/ddfc1f66a0c571b420303c33aed29fd38ace4fc7

Bug report with request to split the original patch into some
functional changes:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138

Fixes build error:
../lib/igt_x86.c:295:6: error: ‘ifunc’ is not supported on this target
  295 | void igt_memcpy_from_wc(void *dst, const void *src, unsigned long len)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 lib/igt_x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_x86.c b/lib/igt_x86.c
index 6ac700df0..8c102fd13 100644
--- a/lib/igt_x86.c
+++ b/lib/igt_x86.c
@@ -190,7 +190,7 @@ char *igt_x86_features_to_string(unsigned features, char *line)
 }
 #endif
 
-#if defined(__x86_64__) && !defined(__clang__)
+#if defined(__x86_64__) && !defined(__clang__) && defined(__GLIBC__) && !defined(__UCLIBC__)
 #pragma GCC push_options
 #pragma GCC target("sse4.1")
 #pragma GCC diagnostic ignored "-Wpointer-arith"
-- 
2.39.2
