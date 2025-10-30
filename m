Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3499BCCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1210E8BA;
	Thu, 30 Oct 2025 04:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZlSN7dq7";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6089610E8BA
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5hVRr6Mi4jZHSw80M4wQpIbGIjp+vn6GKKFbqZsMKFijK2SMHbUmjoPiJsRGlf5f9rUoG0F2E0X3Pk1/ObddXjkG0888enhfmnn4UhGTuIinhkjGixG//JFCfL7QnJBGKyS2ncP6qycFG8t/STOEP0JMKr6hSqm5Zohfyg7dleiIVvJutyr8IiUgIkWmtdgka2HXIrdPehLUS+WI/fXi0LvKf81oRP01mvW+gcIaz/8gdp6FpqlFnVYtfHDaFzwF96GrqPuZljmnuQiqfnY+phNmpnRkgS17ma2FkL8GqzZnilIIk82U3s2RdqcpHlXE8llwoa+CHRDJkjq0Z4NkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4PUGvFtnM9F3JE1dhqzd2H6Vg6V31VXzr5qfr+NJeE=;
 b=PmYlAS1atS0U7CxunZomCiWNNmuMxf6S+2XQzbSfw30Jbqt5LKMNwepvD+l+nQZJaKbfbefFlZPY8aZzH2m/vN43GLizM1gEicj0oSbMuURWTEtPZtD9kJnujKrlRxuxBXBE7uZ1jbgf5wyAS61sDoZr8WH5POJMcxwpPt1Mo4St9U+/jTYxTBIP63pG7zej36mz/i88dCrW0Bspjw+8dS4q0AtFTpT7Rk0uPTKXUSlD3o7dYvsMftyQJZs9KO2EncH4lmikKy4Fdu7T3kv8FxWZGLPJ2ra+k/F6BrrqPt1ZQxNv3SP6IUebpn/BIm25Q8M/QpgU97XfiNTIao0sJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4PUGvFtnM9F3JE1dhqzd2H6Vg6V31VXzr5qfr+NJeE=;
 b=ZlSN7dq7YlrmRxVu2lhb4iNsSJnngRWHtY17znosMbqPRcUtODGFU493zJ1ck2g+Vn/GJLjj4v2tiN3twnNgAHYfPEkF89kcBFM+CN+tM5kjC0RqRocNnAOHWLNCm9MoNNvYaSBD9RdbPv/nuT/Z8phRGzajWsEixAATh9alybY=
Received: from SA0PR11CA0142.namprd11.prod.outlook.com (2603:10b6:806:131::27)
 by MW4PR12MB6804.namprd12.prod.outlook.com (2603:10b6:303:20d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 30 Oct
 2025 04:32:16 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::43) by SA0PR11CA0142.outlook.office365.com
 (2603:10b6:806:131::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 04:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:32:16 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:32:15 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 17/32] tests/kms_colorop: Skip if writeback does not
 support fourcc
