Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2880710EA31
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 06:07:21 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 May 2022 09:06:59 +0300
Message-Id: <20220530060701.406219-3-jouni.hogander@intel.com>
In-Reply-To: <20220530060701.406219-1-jouni.hogander@intel.com>
References: <20220530060701.406219-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/i915_kms_psr2_sf: Set big_fb_test
 as 0 by default
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

Ensure big version of plane_update testcases is not used unless
specifically requested.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index f9f514ab..2916b7e5 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -864,6 +864,7 @@ igt_main
 		data.op = PLANE_UPDATE;
 		data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 		data.primary_format = DRM_FORMAT_XRGB8888;
+		data.big_fb_test = 0;
 
 		res = drmModeGetResources(data.drm_fd);
 		data.big_fb_width = res->max_width;
-- 
2.25.1
