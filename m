Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Mar 2023 08:27:59 -0000
Message-ID: <167956007911.6627.6237843968139375695@emeril.freedesktop.org>
References: <20230322140030.1800192-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230322140030.1800192-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB4ZS94?=
 =?utf-8?q?e=5Fmodule=5Fload=3A_add_a_test_to_load/unload_Xe_driver_=28rev?=
 =?utf-8?q?3=29?=
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

Series: xe/xe_module_load: add a test to load/unload Xe driver (rev3)
URL   : https://patchwork.freedesktop.org/series/115511/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
c0cc1de7b2f4041ca68960362aa55f881d416bac tests/amdgpu/amd_dp_dsc: fix test crash signal sigsegv

Compiler for C supports arguments -Werror=return-type: YES 
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
Run-time dependency libunwind found: YES 1.21
Run-time dependency libdw found: YES 0.176
Run-time dependency pixman-1 found: YES 0.38.0
Run-time dependency valgrind found: YES 3.15.0
Run-time dependency cairo found: YES 1.17.2
Run-time dependency libudev found: YES 245
Run-time dependency glib-2.0 found: YES 2.64.6
Found CMake: /usr/bin/cmake (3.16.3)
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

tests/intel-ci/meson.build:11:0: ERROR: File blacklist.txt does not exist.

A full log can be found at /opt/igt/build/meson-logs/meson-log.txt



