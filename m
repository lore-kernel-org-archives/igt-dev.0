Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBAF10F915
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 09:05:16 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id y15so9653136ljc.0
 for <igt-dev@lists.freedesktop.org>; Mon, 06 Jun 2022 02:05:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Jun 2022 12:05:10 +0300
Message-Id: <20220606090511.26339-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_ccs: Fix 4tiled rc ccs
 and color clear tests
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

4tiled rc ccs and color clear tests were testing wrong things
because wrong modifier was used for choosing test path.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_ccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index 39bf6d58b..4df611f77 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -161,7 +161,7 @@ create_fb_prepare_add(int drm_fd, int width, int height,
 static bool is_ccs_cc_modifier(uint64_t modifier)
 {
 	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
-		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
+		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC;
 }
 
 /*
-- 
2.28.0
