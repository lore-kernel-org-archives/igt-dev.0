Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 18 Mar 2020 13:52:12 -0000
Message-ID: <158453953214.25100.5439639003394090944@emeril.freedesktop.org>
References: <20200318133326.18801-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200318133326.18801-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?/kms=3A_Use_bare_number_of_crtc_index_to?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/kms: Use bare number of crtc index to
URL   : https://patchwork.freedesktop.org/series/74830/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
9c74586ea8e051d074864bce72baf5a688a0a437 i915/gem_ring_sync_loop: Removal of test

262/285 testcase check: perf                    OK       0.14 s 
263/285 testcase check: testdisplay             OK       0.13 s 
264/285 testcase check: kms_color               OK       0.14 s 
265/285 testcase check: kms_color_chamelium     OK       0.14 s 
266/285 testcase check: sw_sync                 OK       0.11 s 
267/285 testcase check: amdgpu/amd_abm          OK       0.12 s 
268/285 testcase check: amdgpu/amd_basic        OK       0.10 s 
269/285 testcase check: amdgpu/amd_bypass       OK       0.10 s 
270/285 testcase check: amdgpu/amd_color        OK       0.09 s 
271/285 testcase check: amdgpu/amd_cs_nop       OK       0.08 s 
272/285 testcase check: amdgpu/amd_prime        OK       0.10 s 
273/285 runner                                  OK       1.85 s 
274/285 runner_json                             OK       0.09 s 
275/285 assembler: test/mov                     OK       0.10 s 
276/285 assembler: test/frc                     OK       0.09 s 
277/285 assembler: test/regtype                 OK       0.09 s 
278/285 assembler: test/rndd                    OK       0.08 s 
279/285 assembler: test/rndu                    OK       0.06 s 
280/285 assembler: test/rnde                    OK       0.06 s 
281/285 assembler: test/rnde-intsrc             OK       0.07 s 
282/285 assembler: test/rndz                    OK       0.06 s 
283/285 assembler: test/lzd                     OK       0.05 s 
284/285 assembler: test/not                     OK       0.03 s 
285/285 assembler: test/immediate               OK       0.05 s 

OK:       284
FAIL:       1
SKIP:       0
TIMEOUT:    0


The output from the failed tests:

 39/285 testcase check: kms_atomic_transition   FAIL    20.86 s (exit status 2)

--- command ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh kms_atomic_transition
--- stdout ---
tests/kms_atomic_transition:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
--- stderr ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh: xrealloc: cannot allocate 18446744071562067968 bytes
-------

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/python3 -u /usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
