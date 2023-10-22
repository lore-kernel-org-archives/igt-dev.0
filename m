Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1776C10E062
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Oct 2023 16:01:19 +0000 (UTC)
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 22 Oct 2023 17:52:22 +0200
Message-Id: <20231022155226.3484622-4-bernd@kuhls.net>
In-Reply-To: <20231022155226.3484622-1-bernd@kuhls.net>
References: <20231022155226.3484622-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/7] lib/igt_aux.h: Fix musl build
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
../lib/igt_aux.c:191:20: error: ‘struct sigevent’ has no member named ‘_sigev_un’
  191 |                 sev.sigev_notify_thread_id = __igt_sigiter.tid;

../lib/igt_aux.c:1994:12: error: ‘struct sigevent’ has no member named ‘_sigev_un’
 1994 |         sev.sigev_notify_thread_id = gettid();

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 lib/igt_aux.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index fb76b0313..a13e8156a 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -48,7 +48,7 @@
 # ifndef HAVE_GETTID
 #  define gettid() (pid_t)(syscall(__NR_gettid))
 # endif
-# define sigev_notify_thread_id _sigev_un._tid
+# define sigev_notify_thread_id sigev_notify_function
 #endif
 
 /* auxialiary igt helpers from igt_aux.c */
-- 
2.39.2
