Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF01F10E84E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 11:07:08 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 2 Nov 2023 19:06:56 +0800
Message-ID: <20231102110656.2381729-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu: add amdgpu test suite
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add some amdgpu test suite to tester.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Tim Huang <tim.huang@amd.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/meson.build | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/meson.build b/tests/meson.build
index 62721157d..9d9f302de 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -83,6 +83,28 @@ test_progs = [
 	'vgem_slow',
 ]
 
+amd_gpu_progs = [
+	'amd_module_load',
+	'amd_basic',
+	'amd_pstate',
+	'amd_dispatch',
+	'amd_bo',
+	'amd_cs_nop',
+	'amd_deadlock',
+	'amd_mem_leak',
+	'amd_security',
+	'amd_syncobj',
+	'amd_uvd_dec',
+	'amd_uvd_enc',
+	'amd_vce_dec',
+	'amd_vcn',
+	'amd_vm',
+	'amd_hotplug',
+	'amd_info',
+	'amd_pci_unplug',
+	'amd_ras',
+]
+
 intel_i915_xe_progs = [
 	'api_intel_allocator',
 	'intel_hwmon',
@@ -398,6 +420,25 @@ foreach prog : test_progs
 	endif
 endforeach
 
+foreach prog : amd_gpu_progs
+	testexe = executable(prog,
+                  [join_paths('amdgpu', prog + '.c')] + extra_sources.get(prog, []),
+		   dependencies : test_deps + extra_dependencies.get(prog, []),
+		   install_dir : libexecdir,
+		   install_rpath : libexecdir_rpathdir,
+		   install : true)
+	test_executables += testexe
+	test_list += prog
+	name = prog.split('/').get(-1)
+	if not meson.is_cross_build()
+		testlist_files += custom_target(name + '.testlist',
+			    build_by_default : true,
+			    command : [testexe, '--show-testlist'],
+			    capture : true,
+			    output : name + '.testlist')
+	endif
+endforeach
+
 intel_progs = intel_i915_xe_progs
 intel_progs += intel_i915_progs + intel_kms_progs
 if build_xe
-- 
2.25.1
