Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Mon, 19 Sep 2022 12:00:18 -0000
Message-ID: <166358881866.28330.15324407564349963241@emeril.freedesktop.org>
References: <20220919102654.667916-1-ananya.sharma@intel.com>
In-Reply-To: <20220919102654.667916-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fdp=5Faux=5Fdev=3A_Convert_test_to_dynamic_=28rev2=29?=
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

Series: tests/kms_dp_aux_dev: Convert test to dynamic (rev2)
URL   : https://patchwork.freedesktop.org/series/108719/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
24100c4e181c50e3678aeca9c641b8a43555ad73 i915_pm_dc: Use igt_main

299/331 testcase check amdgpu/amd_bypass              OK               0.18s
300/331 testcase check amdgpu/amd_deadlock            OK               0.18s
301/331 testcase check amdgpu/amd_color               OK               0.18s
302/331 testcase check amdgpu/amd_cs_nop              OK               0.16s
303/331 testcase check amdgpu/amd_hotplug             OK               0.16s
304/331 testcase check amdgpu/amd_info                OK               0.16s
305/331 testcase check amdgpu/amd_prime               OK               0.15s
306/331 testcase check amdgpu/amd_max_bpc             OK               0.15s
307/331 testcase check amdgpu/amd_module_load         OK               0.14s
308/331 testcase check amdgpu/amd_mem_leak            OK               0.14s
309/331 testcase check amdgpu/amd_link_settings       OK               0.13s
310/331 testcase check amdgpu/amd_vrr_range           OK               0.13s
311/331 testcase check amdgpu/amd_mode_switch         OK               0.13s
312/331 testcase check amdgpu/amd_dp_dsc              OK               0.12s
313/331 testcase check amdgpu/amd_psr                 OK               0.12s
314/331 testcase check amdgpu/amd_plane               OK               0.11s
315/331 testcase check amdgpu/amd_ilr                 OK               0.11s
316/331 runner_json                                   OK               0.09s
317/331 assembler test/mov                            OK               0.08s
318/331 assembler test/frc                            OK               0.08s
319/331 assembler test/regtype                        OK               0.07s
320/331 assembler test/rndd                           OK               0.06s
321/331 assembler test/rndu                           OK               0.06s
322/331 assembler test/rnde                           OK               0.06s
323/331 assembler test/rnde-intsrc                    OK               0.05s
324/331 assembler test/rndz                           OK               0.05s
325/331 assembler test/lzd                            OK               0.04s
326/331 assembler test/not                            OK               0.04s
327/331 assembler test/immediate                      OK               0.03s
328/331 lib igt_nesting                               OK               2.19s
329/331 lib igt_fork                                  OK               2.65s
330/331 testcase check gem_concurrent_all             OK               4.04s
331/331 runner                                        OK               4.60s

Summary of Failures:

 50/331 testcase check kms_dp_aux_dev                 FAIL             0.25s   exit status 1


Ok:                 327 
Expected Fail:      3   
Fail:               1   
Unexpected Pass:    0   
Skipped:            0   
Timeout:            0   

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

