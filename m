Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Dec 2019 16:40:47 -0000
Message-ID: <157746484718.27188.16322873194068253746@emeril.freedesktop.org>
References: <20191227162312.19920-1-robert.m.fosha@intel.com>
In-Reply-To: <20191227162312.19920-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_l?=
 =?utf-8?q?ib/igt=5Fperf=3A_Support_multiple_GPUs?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_perf: Support multiple GPUs
URL   : https://patchwork.freedesktop.org/series/71439/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/92289 for the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1235612):
  [933/934] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meson-generated_gram.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/364] Generating version.h with a custom command.
  [2/3] Linking target assembler/intel-gen4asm.
  [3/3] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay 
  cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-window.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b4b33d2@@intel-gpu-overl
 ay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `perf_event_sysfs_path':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:25: undefined reference to `drm_open_driver'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:26: undefined reference to `__igt_debugfs_read'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1577464641:build_script
  [0Ksection_start:1577464641:after_script
  [0Ksection_end:1577464642:after_script
  [0Ksection_start:1577464642:upload_artifacts_on_failure
  [0Ksection_end:1577464644:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1235613):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/364] Generating version.h with a custom command.
  [2/4] Linking target runner/runner_test.
  [3/4] Linking target assembler/intel-gen4asm.
  [4/4] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay 
  cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-window.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b4b33d2@@intel-gpu-overl
 ay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `perf_event_sysfs_path':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:25: undefined reference to `drm_open_driver'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:26: undefined reference to `__igt_debugfs_read'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1577464641:build_script
  [0Ksection_start:1577464641:after_script
  [0Ksection_end:1577464642:after_script
  [0Ksection_start:1577464642:upload_artifacts_on_failure
  [0Ksection_end:1577464644:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1235614):
  [355/360] Linking target runner/runner_test.
  [356/360] Linking target runner/runner_json_test.
  [357/360] Linking static target assembler/libbrw.a.
  [358/360] Linking target assembler/intel-gen4asm.
  [359/360] Linking target assembler/intel-gen4disasm.
  [360/360] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay 
  cc  -o overlay/intel-gpu-overlay 'overlay/overlay@@intel-gpu-overlay@exe/chart.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/config.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/debugfs.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gem-interrupts.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gpu-perf.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gpu-freq.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/power.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/rc6.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_x11-overlay.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_x11-window.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/overlay@@intel-gpu-overl
 ay@exe/kms_kms-overlay.c.o' -Wl,--no-undefined -Wl,--as-needed -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--end-group  
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `perf_event_sysfs_path':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:25: undefined reference to `drm_open_driver'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:26: undefined reference to `__igt_debugfs_read'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1577464705:build_script
  [0Ksection_start:1577464705:after_script
  [0Ksection_end:1577464706:after_script
  [0Ksection_start:1577464706:upload_artifacts_on_failure
  [0Ksection_end:1577464707:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1235615):
  1 warning generated.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/364] Generating version.h with a custom command.
  [2/3] Linking target assembler/intel-gen4asm.
  [3/3] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay 
  clang  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-window.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b4b33d2@@intel-gpu-ov
 erlay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `perf_event_sysfs_path':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:25: undefined reference to `drm_open_driver'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:26: undefined reference to `__igt_debugfs_read'
  clang-9: error: linker command failed with exit code 1 (use -v to see invocation)
  ninja: build stopped: subcommand failed.
  section_end:1577464680:build_script
  [0Ksection_start:1577464680:after_script
  [0Ksection_end:1577464681:after_script
  [0Ksection_start:1577464681:upload_artifacts_on_failure
  [0Ksection_end:1577464683:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1235616):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/371] Generating version.h with a custom command.
  [2/11] Linking target runner/runner_test.
  [3/11] Linking target assembler/intel-gen4asm.
  [4/11] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay 
  cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-window.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b4b33d2@@intel-gpu-overl
 ay@exe/kms_kms-overlay.c.o' -Wl,--no-undefined -Wl,--as-needed -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib/x86_64-linux-gnu/libcairo.so /usr/lib/x86_64-linux-gnu/libpciaccess.so /usr/lib/x86_64-linux-gnu/libdrm.so /usr/lib/x86_64-linux-gnu/libdrm_intel.so /usr/lib/x86_64-linux-gnu/libXv.so /usr/lib/x86_64-linux-gnu/libX11.so /usr/lib/x86_64-linux-gnu/libXext.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib  
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `perf_event_sysfs_path':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:25: undefined reference to `drm_open_driver'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:26: undefined reference to `__igt_debugfs_read'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1577464662:build_script
  [0Ksection_start:1577464662:after_script
  [0Ksection_end:1577464663:after_script
  [0Ksection_start:1577464663:upload_artifacts_on_failure
  [0Ksection_end:1577464665:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

build:tests-debian-autotools has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1235621):
  make[3]: Entering directory '/builds/gfx-ci/igt-ci-tags/tools'
    CCLD     intel_gpu_top
  /usr/bin/ld: ../lib/.libs/libigt_perf.a(igt_perf.o): in function `perf_event_sysfs_path':
  /builds/gfx-ci/igt-ci-tags/lib/igt_perf.c:25: undefined reference to `drm_open_driver'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/lib/igt_perf.c:26: undefined reference to `__igt_debugfs_read'
  collect2: error: ld returned 1 exit status
  make[3]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tools'
  make[3]: *** [Makefile:1029: intel_gpu_top] Error 1
  make[2]: Leaving directory '/builds/gfx-ci/igt-ci-tags/tools'
  make[2]: *** [Makefile:1308: all-recursive] Error 1
  make[1]: Leaving directory '/builds/gfx-ci/igt-ci-tags'
  make[1]: *** [Makefile:514: all-recursive] Error 1
  make: *** [Makefile:446: all] Error 2
  section_end:1577464647:build_script
  [0Ksection_start:1577464647:after_script
  [0Ksection_end:1577464648:after_script
  [0Ksection_start:1577464648:upload_artifacts_on_failure
  [0Ksection_end:1577464649:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/92289
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
