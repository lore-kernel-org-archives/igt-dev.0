Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4418710E3A4
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 17:42:24 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id x13so11188970qkg.11
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 10:42:24 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 13:42:17 -0400
Message-Id: <20221019174217.201103-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] chamelium: Get connector After plug to get EDID
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, ihf@google.com,
 amstan@chromium.org, seanpaul@chromium.org, matthewtlam@google.com,
 khaled.almahallawy@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
MST connectors can change connector IDs between plugs. Getting the EDID
prop requires a valid connector ID.

[How]
Get Connector AFTER a plug, just before it's being used.

Fixes: kms_chamelium@dp-edid-read

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/chamelium/kms_chamelium.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
index 870edb91..99cc23a1 100644
--- a/tests/chamelium/kms_chamelium.c
+++ b/tests/chamelium/kms_chamelium.c
@@ -447,8 +447,7 @@ static void
 igt_custom_edid_type_read(data_t *data, struct chamelium_port *port, enum igt_custom_edid_type edid)
 {
 	drmModePropertyBlobPtr edid_blob = NULL;
-	drmModeConnector *connector = chamelium_port_get_connector(
-	    data->chamelium, port, false);
+	drmModeConnector *connector;
 	size_t raw_edid_size;
 	const struct edid *raw_edid;
 	uint64_t edid_blob_id;
@@ -464,6 +463,7 @@ igt_custom_edid_type_read(data_t *data, struct chamelium_port *port, enum igt_cu
 
 	igt_skip_on(check_analog_bridge(data, port));
 
+	connector = chamelium_port_get_connector(data->chamelium, port, true);
 	igt_assert(kmstest_get_property(data->drm_fd, connector->connector_id,
 					DRM_MODE_OBJECT_CONNECTOR, "EDID", NULL,
 					&edid_blob_id, NULL));
-- 
2.38.0.413.g74048e4d9e-goog
