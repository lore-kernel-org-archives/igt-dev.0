Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD132D1951B
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 22:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B57B10E4B6;
	Mon, 26 Jan 2026 22:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="405AwZeq";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010052.outbound.protection.outlook.com
 [40.93.198.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E577910E4B6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 22:40:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T67t5ODf6jixNrX7wIVtA2x/h4+It/b4SZhfrV83Y7k+wJ4eeOoU1xib5pOqilHOgOeKJ622yxhR2RLxOARKzhNXVuzGfAL7dS8sXh1ji7Z2ylrqVrYekIKPjVafotmTNL/33VZsdx8lX1QZnv3Q+hwy4CFUIh0gKGSeO3OXMiXi0zMVMLtG4R68YWKA7IxG4Hcof1eYnZhNnC3EB8sUP5Vf/nDPdQjK4u5wsyduU3T/yCaZUGufLy+ztOJD85TVVYLTHYF3vKlCofevAhdLoHH3n0BmSMbD0/6ybJyvJME3JTxHNZ7QfjNYZnGZjkrnaIIPIElAeri//2L7CAOsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV0Oyen+RIfWP9frISLQFtfo8wIHPBeSiS7/VEHnSgk=;
 b=s32YR+46Xgxkmp1/Jl3lz+3fJltti1uYt5zyKEUn5RLOrCdRAPuPJo4a6lX+d5X1B7PcC75qzjk2G8dIFJRDHUF1sBB+hPSIqIe15lPJDluI8I3CA3SetOwazWx35YPeITzxC6/kha8aKRKwgbGLTJYajRm5nAgKZIE94/DjCBG3kTo4pQIqVMPQFgCHrbhshRI9YATaz+iaUuXtpHjJ/qfDLnI9biK8lASPYD/FIOZM6dngA1jx94Cw4KRdYSUbS8W4lUsGr5NGe+NDLIhS3kAZNN1HEK1p69nTPY6/8DNY/wNBHV3+nV2VE1sWjVJ5LaGVXvO3wjdNZgm+hibvcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV0Oyen+RIfWP9frISLQFtfo8wIHPBeSiS7/VEHnSgk=;
 b=405AwZequR4kpi2HCm0wjiu4m77/b8det96pkodiECp01BA57iR+Q5F4C0anXZRseVhiFKFuPtnSX2NySZS+a3WzajUxWRcoTQO1DXaocmwpIFz9xqT6gmH4sNQ+S63d9hEds3YoL14IEKek1FLyseZzxZKwUyHr/UIH3zMn74c=
Received: from BL1P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::7)
 by BL1PR12MB5826.namprd12.prod.outlook.com (2603:10b6:208:395::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 22:40:29 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::c1) by BL1P221CA0042.outlook.office365.com
 (2603:10b6:208:5b5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 22:40:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 22:40:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 16:40:28 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <wayne.lin@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/kms_hdr: Fix typo ST2048 to ST2084
Date: Mon, 26 Jan 2026 15:40:11 -0700
Message-ID: <20260126224011.557616-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|BL1PR12MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: d43fd99b-c6d7-494e-24e7-08de5d2be85b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rsyd66/t9rk2Ry8QMuuec1W3rplWeZV0zfoSlGDf8CZ2W4XH/rSdBlJCf2Wj?=
 =?us-ascii?Q?USV2uZbl0bKimVpoB7rvaxJp03lN99AxE3BeiiMh8+Vmcea5fc9DCBEu0Ag9?=
 =?us-ascii?Q?nl3A07P7uAcsYI68Oect14DDDE65y2T0EhCXM5Oj1vH2GEGXJjTp0rGF09dP?=
 =?us-ascii?Q?bcFPBHGDh9ajPtSgJ9od1oy6teECHT9fRmVDKAB79eOiRrlHX/AXbVZRhZ5k?=
 =?us-ascii?Q?clWRFqohile+uXlgNv6Pu0XftMoNlMliLiHDq5199xEjP16JtcvSRNDJ9n53?=
 =?us-ascii?Q?WuWIT9mQtIB8GBovrHeMirdbu6mQqY267SqBXEAVaCStXqkTprs0xslHrnMh?=
 =?us-ascii?Q?Hzi/tti1gsy1IDy6b0GE6RYpWFE0YdYX9YKECHByj1E/KUZxrxPEpZlBRxLa?=
 =?us-ascii?Q?BcdWgWFAcb+OgXlSpBVY63qouu3hO8J9H2GXwfU5PUOgobmQI1v0N9AfECQI?=
 =?us-ascii?Q?06iu1+6Z0NJkoJPlHAYfT3e+gk2CDriie0jvt6C0t/m7K79Wiq8mpvFg6Y4j?=
 =?us-ascii?Q?hV324s+hTr7FBKOxCxkGwZkZJ747BH2FbiikDj+ufIjsw8a2vi0YwHraYC1D?=
 =?us-ascii?Q?yzs+mxN5JHc2NfFzDd224OcinAGvevc+7vraTxGbM6rWnxqdvQfvlCp80ILg?=
 =?us-ascii?Q?WFmTgljQ0Z/P6CAzWSm5CbjwmP2l17u6LfEPVotGiTWV+8/zIrK6kMxxKBib?=
 =?us-ascii?Q?j944C0/VnRa9KshkoghQlHatEhEdvJm6V+kS79eK3dKf4ER41M6EwDWUg9AK?=
 =?us-ascii?Q?N2BDhNUUxS3Dvep69qm2w+BGtNfk4f9sfvTQ3yHBBRHKbDUG2guOAkmeXooo?=
 =?us-ascii?Q?JwYcZiq7Sh5I+6Bx+kTIlfHNuX2pO/eg5Vyphpyv0TIQ5fnF/zqyK7fnhhOi?=
 =?us-ascii?Q?aBAwDb9ek9TfngYtKDbPqKl4EkWaaCg/X0OI+otpwhLPg+EN4k8azHoj7/we?=
 =?us-ascii?Q?ivpQNfhT5NSG5OK017SquwmeJCrUPvyjsL+ITS7vhGRvUZJJXF7kJL2ZCZ9X?=
 =?us-ascii?Q?6roePbCNdJFvsbgkkVbcgUGUq/sFleEk2BUvyVT05CH8WTQOhQsQLyVgsSpy?=
 =?us-ascii?Q?dTnXKmBQAJU8pCvMuZJoo9uVycHQ8Y4o+Xw9zuo5Pm01coFTmko/2v7SFQlt?=
 =?us-ascii?Q?7ED4JurkmXoop36srs8ypQ5+EBKTkN7GFqI4UB4OTtOvkL3KICkXuHu9lxkU?=
 =?us-ascii?Q?Cn2M0c6ONRaCjNDp+4xldS0mzChbe3gUMi7YxRRfwWaMXjfyy+AnsD97fgNw?=
 =?us-ascii?Q?UaXxRrvYy+XvPeKZMAe3vZMI8qwoKP0kJzJ3Emz93xBQ7PXQs4Fmbtztf7pS?=
 =?us-ascii?Q?S7l0eH9ghmPXtz2AiTI0e/vAozgn5aVr1CIP1OiJ5ljKk3n9MpAKzQi8QxOh?=
 =?us-ascii?Q?I/OD+2eVSzqW1IaYM1mkqDqUPfkkS44Dz+gAIAbqM5f9KUeWlkS9ndukVQzS?=
 =?us-ascii?Q?RObAlYZTLgWuEcHmNYokHdA1iTZ2QobyyLMMbwhRysrm+WoAF+i+QzrJk5+M?=
 =?us-ascii?Q?SUluTQLj6ib1T0cMosi1/py48jSifI9HeeDrkP3zTwq5KXx6sXmVBjFiBXha?=
 =?us-ascii?Q?yQXLGnDlM61Dps1/+MTfglF8iuPWJg1rbZobeUrcTymZhAGm5KuPMDwFgYhZ?=
 =?us-ascii?Q?TsNo3s9w7qLjPTBnp+ciifAYL/GFDQopXtN6gpp+RuIB1+R7mA9hqj9D++LP?=
 =?us-ascii?Q?b8Awmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 22:40:29.6027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d43fd99b-c6d7-494e-24e7-08de5d2be85b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5826
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

This is a HDR test so it should be ST2084, not ST2048.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_hdr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f4c88bc04..e95ee53b1 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -155,14 +155,14 @@ static uint16_t calc_hdr_float(double val)
 	return (uint16_t)(val * 50000.0);
 }
 
