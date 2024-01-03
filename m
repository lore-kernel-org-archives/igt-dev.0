Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930CB10E2D5
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jan 2024 23:49:55 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_mmio: Allow access to full register space on
 modern platforms
Date: Wed,  3 Jan 2024 15:49:29 -0800
Message-ID: <20240103234929.132148-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

PCI BAR0 on almost all Intel GPUs is a 16MB range composed of 8MB for
MMIO space and 8MB for GTT.  The current MMIO library code is limiting
the iomap to just 2MB (which is where most of the registers live), but
we actually need access to at least 4MB to access some of the registers
that are appearing on newer platforms.  However since this library is
mostly used for developer debug tools, there's no need to artificially
limit the map to just the range where registers exist today; from gen12
onward (where it's easy to find supporting documentation) map the full
8MB space so that tools like intel_reg get accurate results rather than
random garbage when reading any MMIO offset.

While we're at it, reverse the if/else ladder to match typical coding
conventions and combine the redundant pre-gen3 and gen3/gen4 conditions.

Bspec: 44980
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/intel_mmio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/intel_mmio.c b/lib/intel_mmio.c
index 10b07aabe..4b6820787 100644
--- a/lib/intel_mmio.c
+++ b/lib/intel_mmio.c
@@ -153,12 +153,12 @@ intel_mmio_use_pci_bar(struct intel_mmio_data *mmio_data, struct pci_device *pci
 		mmio_bar = 0;
 
 	gen = intel_gen(devid);
-	if (gen < 3)
-		mmio_size = 512*1024;
-	else if (gen < 5)
-		mmio_size = 512*1024;
+	if (gen >= 12)
+		mmio_size = 8 * 1024 * 1024;
+	else if (gen >= 5)
+		mmio_size = 2 * 1024 * 1024;
 	else
-		mmio_size = 2*1024*1024;
+		mmio_size = 512 * 1024;
 
 	error = pci_device_map_range (pci_dev,
 				      pci_dev->regions[mmio_bar].base_addr,
-- 
2.43.0
