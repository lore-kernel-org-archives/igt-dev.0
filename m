Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AEA10E704
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Feb 2022 06:25:32 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed,  2 Feb 2022 07:25:27 +0100
Message-Id: <20220202062527.8284-1-zbigniew.kempczynski@intel.com>
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

v2: changed to intel_buf_size() (ZK)

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/api_intel_bb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 5c996f644..e37472fb4 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1169,7 +1169,7 @@ static void delta_check(struct buf_ops *bops)
 	ptr = gem_mmap__device_coherent(i915, buf->handle, 0,
 					intel_buf_size(buf), PROT_READ);
 	val = ptr[0x2000 / sizeof(uint32_t)];
-	gem_munmap(ptr, ibb->size);
+	gem_munmap(ptr, intel_buf_size(buf));
 
 	intel_buf_destroy(buf);
 	intel_bb_destroy(ibb);
-- 
2.32.0
