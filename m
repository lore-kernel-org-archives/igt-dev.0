Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Sep 2021 16:18:02 -0000
Message-ID: <163068588293.21415.11109506772665742876@emeril.freedesktop.org>
References: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fcolor=3A_3D_LUT_tests_=28rev4=29?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: tests/kms_color: 3D LUT tests (rev4)
URL   : https://patchwork.freedesktop.org/series/90165/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
40888f97a6ad219f4ed48a1830d0ef3c9617d006 i915_drm.h sync

[310/428] Linking target tests/i915_getparams_basic.
[311/428] Linking target tests/i915_pm_backlight.
[312/428] Linking target tests/i915_hangman.
[313/428] Linking target tests/i915_pm_lpsp.
[314/428] Linking target tests/i915_pciid.
[315/428] Linking target tests/i915_pm_rpm.
[316/428] Linking target tests/i915_pm_sseu.
[317/428] Linking target tests/i915_suspend.
[318/428] Linking target tests/sysfs_clients.
[319/428] Linking target tests/sysfs_heartbeat_interval.
[320/428] Linking target tests/sysfs_defaults.
[321/428] Linking target tests/sysfs_preempt_timeout.
[322/428] Linking target tests/dumb_buffer.
[323/428] Linking target tests/sysfs_timeslice_duration.
[324/428] Linking target tests/gem_eio.
[325/428] Linking target tests/gem_create.
[326/428] Linking target tests/gem_ctx_freq.
[327/428] Linking target tests/gem_ctx_sseu.
[328/428] Linking target tests/gem_mmap_offset.
[329/428] Linking target tests/gem_exec_balancer.
[330/428] Linking target tests/core_hotunplug.
[331/428] Linking target tests/perf_pmu.
[332/428] Linking target tests/i915_pm_rc6_residency.
[333/428] Linking target tests/perf.
[334/428] Compiling C object 'tests/tests@@kms_color_chamelium@exe/kms_colo=
r_chamelium.c.o'.
FAILED: tests/tests@@kms_color_chamelium@exe/kms_color_chamelium.c.o=20
ccache cc -Itests/tests@@kms_color_chamelium@exe -Itests -I../tests -I../in=
clude/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/incl=
ude/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/incl=
ude -I/usr/include/pixman-1 -I/usr/include/libpng16 -I/usr/include/freetype=
2 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/libdrm/nouve=
au -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/include -I/ho=
me/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -pipe -D_FILE_=
OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOU=
RCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarati=
on-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing=
-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredun=
dant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobb=
ered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-=
arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-=
result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/test=
s@@kms_color_chamelium@exe/kms_color_chamelium.c.o' -MF 'tests/tests@@kms_c=
olor_chamelium@exe/kms_color_chamelium.c.o.d' -o 'tests/tests@@kms_color_ch=
amelium@exe/kms_color_chamelium.c.o' -c ../tests/kms_color_chamelium.c
../tests/kms_color_chamelium.c: In function =E2=80=98__real_main724=E2=80=
=99:
../tests/kms_color_chamelium.c:757:3: error: too few arguments to function =
=E2=80=98invalid_gamma_lut_sizes=E2=80=99
   invalid_gamma_lut_sizes(&data);
   ^~~~~~~~~~~~~~~~~~~~~~~
In file included from ../tests/kms_color_chamelium.c:25:
../tests/kms_color_helper.h:123:6: note: declared here
 void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
      ^~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_color_chamelium.c:761:3: error: too few arguments to function =
=E2=80=98invalid_degamma_lut_sizes=E2=80=99
   invalid_degamma_lut_sizes(&data);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../tests/kms_color_chamelium.c:25:
../tests/kms_color_helper.h:124:6: note: declared here
 void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
      ^~~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_color_chamelium.c:765:3: error: too few arguments to function =
=E2=80=98invalid_ctm_matrix_sizes=E2=80=99
   invalid_ctm_matrix_sizes(&data);
   ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../tests/kms_color_chamelium.c:25:
../tests/kms_color_helper.h:126:6: note: declared here
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
      ^~~~~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

