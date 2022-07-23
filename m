Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53762A951A
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Jul 2022 19:12:16 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 23 Jul 2022 12:12:55 -0700
Message-Id: <20220723191255.2700675-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Force rescan when module is loaded
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Whenever we load a drm module we need to force a rescan of igt devices
so we update the list. Otherwise any place trying to open the device and
then falling back to loading the driver and loading it, will not have a
proper fallback.  Currently this makes igt@i915_pm_rpm@module-reload
to skip on DG2 as the previous test makes igt@i915_pm_rpm to cause a
module reload.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/drmtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 09a9a229..4f9d8a11 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -313,6 +313,7 @@ void drm_load_module(unsigned int chipset)
 		}
 	}
 	pthread_mutex_unlock(&mutex);
+	igt_devices_scan(true);
 }
 
 static int __open_driver(const char *base, int offset, unsigned int chipset, int as_idx)
-- 
2.37.1
