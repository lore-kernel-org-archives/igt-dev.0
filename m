Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BA010E22D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:55:55 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 22:29:33 +0530
Message-Id: <20230613165936.2930050-4-kunal1.joshi@intel.com>
In-Reply-To: <20230613165936.2930050-1-kunal1.joshi@intel.com>
References: <20230613165936.2930050-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] tests/i915/kms_frontbuffer_tracking:
 all gem ioctls are not supported for xe as of now
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

XE doesn't support all gem ioctls
Open :- Find replacement for igt_require_gem() for xe

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 61403afb..54071285 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -3697,7 +3697,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.flip = FLIP_PAGEFLIP;
 	t.tiling = opt.tiling;
 	igt_subtest("basic") {
-		igt_require_gem(drm.fd);
+		if (!is_xe_device(drm.fd))
+			igt_require_gem(drm.fd);
 		basic_subtest(&t);
 	}
 
-- 
2.34.1
