Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BEDE10EC1C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 02:27:09 +0000 (UTC)
From: Zack Rusin <zack@kde.org>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 22:26:59 -0400
Message-Id: <20230316022659.73202-9-zack@kde.org>
In-Reply-To: <20230316022659.73202-1-zack@kde.org>
References: <20230316022659.73202-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 8/8] lib/igt_kms: vmwgfx returns 8 crtc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: petri.latvala@intel.com, banackm@vmware.com, krastevm@vmware.com,
 mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

To avoid crashes in multiple tests we need to extend the number of
available pipe's to match the numbers returned by the virtualized drivers.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8c7dd85b..d2e9eccc 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -839,7 +839,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *p
  */
 const char *kmstest_pipe_name(enum pipe pipe)
 {
-	static const char str[] = "A\0B\0C\0D\0E\0F";
+	static const char str[] = "A\0B\0C\0D\0E\0F\0G\0H";
 
 	_Static_assert(sizeof(str) == IGT_MAX_PIPES * 2,
 		       "Missing pipe name");
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index be5482e0..64807a7f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -62,6 +62,8 @@ enum pipe {
         PIPE_D,
         PIPE_E,
         PIPE_F,
+	PIPE_G,
+	PIPE_H,
         IGT_MAX_PIPES
 };
 const char *kmstest_pipe_name(enum pipe pipe);
-- 
2.38.1
