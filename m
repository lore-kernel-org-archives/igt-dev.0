Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F227110E0D0
 for <igt-dev@lists.freedesktop.org>; Sun, 16 Oct 2022 17:27:43 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h203so7519027iof.1
 for <igt-dev@lists.freedesktop.org>; Sun, 16 Oct 2022 10:27:43 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 16 Oct 2022 12:27:25 -0500
Message-Id: <20221016172725.1556355-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] meson.build: Add FreeBSD OS detection
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

Use meson's host_machine.system() to detect the target operating
system. If the target is FreeBSD, add /usr/local/include to the
include dirs.

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meson.build b/meson.build
index 3e937f5a..896efbf8 100644
--- a/meson.build
+++ b/meson.build
@@ -86,7 +86,12 @@ with_libdrm = get_option('libdrm_drivers')
 
 build_info = ['Build type: ' + get_option('buildtype')]
 
+system = host_machine.system()
+if system == 'linux'
 inc = include_directories('include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
+elif system == 'freebsd'
+inc = include_directories('include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.', '/usr/local/include')
+endif
 
 inc_for_gtkdoc = include_directories('lib')
 
-- 
2.37.3
