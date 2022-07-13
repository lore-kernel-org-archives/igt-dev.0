Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rohith Iyer" <quic_rohiiyer@quicinc.com>
Date: Wed, 13 Jul 2022 22:30:04 -0000
Message-ID: <165775140476.737.6533488718402231709@emeril.freedesktop.org>
References: <20220713222235.11655-1-quic_rohiiyer@quicinc.com>
In-Reply-To: <20220713222235.11655-1-quic_rohiiyer@quicinc.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_k?=
 =?utf-8?q?ms=5Fwriteback_enhancements?=
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

Series: kms_writeback enhancements
URL   : https://patchwork.freedesktop.org/series/106318/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/637343 fo=
r the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/25327850):
  /builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs=
.xml:237: element include: XInclude error : could not load /builds/gfx-ci/i=
gt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs_testdisplay_descr=
iption.xml, and no fallback was found
  warning: failed to load external entity "/builds/gfx-ci/igt-ci-tags/docs/=
reference/igt-gpu-tools/igt_test_programs_tools_programs.xml"
  /builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs=
.xml:245: element include: XInclude error : could not load /builds/gfx-ci/i=
gt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs_tools_programs.xm=
l, and no fallback was found
  warning: failed to load external entity "/builds/gfx-ci/igt-ci-tags/docs/=
reference/igt-gpu-tools/igt_test_programs_tools_description.xml"
  /builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs=
.xml:246: element include: XInclude error : could not load /builds/gfx-ci/i=
gt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs_tools_description=
.xml, and no fallback was found
  warning: failed to load external entity "/builds/gfx-ci/igt-ci-tags/docs/=
reference/igt-gpu-tools/igt_test_programs_vgem_programs.xml"
  /builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs=
.xml:254: element include: XInclude error : could not load /builds/gfx-ci/i=
gt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs_vgem_programs.xml=
, and no fallback was found
  warning: failed to load external entity "/builds/gfx-ci/igt-ci-tags/docs/=
reference/igt-gpu-tools/igt_test_programs_vgem_description.xml"
  /builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs=
.xml:255: element include: XInclude error : could not load /builds/gfx-ci/i=
gt-ci-tags/docs/reference/igt-gpu-tools/igt_test_programs_vgem_description.=
xml, and no fallback was found
 =20
 =20
  FAILED: meson-install=20
  /usr/bin/meson install --no-rebuild
  ninja: build stopped: subcommand failed.
  section_end:1657751261:step_script
  section_start:1657751261:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1657751262:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/25327852):
  ../xml/igt_kms.xml:4207: parser error : Premature end of data in tag refs=
ect2 line 3579
 =20
  ^
  ../xml/igt_kms.xml:4207: parser error : Premature end of data in tag refs=
ect1 line 393
 =20
  ^
  ../xml/igt_kms.xml:4207: parser error : Premature end of data in tag refe=
ntry line 8
 =20
  ^
  ../igt-gpu-tools-docs.xml:36: element include: XInclude error : could not=
 load ../xml/igt_kms.xml, and no fallback was found
 =20
  FAILED: meson-igt-gpu-tools-doc=20
  /usr/bin/python3 /usr/local/bin/meson --internal commandrunner /builds/gf=
x-ci/igt-ci-tags /builds/gfx-ci/igt-ci-tags/build docs/reference/igt-gpu-to=
ols /usr/bin/python3 /usr/local/bin/meson /usr/bin/python3 /usr/local/bin/m=
eson --internal gtkdoc --sourcedir=3D/builds/gfx-ci/igt-ci-tags --builddir=
=3D/builds/gfx-ci/igt-ci-tags/build --subdir=3Ddocs/reference/igt-gpu-tools=
 --headerdirs=3D/builds/gfx-ci/igt-ci-tags/lib@@/builds/gfx-ci/igt-ci-tags/=
