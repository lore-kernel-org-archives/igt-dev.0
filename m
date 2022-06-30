Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 30 Jun 2022 15:49:43 -0000
Message-ID: <165660418394.26513.6992178976244504281@emeril.freedesktop.org>
References: <20220628133220.26100-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220628133220.26100-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Finvalid=5Fmode=3A_Test_Cleanup_=28rev8=29?=
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

Series: tests/kms_invalid_mode: Test Cleanup (rev8)
URL   : https://patchwork.freedesktop.org/series/105501/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/626407 fo=
r the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/24777644):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/809] Generating version.h with a custom command.
  [2/741] Linking target tests/kms_cursor_legacy.
  [3/741] Linking target tests/kms_flip.
  [4/741] Linking target tests/kms_getfb.
  [5/741] Compiling C object 'tests/59830eb@@kms_invalid_mode@exe/kms_inval=
id_mode.c.o'.
  FAILED: tests/59830eb@@kms_invalid_mode@exe/kms_invalid_mode.c.o=20
  clang -Itests/59830eb@@kms_invalid_mode@exe -Itests -I../tests -I../inclu=
de/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls =
-I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.=
0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/l=
ibpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/=
valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -=
Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D=
_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wfor=
mat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretur=
n -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-ar=
ith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused=
 -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-=
member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused=
-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830=
eb@@kms_invalid_mode@exe/kms_invalid_mode.c.o' -MF 'tests/59830eb@@kms_inva=
lid_mode@exe/kms_invalid_mode.c.o.d' -o 'tests/59830eb@@kms_invalid_mode@ex=
e/kms_invalid_mode.c.o' -c ../tests/kms_invalid_mode.c
  ../tests/kms_invalid_mode.c:198:64: error: address of 'data->display.is_a=
tomic' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
                  ret =3D igt_display_try_commit2(&data->display, &data->di=
splay.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
                                                                 ~~~~~~~~~~=
~~~~^~~~~~~~~ ~
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1656603904:step_script
  section_start:1656603904:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1656603905:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/626407
