Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 08 May 2023 12:51:15 -0000
Message-ID: <168355027517.22735.46987040160232253@emeril.freedesktop.org>
References: <20230508124116.1099603-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230508124116.1099603-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBCZXR0?=
 =?utf-8?q?er_document_i915_tests_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Better document i915 tests (rev2)
URL   : https://patchwork.freedesktop.org/series/117382/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
ce51f53938690f581b315fa045d41155a5c6ecd3 testplan: Add testplan support for kms tests

Checking if "built-in atomics" links: YES 
Has header "linux/kd.h" : YES 
Has header "sys/kd.h" : YES 
Has header "libgen.h" : YES 
Has header "sys/io.h" : YES 
Checking if "cpuid.h" links: YES 
Header <unistd.h> has symbol "gettid" : YES 
Checking whether type "struct sysinfo" has member "totalram" : YES 
Checking for function "memfd_create" : YES 
Configuring config.h using configuration
Program python3 found: YES (/usr/bin/python3)
Configuring i915-perf.pc using configuration
Program generate_testlist.sh found: YES (/usr/src/igt-gpu-tools/tests/generate_testlist.sh)
Program igt_command_line.sh found: YES (/usr/src/igt-gpu-tools/tests/igt_command_line.sh)
Run-time dependency json-c found: YES 0.13.1
Run-time dependency liboping found: YES 1.10.0
Compiler for C supports arguments -Wno-declaration-after-statement -Wdeclaration-after-statement: YES 
Compiler for C supports arguments -Wno-discarded-qualifiers -Wdiscarded-qualifiers: YES 
Compiler for C supports arguments -Wno-missing-format-attribute -Wmissing-format-attribute: YES 
Compiler for C supports arguments -Wno-old-style-definition -Wold-style-definition: YES 
Compiler for C supports arguments -Wno-redundant-decls -Wredundant-decls: YES 
Compiler for C supports arguments -Wno-shadow -Wshadow: YES 
Compiler for C supports arguments -Wno-incompatible-pointer-types-discards-qualifiers -Wincompatible-pointer-types-discards-qualifiers: NO 
Program flex found: YES (/usr/bin/flex)
Program bison found: YES (/usr/bin/bison)
Configuring intel-gen4asm.pc using configuration
Program test/run-test.sh found: YES (/bin/sh /usr/src/igt-gpu-tools/assembler/test/run-test.sh)
Run-time dependency xv found: YES 1.0.11
Run-time dependency x11 found: YES 1.6.9
Run-time dependency xext found: YES 1.3.4
Run-time dependency dri2proto found: YES 2.8
Run-time dependency cairo-xlib found: YES 1.17.2
Run-time dependency xrandr found: YES 1.5.2
Program leg found: YES (/usr/bin/leg)
Configuring defs.rst using configuration
Program rst2man-3 found: NO
Program rst2man found: YES (/usr/bin/rst2man)
Program rst2man.sh found: YES (/usr/src/igt-gpu-tools/man/rst2man.sh)
Program igt_doc.py found: YES (/usr/src/igt-gpu-tools/scripts/igt_doc.py)
Program gen_rst_index skipped: feature sphinx disabled
Run-time dependency gtk-doc found: NO (tried pkgconfig and cmake)

docs/testplan/meson.build:30:7: ERROR: Expecting rcurl got string.
	      'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
       ^
For a block that started at 27,12
test_dict = {
            ^

A full log can be found at /opt/igt/build/meson-logs/meson-log.txt



