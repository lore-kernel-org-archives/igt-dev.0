Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39661FED9FF
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 17:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B5E10E17F;
	Tue, 17 Mar 2026 17:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZnofjVGg";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C299C10E17F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 17:52:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yE2Dbb51+yURaAAP57H96koqPw24sZ8Jb8YXd5k4iImPQaJhwHat1InBZyZE7fKOPhhbnlUlAkb/bwdUvys7HCpPK9tXivKeFvKKKezIl+LcmmetfGjBsakit+qFnCA2aKI9JB5fvvD2JVr/jXv+LVsyhs0jTQ8VS/WMDpbqIXAInO3MnvbqSg5Vl8WKy3U4mk+ZAQk216grsVW5voWCY/2JHY7P6onLZCvBhPp78jLdu9ZkAMEMsttRp/6F8Cr9/R0tlVzHy9ssALShKDJK3maOVvGH0RW6K2S90A7rCKHaxZJQhNcIE+gcOBe0dQYRG+ZYBJAdZcLdx1ykwtSQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW+a6Eb75ysv4hBKIxynV/EWVGaA6GM3z00jxkCB93A=;
 b=REBzi0J1qaliGW5uRrfxEhJt2Xai3iULZ0Q1ZRpncg1WQZHy/WZZezPX+bs4hC5IhwLSFBrVZNat1IZZ5naoQ4gFuv4yXhCM48/e3q71rKUHTioSQTzYSi+NGVDsJGRv19whC+KmZXc4hf5US1t8JnrTMU1rVWq/0uo+MP6lJQCANTthPcGSTpjsNHIwKzPcSfvK4HZU61itnKXzJ6pb4ovZvumgSN2SE9C6EBE+c7lwygu+Xrg2b/ZAsO0bC7azSDXWbcszYACwhEFYPiCqvkPHZ7Ld99/eKRbHJtI14/kszOu5h8HI3nyPqGiP9Vo0/HPcBmzKGYhtVefStvYBdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW+a6Eb75ysv4hBKIxynV/EWVGaA6GM3z00jxkCB93A=;
 b=ZnofjVGgtI/O1gjpWC98sAntgbXSnCmYfwL8Nbo1S0jUbvRxpeuVIcn9J+QdCxY8gm11LWL11KJO265+QbbOaE0sgJITGr45Ju5W5qY/c8R3vIQGZcsPoU0J+hAZlF865tMxEK2t4MAYC8DV3cfLP9l2XtTAdE+rAQBNPl5NSoI=
Received: from CH0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:76::31)
 by DM4PR12MB9735.namprd12.prod.outlook.com (2603:10b6:8:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 17:52:00 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::77) by CH0PR04CA0026.outlook.office365.com
 (2603:10b6:610:76::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 17:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 17:51:59 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 12:51:58 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <wayne.lin@amd.com>, <Mark.Broadworth@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH 1/3] lib/igt_hdr: Extract HDR helpers into igt_hdr library
