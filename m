Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE3210E462
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 07:38:00 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Mar 2023 09:37:39 +0200
Message-Id: <20230323073739.553919-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_psr2_sf: Fix cleanup
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

Cleanup is leaving pipe reserved. This is causing failures like:

igt_kms-CRITICAL: DP-1 and eDP-1 are both trying to use pipe A

Fix by setting pipe of output as PIPE_NONE.

Cc: Jeevan B <jeevan.b@intel.com>

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 2d761d31..4a8608c1 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -846,10 +846,10 @@ static void cleanup(data_t *data)
 		igt_plane_set_fb(sprite, NULL);
 	}
 
-	if (data->coexist_feature & FEATURE_DSC) {
+	if (data->coexist_feature & FEATURE_DSC)
 		restore_force_dsc_en();
-		igt_output_set_pipe(output, PIPE_NONE);
-	}
+
+	igt_output_set_pipe(output, PIPE_NONE);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-- 
2.34.1
