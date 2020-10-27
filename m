Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4730289EA9
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2020 12:14:28 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Tue, 27 Oct 2020 13:13:46 +0100
Message-Id: <20201027121346.9414-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: fix confising comment
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

I belive that the word 'mappable' was added there by pasting it
from doc comment above. It is quite confising.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/ioctl_wrappers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index edac50f0..06431ce6 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1007,7 +1007,7 @@ uint64_t gem_mappable_aperture_size(void)
  * Feature test macro to query the kernel for the global gpu aperture size.
  * This is the area available for the kernel to perform address translations.
  *
- * Returns: The mappable gtt address space size.
+ * Returns: The gtt address space size.
  */
 uint64_t gem_global_aperture_size(int fd)
 {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
