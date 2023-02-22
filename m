Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 22 Feb 2023 11:19:34 -0000
Message-ID: <167706477460.6102.16434048434723692598@emeril.freedesktop.org>
References: <20230222104806.4817-1-swati2.sharma@intel.com>
In-Reply-To: <20230222104806.4817-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGQg?=
 =?utf-8?q?HDR_negative_tests_=28rev3=29?=
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

Series: Add HDR negative tests (rev3)
URL   : https://patchwork.freedesktop.org/series/112242/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
165df656261863684067cd53f95c3a301e67fa24 tests/gem_barrier_race: Extend sup=
port over compute engines

[267/1037] Linking target lib/tests/igt_no_exit.
[268/1037] Linking target lib/tests/igt_runnercomms_packets.
[269/1037] Linking target lib/tests/igt_segfault.
[270/1037] Linking target lib/tests/igt_simulation.
[271/1037] Linking target lib/tests/igt_stats.
[272/1037] Linking target lib/tests/igt_types.
[273/1037] Linking target lib/tests/igt_subtest_group.
[274/1037] Linking target lib/tests/igt_thread.
[275/1037] Linking target lib/tests/i915_perf_data_alignment.
[276/1037] Linking target lib/tests/igt_audio.
[277/1037] Linking target lib/tests/bad_subtest_type.
[278/1037] Linking target lib/tests/igt_no_subtest.
[279/1037] Linking target lib/tests/igt_simple_test_subtests.
[280/1037] Linking target lib/tests/igt_timeout.
[281/1037] Linking target tests/core_auth.
[282/1037] Linking target tests/core_getclient.
[283/1037] Linking target tests/core_getstats.
[284/1037] Linking target tests/core_getversion.
[285/1037] Linking target tests/core_setmaster.
[286/1037] Linking target tests/core_setmaster_vs_auth.
[287/1037] Linking target tests/debugfs_test.
[288/1037] Linking target tests/dmabuf.
[289/1037] Linking target tests/dmabuf_sync_file.
[290/1037] Linking target tests/device_reset.
[291/1037] Linking target tests/drm_buddy.
[292/1037] Linking target tests/drm_mm.
[293/1037] Linking target tests/drm_read.
[294/1037] Linking target tests/fbdev.
[295/1037] Linking target tests/feature_discovery.
[296/1037] Linking target tests/kms_3d.
[297/1037] Linking target tests/kms_atomic.
[298/1037] Linking target tests/kms_addfb_basic.
[299/1037] Linking target tests/kms_async_flips.
[300/1037] Linking target tests/kms_atomic_interruptible.
[301/1037] Linking target tests/kms_atomic_transition.
[302/1037] Linking target tests/kms_bw.
[303/1037] Linking target tests/kms_concurrent.
[304/1037] Linking target tests/kms_content_protection.
[305/1037] Linking target tests/kms_cursor_crc.
[306/1037] Linking target tests/kms_cursor_edge_walk.
[307/1037] Linking target tests/kms_cursor_legacy.
[308/1037] Compiling C object 'tests/59830eb@@kms_hdr@exe/kms_hdr.c.o'.
FAILED: tests/59830eb@@kms_hdr@exe/kms_hdr.c.o=20
cc -Itests/59830eb@@kms_hdr@exe -Itests -I../../../usr/src/igt-gpu-tools/te=
sts -I../../../usr/src/igt-gpu-tools/include/drm-uapi -I../../../usr/src/ig=
t-gpu-tools/include/linux-uapi -Ilib -I../../../usr/src/igt-gpu-tools/lib -=
I../../../usr/src/igt-gpu-tools/lib/stubs/syscalls -I. -I../../../usr/src/i=
gt-gpu-tools/ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_6=
4-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I=
/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr=
/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/include -fdiagnost=
ics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wext=
ra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D=
2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit=
-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attri=
bute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-d=
efinition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -W=
uninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing=
-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-s=
ign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werr=
or=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self =
-Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werr=
or=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3D=
sequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mal=
loc -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@kms_hdr@exe/kms_hd=
r.c.o' -MF 'tests/59830eb@@kms_hdr@exe/kms_hdr.c.o.d' -o 'tests/59830eb@@km=
s_hdr@exe/kms_hdr.c.o' -c ../../../usr/src/igt-gpu-tools/tests/kms_hdr.c
../../../usr/src/igt-gpu-tools/tests/kms_hdr.c: In function =E2=80=98test_i=
nvalid_metadata_sizes=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/kms_hdr.c:553:27: error: =E2=80=98afb=
=E2=80=99 undeclared (first use in this function)
  553 |  igt_remove_fb(data->fd, &afb);
      |                           ^~~
../../../usr/src/igt-gpu-tools/tests/kms_hdr.c:553:27: note: each undeclare=
d identifier is reported only once for each function it appears in
ninja: build stopped: subcommand failed.

