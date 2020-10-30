Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946246EDA2
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2020 11:37:05 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 30 Oct 2020 11:36:52 +0000
Message-Id: <20201030113653.3605117-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Export drm_load_module()
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Beneath drm_open_driver() we have a routine that tries to load a module
appropriate for the selected chipset. This can be useful for tests that
want to ensure the right module is loaded prior to starting, without
opening the device itself.

Suggested-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/drmtest.c | 8 ++++----
 lib/drmtest.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 447f54353..49e294bde 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -283,7 +283,7 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 	return -1;
 }
 
-static void __try_modprobe(unsigned int chipset)
+void drm_load_module(unsigned int chipset)
 {
 	static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
 
@@ -307,7 +307,7 @@ static int __open_driver(const char *base, int offset, unsigned int chipset, int
 	if (fd != -1)
 		return fd;
 
-	__try_modprobe(chipset);
+	drm_load_module(chipset);
 
 	return __search_and_open(base, offset, chipset, as_idx);
 }
@@ -320,7 +320,7 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
 	if (fd != -1)
 		return fd;
 
-	__try_modprobe(chipset);
+	drm_load_module(chipset);
 
 	return open_device(name, chipset);
 }
@@ -419,7 +419,7 @@ int __drm_open_driver_another(int idx, int chipset)
 		found = __get_card_for_nth_filter(idx, &card);
 
 		if (!found) {
-			__try_modprobe(chipset);
+			drm_load_module(chipset);
 			found = __get_card_for_nth_filter(idx, &card);
 		}
 
diff --git a/lib/drmtest.h b/lib/drmtest.h
index dd4cd3848..d393dbf15 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -87,6 +87,7 @@ void __set_forced_driver(const char *name);
  */
 #define ALIGN_DOWN(x, a)	ALIGN((x) - ((a) - 1), (a))
 
+void drm_load_module(unsigned int chipset);
 int drm_open_driver(int chipset);
 int drm_open_driver_master(int chipset);
 int drm_open_driver_render(int chipset);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
