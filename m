Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CACA10EA31
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 16:01:58 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 17:01:45 +0100
Message-ID: <20231103160148.94811-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
References: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/3] lib/igt_device_scan: add multigpu
 filtering view
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

Created multiGPU filtering for GPU cards. When used with
--device or IGT_DEVICE, this will just count cards found with
given filtering options, otherwise will count them with the
help of vendor filtering.
    Filtering is not restricted and will allow to re-open
already opened card, if user gives something like:

IGT_DEVICE=pci:vendor=intel,device=discrete,card=0\;pci:vendor=intel,device=discrete,card=0
or
IGT_DEVICE=pci:vendor=intel,card=0\;pci:vendor=intel,card=0

For discrete cards one can use:
IGT_DEVICE=pci:vendor=intel,device=discrete,card=all

v2: move filtering into igt_device_scan.c (Zbigniew)
  filter all GPUs, not only discrete (Zbigniew)
  simplify checks for unsupported drivers like vgem (Kamil)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  3 +++
 2 files changed, 65 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index f4f95fef3..fbf3fa482 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -2065,3 +2065,65 @@ int igt_open_render(struct igt_device_card *card)
 
 	return open(card->render, O_RDWR);
 }
+
+/**
+ * igt_device_prepare_filtered_view:
+ * @vendor: name for GPUs vendor to search, eg. "intel"
+ *
+ * Filter GPU devices for given vendor or with supplied --device
+ * option or IGT_DEVICE environment variable.
+ *
+ * Returns:
+ * Number of filtered GPUs for a vendor or number of filters.
+ */
+int igt_device_prepare_filtered_view(const char *vendor)
+{
+	int gpu_count;
+
+	gpu_count = igt_device_filter_count();
+	if (!gpu_count) {
+		char gpu_filter[256];
+
+		igt_assert(vendor);
+		if (!strcmp(vendor, "vgem") || !strcmp(vendor, "other")) {
+			igt_debug("Unsupported vendor: %s\n", vendor);
+			return 0;
+		}
+
+		if (!strcmp(vendor, "any")) {
+			igt_debug("Chipset DRIVER_ANY unsupported without --device filters\n");
+			return 0;
+		}
+
+		igt_assert(snprintf(gpu_filter, sizeof(gpu_filter), "pci:vendor=%s,card=all",
+				    vendor) < sizeof(gpu_filter));
+
+		igt_device_filter_add(gpu_filter); // fill-in filters for all GPUs
+		gpu_count = igt_device_filter_count();
+		igt_debug("Found %d GPUs for vendor: %s\n", gpu_count, vendor);
+	} else {
+		struct igt_device_card card;
+		bool found;
+		int count = 0;
+
+		for (int i = 0; i < gpu_count; i++) {
+			const char *filter;
+
+			filter = igt_device_filter_get(i);
+			found = igt_device_card_match(filter, &card);
+			if (found && strlen(card.card)) {
+				igt_debug("Found GPU%d card %s\n", i, card.card);
+				++count;
+			}
+		}
+
+		if (count < gpu_count) {
+			igt_debug("Counted GPUs %d lower than number of filters %d\n", count, gpu_count);
+			gpu_count = count;
+		} else {
+			igt_debug("Found %d GPUs\n", gpu_count);
+		}
+	}
+
+	return gpu_count;
+}
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index b8f6a843d..48690e236 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -93,4 +93,7 @@ char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
 int igt_open_card(struct igt_device_card *card);
 int igt_open_render(struct igt_device_card *card);
 
+/* Add or use filters to match multiGPU devices */
+int igt_device_prepare_filtered_view(const char *vendor);
+
 #endif /* __IGT_DEVICE_SCAN_H__ */
-- 
2.42.0
