Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Tue, 01 Nov 2022 15:16:19 -0000
Message-ID: <166731577968.13549.10701681574528166243@emeril.freedesktop.org>
References: <20221101143743.355364-1-markyacoub@chromium.org>
In-Reply-To: <20221101143743.355364-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_k?=
 =?utf-8?q?ms=5Fchamelium=3A_Add_new_EDID_stress_resolution_test_=28rev3?=
 =?utf-8?q?=29?=
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

Series: kms_chamelium: Add new EDID stress resolution test (rev3)
URL   : https://patchwork.freedesktop.org/series/110263/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/726485 fo=
r the overview.

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/30814994):
  		  "1513141f2309070783010000023a8018"
  		  "71382d40582c4500fd1e1100001e011d"
  		  "8018711c1620582c2500fd1e1100009e"
  		  "011d007251d01e206e285500fd1e1100"
  		  "001e8c0ad08a20e02d10103e9600fd1e"
  		  "11000018000000000000000000000000"
  		  "0000000000000000000000000000003f" }
  };
  " does not begin with "struct/union [NAME] {"
 =20
 =20
  FAILED: meson-install=20
  /usr/bin/meson install --no-rebuild
  ninja: build stopped: subcommand failed.
  section_end:1667315304:step_script
  section_start:1667315304:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1667315305:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/30814996):
  		  "02031cf14f9005040302071601061112"
  		  "1513141f2309070783010000023a8018"
  		  "71382d40582c4500fd1e1100001e011d"
  		  "8018711c1620582c2500fd1e1100009e"
  		  "011d007251d01e206e285500fd1e1100"
  		  "001e8c0ad08a20e02d10103e9600fd1e"
  		  "11000018000000000000000000000000"
  		  "0000000000000000000000000000003f" }
  };
  " does not begin with "struct/union [NAME] {"
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
  section_end:1667315304:step_script
  section_start:1667315304:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1667315305:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/726485
