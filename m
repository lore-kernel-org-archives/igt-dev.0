Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri,  3 Apr 2020 14:24:14 +0100
Message-Id: <20200403132414.920346-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Bump estimates for object overhead
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

We are dramatically underestimating the overhead for an active object
and its inodes.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/intel_os.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_os.c b/lib/intel_os.c
index 8458d39a1..2bb0c981a 100644
--- a/lib/intel_os.c
+++ b/lib/intel_os.c
@@ -306,7 +306,7 @@ int __intel_check_memory(uint64_t count, uint64_t size, unsigned mode,
 			 uint64_t *out_required, uint64_t *out_total)
 {
 /* rough estimate of how many bytes the kernel requires to track each object */
-#define KERNEL_BO_OVERHEAD 512
+#define KERNEL_BO_OVERHEAD 8192 /* 2k for an object, 2k for an inode, etc */
 	uint64_t required, total;
 
 	required = count;
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
