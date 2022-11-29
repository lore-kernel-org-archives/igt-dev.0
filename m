Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACB910E0BC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 17:27:27 +0000 (UTC)
From: Zack Rusin <zack@kde.org>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Nov 2022 12:27:18 -0500
Message-Id: <20221129172718.151773-4-zack@kde.org>
In-Reply-To: <20221129172718.151773-1-zack@kde.org>
References: <20221129172718.151773-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] igt: Switch warning to an info when not
 using i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Because igt always tries to load i915 driver first for DRIVER_ANY every
test using DRIVER_ANY on anything but i915 starts by printing a warning
that i915 couldn't be loaded.
Lets switch it to a general info line because it makes it hard to spot
actual warnings when every subtest starts by warning about not being
able to load i915.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 lib/igt_kmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index bcf7dfeb..74924b5f 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -389,7 +389,7 @@ igt_i915_driver_load(const char *opts)
 
 	ret = igt_kmod_load("i915", opts);
 	if (ret) {
-		igt_warn("Could not load i915\n");
+		igt_debug("Could not load i915\n");
 		return ret;
 	}
 
-- 
2.37.2
