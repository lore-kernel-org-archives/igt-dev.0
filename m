Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3028C10E399
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 16:50:23 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 18:49:40 +0200
Message-ID: <20231004164946.138398-5-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231004164946.138398-1-kamil.konieczny@linux.intel.com>
References: <20231004164946.138398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 4/6] lib/drmtest: save skip offset for
 first opened device
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

On some boards with many discrete GPU cards it may happen that
on-board one is integrated and will be skipped during opening
a first device. With out-of-order try and open it may result
with off-by-one error opening wrong card. Fixed this with saving
skip offset for first device name.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index dbfa0282d..5e559737e 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -292,6 +292,8 @@ static struct {
 }_opened_fds[64];
 
 static int _opened_fds_count;
+static int _opened_fds0_skip;
+static int _opened_fds0_chipset;
 
 static void _set_opened_fd(int idx, int fd)
 {
@@ -350,7 +352,11 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 	if (forced)
 		igt_debug("Force option used: Using driver %s\n", forced);
 
-	offset += as_idx;
+	if (offset == 0 && as_idx != 0 && _opened_fds0_chipset == chipset)
+		offset += as_idx + _opened_fds0_skip;
+	else
+		offset += as_idx;
+
 	for (int i = 0; i < 16; i++) {
 		char name[80];
 		int fd;
@@ -361,8 +367,15 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 			continue;
 
 		fd = open_device(name, chipset);
-		if (fd != -1)
+		if (fd != -1) {
+			if (i != 0 && offset == as_idx && as_idx == 0
+			    && chipset != DRIVER_VGEM && chipset != DRIVER_ANY) {
+				_opened_fds0_skip = i;
+				_opened_fds0_chipset = chipset;
+			}
+
 			return fd;
+		}
 	}
 
 	return -1;
-- 
2.42.0
