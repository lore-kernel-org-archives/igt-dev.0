Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 24 Feb 2023 13:17:52 -0000
Message-ID: <167724467272.4564.6513298707008303970@emeril.freedesktop.org>
References: <20230224104443.62373-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230224104443.62373-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?nitial_Xe_test_suite_=28rev3=29?=
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

Series: Initial Xe test suite (rev3)
URL   : https://patchwork.freedesktop.org/series/112191/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/815644 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/36975089):
  [2/279] Linking target lib/libi915_perf.so.1.5.
  [3/279] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/279] Linking target tests/gem_barrier_race.
  [5/279] Linking target tests/perf.
  [6/279] Linking target tests/core_hotunplug.
  [7/279] Linking target tests/xe/xe_exec_threads.
  [8/279] Compiling C object 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o'.
  FAILED: tests/xe/2e9594b@@xe_query@exe/xe_query.c.o=20
  cc -Itests/xe/2e9594b@@xe_query@exe -Itests/xe -I../tests/xe -I../include=
/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I=
. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linu=
x-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/i=
nclude/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/inclu=
de/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -=
I/usr/include/alsa -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FIL=
E_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_S=
OURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclara=
tion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -=
Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissi=
ng-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wred=
undant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clo=
bbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointe=
r-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unuse=
d-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werro=
r=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissin=
g-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-t=
ype -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -f=
no-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/xe/2e9594b@@=
xe_query@exe/xe_query.c.o' -MF 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o=
.d' -o 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o' -c ../tests/xe/xe_quer=
y.c
  ../tests/xe/xe_query.c:53:82: error: expected =E2=80=98,=E2=80=99 before =
=E2=80=98)=E2=80=99 token
   static_assert(INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES+1 =3D=3D __INTEL_HWCON=
FIG_KEY_LIMIT);
                                                                           =
         ^
                                                                           =
         ,
  ninja: build stopped: subcommand failed.
  section_end:1677244322:step_script
  section_start:1677244322:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244323:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/36975092):
  [6/255] Linking target tests/gem_barrier_race.
  [7/255] Linking target tests/perf_pmu.
  [8/255] Linking target tests/perf.
  [9/255] Linking target tests/core_hotunplug.
  [10/255] Linking target tests/xe/xe_exec_reset.
  [11/255] Linking target tests/xe/xe_exec_threads.
  [12/255] Compiling C object 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o'.
  FAILED: tests/xe/2e9594b@@xe_query@exe/xe_query.c.o=20
  /usr/bin/aarch64-linux-gnu-gcc -Itests/xe/2e9594b@@xe_query@exe -Itests/x=
e -I../tests/xe -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../li=
b -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/gli=
b-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1=
 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/us=
r/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/aarch64-linux=
-gnu -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalwa=
ys -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 =
-O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function=
-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0=
 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-n=
oreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpoin=
ter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -W=
unused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializ=
ers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-param=
eter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3D=
implicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -=
Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -We=
rror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dw=
rite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tes=
ts/xe/2e9594b@@xe_query@exe/xe_query.c.o' -MF 'tests/xe/2e9594b@@xe_query@e=
xe/xe_query.c.o.d' -o 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o' -c ../t=
ests/xe/xe_query.c
  ../tests/xe/xe_query.c:53:82: error: expected =E2=80=98,=E2=80=99 before =
=E2=80=98)=E2=80=99 token
   static_assert(INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES+1 =3D=3D __INTEL_HWCON=
FIG_KEY_LIMIT);
                                                                           =
         ^
                                                                           =
         ,
  ninja: build stopped: subcommand failed.
  section_end:1677244376:step_script
  section_start:1677244376:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244377:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/36975091):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/838] Generating version.h with a custom command.
  [2/758] Linking target tests/kms_plane_lowres.
  [3/758] Linking target lib/libi915_perf.so.1.5.
  [4/758] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [5/758] Compiling C object 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o'.
  FAILED: tests/xe/2e9594b@@xe_query@exe/xe_query.c.o=20
  /usr/bin/arm-linux-gnueabihf-gcc -Itests/xe/2e9594b@@xe_query@exe -Itests=
/xe -I../tests/xe -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../=
lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/g=
lib-2.0 -I/usr/lib/arm-linux-gnueabihf/glib-2.0/include -I/usr/include/pixm=
an-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -=
I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/arm-linux=
-gnueabihf -I/usr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=
=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad=
-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallth=
rough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -W=
missing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definiti=
on -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuniniti=
alized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unu=
sed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -=
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD=
 -MQ 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o' -MF 'tests/xe/2e9594b@@x=
e_query@exe/xe_query.c.o.d' -o 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o=
' -c ../tests/xe/xe_query.c
  ../tests/xe/xe_query.c:53:82: error: expected =E2=80=98,=E2=80=99 before =
=E2=80=98)=E2=80=99 token
   static_assert(INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES+1 =3D=3D __INTEL_HWCON=
FIG_KEY_LIMIT);
                                                                           =
         ^
                                                                           =
         ,
  ninja: build stopped: subcommand failed.
  section_end:1677244400:step_script
  section_start:1677244400:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244401:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/36975093):
  [522/1278] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated=
