Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C210810E33E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 07:27:43 +0000 (UTC)
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Date: Tue, 13 Jun 2023 09:27:18 +0200
Message-Id: <20230613072726.4164-3-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/10] lib/igt_kmod.c: check if module is
 builtin before attempting to unload it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Isabella Basso <isabbasso@riseup.net>
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
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 93fa20067..26d58e293 100644
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


