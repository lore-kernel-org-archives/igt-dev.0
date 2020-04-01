Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 02:17:49 -0000
Message-ID: <158570746970.25625.3205450081609725479@emeril.freedesktop.org>
References: <20200331115824.2481-1-mika.kahola@intel.com>
In-Reply-To: <20200331115824.2481-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fconcurrent=3A_Calculate_maximum_number_of_planes_to_mee?=
 =?utf-8?q?t_bandwidth_requirement?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Calculate maximum number of planes to meet bandwidth requirement
URL   : https://patchwork.freedesktop.org/series/75323/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
98927dfde17aecaecfe67bb9853ceca326ca2b23 lib: Sync i915_pciids.h with kernel

273/286 testcase check: amdgpu/amd_prime        OK       0.10 s 
274/286 runner                                  OK       5.43 s 
275/286 runner_json                             OK       0.10 s 
276/286 assembler: test/mov                     OK       0.03 s 
277/286 assembler: test/frc                     OK       0.08 s 
278/286 assembler: test/regtype                 OK       0.07 s 
279/286 assembler: test/rndd                    OK       0.08 s 
280/286 assembler: test/rndu                    OK       0.06 s 
281/286 assembler: test/rnde                    OK       0.06 s 
282/286 assembler: test/rnde-intsrc             OK       0.06 s 
283/286 assembler: test/rndz                    OK       0.05 s 
284/286 assembler: test/lzd                     OK       0.03 s 
285/286 assembler: test/not                     OK       0.05 s 
286/286 assembler: test/immediate               OK       0.04 s 

OK:       285
FAIL:       1
SKIP:       0
TIMEOUT:    0


The output from the failed tests:

 45/286 testcase check: kms_concurrent          FAIL     0.37 s (exit status 1)

--- command ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh kms_concurrent
--- stdout ---
tests/kms_concurrent:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does not exit with 0 or 79 with --list-subtests!
FAIL: tests/kms_concurrent
--- stderr ---
Received signal SIGSEGV.
Stack trace: 
 #0 [fatal_sig_handler+0xd6]
 #1 [killpg+0x40]
 #2 [run_tests_for_pipe.constprop.7+0x4a]
 #3 [__real_main371+0x5d]
 #4 [main+0x39]
 #5 [__libc_start_main+0xe7]
 #6 [_start+0x2a]
-------

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/python3 -u /usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
