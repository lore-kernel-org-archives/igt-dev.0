Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_Test_for_Engine_busynes?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Fri, 08 Dec 2023 09:06:24 -0000
Message-ID: <170202638426.7326.13907523327507209880@emeril.freedesktop.org>
References: <20231208085251.3798137-1-riana.tauro@intel.com>
In-Reply-To: <20231208085251.3798137-1-riana.tauro@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: Test for Engine busyness
URL   : https://patchwork.freedesktop.org/series/127557/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1052381 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/52532753):
  [1637/1651] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meso=
n-generated_gram.c.o'.
  [1638/1651] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_te=
sts.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/739] Generating version.h with a custom command.
  [2/15] Linking target runner/runner_test.
  [3/15] Linking target assembler/intel-gen4asm.
  [4/15] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/=
chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b=
33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overla=
y@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c=
.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33=
d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@=
exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'ov=
erlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-g=
pu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' =
'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@int=
el-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe=
/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-windo=
w.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b=
4b33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--no-undefined -Wl,-=
-as-needed -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib/x86_64-lin=
ux-gnu/libcairo.so /usr/lib/x86_64-linux-gnu/libpciaccess.so /usr/lib/x86_6=
4-linux-gnu/libdrm.so /usr/lib/x86_64-linux-gnu/libdrm_intel.so /usr/lib/x8=
6_64-linux-gnu/libXv.so /usr/lib/x86_64-linux-gnu/libX11.so /usr/lib/x86_64=
-linux-gnu/libXext.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpat=
h-link,/builds/gfx-ci/igt-ci-tags/build/lib =20
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `igt_perf_event=
_found':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:154: undefined referen=
ce to `__igt_fail_assert'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1702026106:step_script
  section_start:1702026106:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702026107:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/52532748):
  [1641/1657] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meso=
n-generated_gram.c.o'.
  [1642/1657] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_te=
sts.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/743] Generating version.h with a custom command.
  [2/17] Linking target runner/runner_test.
  [3/17] Linking target assembler/intel-gen4asm.
  [4/17] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/=
chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b=
33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overla=
y@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c=
.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33=
d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@=
exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'ov=
erlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-g=
pu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' =
'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@int=
el-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe=
/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-windo=
w.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b=
4b33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,--no=
-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo=
.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel=
.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--en=
d-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-t=
ags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `igt_perf_event=
_found':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:154: undefined referen=
ce to `__igt_fail_assert'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1702026155:step_script
  section_start:1702026155:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702026157:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/52532752):
  [1648/1657] Generating intel_upload_blit_large.1 with a custom command.
  [1649/1657] Generating intel_upload_blit_large_gtt.1 with a custom comman=
d.
  [1650/1657] Generating intel_upload_blit_large_map.1 with a custom comman=
d.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/736] Generating version.h with a custom command.
  [2/9] Linking target assembler/intel-gen4asm.
  [3/9] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  clang  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@e=
xe/chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/=
b4b33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-ove=
rlay@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupt=
s.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4=
b33d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overl=
ay@exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' =
'overlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@inte=
l-gpu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.=
o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@=
intel-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@=
exe/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-wi=
ndow.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overla=
y/b4b33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,-=
-no-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libca=
iro.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_in=
tel.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,-=
-end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-c=
i-tags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `igt_perf_event=
_found':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:154: undefined referen=
ce to `__igt_fail_assert'
  clang-9: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
  ninja: build stopped: subcommand failed.
  section_end:1702026166:step_script
  section_start:1702026166:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702026167:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/52532749):
  [1639/1657] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meso=
n-generated_gram.c.o'.
  [1640/1657] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_te=
sts.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/745] Generating version.h with a custom command.
  [2/19] Linking target runner/runner_test.
  [3/19] Linking target assembler/intel-gen4asm.
  [4/19] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/=
chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b=
33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overla=
y@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c=
.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33=
d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@=
exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'ov=
erlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-g=
pu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' =
'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@int=
el-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe=
/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-windo=
w.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b=
4b33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,--no=
-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo=
.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel=
.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--en=
d-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-t=
ags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `igt_perf_event=
_found':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:154: undefined referen=
ce to `__igt_fail_assert'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1702026157:step_script
  section_start:1702026157:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702026158:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/52532750):
  [1639/1657] Compiling C object 'assembler/assembler@@intel-gen4asm@exe/me=
son-generated_gram.c.o'.
  [1640/1657] Compiling C object 'runner/runner@@runner_test@exe/runner_tes=
ts.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/745] Generating version.h with a custom command.
  [2/19] Linking target runner/runner_test.
  [3/19] Linking target assembler/intel-gen4asm.
  [4/19] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  cc  -o overlay/intel-gpu-overlay 'overlay/overlay@@intel-gpu-overlay@exe/=
chart.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/config.c.o' 'overlay/ove=
rlay@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/overlay@@intel-gpu-overla=
y@exe/debugfs.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gem-interrupts.c=
.o' 'overlay/overlay@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/overl=
ay@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/overlay@@intel-gpu-overlay@=
exe/gpu-perf.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gpu-freq.c.o' 'ov=
erlay/overlay@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/overlay@@intel-g=
pu-overlay@exe/power.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/rc6.c.o' =
'overlay/overlay@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/overlay@@int=
el-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/overlay@@intel-gpu-overlay@exe=
/x11_x11-overlay.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_x11-windo=
w.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/o=
verlay@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--no-undefined -Wl,-=
-as-needed -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo=
.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel=
.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--en=
d-group =20
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `igt_perf_event=
_found':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:154: undefined referen=
ce to `__igt_fail_assert'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1702026154:step_script
  section_start:1702026154:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1702026155:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1052381
