Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4D6D597C4
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 01:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEB610E139;
	Wed, 13 Nov 2024 01:31:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D981010E139;
 Wed, 13 Nov 2024 01:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/xe/pmu=3A_Add_pmu?=
 =?utf-8?q?_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 13 Nov 2024 01:31:16 -0000
Message-ID: <173146147688.3252460.10194104961165427396@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112233107.4100533-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20241112233107.4100533-1-vinay.belgaumkar@intel.com>
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

Series: tests/xe/pmu: Add pmu tests (rev2)
URL   : https://patchwork.freedesktop.org/series/140737/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1309213 f=
or the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/66504689):
  section_start:1731461149:get_sources
  Getting source from Git repository
  $ /host/bin/curl -s -L --cacert /host/ca-certificates.crt --retry 4 -f --=
retry-delay 60 https://gitlab.freedesktop.org/freedesktop/helm-gitlab-infra=
/-/raw/main/runner-gating/runner-gating.sh | sh -s -- pre_get_sources_script
  Checking if the user of the pipeline is allowed...
  Checking if the job's project is part of a well-known group...
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out c1c17d63 as detached HEAD (ref is intel/IGTPW_12082)...
 =20
  Skipping Git submodules setup
  section_end:1731461166:get_sources
  section_start:1731461166:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a8085=
25defcb8bbb774078 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-deb=
ian:commit-c1c17d63c669f22d0bf9bb4e2a87dc4cc5580436 with digest registry.fr=
eedesktop.org/gfx-ci/igt-ci-tags/build-debian@sha256:b9fe73c6ff5d68f5692fd1=
8b9076735679c8bfa7ed393e752dd4927a2cdf9874 ...
  section_end:1731461170:step_script
  section_start:1731461170:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1731461172:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such i=
mage: docker.io/library/sha256:ca01fc804bb92e5df42a202dd7e0470610c6711c66a8=
08525defcb8bbb774078: image not known (docker.go:650:0s)

build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/66504692):
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out c1c17d63 as detached HEAD (ref is intel/IGTPW_12082)...
  Removing build/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing meson-test-list.txt
  Removing scripts/__pycache__/
 =20
  Skipping Git submodules setup
  section_end:1731461166:get_sources
  section_start:1731461166:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c5760e=
fac48fe52da27946c for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-deb=
ian-arm64:commit-c1c17d63c669f22d0bf9bb4e2a87dc4cc5580436 with digest regis=
try.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-arm64@sha256:df8438cd0e=
218646c3bdc2eb6abccb43c4e884bfd40a1a4dd0365f1f8031d21f ...
  section_end:1731461170:step_script
  section_start:1731461170:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1731461171:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such i=
mage: docker.io/library/sha256:7360075a71dacfc66f0b49b3271b9a459904dbe51c57=
60efac48fe52da27946c: image not known (docker.go:650:0s)

build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/g=
fx-ci/igt-ci-tags/-/jobs/66504691):
  Thank you for contributing to freedesktop.org
  Fetching changes...
  Reinitialized existing Git repository in /builds/gfx-ci/igt-ci-tags/.git/
  Checking out c1c17d63 as detached HEAD (ref is intel/IGTPW_12082)...
  Removing build/
  Removing installdir/
  Removing lib/i915/perf-configs/__pycache__/
  Removing lib/xe/oa-configs/__pycache__/
  Removing scripts/__pycache__/
 =20
  Skipping Git submodules setup
  section_end:1731461166:get_sources
  section_start:1731461166:step_script
  Executing "step_script" stage of the job script
  Using docker image sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cefcc1=
cbc1356a8959fb5f8 for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-deb=
ian-armhf:commit-c1c17d63c669f22d0bf9bb4e2a87dc4cc5580436 with digest regis=
try.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-armhf@sha256:3a0ffeb305=
cdc6ef081dde81d86afee76102e74f76c0f7bd5685fc2457ec707b ...
  section_end:1731461170:step_script
  section_start:1731461170:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1731461172:cleanup_file_variables
  ERROR: Job failed (system failure): Error response from daemon: no such i=
mage: docker.io/library/sha256:4a4103f1a476d355d866b481ff96ac05a32a3a715cef=
cc1cbc1356a8959fb5f8: image not known (docker.go:650:0s)

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci=
-tags/-/jobs/66504684):
  [1904/1921] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meso=
n-generated_gram.c.o'.
  [1905/1921] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_te=
