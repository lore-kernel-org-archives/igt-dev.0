Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Nov 2021 13:38:32 -0000
Message-ID: <163732911234.2298.2045244147594155001@emeril.freedesktop.org>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBzZXJp?=
 =?utf-8?q?es_starting_with_=5Bi-g-t=2C1/6=5D_tests/api=5Fintel=5Fallocato?=
 =?utf-8?q?r=3A_Fix_build_warning?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/6] tests/api_intel_allocator: Fix build warning
URL   : https://patchwork.freedesktop.org/series/97101/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
2e0355faad5c2e81cd6705b76e529ce526c7c9bf igt_core: Fix docs for SLOW_QUICK

287/315 testcase check sw_sync                  OK       0.13 s 
288/315 testcase check amdgpu/amd_abm           OK       0.15 s 
289/315 testcase check amdgpu/amd_assr          OK       0.15 s 
290/315 testcase check amdgpu/amd_basic         OK       0.15 s 
291/315 testcase check amdgpu/amd_bypass        OK       0.14 s 
292/315 testcase check amdgpu/amd_color         OK       0.15 s 
293/315 testcase check amdgpu/amd_cs_nop        OK       0.13 s 
294/315 testcase check amdgpu/amd_hotplug       OK       0.14 s 
295/315 testcase check amdgpu/amd_info          OK       0.13 s 
296/315 testcase check amdgpu/amd_prime         OK       0.15 s 
297/315 testcase check amdgpu/amd_max_bpc       OK       0.18 s 
298/315 testcase check amdgpu/amd_module_load   OK       0.15 s 
299/315 testcase check amdgpu/amd_mem_leak      OK       0.19 s 
300/315 testcase check amdgpu/amd_link_settings  OK       0.13 s 
301/315 testcase check amdgpu/amd_vrr_range     OK       0.13 s 
302/315 testcase check gem_concurrent_all       OK       5.30 s 
303/315 runner                                  OK       4.56 s 
304/315 runner_json                             OK       0.09 s 
305/315 assembler test/mov                      OK       0.08 s 
306/315 assembler test/frc                      OK       0.09 s 
307/315 assembler test/regtype                  OK       0.09 s 
308/315 assembler test/rndd                     OK       0.08 s 
309/315 assembler test/rndu                     OK       0.09 s 
310/315 assembler test/rnde                     OK       0.05 s 
311/315 assembler test/rnde-intsrc              OK       0.08 s 
312/315 assembler test/rndz                     OK       0.05 s 
313/315 assembler test/lzd                      OK       0.06 s 
314/315 assembler test/not                      OK       0.07 s 
315/315 assembler test/immediate                OK       0.03 s 

OK:       314
FAIL:       1
SKIP:       0
TIMEOUT:    0


The output from the failed tests:

  2/315 lib igt_abort                           FAIL     0.56 s (killed by signal 6 SIGABRT)

--- command ---
/home/cidrm/igt-gpu-tools/build/lib/tests/igt_abort
--- stderr ---
igt_abort: ../lib/tests/igt_abort.c:137: main: Assertion `strstr(err, "CRITICAL: Test abort")' failed.
-------

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/python3 -u /usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

