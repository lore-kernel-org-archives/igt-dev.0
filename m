Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822916E081
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 07:46:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 22 Apr 2021 21:07:23 +0530
Message-Id: <20210422153727.11323-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20210422153727.11323-1-bhanuprakash.modem@intel.com>
References: <20210422153727.11323-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v2 i-g-t 1/5] lib/igt_kms: helper to override the mode
 on all connectors
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
calling this helper. And find the combination by using
ATOMIC_TEST_ONLY then return to the test.

This helper would override the mode on all connectors that will
be modeset by the next igt_display_commit() call in the test.

V2:
* Remove MST specific logic (Daniel)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 40 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 08d429a81..ae03cc892 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3841,6 +3841,46 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
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
+		if (output->pending_pipe == PIPE_NONE)
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
index 09b10b3e0..518dfffba 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -892,5 +892,6 @@ void igt_require_pipe(igt_display_t *display,
 
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
