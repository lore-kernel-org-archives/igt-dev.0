Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed,  5 Jan 2022 17:21:06 +0000
Message-Id: <20220105172106.154217-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t] tests/i915/userptr: fix mapping type
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, intel-gfx@lists.freedesktop.org, Priyanka Dandamudi <priyanka.dandamudi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

We need to use the FIXED mapping type on discrete platforms.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_userptr_blits.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 3464db66..a4dca4c0 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -2185,7 +2185,10 @@ static void test_probe(int fd)
 	 */
 	memset(&mmap_offset, 0, sizeof(mmap_offset));
 	mmap_offset.handle = gem_create(fd, PAGE_SIZE);
-	mmap_offset.flags = I915_MMAP_OFFSET_WB;
+	if (gem_has_lmem(fd))
+		mmap_offset.flags = I915_MMAP_OFFSET_FIXED;
+	else
+		mmap_offset.flags = I915_MMAP_OFFSET_WB;
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &mmap_offset), 0);
 
 	for (unsigned long pass = 0; pass < 4 * 4 * 4 * 4 * 4; pass++) {
-- 
2.31.1
