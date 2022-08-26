Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 26 Aug 2022 04:00:34 -0000
Message-ID: <166148643457.30040.13364507389710221016@emeril.freedesktop.org>
References: <20220826034916.30364-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220826034916.30364-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fatomic=5Finterruptible=3A_Test_Cleanup?=
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

Series: tests/kms_atomic_interruptible: Test Cleanup
URL   : https://patchwork.freedesktop.org/series/107776/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
1298b5f0e1b3e010657ffba41d2e775fab028e08 igt: Allow overriding the commit h=
ash in the version string

[265/663] Linking target lib/tests/igt_exit_handler
[266/663] Linking target lib/tests/igt_dynamic_subtests
[267/663] Linking target lib/tests/igt_describe
[268/663] Linking target lib/tests/igt_edid
[269/663] Linking target tests/gen3_render_tiledx_blits
[270/663] Linking target lib/tests/igt_fork_helper
[271/663] Linking target lib/tests/igt_list_only
[272/663] Linking target lib/tests/igt_invalid_subtest_name
[273/663] Linking target lib/tests/igt_nesting
[274/663] Linking target lib/tests/igt_simulation
[275/663] Linking target lib/tests/igt_no_exit
[276/663] Linking target lib/tests/igt_segfault
[277/663] Linking target lib/tests/igt_stats
[278/663] Linking target lib/tests/igt_subtest_group
[279/663] Linking target lib/tests/igt_thread
[280/663] Linking target lib/tests/i915_perf_data_alignment
[281/663] Linking target lib/tests/igt_audio
[282/663] Linking target lib/tests/igt_no_subtest
[283/663] Linking target lib/tests/igt_simple_test_subtests
[284/663] Linking target lib/tests/igt_timeout
[285/663] Linking target tests/dmabuf
[286/663] Linking target tests/core_auth
[287/663] Linking target tests/core_getclient
[288/663] Linking target tests/core_getstats
[289/663] Linking target tests/core_getversion
[290/663] Linking target tests/core_setmaster
[291/663] Linking target tests/core_setmaster_vs_auth
[292/663] Linking target tests/debugfs_test
[293/663] Linking target tests/dmabuf_sync_file
[294/663] Linking target tests/device_reset
[295/663] Linking target tests/drm_import_export
[296/663] Linking target tests/drm_buddy
[297/663] Linking target tests/drm_mm
[298/663] Linking target tests/drm_read
[299/663] Linking target tests/fbdev
[300/663] Linking target tests/feature_discovery
[301/663] Linking target tests/kms_3d
[302/663] Linking target tests/kms_addfb_basic
[303/663] Linking target tests/kms_atomic
[304/663] Linking target tests/kms_async_flips
[305/663] Compiling C object tests/kms_atomic_interruptible.p/kms_atomic_in=
terruptible.c.o
FAILED: tests/kms_atomic_interruptible.p/kms_atomic_interruptible.c.o=20
ccache cc -Itests/kms_atomic_interruptible.p -Itests -I../tests -I../includ=
e/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -=
I. -I.. -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linu=
x-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/=
usr/include/libpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/i=
nclude/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -=
I/usr/include -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dal=
ways -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 =
-g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cas=
t -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wl=
ogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noret=
urn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-=
arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunus=
ed -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers =
-Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter=
 -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimpl=
icit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werr=
or=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ =
tests/kms_atomic_interruptible.p/kms_atomic_interruptible.c.o -MF tests/kms=
_atomic_interruptible.p/kms_atomic_interruptible.c.o.d -o tests/kms_atomic_=
interruptible.p/kms_atomic_interruptible.c.o -c ../tests/kms_atomic_interru=
ptible.c
../tests/kms_atomic_interruptible.c: In function =E2=80=98__igt_unique____r=
eal_main268=E2=80=99:
../tests/kms_atomic_interruptible.c:289:34: error: =E2=80=98drm_fd=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98dremf=E2=80=
=99?
    igt_display_require(&display, drm_fd);
                                  ^~~~~~
                                  dremf
../tests/kms_atomic_interruptible.c:289:34: note: each undeclared identifie=
r is reported only once for each function it appears in
ninja: build stopped: subcommand failed.

