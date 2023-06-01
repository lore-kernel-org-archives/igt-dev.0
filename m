Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E36410E51C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 05:05:26 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 10:39:26 +0530
Message-Id: <20230601050928.2487611-5-kunal1.joshi@intel.com>
In-Reply-To: <20230601050928.2487611-1-kunal1.joshi@intel.com>
References: <20230601050928.2487611-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] tests/i915/kms_frontbuffer_tracking:
 all gem ioctls are not supported for xe as of now
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
index de1a82a9..20be3b83 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -3701,7 +3701,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
