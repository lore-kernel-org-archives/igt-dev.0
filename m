Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 05 Aug 2022 06:55:02 -0000
Message-ID: <165968250226.21187.4719323034756391033@emeril.freedesktop.org>
References: <20220805054108.7981-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220805054108.7981-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBrbXNf?=
 =?utf-8?q?flip=5Fevent=5Fleak=3A_Create_dynamic_subtests?=
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

Series: kms_flip_event_leak: Create dynamic subtests
URL   : https://patchwork.freedesktop.org/series/107012/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
209230467200f2fa63a6f71fe6299996470dd813 test/i915/i915_suspend: Use SUSPEND_STATE_S3 to enforce S3.

297/329 testcase check amdgpu/amd_basic               OK               0.20s
298/329 testcase check amdgpu/amd_bypass              OK               0.19s
299/329 testcase check amdgpu/amd_color               OK               0.19s
300/329 testcase check amdgpu/amd_cs_nop              OK               0.19s
301/329 testcase check amdgpu/amd_hotplug             OK               0.18s
302/329 testcase check amdgpu/amd_info                OK               0.17s
303/329 testcase check amdgpu/amd_prime               OK               0.16s
304/329 testcase check amdgpu/amd_max_bpc             OK               0.15s
305/329 testcase check amdgpu/amd_module_load         OK               0.15s
306/329 testcase check amdgpu/amd_mem_leak            OK               0.14s
307/329 testcase check amdgpu/amd_link_settings       OK               0.14s
308/329 testcase check amdgpu/amd_vrr_range           OK               0.13s
309/329 testcase check amdgpu/amd_mode_switch         OK               0.13s
310/329 testcase check amdgpu/amd_dp_dsc              OK               0.13s
311/329 testcase check amdgpu/amd_psr                 OK               0.12s
312/329 testcase check amdgpu/amd_plane               OK               0.12s
313/329 testcase check amdgpu/amd_ilr                 OK               0.11s
314/329 runner_json                                   OK               0.09s
315/329 assembler test/mov                            OK               0.08s
316/329 assembler test/frc                            OK               0.08s
317/329 assembler test/regtype                        OK               0.07s
318/329 assembler test/rndd                           OK               0.07s
319/329 assembler test/rndu                           OK               0.06s
320/329 assembler test/rnde                           OK               0.06s
321/329 assembler test/rnde-intsrc                    OK               0.05s
322/329 assembler test/rndz                           OK               0.04s
323/329 assembler test/lzd                            OK               0.04s
324/329 assembler test/not                            OK               0.04s
325/329 assembler test/immediate                      OK               0.03s
326/329 lib igt_nesting                               OK               2.25s
327/329 lib igt_fork                                  OK               2.63s
328/329 runner                                        OK               4.60s
329/329 testcase check gem_concurrent_all             OK               5.28s

Summary of Failures:

 79/329 testcase check kms_flip_event_leak            FAIL             0.42s   exit status 1


Ok:                 325 
Expected Fail:      3   
Fail:               1   
Unexpected Pass:    0   
Skipped:            0   
Timeout:            0   

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

