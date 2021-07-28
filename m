Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 28 Jul 2021 23:15:43 -0000
Message-ID: <162751414347.22806.15529906796595501950@emeril.freedesktop.org>
References: <20210728171616.2242447-1-markyacoub@chromium.org>
In-Reply-To: <20210728171616.2242447-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fflip=3A_Discard_any_stale_event_at_each_retry?=
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_flip: Discard any stale event at each retry
URL   : https://patchwork.freedesktop.org/series/93133/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/369629 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12280799):
  
    9/305 lib igt_exit_handler                    TIMEOUT 30.09 s 
  
  --- command ---
  /builds/gfx-ci/igt-ci-tags/build/lib/tests/igt_exit_handler
  -------
  
   10/305 lib igt_fork                            TIMEOUT 30.07 s 
  
  --- command ---
  /builds/gfx-ci/igt-ci-tags/build/lib/tests/igt_fork
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1627513727:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12280801):
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
    1/291 lib igt_assert                          TIMEOUT 32.06 s 
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1627513732:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12280802):
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
    1/291 lib igt_assert                          TIMEOUT 32.03 s 
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1627513732:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12280800):
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
   1/24 lib igt_assert                          TIMEOUT 32.03 s 
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1627513731:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds
  

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/12280803):
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
    1/291 lib igt_assert                          TIMEOUT 32.04 s 
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1627513736:step_script
  ERROR: Job failed: execution took longer than 1h0m0s seconds

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/369629
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
