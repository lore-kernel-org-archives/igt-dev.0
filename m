Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2002D6ED94
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Oct 2021 20:32:54 +0000 (UTC)
From: Casey Bowman <casey.g.bowman@intel.com>
Date: Fri, 15 Oct 2021 13:32:37 -0700
Message-Id: <20211015203238.133163-2-casey.g.bowman@intel.com>
In-Reply-To: <20211015203238.133163-1-casey.g.bowman@intel.com>
References: <20211015203238.133163-1-casey.g.bowman@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] Alter arm64 cross compile pkg-config
 library selections
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

Specifies to use 'aarch64-linux-gnu-pkg-config' as the
pkg-config binary to use, as the normal /usr/bin/pkg-config
binary will be used on a host system. If we use this binary
we will observe that the shared object libraries will be
pulled from the x86_64 libraries instead of the aarch64 ones.

We also specify nouveau here as our libdrm driver library
because there is no support for libdrm-intel on arm64 yet.

Signed-off-by: Casey Bowman <casey.g.bowman@intel.com>
---
 meson-cross-arm64.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson-cross-arm64.txt b/meson-cross-arm64.txt
index d96f180e2..6f69e3f69 100644
--- a/meson-cross-arm64.txt
+++ b/meson-cross-arm64.txt
@@ -2,7 +2,7 @@
 c = '/usr/bin/aarch64-linux-gnu-gcc'
 ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
 strip = '/usr/bin/aarch64-linux-gnu-strip'
-pkgconfig = 'pkg-config'
+pkgconfig = 'aarch64-linux-gnu-pkg-config'
 exe_wrapper = 'qemu-aarch64'
 
 [host_machine]
@@ -10,3 +10,6 @@ system = 'linux'
 cpu_family = 'aarch64'
 cpu = 'aarch64'
 endian = 'little'
+
+[project options]
+libdrm_drivers = 'nouveau'
-- 
2.25.1
