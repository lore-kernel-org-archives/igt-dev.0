Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 09 Aug 2021 16:51:26 -0000
Message-ID: <162852788684.2460.13369362323724413006@emeril.freedesktop.org>
References: <20210809132026.8692-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210809132026.8692-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_K?=
 =?utf-8?q?eep_tests_working_without_relocations_=28rev8=29?=
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
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Keep tests working without relocations (rev8)
URL   : https://patchwork.freedesktop.org/series/90049/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/377806 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12626785):
  298/305 assembler test/rndd                     OK       0.02 s 
  299/305 assembler test/rndu                     OK       0.02 s 
  300/305 assembler test/rnde                     OK       0.01 s 
  301/305 assembler test/rnde-intsrc              OK       0.02 s 
  302/305 assembler test/rndz                     OK       0.02 s 
  303/305 assembler test/lzd                      OK       0.01 s 
  304/305 assembler test/not                      OK       0.02 s 
  305/305 assembler test/immediate                OK       0.01 s 
  
  Ok:                  280
  Expected Fail:         0
  Fail:                  0
  Unexpected Pass:       0
  Skipped:               0
  Timeout:              25
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1628527723:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12626787):
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
    1/291 lib igt_assert                          TIMEOUT 32.09 s 
  section_end:1628527728:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12626788):
    1/291 lib igt_assert                          TIMEOUT 32.08 s 
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
  section_end:1628527729:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12626786):
  298/305 assembler test/rndd                     OK       0.01 s 
  299/305 assembler test/rndu                     OK       0.01 s 
  300/305 assembler test/rnde                     OK       0.01 s 
  301/305 assembler test/rnde-intsrc              OK       0.02 s 
  302/305 assembler test/rndz                     OK       0.01 s 
  303/305 assembler test/lzd                      OK       0.02 s 
  304/305 assembler test/not                      OK       0.02 s 
  305/305 assembler test/immediate                OK       0.01 s 
  
  Ok:                  280
  Expected Fail:         0
  Fail:                  0
  Unexpected Pass:       0
  Skipped:               0
  Timeout:              25
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1628527728:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12626789):
    1/291 lib igt_assert                          TIMEOUT 32.03 s 
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
  section_end:1628527729:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/377806
