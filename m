Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE51DC27C55
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 19:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508CF10ECF5;
	Fri,  7 Jun 2024 19:05:46 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F7810ECF7;
 Fri,  7 Jun 2024 19:05:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_tests/chamelium=3A_Inte?=
 =?utf-8?q?grate_the_chamelium_v3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 07 Jun 2024 19:05:43 -0000
Message-ID: <171778714336.28075.14268864503127909916@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
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

== Series Details ==

Series: tests/chamelium: Integrate the chamelium v3
URL   : https://patchwork.freedesktop.org/series/134506/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1194074 for the overview.

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59518807):
           ^~~~~~~~~
  ../lib/chamelium/v3/igt_chamelium.c: In function ‘igt_get_connector_from_name’:
  ../lib/chamelium/v3/igt_chamelium.c:967:35: error: initialization of ‘drmModeConnectorPtr’ {aka ‘struct _drmModeConnector *’} from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
     drmModeConnectorPtr connector = drmModeGetConnector(drm_fd, res->connectors[i]);
                                     ^~~~~~~~~~~~~~~~~~~
  ../lib/chamelium/v3/igt_chamelium.c:965:8: warning: unused variable ‘found’ [-Wunused-variable]
     bool found;
          ^~~~~
  ../lib/chamelium/v3/igt_chamelium.c: In function ‘igt_wait_for_connector_status’:
  ../lib/chamelium/v3/igt_chamelium.c:1000:13: error: assignment to ‘drmModeConnector *’ {aka ‘struct _drmModeConnector *’} from ‘int’ makes pointer from integer without a cast [-Werror=int-conversion]
     connector = drmModeGetConnector(drm_fd, connector_id);
               ^
  cc1: some warnings being treated as errors
  ninja: build stopped: subcommand failed.
  section_end:1717605446:step_script
  section_start:1717605446:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717605447:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59518802):
  [1431/1815] Generating kms_chamelium_v3_basic.testlist with a meson_exe.py custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1054] Generating version.h with a custom command.
  [2/386] Generating kms_chamelium_frames.testlist with a meson_exe.py custom command.
  [3/386] Generating kms_chamelium_hpd.testlist with a meson_exe.py custom command.
  [4/386] Linking target tests/kms_chamelium_v3_edid.
  FAILED: tests/kms_chamelium_v3_edid 
  cc  -o tests/kms_chamelium_v3_edid 'tests/59830eb@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt.so.0 /usr/lib64/libcairo.so /usr/lib64/libglib-2.0.so /usr/lib64/libdrm.so /usr/lib64/libdw.so /usr/lib64/libelf.so /usr/lib64/libkmod.so /usr/lib64/libudev.so -lm /usr/lib64/libpciaccess.so /usr/lib64/libpixman-1.so -pthread -lrt -lz /usr/lib64/libdrm_nouveau.so /usr/lib64/libdrm_amdgpu.so /usr/lib64/libunwind.so /usr/lib64/libgsl.so /usr/lib64/libgslcblas.so /usr/lib64/libasound.so /usr/lib64/libxmlrpc.so /usr/lib64/libxmlrpc_util.so /usr/lib64/libxmlrpc_client.so /usr/lib64/libprocps.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib
  /usr/bin/ld: tests/59830eb@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o: in function `__igt_unique____real_main273':
  /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:323: undefined reference to `get_edid_for_connector_type'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:351: undefined reference to `get_edid_for_connector_type'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1717605486:step_script
  section_start:1717605486:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717605486:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59518806):
  [1433/1815] Generating kms_chamelium_hpd.testlist with a meson_exe.py custom command.
  [1434/1815] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_basic@exe/amd_basic.c.o'.
  [1435/1815] Compiling C object 'tests/amdgpu/b9f2b1d@@amd_bo@exe/amd_bo.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1052] Generating version.h with a custom command.
  [2/382] Linking target tests/kms_chamelium_v3_edid.
  FAILED: tests/kms_chamelium_v3_edid 
  clang  -o tests/kms_chamelium_v3_edid 'tests/59830eb@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt.so.0 /usr/lib64/libcairo.so /usr/lib64/libglib-2.0.so /usr/lib64/libdrm.so /usr/lib64/libdw.so /usr/lib64/libelf.so /usr/lib64/libkmod.so /usr/lib64/libudev.so -lm /usr/lib64/libpciaccess.so /usr/lib64/libpixman-1.so -pthread -lrt -lz /usr/lib64/libdrm_nouveau.so /usr/lib64/libdrm_amdgpu.so /usr/lib64/libunwind.so /usr/lib64/libgsl.so /usr/lib64/libgslcblas.so /usr/lib64/libasound.so /usr/lib64/libxmlrpc.so /usr/lib64/libxmlrpc_util.so /usr/lib64/libxmlrpc_client.so /usr/lib64/libprocps.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib
  /usr/bin/ld: tests/59830eb@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o: in function `__igt_unique____real_main273':
  /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:323: undefined reference to `get_edid_for_connector_type'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:351: undefined reference to `get_edid_for_connector_type'
  clang-9: error: linker command failed with exit code 1 (use -v to see invocation)
  ninja: build stopped: subcommand failed.
  section_end:1717605496:step_script
  section_start:1717605496:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717605497:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59518805):
  [1390/1647] Generating kms_chamelium_frames.testlist with a meson_exe.py custom command.
  [1391/1647] Generating kms_chamelium_hpd.testlist with a meson_exe.py custom command.
  [1392/1647] Compiling C object 'tests/v3d/cad21b8@@v3d_perfmon@exe/v3d_perfmon.c.o'.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/921] Generating version.h with a custom command.
  [2/257] Linking target tests/kms_chamelium_v3_edid.
  FAILED: tests/kms_chamelium_v3_edid 
  cc  -o tests/kms_chamelium_v3_edid 'tests/59830eb@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt.so.0 /usr/lib64/libcairo.so /usr/lib64/libglib-2.0.so /usr/lib64/libdrm.so /usr/lib64/libdw.so /usr/lib64/libelf.so /usr/lib64/libkmod.so /usr/lib64/libudev.so -lm /usr/lib64/libpciaccess.so /usr/lib64/libpixman-1.so -pthread -lrt -lz /usr/lib64/libunwind.so /usr/lib64/libgsl.so /usr/lib64/libgslcblas.so /usr/lib64/libasound.so /usr/lib64/libxmlrpc.so /usr/lib64/libxmlrpc_util.so /usr/lib64/libxmlrpc_client.so /usr/lib64/libprocps.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib
  /usr/bin/ld: tests/59830eb@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o: in function `__igt_unique____real_main273':
  /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:323: undefined reference to `get_edid_for_connector_type'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:351: undefined reference to `get_edid_for_connector_type'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1717605485:step_script
  section_start:1717605485:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717605485:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59518803):
  [1436/1815] Linking target tests/amdgpu/amd_bo.
  [1437/1815] Linking target tests/amdgpu/amd_assr.
  [1438/1815] Generating kms_chamelium_frames.testlist with a meson_exe.py custom command.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1052] Generating version.h with a custom command.
  [2/379] Linking target tests/kms_chamelium_v3_edid.
  FAILED: tests/kms_chamelium_v3_edid 
  cc  -o tests/kms_chamelium_v3_edid 'tests/59830eb@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt.so.0 /usr/lib64/libcairo.so /usr/lib64/libglib-2.0.so /usr/lib64/libdrm.so /usr/lib64/libdw.so /usr/lib64/libelf.so /usr/lib64/libkmod.so /usr/lib64/libudev.so -lm /usr/lib64/libpciaccess.so /usr/lib64/libpixman-1.so -pthread -lrt -lz /usr/lib64/libdrm_nouveau.so /usr/lib64/libdrm_amdgpu.so /usr/lib64/libgsl.so /usr/lib64/libgslcblas.so /usr/lib64/libasound.so /usr/lib64/libxmlrpc.so /usr/lib64/libxmlrpc_util.so /usr/lib64/libxmlrpc_client.so /usr/lib64/libprocps.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib
  /usr/bin/ld: tests/59830eb@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o: in function `__igt_unique____real_main273':
  /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:323: undefined reference to `get_edid_for_connector_type'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:351: undefined reference to `get_edid_for_connector_type'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1717605482:step_script
  section_start:1717605482:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717605483:cleanup_file_variables
  ERROR: Job failed: exit code 1
  

