Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68174112570
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Feb 2022 08:41:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Feb 2022 09:41:23 +0100
Message-Id: <20220221084123.22684-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Use safe alignment
 in fast-copy raw
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On discrete new class of problems with softpinning is encountered.
Size of created object can be larger than requested so passing
such requested size to allocator will result of object overlapping.
Additionally objects alignment can vary regarding region placement.

This change is not perfect (it is not aware of object size), but
it places blitting objects with safe alignment. As blitcopy() uses
separate context for blit it won't overlap other objects.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_batchbuffer.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index e5666cd4f..23055855b 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -990,13 +990,14 @@ void igt_blitter_fast_copy__raw(int fd,
 	uint32_t dword0, dword1;
 	uint32_t src_pitch, dst_pitch;
 	uint64_t batch_offset, src_offset, dst_offset;
+	uint64_t align = gem_detect_safe_alignment(fd);
 	int i = 0;
 
 	batch_handle = gem_create(fd, 4096);
 	if (ahnd) {
-		src_offset = get_offset(ahnd, src_handle, src_size, 0);
-		dst_offset = get_offset(ahnd, dst_handle, dst_size, 0);
-		batch_offset = get_offset(ahnd, batch_handle, 4096, 0);
+		src_offset = get_offset(ahnd, src_handle, src_size, align);
+		dst_offset = get_offset(ahnd, dst_handle, dst_size, align);
+		batch_offset = get_offset(ahnd, batch_handle, 4096, align);
 	} else {
 		src_offset = 16 << 20;
 		dst_offset = ALIGN(src_offset + src_size, 1 << 20);
-- 
2.32.0
