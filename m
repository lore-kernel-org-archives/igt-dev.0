Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9716EABE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2020 14:39:08 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 15 Jan 2020 16:38:13 +0200
Message-Id: <20200115143813.28958-3-mika.kahola@intel.com>
In-Reply-To: <20200115143813.28958-1-mika.kahola@intel.com>
References: <20200115143813.28958-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_ccs: Enable CCS plane checks
 for Clear Color
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Enable check for Clear Color plane content.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_ccs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 2259a4f1..82fbc43a 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -157,8 +157,7 @@ static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb)
 	int i;
 
 	for (i = 0; i < fb->num_planes; i++) {
-		if (igt_fb_is_ccs_plane(fb, i) &&
-		    !igt_fb_is_gen12_ccs_cc_plane(fb, i))
+		if (igt_fb_is_ccs_plane(fb, i))
 			check_ccs_plane(drm_fd, fb, i);
 	}
 }
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