-/* Fills some test values for ST2048 HDR output metadata.
+/* Fills some test values for ST2084 HDR output metadata.
  *
  * Note: there isn't really a standard for what the metadata is supposed
  * to do on the display side of things. The display is free to ignore it
  * and clip the output, use it to help tonemap to the content range,
  * or do anything they want, really.
  */
-static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
+static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *meta)
 {
 	memset(meta, 0, sizeof(*meta));
 
@@ -486,7 +486,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 
 	draw_hdr_pattern(&afb);
 
-	fill_hdr_output_metadata_st2048(&hdr);
+	fill_hdr_output_metadata_st2084(&hdr);
 
 	/* Start with no metadata. */
 	igt_plane_set_fb(data->primary, &afb);
@@ -616,7 +616,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
 	}
 
 	/* Enter HDR, a modeset is allowed here. */
-	fill_hdr_output_metadata_st2048(&hdr);
+	fill_hdr_output_metadata_st2084(&hdr);
 	set_hdr_output_metadata(data, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -676,7 +676,7 @@ static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
 	struct hdr_output_metadata hdr;
 	size_t metadata_size = sizeof(hdr);
 
-	fill_hdr_output_metadata_st2048(&hdr);
+	fill_hdr_output_metadata_st2084(&hdr);
 
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
@@ -748,7 +748,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 			prepare_test(data, output, pipe);
 
 			/* Signal HDR requirement via metadata */
-			fill_hdr_output_metadata_st2048(&hdr);
+			fill_hdr_output_metadata_st2084(&hdr);
 			set_hdr_output_metadata(data, &hdr);
 			if (igt_display_try_commit2(display, display->is_atomic ?
 						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
-- 
2.43.0

