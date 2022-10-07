Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF8C10E138
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 23:28:13 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id r142so618529iod.11
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Oct 2022 16:28:13 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Oct 2022 18:27:57 -0500
Message-Id: <20221007232757.3210308-7-jfree@freebsd.org>
In-Reply-To: <20221007232757.3210308-1-jfree@freebsd.org>
References: <20221007232757.3210308-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 6/6] Include igt_freebsd.h in gem
 benchmarks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Allow benchmark compilation on a FreeBSD system using
the drop-in igt_freebsd header.

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 benchmarks/gem_exec_tracer.c | 4 ++++
 benchmarks/gem_syslatency.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/benchmarks/gem_exec_tracer.c b/benchmarks/gem_exec_tracer.c
index e6973991..7e86473e 100644
--- a/benchmarks/gem_exec_tracer.c
+++ b/benchmarks/gem_exec_tracer.c
@@ -41,6 +41,10 @@
 #include "intel_aub.h"
 #include "intel_chipset.h"
 
+#ifdef __FreeBSD__
+#include "igt_freebsd.h"
+#endif
+
 static int (*libc_close)(int fd);
 static int (*libc_ioctl)(int fd, unsigned long request, void *argp);
 
diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index c67b23cf..b4011baa 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -51,6 +51,10 @@
 
 #define sigev_notify_thread_id _sigev_un._tid
 
+#ifdef __FreeBSD__
+#include "igt_freebsd.h"
+#endif
+
 static volatile int done;
 
 struct gem_busyspin {
-- 
2.37.3
