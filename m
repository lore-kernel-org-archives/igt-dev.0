Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B410B10E045
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 07:54:26 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 24 Aug 2022 19:24:01 -0600
Message-ID: <20220825012401.2753758-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/kms_concurrent: remove an AMD device check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This is to be deprecated by a kernel fix.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_concurrent.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 6f8ffd4a..3ad51569 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -276,8 +276,6 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 		/* switch to lower resolution */
 		igt_output_override_mode(output, mode_lo);
 		free(mode_lo);
-		if (is_amdgpu_device(data->drm_fd))
-			igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		/* switch back to higher resolution */
-- 
2.37.2
