Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C17F14A476
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Jul 2022 05:12:10 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 19 Jul 2022 07:11:43 +0200
Message-Id: <20220719051144.7438-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220719051144.7438-1-zbigniew.kempczynski@intel.com>
References: <20220719051144.7438-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 4/5] lib/igt_device_scan: Align
 microseconds to six leading zeros
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

Previous format was not correct when DBG() was in use leading to
not properly aligned output.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 0ff49f96b7..23056894f1 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -34,6 +34,7 @@
 #include <libudev.h>
 #include <linux/limits.h>
 #include <sys/stat.h>
+#include <sys/time.h>
 #include <sys/types.h>
 
 /**
@@ -170,7 +171,7 @@
 { \
 	struct timeval tm; \
 	gettimeofday(&tm, NULL); \
-	printf("%10ld.%03ld: ", tm.tv_sec, tm.tv_usec); \
+	printf("%10ld.%06ld: ", tm.tv_sec, tm.tv_usec); \
 	printf(__VA_ARGS__); \
 }
 
-- 
2.34.1
