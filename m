Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E068E6E88B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 23:04:05 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  9 Nov 2021 14:59:25 -0800
Message-Id: <20211109225928.23711-5-matthew.brost@intel.com>
In-Reply-To: <20211109225928.23711-1-matthew.brost@intel.com>
References: <20211109225928.23711-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/7] drm/i915/guc: Relax CTB response timeout
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
List-ID: <igt-dev@lists.freedesktop.org>

In upcoming patch we will allow more CTB requests to be sent in
parallel to the GuC for processing, so we shouldn't assume any more
that GuC will always reply without 10ms.

Use bigger value hardcoded value of 1s instead.

v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
v3:
 (Daniel Vetter)
  - Use hardcoded value of 1s rather than config option
v4:
 (Michal)
  - Use defines for timeout values

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210708162055.129996-2-matthew.brost@intel.com
(cherry picked from commit 1ccf7294b76d28d5151f024351c747ccf101d66e)
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 937c4cb413f1..2b0c61e769f9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -475,14 +475,18 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	/*
 	 * Fast commands should complete in less than 10us, so sample quickly
 	 * up to that length of time, then switch to a slower sleep-wait loop.
-	 * No GuC command should ever take longer than 10ms.
+	 * No GuC command should ever take longer than 10ms but many GuC
+	 * commands can be inflight at time, so use a 1s timeout on the slower
+	 * sleep-wait loop.
 	 */
+#define GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS 10
+#define GUC_CTB_RESPONSE_TIMEOUT_LONG_MS 1000
 #define done \
 	(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, READ_ONCE(req->status)) == \
 	 GUC_HXG_ORIGIN_GUC)
-	err = wait_for_us(done, 10);
+	err = wait_for_us(done, GUC_CTB_RESPONSE_TIMEOUT_SHORT_MS);
 	if (err)
-		err = wait_for(done, 10);
+		err = wait_for(done, GUC_CTB_RESPONSE_TIMEOUT_LONG_MS);
 #undef done
 
 	if (unlikely(err))
