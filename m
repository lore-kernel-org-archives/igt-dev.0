Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F996E81B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Sep 2021 20:48:33 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue, 14 Sep 2021 13:53:58 -0700
Message-Id: <20210914205358.91057-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Sync Intel PCI ids
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Sync IGT with kernel, a new DG1 pci was added.
Commit 5f0d4214938d ("drm/i915/dg1: Add new PCI id")

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 lib/i915_pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index cb45af9f2..c00ac5469 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -632,7 +632,8 @@
 	INTEL_VGA_DEVICE(0x4905, info), \
 	INTEL_VGA_DEVICE(0x4906, info), \
 	INTEL_VGA_DEVICE(0x4907, info), \
-	INTEL_VGA_DEVICE(0x4908, info)
+	INTEL_VGA_DEVICE(0x4908, info), \
+	INTEL_VGA_DEVICE(0x4909, info)
 
 /* ADL-S */
 #define INTEL_ADLS_IDS(info) \
-- 
2.33.0