Date: Tue, 17 Mar 2026 11:51:30 -0600
Message-ID: <20260317175136.3754576-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DM4PR12MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ca47f7-5c13-437e-6b56-08de844de398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2gUWI8Er7xnlEaubQI3XDGOycmjLvHobxo/udpHQ7/g/BbDjRRriaT0osZ73uCPgRWYDs52TKtOo/LXHbePn08AXFCyORsXqmn4lDlUqVPu7NE/u6R10/4Inb/6ifSEXVHXnbqXFP6CqDnyNvPZUkFgoYC5BF6dGTYcugAdT2J2GwPseiRv4gjKAkRjOSr1ET7gJJM2patZxk1Xv3UICt1Cymbh25kGIHdU54+22USsrcNayxOiw5e0a24fKnisC2fCSoz6GzYKzhQEiKfnDHh/VaFWB/NW1UhkKNA13OoDpR35MPg/IeQ+4vYd1oWEcNK5SgmL7mZhTBd8+yMTD022bRW5kpqujm3LuxLNn4aD6rDt5swZFmTLDKylW2katV9oiGmwS5CR6q+wrTYzIDZLxHFr/JW6tKHA9seq6NI6vbDdpTqCAey3khdy86oWIxtQlK+1Qe6Z0JoMNPyO0aj4X+F7HnYsUkTZyl/X4si2eTmwOZJnRUibHgQBinYiG9MhyxoP9W9/X+DmMssbwTHW30sVE6cJEd9aLZ/er0O4tclAMT1oAZ159TDWX3pc7HbMVF+b/MJ944rCt+ty6AinKhZohyV8d56M3zoumGFtFO/IYn8akfCikOWXIRi7+jbziHZMGkiShgpw89m20dW3x1uyNEWV5m4nvpTpjB/mWjIHXYxdaBW2zd8a9h9pfRRo+dlbKIGR7KobG4X45pNWeGDLx7FRuFA1+p6qGj+qTGXVyhU/vm8esHHUyCxPY0epGh3gdjIpGbMTRyel3Mw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qva5rZ+wgGIZL3Em5ZNf5us+2YHq90kj2lCynQE/KPN7bPjKLsEIK6EAe2B1gwN/BlApumf+lIMqZ9ZlijBSqDbFZnPBEY9WqOdnRkPd9vMYjI/qyCDOA6SU/52yRI2y1qxTKkQuGf46Jcivon8sZ9p+HG71BhTl1WEnqx0y1l44cps0PYUHN7hA/L/8hWrgMIFXy74DWbp/TwxKMfHyfHHOzDRVpBFk8nIQuX+Mpyf4hf5ypAcpGlUJyfBbZ4XI/R0IjzmMJ2kfduLDfbaH1Nguarr6ASLJcw2goaV0azGhwmMq1TTkCvnEfPUM5EloQxboawHrwEG1oQIX4YREzOzDFra+SSRBmmZouIDLmr97x9MYfd0SSXNYjAwtAhIwJbZp/tWKJc7NcE2Jl59mMUB6BeIqoEIAmAodGDt7/kBXXYuAEIffSd8Zftif7n4L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:51:59.8411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ca47f7-5c13-437e-6b56-08de844de398
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9735
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Move HDR utility functions from kms_hdr test into a reusable library
module. This includes metadata filling, EDID parsing, and conversion
functions.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_hdr.c   | 220 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_hdr.h   |  58 +++++++++++++
 lib/meson.build |   1 +
 tests/kms_hdr.c | 179 ++-------------------------------------
 4 files changed, 287 insertions(+), 171 deletions(-)
 create mode 100644 lib/igt_hdr.c
 create mode 100644 lib/igt_hdr.h

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
new file mode 100644
index 000000000..6368ae78b
--- /dev/null
+++ b/lib/igt_hdr.c
@@ -0,0 +1,220 @@
+/*
+ * Copyright © 2026 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include <string.h>
+#include <drm.h>
+#include <drm_mode.h>
+
+#include "igt.h"
+#include "igt_hdr.h"
+#include "igt_edid.h"
+
+/**
+ * SECTION:igt_hdr
+ * @short_description: HDR (High Dynamic Range) helper library
+ * @title: HDR
+ * @include: igt_hdr.h
+ *
+ * This library provides helper functions for working with HDR metadata
+ * and HDR display capabilities.
+ */
+
+/**
+ * igt_hdr_calc_hdr_float:
+ * @val: The value to convert
+ *
+ * Converts a double to 861-G spec FP format
+ *
+ * Returns: The value converted to HDR floating point format
+ */
+uint16_t igt_hdr_calc_hdr_float(double val)
+{
+	return (uint16_t)(val * 50000.0);
+}
+
+/**
+ * igt_hdr_fill_output_metadata_st2084:
+ * @meta: Pointer to hdr_output_metadata structure to fill
+ *
+ * Fills HDR output metadata structure with test values for ST2084 (PQ) EOTF.
+ * Uses Rec. 2020 color primaries and typical HDR mastering display characteristics.
+ *
+ * Note: there isn't really a standard for what the metadata is supposed
+ * to do on the display side of things. The display is free to ignore it
+ * and clip the output, use it to help tonemap to the content range,
+ * or do anything they want, really.
+ */
+void igt_hdr_fill_output_metadata_st2084(struct hdr_output_metadata *meta)
+{
+	memset(meta, 0, sizeof(*meta));
+
+	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
+
+	/* Rec. 2020 */
+	meta->hdmi_metadata_type1.display_primaries[0].x =
+		igt_hdr_calc_hdr_float(0.708); /* Red */
+	meta->hdmi_metadata_type1.display_primaries[0].y =
+		igt_hdr_calc_hdr_float(0.292);
+	meta->hdmi_metadata_type1.display_primaries[1].x =
+		igt_hdr_calc_hdr_float(0.170); /* Green */
+	meta->hdmi_metadata_type1.display_primaries[1].y =
+		igt_hdr_calc_hdr_float(0.797);
+	meta->hdmi_metadata_type1.display_primaries[2].x =
+		igt_hdr_calc_hdr_float(0.131); /* Blue */
+	meta->hdmi_metadata_type1.display_primaries[2].y =
+		igt_hdr_calc_hdr_float(0.046);
+	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_hdr_float(0.3127);
+	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_hdr_float(0.3290);
+
+	meta->hdmi_metadata_type1.max_display_mastering_luminance =
+		1000; /* 1000 nits */
+	meta->hdmi_metadata_type1.min_display_mastering_luminance =
+		500;				   /* 0.05 nits */
+	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
+	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
+}
+
+/**
+ * igt_hdr_fill_output_metadata_sdr:
+ * @meta: Pointer to hdr_output_metadata structure to fill
+ *
+ * Fills HDR output metadata structure with test values targeting SDR.
+ */
+void igt_hdr_fill_output_metadata_sdr(struct hdr_output_metadata *meta)
+{
+	memset(meta, 0, sizeof(*meta));
+
+	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
+
+	/* Rec. 709 */
+	meta->hdmi_metadata_type1.display_primaries[0].x =
+		igt_hdr_calc_hdr_float(0.640); /* Red */
+	meta->hdmi_metadata_type1.display_primaries[0].y =
+		igt_hdr_calc_hdr_float(0.330);
+	meta->hdmi_metadata_type1.display_primaries[1].x =
+		igt_hdr_calc_hdr_float(0.300); /* Green */
+	meta->hdmi_metadata_type1.display_primaries[1].y =
+		igt_hdr_calc_hdr_float(0.600);
+	meta->hdmi_metadata_type1.display_primaries[2].x =
+		igt_hdr_calc_hdr_float(0.150); /* Blue */
+	meta->hdmi_metadata_type1.display_primaries[2].y =
+		igt_hdr_calc_hdr_float(0.006);
+	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_hdr_float(0.3127);
+	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_hdr_float(0.3290);
+
+	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
+	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
+	meta->hdmi_metadata_type1.max_fall = 0;
+	meta->hdmi_metadata_type1.max_cll = 0;
+}
+
+/**
+ * igt_hdr_cta_block_has_hdr:
+ * @edid_ext: Pointer to CTA extension block data
+ *
+ * Checks if a CTA extension block indicates HDR support.
+ *
+ * Byte 1: 0x07 indicates Extended Tag
+ * Byte 2: 0x06 indicates HDMI Static Metadata Block
+ * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
+ *         where ET_0: Traditional Gamma - SDR Luminance Range
+ *               ET_1: Traditional Gamma - HDR Luminance Range
+ *               ET_2: SMPTE ST 2084
+ *               ET_3: Hybrid Log-Gamma (HLG)
+ *               ET_4 to ET_5: Reserved for future use
+ *
+ * Returns: true if the block indicates HDR support, false otherwise
+ */
+bool igt_hdr_cta_block_has_hdr(const char *edid_ext)
+{
+	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
+	     (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
+	    ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
+	     (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
+			return true;
+
+	return false;
+}
+
+/**
+ * igt_hdr_is_panel_hdr:
+ * @drm_fd: DRM file descriptor
+ * @connector_id: KMS connector ID
+ *
+ * Checks if a panel/display supports HDR by parsing its EDID.
+ * Looks for HDR Static Metadata Block in CTA extension.
+ *
+ * Returns: true if the panel supports HDR, false otherwise
+ */
+bool igt_hdr_is_panel_hdr(int drm_fd, uint32_t connector_id)
+{
+	bool ok;
+	int i, j, offset;
+	uint64_t edid_blob_id;
+	drmModePropertyBlobRes *edid_blob;
+	const struct edid_ext *edid_ext;
+	const struct edid *edid;
+	const struct edid_cea *edid_cea;
+	const char *cea_data;
+	bool ret = false;
+
+	ok = kmstest_get_property(drm_fd, connector_id,
+			DRM_MODE_OBJECT_CONNECTOR, "EDID",
+			NULL, &edid_blob_id, NULL);
+
+	if (!ok || !edid_blob_id)
+		return ret;
+
+	edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+	igt_assert(edid_blob);
+
+	edid = (const struct edid *) edid_blob->data;
+	igt_assert(edid);
+
+	drmModeFreePropertyBlob(edid_blob);
+
+	for (i = 0; i < edid->extensions_len; i++) {
+		edid_ext = &edid->extensions[i];
+		edid_cea = &edid_ext->data.cea;
+
+		/* HDR not defined in CTA Extension Version < 3. */
+		if ((edid_ext->tag != EDID_EXT_CEA) ||
+		    (edid_cea->revision != CTA_EXTENSION_VERSION))
+				continue;
+		else {
+			offset = edid_cea->dtd_start;
+			cea_data = edid_cea->data;
+
+			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
+				ret = igt_hdr_cta_block_has_hdr(cea_data + j);
+
+				if (ret)
+					break;
+			}
+		}
+	}
+
+	return ret;
+}
diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
new file mode 100644
index 000000000..a6faef443
--- /dev/null
+++ b/lib/igt_hdr.h
@@ -0,0 +1,58 @@
+/*
+ * Copyright © 2026 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#ifndef IGT_HDR_H
+#define IGT_HDR_H
+
+#include "config.h"
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <linux/types.h>
+
+struct hdr_output_metadata;
+struct igt_fb;
+
+/* HDR EDID parsing. */
+#define CTA_EXTENSION_VERSION		0x03
+#define HDR_STATIC_METADATA_BLOCK       0x06
+#define USE_EXTENDED_TAG		0x07
+
+/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
+enum hdmi_metadata_type {
+	HDMI_STATIC_METADATA_TYPE1 = 0,
+};
+
+enum hdmi_eotf {
+	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
+	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
+	HDMI_EOTF_SMPTE_ST2084,
+};
+
+uint16_t igt_hdr_calc_hdr_float(double val);
+void igt_hdr_fill_output_metadata_st2084(struct hdr_output_metadata *meta);
+void igt_hdr_fill_output_metadata_sdr(struct hdr_output_metadata *meta);
+bool igt_hdr_cta_block_has_hdr(const char *edid_ext);
+bool igt_hdr_is_panel_hdr(int drm_fd, uint32_t connector_id);
+
+#endif /* IGT_HDR_H */
diff --git a/lib/meson.build b/lib/meson.build
index cd03e8f63..71ca60e66 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -114,6 +114,7 @@ lib_sources = [
 	'igt_psr.c',
 	'igt_amd.c',
 	'igt_edid.c',
+	'igt_hdr.c',
 	'igt_eld.c',
 	'igt_infoframe.c',
 	'igt_color.c',
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f30902b72..382fcd823 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -33,6 +33,7 @@
 #include <termios.h>
 #include <unistd.h>
 #include "igt_edid.h"
+#include "igt_hdr.h"
 
 /**
  * SUBTEST: bpc-switch
@@ -70,24 +71,8 @@
 
 IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 
-/* HDR EDID parsing. */
-#define CTA_EXTENSION_VERSION		0x03
-#define HDR_STATIC_METADATA_BLOCK       0x06
-#define USE_EXTENDED_TAG		0x07
-
 #define BACKLIGHT_PATH "/sys/class/backlight"
 
-/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
-enum hdmi_metadata_type {
-	HDMI_STATIC_METADATA_TYPE1 = 0,
-};
-
-enum hdmi_eotf {
-	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
-	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
-	HDMI_EOTF_SMPTE_ST2084,
-};
-
 /* Test flags. */
 enum {
 	TEST_NONE = 1 << 0,
@@ -148,50 +133,6 @@ static void draw_hdr_pattern(igt_fb_t *fb)
 	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
 }
 
-/* Converts a double to 861-G spec FP format. */
-static uint16_t calc_hdr_float(double val)
-{
-	return (uint16_t)(val * 50000.0);
-}
-
-/* Fills some test values for ST2084 HDR output metadata.
- *
- * Note: there isn't really a standard for what the metadata is supposed
- * to do on the display side of things. The display is free to ignore it
- * and clip the output, use it to help tonemap to the content range,
- * or do anything they want, really.
- */
-static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *meta)
-{
-	memset(meta, 0, sizeof(*meta));
-
-	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
-	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
-
-	/* Rec. 2020 */
-	meta->hdmi_metadata_type1.display_primaries[0].x =
-		calc_hdr_float(0.708); /* Red */
-	meta->hdmi_metadata_type1.display_primaries[0].y =
-		calc_hdr_float(0.292);
-	meta->hdmi_metadata_type1.display_primaries[1].x =
-		calc_hdr_float(0.170); /* Green */
-	meta->hdmi_metadata_type1.display_primaries[1].y =
-		calc_hdr_float(0.797);
-	meta->hdmi_metadata_type1.display_primaries[2].x =
-		calc_hdr_float(0.131); /* Blue */
-	meta->hdmi_metadata_type1.display_primaries[2].y =
-		calc_hdr_float(0.046);
-	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
-	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
-
-	meta->hdmi_metadata_type1.max_display_mastering_luminance =
-		1000; /* 1000 nits */
-	meta->hdmi_metadata_type1.min_display_mastering_luminance =
-		500;				   /* 0.05 nits */
-	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
-	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
-}
-
 /* Sets the HDR output metadata prop. */
 static void set_hdr_output_metadata(data_t *data,
 				    struct hdr_output_metadata const *meta)
@@ -365,80 +306,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	}
 }
 
