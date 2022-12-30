Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C8410E06F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 17:52:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Dec 2022 23:17:37 +0530
Message-Id: <20221230174825.3016716-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20221230174825.3016716-1-bhanuprakash.modem@intel.com>
References: <20221230174825.3016716-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v6 02/50] lib/igt_kms: Bigjoiner check in max_bpc
 constraint
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

There is a possibility of commit failure if the selected pipe/output
won't support Bigjoiner or 8K. So we need to handle this case.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 17099abe..1fea67a1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5826,6 +5826,11 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 
 	for_each_connector_mode(output) {
 		igt_output_override_mode(output, &connector->modes[j__]);
+
+		if (is_i915_device(display->drm_fd) &&
+		    !igt_check_bigjoiner_support(display))
+			continue;
+
 		igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 		if (!igt_check_output_bpc_equal(display->drm_fd, pipe,
-- 
2.39.0
