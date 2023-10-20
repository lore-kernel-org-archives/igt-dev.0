Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2415D10E5A9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:01:13 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:00:13 +0200
Message-ID: <20231020130016.86398-6-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
References: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 5/8] lib/drmtest: create helper for
 countig number of GPUs
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

Create a function for counting number of GPUs present on system.
When no filters used this will count discrete GPUs, otherwise
will count them using given filters.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/drmtest.h |  2 ++
 2 files changed, 74 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 89d045200..2cdeb8e3b 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -804,6 +804,78 @@ int drm_reopen_driver(int fd)
 	return fd;
 }
 
+/**
+ * drm_open_driver_render:
+ * @chipset: flag for one chipset to search, eg. #DRIVER_INTEL
+ *
+ * Get number of GPUs for given chipset. If used --device option or IGT_DEVICE
+ * environment variable, perform countig based on supplied filters.
+ *
+ * Returns:
+ * Number of GPUs for given chipset or filters.
+ */
+int drm_get_gpu_count(int chipset)
+{
+	struct igt_device_card card;
+	int gpu_count;
+	bool found;
+	char v[16];
+
+	if (chipset == DRIVER_VGEM || chipset == DRIVER_ANY) {
+		igt_debug("No multi-gpu for chipset %d\n", chipset);
+		return 0;
+	}
+
+	gpu_count = igt_device_filter_count();
+	if (!gpu_count) {
+		char gpu_filter[256];
+
+		if (chipset == DRIVER_INTEL || chipset == DRIVER_XE)
+			strncpy(v, "Intel", sizeof(v) - 1);
+		else
+			strncpy(v, chipset_to_str(chipset), sizeof(v) - 1);
+		igt_debug("Counting GPUs for chipset: %d vendor: %s\n", chipset, v);
+		for (int i = 0; i < 64; i++) {
+			igt_assert(snprintf(gpu_filter, sizeof(gpu_filter),
+					    "pci:vendor=%s,device=discrete,card=%d",
+					    v, i) < sizeof(gpu_filter));
+
+			memset(&card, 0, sizeof(card));
+			found = igt_device_card_match(gpu_filter, &card);
+			if (found && strlen(card.card)) {
+				igt_debug("Found gpu %d with %s\n", i, card.card);
+				++gpu_count;
+			} else {
+				igt_debug("Counted GPUs number: %d\n", gpu_count);
+				break;
+			}
+		}
+	} else {
+		int count = 0;
+
+		for (int i = 0; i < gpu_count; i++) {
+			const char *filter;
+
+			filter = igt_device_filter_get(i);
+			memset(&card, 0, sizeof(card));
+			found = igt_device_card_match(filter, &card);
+			if (found && strlen(card.card)) {
+				igt_debug("Found gpu %d with %s\n", i, card.card);
+				++count;
+			} else {
+				break;
+			}
+		}
+
+		if (count < gpu_count)
+			igt_debug("Counted GPUs %d lower than number of filters %d\n", count, gpu_count);
+
+		gpu_count = count;
+	}
+
+	return gpu_count;
+}
+
 void igt_require_amdgpu(int fd)
 {
 	igt_require(is_amdgpu_device(fd));
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 97ab6e759..7db2292cb 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -109,6 +109,8 @@ int drm_close_driver(int fd);
 
 int drm_reopen_driver(int fd);
 
+int drm_get_gpu_count(int chipset);
+
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
 void igt_require_i915(int fd);
-- 
2.42.0
