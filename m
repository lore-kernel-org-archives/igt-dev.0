Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B4610E3F6
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 05:47:50 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:22:59 +0530
Message-Id: <20230817055301.855960-2-riana.tauro@intel.com>
In-Reply-To: <20230817055301.855960-1-riana.tauro@intel.com>
References: <20230817055301.855960-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_power: Modify igt_power library
 for xe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

modify igt_pm library for xe tests. To check if a
device is dgfx the igt_power open call needs to be modified for
xe.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_power.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_power.c b/lib/igt_power.c
index 3b34be406..439d49fc3 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -12,6 +12,7 @@
 #include "igt_power.h"
 #include "igt_sysfs.h"
 
+#include "xe/xe_query.h"
 static const char *rapl_domains[] = { "cpu", "gpu", "pkg", "ram" };
 
 static int rapl_parse(struct rapl *r, const char *str)
@@ -99,11 +100,13 @@ static inline void rapl_close(struct rapl *r)
 int igt_power_open(int fd, struct igt_power *p, const char *domain)
 {
 	int i;
+	bool is_dgfx;
 
 	p->hwmon_fd = -1;
 	p->rapl.fd = -1;
 
-	if (gem_has_lmem(fd)) {
+	is_dgfx = is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd);
+	if (is_dgfx) {
 		if (strncmp(domain, "gpu", strlen("gpu")) == 0) {
 			p->hwmon_fd = igt_hwmon_open(fd);
 			if (p->hwmon_fd >= 0)
-- 
2.40.0
