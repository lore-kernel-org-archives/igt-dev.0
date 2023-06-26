Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Mon, 26 Jun 2023 11:16:50 -0000
Message-ID: <168777821093.5707.16612184944278469957@emeril.freedesktop.org>
References: <20230626105112.15705-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230626105112.15705-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/xe/xe=5Fstore=3A_Add_xe=5Fstore_test_to_check_store_dword_fun?=
 =?utf-8?q?ctionality?=
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

Series: tests/xe/xe_store: Add xe_store test to check store dword functiona=
lity
URL   : https://patchwork.freedesktop.org/series/119857/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
feb4fdbcce1e53cb1d483aad3d5ec4ff41092359 lib/intel_blt: Prepare blt library=
 to support xe

[343/662] Linking target tests/xe_live_ktest.
[344/662] Linking target tests/xe_mmap.
[345/662] Linking target tests/xe_mmio.
[346/662] Linking target tests/xe_module_load.
[347/662] Compiling C object 'tests/59830eb@@xe_store@exe/xe_xe_store.c.o'.
FAILED: tests/59830eb@@xe_store@exe/xe_xe_store.c.o=20
cc -Itests/59830eb@@xe_store@exe -Itests -I../../../usr/src/igt-gpu-tools/t=
ests -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-to=
ols/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi -I=
lib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-tools/l=
ib/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/cair=
o -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/u=
sr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/inc=
lude/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/usr/=
include/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_=
OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOU=
RCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarati=
on-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing=
-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredun=
dant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobb=
ered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-=
arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno=
-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-boun=
ds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -We=
rror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to=
-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraph=
s -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread =
-MD -MQ 'tests/59830eb@@xe_store@exe/xe_xe_store.c.o' -MF 'tests/59830eb@@x=
e_store@exe/xe_xe_store.c.o.d' -o 'tests/59830eb@@xe_store@exe/xe_xe_store.=
c.o' -c ../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c: In function =E2=80=98st=
ore=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:47:2: warning: ISO C90 f=
orbids mixed declarations and code [-Wdeclaration-after-statement]
   47 |  uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
      |  ^~~~~~~~
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c: In function =E2=80=98st=
ore_all=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:105:2: warning: ISO C90 =
forbids mixed declarations and code [-Wdeclaration-after-statement]
  105 |  uint64_t batch_offset =3D (char *)&(data->batch) - (char *)data;
      |  ^~~~~~~~
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:137:20: error: =E2=80=98=
engine=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98engines=E2=80=99?
  137 |   xe_exec_wait(fd, engine[i], batch_addr);
      |                    ^~~~~~
      |                    engines
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:137:20: note: each undec=
lared identifier is reported only once for each function it appears in
In file included from ../../../usr/src/igt-gpu-tools/lib/drmtest.h:39,
                 from ../../../usr/src/igt-gpu-tools/lib/igt.h:27,
                 from ../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:1:
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:138:24: error: invalid t=
ype argument of =E2=80=98->=E2=80=99 (have =E2=80=98struct <anonymous>=E2=
=80=99)
  138 |   igt_assert_eq(data[i]->data, 0xc0ffee);
      |                        ^~
../../../usr/src/igt-gpu-tools/lib/igt_core.h:737:15: note: in definition o=
f macro =E2=80=98igt_assert_cmpint=E2=80=99
  737 |   int __n1 =3D (n1), __n2 =3D (n2); \
      |               ^~
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:138:3: note: in expansio=
n of macro =E2=80=98igt_assert_eq=E2=80=99
  138 |   igt_assert_eq(data[i]->data, 0xc0ffee);
      |   ^~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:86:11: warning: variable=
 =E2=80=98engines=E2=80=99 set but not used [-Wunused-but-set-variable]
   86 |  uint32_t engines[MAX_INSTANCE];
      |           ^~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:4:
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c: In function =E2=80=98__=
igt_unique____real_main151=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:166:22: error: =E2=80=98=
gt=E2=80=99 undeclared (first use in this function)
  166 |   xe_for_each_gt(fd, gt)
      |                      ^~
../../../usr/src/igt-gpu-tools/lib/xe/xe_query.h:70:7: note: in definition =
of macro =E2=80=98xe_for_each_gt=E2=80=99
   70 |  for (__gt =3D 0; __gt < xe_number_gt(__fd); ++__gt)
      |       ^~~~
../../../usr/src/igt-gpu-tools/tests/xe/xe_store.c:167:32: error: =E2=80=98=
class=E2=80=99 undeclared (first use in this function)
  167 |    xe_for_each_hw_engine_class(class)
      |                                ^~~~~
../../../usr/src/igt-gpu-tools/lib/xe/xe_query.h:67:7: note: in definition =
of macro =E2=80=98xe_for_each_hw_engine_class=E2=80=99
   67 |  for (__class =3D 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
      |       ^~~~~~~
ninja: build stopped: subcommand failed.

