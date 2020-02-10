Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5646E10E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 02:52:42 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id j15so3102854pgm.6
 for <igt-dev@lists.freedesktop.org>; Sun, 09 Feb 2020 18:52:42 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id p16sm10014149pgi.50.2020.02.09.18.52.40
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 18:52:40 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 10 Feb 2020 10:52:33 +0800
Message-Id: <20200210025233.222606-1-drinkcat@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] meson: Port cpuid.h test from configure.ac
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
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When cross-compiling for arm64, we noticed that the header file
may be present, but it is not functional:
/usr/lib64/clang/10.0.0/include/cpuid.h:11:2: error: this header is for x86 only

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 meson.build | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 4d5003ba..bcb69e1c 100644
--- a/meson.build
+++ b/meson.build
@@ -207,8 +207,16 @@ endif
 if cc.has_header('sys/io.h')
 	config.set('HAVE_SYS_IO_H', 1)
 endif
-if cc.has_header('cpuid.h')
-	# FIXME: Do we need the example link test from configure.ac?
+if cc.links('''
+#include <cpuid.h>
+#include <stddef.h>
+
+int main(void) {
+  int eax, ebx, ecx, edx;
+  if (__get_cpuid_max(0, NULL) < 4)
+    return 0;
+  __cpuid_count(4, 0, eax, ebx, ecx, edx);
+}''', name : 'cpuid.h')
 	config.set('HAVE_CPUID_H', 1)
 endif
 if cc.has_header_symbol('unistd.h', 'gettid', args : '-D_GNU_SOURCE')
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
