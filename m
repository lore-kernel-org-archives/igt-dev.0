Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5916310E38D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Dec 2022 10:25:40 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Dec 2022 15:55:20 +0530
Message-Id: <20221207102523.1028941-3-anshuman.gupta@intel.com>
In-Reply-To: <20221207102523.1028941-1-anshuman.gupta@intel.com>
References: <20221207102523.1028941-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 2/5] lib/igt_pci: Add PCIe slot cap
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding PCIe slot cap register offset and Power Controller Present
bit mask macros.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 lib/igt_pci.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_pci.h b/lib/igt_pci.h
index 7cb23a26d8..876e4ec24d 100644
--- a/lib/igt_pci.h
+++ b/lib/igt_pci.h
@@ -20,6 +20,9 @@ enum pci_cap_id {
 	PCI_EXPRESS_CAP_ID = 0x10
 };
 
+#define PCI_SLOT_CAP_OFFSET 0x14  /* PCIe specs chapter 7.8.9 */
+#define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
+
 int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
 
 #endif
-- 
2.25.1
