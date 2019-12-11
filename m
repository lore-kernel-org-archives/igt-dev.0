Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Dec 2019 08:11:21 -0000
Message-ID: <157605188195.30693.6945314477812661470@emeril.freedesktop.org>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_FreeBSD_Support?=
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
To: D Scott Phillips <d.scott.phillips@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add FreeBSD Support
URL   : https://patchwork.freedesktop.org/series/70729/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/87430 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1113838):
  
    5/292 lib: igt_describe                       FAIL     0.07 s (killed by signal 6 SIGABRT)
  
  --- command ---
  /builds/gfx-ci/igt-ci-tags/build/lib/tests/igt_describe
  --- stderr ---
  igt_describe: ../lib/tests/igt_describe.c:248: main: Assertion `0 == strcmp(DESCRIBE_ALL_OUTPUT, out)' failed.
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1576027580:build_script
  [0Ksection_start:1576027580:after_script
  [0Ksection_end:1576027582:after_script
  [0Ksection_start:1576027582:upload_artifacts_on_failure
  [0Ksection_end:1576027583:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1113839):
  
    5/292 lib: igt_describe                       FAIL     0.12 s (killed by signal 6 SIGABRT)
  
  --- command ---
  /builds/gfx-ci/igt-ci-tags/build/lib/tests/igt_describe
  --- stderr ---
  igt_describe: ../lib/tests/igt_describe.c:248: int main(int, char **): Assertion `0 == strcmp(DESCRIBE_ALL_OUTPUT, out)' failed.
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1576027708:build_script
  [0Ksection_start:1576027708:after_script
  [0Ksection_end:1576027712:after_script
  [0Ksection_start:1576027712:upload_artifacts_on_failure
  [0Ksection_end:1576027717:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1113840):
  
   5/20 lib: igt_describe                       FAIL     0.05 s (killed by signal 6 SIGABRT)
  
  --- command ---
  /builds/gfx-ci/igt-ci-tags/build/lib/tests/igt_describe
  --- stderr ---
  igt_describe: ../lib/tests/igt_describe.c:248: main: Assertion `0 == strcmp(DESCRIBE_ALL_OUTPUT, out)' failed.
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1576027591:build_script
  [0Ksection_start:1576027591:after_script
  [0Ksection_end:1576027593:after_script
  [0Ksection_start:1576027593:upload_artifacts_on_failure
  [0Ksection_end:1576027594:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1113841):
  (runner_test:2781) igt_core-INFO:   #3 ../runner/runner_tests.c:207 main()
  (runner_test:2781) igt_core-INFO:   #4 [__libc_start_main+0xe4]
  (runner_test:2781) igt_core-INFO:   #5 [_start+0x34]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1576027619:build_script
  [0Ksection_start:1576027619:after_script
  [0Ksection_end:1576027622:after_script
  [0Ksection_start:1576027622:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1367 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1113841 responseStatus[0;m=201 Created token[0;m=yisbfGa-
  section_end:1576027638:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1113842):
  (runner_test:6370) igt_core-INFO:   #3 ../runner/runner_tests.c:207 main()
  (runner_test:6370) igt_core-INFO:   #4 [__libc_start_main+0x98]
  (runner_test:6370) igt_core-INFO:   #5 [_start+0x34]
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1576027636:build_script
  [0Ksection_start:1576027636:after_script
  [0Ksection_end:1576027638:after_script
  [0Ksection_start:1576027638:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1368 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1113842 responseStatus[0;m=201 Created token[0;m=8JmvzRer
  section_end:1576027648:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1113843):
  skip-two
  exit:77 ('
  (runner_test:3066) igt_core-INFO: Stack trace:
  ****  END  ****
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1576027650:build_script
  [0Ksection_start:1576027650:after_script
  [0Ksection_end:1576027652:after_script
  [0Ksection_start:1576027652:upload_artifacts_on_failure
  [0K[32;1mUploading artifacts...[0;m
  build: found 1367 matching files                  [0;m 
  Uploading artifacts to coordinator... ok          [0;m  id[0;m=1113843 responseStatus[0;m=201 Created token[0;m=Wzx6Tkmi
  section_end:1576027661:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:test-list-diff has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1113844):
  Downloading artifacts from coordinator... ok      [0;m  id[0;m=1113837 responseStatus[0;m=200 OK token[0;m=fm6a3z1R
  [32;1mDownloading artifacts for build:tests-debian-meson (1113832)...[0;m
  Downloading artifacts from coordinator... ok      [0;m  id[0;m=1113832 responseStatus[0;m=200 OK token[0;m=dtUDS1AD
  section_end:1576027637:download_artifacts
  [0Ksection_start:1576027637:build_script
  [0K[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;m[32;1m$ diff <(sed "s/ /\n/g" meson-test-list.txt| grep -v 'vc4\|v3d\|panfrost' | sort) <(sed "s/ /\n/g" autotools-test-list.txt | sort)[0;m
  1d0
  < 
  10c9
  < amdgpu/amd_prime-e
  ---
  > amdgpu/amd_prime
  section_end:1576027639:build_script
  [0Ksection_start:1576027639:after_script
  [0Ksection_end:1576027640:after_script
  [0Ksection_start:1576027640:upload_artifacts_on_failure
  [0Ksection_end:1576027642:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/87430
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
