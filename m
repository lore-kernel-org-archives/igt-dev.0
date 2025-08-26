Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99CDCA0FF2
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 16:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F05710E381;
	Tue, 26 Aug 2025 16:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZyJb5A2m";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2072.outbound.protection.outlook.com [40.107.212.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864AB10E381
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 16:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5kPgMUD6xSm3aqjKHzIhC92f9Xv/UpJFx06+a90Hha5No0O6NL2O0DH6OzqnNOAtBy3V1Ur3yDxDzPWETMx7miTXMwUaIEiIHphkMPWqyhD+omTf8jMMns9H9+acM904IpQ1JHbvk7OlLRp7vkO2UbPOTsxD6f/dh8q03hLjJh/Lh/breleqZhpadJrKQ6pGQnPV1yiz4TqY8HNLmkbL/XKAaeipLP94soEj5aUg0qsS4651+plLsERxwgdPF5MV3NdDTMNuvV4yDt+Ap2pEGTXE0H5iqT9TXr9DsPDWc/wBM78K2S3EOcgtzcjhpJ/Ei3C7HxSAppjh9HlSB1v0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7F1bTlnJWAfv0aVeprspdWvzpWHnr4v4ynr5HQLTTc=;
 b=I5/o2YBRNhg6LEILwxCt+6llocN5JQpAiz5eXYCCx8YGw5QO/be3cvRKoW6iMtmAhlcKdVT79NgJganBEapa3euOdNmlL1c4JVIyk/8VV1AvGYZBFRLNj7q327nAR6IEWracN8CqQfamEcQGxHA79HpOl/HCB/39SJaCdM119PjHhQVMVXhTk8uxAnrdb/iBmGwsupSDL3TPMRAHBg4uEdc0K8qVuve242Nhp7ENC8WxhYxLPeVOjIKPi/1TDLGqlW8XHJtGawxPGLyAyDs+obMyCgiYAgYrVX3wAwqEp3xMyC0d3HYDmLn9+hUera07U2ce3ok+SeLPvG3Hv+VASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7F1bTlnJWAfv0aVeprspdWvzpWHnr4v4ynr5HQLTTc=;
 b=ZyJb5A2mss8V2HbRZe6r8h2bGdc2PgCfxGh+edW7QLQRjOH8WtwG1Enw9AzuDEcXTDseH7SEaJHLB38FL6LyL5G19s90DF5QzS+NBjkNikCUjbRi9vfftWY/0RTpHLaQmghwTNF6W9YyKAo9No7xmkYtp7E4vC0VnlVh5zePKsM=
