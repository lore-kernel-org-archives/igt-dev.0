Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769A410EB7D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 08:11:38 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Mar 2023 09:11:17 +0100
Message-Id: <20230324081120.3355-3-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230324081120.3355-1-dominik.karol.piatkowski@intel.com>
References: <20230324081120.3355-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] lib/igt_kmod.c: check if module is
 builtin before attempting to unload it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Isabella Basso <isabbasso@riseup.net>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Isabella Basso <isabbasso@riseup.net>

This change makes `igt_kmod_unload_r` safer as it checks whether the
module can be unloaded before attempting it.

v2 -> v3:
- Fix commit message
- Make return value clearer

Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Isabella Basso <isabbasso@riseup.net>

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/igt_kmod.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 93fa2006..26d58e29 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -259,6 +259,9 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
 	int err, tries;
 	const char *mod_name = kmod_module_get_name(kmod);
 
+	if (kmod_module_get_initstate(kmod) == KMOD_MODULE_BUILTIN)
+		return 0;
+
 	holders = kmod_module_get_holders(kmod);
 	kmod_list_foreach(pos, holders) {
 		struct kmod_module *it = kmod_module_get_module(pos);
-- 
2.34.1
