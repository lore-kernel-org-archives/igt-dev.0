Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEE210E928
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Mar 2022 18:38:13 +0000 (UTC)
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Mar 2022 11:32:58 -0700
Message-Id: <20220330183259.3003663-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220330183259.3003663-1-daniele.ceraolospurio@intel.com>
References: <20220330183259.3003663-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kmod: Wait for a kmod to finish
 its probe before unloding it.
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

Modprobing i915 can result in other dependent modules being loaded
automatically as a follow up. This means that by the time the i915
load function returns these modules may still be going through their
init, so if we try to immediately unload i915 again we will fail with
an -EBUSY. To avoid this, if the module load is still in progress, wait
for it to complete before unloading.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 lib/igt_kmod.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index cf7a3b22..d2ac8a56 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -143,6 +143,12 @@ out:
 	return ret;
 }
 
+static bool
+igt_kmod_is_loading(struct kmod_module *kmod)
+{
+	return kmod_module_get_initstate(kmod) == KMOD_MODULE_COMING;
+}
+
 static int modprobe(struct kmod_module *kmod, const char *options)
 {
 	unsigned int flags;
@@ -289,6 +295,16 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
 		goto out;
 	}
 
+	if (igt_kmod_is_loading(kmod)) {
+		igt_debug("%s still initializing\n", mod_name);
+		err = igt_wait(!igt_kmod_is_loading(kmod), 10000, 100);
+		if (err < 0) {
+			igt_debug("%s failed to complete init within the timeout\n",
+				  mod_name);
+			goto out;
+		}
+	}
+
 	err = igt_kmod_unload_r(kmod, flags);
 	if (err < 0) {
 		igt_debug("Could not remove module %s (%s)\n", mod_name,
-- 
2.25.1
