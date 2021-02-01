Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5296E871
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Feb 2021 18:40:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u25so24180482lfc.2
 for <igt-dev@lists.freedesktop.org>; Mon, 01 Feb 2021 10:40:47 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon,  1 Feb 2021 20:40:41 +0200
Message-Id: <20210201184041.30451-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_scaled: on mode selection
 choose mode with lowest vertical refresh
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Use mode with lowest vertical refresh to keep needed cdclk down.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_flip_scaled_crc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c
index f77484063..c41709b68 100644
--- a/tests/kms_flip_scaled_crc.c
+++ b/tests/kms_flip_scaled_crc.c
@@ -174,9 +174,12 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
 	for (int i = 0; i < output->config.connector->count_modes; i++) {
 		if (output->config.connector->modes[i].hdisplay == data->attemptmodewidth &&
 		   output->config.connector->modes[i].vdisplay == data->attemptmodeheight) {
+			if (modetoset &&
+			    modetoset->vrefresh < output->config.connector->modes[i].vrefresh)
+				continue;
+
 			modetoset = &output->config.connector->modes[i];
-			break;
-		   }
+		}
 	}
 
 	if (!modetoset)
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
