Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD6610E4FD
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jan 2024 16:30:30 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_compute: Do not skip test with Xe on DG2
Date: Thu,  4 Jan 2024 16:30:18 +0000
Message-Id: <20240104163018.7-1-francois.dugast@intel.com>
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
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index bf6a91109..1f1c79fd3 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1386,7 +1386,7 @@ static const struct {
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