Received: from BN0PR04CA0067.namprd04.prod.outlook.com (2603:10b6:408:ea::12)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 16:39:09 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::6c) by BN0PR04CA0067.outlook.office365.com
 (2603:10b6:408:ea::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 16:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 16:39:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 11:39:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 11:39:07 -0500
Received: from [10.4.12.116] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 11:39:07 -0500
Message-ID: <f4d00185-a70e-44d6-b7c1-fea675665b15@amd.com>
Date: Tue, 26 Aug 2025 12:39:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 27/30] tests/kms_colorop: Add a 3D LUT subtest
To: <igt-dev@lists.freedesktop.org>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-28-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20250815040659.3321102-28-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae63c4c-fde1-492d-6a9f-08dde4bf1406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWhSZkJWcEY5cldBS0xCZzR4WjdBWUs1ZVBFS2ZCS0thQWRDK0JicnE1SlZR?=
 =?utf-8?B?cXQ4U3pocGpLZ3ZiRzcvRVVqQ2lqcjZBQjR0N2xXWWs3OVExM3Vqd3lUbXpj?=
 =?utf-8?B?c3NtU0IwZmdsczJRTzh4ZVpYRExrVjQ2THhmMzN4ZmpGL0VjdTJrN2NkM3dD?=
 =?utf-8?B?R1dVM0d2REF4bUY2anljUHJJa1FyOUYxeXdrR2hUa0xzb29LT1R2R1lHZVhJ?=
 =?utf-8?B?Tld4aVRYa1R1Mlo2UlVHeTRnUWhOY2Z0dlBKdThJNFllUFFyMHhZVm9vMVJw?=
 =?utf-8?B?U2JLODdXRFdCS2RGR29xNDRsUU1aV2FBM0FMOHdUNzU3dkx3eGh0Q09KMVR1?=
 =?utf-8?B?V0VsQ1dHSnErRGdtZ3dBYTh3VVMwaElHaGZHR0M3RUZXN2FDbnZzU3BhTzBT?=
 =?utf-8?B?UGFJZTNRQTBxVk9RZWRtd21KbUxRamhlNGJzajFtcjZSdTMrM3l2ZGJKbGEw?=
 =?utf-8?B?R2RZbzNuOTJsR2lTQWZkZm9UTkhvQWVETnZuWWF2QWJmWjIybEwwSVhGZUVE?=
 =?utf-8?B?UkZ0ZlpwUUJGRzJJTHp6MmxzM1hUN0JJalVTWEhVTDhRK3Y1KzlCRG5uUDAv?=
 =?utf-8?B?bXFEbE8rUDFpZEJDSjFhWkljQXcxYXBKRzJ1MFFIKzZTODROYVBubGNXaktP?=
 =?utf-8?B?Ty8zaFJ1c3pxT0ZXYWthTDhHdEx5OTd5ODVHam1jN2I2OWQxLzY2ZXlMM2cz?=
 =?utf-8?B?clM4Qmhab3FtTzFmME9MWWdSazQ1SkxDdGdmSXVKcTVBL0FrZEp3WlVjT0tS?=
 =?utf-8?B?UDYyaGxFTHg1WUlDWmF4eXg1VE55VFg0b3JQT2JwNHpWT2xmZkFENG9DY3lq?=
 =?utf-8?B?bE1sM3Q2NlkvVHB3Nll1S1lHR2J2S3dGcysvRDVkVksyN0xBMU94dWdicjR0?=
 =?utf-8?B?YlBxVWpZZitZNnhQZ08zMncrQXA3RjZjK3dQSlpBWHRZeFVXZUhGS3B3d0pY?=
 =?utf-8?B?K0V2NDBtMzFHSEwrclRkbzBOVlpyMzJQdlFqR2VZdjJ6QVBXNSt3YWp2VUVY?=
 =?utf-8?B?b3VyaTU2ekQ4amVmRUovSFFDNGtuTXVPT1RuSnNqSEU4VHVuZGdNR0Z4VU9w?=
 =?utf-8?B?R2JYeWxQeS84bXhVNkVSMFBKd1FTeGR3VHRqN0ZJRjFOV0RuUXY0bm1lanBS?=
 =?utf-8?B?dkZEU1BDYkkzUTJuQjZYTFNqTHpxYXZRblNhTzV4QlNXL2oxZFZVSXNMWjE0?=
 =?utf-8?B?YlFSb0pocnU3UEdidzlYQzViWWtYekZjMEFpZThzenRLaGlLcmN3a0Y5ZWxr?=
 =?utf-8?B?QnZoZVFpcWJ4clVNS0xDUk45MWM3ckVMTnhUTHo1WW9qbnNGQ0h2c1MxdExr?=
 =?utf-8?B?VFBDNEQ1cFdMbnBzazFLdFhBRFNMdjNSd0R2bDVSMmhYQ21EcUVDK0J4SHk4?=
 =?utf-8?B?QUMybWZRWU4wVVJVMURwZDJPUXZqTUkwZngwekhvaTBMNGZOZ1RlZjRXeXRN?=
 =?utf-8?B?M2JXUy9LWlJVdFZqWU1WbVZ5Z2o0aGtrWHpncFlpU1lXUU0wYTcvRHppeWpr?=
 =?utf-8?B?NzREVyt4M1VpR0h6K2JjY1Y4WGZidW1Cd2Z2OFZXQkNnUTFnR1E3Tm5lTkJv?=
 =?utf-8?B?ZlVqM2VScE5XL2QzOEg5blVtdWhaZ0FmWWJOeklPNFFocGtKaTZLamJHL2E0?=
 =?utf-8?B?MTJqSFRvSXF4aVo1MXQzM1ZzZmkvREFSbmJIZnVPalI5RXNUTFhNVGhMd1dn?=
 =?utf-8?B?dnI2dHlMakJ5cXdEWTF2Q01EZzhTVGpneGZLQmtSN0ZmdXRPUUg2SmVqM2J6?=
 =?utf-8?B?VDRkeEpURE9HWG9BRWtZUnBsWEZjcWJXK3QwUXkwNmRXMEtGOEVWOVlZaVJh?=
 =?utf-8?B?VEFSOC9JTGNWR01HVkVlZVR5a2Iwa2taWEJZc0lIdUQ2ZkZLZlY4OTBTRHhN?=
 =?utf-8?B?SkVmbVdrZFRYZTFxVC9qOWo2OENoQmt1aFAzVWFxQXQ2VGVFNStxakI5VlRO?=
 =?utf-8?B?ZWtHdFNuaWs5T2g0MU1lN1pQbjlUdi9LSTVCRXVFNFgyU2Rqb1FoUFYyc0tY?=
 =?utf-8?B?RWl6QmNqRkludVd4OVFMUUlhcC9QL0VCUDVBRGJyclh3T0NiVTQ1Qjk4VEYw?=
 =?utf-8?Q?tdxKLw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:39:08.1899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae63c4c-fde1-492d-6a9f-08dde4bf1406
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388
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



On 8/15/25 12:06 AM, Alex Hung wrote:
> This includes a subtests 3dlut_17_12_rgb.
> 
> Signed-off-by: Alex Hung<alex.hung@amd.com>
> ---
>   include/drm-uapi/drm_mode.h |   18 +
>   lib/igt_color.c             |  186 ++
>   lib/igt_color.h             |   10 +
>   lib/igt_color_lut.h         | 4946 +++++++++++++++++++++++++++++++++++
>   lib/igt_kms.c               |    2 +
>   lib/igt_kms.h               |    2 +
>   tests/kms_colorop.c         |   35 +-
>   tests/kms_colorop.h         |   19 +
>   8 files changed, 5217 insertions(+), 1 deletion(-)
>   create mode 100644 lib/igt_color_lut.h
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index fe3e98e20..009bb3e7f 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -891,6 +891,24 @@ enum drm_colorop_type {
>   	DRM_COLOROP_1D_LUT,
>   	DRM_COLOROP_CTM_3X4,
>   	DRM_COLOROP_MULTIPLIER,
> +	DRM_COLOROP_3D_LUT,
> +};
> +
> +enum drm_colorop_interpolation_type {
> +	DRM_COLOROP_TETRAHEDRAL,
> +};
> +

This doesnt seem to be used anywhere, so drop?

