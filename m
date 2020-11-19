Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9C389B05
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 16:21:19 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 19 Nov 2020 16:21:12 +0000
Message-Id: <20201119162112.2540304-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/kmod: Recursively unload the modules
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

When asked to unload a module, look at all the modules that are
trying to use the module and try to unload those first.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_kmod.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index e701545d3..5778bf953 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -243,6 +243,25 @@ out:
 	return err < 0 ? err : 0;
 }
 
+static int kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
+{
+	struct kmod_list *holders, *pos;
+	int err = 0;
+
+	holders = kmod_module_get_holders(kmod);
+	kmod_list_foreach(pos, holders) {
+		struct kmod_module *it = kmod_module_get_module(pos);
+		err = kmod_unload_r(it, flags);
+		kmod_module_unref(it);
+		if (err < 0)
+			break;
+	}
+	kmod_module_unref_list(holders);
+	if (err < 0)
+		return err;
+
+	return kmod_module_remove_module(kmod, flags);
+}
 
 /**
  * igt_kmod_unload:
@@ -269,7 +288,7 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
 		goto out;
 	}
 
-	err = kmod_module_remove_module(kmod, flags);
+	err = kmod_unload_r(kmod, flags);
 	if (err < 0) {
 		igt_debug("Could not remove module %s (%s)\n", mod_name,
 			  strerror(-err));
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
