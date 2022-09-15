Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B06B10E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 13:58:08 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Sep 2022 19:27:39 +0530
Message-Id: <20220915135739.3542117-2-riana.tauro@intel.com>
In-Reply-To: <20220915135739.3542117-1-riana.tauro@intel.com>
References: <20220915135739.3542117-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] lib/igt_device_scan: clear
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

igt_devices_scan returns with empty list if devs_scanned
is true and function is called after igt_devices_free

clear igt_devs.devs_scanned in igt_devices_free.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_device_scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index eb6b45b8..e7c05d5c 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1030,6 +1030,7 @@ void igt_devices_free(void)
 		igt_device_free(dev);
 		free(dev);
 	}
+	igt_devs.devs_scanned = false;
 }
 
 /**
-- 
2.25.1
