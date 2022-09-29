Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6A910EAA4
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 14:30:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Sep 2022 20:00:18 +0530
Message-Id: <20220929143018.2502653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] lib/igt_kms: New api to iterate over all outputs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Few KMS tests are trying to run on all outputs irrespective of
their connection status. So add a new helper to iterate over all
outputs.

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3d78c37f..e0786aad 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -544,16 +544,26 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 #define for_each_if(condition) if (!(condition)) {} else
 
 /**
- * for_each_connected_output:
+ * for_each_output:
  * @display: a pointer to an #igt_display_t structure
  * @output: The output to iterate.
  *
  * This for loop iterates over all outputs.
  */
-#define for_each_connected_output(display, output)		\
+#define for_each_output(display, output)		\
 	for (int i__ = 0;  assert(igt_can_fail()), i__ < (display)->n_outputs; i__++)	\
-		for_each_if ((((output) = &(display)->outputs[i__]), \
-			      igt_output_is_connected((output))))
+		for_each_if (((output) = (&(display)->outputs[i__])))
+
+/**
+ * for_each_connected_output:
+ * @display: a pointer to an #igt_display_t structure
+ * @output: The output to iterate.
+ *
+ * This for loop iterates over all connected outputs.
+ */
+#define for_each_connected_output(display, output)		\
+	for_each_output((display), (output))	\
+		for_each_if ((igt_output_is_connected((output))))
 
 /**
  * for_each_pipe_static:
-- 
2.37.3
