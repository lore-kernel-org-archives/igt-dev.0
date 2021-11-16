Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BB5898ED
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 18:27:43 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id v15so535323ljc.0
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Nov 2021 10:27:42 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 16 Nov 2021 20:27:16 +0200
Message-Id: <20211116182716.17199-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20211116182716.17199-1-juhapekka.heikkila@gmail.com>
References: <20211116182716.17199-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX force enable hdmi
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
List-ID: <igt-dev@lists.freedesktop.org>

---
 lib/igt_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 513d3a1c6..6247d4024 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -269,7 +269,7 @@ jmp_buf igt_dynamic_jmpbuf;
 static unsigned int exit_handler_count;
 const char *igt_interactive_debug;
 bool igt_skip_crc_compare;
-bool igt_force_connect_hdmi;
+bool igt_force_connect_hdmi = true;
 
 /* subtests helpers */
 static bool list_subtests = false;
-- 
2.28.0
