Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 30 Jan 2021 12:22:33 -0000
Message-ID: <161200935347.13907.4387722945302681116@emeril.freedesktop.org>
References: <20210130064421.30389-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210130064421.30389-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBtZXNv?=
 =?utf-8?q?n=3A_Turn_on_-Werror_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: meson: Turn on -Werror (rev3)
URL   : https://patchwork.freedesktop.org/series/86465/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
fdc23507d022b68443121ec2c1a951af27c87240 i915/sysfs_clients: Check that client ids are cyclic

273/301 testcase check: gem_eio                 OK       0.13 s 
274/301 testcase check: gem_exec_balancer       OK       0.13 s 
275/301 testcase check: gem_mmap_offset         OK       0.15 s 
276/301 testcase check: i915_pm_rc6_residency   OK       0.15 s 
277/301 testcase check: perf_pmu                OK       0.14 s 
278/301 testcase check: perf                    OK       0.12 s 
279/301 testcase check: testdisplay             OK       0.13 s 
280/301 testcase check: kms_color               OK       0.13 s 
281/301 testcase check: kms_color_chamelium     OK       0.14 s 
282/301 testcase check: sw_sync                 OK       0.13 s 
283/301 testcase check: amdgpu/amd_abm          OK       0.13 s 
284/301 testcase check: amdgpu/amd_basic        OK       0.13 s 
285/301 testcase check: amdgpu/amd_bypass       OK       0.10 s 
286/301 testcase check: amdgpu/amd_color        OK       0.15 s 
287/301 testcase check: amdgpu/amd_cs_nop       OK       0.11 s 
288/301 testcase check: amdgpu/amd_prime        OK       0.09 s 
289/301 runner                                  OK       5.34 s 
290/301 runner_json                             OK       0.10 s 
291/301 assembler: test/mov                     OK       0.08 s 
292/301 assembler: test/frc                     OK       0.04 s 
293/301 assembler: test/regtype                 OK       0.08 s 
294/301 assembler: test/rndd                    OK       0.08 s 
295/301 assembler: test/rndu                    OK       0.01 s 
296/301 assembler: test/rnde                    OK       0.04 s 
297/301 assembler: test/rnde-intsrc             OK       0.02 s 
298/301 assembler: test/rndz                    OK       0.05 s 
299/301 assembler: test/lzd                     OK       0.04 s 
300/301 assembler: test/not                     OK       0.04 s 
301/301 assembler: test/immediate               OK       0.05 s 

OK:       300
FAIL:       1
SKIP:       0
TIMEOUT:    0


The output from the failed tests:

  6/301 lib: igt_describe                       FAIL     0.31 s (killed by signal 6 SIGABRT)

--- command ---
/home/cidrm/igt-gpu-tools/build/lib/tests/igt_describe
--- stderr ---
igt_describe: ../lib/tests/igt_describe.c:181: main: Assertion `0 == strcmp(DESCRIBE_ALL_OUTPUT, out)' failed.
-------

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/python3 -u /usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
