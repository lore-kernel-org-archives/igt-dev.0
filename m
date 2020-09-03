Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370046E9A7
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2020 11:04:56 +0000 (UTC)
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Date: Thu,  3 Sep 2020 16:31:09 +0530
Message-Id: <20200903110110.2403699-2-ayaz.siddiqui@intel.com>
In-Reply-To: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
References: <20200903110110.2403699-1-ayaz.siddiqui@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_device_scan: Fix device
 selection filter
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
Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

DRM subsystem filter in intel_gpu_top was not working due to missing
PCI_SLOT_NAME property. Using the parent device in case of drm subsystem
leads to fix this issue.

Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
---
 lib/igt_device_scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 345bae76d..3583c69c7 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1263,7 +1263,7 @@ bool igt_device_card_match(const char *filter, struct igt_device_card *card)
 	/* We take first one if more than one card matches filter */
 	dev = igt_list_first_entry(&igt_devs.filtered, dev, link);
 
-	__copy_dev_to_card(dev, card);
+	__copy_dev_to_card(is_pci_subsystem(dev) ? dev : dev->parent, card);
 
 	return true;
 }
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
