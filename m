Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82076E529
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 13:39:58 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 13 Nov 2020 13:39:50 +0000
Message-Id: <20201113133951.1231761-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Quieten device filtering
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

We don't need to print out the filter the umpteen thousand times we try
and open the same device; it floods the test output with noise.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/drmtest.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 49e294bde..3a8bd8591 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -264,7 +264,7 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 
 	forced = forced_driver();
 	if (forced)
-		igt_info("Force option used: Using driver %s\n", forced);
+		igt_debug("Force option used: Using driver %s\n", forced);
 
 	for (int i = 0; i < 16; i++) {
 		char name[80];
@@ -342,10 +342,10 @@ static bool __get_card_for_nth_filter(int idx, struct igt_device_card *card)
 
 	if (igt_device_filter_count() > idx) {
 		filter = igt_device_filter_get(idx);
-		igt_info("Looking for devices to open using filter %d: %s\n", idx, filter);
+		igt_debug("Looking for devices to open using filter %d: %s\n", idx, filter);
 
 		if (igt_device_card_match(filter, card)) {
-			igt_info("Filter matched %s | %s\n", card->card, card->render);
+			igt_debug("Filter matched %s | %s\n", card->card, card->render);
 			return true;
 		}
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
