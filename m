Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jake Freeland" <jake@technologyfriends.net>
Date: Wed, 05 Oct 2022 21:01:37 -0000
Message-ID: <166500369779.20199.9376630409236792435@emeril.freedesktop.org>
References: <20221005203535.37704-1-jfree@freebsd.org>
In-Reply-To: <20221005203535.37704-1-jfree@freebsd.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBSZXBs?=
 =?utf-8?q?aced_instances_of_mmap64=28=29_with_drm=5Fmmap=28=29?=
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

Series: Replaced instances of mmap64() with drm_mmap()
URL   : https://patchwork.freedesktop.org/series/109431/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
17292ab1e63802d8456670f606f8ad78082d09ee igt_core: add a line break at the =
end of some internal_assert

ninja: Entering directory `/opt/igt/build'
[1/940] Generating version.h with a custom command.
[2/938] Compiling C object 'lib/76b5a35@@igt-i915_gem_mman_c@sta/i915_gem_m=
man.c.o'.
FAILED: lib/76b5a35@@igt-i915_gem_mman_c@sta/i915_gem_mman.c.o=20
cc -Ilib/76b5a35@@igt-i915_gem_mman_c@sta -Ilib -I../../../usr/src/igt-gpu-=
tools/lib -I../../../usr/src/igt-gpu-tools/include/drm-uapi -I../../../usr/=
src/igt-gpu-tools/include/linux-uapi -I../../../usr/src/igt-gpu-tools/lib/s=
tubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/cairo -I=
/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/i=
nclude/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include=
/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/usr/incl=
ude/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFS=
ET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE =
-include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-a=
fter-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissi=
ng-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pro=
totypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant=
-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered=
 -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arit=
h -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unu=
sed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -=
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -fPI=
C -pthread '-DIGT_DATADIR=3D"/opt/igt/share/igt-gpu-tools"' '-DIGT_SRCDIR=
=3D"/usr/src/igt-gpu-tools/tests"' '-DIGT_LOG_DOMAIN=3D"i915/gem_mman"' -MD=
 -MQ 'lib/76b5a35@@igt-i915_gem_mman_c@sta/i915_gem_mman.c.o' -MF 'lib/76b5=
a35@@igt-i915_gem_mman_c@sta/i915_gem_mman.c.o.d' -o 'lib/76b5a35@@igt-i915=
_gem_mman_c@sta/i915_gem_mman.c.o' -c ../../../usr/src/igt-gpu-tools/lib/i9=
15/gem_mman.c
../../../usr/src/igt-gpu-tools/lib/i915/gem_mman.c: In function =E2=80=98__=
gem_mmap__gtt=E2=80=99:
../../../usr/src/igt-gpu-tools/lib/i915/gem_mman.c:121:8: error: implicit d=
eclaration of function =E2=80=98drm_mmap=E2=80=99; did you mean =E2=80=98ge=
m_munmap=E2=80=99? [-Werror=3Dimplicit-function-declaration]
  121 |  ptr =3D drm_mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
      |        ^~~~~~~~
      |        gem_munmap
../../../usr/src/igt-gpu-tools/lib/i915/gem_mman.c:121:8: warning: nested e=
xtern declaration of =E2=80=98drm_mmap=E2=80=99 [-Wnested-externs]
../../../usr/src/igt-gpu-tools/lib/i915/gem_mman.c:121:6: warning: assignme=
nt to =E2=80=98void *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer fro=
m integer without a cast [-Wint-conversion]
  121 |  ptr =3D drm_mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
      |      ^
../../../usr/src/igt-gpu-tools/lib/i915/gem_mman.c: In function =E2=80=98__=
gem_mmap_offset=E2=80=99:
../../../usr/src/igt-gpu-tools/lib/i915/gem_mman.c:334:6: warning: assignme=
nt to =E2=80=98void *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer fro=
m integer without a cast [-Wint-conversion]
  334 |  ptr =3D drm_mmap(0, size, prot, MAP_SHARED, fd, arg.offset + offse=
t);
      |      ^
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

