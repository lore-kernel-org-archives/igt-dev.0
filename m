Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Wed, 28 Jun 2023 13:57:24 -0000
Message-ID: <168796064497.32037.7906149650867362209@emeril.freedesktop.org>
References: <20230628095239.615655-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230628095239.615655-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGQg?=
 =?utf-8?q?tests_for_scheduler_control_interface_=28rev3=29?=
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

Series: Add tests for scheduler control interface (rev3)
URL   : https://patchwork.freedesktop.org/series/119835/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
07fe9ec40f779a788946ad371b0b683cab3c2536 Update MAINTAINERS

ninja: Entering directory `/opt/igt/build'
[1/1057] Generating version.h with a custom command.
[2/1054] Linking static target lib/libigt-i915_intel_decode_c.a.
[3/1054] Linking static target lib/libigt-igt_device_scan_c.a.
[4/1054] Linking static target lib/libigt-igt_halffloat_c.a.
[5/1054] Linking static target lib/libigt-igt_aux_c.a.
[6/1054] Linking static target lib/libigt-igt_pipe_crc_c.a.
[7/1054] Linking static target lib/libigt-igt_power_c.a.
[8/1054] Linking static target lib/libigt-igt_stats_c.a.
[9/1054] Linking static target lib/libigt-igt_syncobj_c.a.
[10/1054] Compiling C object 'lib/76b5a35@@igt-igt_sysfs_c@sta/igt_sysfs.c.=
o'.
FAILED: lib/76b5a35@@igt-igt_sysfs_c@sta/igt_sysfs.c.o=20
cc -Ilib/76b5a35@@igt-igt_sysfs_c@sta -Ilib -I../../../usr/src/igt-gpu-tool=
s/lib -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-t=
ools/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi -=
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
loc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/opt/igt/share/igt=
-gpu-tools"' '-DIGT_SRCDIR=3D"/usr/src/igt-gpu-tools/tests"' '-DIGT_LOG_DOM=
AIN=3D"igt_sysfs"' -MD -MQ 'lib/76b5a35@@igt-igt_sysfs_c@sta/igt_sysfs.c.o'=
 -MF 'lib/76b5a35@@igt-igt_sysfs_c@sta/igt_sysfs.c.o.d' -o 'lib/76b5a35@@ig=
t-igt_sysfs_c@sta/igt_sysfs.c.o' -c ../../../usr/src/igt-gpu-tools/lib/igt_=
sysfs.c
../../../usr/src/igt-gpu-tools/lib/igt_sysfs.c: In function =E2=80=98igt_sy=
sfs_engines=E2=80=99:
../../../usr/src/igt-gpu-tools/lib/igt_sysfs.c:889:7: error: =E2=80=98engin=
e=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98e=
ngines=E2=80=99?
  889 |   if (engine < 0)
      |       ^~~~~~
      |       engines
../../../usr/src/igt-gpu-tools/lib/igt_sysfs.c:889:7: note: each undeclared=
 identifier is reported only once for each function it appears in
ninja: build stopped: subcommand failed.