Date: Wed, 29 Oct 2025 22:27:46 -0600
Message-ID: <20251030042801.2315866-18-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|MW4PR12MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d82602-cb02-42d0-60c2-08de176d4e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZQa1e6tT+UJrtzibjFipYR00Ae1qe8FSVeHS4s1Ds4VGHfZeufmlvKNY9+eS?=
 =?us-ascii?Q?nxUMjDdrBVOCX2hGx3UqPWxTezvyjSckixr1s7aKimfsMcdAs+ktF/uwkPAm?=
 =?us-ascii?Q?OOLBoK7W+MTX0CTLq3nBUeamW4JBRKxn1Pd6OE2+65ipx75Pt7pnwX7YxSY5?=
 =?us-ascii?Q?TK7WlD64hhojbPPUtHl/b54CrP7oEULYoTsFCW/m08PHo6UQYfR3+9cOIQnf?=
 =?us-ascii?Q?ZcI9F27FCAf6PyCrsZlTnziC/F84rYq5oiLRrGFZ+9PncKfAcia0oTYC//Bc?=
 =?us-ascii?Q?ZaGXbf9vD3lFypLDcgm0mm+o4gQ5IymW2X0zg0yQwkomyo2XUpGDsDCQLb1P?=
 =?us-ascii?Q?wwLTIDmEwuKoZHASVdfL2lRSTNX2cjuPbH/uIaQNaYbpzKvh6oXnhJpE8r8u?=
 =?us-ascii?Q?iGnBBbi/tSmU82JD1jpHbM021fW76rKBswQnmIkPAlRNJgtwjkUrQM+R+mFU?=
 =?us-ascii?Q?ZBlLbgeZnePk40I726VUlEvADphfxsgKYGAsVAoJlNLpWEZZhLfd0IzNTH2m?=
 =?us-ascii?Q?0utq6k1GFOASvYIJGsarKhDreWRXwQiMKrzOX+8iTN5yH9sJCxead7n/amlg?=
 =?us-ascii?Q?bZjGiEQMDeJ0Gq+6wdr0nIimtdDZw8R44lGe6z+POnFcYO2k4h1Fb7+2smsN?=
 =?us-ascii?Q?nXCC62M8bT0MmaLC25XPRYZX+f8wbUslwRGbM4dJmdrPvudknU0mfz+grUMW?=
 =?us-ascii?Q?OXh9AZ8HJ9gGX/gESenSzdU/NWF6e/I+OjUte3xGopNmiXfJvqaBYusnFkS0?=
 =?us-ascii?Q?0ErulIcfted3QABw6ZjKcy5VCBsqFJUtHIBBjZEQhWh73IHzbOXPU/IyOOO1?=
 =?us-ascii?Q?jd5SOmYsUBd7j5HQsMwg3D0fpzBTqbrhb9GnBO0ZgDTVE4hXLzZ/X1yuR41q?=
 =?us-ascii?Q?z4wn0WX2GjMZ2TkqyVvAm7oGoVCyHJkbLzJgqClgER+7HWTVeiZgzg/f8VVp?=
 =?us-ascii?Q?L1F0skouKXrEm4AbH1yEDF7GlHL66lcgnef0gRTkZzjgR36XRNVI+reWoKar?=
 =?us-ascii?Q?nc2/p/VnmCu2PGWPtVVO2p1CoAUrt/umiIpPK/Lln88OlbJo/jLvtjfk/dYf?=
 =?us-ascii?Q?M3CZdAbwHgTB91xJFSHEEwAoClYP6S31VKryrp6N6V1PW3hTgsZjojydXiZ+?=
 =?us-ascii?Q?OTeN1lxH810LaT0BZs51VoD0fA6XPmEItwxNcxIeatbZFwqBD/5Bzs++fA2A?=
 =?us-ascii?Q?+8VI6t/X5LOhguZ0n9nDNSMDo7p5Cu7Nl4NEzlV36aDv31xEU6WqCddLEpYh?=
 =?us-ascii?Q?YxxdVi1Zu6pTG23P0KYhN/kNmiMPOkbZQGbAMZLqwAD02OF+4hjLNfnZ7pbA?=
 =?us-ascii?Q?g+bb5HWZ9EaiBgYVN/x7kDiKq6qgZ++Zaim5B5Ybh13ltSpnooz4nsOYCQ8j?=
 =?us-ascii?Q?nx5p5g1OuA/D4eF3D6myp8m2jVfOaO66SKyCl8rxDFAlTFAxhyAhv/97WJur?=
 =?us-ascii?Q?NxZOKZXHnrrLVK4Vox1dGGvRTaT16rIb+28EPprzP5mSeZFuRglD+39f88vG?=
 =?us-ascii?Q?HIBlLIesOcepXBj0HCElXa4a4p+TEJ6ObeXN6RT1ASp3uPYfHH8FjFQtYN+4?=
 =?us-ascii?Q?6pIRYzo4G5A/EasN0TQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:32:16.0240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d82602-cb02-42d0-60c2-08de176d4e04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6804
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

From: Harry Wentland <harry.wentland@amd.com>

Writeback is used by kms_colorop so skip tests if it doesn't support
specific color formats.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8e8f7c63f..31a97c48f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -50,6 +50,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
 
 	igt_output_override_mode(output, &override_mode);
 
@@ -64,6 +68,17 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
+	/* check writeback formats */
+	wb_formats_blob = igt_get_writeback_formats_blob(output);
+	format = wb_formats_blob->data;
+
+	for (i = 0; i < wb_formats_blob->length / 4; i++)
+		if (fourcc_out == format[i])
+			found_format = true;
+
+	igt_skip_on_f(!found_format,
+		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
-- 
2.43.0

