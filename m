Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF61D10E66E
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 19:15:39 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id s10so18075484ljp.5
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 12:15:39 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Oct 2022 22:15:25 +0300
Message-Id: <20221011191525.20756-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: avoid excessive
 logging on legacy format test
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

legacy format addfb test try to fuzz kernel with random parameters,
these random parameters cause logging into dmesg. Limit fuzzing
rounds to maximum of 10k (or 1 second) to limit size of created log.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_addfb_basic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index afb4bdf6f..f91153b5b 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -241,6 +241,13 @@ static void invalid_tests(int fd)
 			}
 
 			count++;
+
+			/*
+			 * to avoid exessive logging stop after 10k loops
+			 */
+			if (count >= 10000) {
+				break;
+			}
 		}
 
 		/* After all the abuse, confirm the known_formats */
-- 
2.37.3
