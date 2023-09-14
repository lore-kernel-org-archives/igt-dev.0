Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A9B10E1B3
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 15:55:58 +0000 (UTC)
Received: from linux.intel.com (unknown [10.252.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 96C25580D77
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 08:55:48 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qgoh0-001fqi-0m
 for igt-dev@lists.freedesktop.org; Thu, 14 Sep 2023 17:55:46 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Sep 2023 17:55:44 +0200
Message-ID: <20230914155544.399186-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] docs/cross-building.txt: add documentation
 about cross-builds
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Cross-building IGT is not too trivial, as one needs to prepare
a sysroot directory containing not only glibc, but also other
libraries. Yet, such kind of builds are sometimes desired.
So, document how to do that.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/cross-building.txt | 73 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 docs/cross-building.txt

diff --git a/docs/cross-building.txt b/docs/cross-building.txt
new file mode 100644
index 000000000000..52aa5c361de3
--- /dev/null
+++ b/docs/cross-building.txt
@@ -0,0 +1,73 @@
+Producing an IGT library for another architecture
+=================================================
+
+Meson requires an extra file to do non-native builds. This is passed
+via --cross-file parameter to it.
+
+Such file contains the configuration used to do a cross-compilation build.
+As such, it contains:
+
+- the host machine data, which defines the system and architecture from
+  the native OS.
+  At the example below, the native OS is Linux, x86_64 architecture.
+- the target machine data, containing the target architecture.
+  At the example below, the target is aarch64 (arm 64 bits architecture).
+- the sysroot path, where IGT dependent libraries were compiled for a given
+  architecture.
+  This can be obtained by either cross-building a distribution using
+  Yocto, buildroot or similar, or by copying the system root from
+  an install for the desired architecture, after installing the IGT
+  needed library dependencies.
+
+  At the example below, the libraries are stored under /aarch64-sysroot.
+
+  Please notice that the binaries may require some extra libraries used
+  for cross-compiling. One needs to copy them from the native cross-compiler
+  toolchain. In the case of Fedora, such files are located  under
+  /usr/aarch64-linux-gnu/sys-root/ (for aarch64 architecture).
+
+Preparing for cross compilation is done by calling meson with the
+cross-compilation config file name:
+
+	meson --cross-file arm64_cross.txt arm64
+
+The actual compilation can then be done using ninja:
+
+	ninja -C arm64
+
+Please notice that some parts of the IGT build are disabled during
+cross-compilation, like testlist file creation and documentation,
+as such steps depend on running the generated code at the native
+machine.
+
+arm64_cross.txt example
+-----------------------
+
+[constants]
+sysroot = '/aarch64-sysroot'
+common_args = ['--sysroot=' + sysroot]
+
+[properties]
+sys_root = sysroot
+c_args = common_args
+c_link_args = common_args
+pkg_config_libdir = [sysroot + '/usr/lib64/pkgconfig', sysroot +'/usr/share/pkgconfig', sysroot +'/usr/local/lib/pkgconfig']
+
+[binaries]
+c = '/usr/bin/aarch64-linux-gnu-gcc'
+ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
+ld = '/usr/bin/aarch64-linux-gnu-ld'
+strip = '/usr/bin/aarch64-linux-gnu-strip'
+pkgconfig = 'pkg-config'
+
+[host_machine]
+system = 'linux'
+cpu_family = 'x86_64'
+cpu = 'x86_64'
+endian = 'little'
+
+[target_machine]
+system = 'linux'
+cpu_family = 'aarch64'
+cpu = 'aarch64'
+endian = 'little'
-- 
2.41.0
