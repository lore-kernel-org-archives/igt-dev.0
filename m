Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4846E11C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 09:27:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i9so19394160lfg.10
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 02:27:30 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 17 Aug 2021 12:27:24 +0300
Message-Id: <20210817092724.16512-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210817092724.16512-1-juhapekka.heikkila@gmail.com>
References: <20210817092724.16512-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_plane_alpha_blend: reset
 display after test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

If test would fail alpha/blend settings would be left on random
setting. Clean up before exiting.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_alpha_blend.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index cb8f92891..cff9a9eff 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -586,6 +586,11 @@ igt_main
 		igt_subtest_group
 			run_subtests(&data, pipe);
 
-	igt_fixture
+	igt_fixture {
+		igt_display_reset(&data.display);
+		igt_display_commit2(&data.display, data.display.is_atomic ?
+				    COMMIT_ATOMIC : COMMIT_LEGACY);
+
 		igt_display_fini(&data.display);
+	}
 }
-- 
2.28.0
