Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3D16E922
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 21:45:32 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Thu, 30 Jan 2020 13:44:54 -0800
Message-Id: <20200130214455.5948-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_mmap_offset_exhaustion:
 Use gem_mmap__device_coherent
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Allow test to run on platforms that do not have aperture.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/i915/gem_mmap_offset_exhaustion.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_mmap_offset_exhaustion.c b/tests/i915/gem_mmap_offset_exhaustion.c
index f243507e..992bc43b 100644
--- a/tests/i915/gem_mmap_offset_exhaustion.c
+++ b/tests/i915/gem_mmap_offset_exhaustion.c
@@ -60,9 +60,9 @@ create_and_map_bo(int fd)
 
 	handle = gem_create(fd, OBJECT_SIZE);
 
-	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
+	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
-	/* touch it to force it into the gtt */
+	/* touch it to force backing storage allocation */
 	*ptr = 0;
 
 	/* but then unmap it again because we only have limited address space on
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
