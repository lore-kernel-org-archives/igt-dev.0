Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7ED8EA42
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 09:28:02 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  2 Aug 2022 11:27:56 +0200
Message-Id: <20220802092756.26693-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/drmtest: Don't log a warning when drm
 driver is not loaded
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Some drivers left machine with drm driver unloaded. When IGT_DEVICE is
set first call to __get_card_for_nth_filter() won't find the drm device
and outputs a warning.  Lets avoid logging a warning when we're not sure
drm driver is loaded.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6498

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/drmtest.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4f9d8a11cb..58d2f7f998 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -348,12 +348,15 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
  *
  * @card: pointer to the igt_device_card structure to be filled
  * when a card is found.
+ * @do_warn: write out a warning when filter cannot match the device. Used for
+ * case when drm module is not loaded but filter (IGT_DEVICE) is set.
  *
  * Returns:
  * True if card according to the added filter was found,
  * false othwerwise.
  */
-static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
+static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card,
+				      bool do_warn)
 {
 	const char *filter;
 
@@ -366,7 +369,8 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
 			return true;
 		}
 
-		igt_warn("No card matches the filter!\n");
+		if (do_warn)
+			igt_warn("No card matches the filter!\n");
 	}
 
 	return false;
@@ -434,11 +438,11 @@ int __drm_open_driver_another(int idx, int chipset)
 		struct igt_device_card card;
 		bool found;
 
-		found = __get_card_for_nth_filter(idx, &card);
+		found = __get_card_for_nth_filter(idx, &card, false);
 
 		if (!found) {
 			drm_load_module(chipset);
-			found = __get_card_for_nth_filter(idx, &card);
+			found = __get_card_for_nth_filter(idx, &card, true);
 		}
 
 		if (!found || !strlen(card.card))
@@ -483,7 +487,7 @@ int __drm_open_driver_render(int chipset)
 		struct igt_device_card card;
 		bool found;
 
-		found = __get_card_for_nth_filter(0, &card);
+		found = __get_card_for_nth_filter(0, &card, true);
 
 		if (!found || !strlen(card.render))
 			return -1;
-- 
2.34.1
