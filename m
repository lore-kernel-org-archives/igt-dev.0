Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6BD10E03E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Mar 2023 05:57:10 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Mar 2023 11:24:24 +0530
Message-Id: <20230302055424.75446-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] lib/intel_batchbuffer: Skip media-fill test for
 Graphics version 12.50 and above
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

From: Sinjan Kumar <sinjan.kumar@intel.com>

Xe_HP and beyond platforms does not have media pipeline.
So, this test is not applicable for those platforms.

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Zbigniew Kempczy��ski <zbigniew.kempczynski@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Rahul Kumar <janga.rahul.kumar@intel.com>
Reviewed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 lib/intel_batchbuffer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 59c788e68..cbb513f79 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -643,7 +643,9 @@ igt_fillfunc_t igt_get_media_fillfunc(int devid)
 {
 	igt_fillfunc_t fill = NULL;
 
-	if (IS_GEN12(devid))
+	if (intel_graphics_ver(devid) >= IP_VER(12, 50)) {
+		/* current implementation defeatured PIPELINE_MEDIA */
+	} else if (IS_GEN12(devid))
 		fill = gen12_media_fillfunc;
 	else if (IS_GEN9(devid) || IS_GEN10(devid) || IS_GEN11(devid))
 		fill = gen9_media_fillfunc;
-- 
2.25.1
