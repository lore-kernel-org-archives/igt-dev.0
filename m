Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A0B10E5A9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:01:11 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:00:12 +0200
Message-ID: <20231020130016.86398-5-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
References: <20231020130016.86398-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 4/8] lib/drmtest: save skip offset for
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
index 7c2fd7c56..89d045200 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -292,6 +292,8 @@ static struct {
 }_opened_fds[64];
 
 static int _opened_fds_count;
+static int _opened_fds0_skip;
+static int _opened_fds0_chipset;
 
 static void _set_opened_fd(int idx, int fd)
 {
@@ -348,7 +350,11 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
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
@@ -359,8 +365,15 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
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
