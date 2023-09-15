Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D454C10E65E
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 17:34:52 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 19:34:39 +0200
Message-ID: <20230915173439.49405-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/drmtest: allow out of order device
 opening
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

Allow to open cards with filters out of order, not in
the sequence 0...N. This will fix problem found out with test
gem_exec_gttfill@multigpu-basic with three discrete GPUs:

Opened device: /dev/dri/card1
Starting subtest: multigpu-basic
<g:1> Opened device: /dev/dri/card2
gem_exec_gttfill: ../lib/drmtest.c:313: _is_already_opened: Assertion `as_idx <= _opened_fds_count' failed.

Added also some debug prints for diagnosing problems with
multi-GPU tests.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c87..e9dfc070d 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -296,7 +296,11 @@ static int _opened_fds_count;
 static void _set_opened_fd(int idx, int fd)
 {
 	assert(idx < ARRAY_SIZE(_opened_fds));
-	assert(idx <= _opened_fds_count);
+
+	if (idx >= _opened_fds_count) {
+		for (int i = _opened_fds_count; i < idx; ++i)
+			_opened_fds[i].fd = -1;
+	}
 
 	_opened_fds[idx].fd = fd;
 
@@ -310,16 +314,23 @@ static bool _is_already_opened(const char *path, int as_idx)
 	struct stat new;
 
 	assert(as_idx < ARRAY_SIZE(_opened_fds));
-	assert(as_idx <= _opened_fds_count);
 
 	/*
 	 * we cannot even stat the device, so it's of no use - let's claim it's
 	 * already opened
 	 */
-	if (igt_debug_on(stat(path, &new) != 0))
+	if (igt_debug_on(stat(path, &new) != 0)) {
+		igt_debug("cannot stat device: %s\n", path);
 		return true;
+	}
+
+	if (as_idx >= _opened_fds_count)
+		return false;
 
 	for (int i = 0; i < as_idx; ++i) {
+		if (_opened_fds[i].fd == -1)
+			continue;
+
 		/* did we cross filesystem boundary? */
 		assert(_opened_fds[i].stat.st_dev == new.st_dev);
 
@@ -484,6 +495,7 @@ int __drm_open_driver_another(int idx, int chipset)
 {
 	int fd = -1;
 
+	igt_debug("card idx: %d chipset: %d\n", idx, chipset);
 	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
 		struct igt_device_card card;
 		bool found;
@@ -491,6 +503,7 @@ int __drm_open_driver_another(int idx, int chipset)
 		found = __get_card_for_nth_filter(idx, &card);
 
 		if (!found) {
+			igt_debug("cannot find card idx: %d, loading module\n", idx);
 			drm_load_module(chipset);
 			found = __get_card_for_nth_filter(idx, &card);
 		}
@@ -500,11 +513,14 @@ int __drm_open_driver_another(int idx, int chipset)
 				 igt_device_filter_get(idx));
 		else if (_is_already_opened(card.card, idx))
 			igt_warn("card maching filter %d is already opened\n", idx);
-		else
+		else {
+			igt_debug("card idx: %d found: %s\n", idx, card.card);
 			fd = __open_driver_exact(card.card, chipset);
+		}
 
 	} else {
 		/* no filter for device idx, let's open whatever is available */
+		igt_debug("No filter for device idx: %d\n", idx);
 		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
 	}
 
-- 
2.42.0
