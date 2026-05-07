Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EC6CD37AA
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 21:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8E010F26C;
	Thu,  7 May 2026 21:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QGbJqCGL";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010013.outbound.protection.outlook.com
 [52.101.193.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0945B10F26C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 21:13:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqyIOYb8/wa/nECCOuKEq2ZsGvlTXolQ2MNefBTeEIjfLYUnLGu9PqI0oxT05Wl4Ta1cXbLxmTlLGsqgkBj5Q7Y5M65GXRzgYbvC2uSbcGhmANKQhaZW8G1vTlmue60sUV0EjOHz/sfgocXvzvS0JJpu2kmGBP/CgkVMwoE+of2+MixOqV+pblKx8lpk/Wc2IrOpUVonMw8UtoSS0LXobFxI8E01MDHnQa3+FNmG0mUJu0RQw/h93coLrGE1sIBtTnhPa5+eb6xYNN6Z5vjdVvnNS9I9hl4dUaf+rQo9avc96i7bDzz7YNvrBGfmLX6SdT7f14Kg/oHqidQZmGquGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V28LRc3ZfjPOLMBpc2B9Ho1lNtM0cEyVQ9nGejI5Qhg=;
 b=jQSk+Ls+DSGnCZzawivsU2kpmxFlaHcpJ/TcAYBNkkRi+rbnT/qw8/nm8Gjl1UavWbvQNIbhCv0ShQcp060WQUMq4GX7adTAw8YmYUdBkOEPviiZi5YWRch4WR0xLCBo2u4BTgIpMtdJ+vsC1NM7eHo7ZyC3keaA+0dW2LWYuWT41eLFDT/IFGVuz3IwDG5Muf8N6W8p7W36y7/zT9DSH0b2yBRw9BAgMWPWjZf1AWOaf0txl9OOheglL8RvDMwXIePGNBiEKirL8B8aHIuaJxVK7C234Rsg0k2cyASZAuqN4IeVJMUXqMDPwCySb+td949+Ymm2u1Tu8OuxQ39mEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V28LRc3ZfjPOLMBpc2B9Ho1lNtM0cEyVQ9nGejI5Qhg=;
 b=QGbJqCGLLOvsJ00C7FivCondz+s4nzcXsOmwQ5dbYlcUK7mJ5x8TRF02KBRpYdovW72gzzowL200+C5Ogfu/RTJpTCooa+gGDqf+o/okZLOuv3/looXCmHFBW0ZXyMLwSUreW4+0T6Zo3T/0u0eGiQI4R24M/HQ4m7eStCGczm0=
Received: from BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::12)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 21:13:49 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::4d) by BY1P220CA0050.outlook.office365.com
 (2603:10b6:a03:59e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Thu,
 7 May 2026 21:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 21:13:48 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 16:13:46 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>, 
 <swati2.sharma@intel.com>, <kamil.konieczny@linux.intel.com>,
 <jani.nikula@intel.com>, Wayne Lin <wayne.lin@amd.com>
Subject: [PATCH i-g-t][V3] tests/kms_hdr: Add visual HDR verification subtests
Date: Thu, 7 May 2026 15:13:30 -0600
Message-ID: <20260507211330.2640022-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f5422f-6ce7-4d52-c661-08deac7d8820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|3023799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: hi/bbjPxfDPZZ1N+ylil/rFWEz6R4eVhMikguPsfi+8VO/NGoRBQyN6RnFmmNjVQhYkl6OJtf+/MKLQs9Zgys54nu+azhH8PeJAM4vbGZwbqlZkSTVcv5xJNajQyiOIaBWtzN/jT14jVCWw3cF7SbNefVSwBjH0RP2gB5AbQp9WoPN/nK0dXFepzRgrZdI6bLWdcWbmWkoP9I5h/2y7hyNouVbSNGohuM+Hs7RrQ0aQxJzlSQbNFLGbuKcVWPviG969QgnG/E7SNY141eBrgSg4oT0C56avxv2SiRjAcWdd80cjG5In49RpSyLFjakmKvEXup46EKtpUc9AoEiNOWsXR+ONSKwnp/5roiG4ajwY5qbg2/v0SdCzBRb2p59neOutLARVpryWwTO0MzigTB5OOGRBEorm2AaV6joeSCHjMObHqUPaVPq0Mszwl4q6EN8RAUaV6b/UL/cqMK4TtjFw2t7kBodB3GznQU7xaF2UmY4XTXl1gi3nNRpn/0FH/4bJt8aQevAiP2y/kk2GwFMtzXphhs83AAF6mCK4xKXmEO6Twa7kPnsr4QdbHAb77HxFg/GV4rpZH8U/PInSk8/bG96vEs15nGCWpdx/4lHS0txnKXQi6Qka5abvTWIdQQKJtXbPRl+dEX/CpYLQ95McEKZe5fpxPwfYfHTxKYAj+kGgwQk7p+5EOmwWv/TVjIqU2OEUHWL7jZt1kHIlXJ6aa46FOwLGrhPO357XaUDw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(3023799003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Eorwlepq91ShVl5eHVghcXpBM/MtAdPw75qW/5DiSgkxU4GOsufQ/yUTpXJOIm4VfJDKJJJ/njViMZ5+oIQbaTaVlZL+9/2Kz7B1kDSWUkDdWcvtUbpaRODJ8XCGyUOCiAbRD2yAhX7qsFQ91vgGVQaI57Z777HA9PZF6JYlBHTSAWF0IUwoPQbdXI65zRsyAW1PG77Y0mmKKfnjVts+8hPFRhLcBMFiDDfKL/SuEu4uu/HU23bZOSgd46YFYLgp1JkCMXGKh10XOVlGZWif3wmg5sujXC8z6doslbekyJJcJ/Ua+J0pu/+TBK9jOzkh4oCsYyigfztWoRbOTEa6w1NJAvSygkYF5TK7bAfK6HdsBukNFoKfoJQHZWhqt/uFyyNt6olpEXyChFDWQO+owo6iAgEnBXRxr5WEPsIX4SOv/fP3EGq8JK73of1m/Pkc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 21:13:48.6720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f5422f-6ce7-4d52-c661-08deac7d8820
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581
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

From: Wayne Lin <wayne.lin@amd.com>

The new subtests display an HDR test pattern under a given metadata
mode and pause for user confirmation, enabling manual inspection of
HDR output quality on a connected HDR panel.

New subtests:
kms_hdr --run-subtest static-swap-smpte2084 --interactive-debug=smpte2084
kms_hdr --run-subtest static-swap-traditional-sdr --interactive-debug=traditional-sdr

Co-developed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Assisted-by: Copilot:Claude-Sonnet-4.6
---
 tests/kms_hdr.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 876c1c03a..c13e985e1 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -67,6 +67,14 @@
  *
  * @swap:                    swapping static HDR metadata
  * @toggle:                  entering and exiting HDR mode
+ *
+ * SUBTEST: static-swap-smpte2084
+ * Description: Show a visual HDR pattern with SMPTE ST 2084 metadata and
+ * require user confirmation.
+ *
+ * SUBTEST: static-swap-traditional-sdr
+ * Description: Show a visual HDR pattern with traditional SDR gamma metadata
+ * and require user confirmation.
  */

 IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
@@ -647,6 +655,79 @@ static void test_hdr(data_t *data, uint32_t flags)
 	}
 }