_.._i915_perf_registers_acmgt3.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/838] Generating version.h with a custom command.
  [2/759] Linking target lib/libi915_perf.so.1.5.
  [3/759] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/759] Compiling C object 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o'.
  FAILED: tests/xe/2e9594b@@xe_query@exe/xe_query.c.o=20
  /usr/bin/mips-linux-gnu-gcc -Itests/xe/2e9594b@@xe_query@exe -Itests/xe -=
I../tests/xe -I../include/drm-uapi -I../include/linux-uapi -Ilib -I../lib -=
I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2=
.0 -I/usr/lib/mips-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/us=
r/include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/incl=
ude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/mips-linux-gnu -I/u=
sr/include/valgrind -I/usr/include/alsa -fdiagnostics-color=3Dalways -pipe =
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D=
_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wd=
eclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogica=
l-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -=
Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith=
 -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -W=
no-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-=
pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno=
-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit =
-Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3D=
missing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dre=
turn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-stri=
ngs -fno-builtin-malloc -fno-builtin-calloc -pthread  -MD -MQ 'tests/xe/2e9=
594b@@xe_query@exe/xe_query.c.o' -MF 'tests/xe/2e9594b@@xe_query@exe/xe_que=
ry.c.o.d' -o 'tests/xe/2e9594b@@xe_query@exe/xe_query.c.o' -c ../tests/xe/x=
e_query.c
  ../tests/xe/xe_query.c:53:82: error: expected =E2=80=98,=E2=80=99 before =
=E2=80=98)=E2=80=99 token
   static_assert(INTEL_HWCONFIG_MAX_MESH_URB_ENTRIES+1 =3D=3D __INTEL_HWCON=
FIG_KEY_LIMIT);
                                                                           =
         ^
                                                                           =
         ,
  ninja: build stopped: subcommand failed.
  section_end:1677244567:step_script
  section_start:1677244567:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244568:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/36975084):
  [13/20] Linking target runner/runner_test.
  [14/20] Linking target runner/runner_json_test.
  [15/20] Linking static target assembler/libbrw.a.
  [16/20] Linking target assembler/intel-gen4asm.
  [17/20] Linking target assembler/intel-gen4disasm.
  [18/20] Linking target overlay/intel-gpu-overlay.
  [19/20] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst=20
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt=
-ci-tags/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 61
      if (match :=3D re.match(r"(.*)\b(\S+)", field)):
                ^
  SyntaxError: invalid syntax
  ninja: build stopped: subcommand failed.
  section_end:1677244334:step_script
  section_start:1677244334:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244335:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/36975088):
  [4/11] Linking target tests/gem_barrier_race.
  [5/11] Linking target tests/perf.
  [6/11] Linking target tests/core_hotunplug.
  [7/11] Linking target tools/i915-perf/i915-perf-configs.
  [8/11] Linking target tools/i915-perf/i915-perf-recorder.
  [9/11] Linking target tools/i915-perf/i915-perf-reader.
  [10/11] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst=20
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt=
-ci-tags/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 61
      if (match :=3D re.match(r"(.*)\b(\S+)", field)):
                ^
  SyntaxError: invalid syntax
  ninja: build stopped: subcommand failed.
  section_end:1677244383:step_script
  section_start:1677244383:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244383:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/36975087):
  [11/18] Linking target runner/igt_runner.
  [12/18] Linking target runner/igt_resume.
  [13/18] Linking target runner/igt_comms_decoder.
  [14/18] Linking target runner/igt_results.
  [15/18] Linking target runner/runner_test.
  [16/18] Linking target runner/runner_json_test.
  [17/18] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst=20
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt=
-ci-tags/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 61
      if (match :=3D re.match(r"(.*)\b(\S+)", field)):
                ^
  SyntaxError: invalid syntax
  ninja: build stopped: subcommand failed.
  section_end:1677244332:step_script
  section_start:1677244332:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244333:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/36975085):
  [6/13] Linking target tests/core_hotunplug.
  [7/13] Linking target tools/i915-perf/i915-perf-configs.
  [8/13] Linking target tools/i915-perf/i915-perf-recorder.
  [9/13] Linking target tools/i915-perf/i915-perf-reader.
  [10/13] Linking target runner/runner_test.
  [11/13] Linking target assembler/intel-gen4asm.
  [12/13] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst=20
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt=
-ci-tags/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 61
      if (match :=3D re.match(r"(.*)\b(\S+)", field)):
                ^
  SyntaxError: invalid syntax
  ninja: build stopped: subcommand failed.
  section_end:1677244308:step_script
  section_start:1677244308:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244309:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/36975086):
  [5/12] Linking target tests/gem_barrier_race.
  [6/12] Linking target tests/core_hotunplug.
  [7/12] Linking target tools/i915-perf/i915-perf-configs.
  [8/12] Linking target tools/i915-perf/i915-perf-recorder.
  [9/12] Linking target tools/i915-perf/i915-perf-reader.
  [10/12] Linking target runner/runner_test.
  [11/12] Generating xe_tests.rst with a custom command.
  FAILED: docs/testplan/xe_tests.rst=20
  /builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py --config /builds/gfx-ci/igt=
-ci-tags/tests/xe/xe_test_config.json --rest docs/testplan/xe_tests.rst
    File "/builds/gfx-ci/igt-ci-tags/scripts/igt_doc.py", line 61
      if (match :=3D re.match(r"(.*)\b(\S+)", field)):
                ^
  SyntaxError: invalid syntax
  ninja: build stopped: subcommand failed.
  section_end:1677244309:step_script
  section_start:1677244309:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1677244309:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/815644
