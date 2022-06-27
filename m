Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Jun 2022 17:10:04 +0100
Message-Id: <20220627161004.70153-3-matthew.auld@intel.com>
In-Reply-To: <20220627161004.70153-1-matthew.auld@intel.com>
References: <20220627161004.70153-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915: adapt __copy_ccs for
 discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We can't explicitly control the mmap caching type for discrete, but
using mmap_device_coherent should be good enough here on such devices.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/4842
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 lib/intel_bufops.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 05c0b0d4..c63a5760 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -451,11 +451,16 @@ static void __copy_ccs(struct buf_ops *bops, struct intel_buf *buf,
 	ccs_size = CCS_SIZE(gen, buf);
 	size = offset + ccs_size;
 
-	map = __gem_mmap_offset__wc(bops->fd, buf->handle, 0, size,
-				    PROT_READ | PROT_WRITE);
-	if (!map)
-		map = gem_mmap__wc(bops->fd, buf->handle, 0, size,
-				   PROT_READ | PROT_WRITE);
+	if (gem_has_lmem(bops->fd)) {
+		map = gem_mmap__device_coherent(bops->fd, buf->handle, 0, size,
+						PROT_READ | PROT_WRITE);
+	} else {
+		map = __gem_mmap_offset__wc(bops->fd, buf->handle, 0, size,
+					    PROT_READ | PROT_WRITE);
+		if (!map)
+			map = gem_mmap__wc(bops->fd, buf->handle, 0, size,
+					   PROT_READ | PROT_WRITE);
+	}
 
 	switch (dir) {
 	case CCS_LINEAR_TO_BUF:
-- 
2.36.1