+static void test_hdr_visual(data_t *data,
+			     void (*fill_metadata)(struct hdr_output_metadata *),
+			     const char *mode_name)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	igt_fb_t afb;
+	int afb_id;
+	bool found = false;
+	struct hdr_output_metadata hdr;
+
+	igt_display_reset(display);
+
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc;
+
+		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
+			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
+				 igt_output_name(output));
+			continue;
+		}
+
+		if (!igt_is_panel_hdr(data->fd, output)) {
+			igt_info("Panel attached via %s connector is non-HDR\n", igt_output_name(output));
+			continue;
+		}
+
+		if (igt_get_output_max_bpc(output) < 10) {
+			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
+			continue;
+		}
+
+		for_each_crtc(display, crtc) {
+			igt_output_set_crtc(output, crtc);
+			if (!igt_crtc_connector_valid(crtc, output))
+				continue;
+
+			prepare_test(data, output, crtc);
+
+			afb_id = igt_create_fb(data->fd, 512, 512,
+					       DRM_FORMAT_XRGB2101010,
+					       DRM_FORMAT_MOD_LINEAR, &afb);
+			igt_assert(afb_id);
+
+			draw_hdr_pattern(&afb);
+
+			igt_plane_set_fb(data->primary, &afb);
+			igt_plane_set_size(data->primary, data->w, data->h);
+			fill_metadata(&hdr);
+			igt_hdr_set_metadata(data->output, &hdr);
+			igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+			igt_display_commit_atomic(display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
+						  NULL);
+
+			igt_info("Displaying %s HDR pattern. Press a key to continue.\n", mode_name);
+			igt_debug_wait_for_keypress(mode_name);
+
+			igt_hdr_set_metadata(data->output, NULL);
+			igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+			test_fini(data);
+			igt_remove_fb(data->fd, &afb);
+
+			found = true;
+			break;
+		}
+	}
+
+	igt_require_f(found, "No HDR-capable connector found.\n");
+}
+
 int igt_main()
 {
 	data_t data = {};
@@ -698,6 +779,14 @@ int igt_main()
 	igt_subtest_with_dynamic("invalid-hdr")
 		test_hdr(&data, TEST_INVALID_HDR);

+	igt_describe("Show HDR pattern with SMPTE ST 2084 metadata and require user confirmation");
+	igt_subtest("static-swap-smpte2084")
+		test_hdr_visual(&data, igt_hdr_fill_st2084, "smpte2084");
+
+	igt_describe("Show HDR pattern with traditional SDR gamma metadata and require user confirmation");
+	igt_subtest("static-swap-traditional-sdr")
+		test_hdr_visual(&data, igt_hdr_fill_sdr, "traditional-sdr");
+
 	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.fd);
--
2.43.0

