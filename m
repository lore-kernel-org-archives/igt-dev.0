Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A629310E46A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 05:27:14 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id f10so6607295uap.2
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Aug 2022 22:27:14 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: igt-dev@lists.freedesktop.org,
	Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  3 Aug 2022 02:26:51 -0300
Message-Id: <20220803052654.98827-2-tales.aparecida@gmail.com>
In-Reply-To: <20220803052654.98827-1-tales.aparecida@gmail.com>
References: <20220803052654.98827-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_kmod: fix trivial typos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

existance -> existence
kmcdline -> kcmdline

Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
---
 lib/igt_kmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index dfdcfcc5..bde0461a 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -114,7 +114,7 @@ out:
  *
  * Returns: True in case the module has been found or false otherwise.
  *
- * Function to check the existance of module @mod_name in list of loaded kernel
+ * Function to check the existence of module @mod_name in list of loaded kernel
  * modules.
  *
  */
@@ -813,7 +813,7 @@ static void kmsg_dump(int fd)
 				continue;
 
 			if (errno == EPIPE) {
-				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
+				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kcmdline\n");
 				continue;
 			}
 
-- 
2.37.0
