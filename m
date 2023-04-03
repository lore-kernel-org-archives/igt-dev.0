Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8360510E48F
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 13:01:46 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Mon,  3 Apr 2023 10:01:22 -0300
Message-Id: <20230403130124.15946-3-mcanal@igalia.com>
In-Reply-To: <20230403130124.15946-1-mcanal@igalia.com>
References: <20230403130124.15946-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_rotation_crc: use
 DRM_FORMAT_MOD_LINEAR as default modifier
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If the rotation is 90 or 270 degrees, the function prepare_fbs() uses a
i915-specific modifier, I915_FORMAT_MOD_Y_TILED. In order to make the
function more generic, use a i915-specific modifier only if the device
is i915. Otherwise, use the DRM_FORMAT_MOD_LINEAR modifier.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/kms_rotation_crc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 0d7b3962..cf02306f 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -296,7 +296,8 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	 * frame can fit in
 	 */
 	if (igt_rotation_90_or_270(data->rotation)) {
-		modifier = data->override_modifier ?: I915_FORMAT_MOD_Y_TILED;
+		if (is_i915_device(data->gfx_fd))
+			modifier = data->override_modifier ?: I915_FORMAT_MOD_Y_TILED;
 
 		igt_swap(w, h);
 	}
-- 
2.39.2