sts.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/863] Generating version.h with a custom command.
  [2/18] Linking target runner/runner_test.
  [3/18] Linking target assembler/intel-gen4asm.
  [4/18] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/=
chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b=
33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overla=
y@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c=
.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33=
d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@=
exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'ov=
erlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-g=
pu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' =
'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@int=
el-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe=
/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-windo=
w.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b=
4b33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,--no=
-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo=
.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel=
.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--en=
d-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-t=
ags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `xe_perf_event_=
config':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:156: undefined referen=
ce to `__igt_fail_assert'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1731461197:step_script
  section_start:1731461197:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1731461198:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/66504688):
  [1914/1921] Generating i915_tests.rst with a custom command.
  [1915/1921] Generating kms_tests.rst with a custom command.
  [1916/1921] Generating intel-ci-tests with a custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/856] Generating version.h with a custom command.
  [2/8] Linking target assembler/intel-gen4asm.
  [3/8] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  clang  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@e=
xe/chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/=
b4b33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-ove=
rlay@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupt=
s.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4=
b33d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overl=
ay@exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' =
'overlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@inte=
l-gpu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.=
o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@=
intel-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@=
exe/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-wi=
ndow.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overla=
y/b4b33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,-=
-no-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libca=
iro.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_in=
tel.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,-=
-end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-c=
i-tags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `xe_perf_event_=
config':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:156: undefined referen=
ce to `__igt_fail_assert'
  clang-9: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
  ninja: build stopped: subcommand failed.
  section_end:1731461211:step_script
  section_start:1731461211:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1731461212:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/66504685):
  [1903/1921] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meso=
n-generated_gram.c.o'.
  [1904/1921] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_te=
sts.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/864] Generating version.h with a custom command.
  [2/19] Linking target runner/runner_test.
  [3/19] Linking target assembler/intel-gen4asm.
  [4/19] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/=
chart.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b=
33d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overla=
y@exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c=
.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33=
d2@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@=
exe/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'ov=
erlay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-g=
pu-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' =
'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@int=
el-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe=
/x11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-windo=
w.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b=
4b33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,--no=
-undefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo=
.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel=
.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--en=
d-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-t=
ags/build/lib
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `xe_perf_event_=
config':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:156: undefined referen=
ce to `__igt_fail_assert'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1731461222:step_script
  section_start:1731461222:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1731461223:cleanup_file_variables
  ERROR: Job failed: exit code 1
 =20

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/=
gfx-ci/igt-ci-tags/-/jobs/66504686):
  [1905/1921] Compiling C object 'assembler/assembler@@intel-gen4asm@exe/me=
son-generated_gram.c.o'.
  [1906/1921] Compiling C object 'runner/runner@@runner_test@exe/runner_tes=
ts.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/862] Generating version.h with a custom command.
  [2/17] Linking target runner/runner_test.
  [3/17] Linking target assembler/intel-gen4asm.
  [4/17] Linking target overlay/intel-gpu-overlay.
  FAILED: overlay/intel-gpu-overlay=20
  cc  -o overlay/intel-gpu-overlay 'overlay/overlay@@intel-gpu-overlay@exe/=
chart.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/config.c.o' 'overlay/ove=
rlay@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/overlay@@intel-gpu-overla=
y@exe/debugfs.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gem-interrupts.c=
.o' 'overlay/overlay@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/overl=
ay@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/overlay@@intel-gpu-overlay@=
exe/gpu-perf.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/gpu-freq.c.o' 'ov=
erlay/overlay@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/overlay@@intel-g=
pu-overlay@exe/power.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/rc6.c.o' =
'overlay/overlay@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/overlay@@int=
el-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/overlay@@intel-gpu-overlay@exe=
/x11_x11-overlay.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_x11-windo=
w.c.o' 'overlay/overlay@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/o=
verlay@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--no-undefined -Wl,-=
-as-needed -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib64/libcairo=
.so /usr/lib64/libpciaccess.so /usr/lib64/libdrm.so /usr/lib64/libdrm_intel=
.so /usr/lib64/libXv.so /usr/lib64/libX11.so /usr/lib64/libXext.so -Wl,--en=
d-group =20
  /usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `xe_perf_event_=
config':
  /builds/gfx-ci/igt-ci-tags/build/../lib/igt_perf.c:156: undefined referen=
ce to `__igt_fail_assert'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1731461240:step_script
  section_start:1731461240:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1731461241:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/1309213
