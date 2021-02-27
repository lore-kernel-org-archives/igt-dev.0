Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355E26E098
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Feb 2021 14:49:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 y22-20020a1c4b160000b029010b2094f5deso947314wma.0
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Feb 2021 06:49:02 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:78c6:baba:ab09:bdce])
 by smtp.gmail.com with ESMTPSA id y62sm17789625wmy.9.2021.02.27.06.49.00
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 06:49:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sat, 27 Feb 2021 14:49:00 +0000
Message-Id: <20210227144900.3961632-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] meson: Allow source location to be
 configurable
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

Hardcoding a build source path into a binary when cross compiling isn't
appropriate and breaks build reproducibility. Allow the srcdir to be
specified by an optional configuration option to meson.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 lib/meson.build   | 6 +++++-
 meson_options.txt | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index 114eadde..672b4206 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -125,7 +125,11 @@ if chamelium.found()
 	lib_sources += 'igt_chamelium_stream.c'
 endif
 
-srcdir = join_paths(meson.source_root(), 'tests')
+if get_option('srcdir') != ''
+    srcdir = join_paths(get_option('srcdir'), 'tests')
+else
+    srcdir = join_paths(meson.source_root(), 'tests')
+endif
 
 lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
 		      fallback : 'NO-GIT',
diff --git a/meson_options.txt b/meson_options.txt
index ff3abf08..a0a1aaed 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -50,3 +50,7 @@ option('use_rpath',
        type : 'boolean',
        value : false,
        description : 'Set runpath on installed executables for libigt.so')
+
+option('srcdir',
+       type : 'string',
+       description : 'Path to source code to be compiled into binaries (optional)')
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