-static bool cta_block(const char *edid_ext)
-{
-	/*
-	 * Byte 1: 0x07 indicates Extended Tag
-	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
-	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
-	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
-	 *	             ET_1: Traditional Gamma - HDR Luminance Range
-	 *	             ET_2: SMPTE ST 2084
-	 *	             ET_3: Hybrid Log-Gamma (HLG)
-	 *	             ET_4 to ET_5: Reserved for future use
-	 */
-
-	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
-	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
-	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
-	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
-			return true;
-
-	return false;
-}
-
-/* Returns true if panel supports HDR. */
-static bool is_panel_hdr(data_t *data, igt_output_t *output)
-{
-	bool ok;
-	int i, j, offset;
-	uint64_t edid_blob_id;
-	drmModePropertyBlobRes *edid_blob;
-	const struct edid_ext *edid_ext;
-	const struct edid *edid;
-	const struct edid_cea *edid_cea;
-	const char *cea_data;
-	bool ret = false;
-
-	ok = kmstest_get_property(data->fd, output->id,
-			DRM_MODE_OBJECT_CONNECTOR, "EDID",
-			NULL, &edid_blob_id, NULL);
-
-	if (!ok || !edid_blob_id)
-		return ret;
-
-	edid_blob = drmModeGetPropertyBlob(data->fd, edid_blob_id);
-	igt_assert(edid_blob);
-
-	edid = (const struct edid *) edid_blob->data;
-	igt_assert(edid);
-
-	drmModeFreePropertyBlob(edid_blob);
-
-	for (i = 0; i < edid->extensions_len; i++) {
-		edid_ext = &edid->extensions[i];
-		edid_cea = &edid_ext->data.cea;
-
-		/* HDR not defined in CTA Extension Version < 3. */
-		if ((edid_ext->tag != EDID_EXT_CEA) ||
-		    (edid_cea->revision != CTA_EXTENSION_VERSION))
-				continue;
-		else {
-			offset = edid_cea->dtd_start;
-			cea_data = edid_cea->data;
-
-			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
-				ret = cta_block(cea_data + j);
-
-				if (ret)
-					break;
-			}
-		}
-	}
-
-	return ret;
-}
-
 /* Sets the HDR output metadata prop with invalid size. */
 static int set_invalid_hdr_output_metadata(data_t *data,
 					   struct hdr_output_metadata const *meta,
@@ -490,7 +357,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 
 	draw_hdr_pattern(&afb);
 
-	fill_hdr_output_metadata_st2084(&hdr);
+	igt_hdr_fill_output_metadata_st2084(&hdr);
 
 	/* Start with no metadata. */
 	igt_plane_set_fb(data->primary, &afb);
@@ -559,36 +426,6 @@ cleanup:
 	igt_remove_fb(data->fd, &afb);
 }
 
