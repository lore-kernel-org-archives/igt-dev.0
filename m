Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BF910EA1A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 16:02:01 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 17:01:46 +0100
Message-ID: <20231103160148.94811-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
References: <20231103160148.94811-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] lib/drmtest: add multi-GPU helpers
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

Created multiGPU helpers for filtering and opening GPU cards.
Opening card depend only on index as chipset was given during
filtering.

v2: simplify filtering as it moved to igt_device_scan (Zbigniew)
  simplify also opening, add new function chipset_to_vendor_str,
  removed clearing opened devices as it is not essential (Kamil)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/drmtest.h |  3 +++
 2 files changed, 52 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c87..5c19fd21d 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -627,6 +627,11 @@ static const char *chipset_to_str(int chipset)
 	}
 }
 
+static const char *chipset_to_vendor_str(int chipset)
+{
+	return chipset == DRIVER_XE ? chipset_to_str(DRIVER_INTEL) : chipset_to_str(chipset);
+}
+
 /**
  * drm_open_driver:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
@@ -777,6 +782,50 @@ int drm_reopen_driver(int fd)
 	return fd;
 }
 
+int drm_prepare_filtered_multigpu(int chipset)
+{
+	const char *vendor = chipset_to_vendor_str(chipset);
+
+	return igt_device_prepare_filtered_view(vendor);
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
+	int fd = -1;
+
+	if (idx < 0 || idx >= igt_device_filter_count()) {
+		igt_debug("Invalid filter index %d\n", idx);
+		return -1;
+	}
+
+	filter = igt_device_filter_get(idx);
+	if (igt_device_card_match(filter, &card))
+		fd = igt_open_card(&card);
+
+	if (fd >= 0) {
+		igt_debug("Opened GPU%d card: %s\n", idx, card.card);
+		log_opened_device_path(card.card);
+		/* Cache xe_device struct. */
+		if (is_xe_device(fd))
+			xe_device_get(fd);
+	} else {
+		igt_debug("Opening GPU%d failed, card: %s\n", idx, card.card);
+	}
+
+	return fd;
+}
+
 void igt_require_amdgpu(int fd)
 {
 	igt_require(is_amdgpu_device(fd));
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 97ab6e759..909a0c12c 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -109,6 +109,9 @@ int drm_close_driver(int fd);
 
 int drm_reopen_driver(int fd);
 
+int drm_prepare_filtered_multigpu(int chipset);
+int drm_open_filtered_card(int idx);
+
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
 void igt_require_i915(int fd);
-- 
2.42.0
