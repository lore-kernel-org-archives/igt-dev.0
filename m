Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13548967A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Dec 2021 02:07:50 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Thu, 30 Dec 2021 07:39:14 +0530
Message-Id: <20211230020914.3753273-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/gem_media_vme : skip on no media
 Samplers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: mastanx.katragadda@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Media samplers are not present on some of Gen11 platforms adding
skip on EHL and JSL as per Bspec.

Bspec:29151

Changes since V1 :
        Moved this skip check to igt_get_media_vme_func.[Tony Ye]

CC: Tony Ye <tony.ye@intel.com>
Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
---
 lib/intel_batchbuffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 6fc81400..10d8a6e0 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1187,8 +1187,9 @@ igt_fillfunc_t igt_get_media_fillfunc(int devid)
 igt_vme_func_t igt_get_media_vme_func(int devid)
 {
 	igt_vme_func_t fill = NULL;
+	const struct intel_device_info *devinfo = intel_get_device_info(devid);
 
-	if (IS_GEN11(devid))
+	if (IS_GEN11(devid) && !devinfo->is_elkhartlake && !devinfo->is_jasperlake)
 		fill = gen11_media_vme_func;
 
 	return fill;
-- 
2.25.1
