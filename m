Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 09 Mar 2023 13:43:58 -0000
Message-ID: <167836943800.12424.985307635416403993@emeril.freedesktop.org>
References: <20230309133923.124095-1-mcanal@igalia.com>
In-Reply-To: <20230309133923.124095-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBZGQg?=
 =?utf-8?q?negative_tests_to_VGEM?=
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

Series: Add negative tests to VGEM
URL   : https://patchwork.freedesktop.org/series/114912/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
b35bfa32fe672d67ced8555557e3e707ace211ad runner/job_list: return error on c=
rashes while running --list-subtests

ninja: Entering directory `/opt/igt/build'
[1/1010] Generating version.h with a custom command.
[2/1008] Linking static target lib/libigt-i915_gem_engine_topology_c.a.
[3/1008] Linking static target lib/libigt-i915_intel_memory_region_c.a.
[4/1008] Linking static target lib/libigt-i915_intel_decode_c.a.
[5/1008] Linking static target lib/libigt-igt_collection_c.a.
[6/1008] Linking static target lib/libigt-i915_i915_blt_c.a.
[7/1008] Linking static target lib/libigt-igt_debugfs_c.a.
[8/1008] Linking static target lib/libigt-igt_device_c.a.
[9/1008] Linking static target lib/libigt-igt_device_scan_c.a.
[10/1008] Linking static target lib/libigt-igt_aux_c.a.
[11/1008] Linking static target lib/libigt-igt_gt_c.a.
[12/1008] Linking static target lib/libigt-igt_halffloat_c.a.
[13/1008] Linking static target lib/libigt-igt_os_c.a.
[14/1008] Linking static target lib/libigt-igt_perf_c.a.
[15/1008] Linking static target lib/libigt-igt_pipe_crc_c.a.
[16/1008] Linking static target lib/libigt-igt_power_c.a.
[17/1008] Linking static target lib/libigt-igt_stats_c.a.
[18/1008] Linking static target lib/libigt-igt_syncobj_c.a.
[19/1008] Linking static target lib/libigt-igt_sysfs_c.a.
[20/1008] Linking static target lib/libigt-igt_x86_c.a.
[21/1008] Compiling C object 'lib/76b5a35@@igt-igt_vgem_c@sta/igt_vgem.c.o'.
FAILED: lib/76b5a35@@igt-igt_vgem_c@sta/igt_vgem.c.o=20
cc -Ilib/76b5a35@@igt-igt_vgem_c@sta -Ilib -I../../../usr/src/igt-gpu-tools=
/lib -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-to=
ols/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi -I=
../../../usr/src/igt-gpu-tools/lib/stubs/syscalls -I. -I../../../usr/src/ig=
t-gpu-tools/ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64=
-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/=
usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/=
include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/include -fdiagnosti=
cs-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextr=
a -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2=
 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-=
fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attrib=
ute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-de=
finition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wu=
ninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-=
field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-si=
gn-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werro=
r=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -=
Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werro=
r=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Ds=
equence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mall=
oc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/opt/igt/share/igt-=
gpu-tools"' '-DIGT_SRCDIR=3D"/usr/src/igt-gpu-tools/tests"' '-DIGT_LOG_DOMA=
IN=3D"igt_vgem"' -MD -MQ 'lib/76b5a35@@igt-igt_vgem_c@sta/igt_vgem.c.o' -MF=
 'lib/76b5a35@@igt-igt_vgem_c@sta/igt_vgem.c.o.d' -o 'lib/76b5a35@@igt-igt_=
vgem_c@sta/igt_vgem.c.o' -c ../../../usr/src/igt-gpu-tools/lib/igt_vgem.c
In file included from ../../../usr/src/igt-gpu-tools/lib/igt_vgem.c:29:
../../../usr/src/igt-gpu-tools/lib/igt_vgem.h:42:1: error: unknown type nam=
e =E2=80=98bool=E2=80=99
   42 | bool vgem_has_fences(int fd);
      | ^~~~
../../../usr/src/igt-gpu-tools/lib/igt_vgem.h:43:1: error: unknown type nam=
e =E2=80=98bool=E2=80=99
   43 | bool vgem_fence_has_flag(int fd, unsigned flags);
      | ^~~~
../../../usr/src/igt-gpu-tools/lib/igt_vgem.c:97:6: error: conflicting type=
s for =E2=80=98vgem_has_fences=E2=80=99
   97 | bool vgem_has_fences(int fd)
      |      ^~~~~~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/igt_vgem.c:29:
../../../usr/src/igt-gpu-tools/lib/igt_vgem.h:42:6: note: previous declarat=
ion of =E2=80=98vgem_has_fences=E2=80=99 was here
   42 | bool vgem_has_fences(int fd);
      |      ^~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_vgem.c:119:6: error: conflicting typ=
es for =E2=80=98vgem_fence_has_flag=E2=80=99
  119 | bool vgem_fence_has_flag(int fd, unsigned flags)
      |      ^~~~~~~~~~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/igt_vgem.c:29:
../../../usr/src/igt-gpu-tools/lib/igt_vgem.h:43:6: note: previous declarat=
ion of =E2=80=98vgem_fence_has_flag=E2=80=99 was here
   43 | bool vgem_fence_has_flag(int fd, unsigned flags);
      |      ^~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

