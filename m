Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Fri, 30 Jul 2021 09:53:40 +0100
Message-Id: <20210730085348.2326899-3-matthew.auld@intel.com>
In-Reply-To: <20210730085348.2326899-1-matthew.auld@intel.com>
References: <20210730085348.2326899-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 03/11] lib/i915/gem_mman: add fixed mode
 to gem_mmap_offset__cpu
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

On discrete we only support the new fixed mode.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/i915/gem_mman.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index c432bb16..563a7ccf 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -474,8 +474,14 @@ void *gem_mmap__cpu(int fd, uint32_t handle, uint64_t offset, uint64_t size, uns
 void *__gem_mmap_offset__cpu(int fd, uint32_t handle, uint64_t offset,
 			     uint64_t size, unsigned prot)
 {
-	return __gem_mmap_offset(fd, handle, offset, size, prot,
+	void *ptr;
+
+	ptr = __gem_mmap_offset(fd, handle, offset, size, prot,
 				 I915_MMAP_OFFSET_WB);
+	if (!ptr)
+		ptr = __gem_mmap_offset__fixed(fd, handle, offset, size, prot);
+
+	return ptr;
 }
 
 /**
-- 
2.26.3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
