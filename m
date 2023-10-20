Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213D010E5B7
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:00:45 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:00:11 +0200
Message-ID: <20231020130016.86398-4-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
References: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 3/8] lib/drmtest: drop checks for opened
 device for filters
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

When using filters honor user choice and don't restrict opens
to non-opened devices. This will allow a user to test some
multiGPU tests with repeated filter for card zero:

--device=pci:vendor=Intel,device=discrete,card=0\;pci:vendor=Intel,device=discrete,card=0

If the user want it just allow this. Also while at this, move
debug print into filter loop as there is already one for
non-filter and add debug print before open.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/drmtest.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index baff82b25..7c2fd7c56 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -452,8 +452,8 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
  *   * device scanning is executed,
  *   * idx-th filter (starting with 0, filters are semicolon separated) is used
  *   * if there is no idx-th filter, goto 2
- *   * first device maching the filter is selected
- *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
+ *   * device maching the requested filter is selected
+ *   * if it's not matched we fail with -1
  *   * otherwise open the device and return the fd
  *
  * 2. compatibility mode - open the first DRM device we can find that is not
@@ -495,11 +495,11 @@ int __drm_open_driver_another(int idx, int chipset)
 {
 	int fd = -1;
 
-	igt_debug("card idx: %d chipset: %d\n", idx, chipset);
 	if (chipset != DRIVER_VGEM && igt_device_filter_count() > idx) {
 		struct igt_device_card card;
 		bool found;
 
+		igt_debug("card idx: %d chipset: %d\n", idx, chipset);
 		found = __get_card_for_nth_filter(idx, &card);
 
 		if (!found) {
@@ -508,16 +508,14 @@ int __drm_open_driver_another(int idx, int chipset)
 			found = __get_card_for_nth_filter(idx, &card);
 		}
 
-		if (!found || !strlen(card.card))
-			igt_warn("No card matches the filter! [%s]\n",
-				 igt_device_filter_get(idx));
-		else if (_is_already_opened(card.card, idx))
-			igt_warn("card maching filter %d is already opened\n", idx);
-		else {
-			igt_debug("card idx: %d found: %s\n", idx, card.card);
+		if (!found || !strlen(card.card)) {
+			igt_warn("No card matches the filter! [%s]%s\n",
+				 igt_device_filter_get(idx),
+				 found && !strlen(card.card) ? " (card empty)" : "");
+		} else {
+			igt_debug("card %d found: [%s]\n", idx, card.card);
 			fd = __open_driver_exact(card.card, chipset);
 		}
-
 	} else {
 		/* no filter for device idx, let's open whatever is available */
 		igt_debug("No filter for device idx: %d\n", idx);
-- 
2.42.0
