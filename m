Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1666EA97
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Oct 2021 20:32:54 +0000 (UTC)
From: Casey Bowman <casey.g.bowman@intel.com>
Date: Fri, 15 Oct 2021 13:32:38 -0700
Message-Id: <20211015203238.133163-3-casey.g.bowman@intel.com>
In-Reply-To: <20211015203238.133163-1-casey.g.bowman@intel.com>
References: <20211015203238.133163-1-casey.g.bowman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] Avoid using the sys/io.h header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, petri.latvala@intel.com, ashutosh.dixit@intel.com, wayne.boyer@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

We deliberately want to avoid using the sys/io.h header
for arm64 because it causes the following error during
compilation:

In file included from ../tools/intel_reg.c:46:
../tools/intel_reg.c: In function ‘read_register’:
/usr/include/sys/io.h:47:3: error: impossible constraint in ‘asm’
   47 |   __asm__ __volatile__ ("inb %w1,%0":"=a" (_v):"Nd" (__port));
      |   ^~~~~~~

Signed-off-by: Casey Bowman <casey.g.bowman@intel.com>
---
 meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index f9a284d84..bccf9fa0c 100644
--- a/meson.build
+++ b/meson.build
@@ -208,8 +208,10 @@ endif
 if cc.has_header('libgen.h')
 	config.set('HAVE_LIBGEN_H', 1)
 endif
-if cc.has_header('sys/io.h')
-	config.set('HAVE_SYS_IO_H', 1)
+if host_machine.cpu_family() != 'aarch64'
+  if cc.has_header('sys/io.h')
+	  config.set('HAVE_SYS_IO_H', 1)
+  endif
 endif
 if cc.links('''
 #include <cpuid.h>
-- 
2.25.1
