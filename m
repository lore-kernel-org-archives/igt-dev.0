Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC1A10E2C0
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 18:57:39 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 00:31:32 +0530
Message-Id: <20230612190134.2902272-5-kunal1.joshi@intel.com>
In-Reply-To: <20230612190134.2902272-1-kunal1.joshi@intel.com>
References: <20230612190134.2902272-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/6] RFC lib/ioctl_wrappers: GEM_SET_DOMAIN
 ioctl not supported on xe
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

xe doesn't support GEM_SET_DOMAIN ioctl

v2: Keep i915 specific check in test only

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 54071285..22d1a7df 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1569,7 +1569,8 @@ static void do_flush(const struct test_mode *t)
 	struct modeset_params *params = pick_params(t);
 	struct fb_region *target = pick_target(t, params);
 
-	gem_set_domain(drm.fd, target->fb->gem_handle, I915_GEM_DOMAIN_GTT, 0);
+	if (is_i915_device(drm.fd))
+		gem_set_domain(drm.fd, target->fb->gem_handle, I915_GEM_DOMAIN_GTT, 0);
 }
 
 #define DONT_ASSERT_CRC			(1 << 0)
-- 
2.34.1
