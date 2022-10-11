Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB60710E55C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 05:34:51 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Oct 2022 11:04:18 +0530
Message-Id: <20221011053418.1684877-2-riana.tauro@intel.com>
In-Reply-To: <20221011053418.1684877-1-riana.tauro@intel.com>
References: <20221011053418.1684877-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/1] lib/igt_device_scan: clear
 igt_devs.devs_scanned in igt_devices_free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

1) igt_devices_scan returns with empty list if devs_scanned
   is true and function is called after igt_devices_free
   clear igt_devs.devs_scanned in igt_devices_free.

2) remove redudant code from igt_devices_scan and replace it with
   igt_devices_free

v2: optimize code in igt_devices_scan (Zbigniew)
v3: update commit message (Janusz)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_device_scan.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index eb6b45b8..8b70e375 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1027,9 +1027,11 @@ void igt_devices_free(void)
 	}
 
 	igt_list_for_each_entry_safe(dev, tmp, &igt_devs.all, link) {
+		igt_list_del(&dev->link);
 		igt_device_free(dev);
 		free(dev);
 	}
+	igt_devs.devs_scanned = false;
 }
 
 /**
@@ -1043,22 +1045,8 @@ void igt_devices_free(void)
  */
 void igt_devices_scan(bool force)
 {
-	if (force && igt_devs.devs_scanned) {
-		struct igt_device *dev, *tmp;
-
-		igt_list_for_each_entry_safe(dev, tmp, &igt_devs.filtered,
-					     link) {
-			igt_list_del(&dev->link);
-			free(dev);
-		}
-		igt_list_for_each_entry_safe(dev, tmp, &igt_devs.all, link) {
-			igt_list_del(&dev->link);
-			igt_device_free(dev);
-			free(dev);
-		}
-
-		igt_devs.devs_scanned = false;
-	}
+	if (force && igt_devs.devs_scanned)
+		igt_devices_free();
 
 	if (igt_devs.devs_scanned)
 		return;
-- 
2.25.1
