Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4737310E367
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 19:58:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0b0.dip0.t-ipconnect.de [84.161.176.176])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5CC8A4C00FF
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 20:58:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47142)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qxYOo-000244-0F
 for igt-dev@lists.freedesktop.org; Mon, 30 Oct 2023 20:58:10 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 20:58:03 +0100
Message-Id: <20231030195809.3527410-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 1/7] build: check that outb is present in io.h
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

With glibc if io.h exists, inb/outb are always defined.
However on musl, io.h always exists but it may not define inb/outb.

Thus, igt-gpu-tools builds with musl on non-x86 platforms will fail to
link. Fix this by checking for both io.h and that outb() is defined.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: no changes

 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b35a00faa..cee8a7446 100644
--- a/meson.build
+++ b/meson.build
@@ -220,7 +220,7 @@ endif
 if cc.has_header('libgen.h')
 	config.set('HAVE_LIBGEN_H', 1)
 endif
-if cc.has_header('sys/io.h')
+if cc.has_header('sys/io.h') and cc.has_function('outb', prefix: '#include <sys/io.h>')
 	config.set('HAVE_SYS_IO_H', 1)
 endif
 if cc.links('''
-- 
2.39.2
