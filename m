Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F1E10E53F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jan 2023 10:26:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Jan 2023 11:26:32 +0100
Message-Id: <20230111102633.27518-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230111102633.27518-1-zbigniew.kempczynski@intel.com>
References: <20230111102633.27518-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_mmap_offset: Check mapping
 availability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When we pass invalid handles to GEM_MMAP_OFFSET ioctl we should check
return error code only for supported mapping types. Use real handle
to verify kernel supports such mapping type.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_mmap_offset.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index b27920de2e..b38b7edae3 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -190,12 +190,17 @@ static void bad_object(int i915)
 	for (; i >= 0; i--) {
 		for_each_mmap_offset_type(i915, t) {
 			struct drm_i915_gem_mmap_offset arg = {
-				.handle = handles[i],
+				.handle = real_handle,
 				.flags = t->type,
 			};
 
+			if (mmap_offset_ioctl(i915, &arg))
+				continue;
+
 			igt_debug("Trying MMAP IOCTL[%s] with handle %x\n",
 				  t->name, handles[i]);
+
+			arg.handle = handles[i];
 			igt_assert_eq(mmap_offset_ioctl(i915, &arg),
 				      -ENOENT);
 		}
-- 
2.34.1
