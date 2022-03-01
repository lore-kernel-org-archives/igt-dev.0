Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Tue, 01 Mar 2022 14:01:27 -0000
Message-ID: <164614328734.8601.343159606833388455@emeril.freedesktop.org>
References: <20220301124728.312967-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20220301124728.312967-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBsaWIv?=
 =?utf-8?q?intel=5Fmmio=3A_Fix_mmapped_resources_not_unmapped_on_fini?=
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

Series: lib/intel_mmio: Fix mmapped resources not unmapped on fini
URL   : https://patchwork.freedesktop.org/series/100882/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
2372a4beb6a33c5f0799a4a8ccbb93794f52dbca tests/kms_plane_scaling: Add negat=
ive test to check num of scalers

ninja: Entering directory `build'
[1/891] Generating lib/version.h with a custom command
[2/890] Linking static target lib/libigt-drmtest_c.a
[3/890] Linking static target lib/libigt-i915_gem_c.a
[4/890] Linking static target lib/libigt-igt_collection_c.a
[5/890] Linking static target lib/libigt-igt_device_c.a
[6/890] Linking static target lib/libigt-rendercopy_i830_c.a
[7/890] Linking static target lib/libigt-igt_syncobj_c.a
[8/890] Linking static target lib/libigt-intel_allocator_c.a
[9/890] Linking static target lib/libigt-intel_allocator_msgchannel_c.a
[10/890] Linking static target lib/libigt-intel_allocator_random_c.a
[11/890] Linking static target lib/libigt-intel_allocator_reloc_c.a
[12/890] Linking static target lib/libigt-intel_allocator_simple_c.a
[13/890] Linking static target lib/libigt-intel_bufops_c.a
[14/890] Linking static target lib/libigt-ioctl_wrappers_c.a
[15/890] Compiling C object lib/libigt-intel_mmio_c.a.p/intel_mmio.c.o
FAILED: lib/libigt-intel_mmio_c.a.p/intel_mmio.c.o=20
ccache cc -Ilib/libigt-intel_mmio_c.a.p -Ilib -I../lib -I../include/drm-uap=
i -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I.. -I/usr/include/c=
airo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -=
I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/=
usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I=
/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/include -I/home/ci=
drm/kernel_headers/include -fdiagnostics-color=3Dalways -D_FILE_OFFSET_BITS=
=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -includ=
e config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-st=
atement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-decl=
arations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes=
 -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls =
-Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-m=
aybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wno-=
sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Wer=
ror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self=
 -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Wer=
ror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/opt/i=
gt/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/home/cidrm/igt-gpu-tools/tests"'=
 '-DIGT_LOG_DOMAIN=3D"intel_mmio"' -MD -MQ lib/libigt-intel_mmio_c.a.p/inte=
l_mmio.c.o -MF lib/libigt-intel_mmio_c.a.p/intel_mmio.c.o.d -o lib/libigt-i=
ntel_mmio_c.a.p/intel_mmio.c.o -c ../lib/intel_mmio.c
../lib/intel_mmio.c: In function =E2=80=98intel_mmio_use_pci_bar=E2=80=99:
../lib/intel_mmio.c:162:11: error: =E2=80=98mmio_size=E2=80=99 undeclared (=
first use in this function); did you mean =E2=80=98mmio_bar=E2=80=99?
           mmio_size,
           ^~~~~~~~~
           mmio_bar
../lib/intel_mmio.c:162:11: note: each undeclared identifier is reported on=
ly once for each function it appears in
../lib/intel_mmio.c: In function =E2=80=98intel_mmio_unmap_pci_bar=E2=80=99:
../lib/intel_mmio.c:188:13: error: =E2=80=98struct intel_mmio_data=E2=80=99=
 has no member named =E2=80=98mmio_data=E2=80=99; did you mean =E2=80=98mmi=
o_size=E2=80=99?
  mmio_data->mmio_data->dev =3D NULL;
             ^~~~~~~~~
             mmio_size
ninja: build stopped: subcommand failed.

