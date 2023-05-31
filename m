Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80B510E4DC
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 13:44:43 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 19:18:29 +0530
Message-Id: <20230531134831.2451929-5-kunal1.joshi@intel.com>
In-Reply-To: <20230531134831.2451929-1-kunal1.joshi@intel.com>
References: <20230531134831.2451929-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] RFC
 tests/i915/kms_frontbuffer_tracking: all gem ioctls are not supported for
 xe as of now
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
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
index 5e9fb55a..44e53ccd 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -3698,7 +3698,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.flip = FLIP_PAGEFLIP;
 	t.tiling = opt.tiling;
 	igt_subtest("basic") {
-		igt_require_gem(drm.fd);
+		if (!is_xe)
+			igt_require_gem(drm.fd);
 		basic_subtest(&t);
 	}
 
-- 
2.25.1
