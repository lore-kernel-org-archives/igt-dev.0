Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7765B10EA7C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 16:03:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 21:29:14 +0530
Message-Id: <20220922160004.2041598-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 02/52] lib/igt_kms: Bigjoiner check in max_bpc
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
---
 lib/igt_kms.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5fdb67fc..a3ed5ec9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5713,6 +5713,11 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 
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
2.37.3
