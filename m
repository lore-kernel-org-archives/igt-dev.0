Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wayne Lin" <wayne.lin@amd.com>
Date: Mon, 11 Jul 2022 03:53:29 -0000
Message-ID: <165751160973.5765.3222730792239834423@emeril.freedesktop.org>
References: <20220711035017.3178916-1-Wayne.Lin@amd.com>
In-Reply-To: <20220711035017.3178916-1-Wayne.Lin@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?/amdgpu=3A_Add_DP_mst_test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/amdgpu: Add DP mst test
URL   : https://patchwork.freedesktop.org/series/106166/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
7d43b49bf10788d4870668f93a800888fc8ab339 Revert "lib/i915: request CPU_ACCESS for fb objects"

311/330 testcase check amdgpu/amd_psr                 OK               0.12s
312/330 testcase check amdgpu/amd_ilr                 OK               0.11s
313/330 testcase check amdgpu/amd_plane               OK               0.11s
314/330 testcase check amdgpu/amd_mst                 FAIL             0.10s   exit status 1
>>> MALLOC_PERTURB_=71 /home/cidrm/igt-gpu-tools/tests/igt_command_line.sh amdgpu/amd_mst
――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
tests/amdgpu/amd_mst:
  Checking invalid option handling...
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:573:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x8 (amdgpu)
Last errno: 2, No such file or directory
SKIP (-1.000s)
  Checking valid option handling...
FAIL: tests/amdgpu/amd_mst
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

315/330 runner_json                                   OK               0.09s
316/330 assembler test/mov                            OK               0.08s
317/330 assembler test/frc                            OK               0.08s
318/330 assembler test/regtype                        OK               0.07s
319/330 assembler test/rndd                           OK               0.07s
320/330 assembler test/rndu                           OK               0.07s
321/330 assembler test/rnde                           OK               0.06s
322/330 assembler test/rnde-intsrc                    OK               0.06s
323/330 assembler test/rndz                           OK               0.05s
324/330 assembler test/lzd                            OK               0.04s
325/330 assembler test/not                            OK               0.04s
326/330 assembler test/immediate                      OK               0.03s
327/330 lib igt_nesting                               OK               2.19s
328/330 lib igt_fork                                  OK               2.73s
329/330 runner                                        OK               4.57s
330/330 testcase check gem_concurrent_all             OK               5.89s

Summary of Failures:

314/330 testcase check amdgpu/amd_mst                 FAIL             0.10s   exit status 1


Ok:                 326 
Expected Fail:      3   
Fail:               1   
Unexpected Pass:    0   
Skipped:            0   
Timeout:            0   

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

