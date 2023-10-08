Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374BB10E025
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Oct 2023 22:23:50 +0000 (UTC)
From: Helen Koike <helen.koike@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  8 Oct 2023 19:23:05 -0300
Message-Id: <20231008222306.145122-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] lib/drmtest: add igt_debug when forced and
 dev_name doesn't match
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, emma@anholt.net,
 Helen Koike <helen.koike@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make it easier to understand what was the expected string.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 lib/drmtest.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c87..98910a84c 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -260,8 +260,11 @@ static int open_device(const char *name, unsigned int chipset)
 		goto err;
 
 	forced = forced_driver();
-	if (forced && chipset == DRIVER_ANY && strcmp(forced, dev_name))
+	if (forced && chipset == DRIVER_ANY && strcmp(forced, dev_name)) {
+		igt_debug("Expected driver \"%s\" but got \"%s\"\n",
+				  forced, dev_name);
 		goto err;
+	}
 
 	for (int start = 0, end = ARRAY_SIZE(modules) - 1; start < end; ){
 		int mid = start + (end - start) / 2;
-- 
2.34.1
