Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8871510E18C
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 18:27:47 +0000 (UTC)
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Apr 2022 11:22:29 -0700
Message-Id: <20220401182229.3308644-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20220401182229.3308644-1-daniele.ceraolospurio@intel.com>
References: <20220401182229.3308644-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] lib/igt_kmod: Unload mei modules
 before unloading i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

mei_gsc binds to an aux device exposed by i915, so it depends on it and
need to be removed before we can unload i915.
On platforms with a GSC, the mei components (pxp, hdcp) depend on
mei_gsc, so those need to be unloaded first.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_kmod.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 0e3ca9b3..f252535d 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -401,6 +401,10 @@ int __igt_i915_driver_unload(const char **who)
 	const char *aux[] = {
 		/* gen5: ips uses symbol_get() so only a soft module dependency */
 		"intel_ips",
+		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
+		"mei_pxp",
+		"mei_hdcp",
+		"mei_gsc",
 		NULL,
 	};
 
-- 
2.25.1
