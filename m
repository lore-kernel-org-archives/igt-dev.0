Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3CB10E511
 for <igt-dev@lists.freedesktop.org>; Sat,  1 Jul 2023 01:39:17 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 30 Jun 2023 21:38:59 -0400
Message-ID: <20230701013859.9796-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amdgpu: sort alphabetically file names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Using Kamil's suggestion to sort test file names alphabetically.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/amdgpu/meson.build | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 7fff7602f..35a675542 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -6,24 +6,24 @@ if libdrm_amdgpu.found()
 			  'amd_assr',
 			  'amd_basic',
 			  'amd_bypass',
-			  'amd_deadlock',
-			  'amd_pci_unplug',
-			  'amd_cp_dma_misc',
 			  'amd_color',
+			  'amd_cp_dma_misc',
 			  'amd_cs_nop',
+			  'amd_deadlock',
+			  'amd_dp_dsc',
 			  'amd_hotplug',
+			  'amd_ilr',
 			  'amd_info',
-			  'amd_prime',
+			  'amd_link_settings',
 			  'amd_max_bpc',
-			  'amd_module_load',
 			  'amd_mem_leak',
-			  'amd_link_settings',
-			  'amd_vrr_range',
 			  'amd_mode_switch',
-			  'amd_dp_dsc',
-			  'amd_psr',
+			  'amd_module_load',
+			  'amd_pci_unplug',
 			  'amd_plane',
-			  'amd_ilr',
+			  'amd_prime',
+			  'amd_psr',
+			  'amd_vrr_range',
 			]
 	amdgpu_deps += libdrm_amdgpu
 endif
-- 
2.25.1
