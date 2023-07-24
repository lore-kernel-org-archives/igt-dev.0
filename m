Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 24 Jul 2023 13:33:13 -0000
Message-ID: <169020559316.30102.3747945226035244318@emeril.freedesktop.org>
References: <20230721151528.495893-1-matthew.auld@intel.com>
In-Reply-To: <20230721151528.495893-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?GT_bits_for_small-bar_=28rev7=29?=
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

Series: IGT bits for small-bar (rev7)
URL   : https://patchwork.freedesktop.org/series/115786/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/943311 fo=
r the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/46031988):
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98XE_GEM_CREATE_FLAG_DEFER_BACKING=E2=80=99?
     return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_me=
mory;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                          XE_GEM_CREATE_FLAG_DEFER_BACKING
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205351:step_script
  section_start:1690205351:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205351:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/46031991):
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98XE_GEM_CREATE_FLAG_DEFER_BACKING=E2=80=99?
     return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_me=
mory;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                          XE_GEM_CREATE_FLAG_DEFER_BACKING
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205350:step_script
  section_start:1690205350:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205351:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/46031990):
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98XE_GEM_CREATE_FLAG_DEFER_BACKING=E2=80=99?
     return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_me=
mory;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                          XE_GEM_CREATE_FLAG_DEFER_BACKING
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205351:step_script
  section_start:1690205351:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205353:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/46031992):
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98XE_GEM_CREATE_FLAG_DEFER_BACKING=E2=80=99?
     return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_me=
mory;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                          XE_GEM_CREATE_FLAG_DEFER_BACKING
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205350:step_script
  section_start:1690205350:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205352:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/46031989):
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function); did you mean =
=E2=80=98XE_GEM_CREATE_FLAG_DEFER_BACKING=E2=80=99?
     return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_me=
mory;
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                          XE_GEM_CREATE_FLAG_DEFER_BACKING
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
   }
   ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205350:step_script
  section_start:1690205350:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205350:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/46031983):
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function)
    467 |   return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : sy=
stem_memory;
        |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
    431 | }
        | ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
    470 | }
        | ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205352:step_script
  section_start:1690205352:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205354:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/46031987):
  [6/1398] Compiling C object 'lib/76b5a35@@igt-xe_xe_query_c@sta/xe_xe_que=
ry.c.o'.
  FAILED: lib/76b5a35@@igt-xe_xe_query_c@sta/xe_xe_query.c.o=20
  clang -Ilib/76b5a35@@igt-xe_xe_query_c@sta -Ilib -I../lib -I../include -I=
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
DIGT_LOG_DOMAIN=3D"xe/xe_query"' -MD -MQ 'lib/76b5a35@@igt-xe_xe_query_c@st=
a/xe_xe_query.c.o' -MF 'lib/76b5a35@@igt-xe_xe_query_c@sta/xe_xe_query.c.o.=
d' -o 'lib/76b5a35@@igt-xe_xe_query_c@sta/xe_xe_query.c.o' -c ../lib/xe/xe_=
query.c
  ../lib/xe/xe_query.c:149:41: error: no member named 'cpu_visible_size' in=
 'struct drm_xe_query_mem_region'
                  return mem_usage->regions[region_idx].cpu_visible_size;
                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
  ../lib/xe/xe_query.c:428:32: error: use of undeclared identifier 'XE_GEM_=
CREATE_FLAG_NEEDS_VISIBLE_VRAM'
                  return vram_memory(fd, gt) | XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM;
                                               ^
  ../lib/xe/xe_query.c:467:24: error: use of undeclared identifier 'XE_GEM_=
CREATE_FLAG_NEEDS_VISIBLE_VRAM'
                  return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRA=
M : system_memory;
                                       ^
  3 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1690205356:step_script
  section_start:1690205356:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205357:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/46031986):
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function)
    467 |   return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : sy=
stem_memory;
        |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
    431 | }
        | ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
    470 | }
        | ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205350:step_script
  section_start:1690205350:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205350:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/46031984):
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function)
    467 |   return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : sy=
stem_memory;
        |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
    431 | }
        | ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
    470 | }
        | ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205350:step_script
  section_start:1690205350:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205351:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/46031985):
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:467:24: error: =E2=80=98XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM=E2=80=99 undeclared (first use in this function)
    467 |   return vram ? vram | XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : sy=
stem_memory;
        |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_memory=E2=80=99:
  ../lib/xe/xe_query.c:431:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
    431 | }
        | ^
  ../lib/xe/xe_query.c: In function =E2=80=98visible_vram_if_possible=E2=80=
=99:
  ../lib/xe/xe_query.c:470:1: error: control reaches end of non-void functi=
on [-Werror=3Dreturn-type]
    470 | }
        | ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1690205353:step_script
  section_start:1690205353:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1690205355:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/943311
