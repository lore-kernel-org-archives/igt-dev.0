Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED7D10E2FC
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 18:08:07 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 10:03:34 -0800
Message-Id: <20230117180334.473201-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kmod: Allow some leeway in
 igt_kmod_unload_r
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com, jonathan.cavitt@intel.com,
 sandeep.kumar.parupalli@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

kmod_module_remove_module occasionally returns EAGAIN for mei_gsc
in the setup of some gem_lmem_swapping subtests.  Just because
EAGAIN is returned doesn't mean the module is lost and unable to
be unloaded.  Try again some number of times (currently 10) before
giving up.

Retries will occur for -EBUSY and -EAGAIN, as these imply the
system is waiting for the target module can simply be waited for.
All other errors exit immediately, but as the context for each
error informs their relative severity, no warnings will be issued.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>
Reviewed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 lib/igt_kmod.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 17090110c..10c79b740 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -253,8 +253,11 @@ out:
 
 static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 {
+#define MAX_TRIES	20
+#define SLEEP_DURATION	500000
 	struct kmod_list *holders, *pos;
-	int err = 0;
+	int err, tries;
+	const char *mod_name = kmod_module_get_name(kmod);
 
 	holders = kmod_module_get_holders(kmod);
 	kmod_list_foreach(pos, holders) {
@@ -269,7 +272,6 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 		return err;
 
 	if (igt_kmod_is_loading(kmod)) {
-		const char *mod_name = kmod_module_get_name(kmod);
 		igt_debug("%s still initializing\n", mod_name);
 		err = igt_wait(!igt_kmod_is_loading(kmod), 10000, 100);
 		if (err < 0) {
@@ -279,7 +281,31 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 		}
 	}
 
-	return kmod_module_remove_module(kmod, flags);
+	for (tries = 0; tries < MAX_TRIES; tries++) {
+		bool loop = false;
+
+		err = kmod_module_remove_module(kmod, flags);
+
+		/* Only loop in the following cases */
+		loop = err == -EBUSY || err == -EAGAIN;
+
+		if (!loop)
+			break;
+
+		igt_debug("Module %s failed to unload with err: %d on attempt: %i\n",
+			  mod_name, err, tries + 1);
+
+		usleep(SLEEP_DURATION);
+	}
+
+	if (err && err != -ENOENT)
+		igt_info("Module %s failed to unload with err: %d after ~%.1fms\n",
+			 mod_name, err, SLEEP_DURATION*tries/1000.);
+	else if (tries)
+		igt_info("Module %s unload took ~%.1fms over %i attempts\n",
+			 mod_name, SLEEP_DURATION*tries/1000., tries + 1);
+
+	return err;
 }
 
 /**
-- 
2.25.1
