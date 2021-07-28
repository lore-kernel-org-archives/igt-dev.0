Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed, 28 Jul 2021 11:30:36 +0100
Message-Id: <20210728103041.1669985-6-matthew.auld@intel.com>
In-Reply-To: <20210728103041.1669985-1-matthew.auld@intel.com>
References: <20210728103041.1669985-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 06/11] lib/ioctl_wrappers: update
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

We can no longer just call get_caching or set_domain, and the mmap mode
must be FIXED. This should bring back gem_exec_basic and a few others in
CI on DG1.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/ioctl_wrappers.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 25c5e495..7e27a1b3 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -339,7 +339,18 @@ static void mmap_write(int fd, uint32_t handle, uint64_t offset,
 	if (!length)
 		return;
 
-	if (is_cache_coherent(fd, handle)) {
+	if (gem_has_lmem(fd)) {
+		/*
+		 * set/get_caching and set_domain are no longer supported on
+		 * discrete, also the only mmap mode supportd is FIXED.
+		 */
+		map = gem_mmap_offset__fixed(fd, handle, 0,
+					     offset + length,
+					     PROT_READ | PROT_WRITE);
+		igt_assert_eq(gem_wait(fd, handle, 0), 0);
+	}
+
+	if (!map && is_cache_coherent(fd, handle)) {
 		/* offset arg for mmap functions must be 0 */
 		map = __gem_mmap__cpu_coherent(fd, handle, 0, offset + length,
 					       PROT_READ | PROT_WRITE);
@@ -369,7 +380,17 @@ static void mmap_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint6
 	if (!length)
 		return;
 
-	if (gem_has_llc(fd) || is_cache_coherent(fd, handle)) {
+	if (gem_has_lmem(fd)) {
+		/*
+		 * set/get_caching and set_domain are no longer supported on
+		 * discrete, also the only supported mmap mode is FIXED.
+		 */
+		map = gem_mmap_offset__fixed(fd, handle, 0,
+					     offset + length, PROT_READ);
+		igt_assert_eq(gem_wait(fd, handle, 0), 0);
+	}
+
+	if (!map && (gem_has_llc(fd) || is_cache_coherent(fd, handle))) {
 		/* offset arg for mmap functions must be 0 */
 		map = __gem_mmap__cpu_coherent(fd, handle, 0,
 					       offset + length, PROT_READ);
-- 
2.26.3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
