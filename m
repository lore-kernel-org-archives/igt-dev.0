Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D9B10E1F5
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jan 2022 16:50:01 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 31 Jan 2022 17:48:04 +0100
Message-Id: <20220131164804.26165-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/api_intel_bb: Correct size for munmap
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

If we don't release the entirety of the mmap we create, it still holds a
reference to the fd/object.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_bb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 5c996f644..130fb9014 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1169,7 +1169,7 @@ static void delta_check(struct buf_ops *bops)
 	ptr = gem_mmap__device_coherent(i915, buf->handle, 0,
 					intel_buf_size(buf), PROT_READ);
 	val = ptr[0x2000 / sizeof(uint32_t)];
-	gem_munmap(ptr, ibb->size);
+	gem_munmap(ptr, intel_buf_bo_size(buf));
 
 	intel_buf_destroy(buf);
 	intel_bb_destroy(ibb);
-- 
2.32.0
