Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D49110E8D7
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 15:14:27 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Dec 2023 15:14:14 +0000
Message-ID: <20231201151414.538960-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_pat: add sanity check for
 NULL mappings
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

Any platform supported pat_index should be compatible with NULL bindings
from KMD pov. Make sure that holds true.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
---
 tests/intel/xe_pat.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 78bd96d11..5c61a5169 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -113,12 +113,30 @@ static void pat_index_all(int fd)
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
 						   pat_index, 0),
 				      -EINVAL);
+
+			igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, 0, 0x40000,
+						   size, DRM_XE_VM_BIND_OP_MAP,
+						   DRM_XE_VM_BIND_FLAG_NULL, NULL, 0, 0,
+						   pat_index, 0),
+				      -EINVAL);
 		} else {
 			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
 						   pat_index, 0),
 				      0);
 			xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+
+			/*
+			 * There is no real memory being mapped here, so any
+			 * platform supported pat_index should be acceptable for
+			 * NULL mappings.
+			 */
+			igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, 0, 0x40000,
+						   size, DRM_XE_VM_BIND_OP_MAP,
+						   DRM_XE_VM_BIND_FLAG_NULL, NULL, 0, 0,
+						   pat_index, 0),
+				      0);
+			xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
 		}
 	}
 
@@ -127,6 +145,12 @@ static void pat_index_all(int fd)
 				   pat_index, 0),
 		      -EINVAL);
 
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, 0, 0x40000,
+				   size, DRM_XE_VM_BIND_OP_MAP,
+				   DRM_XE_VM_BIND_FLAG_NULL, NULL, 0, 0,
+				   pat_index, 0),
+		      -EINVAL);
+
 	gem_close(fd, bo);
 
 	/* coh_none is never allowed with cpu_caching WB. */
-- 
2.43.0
