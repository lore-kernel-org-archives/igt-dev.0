Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Fri, 12 May 2023 20:52:53 -0000
Message-ID: <168392477307.26101.10714113852836062579@emeril.freedesktop.org>
References: <20230512183512.57843-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230512183512.57843-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBVc2Ug?=
 =?utf-8?q?new_procps_library_libproc2?=
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

Series: Use new procps library libproc2
URL   : https://patchwork.freedesktop.org/series/117699/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
a482779488f11c432d7ddcb1980691ab1603f356 lib/drmtest: Add function drm_reop=
en_driver()

ninja: Entering directory `/opt/igt/build'
[1/1051] Generating version.h with a custom command.
[2/1049] Linking static target lib/libigt-i915_intel_memory_region_c.a.
[3/1049] Linking static target lib/libigt-i915_intel_decode_c.a.
[4/1049] Linking static target lib/libigt-igt_collection_c.a.
[5/1049] Linking static target lib/libigt-i915_i915_blt_c.a.
[6/1049] Linking static target lib/libigt-igt_debugfs_c.a.
[7/1049] Linking static target lib/libigt-igt_device_scan_c.a.
[8/1049] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
FAILED: lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o=20
cc -Ilib/76b5a35@@igt-igt_aux_c@sta -Ilib -I../../../usr/src/igt-gpu-tools/=
lib -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-too=
ls/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi -I.=
./../../usr/src/igt-gpu-tools/lib/stubs/syscalls -I. -I../../../usr/src/igt=
-gpu-tools/ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-=
linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/uuid -I/u=
sr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/i=
nclude/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/include -fdiagnostic=
s-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra=
 -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 =
-Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-f=
allthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribu=
te -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-def=
inition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wun=
initialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-f=
ield-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sig=
n-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=
=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -W=
error=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=
=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dse=
quence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mallo=
c -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/opt/igt/share/igt-g=
pu-tools"' '-DIGT_SRCDIR=3D"/usr/src/igt-gpu-tools/tests"' '-DIGT_LOG_DOMAI=
N=3D"igt_aux"' -MD -MQ 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o' -MF 'li=
b/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o.d' -o 'lib/76b5a35@@igt-igt_aux_c@=
sta/igt_aux.c.o' -c ../../../usr/src/igt-gpu-tools/lib/igt_aux.c
../../../usr/src/igt-gpu-tools/lib/igt_aux.c: In function =E2=80=98open_pro=
cess=E2=80=99:
../../../usr/src/igt-gpu-tools/lib/igt_aux.c:1235:55: error: macro "igt_ass=
ert" passed 2 arguments, but takes just 1
 1235 |  igt_assert(prcs->proc !=3D NULL, "procps open failed\n");
      |                                                       ^
In file included from ../../../usr/src/igt-gpu-tools/lib/drmtest.h:39,
                 from ../../../usr/src/igt-gpu-tools/lib/igt_aux.c:66:
../../../usr/src/igt-gpu-tools/lib/igt_core.h:675: note: macro "igt_assert"=
 defined here
  675 | #define igt_assert(expr) \
      |=20
../../../usr/src/igt-gpu-tools/lib/igt_aux.c:1235:2: error: =E2=80=98igt_as=
sert=E2=80=99 undeclared (first use in this function)
 1235 |  igt_assert(prcs->proc !=3D NULL, "procps open failed\n");
      |  ^~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_aux.c:1235:2: note: each undeclared =
identifier is reported only once for each function it appears in
../../../usr/src/igt-gpu-tools/lib/igt_aux.c: In function =E2=80=98close_pr=
ocess=E2=80=99:
../../../usr/src/igt-gpu-tools/lib/igt_aux.c:1257:15: warning: passing argu=
ment 1 of =E2=80=98freeproc=E2=80=99 from incompatible pointer type [-Winco=
mpatible-pointer-types]
 1257 |  freeproc(prcs->proc);
      |           ~~~~^~~~~~
      |               |
      |               PROCTAB * {aka struct PROCTAB *}
In file included from ../../../usr/src/igt-gpu-tools/lib/igt_aux.c:56:
/usr/include/proc/readproc.h:264:30: note: expected =E2=80=98proc_t *=E2=80=
=99 {aka =E2=80=98struct proc_t *=E2=80=99} but argument is of type =E2=80=
=98PROCTAB *=E2=80=99 {aka =E2=80=98struct PROCTAB *=E2=80=99}
  264 | extern void freeproc(proc_t* p);
      |                      ~~~~~~~~^
../../../usr/src/igt-gpu-tools/lib/igt_aux.c: In function =E2=80=98get_proc=
ess_ids=E2=80=99:
../../../usr/src/igt-gpu-tools/lib/igt_aux.c:1277:6: error: =E2=80=98proc_i=
nfo=E2=80=99 undeclared (first use in this function)
 1277 |  if (proc_info) {
      |      ^~~~~~~~~
ninja: build stopped: subcommand failed.

