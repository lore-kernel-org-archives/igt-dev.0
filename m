Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB31410E043
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 19:35:20 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 15 Sep 2022 13:35:03 -0600
Message-ID: <20220915193503.1502352-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] Revert "tests/kms_concurrent: remove an AMD
 device check"
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

This reverts commit 79ebd88d01d679ffe9f6f24108c6ac4dc3f04ddd.

The interdependent kernel patch is not merged yet so revert
79ebd88d to avoid regressions.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_concurrent.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 3ad51569..6f8ffd4a 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -276,6 +276,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 		/* switch to lower resolution */
 		igt_output_override_mode(output, mode_lo);
 		free(mode_lo);
+		if (is_amdgpu_device(data->drm_fd))
+			igt_output_set_pipe(output, PIPE_NONE);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		/* switch back to higher resolution */
-- 
2.37.3
