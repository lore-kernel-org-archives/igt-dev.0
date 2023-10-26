Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0867310E835
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 17:15:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21292A4C1208
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 19:14:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58180)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qw3wP-0002zh-2w
 for igt-dev@lists.freedesktop.org; Thu, 26 Oct 2023 19:14:41 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 19:14:37 +0200
Message-Id: <20231026171440.4046190-4-bernd@kuhls.net>
In-Reply-To: <20231026171440.4046190-1-bernd@kuhls.net>
References: <20231026171440.4046190-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 3/6] lib/igt_aux.h: Fix musl build
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
 lib/igt_aux.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index fb76b0313..55f0aa3b5 100644
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
