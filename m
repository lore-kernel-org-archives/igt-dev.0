Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3772610E2E1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Nov 2023 00:17:13 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 16:17:04 -0800
Message-ID: <20231117001704.2816232-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kmod: Fix uninitialized variable
 during module unload
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When unloading a module with no holders, the 'err' variable is checked
without ever being initialized.

Noticed due to sporadic failures in
igt@xe_module_load@reload-no-display, although other tests may also have
been impacted.

Fixes: 5d4730e7f ("lib/igt_kmod: Allow some leeway in igt_kmod_unload_r")
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_kmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index e967c9bcd..250ab2107 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -263,7 +263,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 #define MAX_TRIES	20
 #define SLEEP_DURATION	500000
 	struct kmod_list *holders, *pos;
-	int err, tries;
+	int err = 0, tries;
 	const char *mod_name = kmod_module_get_name(kmod);
 
 	if (kmod_module_get_initstate(kmod) == KMOD_MODULE_BUILTIN)
-- 
2.41.0
