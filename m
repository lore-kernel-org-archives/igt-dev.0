Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D92606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 23:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YsKsQFqx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DD610F4AF;
	Mon, 16 Nov 2026 23:04:18 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011069.outbound.protection.outlook.com [52.101.57.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3131710F4AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 23:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDPLR2TYz3SmLxcXhEmi9p5KqiuDHoANI4VWRYiT7/hpeW9z/OksWWy5KnyxLe0JLXODx+jCmj1IrRdJD5rVHAo64rcLcODV4xaCfEdnm8Kc5gu1tt/gzx/+Yd3RPNm1Kue+E/HZerqXgYgCBmL5cWc5fLELDDRC0JkbCpSJ3l2VgAzie6zDnWO9htf6qFXoTiWbhERT5QmM6vA2xO+z1V+XqUmZPpG1wxdI3Gw2+eTgwRiMhddhAfeIk8Z8acYFaxtt5lSCkT2pipkZmjJKeTkQkJNXS0jDo8mnlCc6uENQbz2AoEmbBB8ImPVW8iPvR8ujXmpvkj3JnqkS+b/xzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olVyyJM8VbEFVXv2iQGTWA3WrOjK53a2dPP1Mpkj/uM=;
 b=xl2usGe/s4sjwXfPm2hmq+RsFTb2f7eez2RTZ6MRZT19lTwlUtW2mRPthW/sVGeirlAGqAukcIcfEI4dwnTdX2lLc6ALF0QrVdapRj4tNflf0DywqbOFOU5+FC336CMoe8jV7a2jwK57mio7u7ziCo/NvX+fE9uUyDDsplJu5JvArg5oO99Iyy+Kk2jRD7JDXYpwPdXZPZzwoRMal+M/2eO5XC/lC+Gm414tL2nPRjcASp5F+fn2skJTBSnU+Q6qFgy4PeGEafO/aYzC3M0mRC5V9n8Xq8tywCUDGGanjXak2cwcAX/eFrCqUE1kSNFrUCq9JfSashAEP9lGVmk4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olVyyJM8VbEFVXv2iQGTWA3WrOjK53a2dPP1Mpkj/uM=;
 b=YsKsQFqxgm1RIc5mc5V4u5zZ+R5L/LML1OdMagbV6AFCHIGgPWrpwfQy6hPQCKEtaUj8PQJkIttzkwcf08/K3RWdnqh5skUjzw1N2Kqbc6kShamU5uBJQRjD6nKNAuys0k6r7u8oKUZNn8hep9/AEAeFpvJG9f/Cq7VtMueOAog=
Received: from SJ0PR03CA0198.namprd03.prod.outlook.com (2603:10b6:a03:2ef::23)
 by DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 23:02:35 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::2c) by SJ0PR03CA0198.outlook.office365.com
 (2603:10b6:a03:2ef::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon,
 16 Nov 2026 23:02:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 23:02:34 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 17:02:32 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Harry.Wentland@amd.com>,
 <Haoming.Qi@amd.com>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v2 3/3] tests/kms_colorop: check writeback formats first
