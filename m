Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687EE6F573
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 14:06:12 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 29 Jan 2020 19:25:16 +0530
Message-Id: <20200129135520.20336-4-swati2.sharma@intel.com>
In-Reply-To: <20200129135520.20336-1-swati2.sharma@intel.com>
References: <20200129135520.20336-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 3/7] lib/igt_kms: Add HDR_OUTPUT_METADATA
 connector property
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

...and also reset it when resetting outputs since that can definitely
affect CRC output on other tests when not reset.

v2: rebase
v3: rebase
v4: updated doc for igt_display_reset [Petri]

Cc: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b0b064c9..b636b86f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -417,6 +417,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_HDCP_CONTENT_TYPE] = "HDCP Content Type",
 	[IGT_CONNECTOR_LINK_STATUS] = "link-status",
 	[IGT_CONNECTOR_MAX_BPC] = "max bpc",
+	[IGT_CONNECTOR_HDR_OUTPUT_METADATA] = "HDR_OUTPUT_METADATA",
 };
 
 /*
@@ -1794,6 +1795,10 @@ static void igt_output_reset(igt_output_t *output)
 	if (igt_output_has_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION))
 		igt_output_set_prop_enum(output, IGT_CONNECTOR_CONTENT_PROTECTION,
 					 "Undesired");
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA))
+		igt_output_set_prop_value(output,
+					  IGT_CONNECTOR_HDR_OUTPUT_METADATA, 0);
 }
 
 /**
@@ -1807,6 +1812,7 @@ static void igt_output_reset(igt_output_t *output)
  * - %IGT_CONNECTOR_CRTC_ID
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
+ *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
  * - igt_output_override_mode() to default.
  *
  * For pipes:
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 36077d41..4766bfce 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -126,6 +126,7 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_HDCP_CONTENT_TYPE,
        IGT_CONNECTOR_LINK_STATUS,
        IGT_CONNECTOR_MAX_BPC,
+       IGT_CONNECTOR_HDR_OUTPUT_METADATA,
        IGT_NUM_CONNECTOR_PROPS
 };
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
