Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF696E235
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2019 13:33:58 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue, 31 Dec 2019 18:51:54 +0530
Message-Id: <20191231132158.3911-4-swati2.sharma@intel.com>
In-Reply-To: <20191231132158.3911-1-swati2.sharma@intel.com>
References: <20191231132158.3911-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/7] lib/igt_kms: Add HDR_OUTPUT_METADATA
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

...and also reset it when resetting outputs since that can definitely
affect CRC output on other tests when not reset.

v2: rebase
v3: rebase

Cc: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 5 +++++
 lib/igt_kms.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b0b064c9..de7472cd 100644
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
