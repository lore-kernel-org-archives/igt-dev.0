Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B00B10E874
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 12:10:54 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 13:10:36 +0100
Message-ID: <20231102121044.58786-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231102121044.58786-1-kamil.konieczny@linux.intel.com>
References: <20231102121044.58786-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 1/4] lib/drmtest: add multi-GPU helpers
 for filtered devices
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

Created multiGPU helpers for filtering GPU cards.  When no
filters used with --device or IGT_DEVICE, this will add new
filters for discrete GPUs, otherwise will count them using user
supplied ones.
  Opening filtered card will allow to re-open already exiting
one, if user gives something like:

IGT_DEVICE=pci:vendor=intel,device=discrete,card=0\;pci:vendor=intel,device=discrete,card=0

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/drmtest.h |   3 ++
 2 files changed, 105 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c87..4425d4ca9 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -777,6 +777,108 @@ int drm_reopen_driver(int fd)
 	return fd;
 }
 
+/**
+ * drm_get_filtered_gpu_count:
+ * @chipset: flag for one chipset to search, eg. #DRIVER_INTEL
+ *
+ * Get number of GPUs for given chipset. If used --device option or IGT_DEVICE
+ * environment variable, perform countig based on supplied filters.
+ *
+ * Returns:
+ * Number of GPUs for given chipset or filters.
+ */
+int drm_get_filtered_gpu_count(int chipset)
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
+		igt_assert(snprintf(gpu_filter, sizeof(gpu_filter),
+				    "pci:vendor=%s,device=discrete,card=all",
+				    v) < sizeof(gpu_filter));
+
+		igt_device_filter_add(gpu_filter);
+		gpu_count = igt_device_filter_count();
+	} else {
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
+		}
+	}
+
+	igt_debug("Found %d GPUs for chipset: %d\n", gpu_count, chipset);
+
+	return gpu_count;
+}
+
+/**
+ * drm_open_filtered_card:
+ * @idx: index for GPU to open
+ *
+ * Open N-th GPU from filtered list
+ *
+ * Returns:
+ * Opened device or -1 if error.
+ */
+int drm_open_filtered_card(int idx)
+{
+	struct igt_device_card card;
+	const char *filter;
+	bool found;
+	int fd = -1;
+
+	if (idx < 0 || idx >= igt_device_filter_count()) {
+		igt_debug("Invalid filter index %d\n", idx);
+		return -1;
+	}
+
+	filter = igt_device_filter_get(idx);
+	found = igt_device_card_match(filter, &card);
+
+	if (found && strlen(card.card)) {
+		fd = open(card.card, O_RDWR);
+		igt_debug("Opened fd: %d filter idx: %d card: %s\n", fd, idx, card.card);
+	} else {
+		igt_debug("%s for GPU%d with filter: %s\n", found ? "Empty card name" : "Card not found", idx, filter);
+	}
+
+	if (fd >= 0) {
+		log_opened_device_path(card.card);
+		/* Cache xe_device struct. */
+		if (is_xe_device(fd))
+			xe_device_get(fd);
+	}
+
+	return fd;
+}
+
 void igt_require_amdgpu(int fd)
 {
 	igt_require(is_amdgpu_device(fd));
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 97ab6e759..992ada194 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -109,6 +109,9 @@ int drm_close_driver(int fd);
 
 int drm_reopen_driver(int fd);
 
+int drm_get_filtered_gpu_count(int chipset);
+int drm_open_filtered_card(int idx);
+
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
 void igt_require_i915(int fd);
-- 
2.42.0
