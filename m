Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BE36E317
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 12:42:01 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 31 Mar 2020 15:38:55 +0300
Message-ID: <20200331123857.1212432-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
References: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/kms: Reprobe connector state after
 disabling modest
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
List-ID: <igt-dev@lists.freedesktop.org>

With TypeC we don't always get hotplug events for a connector until the
mode is disabled.

Cc: Imre Deak <imre.deak@intel.com>
Issue: https://gitlab.freedesktop.org/drm/intel/issues/323
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_kms.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 796da1fb..b461818a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2040,7 +2040,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];
-		drmModeConnector *connector;
 
 		/*
 		 * We don't assign each output a pipe unless
@@ -2051,13 +2050,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		output->display = display;
 
 		igt_output_refresh(output);
-
-		connector = output->config.connector;
-		if (connector && (!connector->count_modes ||
-		    connector->connection == DRM_MODE_UNKNOWNCONNECTION)) {
-			output->force_reprobe = true;
-			igt_output_refresh(output);
-		}
 	}
 
 	drmModeFreePlaneResources(plane_resources);
@@ -2070,6 +2062,25 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	igt_display_commit2(display,
 			    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
+	/*
+	 * Let's reprobe all connectors to make sure we have up to date stete.
+	 * Some connectors may require disabling modeset to be detected
+	 * correctly.
+	 */
+	for (i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+		drmModeConnector *connector;
+
+		igt_output_refresh(output);
+
+		connector = output->config.connector;
+		if (connector && (!connector->count_modes ||
+		    connector->connection == DRM_MODE_UNKNOWNCONNECTION)) {
+			output->force_reprobe = true;
+			igt_output_refresh(output);
+		}
+	}
+
 out:
 	LOG_UNINDENT(display);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
