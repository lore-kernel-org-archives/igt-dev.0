Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89E66E8AC
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 19:50:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95584107ACC9
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 19:49:39 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Fri, 17 Apr 2020 15:49:30 -0400
Message-Id: <20200417194931.39774-5-lyude@redhat.com>
In-Reply-To: <20200417194931.39774-1-lyude@redhat.com>
References: <20200417194931.39774-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 4/5] lib/igt_kms: Hook up connector
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
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e9621e7e..d45adfaf 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -421,6 +421,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_LINK_STATUS] = "link-status",
 	[IGT_CONNECTOR_MAX_BPC] = "max bpc",
 	[IGT_CONNECTOR_HDR_OUTPUT_METADATA] = "HDR_OUTPUT_METADATA",
+	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
 };
 
 /*
@@ -1802,6 +1803,10 @@ static void igt_output_reset(igt_output_t *output)
 	if (igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA))
 		igt_output_set_prop_value(output,
 					  IGT_CONNECTOR_HDR_OUTPUT_METADATA, 0);
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
+					 "off");
 }
 
 /**
@@ -1816,6 +1821,7 @@ static void igt_output_reset(igt_output_t *output)
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
  *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
+ * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
  * - igt_output_override_mode() to default.
  *
  * For pipes:
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index adca59ac..4899e765 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -127,6 +127,7 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_LINK_STATUS,
        IGT_CONNECTOR_MAX_BPC,
        IGT_CONNECTOR_HDR_OUTPUT_METADATA,
+       IGT_CONNECTOR_DITHERING_MODE,
        IGT_NUM_CONNECTOR_PROPS
 };
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
