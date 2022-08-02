Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2362711252F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 10:23:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  2 Aug 2022 12:22:57 +0200
Message-Id: <20220802102257.28945-1-zbigniew.kempczynski@intel.com>
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
set  __get_card_for_nth_filter() is logging warning each call so we
have confusing duplicates if function is called few times. Lets remove
warning from it and migrate logging resposibility to the caller.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6498

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
v2: remove igt_warn() from __get_card_for_nth_filter()
---
 lib/drmtest.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4f9d8a11cb..16e80bdfcf 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -365,8 +365,6 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
 			igt_debug("Filter matched %s | %s\n", card->card, card->render);
 			return true;
 		}
-
-		igt_warn("No card matches the filter!\n");
 	}
 
 	return false;
@@ -442,7 +440,8 @@ int __drm_open_driver_another(int idx, int chipset)
 		}
 
 		if (!found || !strlen(card.card))
-			igt_warn("No card matches the filter!\n");
+			igt_warn("No card matches the filter! [%s]\n",
+				 igt_device_filter_get(idx));
 		else if (_is_already_opened(card.card, idx))
 			igt_warn("card maching filter %d is already opened\n", idx);
 		else
-- 
2.34.1
