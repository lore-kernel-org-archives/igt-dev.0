Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C6A6E8AB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 00:06:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l12so17991122wry.2
 for <igt-dev@lists.freedesktop.org>; Mon, 01 Mar 2021 16:06:34 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
 by smtp.gmail.com with ESMTPSA id u142sm812630wmu.3.2021.03.01.16.06.32
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 16:06:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue,  2 Mar 2021 00:06:32 +0000
Message-Id: <20210302000632.2208302-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t] meson: Allow source location to be
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

Hardcoding a build source path inside a binary when cross compiling isn't
appropriate and breaks build reproducibility. Allow the srcdir to be
specified by an optional configuration option to meson which can
be used to override with the correct path.

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
index ff3abf08..bed63efa 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -50,3 +50,7 @@ option('use_rpath',
        type : 'boolean',
        value : false,
        description : 'Set runpath on installed executables for libigt.so')
+
+option('srcdir',
+       type : 'string',
+       description : 'Override the source code path embedded inside target binaries (optional)')
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