-/* Fills some test values for HDR metadata targeting SDR. */
-static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
-{
-	memset(meta, 0, sizeof(*meta));
-
-	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
-	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
-
-	/* Rec. 709 */
-	meta->hdmi_metadata_type1.display_primaries[0].x =
-		calc_hdr_float(0.640); /* Red */
-	meta->hdmi_metadata_type1.display_primaries[0].y =
-		calc_hdr_float(0.330);
-	meta->hdmi_metadata_type1.display_primaries[1].x =
-		calc_hdr_float(0.300); /* Green */
-	meta->hdmi_metadata_type1.display_primaries[1].y =
-		calc_hdr_float(0.600);
-	meta->hdmi_metadata_type1.display_primaries[2].x =
-		calc_hdr_float(0.150); /* Blue */
-	meta->hdmi_metadata_type1.display_primaries[2].y =
-		calc_hdr_float(0.006);
-	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
-	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
-
-	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
-	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
-	meta->hdmi_metadata_type1.max_fall = 0;
-	meta->hdmi_metadata_type1.max_cll = 0;
-}
-
 static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 			     igt_output_t *output, uint32_t flags)
 {
@@ -625,7 +462,7 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	}
 
 	/* Enter HDR, a modeset is allowed here. */
-	fill_hdr_output_metadata_st2084(&hdr);
+	igt_hdr_fill_output_metadata_st2084(&hdr);
 	set_hdr_output_metadata(data, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -654,7 +491,7 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	/* Enter SDR via metadata, no modeset allowed for
 	 * amd driver, whereas a modeset is required for
 	 * intel driver. */
-	fill_hdr_output_metadata_sdr(&hdr);
+	igt_hdr_fill_output_metadata_sdr(&hdr);
 	set_hdr_output_metadata(data, &hdr);
 	if (is_amdgpu_device(data->fd))
 		igt_display_commit_atomic(display, 0, NULL);
@@ -687,7 +524,7 @@ static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
 	struct hdr_output_metadata hdr;
 	size_t metadata_size = sizeof(hdr);
 
-	fill_hdr_output_metadata_st2084(&hdr);
+	igt_hdr_fill_output_metadata_st2084(&hdr);
 
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
@@ -725,13 +562,13 @@ static void test_hdr(data_t *data, uint32_t flags)
 		}
 
 		/* For negative test, panel should be non-hdr. */
-		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
+		if ((flags & TEST_INVALID_HDR) && igt_hdr_is_panel_hdr(data->fd, output->id)) {
 			igt_info("%s: Can't run negative test on HDR panel.\n",
 				 igt_output_name(output));
 			continue;
 		}
 
-		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
+		if ((flags & ~TEST_INVALID_HDR) && !igt_hdr_is_panel_hdr(data->fd, output->id)) {
 			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
 				 igt_output_name(output));
 			continue;
@@ -760,7 +597,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 				     crtc);
 
 			/* Signal HDR requirement via metadata */
-			fill_hdr_output_metadata_st2084(&hdr);
+			igt_hdr_fill_output_metadata_st2084(&hdr);
 			set_hdr_output_metadata(data, &hdr);
 			if (igt_display_try_commit2(display, display->is_atomic ?
 						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
-- 
2.43.0

