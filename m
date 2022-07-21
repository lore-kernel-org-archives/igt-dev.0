Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stanislav Lisovskiy" <stanislav.lisovskiy@intel.com>
Date: Thu, 21 Jul 2022 12:25:04 -0000
Message-ID: <165840630432.29951.11154151053694117983@emeril.freedesktop.org>
References: <20220721115508.22527-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20220721115508.22527-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBpZ3Qv?=
 =?utf-8?q?tests=3A_Add_plane_stress_test_=28rev2=29?=
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

Series: igt/tests: Add plane stress test (rev2)
URL   : https://patchwork.freedesktop.org/series/72624/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
326629f105459f9bd201456a0454759628e6a43d tests/i915/i915_pm_rc6_residency: Use correct type for power in rc6-fence

298/330 testcase check amdgpu/amd_basic               OK               0.19s
299/330 testcase check amdgpu/amd_bypass              OK               0.18s
300/330 testcase check amdgpu/amd_color               OK               0.17s
301/330 testcase check amdgpu/amd_cs_nop              OK               0.17s
302/330 testcase check amdgpu/amd_hotplug             OK               0.16s
303/330 testcase check amdgpu/amd_info                OK               0.15s
304/330 testcase check amdgpu/amd_prime               OK               0.15s
305/330 testcase check amdgpu/amd_max_bpc             OK               0.15s
306/330 testcase check amdgpu/amd_module_load         OK               0.14s
307/330 testcase check amdgpu/amd_mem_leak            OK               0.14s
308/330 testcase check amdgpu/amd_link_settings       OK               0.13s
309/330 testcase check amdgpu/amd_vrr_range           OK               0.13s
310/330 testcase check amdgpu/amd_mode_switch         OK               0.13s
311/330 testcase check amdgpu/amd_dp_dsc              OK               0.11s
312/330 testcase check amdgpu/amd_psr                 OK               0.11s
313/330 testcase check amdgpu/amd_plane               OK               0.10s
314/330 testcase check amdgpu/amd_ilr                 OK               0.09s
315/330 runner_json                                   OK               0.08s
316/330 assembler test/mov                            OK               0.08s
317/330 assembler test/frc                            OK               0.07s
318/330 assembler test/regtype                        OK               0.07s
319/330 assembler test/rndd                           OK               0.06s
320/330 assembler test/rndu                           OK               0.06s
321/330 assembler test/rnde                           OK               0.06s
322/330 assembler test/rnde-intsrc                    OK               0.05s
323/330 assembler test/rndz                           OK               0.05s
324/330 assembler test/lzd                            OK               0.04s
325/330 assembler test/not                            OK               0.04s
326/330 assembler test/immediate                      OK               0.04s
327/330 lib igt_nesting                               OK               2.15s
328/330 lib igt_fork                                  OK               2.73s
329/330 runner                                        OK               4.68s
330/330 testcase check gem_concurrent_all             OK               5.10s

Summary of Failures:

242/330 testcase check i915_pipe_stress               FAIL             0.23s   exit status 1


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

