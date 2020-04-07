Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150AF6E871
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 13:17:24 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 7 Apr 2020 16:16:31 +0300
Message-ID: <20200407131633.1350311-5-arkadiusz.hiler@intel.com>
In-Reply-To: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
References: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] lib/kms: Reprobe connector state after
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
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4ffc3ed2..9d384fc9 100644
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
@@ -2072,6 +2064,25 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 				    display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 
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
