Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3190210E367
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 02:11:58 +0000 (UTC)
From: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 3 Nov 2023 02:11:53 +0000
Message-ID: <DM4PR12MB51527BD81303F33F23E832D8E3A5A@DM4PR12MB5152.namprd12.prod.outlook.com>
References: <20231102110656.2381729-1-jesse.zhang@amd.com>
In-Reply-To: <20231102110656.2381729-1-jesse.zhang@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: add amdgpu test suite
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Huang, Tim" <Tim.Huang@amd.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - General]

Please ignore this patch.

-----Original Message-----
From: Jesse Zhang <jesse.zhang@amd.com>
Sent: Thursday, November 2, 2023 7:07 PM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Tuikov, Luben <Luben.Tuikov@amd.com>; Koenig, Christian =
<Christian.Koenig@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; Kamil =
Konieczny <kamil.konieczny@linux.intel.com>; Huang, Tim <Tim.Huang@amd.com>=
; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: add amdgpu test suite

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

diff --git a/tests/meson.build b/tests/meson.build index 62721157d..9d9f302=
de 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -83,6 +83,28 @@ test_progs =3D [
        'vgem_slow',
 ]

+amd_gpu_progs =3D [
+       'amd_module_load',
+       'amd_basic',
+       'amd_pstate',
+       'amd_dispatch',
+       'amd_bo',
+       'amd_cs_nop',
+       'amd_deadlock',
+       'amd_mem_leak',
+       'amd_security',
+       'amd_syncobj',
+       'amd_uvd_dec',
+       'amd_uvd_enc',
+       'amd_vce_dec',
+       'amd_vcn',
+       'amd_vm',
+       'amd_hotplug',
+       'amd_info',
+       'amd_pci_unplug',
+       'amd_ras',
+]
+
 intel_i915_xe_progs =3D [
        'api_intel_allocator',
        'intel_hwmon',
@@ -398,6 +420,25 @@ foreach prog : test_progs
        endif
 endforeach

+foreach prog : amd_gpu_progs
+       testexe =3D executable(prog,
+                  [join_paths('amdgpu', prog + '.c')] + extra_sources.get(=
prog, []),
+                  dependencies : test_deps + extra_dependencies.get(prog, =
[]),
+                  install_dir : libexecdir,
+                  install_rpath : libexecdir_rpathdir,
+                  install : true)
+       test_executables +=3D testexe
+       test_list +=3D prog
+       name =3D prog.split('/').get(-1)
+       if not meson.is_cross_build()
+               testlist_files +=3D custom_target(name + '.testlist',
+                           build_by_default : true,
+                           command : [testexe, '--show-testlist'],
+                           capture : true,
+                           output : name + '.testlist')
+       endif
+endforeach
+
 intel_progs =3D intel_i915_xe_progs
 intel_progs +=3D intel_i915_progs + intel_kms_progs  if build_xe
--
2.25.1
