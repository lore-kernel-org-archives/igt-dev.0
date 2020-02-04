Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BEE6ED78
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2020 01:30:58 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Mon,  3 Feb 2020 17:30:43 -0800
Message-Id: <20200204013043.584-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_userptr_blits: Add aperture
 check
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
List-ID: <igt-dev@lists.freedesktop.org>

Skip test_map_fixed_invalidate on platforms that do not allow mappable aperture

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_userptr_blits.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index a8d3783f..99297de1 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -729,6 +729,8 @@ static int test_map_fixed_invalidate(int fd, uint32_t flags)
 	uint32_t handle[num_handles];
 	uint32_t *ptr;
 
+	igt_require(can_gtt_mmap);
+
 	ptr = mmap(NULL, ptr_size,
 		   PROT_READ | PROT_WRITE,
 		   MAP_SHARED | MAP_ANONYMOUS,
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
