Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
Date: Mon, 26 Jul 2021 13:03:09 +0100
Message-Id: <20210726120310.1115522-6-matthew.auld@intel.com>
In-Reply-To: <20210726120310.1115522-1-matthew.auld@intel.com>
References: <20210726120310.1115522-1-matthew.auld@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 6/7] lib/ioctl_wrappers: update set_domain
 for discrete
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On discrete set_domain is now gone, instead we just need to add the
wait.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 lib/ioctl_wrappers.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 7e27a1b3..09eb3ce7 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -565,7 +565,12 @@ int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
  */
 void gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
 {
-	igt_assert_eq(__gem_set_domain(fd, handle, read, write), 0);
+	int ret = __gem_set_domain(fd, handle, read, write);
+
+	if (ret == -ENODEV && gem_has_lmem(fd))
+		igt_assert_eq(gem_wait(fd, handle, 0), 0);
+	else
+		igt_assert_eq(ret, 0);
 }
 
 /**
-- 
2.26.3

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
