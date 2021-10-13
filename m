Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144666EA65
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 13:00:09 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 13 Oct 2021 15:59:47 +0300
Message-Id: <20211013125949.19373-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/7] lib/kms: Introduce
 igt_output_preferred_vrefresh()
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a helper to query the output's preferred vertical
refresh rate.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 18 ++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b6669257f08c..34a2aa00ea02 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4035,6 +4035,24 @@ void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode)
 	}
 }
 
+/*
+ * igt_output_preferred_vrefresh:
+ * @output: Output whose preferred vrefresh is queried
+ *
+ * Return the vertical refresh rate of @output's preferred
+ * mode. If the output reports no modes return 60Hz as
+ * a fallback.
+ */
+int igt_output_preferred_vrefresh(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+
+	if (connector->count_modes)
+		return connector->modes[0].vrefresh;
+	else
+		return 60;
+}
+
 /*
  * igt_output_set_pipe:
  * @output: Target output for which the pipe is being set to
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7e3e67efea7a..e9ecd21e9824 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -461,6 +461,7 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
+int igt_output_preferred_vrefresh(igt_output_t *output);
 void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
 igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
 igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type);
-- 
2.32.0