build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/59518804):
  [1438/1815] Generating kms_chamelium_hpd.testlist with a meson_exe.py custom command.
  [1439/1815] Compiling C object 'tests/amdgpu/tests@amdgpu@@amd_color@exe/amd_color.c.o'.
  [1440/1815] Linking target tests/amdgpu/amd_basic.
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1051] Generating version.h with a custom command.
  [2/377] Linking target tests/kms_chamelium_v3_edid.
  FAILED: tests/kms_chamelium_v3_edid 
  cc  -o tests/kms_chamelium_v3_edid 'tests/tests@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o' -Wl,--no-undefined -Wl,--as-needed -Wl,--start-group lib/libigt.so.0 /usr/lib64/libcairo.so /usr/lib64/libglib-2.0.so /usr/lib64/libdrm.so /usr/lib64/libdw.so /usr/lib64/libelf.so /usr/lib64/libkmod.so /usr/lib64/libudev.so -lm /usr/lib64/libpciaccess.so /usr/lib64/libpixman-1.so -lrt -lz /usr/lib64/libdrm_nouveau.so /usr/lib64/libdrm_amdgpu.so /usr/lib64/libunwind.so /usr/lib64/libgsl.so /usr/lib64/libgslcblas.so -lm /usr/lib64/libasound.so /usr/lib64/libxmlrpc.so /usr/lib64/libxmlrpc_util.so /usr/lib64/libxmlrpc_client.so -lm -lm /usr/lib64/libprocps.so -lm -Wl,--end-group -pthread '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/builds/gfx-ci/igt-ci-tags/build/lib  
  /usr/bin/ld: tests/tests@@kms_chamelium_v3_edid@exe/chamelium_v3_kms_chamelium_v3_edid.c.o: in function `__igt_unique____real_main273':
  /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:323: undefined reference to `get_edid_for_connector_type'
  /usr/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../tests/chamelium/v3/kms_chamelium_v3_edid.c:351: undefined reference to `get_edid_for_connector_type'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1717605480:step_script
  section_start:1717605480:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1717605480:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1194074