Date: Mon, 16 Nov 2026 17:00:48 -0600
Message-ID: <20261116230048.2020931-4-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116230048.2020931-1-alex.hung@amd.com>
References: <20261116230048.2020931-1-alex.hung@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f41951-b601-4e1f-7c99-08df4435b34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|22082099003|18002099003|261009223027099003|3023799007|11063799006|56012099006|10067099003|261021123027099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: MLEZeRO3jI/+kSBmx9MNMThUtxX2/dbkFyzH+AUOX/LdB6el8t9A6VkQvaM6sJsy0Uc3xd/5D6883TJwiclln4CoyO5HEuv7MkGX8JvXyuH0ZmLKS38jjIK7m7AxqDk6ncmR+voidzDrTT7MxkudHASkkAOM3ccDtK7uNvA2/Bnur42FvNiCK/6WBZv3lktJKjrl4on+B7YK4hUO1e72QrokCCwCW4nQTTDJhadBJvzuhrq55MPFpiIHyUeZEMidz7095fOS1dhhvIt3yFmwa/z4joXl7Yzs+MuC/X1RF20x0iJg5+vGF8ksEeLzNiO2YilhezyXVJWAidfrjzBn79XGOrb0R/+xf8Mv0CIqCSyJQzwsTB4zeSi6LAWu+cY+aUpFDxABlSzZmHhNGIb+IQhGJZLNDkDQHPj9WWRjEB0LmyNaCtWRZA5i7QNMKhqN4DRrqB7zPA8f8EAEjWsKrxIGtUHofygS7TyA4K+hoG2yblhgP/X1scNmL5QaJuVvTVGCokqGb8DIr5ce6wD3z6T0tRMLx31nBqWep+NbZfaYmedagWWaPuDYXwu54duQlWJYCL8e7jqAInxe/b8o9H3u0ZR0pOPFynt/54iV1aT8phkU3PzV/5NlLNQs1mIo62T1PYWnB+O63s+AADyzzPf6Ymoz5rY1h3PwapwvC8JuM/XUL9Tnw07zEdi1uc8ZRB0i3ftGN+BtMqQkKLax9Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(10067099003)(261021123027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NNyWb99MP32Ph310aQgloy/FkqiIHECTV1pm3HUVVzQQFYT2fmHZgVCTe//qwzqK55QDCO6LngJl9boqJJW5A6gQtPxFXr7rY/eAD4auP2bXmcKN2J4XQckwOJZxMNilUT0Ak8ZhmzPyZeuMluyPJGjvjcQt8cp/+HGajMCY5jEFBoVZeumHd7NWKkfY+egHMfDG/5JwZ+U/mETOGyCkmhIwXFK3lUxkN/DNr40hrnJX/z2/w+XmQEKhwfvRd6dNKjlQt4wNYFUDM12Pt2L//3txKPM8YnDhH1GtJsJEXwpqrK1C47mWu69sAIpLRAgM2AG/O7SJlhtCTQZiljb8sGZSThcVwnQjFqmyuE4jv1o7tAZYVG8dyAbAAk9a3V/mLX0vwL4W7tgkVAAzp4RBQhVx37a2z2+nToV8e3uyQS0Wkp/llfcE3/DbvF1FoKX5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 23:02:34.0712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f41951-b601-4e1f-7c99-08df4435b34c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

check_writeback_config() creates an input framebuffer before checking
the writeback connector's format list, then creates an output fb for a
TEST_ONLY commit. kms_writeback_get_output() repeats this for every
CRTC, so an unsupported format still costs one fb per CRTC.

Check the per-connector format list before creating any fb, and move on
to the next CRTC when its primary plane lacks the input format instead
of skipping. Create the probe fbs only once a primary plane supports the
input format, since igt_create_fb() asserts on an ADDFB2 failure, and
reuse them for each CRTC. Clear the CRTC and the staged writeback state
after each probe so a rejected CRTC isn't left on the output. Also free
the leaked format blob.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---

v2: Create the probe fbs only after a primary plane supports the input
    format, so unsupported formats skip instead of failing, and clear
    the CRTC and writeback state after each probe (Harry)

 tests/kms_colorop.c | 84 ++++++++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 31 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 6b39c1f94..c50350030 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -122,12 +122,13 @@
  *
  */
 
-static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
+static igt_crtc_t *check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode, __u32 fourcc_in,
 				    __u32 fourcc_out)
 {
-	igt_fb_t input_fb, output_fb;
+	igt_fb_t input_fb = {}, output_fb = {};
 	igt_plane_t *plane;
+	igt_crtc_t *crtc, *found_crtc = NULL;
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
@@ -141,14 +142,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
-		      "plane doesn't support fourcc format %x\n", fourcc_in);
-
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    fourcc_in, modifier, &input_fb);
-	igt_assert(ret >= 0);
-
 	/* check writeback formats */
 	wb_formats_blob = igt_get_writeback_formats_blob(output);
 	format = wb_formats_blob->data;
@@ -157,23 +150,56 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 		if (fourcc_out == format[i])
 			found_format = true;
 
-	igt_skip_on_f(!found_format,
-		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+	drmModeFreePropertyBlob(wb_formats_blob);
+
+	if (!found_format) {
+		igt_debug("writeback doesn't support fourcc format %x\n", fourcc_out);
+		return NULL;
+	}
+
+	for_each_crtc(display, crtc) {
+		igt_output_set_crtc(output, crtc);
 
-	ret = igt_create_fb(display->drm_fd, width, height,
-			    writeback_format, modifier, &output_fb);
-	igt_assert(ret >= 0);
+		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		if (!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR)) {
+			igt_output_set_crtc(output, NULL);
+			continue;
+		}
 
-	igt_plane_set_fb(plane, &input_fb);
-	igt_output_set_writeback_fb(output, &output_fb);
+		/* Create the probe fbs once a plane supports fourcc_in */
+		if (!input_fb.fb_id) {
+			ret = igt_create_fb(display->drm_fd, width, height, fourcc_in, modifier, &input_fb);
+			igt_assert(ret >= 0);
+
+			ret = igt_create_fb(display->drm_fd, width, height, writeback_format, modifier, &output_fb);
+			igt_assert(ret >= 0);
+		}
+
+		igt_plane_set_fb(plane, &input_fb);
+		igt_output_set_writeback_fb(output, &output_fb);
+
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
+						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* A TEST_ONLY commit leaves the probe state staged */
+		igt_plane_set_fb(plane, NULL);
+		igt_output_set_writeback_fb(output, NULL);
+		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR, 0);
+		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR);
+		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
+
+		if (!ret) {
+			found_crtc = crtc;
+			break;
+		}
+
+		igt_output_set_crtc(output, NULL);
+	}
 
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_plane_set_fb(plane, NULL);
 	igt_remove_fb(display->drm_fd, &input_fb);
 	igt_remove_fb(display->drm_fd, &output_fb);
 
-	return !ret;
+	return found_crtc;
 }
 
 typedef struct {
@@ -208,16 +234,12 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 four
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 			continue;
 
-		for_each_crtc(display, crtc) {
-			igt_output_set_crtc(output,
-					    crtc);
-
-			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
-				igt_debug("Using connector %u:%s on pipe %s\n",
-					  output->config.connector->connector_id,
-					  output->name, igt_crtc_name(crtc));
-				return output;
-			}
+		crtc = check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out);
+		if (crtc) {
+			igt_debug("Using connector %u:%s on pipe %s\n",
+				  output->config.connector->connector_id,
+				  output->name, igt_crtc_name(crtc));
+			return output;
 		}
 
 		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
-- 
2.53.0

