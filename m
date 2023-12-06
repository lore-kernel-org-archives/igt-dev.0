Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 06 Dec 2023 07:22:37 -0000
Message-ID: <170184735739.26425.17449257904511025461@emeril.freedesktop.org>
References: <20231206064800.11398-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206064800.11398-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_R?=
 =?utf-8?q?FC=3A_drm-uapi/xe=3A_add_exec=5Fqueue=5Fid_member_to_drm=5Fxe?=
 =?utf-8?q?=5Fwait=5Fuser=5Ffence_structure_=28rev2=29?=
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

Series: RFC: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fenc=
e structure (rev2)
URL   : https://patchwork.freedesktop.org/series/127364/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1050547 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/52421309):
      ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
     .instances =3D eci ? to_user_pointer(eci) : 0,
      ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    struct drm_xe_wait_user_fence wait =3D {
                                         ^
  ../lib/xe/xe_ioctl.c:504:16:
     .instances =3D eci ? to_user_pointer(eci) : 0,
                  {
    };
    }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847016:step_script
  section_start:1701847016:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847017:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/52421312):
      ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
     .instances =3D eci ? to_user_pointer(eci) : 0,
      ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    struct drm_xe_wait_user_fence wait =3D {
                                         ^
  ../lib/xe/xe_ioctl.c:504:16:
     .instances =3D eci ? to_user_pointer(eci) : 0,
                  {
    };
    }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847039:step_script
  section_start:1701847039:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847040:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/52421311):
      ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
     .instances =3D eci ? to_user_pointer(eci) : 0,
      ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    struct drm_xe_wait_user_fence wait =3D {
                                         ^
  ../lib/xe/xe_ioctl.c:504:16:
     .instances =3D eci ? to_user_pointer(eci) : 0,
                  {
    };
    }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847039:step_script
  section_start:1701847039:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847040:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/52421313):
      ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
     .instances =3D eci ? to_user_pointer(eci) : 0,
      ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    struct drm_xe_wait_user_fence wait =3D {
                                         ^
  ../lib/xe/xe_ioctl.c:504:16:
     .instances =3D eci ? to_user_pointer(eci) : 0,
                  {
    };
    }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847039:step_script
  section_start:1701847039:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847040:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/52421310):
      ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
     .instances =3D eci ? to_user_pointer(eci) : 0,
      ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    struct drm_xe_wait_user_fence wait =3D {
                                         ^
  ../lib/xe/xe_ioctl.c:504:16:
     .instances =3D eci ? to_user_pointer(eci) : 0,
                  {
    };
    }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847008:step_script
  section_start:1701847008:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847009:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/52421304):
        |    ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
    504 |   .instances =3D eci ? to_user_pointer(eci) : 0,
        |    ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    496 |  struct drm_xe_wait_user_fence wait =3D {
        |                                       ^
  ......
    504 |   .instances =3D eci ? to_user_pointer(eci) : 0,
        |                {
    505 |  };
        |  }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847018:step_script
  section_start:1701847018:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847019:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/52421308):
  [5/1437] Linking static target lib/libigt-igt_amd_c.a.
  [6/1437] Linking static target lib/libigt-veboxcopy_gen12_c.a.
  [7/1437] Linking static target lib/libigt-igt_msm_c.a.
  [8/1437] Compiling C object 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioc=
tl.c.o'.
  FAILED: lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o=20
  clang -Ilib/76b5a35@@igt-xe_xe_ioctl_c@sta -Ilib -I../lib -I../include -I=
../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I.=
./ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/inclu=
de -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16=
 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrin=
d -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvali=
d-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIF=
Y_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2=
 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmis=
sing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wr=
edundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-m=
issing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member =
-Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result=
 -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit=
-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces=
 -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Wer=
ror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-built=
in-malloc -fno-builtin-calloc -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/s=
hare/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-=
DIGT_LOG_DOMAIN=3D"xe/xe_ioctl"' -MD -MQ 'lib/76b5a35@@igt-xe_xe_ioctl_c@st=
a/xe_xe_ioctl.c.o' -MF 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o.=
d' -o 'lib/76b5a35@@igt-xe_xe_ioctl_c@sta/xe_xe_ioctl.c.o' -c ../lib/xe/xe_=
ioctl.c
  ../lib/xe/xe_ioctl.c:467:19: error: use of undeclared identifier 'DRM_XE_=
UFENCE_WAIT_FLAG_SOFT_OP'
                  .flags =3D !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
                                  ^
  ../lib/xe/xe_ioctl.c:499:19: error: use of undeclared identifier 'DRM_XE_=
UFENCE_WAIT_FLAG_SOFT_OP'
                  .flags =3D !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | DRM_X=
E_UFENCE_WAIT_FLAG_ABSTIME : 0,
                                  ^
  2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1701847043:step_script
  section_start:1701847043:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847044:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/52421307):
        |    ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
    504 |   .instances =3D eci ? to_user_pointer(eci) : 0,
        |    ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    496 |  struct drm_xe_wait_user_fence wait =3D {
        |                                       ^
  ......
    504 |   .instances =3D eci ? to_user_pointer(eci) : 0,
        |                {
    505 |  };
        |  }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847018:step_script
  section_start:1701847018:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847019:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/52421305):
        |    ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
    504 |   .instances =3D eci ? to_user_pointer(eci) : 0,
        |    ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    496 |  struct drm_xe_wait_user_fence wait =3D {
        |                                       ^
  ......
    504 |   .instances =3D eci ? to_user_pointer(eci) : 0,
        |                {
    505 |  };
        |  }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847019:step_script
  section_start:1701847019:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847019:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/52421306):
        |    ^~~~~~~~~~~
  ../lib/xe/xe_ioctl.c:504:4: error: =E2=80=98struct drm_xe_wait_user_fence=
=E2=80=99 has no member named =E2=80=98instances=E2=80=99
    504 |   .instances =3D eci ? to_user_pointer(eci) : 0,
        |    ^~~~~~~~~
  ../lib/xe/xe_ioctl.c:496:39: error: missing braces around initializer [-W=
error=3Dmissing-braces]
    496 |  struct drm_xe_wait_user_fence wait =3D {
        |                                       ^
  ......
    504 |   .instances =3D eci ? to_user_pointer(eci) : 0,
        |                {
    505 |  };
        |  }
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1701847016:step_script
  section_start:1701847016:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1701847017:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1050547
