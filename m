Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: ramadevi.gandi@intel.com
Date: Tue, 16 Jun 2020 18:07:58 +0530
Message-Id: <20200616123758.3331-1-ramadevi.gandi@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH libdrm] intel: sync i915_pciids.h with kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, ramadevi.gandi@intel.com, igt-dev@lists.freedesktop.org
Cc: kalyan.kondapally@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Gandi Ramadevi <ramadevi.gandi@intel.com>

Add DG1 PCI ID

Signed-off-by: Gandi Ramadevi <ramadevi.gandi@intel.com>
---
 intel/i915_pciids.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/intel/i915_pciids.h b/intel/i915_pciids.h
index 662d8351..724e68a0 100644
--- a/intel/i915_pciids.h
+++ b/intel/i915_pciids.h
@@ -605,4 +605,9 @@
 	INTEL_VGA_DEVICE(0x9AD9, info), \
 	INTEL_VGA_DEVICE(0x9AF8, info)
 
+/* DG1 */
+#define INTEL_DG1_IDS(info) \
+        INTEL_VGA_DEVICE(0x4905, info), \
+        INTEL_VGA_DEVICE(0x4906, info)
+
 #endif /* _I915_PCIIDS_H */
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
