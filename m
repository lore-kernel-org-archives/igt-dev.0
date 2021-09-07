Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994A589C53
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Sep 2021 07:55:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue,  7 Sep 2021 13:25:14 +0530
Message-Id: <20210907075514.492714-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Handle invalid cursor
 sizes
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, Mika Kahola <mika.kahola@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

As there are many possibilities to fail the commit, instead
of considering all the failures we must take -EINVAL only into
account.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f478ae08d..d53f5d249 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -651,7 +651,10 @@ static void require_cursor_size(data_t *data, int w, int h)
 	igt_remove_fb(data->drm_fd, &primary_fb);
 	igt_output_set_pipe(output, PIPE_NONE);
 
-	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
+	if (ret < 0) {
+		igt_assert_eq(errno, EINVAL);
+		igt_skip("Cursor size %dx%d not supported by driver\n", w, h);
+	}
 }
 
 static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
-- 
2.32.0
