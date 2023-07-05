Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 05 Jul 2023 16:37:00 -0000
Message-ID: <168857502052.24207.1352761067801158460@emeril.freedesktop.org>
References: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBTcGVl?=
 =?utf-8?q?dup_IGT_build_time?=
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

Series: Speedup IGT build time
URL   : https://patchwork.freedesktop.org/series/120233/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
f8d05fd574fad1526cbf5e20672910df87b8839b intel-ci/xe-fast-feedback.testlist: Add xe_exec_store@basic-store subtest in fastfeedback

Compiler for C supports arguments -Werror=sequence-point: YES 
Compiler for C supports arguments -Werror=trigraphs: YES 
Compiler for C supports arguments -Werror=write-strings: YES 
Compiler for C supports arguments -fno-builtin-malloc: YES 
Compiler for C supports arguments -fno-builtin-calloc: YES 
Found pkg-config: /usr/bin/pkg-config (0.29.1)
Run-time dependency libdrm found: YES 2.4.107
Run-time dependency libdrm_intel found: YES 2.4.107
Run-time dependency pciaccess found: YES 0.16
Run-time dependency libkmod found: YES 27
Run-time dependency libprocps found: YES 3.3.16
Found CMake: /usr/bin/cmake (3.16.3)
Run-time dependency libproc2 found: NO (tried pkgconfig and cmake)
Run-time dependency libunwind found: YES 1.21
Run-time dependency libdw found: YES 0.176
Run-time dependency pixman-1 found: YES 0.38.0
Run-time dependency valgrind found: YES 3.15.0
Run-time dependency cairo found: YES 1.17.2
Run-time dependency libudev found: YES 245
Run-time dependency glib-2.0 found: YES 2.64.6
Run-time dependency xmlrpc found: NO (tried pkgconfig and cmake)
Run-time dependency xmlrpc_util found: NO (tried pkgconfig and cmake)
Run-time dependency xmlrpc_client found: NO (tried pkgconfig and cmake)
Program xmlrpc-c-config found: YES (/usr/bin/xmlrpc-c-config)
Run-time dependency gsl found: YES 2.5
Run-time dependency alsa found: YES 1.2.2
Run-time dependency libcurl found: YES 7.68.0
Run-time dependency threads found: YES
Library m found: YES
Library rt found: YES
Library dl found: YES
Library z found: YES
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

tests/meson.build:556:1: ERROR: Unknown method "name" in object.

A full log can be found at /opt/igt/build/meson-logs/meson-log.txt



