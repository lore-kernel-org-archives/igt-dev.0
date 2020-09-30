Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DE66E7FE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2020 17:32:04 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 30 Sep 2020 13:31:49 -0400
Message-Id: <20200930173150.431995-5-lyude@redhat.com>
In-Reply-To: <20200930173150.431995-1-lyude@redhat.com>
References: <20200930173150.431995-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 4/5] lib/igt_kms: Hook up connector
 dithering prop
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
Cc: nouveau@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Nvidia display hardware provides a set of flexible dithering options for
CRTCs. This dithering is actually noticeable in the CRC output for all
available tap points, and can be seen as CRC values for identical frames
cycling between either 2 or 4 values repeatedly (each one of these
values is a different dithering phase applied to the source output). Of
course, this is very likely to break tests using CRC readback since we
don't expect the CRC to change if the source content hasn't changed.

So, hook up support for configuring the dithering property and reset it
to off from igt_display_reset() when applicable.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_kms.c | 5 +++++
 lib/igt_kms.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4023811a..7946555d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -425,6 +425,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS] = "WRITEBACK_PIXEL_FORMATS",
 	[IGT_CONNECTOR_WRITEBACK_FB_ID] = "WRITEBACK_FB_ID",
 	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] = "WRITEBACK_OUT_FENCE_PTR",
+	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
 };
 
 /*
@@ -1825,6 +1826,9 @@ static void igt_output_reset(igt_output_t *output)
 		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR);
 		output->writeback_out_fence_fd = -1;
 	}
+	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
+					 "off");
 
 }
 
@@ -1840,6 +1844,7 @@ static void igt_output_reset(igt_output_t *output)
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
  *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
+ * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
  * - igt_output_override_mode() to default.
  *
  * For pipes:
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f41eadaf..6ad1a7ef 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -132,6 +132,7 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS,
        IGT_CONNECTOR_WRITEBACK_FB_ID,
        IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
+       IGT_CONNECTOR_DITHERING_MODE,
        IGT_NUM_CONNECTOR_PROPS
 };
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
