Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Aug 2021 13:05:02 -0000
Message-ID: <162825510253.27549.15602379282737845325@emeril.freedesktop.org>
References: <20210806091028.296829-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210806091028.296829-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/kms=5Fsetmode=3A_Fix_to_get_a_valid_config?=
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: tests/kms_setmode: Fix to get a valid config
URL   : https://patchwork.freedesktop.org/series/93450/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/375993 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/12557637):
  ../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
  ../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before=
 =E2=80=98config_valid=E2=80=99
       !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
                                                                 ^
                                                                 )
      config_valid =3D false;
      ~~~~~~~~~~~~                                               =20
  ../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
     if (encoder_usage_count[i] > 1 &&
        ^
  ../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98=
}=E2=80=99 token
   }
   ^
  ninja: build stopped: subcommand failed.
  section_end:1628246761:step_script
  section_start:1628246761:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246762:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/12557640):
  ../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
  ../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before=
 =E2=80=98config_valid=E2=80=99
       !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
                                                                 ^
                                                                 )
      config_valid =3D false;
      ~~~~~~~~~~~~                                               =20
  ../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
     if (encoder_usage_count[i] > 1 &&
        ^
  ../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98=
}=E2=80=99 token
   }
   ^
  ninja: build stopped: subcommand failed.
  section_end:1628246755:step_script
  section_start:1628246755:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246756:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/12557639):
  ../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
  ../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before=
 =E2=80=98config_valid=E2=80=99
       !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
                                                                 ^
                                                                 )
      config_valid =3D false;
      ~~~~~~~~~~~~                                               =20
  ../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
     if (encoder_usage_count[i] > 1 &&
        ^
  ../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98=
}=E2=80=99 token
   }
   ^
  ninja: build stopped: subcommand failed.
  section_end:1628246755:step_script
  section_start:1628246755:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246756:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/12557641):
  ../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
  ../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before=
 =E2=80=98config_valid=E2=80=99
       !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
                                                                 ^
                                                                 )
      config_valid =3D false;
      ~~~~~~~~~~~~                                               =20
  ../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
     if (encoder_usage_count[i] > 1 &&
        ^
  ../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98=
}=E2=80=99 token
   }
   ^
  ninja: build stopped: subcommand failed.
  section_end:1628246758:step_script
  section_start:1628246758:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246759:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/12557632):
  ../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
  ../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before=
 =E2=80=98config_valid=E2=80=99
    364 |     !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
        |                                                               ^
        |                                                               )
    365 |    config_valid =3D false;
        |    ~~~~~~~~~~~~                                               =20
  ../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
    363 |   if (encoder_usage_count[i] > 1 &&
        |      ^
  ../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98=
}=E2=80=99 token
    369 | }
        | ^
  ninja: build stopped: subcommand failed.
  section_end:1628246761:step_script
  section_start:1628246761:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246762:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/12557636):
  ninja: Entering directory `build'
  [1/725] Generating version.h with a custom command.
  [2/623] Linking target tests/kms_rotation_crc.
  [3/623] Compiling C object 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.=
o'.
  FAILED: tests/59830eb@@kms_setmode@exe/kms_setmode.c.o=20
  clang -Itests/59830eb@@kms_setmode@exe -Itests -I../tests -I../include/dr=
m-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cair=
o -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixm=
an-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm=
 -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -Xclang -fcolor-diag=
nostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dg=
nu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-fun=
ction-cast -Wdeclaration-after-statement -Wformat=3D2 -Wmissing-declaration=
s -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnest=
ed-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshado=
w -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-initializ=
ers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno=
-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -We=
rror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to=
-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -We=
rror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -=
Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin=
-calloc -fcommon -pthread -MD -MQ 'tests/59830eb@@kms_setmode@exe/kms_setmo=
de.c.o' -MF 'tests/59830eb@@kms_setmode@exe/kms_setmode.c.o.d' -o 'tests/59=
830eb@@kms_setmode@exe/kms_setmode.c.o' -c ../tests/kms_setmode.c
  ../tests/kms_setmode.c:365:4: error: expected ')'
                          config_valid =3D false;
                          ^
  ../tests/kms_setmode.c:363:6: note: to match this '('
                  if (encoder_usage_count[i] > 1 &&
                     ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1628246771:step_script
  section_start:1628246771:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246772:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/12557635):
  ../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
  ../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before=
 =E2=80=98config_valid=E2=80=99
    364 |     !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
        |                                                               ^
        |                                                               )
    365 |    config_valid =3D false;
        |    ~~~~~~~~~~~~                                               =20
  ../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
    363 |   if (encoder_usage_count[i] > 1 &&
        |      ^
  ../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98=
}=E2=80=99 token
    369 | }
        | ^
  ninja: build stopped: subcommand failed.
  section_end:1628246760:step_script
  section_start:1628246760:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246762:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/12557633):
  ../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
  ../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before=
 =E2=80=98config_valid=E2=80=99
    364 |     !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
        |                                                               ^
        |                                                               )
    365 |    config_valid =3D false;
        |    ~~~~~~~~~~~~                                               =20
  ../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
    363 |   if (encoder_usage_count[i] > 1 &&
        |      ^
  ../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98=
}=E2=80=99 token
    369 | }
        | ^
  ninja: build stopped: subcommand failed.
  section_end:1628246761:step_script
  section_start:1628246761:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246763:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/12557634):
  ../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
  ../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before=
 =E2=80=98config_valid=E2=80=99
    364 |     !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
        |                                                               ^
        |                                                               )
    365 |    config_valid =3D false;
        |    ~~~~~~~~~~~~                                               =20
  ../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
    363 |   if (encoder_usage_count[i] > 1 &&
        |      ^
  ../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98=
}=E2=80=99 token
    369 | }
        | ^
  ninja: build stopped: subcommand failed.
  section_end:1628246759:step_script
  section_start:1628246759:cleanup_file_variables
  Cleaning up file based variables
  section_end:1628246760:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/375993
