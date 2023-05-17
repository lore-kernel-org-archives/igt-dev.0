Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1858110E3A9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 05:30:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com, karthik.b.s@intel.com
Date: Wed, 17 May 2023 10:54:31 +0530
Message-Id: <20230517052434.4097572-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517052434.4097572-1-bhanuprakash.modem@intel.com>
References: <20230517052434.4097572-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/5] lib/igt_kms: s/is_i915_device/is_intel_device
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

As few helpers supports both i915 & xe, update the checks to
support both drivers.

s/is_i915_device/is_intel_device

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index fcafcb66e..3dc3da560 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5814,7 +5814,7 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 	for_each_connector_mode(output) {
 		igt_output_override_mode(output, &connector->modes[j__]);
 
-		if (is_i915_device(display->drm_fd) &&
+		if (is_intel_device(display->drm_fd) &&
 		    !igt_check_bigjoiner_support(display))
 			continue;
 
@@ -6016,7 +6016,7 @@ bool intel_pipe_output_combo_valid(igt_display_t *display)
 	int combo = 0;
 	igt_output_t *output;
 
-	if (!is_i915_device(display->drm_fd))
+	if (!is_intel_device(display->drm_fd))
 		return true;
 
 	for_each_connected_output(display, output) {
-- 
2.40.0
