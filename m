Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Aug 2021 09:04:41 -0000
Message-ID: <162849988141.2458.7110460047002293745@emeril.freedesktop.org>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_allocator_support_in_IGT_=28rev3=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add allocator support in IGT (rev3)
URL   : https://patchwork.freedesktop.org/series/93464/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/377482 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12608439):
  298/305 assembler test/rndd                     OK       0.02 s 
  299/305 assembler test/rndu                     OK       0.02 s 
  300/305 assembler test/rnde                     OK       0.01 s 
  301/305 assembler test/rnde-intsrc              OK       0.01 s 
  302/305 assembler test/rndz                     OK       0.02 s 
  303/305 assembler test/lzd                      OK       0.02 s 
  304/305 assembler test/not                      OK       0.01 s 
  305/305 assembler test/immediate                OK       0.02 s 
  
  Ok:                  280
  Expected Fail:         0
  Fail:                  0
  Unexpected Pass:       0
  Skipped:               0
  Timeout:              25
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1628495988:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12608441):
  Traceback (most recent call last):
    File "/usr/lib/python3/dist-packages/mesonbuild/mesonmain.py", line 112, in run
      return options.run_func(options)
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 805, in run
      return th.doit()
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 555, in doit
      self.run_tests(tests)
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 715, in run_tests
      self.drain_futures(futures)
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 732, in drain_futures
      self.print_stats(numlen, tests, name, result.result(), i)
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 505, in print_stats
      result_str += "\n\n" + result.get_log()
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 178, in get_log
      res += self.stde
  TypeError: can only concatenate str (not "bytes") to str
    1/291 lib igt_assert                          TIMEOUT 32.07 s 
  section_end:1628495988:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12608438):
  295/305 assembler test/mov                      OK       0.06 s 
  296/305 assembler test/frc                      OK       0.04 s 
  297/305 assembler test/regtype                  OK       0.06 s 
  298/305 assembler test/rndd                     OK       0.06 s 
  299/305 assembler test/rndu                     OK       0.06 s 
  300/305 assembler test/rnde                     OK       0.05 s 
  301/305 assembler test/rnde-intsrc              OK       0.08 s 
  302/305 assembler test/rndz                     OK       0.08 s 
  303/305 assembler test/lzd                      OK       0.03 s 
  304/305 assembler test/not                      OK       0.06 s 
  305/305 assembler test/immediate                OK       0.03 s 
  
  Ok:                  280
  Expected Fail:         0
  Fail:                  0
  Unexpected Pass:       0
  Skipped:               0
  Timeout:              25
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12608440):
  $ meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
  ninja: Entering directory `/builds/gfx-ci/igt-ci-tags/build'
  [1/366] Generating version.h with a custom command.
    1/291 lib igt_assert                          TIMEOUT 32.02 s 
  Traceback (most recent call last):
    File "/usr/lib/python3/dist-packages/mesonbuild/mesonmain.py", line 112, in run
      return options.run_func(options)
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 805, in run
      return th.doit()
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 555, in doit
      self.run_tests(tests)
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 715, in run_tests
      self.drain_futures(futures)
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 732, in drain_futures
      self.print_stats(numlen, tests, name, result.result(), i)
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 505, in print_stats
      result_str += "\n\n" + result.get_log()
    File "/usr/lib/python3/dist-packages/mesonbuild/mtest.py", line 178, in get_log
      res += self.stde
  TypeError: can only concatenate str (not "bytes") to str

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/377482
