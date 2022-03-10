Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 10 Mar 2022 07:34:57 -0000
Message-ID: <164689769743.17007.15107078729059666466@emeril.freedesktop.org>
References: <20220310071008.10811-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220310071008.10811-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJR1Qg?=
 =?utf-8?q?cleanup_=28rev5=29?=
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

Series: IGT cleanup (rev5)
URL   : https://patchwork.freedesktop.org/series/100801/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
82306f1903c0fee8371f43a156d8b63163ca61c1 lib/intel_mmio: Fix mmapped resources not unmapped on fini

292/324 testcase check amdgpu/amd_basic               OK               0.18s
293/324 testcase check amdgpu/amd_bypass              OK               0.17s
294/324 testcase check amdgpu/amd_color               OK               0.17s
295/324 testcase check amdgpu/amd_cs_nop              OK               0.16s
296/324 testcase check amdgpu/amd_hotplug             OK               0.16s
297/324 testcase check amdgpu/amd_info                OK               0.16s
298/324 testcase check amdgpu/amd_prime               OK               0.15s
299/324 testcase check amdgpu/amd_max_bpc             OK               0.15s
300/324 testcase check amdgpu/amd_module_load         OK               0.15s
301/324 testcase check amdgpu/amd_mem_leak            OK               0.14s
302/324 testcase check amdgpu/amd_link_settings       OK               0.13s
303/324 testcase check amdgpu/amd_vrr_range           OK               0.12s
304/324 testcase check amdgpu/amd_mode_switch         OK               0.11s
305/324 testcase check amdgpu/amd_dp_dsc              OK               0.11s
306/324 testcase check amdgpu/amd_psr                 OK               0.11s
307/324 testcase check amdgpu/amd_plane               OK               0.10s
308/324 testcase check amdgpu/amd_ilr                 OK               0.10s
309/324 runner_json                                   OK               0.09s
310/324 assembler test/mov                            OK               0.08s
311/324 assembler test/frc                            OK               0.08s
312/324 assembler test/regtype                        OK               0.08s
313/324 assembler test/rndd                           OK               0.07s
314/324 assembler test/rndu                           OK               0.07s
315/324 assembler test/rnde                           OK               0.06s
316/324 assembler test/rnde-intsrc                    OK               0.06s
317/324 assembler test/rndz                           OK               0.05s
318/324 assembler test/lzd                            OK               0.05s
319/324 assembler test/not                            OK               0.04s
320/324 assembler test/immediate                      OK               0.03s
321/324 lib igt_nesting                               OK               2.27s
322/324 lib igt_fork                                  OK               2.79s
323/324 runner                                        OK               4.64s
324/324 testcase check gem_concurrent_all             OK               5.44s

Summary of Failures:

 35/324 testcase check kms_concurrent                 FAIL             0.24s   exit status 1


Ok:                 320 
Expected Fail:      3   
Fail:               1   
Unexpected Pass:    0   
Skipped:            0   
Timeout:            0   

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

