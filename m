Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E210E10E86F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 11:21:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Tue, 28 Mar 2023 16:47:45 +0530
Message-Id: <20230328111745.3738878-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] lib/igt_kms: Silent errors on invalid pipe/output
 combo
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

To use i915_pipe_output_combo_valid(), tests must set output
to pipe. Instead of throwing an error, just return as a valid
combo.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c12823d318e..e178ecffc1a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5912,7 +5912,10 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
 		combo++;
 	}
 
-	igt_assert_f(combo, "At least one pipe/output combo needed.\n");
+	if (!combo) {
+		igt_debug("At least one pipe/output combo needed.\n");
+		return true;
+	}
 
 	/*
 	 * Check the given pipe/output combo is valid for Bigjoiner.
-- 
2.40.0
