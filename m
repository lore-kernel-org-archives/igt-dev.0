Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51495C2BA18
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 02:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE06110E913;
	Fri, 21 Jun 2024 02:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QXffkkEb";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56C410E913
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 02:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtXvr5aytTn6pIOQqjs2j7MReZRqYdt0c4bCxAScUz2kfgzyMW/H3sGmDKP3YX/kowxjn1B2uM7CjSQVoHAgBRopLZSG5VqyX7l0Dlns6IK57tHNErY7Px+gukZzYygCLGJgSGKY/JlDBR8SLxwq/INH4Cu52NPyj4CNUvAfwKyN0o847ke1ZjuPX52zq6cmeHEVZyQsubi+MeRyVLBmXZVlyt8BNC0hiX4KU4d6nn9lXKTbWLOxCYeq0V5xD1tkjlPmvWl1nV55NzwsVJTs2OdQpFVZ/fJw5nntCAUgGhH8+QErAbILUwYCx8mXgcV/iT3Nvzc7ZyruwhN1OcX8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0vC7fCrQXZMLqPLtx/Rcn0HKHybBXcRI5AM50hs/io=;
 b=BVYP9p/Sesfv7Nz6CGlCofDKMb0UDdn7sPhPoA2rpmBtXoBWfpukeG2TyvUTuIpZE6QrC2lfTbUZi0Kek7jYCm9g0h1RI6RSzgHRNFGVMzf6GETNCmSc123iS97aVqTPZMCaUL8WA3f/Y/N3J+ZBSsMOZDlf9yy5HwzdlXM533/JUYzct2MeWr5KuOkSYIlajo+aw1Aew3PAkXaVstidYZy0CLJbNqOfLUlfoxps+HgKcDaQA+h0vftov6Oj5MmS7Gf5h2dY7fvlWSgGMlbJ7pElo1wISX85S3LGsayirRHL3RX4P/kjE1KbN4xW3qHWBI39U8MmglVJPQkuyNn+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0vC7fCrQXZMLqPLtx/Rcn0HKHybBXcRI5AM50hs/io=;
 b=QXffkkEbaZfNggiEurPtj1OwOpi0XIVLpCjdO3kXAGJ6LF+iU8r7pjKvBXNSvkOIQrSVbhZsonMVizmd+CSNhSzYg8SWrwDZd3BMGrgsAhTaoqlPQ/wzpguRZlq8axdB1ISbeAY06jEsnZrTRQYrxuGr54zp6nq0aBTUDNQXMvU=
Received: from SA0PR13CA0011.namprd13.prod.outlook.com (2603:10b6:806:130::16)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 02:50:11 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:130:cafe::c3) by SA0PR13CA0011.outlook.office365.com
 (2603:10b6:806:130::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.33 via Frontend
 Transport; Fri, 21 Jun 2024 02:50:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 21 Jun 2024 02:50:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 21:50:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 21:50:06 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Jun 2024 21:49:59 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/3 V2] lib/amdgpu: add gfx12 family id
