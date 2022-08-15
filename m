Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C31C1F13
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 14:52:22 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id q190so7362850vsb.7
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 07:52:22 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: Petri Latvala <petri.latvala@intel.com>,
	igt-dev@lists.freedesktop.org
Date: Mon, 15 Aug 2022 11:51:43 -0300
Message-Id: <20220815145146.24038-2-tales.aparecida@gmail.com>
In-Reply-To: <20220815145146.24038-1-tales.aparecida@gmail.com>
References: <20220815145146.24038-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/4] lib/igt_kmod: fix trivial typos
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
2.37.1
