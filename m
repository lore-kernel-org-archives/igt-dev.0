Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 09:12:20 -0000
Message-ID: <160620914017.10863.1254258335246160095@emeril.freedesktop.org>
References: <20201124090500.26953-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201124090500.26953-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGRl?=
 =?utf-8?q?d_dynamic_Subtest_=28rev4=29?=
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
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Added dynamic Subtest (rev4)
URL   : https://patchwork.freedesktop.org/series/83576/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
5236e5d4be3ab5e2fedacc32152120b7fb77bf9f lib/rendercopy_gen9: Ensure to cover all destination area

278/301 testcase check: perf                    OK       0.07 s 
279/301 testcase check: testdisplay             OK       0.11 s 
280/301 testcase check: kms_color               OK       0.10 s 
281/301 testcase check: kms_color_chamelium     OK       0.11 s 
282/301 testcase check: sw_sync                 OK       0.11 s 
283/301 testcase check: amdgpu/amd_abm          OK       0.11 s 
284/301 testcase check: amdgpu/amd_basic        OK       0.14 s 
285/301 testcase check: amdgpu/amd_bypass       OK       0.10 s 
286/301 testcase check: amdgpu/amd_color        OK       0.09 s 
287/301 testcase check: amdgpu/amd_cs_nop       OK       0.07 s 
288/301 testcase check: amdgpu/amd_prime        OK       0.06 s 
289/301 runner                                  OK       5.08 s 
290/301 runner_json                             OK       0.07 s 
291/301 assembler: test/mov                     OK       0.02 s 
292/301 assembler: test/frc                     OK       0.08 s 
293/301 assembler: test/regtype                 OK       0.07 s 
294/301 assembler: test/rndd                    OK       0.04 s 
295/301 assembler: test/rndu                    OK       0.06 s 
296/301 assembler: test/rnde                    OK       0.07 s 
297/301 assembler: test/rnde-intsrc             OK       0.06 s 
298/301 assembler: test/rndz                    OK       0.06 s 
299/301 assembler: test/lzd                     OK       0.05 s 
300/301 assembler: test/not                     OK       0.06 s 
301/301 assembler: test/immediate               OK       0.04 s 

OK:       300
FAIL:       1
SKIP:       0
TIMEOUT:    0


The output from the failed tests:

 46/301 testcase check: kms_atomic_transition   FAIL     0.53 s (exit status 1)

--- command ---
/home/cidrm/igt-gpu-tools/tests/igt_command_line.sh kms_atomic_transition
--- stdout ---
tests/kms_atomic_transition:
  Checking invalid option handling...
  Checking valid option handling...
  Checking subtest enumeration...
    test does not exit with 0 or 79 with --list-subtests!
FAIL: tests/kms_atomic_transition
-------

Full log written to /home/cidrm/igt-gpu-tools/build/meson-logs/testlog.txt
FAILED: meson-test 
/usr/bin/python3 -u /usr/bin/meson test --no-rebuild --print-errorlogs
ninja: build stopped: subcommand failed.


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
