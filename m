Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CEB10E367
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 19:58:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0b0.dip0.t-ipconnect.de [84.161.176.176])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EEFB4A4C111A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 20:58:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47142)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qxYOo-000244-0P
 for igt-dev@lists.freedesktop.org; Mon, 30 Oct 2023 20:58:10 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 20:58:04 +0100
Message-Id: <20231030195809.3527410-2-bernd@kuhls.net>
In-Reply-To: <20231030195809.3527410-1-bernd@kuhls.net>
References: <20231030195809.3527410-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 2/7] lib/igt_aux.h: Fix musl build
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

Inspired by https://www.openwall.com/lists/musl/2020/10/28/11

Define sigev_notify_thread_id only when needed, quoting
https://sourceware.org/bugzilla/show_bug.cgi?id=27417
Both freebsd and musl actually have this macro defined under <signal.h>

Fixes build error:

../lib/igt_aux.c:191:20: error: ‘struct sigevent’ has no member named ‘_sigev_un’
  191 |                 sev.sigev_notify_thread_id = __igt_sigiter.tid;

../lib/igt_aux.c:1994:12: error: ‘struct sigevent’ has no member named ‘_sigev_un’
 1994 |         sev.sigev_notify_thread_id = gettid();

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes

 lib/igt_aux.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index 4d887045a..4664559dc 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -29,6 +29,7 @@
 #define IGT_AUX_H
 
 #include <inttypes.h>
+#include <signal.h>
 #include <stdbool.h>
 #include <stddef.h>
 #include <sys/time.h>
@@ -48,7 +49,9 @@
 # ifndef HAVE_GETTID
 #  define gettid() (pid_t)(syscall(__NR_gettid))
 # endif
-# define sigev_notify_thread_id _sigev_un._tid
+# ifndef sigev_notify_thread_id
+#  define sigev_notify_thread_id _sigev_un._tid
+# endif
 #endif
 
 /* auxialiary igt helpers from igt_aux.c */
-- 
2.39.2