build/lib --mainfile=3Digt-gpu-tools-docs.xml --modulename=3Digt-gpu-tools =
--mode=3Dauto --scanargs=3D--rebuild-sections --mkdbargs=3D--output-format=
=3Dxml --content-files=3D/builds/gfx-ci/igt-ci-tags/docs/reference/igt-gpu-=
tools/igt_test_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/referenc=
e/igt-gpu-tools/igt_test_programs_amdgpu_programs.xml@@/builds/gfx-ci/igt-c=
i-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_amdgpu_descript=
ion.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_=
test_programs_core_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/refe=
rence/igt-gpu-tools/igt_test_programs_core_description.xml@@/builds/gfx-ci/=
igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_debugfs_pr=
ograms.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/i=
gt_test_programs_debugfs_description.xml@@/builds/gfx-ci/igt-ci-tags/build/=
docs/reference/igt-gpu-tools/igt_test_programs_drm_programs.xml@@/builds/gf=
x-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_drm_d=
escription.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-too=
ls/igt_test_programs_gem_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/doc=
s/reference/igt-gpu-tools/igt_test_programs_gem_description.xml@@/builds/gf=
x-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_gen3_=
programs.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools=
/igt_test_programs_gen3_description.xml@@/builds/gfx-ci/igt-ci-tags/build/d=
ocs/reference/igt-gpu-tools/igt_test_programs_gen7_programs.xml@@/builds/gf=
x-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_gen7_=
description.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-to=
ols/igt_test_programs_i915_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/d=
ocs/reference/igt-gpu-tools/igt_test_programs_i915_description.xml@@/builds=
/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_km=
s_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-too=
ls/igt_test_programs_kms_description.xml@@/builds/gfx-ci/igt-ci-tags/build/=
docs/reference/igt-gpu-tools/igt_test_programs_meta_programs.xml@@/builds/g=
fx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_meta=
_description.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-t=
ools/igt_test_programs_perf_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/=
docs/reference/igt-gpu-tools/igt_test_programs_perf_description.xml@@/build=
s/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_p=
m_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-too=
ls/igt_test_programs_pm_description.xml@@/builds/gfx-ci/igt-ci-tags/build/d=
ocs/reference/igt-gpu-tools/igt_test_programs_prime_programs.xml@@/builds/g=
fx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_prim=
e_description.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-=
tools/igt_test_programs_sw_sync_programs.xml@@/builds/gfx-ci/igt-ci-tags/bu=
ild/docs/reference/igt-gpu-tools/igt_test_programs_sw_sync_description.xml@=
@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_pro=
grams_testdisplay_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/refer=
ence/igt-gpu-tools/igt_test_programs_testdisplay_description.xml@@/builds/g=
fx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_tool=
s_programs.xml@@/builds/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-too=
ls/igt_test_programs_tools_description.xml@@/builds/gfx-ci/igt-ci-tags/buil=
d/docs/reference/igt-gpu-tools/igt_test_programs_vgem_programs.xml@@/builds=
/gfx-ci/igt-ci-tags/build/docs/reference/igt-gpu-tools/igt_test_programs_vg=
em_description.xml --ignore-headers=3Dgen6_render.h@@gen7_media.h@@gen7_ren=
der.h@@gen8_media.h@@gen8_render.h@@gpgpu_fill.h@@i830_reg.h@@i915_3d.h@@i9=
15_pciids.h@@i915_reg.h@@igt_edid_template.h@@intel_reg.h@@debug.h@@instdon=
e.h@@media_fill.h@@rendercopy.h@@media_spin.h@@media_fill_gen9.h@@gen9_rend=
er.h@@version.h '--cflags=3D-I./include/drm-uapi -I../include/drm-uapi -I./=
include/linux-uapi -I../include/linux-uapi -I./lib -I../lib -I./lib/stubs/s=
yscalls -I../lib/stubs/syscalls -I./. -I../. -I/usr/include/cairo -I/usr/in=
clude/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr=
/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/inc=
lude/libdrm/nouveau -I/usr/include/valgrind' '--ldflags=3D-L/builds/gfx-ci/=
igt-ci-tags/build/lib -Wl,-rpath,/builds/gfx-ci/igt-ci-tags/build/lib -ligt=
 -lcairo -lglib-2.0 -ldrm -ldw -lelf -lkmod -lprocps -ludev -lm -lpciaccess=
 -lpixman-1 -lrt -lz -ldrm_intel -ldrm_nouveau -ldrm_amdgpu -lunwind -lgsl =
-lgslcblas -lasound -lxmlrpc -lxmlrpc_util -lxmlrpc_client' --cc=3Dcc --ld=
=3Dcc
  ninja: build stopped: subcommand failed.
  section_end:1657751262:step_script
  section_start:1657751262:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1657751263:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/637343
