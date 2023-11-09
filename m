Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0404110E1DD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 08:12:54 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Date: Thu,  9 Nov 2023 13:46:16 +0530
Message-Id: <20231109081616.912332-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_vm: Correct stride to avoid
 address range collision
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lucas.demarchi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

For XE2, the minimum page size for both VRAM and system memory is only 4K.

Minimum page size was used as the address stride, which is 4K.
When attempting to bind a 4K range, consecutive VM BIND IOCTL calls
resulted in a range collision. Update stride based on bo size.

v2: Address review comments (Karolina)

Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index eeb49122a..f1ccd6c21 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -417,6 +417,9 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
+	if (addr_stride <= bo_size)
+		addr_stride = addr_stride + bo_size;
+
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
 					   visible_vram_if_possible(fd, eci->gt_id));
-- 
2.25.1
