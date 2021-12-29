Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B18810EB22
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Dec 2021 11:48:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 29 Dec 2021 12:48:05 +0100
Message-Id: <20211229114806.24218-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211229114806.24218-1-zbigniew.kempczynski@intel.com>
References: <20211229114806.24218-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_bufops: Add fixed mapping for
 reading ccs data
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On discrete gem_mmap_offset__fixed() function must be used to map
local memory. Add this case for copying of ccs data and fix
all *ccs* subtests in gem_render_copy test.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/intel_bufops.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index f13063fa9..72d729b63 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -399,11 +399,17 @@ static void __copy_ccs(struct buf_ops *bops, struct intel_buf *buf,
 	ccs_size = CCS_SIZE(gen, buf);
 	size = offset + ccs_size;
 
-	map = __gem_mmap_offset__wc(bops->fd, buf->handle, 0, size,
-				    PROT_READ | PROT_WRITE);
+	if (gem_has_lmem(bops->fd)) {
+		map = gem_mmap_offset__fixed(bops->fd, buf->handle, 0, size,
+					     PROT_READ | PROT_WRITE);
+	}
 	if (!map)
-		map = gem_mmap__wc(bops->fd, buf->handle, 0, size,
-				   PROT_READ | PROT_WRITE);
+		map = __gem_mmap_offset__wc(bops->fd, buf->handle, 0, size,
+					    PROT_READ | PROT_WRITE);
+	if (!map)
+		map = __gem_mmap__wc(bops->fd, buf->handle, 0, size,
+				     PROT_READ | PROT_WRITE);
+
 
 	switch (dir) {
 	case CCS_LINEAR_TO_BUF:
-- 
2.32.0
