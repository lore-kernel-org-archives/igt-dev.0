Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01B210E0D6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Sep 2023 16:23:36 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Sep 2023 18:19:12 +0200
Message-ID: <20230920161913.54521-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230920161913.54521-1-kamil.konieczny@linux.intel.com>
References: <20230920161913.54521-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/drmtest: add multigpu helpers
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

Create helpers for multigpu tests so they may use not only cards
but also renders.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++---
 lib/drmtest.h |  4 +++
 2 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 926f388ee..72fa22ee9 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -293,6 +293,10 @@ static struct {
 
 static int _opened_fds_count;
 
+static struct igt_device_card _multigpu_cards[64];
+static int _multigpu_count;
+static bool _multigpu_use_render;
+
 static void _set_opened_fd(int idx, int fd)
 {
 	assert(idx < ARRAY_SIZE(_opened_fds));
@@ -499,6 +503,7 @@ int __drm_open_driver_another(int idx, int chipset)
 	igt_debug("card idx: %d chipset: %d\n", idx, chipset);
 	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
 		struct igt_device_card card;
+		char *name;
 		bool found;
 
 		found = __get_card_for_nth_filter(idx, &card);
@@ -509,14 +514,15 @@ int __drm_open_driver_another(int idx, int chipset)
 			found = __get_card_for_nth_filter(idx, &card);
 		}
 
-		if (!found || !strlen(card.card))
+		name = _multigpu_use_render ? card.render : card.card;
+		if (!found || !strlen(name))
 			igt_warn("No card matches the filter! [%s]\n",
 				 igt_device_filter_get(idx));
-		else if (_is_already_opened(card.card, idx))
+		else if (_is_already_opened(name, idx))
 			igt_warn("card maching filter %d is already opened\n", idx);
 		else {
-			igt_debug("card idx: %d found: %s\n", idx, card.card);
-			fd = __open_driver_exact(card.card, chipset);
+			igt_debug("card idx: %d found: %s\n", idx, name);
+			fd = __open_driver_exact(name, chipset);
 		}
 
 	} else {
@@ -794,6 +800,86 @@ int drm_reopen_driver(int fd)
 	return fd;
 }
 
+static int __drm_multigpu_prepare(int chipset)
+{
+	int gpu_count;
+
+	if (_multigpu_count)
+		return _multigpu_count < 0 ? 0 : _multigpu_count; /* already prepared */
+
+	memset(&_multigpu_cards[0], 0, sizeof(_multigpu_cards));
+
+	gpu_count = igt_device_filter_count();
+	for (int i = 0; i < gpu_count; i++) {
+		struct igt_device_card *newcard;
+		const char *filter;
+
+		newcard = &_multigpu_cards[i];
+		filter = igt_device_filter_get(i);
+		if (strlen(filter) > 0 && igt_device_card_match(filter, newcard)) {
+			igt_debug("Filter matched %s | %s\n", newcard->card, newcard->render);
+			++_multigpu_count;
+		}
+	}
+
+	if (_multigpu_count < 2) {
+		igt_debug("Multigpu prepare failed, no multi-gpu board or no --device nor IGT_DEVICE used\n");
+		_multigpu_count = -1; /* do not count 1 as multigpu */
+
+		/* check if we may find intel discrete cards with filters */
+		if (chipset & (DRIVER_INTEL | DRIVER_XE)) {
+			struct igt_device_card gpucard;
+			char filter[128];
+
+			for (int i = 0; i < 16; i++) {
+				snprintf(filter, sizeof(filter), "pci:vendor=Intel,device=discrete,card=%d", i);
+				if (igt_device_card_match(filter, &gpucard))
+					igt_debug("Found card: %s\n", gpucard.card);
+			}
+		}
+	}
+
+	return _multigpu_count;
+}
+/**
+ * drm_multigpu_prepare_cards:
+ * @chipset: flag for chipset to use in multigpu opens
+ *
+ * Prepares __drm_open_drivers_another to use card.card at opens.
+ * Returns: number of cards found by filter given by --device or IGT_DEVICE
+ */
+int drm_multigpu_prepare_cards(int chipset)
+{
+	_multigpu_use_render = false;
+
+	return __drm_multigpu_prepare(chipset);
+}
+
+/**
+ * drm_multigpu_prepare_renders:
+ * @chipset: flag for chipset to use in multigpu opens
+ *
+ * Prepares __drm_open_drivers_another to use card.render at opens.
+ * Returns: number of cards found by filter given by --device or IGT_DEVICE
+ */
+int drm_multigpu_prepare_renders(int chipset)
+{
+	_multigpu_use_render = true;
+
+	return __drm_multigpu_prepare(chipset);
+}
+
+/**
+ * drm_get_multigpu_count:
+ *
+ * Returns: number of cards found by drm_multigpu_prepare_cards or
+ * drm_multigpu_prepare_renders
+ */
+int drm_get_multigpu_count(void)
+{
+	return _multigpu_count;
+}
+
 void igt_require_amdgpu(int fd)
 {
 	igt_require(is_amdgpu_device(fd));
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 97ab6e759..2fab50a36 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -109,6 +109,10 @@ int drm_close_driver(int fd);
 
 int drm_reopen_driver(int fd);
 
+int drm_multigpu_prepare_cards(int chipset);
+int drm_multigpu_prepare_renders(int chipset);
+int drm_get_multigpu_count(void);
+
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
 void igt_require_i915(int fd);
-- 
2.42.0
