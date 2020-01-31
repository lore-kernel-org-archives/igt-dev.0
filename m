Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED226FA56
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 00:39:18 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Thu, 30 Jan 2020 16:39:15 -0800
Message-Id: <20200131003915.2563-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_sseu: Skip gtt tests if
 mappable aperture unavailable
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

The gtt tests try to verify that a gtt mapped area can be used as an
sseu pointer so it wouldn't make sense to run those when gtt mapping is
not available.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
---
 tests/i915/gem_ctx_sseu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
index 38dc584b..8b014b30 100644
--- a/tests/i915/gem_ctx_sseu.c
+++ b/tests/i915/gem_ctx_sseu.c
@@ -374,6 +374,8 @@ test_ggtt_args(int fd)
 	};
 	uint32_t bo;
 
+	gem_require_mappable_ggtt(fd);
+
 	bo = gem_create(fd, 4096);
 	arg.value = to_user_pointer(gem_mmap__gtt(fd, bo, 4096,
 						  PROT_READ | PROT_WRITE));
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
