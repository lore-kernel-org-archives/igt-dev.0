Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 20 Feb 2020 05:50:33 -0000
Message-ID: <158217783380.17408.8543835441950236962@emeril.freedesktop.org>
References: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200220051432.21898-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Frequest=5Fretire=3A_Removal_of_test?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_request_retire: Removal of test
URL   : https://patchwork.freedesktop.org/series/73689/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/110667 for the overview.

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1681446):
  section_end:1582177523:get_sources
  [0Ksection_start:1582177523:restore_cache
  [0Ksection_end:1582177524:restore_cache
  [0Ksection_start:1582177524:download_artifacts
  [0K[32;1mDownloading artifacts for build:tests-fedora (1681436)...[0;m
  Downloading artifacts from coordinator... ok      [0;m  id[0;m=1681436 responseStatus[0;m=200 OK token[0;m=H4dy7moh
  [0;33mWARNING: build/tools/intel_audio_dump: write build/tools/intel_audio_dump: no space left on device (suppressing repeats)[0;m 
  [0;33mWARNING: build/tools/null_state_gen/: mkdir build/tools/null_state_gen: no space left on device (suppressing repeats)[0;m 
  [0;33mWARNING: build/tools/null_state_gen/: chmod build/tools/null_state_gen/: no such file or directory (suppressing repeats)[0;m 
  [0;33mWARNING: build/tools/null_state_gen/: lchown build/tools/null_state_gen/: no such file or directory (suppressing repeats)[0;m 
  section_end:1582177527:download_artifacts
  [0Ksection_start:1582177527:build_script
  [0K[0KAuthenticating with credentials from job payload (GitLab Registry)
  [0;msection_end:1582177528:build_script
  [0Ksection_start:1582177528:after_script
  [0Ksection_end:1582177529:after_script
  [0Ksection_start:1582177529:upload_artifacts_on_failure
  [0Ksection_end:1582177531:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed (system failure): Error response from daemon: OCI runtime create failed: container_linux.go:344: starting container process caused "process_linux.go:424: container init caused \"rootfs_linux.go:58: mounting \\\"/var/cache/gitlab-runner/cache\\\" to rootfs \\\"/var/lib/docker/overlay2/03c6de301dba2c4c4d3676a656d6521e6c868c0ceda174cba43b2b4fce1f9f49/merged\\\" at \\\"/var/lib/docker/overlay2/03c6de301dba2c4c4d3676a656d6521e6c868c0ceda174cba43b2b4fce1f9f49/merged/cache\\\" caused \\\"mkdir /var/lib/docker/overlay2/03c6de301dba2c4c4d3676a656d6521e6c868c0ceda174cba43b2b4fce1f9f49/merged/cache: no space left on device\\\"\"": unknown (executor_docker.go:839:0s)
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1681447):
  
  --- command ---
  /builds/gfx-ci/igt-ci-tags/tests/igt_command_line.sh vc4_label_bo
  --- stdout ---
  tests/vc4_label_bo:
    Checking invalid option handling...
  FAIL: tests/vc4_label_bo
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1582177541:build_script
  [0Ksection_start:1582177541:after_script
  [0Ksection_end:1582177542:after_script
  [0Ksection_start:1582177542:upload_artifacts_on_failure
  [0Ksection_end:1582177543:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1681455):
  
  --- command ---
  /builds/gfx-ci/igt-ci-tags/tests/igt_command_line.sh drm_read
  --- stdout ---
  tests/drm_read:
    Checking invalid option handling...
  FAIL: tests/drm_read
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1582177554:build_script
  [0Ksection_start:1582177554:after_script
  [0Ksection_end:1582177555:after_script
  [0Ksection_start:1582177555:upload_artifacts_on_failure
  [0Ksection_end:1582177557:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

test:ninja-test-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1681456):
  281/282 assembler: test/not                     OK       0.01 s 
  282/282 assembler: test/immediate               OK       0.01 s 
  
  Ok:                  279
  Expected Fail:         3
  Fail:                  0
  Unexpected Pass:       0
  Skipped:               0
  Timeout:               0
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  section_end:1582177563:build_script
  [0Ksection_start:1582177563:after_script
  [0Ksection_end:1582177564:after_script
  [0Ksection_start:1582177564:archive_cache
  [0Ksection_end:1582177565:archive_cache
  [0Ksection_start:1582177565:upload_artifacts_on_failure
  [0Ksection_end:1582177567:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed (system failure): Error response from daemon: OCI runtime create failed: container_linux.go:344: starting container process caused "process_linux.go:424: container init caused \"rootfs_linux.go:58: mounting \\\"/var/lib/docker/volumes/ad04a429943ccabb23d1a50be9669f298d8df088fdacbe1566494899b9f30c7d/_data\\\" to rootfs \\\"/var/lib/docker/overlay2/56a493b0a4e6f83a3d8787580db95e3050ee012360ae64c174b865fca27bdc21/merged\\\" at \\\"/var/lib/docker/overlay2/56a493b0a4e6f83a3d8787580db95e3050ee012360ae64c174b865fca27bdc21/merged/builds\\\" caused \\\"mkdir /var/lib/docker/overlay2/56a493b0a4e6f83a3d8787580db95e3050ee012360ae64c174b865fca27bdc21/merged/builds: no space left on device\\\"\"": unknown (executor_docker.go:839:0s)
  [0;m

test:ninja-test has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1681457):
  
  --- command ---
  /builds/gfx-ci/igt-ci-tags/tests/igt_command_line.sh drm_read
  --- stdout ---
  tests/drm_read:
    Checking invalid option handling...
  FAIL: tests/drm_read
  -------
  
  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
  FAILED: meson-test 
  /usr/bin/meson test --no-rebuild --print-errorlogs
  ninja: build stopped: subcommand failed.
  section_end:1582177579:build_script
  [0Ksection_start:1582177579:after_script
  [0Ksection_end:1582177581:after_script
  [0Ksection_start:1582177581:upload_artifacts_on_failure
  [0Ksection_end:1582177582:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/110667
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
