Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1466A6E49B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Apr 2021 11:39:51 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Sat, 10 Apr 2021 01:00:46 +0530
Message-Id: <20210409193048.6857-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20210409193048.6857-1-bhanuprakash.modem@intel.com>
References: <20210409193048.6857-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/5] lib/igt_kms: helper to override the
 mode on all connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This helper will iterate through all connectors those have a
pending_pipe != PIPE_NONE set by the test upto the point of
calling this helper. And find the combination using the most
bandwidth by ATOMIC_TEST_ONLY then return to the test.

This helper would override the mode on all connectors that will
be modeset by the next igt_display_commit() call in the test.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1ba938982..c439456c5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3871,6 +3871,47 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
 	}
 }
 
+#define for_each_connector_mode(output)		\
+	for (int i__ = 0;  i__ < output->config.connector->count_modes; i__++)
+
+static
+bool __override_all_active_output_modes_to_fit_link_bw(igt_display_t *display, int base)
+{
+	for ( ; base < display->n_outputs; base++) {
+		igt_output_t *output = &display->outputs[base];
+
+		if (output->pending_pipe == PIPE_NONE ||
+		    output->link_group_id <= 0)
+			continue;
+
+		for_each_connector_mode(output) {
+			igt_output_override_mode(output, &output->config.connector->modes[i__]);
+			if(__override_all_active_output_modes_to_fit_link_bw(display, base + 1))
+				return true;
+
+			if(igt_display_try_commit_atomic(display,
+					DRM_MODE_ATOMIC_TEST_ONLY |
+					DRM_MODE_ATOMIC_ALLOW_MODESET,
+					NULL) == 0)
+				return true;
+		}
+	}
+	return false;
+}
+
+/**
+ * override_all_active_output_modes_to_fit_link_bw:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Override the mode on all connectors those are sharing the link bw
+ *
+ * Returns: true if a valid connector mode combo found, else false
+ */
+bool override_all_active_output_modes_to_fit_link_bw(igt_display_t *display)
+{
+	return __override_all_active_output_modes_to_fit_link_bw(display, 0);
+}
+
 /*
  * igt_pipe_refresh:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c828e78b5..2998cf377 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -894,5 +894,6 @@ void igt_require_pipe(igt_display_t *display,
 
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
+bool override_all_active_output_modes_to_fit_link_bw(igt_display_t *display);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
