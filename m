Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FEC10E0A7
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jan 2024 16:27:45 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_compute: Do not skip test with Xe on DG2
Date: Thu,  4 Jan 2024 16:27:21 +0000
Message-Id: <20240104162721.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This combination used to fail but not anymore so let's add compatibility
with Xe when executing on DG2.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_compute.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index bf6a91109..765770034 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1380,13 +1380,14 @@ static const struct {
 	},
 	{
 		.ip_ver = IP_VER(12, 10),
+
 		.compute_exec = compute_exec,
 		.compat = COMPAT_DRIVER_I915,
 	},
 	{
 		.ip_ver = IP_VER(12, 55),
 		.compute_exec = xehp_compute_exec,
-		.compat = COMPAT_DRIVER_I915,
+		.compat = COMPAT_DRIVER_I915 | COMPAT_DRIVER_XE,
 	},
 	{
 		.ip_ver = IP_VER(12, 60),
-- 
2.34.1
