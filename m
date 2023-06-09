Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E95C10E679
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 10:08:39 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 15:42:03 +0530
Message-Id: <20230609101205.2803975-4-kunal1.joshi@intel.com>
In-Reply-To: <20230609101205.2803975-1-kunal1.joshi@intel.com>
References: <20230609101205.2803975-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/i915/kms_frontbuffer_tracking:
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
---
 tests/i915/kms_frontbuffer_tracking.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 45a601fe..09bfd3c3 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -3701,7 +3701,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
