Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed, 28 Jul 2021 11:30:37 +0100
Message-Id: <20210728103041.1669985-7-matthew.auld@intel.com>
In-Reply-To: <20210728103041.1669985-1-matthew.auld@intel.com>
References: <20210728103041.1669985-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 07/11] lib/intel_bufops: update
 mmap_{read, write} for discrete
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On discrete we can no longer call get_caching or set_domain, and the
mmap mode must be FIXED.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/intel_bufops.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 3ce68663..faca4406 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -424,7 +424,18 @@ static void *mmap_write(int fd, struct intel_buf *buf)
 {
 	void *map = NULL;
 
-	if (is_cache_coherent(fd, buf->handle)) {
+	if (gem_has_lmem(fd)) {
+		/*
+		 * set/get_caching and set_domain are no longer supported on
+		 * discrete, also the only mmap mode supportd is FIXED.
+		 */
+		map = gem_mmap_offset__fixed(fd, buf->handle, 0,
+					     buf->surface[0].size,
+					     PROT_READ | PROT_WRITE);
+		igt_assert_eq(gem_wait(fd, buf->handle, 0), 0);
+	}
+
+	if (!map && is_cache_coherent(fd, buf->handle)) {
 		map = __gem_mmap_offset__cpu(fd, buf->handle, 0, buf->surface[0].size,
 					     PROT_READ | PROT_WRITE);
 		if (!map)
@@ -455,7 +466,17 @@ static void *mmap_read(int fd, struct intel_buf *buf)
 {
 	void *map = NULL;
 
-	if (gem_has_llc(fd) || is_cache_coherent(fd, buf->handle)) {
+	if (gem_has_lmem(fd)) {
+		/*
+		 * set/get_caching and set_domain are no longer supported on
+		 * discrete, also the only supported mmap mode is FIXED.
+		 */
+		map = gem_mmap_offset__fixed(fd, buf->handle, 0,
+					     buf->surface[0].size, PROT_READ);
+		igt_assert_eq(gem_wait(fd, buf->handle, 0), 0);
+	}
+
+	if (!map && (gem_has_llc(fd) || is_cache_coherent(fd, buf->handle))) {
 		map = __gem_mmap_offset__cpu(fd, buf->handle, 0,
 					     buf->surface[0].size, PROT_READ);
 		if (!map)
-- 
2.26.3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