Date: Fri, 21 Jun 2024 10:49:58 +0800
Message-ID: <20240621024958.2293940-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: ad1acdae-87a9-4f9e-540b-08dc919cde10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|82310400023|1800799021|376011|36860700010; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y/En+2WQ89qBaeH8n5+kiDe0j867yoPvDItr8jSEPgeUFsjMpezTGuf+V9mE?=
 =?us-ascii?Q?3JvRdUY6MC0WF2/bgcssLPjQCUJyFpaxOct6SOviGm3lxSbrju10LJI/fT4f?=
 =?us-ascii?Q?pgtgHEj3chorQ8PAZfSWaDTWJqlKtshgZEg1YaGmxbMst5LC6gh6oZ4iLq6y?=
 =?us-ascii?Q?0viNNYG17V0mUUj9uFVCBmCFtIlXk1Aerc2kNDRJ8K+fJlZ6cBdPNyJ2Jxc+?=
 =?us-ascii?Q?Fq5+nGqCy3DorxT247LMiACReCmxf6s1HpVMrJb+rOPK+mMbNSjFj7cZRgdu?=
 =?us-ascii?Q?tRs+pJCz0kIg+7ghZWNk8htx3lnF2V05jJVXkom/xA9Wsua7CWlXYwt+xb13?=
 =?us-ascii?Q?ZopQKM+oo29BgbVTxQSy7oPNCD9qEJKgWIRBB1P3gP1ThLSMKu3E2Se2uwGa?=
 =?us-ascii?Q?y6A+ubg3PWKPeg7CP279rH/AtN8DUCWWU6hhBBTXjIgc0ME5jHBbXCMZna5n?=
 =?us-ascii?Q?32jLZpghXWtzFudzCSlLbOIGRi9/koOs2tQ3qKA3jfs1tI9DXvXHBUY8218R?=
 =?us-ascii?Q?fxnRJ2sVL8rCV0YjO2wjWfYRe+1/p5+kO8gmEw2hq+7O8YNsKI9Q0rgc1Gjz?=
 =?us-ascii?Q?JlNj2FN8ZRnLFIqu0I60WKJodxk56g768pXrKYcg9Z4VnWyeWI5Lkszu8sjg?=
 =?us-ascii?Q?q77+6EBgLRBxoHjot39y+hcQw3588w3F3zocQNRy70zhqV18P9zNDSFuxESU?=
 =?us-ascii?Q?FCs77CZ69vDlA1zB7/KPTRQrh5kUQD/0KOtoyKYV9dBeFK4D8w210kZ7FSOU?=
 =?us-ascii?Q?aZySRfh9NUV7lAgxq6hzimTjy+Y250mFD/Oy5bPH4FQdo0A4Os5FMKwEhS0d?=
 =?us-ascii?Q?n1kczS+VvcXcsMv0pmcnQih9EFMS+MBxGtZJGwtlXbYBIx4zIeo2TEF0mNNv?=
 =?us-ascii?Q?p2sDRiyUPvX7qMQNDRhHxb56apNneMJL0V3wV8z3uoMMjNTS07lkiyfLLvBh?=
 =?us-ascii?Q?A7hCd5oyRiAtETiEptd8e3b5ph6JcWH3Hj+FDOzVaITnUVSn9UuzSgSpgiFf?=
 =?us-ascii?Q?LZF3f73N1HciUZ89gqQzCHNZCH5o1BmPFPQ0FDuUdP/i17wH0aRsmAzzD79u?=
 =?us-ascii?Q?0nc03D4T41Zt7uVfhvZJZ+L5bg4Hm1OupHtaQu1ukpMfrLvf1PwEzlGI+EOS?=
 =?us-ascii?Q?1LBQa42QBRF4GJHS/EGedQ6UJEg0ROc8DTwB+1Twvc51G1wEjX+WI9mnpfQy?=
 =?us-ascii?Q?HLoSwZqMN0wvdNlZHwW6H5hrckYSU1Ck3G13tc0guNHBjvgkRJ1rXDZHYHaK?=
 =?us-ascii?Q?n5KMiBWnNZXYeljKiZ8UN7R3ZQ4fY+enEiecviBpXlT+fVzYi2+Hee4LiDaE?=
 =?us-ascii?Q?gTohQJcsBNNeQ3PFyCCsR169/AqqAtpJF6KSMh9zZFVyRXGoStdcyf8SWEn9?=
 =?us-ascii?Q?8bhawMNbILH7g2naurnug0EYjN4L2qA+vrWQZGuiSgGR0XXrSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(82310400023)(1800799021)(376011)(36860700010); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 02:50:10.5836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1acdae-87a9-4f9e-540b-08dc919cde10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231
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

To support gfx12 testing, add its family ID.
V2: using a unique subject (Kamil)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_family.h       | 1 +
 lib/amdgpu/amd_ip_blocks.c    | 3 +++
 lib/amdgpu/amdgpu_asic_addr.h | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index bce2c6c2e..4a5731dbf 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -106,6 +106,7 @@ enum radeon_family {
 	CHIP_GFX1103_R2,
 	CHIP_GFX1150,
 	CHIP_GFX1151,
+	CHIP_GFX1200,
 	CHIP_LAST,
 };
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 2ee94105c..ff7e55525 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -695,6 +695,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		identify_chip(GFX1150);
 		identify_chip(GFX1151);
 		break;
+	case FAMILY_GFX1200:
+		identify_chip(GFX1200);
+		break;
 	}
 	if (!info->name) {
 		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index cbe02871e..0ecb0b803 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -31,6 +31,7 @@
 #define FAMILY_GFX1036 0x95
 #define FAMILY_GFX1150 0x96
 #define FAMILY_GFX1037 0x97
+#define FAMILY_GFX1200 0x98
 
 // AMDGPU_FAMILY_IS(familyId, familyName)
 #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
@@ -108,6 +109,7 @@
 #define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
 #define AMDGPU_GFX1150_RANGE     0x01, 0xc0 //# 01 <= x < c0
 #define AMDGPU_GFX1151_RANGE     0xc1, 0xFF //# c1 <= x < 255
+#define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
 
 #define AMDGPU_EXPAND_FIX(x) x
 #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
@@ -173,5 +175,6 @@
 #define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
 #define ASICREV_IS_GFX1150(r)          ASICREV_IS(r, GFX1150)
 #define ASICREV_IS_GFX1151(r)          ASICREV_IS(r, GFX1151)
+#define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
 
 #endif // _AMDGPU_ASIC_ADDR_H
-- 
2.25.1

