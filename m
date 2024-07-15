Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58C3C3DA4B
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 18:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BDC10E4AF;
	Mon, 15 Jul 2024 18:22:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D3D10E4AF;
 Mon, 15 Jul 2024 18:22:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/gem=5Fctx=5Fexec?=
 =?utf-8?q?=3A_Fix_failing_preempt_timeout_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 15 Jul 2024 18:22:13 -0000
Message-ID: <172106773313.231758.2204924278042256093@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240715181523.2825921-7-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240715181523.2825921-7-janusz.krzysztofik@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
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

=3D=3D Series Details =3D=3D

Series: tests/gem_ctx_exec: Fix failing preempt timeout updates
URL   : https://patchwork.freedesktop.org/series/136109/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1224761 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/61054445):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
         !strncmp(device, target, len)
                                      ^
                                      )
      break;
      ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
     if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D len &&
        ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1721067700:step_script
  section_start:1721067700:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067701:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/61054448):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
         !strncmp(device, target, len)
                                      ^
                                      )
      break;
      ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
     if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D len &&
        ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1721067700:step_script
  section_start:1721067700:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067701:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/61054447):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
         !strncmp(device, target, len)
                                      ^
                                      )
      break;
      ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
     if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D len &&
        ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1721067710:step_script
  section_start:1721067710:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067712:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gf=
x-ci/igt-ci-tags/-/jobs/61054449):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
         !strncmp(device, target, len)
                                      ^
                                      )
      break;
      ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
     if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D len &&
        ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1721067699:step_script
  section_start:1721067699:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067699:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-c=
i/igt-ci-tags/-/jobs/61054446):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
         !strncmp(device, target, len)
                                      ^
                                      )
      break;
      ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
     if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D len &&
        ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    }
    ^
  ninja: build stopped: subcommand failed.
  section_end:1721067697:step_script
  section_start:1721067697:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067698:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/61054440):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
    482 |       !strncmp(device, target, len)
        |                                    ^
        |                                    )
    483 |    break;
        |    ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
    481 |   if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D le=
n &&
        |      ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    487 |  }
        |  ^
  ninja: build stopped: subcommand failed.
  section_end:1721067707:step_script
  section_start:1721067707:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067708:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/61054444):
  ninja: Entering directory `build'
  [1/1847] Generating version.h with a custom command.
  [2/1845] Linking static target lib/libigt-i915_gem_context_c.a.
  [3/1845] Compiling C object 'lib/76b5a35@@igt-i915_gem_engine_topology_c@=
sta/i915_gem_engine_topology.c.o'.
  FAILED: lib/76b5a35@@igt-i915_gem_engine_topology_c@sta/i915_gem_engine_t=
opology.c.o=20
  clang -Ilib/76b5a35@@igt-i915_gem_engine_topology_c@sta -Ilib -I../lib -I=
../include -I../include/drm-uapi -I../include/linux-uapi -I../lib/stubs/sys=
calls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/g=
lib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/inc=
lude/libpng16 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/in=
clude/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -=
Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include confi=
g.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement=
 -Wformat=3D2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-n=
oreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpoin=
ter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -W=
unused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-p=
acked-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-=
unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -=
Werror=3Dinit-self -Werror=3Dint-conversion -Werror=3Dint-to-pointer-cast -=
Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-=
to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigra=
phs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -D_LARG=
EFILE64_SOURCE=3D1 -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/igt-gp=
u-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DO=
MAIN=3D"i915/gem_engine_topology"' -MD -MQ 'lib/76b5a35@@igt-i915_gem_engin=
e_topology_c@sta/i915_gem_engine_topology.c.o' -MF 'lib/76b5a35@@igt-i915_g=
em_engine_topology_c@sta/i915_gem_engine_topology.c.o.d' -o 'lib/76b5a35@@i=
gt-i915_gem_engine_topology_c@sta/i915_gem_engine_topology.c.o' -c ../lib/i=
915/gem_engine_topology.c
  ../lib/i915/gem_engine_topology.c:483:4: error: expected ')'
                          break;
                          ^
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this '('
                  if (readlinkat(dir, "device", device, sizeof(device)) =3D=
=3D len &&
                     ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1721067710:step_script
  section_start:1721067710:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067711:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop=
.org/gfx-ci/igt-ci-tags/-/jobs/61054443):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
    482 |       !strncmp(device, target, len)
        |                                    ^
        |                                    )
    483 |    break;
        |    ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
    481 |   if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D le=
n &&
        |      ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    487 |  }
        |  ^
  ninja: build stopped: subcommand failed.
  section_end:1721067696:step_script
  section_start:1721067696:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067697:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/61054441):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
    482 |       !strncmp(device, target, len)
        |                                    ^
        |                                    )
    483 |    break;
        |    ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
    481 |   if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D le=
n &&
        |      ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    487 |  }
        |  ^
  ninja: build stopped: subcommand failed.
  section_end:1721067698:step_script
  section_start:1721067698:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067699:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/61054442):
  ../lib/i915/gem_engine_topology.c: In function =E2=80=98__open_primary=E2=
=80=99:
  ../lib/i915/gem_engine_topology.c:482:36: error: expected =E2=80=98)=E2=
=80=99 before =E2=80=98break=E2=80=99
    482 |       !strncmp(device, target, len)
        |                                    ^
        |                                    )
    483 |    break;
        |    ~~~~~                           =20
  ../lib/i915/gem_engine_topology.c:481:6: note: to match this =E2=80=98(=
=E2=80=99
    481 |   if (readlinkat(dir, "device", device, sizeof(device)) =3D=3D le=
n &&
        |      ^
  ../lib/i915/gem_engine_topology.c:487:2: error: expected expression befor=
e =E2=80=98}=E2=80=99 token
    487 |  }
        |  ^
  ninja: build stopped: subcommand failed.
  section_end:1721067688:step_script
  section_start:1721067688:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1721067688:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1224761
