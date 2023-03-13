Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A8410E572
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 15:17:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	ville.syrjala@linux.intel.com
Date: Mon, 13 Mar 2023 20:44:05 +0530
Message-Id: <20230313151406.2113963-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230313151406.2113963-1-bhanuprakash.modem@intel.com>
References: <20230313151406.2113963-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 2/3] tests/i915/kms_ccs: Cleanup to use linear
 modifier
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

Use either compressed or linear modifier to test. Due to the
lack of available bandwidth, we cannot fit two CCS planes into
the available FIFO configurations.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_ccs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 9be3fa252..18d48fb80 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -393,10 +393,8 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	 */
 	if (fb_flags & FB_COMPRESSED)
 		modifier = data->ccs_modifier;
-	else if (!(fb_flags & FB_HAS_PLANE))
-		modifier = DRM_FORMAT_MOD_LINEAR;
 	else
-		modifier = 0;
+		modifier = DRM_FORMAT_MOD_LINEAR;
 
 	create_fb_prepare_add(data->drm_fd, width, height,
 			      data->format, modifier,
-- 
2.39.1
