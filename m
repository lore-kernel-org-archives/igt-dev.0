Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE4DCA0FE7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 16:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F1C10E0DA;
	Tue, 26 Aug 2025 16:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jSSPBEAD";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4954E10E0DA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 16:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmfK1RcB1ernjxrPJMg8MmzN04tZm9K6HuRG1kJbqDYBxxhDbExI1vAy62S3v6gcNWdKPENwyIE5KqZ1L4m5RFlECUT9KkMVsHHmdko6Hq1i01iJpyyZoiSQOss3NU8jlH+WDyVSzEN7LieTpwoLAqyCtdzRW07lJSKaf9o/+Q0xF+A3p0N+erkfPz7uaik6CQyv+YV166QUYhIiUQmmsgvRPE6DRhW0AYprS3IhHIMit3E72GFOP8tlm0QYTveONirlizhQErb/VMhSpgA49ILYLF2ADAvw4sK76/Dy4JFCVRYaG4aalzAkOHITJE3jq77/EikL+ehvuQSamQ+amQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vqv+1kMCKxHMpaED+88T18mIzJp/L5VTbnX9FF3hqWE=;
 b=KlwjliduKC+JmxnKqaW3a60WtDQdm4zH0JXl6eVVQbG3yVwa91q2sxjjZ/+bKgN4IWH3w8JoYQJsZ1GrtbQR1n8+IizR/7NOPccLrpa8Mj+oX1RtFIu2NDj0K1ZQsQ6k4w3iQIRxljhvjf80HU81tG/6zMNpHe2lbAv9olODAQTRsmz4bs3SQtzRcT7zMydyD9Or5A5mt2LhZsfJ/MMB+iZUHGRuFJxqhyrFpds8204uqcFM71iOXOMZTAvjJcIIiqCYjvvwgKI1dU1c8E/ntNKO8+CjSjvqZoGyo0ipmL3CJvNVG6j/cebrBeZUZdBnDVMMGoIoOfXIGBahlsfHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqv+1kMCKxHMpaED+88T18mIzJp/L5VTbnX9FF3hqWE=;
 b=jSSPBEADp9W99L2vxaybVDySzbj7HZC6sHFgu3DJcUDxS/ocle02/FOvBZwMELtDoFxuWlXYV/pV++j9oAq7lSMQ0eslR3u1gBizpd4KUxBfh1xk9LKF6EPh7iie9OxypmCVLhX5sDeArEH/ZGqIcR9/KZ9CIQhwwPcaW9QmNRk=
Received: from MW4PR04CA0031.namprd04.prod.outlook.com (2603:10b6:303:6a::6)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 16:28:20 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:303:6a:cafe::75) by MW4PR04CA0031.outlook.office365.com
 (2603:10b6:303:6a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Tue,
 26 Aug 2025 16:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 16:28:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 11:28:19 -0500
Received: from [10.4.12.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 11:28:19 -0500
Message-ID: <b8f99aa7-a0fd-459b-a33e-21875f830d0a@amd.com>
Date: Tue, 26 Aug 2025 12:28:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 17/30] lib/igt_color: Support color transform for
 XRGB2101010
To: <igt-dev@lists.freedesktop.org>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-18-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20250815040659.3321102-18-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f5384e-f3ca-4e28-e27a-08dde4bd91c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3M3UEFrVUgwVEsveThiSUJ5ZU1QOERwS3ZKL1YzdDRocDhhUkxIdVVZanho?=
 =?utf-8?B?ZEFiSHVjQ2p0c3NMd09CUjNWNC9yRjVlU0JmZnBCYjJXNWQ2T0g0YXkvQjlX?=
 =?utf-8?B?NjI2bUYvanROZXlZdWJVSjBrNG1HQWl5RTQ0UE5hSTBnMllmWitBdm5JQ282?=
 =?utf-8?B?NkFERlhkUklORnY1Nk9ERk43dFFBMTI3VlpVL1kvWXBmQmFDRng3MGJ5VVpi?=
 =?utf-8?B?OWk1NmhSVEEvMUtBclpKaWFqYUk0ZE1maWZwTEJGdWxEN3lxdVFPK2pTNkM2?=
 =?utf-8?B?YmNvR29udElwSDJ0dzJJMkNQRTlzVytZdndYWkREWHc2dUhVV1dTVVpoWUQx?=
 =?utf-8?B?dDU3Y0IxcW9GTWMranpEbU9kOXBVSGNTSXdOMUEwcGd2R21QcHdVMzlsOHcx?=
 =?utf-8?B?aDNGeW92TWwyWUJqTGZ0TDkzYU9BMmxnNHFwR0gzR292K2dtZVNUYkxJT215?=
 =?utf-8?B?QWxKaUVTWDNVQUJpRmlqenNVdmluVkNGN1pEYnF3dW9pM2JUbWc5eGNCcytX?=
 =?utf-8?B?RHRXdzViMTZRalA3N3I0YVZhWVhEcE5LWlAzb251cWJNU0hNNTE1KzZKZzg5?=
 =?utf-8?B?SlFRWXJEc3pLenE0L2EyYTdYbEJBbVQ0K2VrMFpVUUZUWGZZWVpFdStaNjl5?=
 =?utf-8?B?R3Q4OHdTM3U5OGh3YU5RRFl5N2pER2RLSHdUTStrSnF3Q2dzYzNmajJNMWM0?=
 =?utf-8?B?WnE4VFFiNk95TTkyaXZpL3Z2OFVQbUZxTDBqelJyQ0hIK3BsRS9RRHV4amV3?=
 =?utf-8?B?ZlpTK3NOUzBGZi8vRklsMjVwN3Uxbk1ReGJCbitNU0JGWDBGOFlqS1IrMFpM?=
 =?utf-8?B?RHBUSWtRMEs0R0kwQi8yWlpvblJXR2pTNDNuRldYNHpQYW1lWnh5andSOE5u?=
 =?utf-8?B?ajh0N0dwdVhIMDI4Y0ovYzgvNWtMaDlZbXNCSGp4alJRblVETWZvQWdkTVBy?=
 =?utf-8?B?OHdkVWhkUU5yaEZPd1ptZ2xPQ09nQklIZElMeERKQm5NWS9Fb2tPa1FuckVH?=
 =?utf-8?B?V0daZmlYMWRDSDBvektHVUpsL2d6V0VTM1huaktRV0FDZG84VFpvWEIzYTAx?=
 =?utf-8?B?eDhwZ3lzbWdXNmVOOFBhOHl5aVVQM0RsRjlUTEJrMjNaTXdpQ0ZWNzRoMFIw?=
 =?utf-8?B?Yjk1YU5UQXRBRmhzc01ZdzU3ancrUGo3dHVUR0Uxb2pjeHpxT1B2dGtjYU51?=
 =?utf-8?B?dWNpUVZCTWNzNlRhMGp3VzZGMXdCZHFJU3RValpoZE9wZ09abTFBMVZhNnZJ?=
 =?utf-8?B?a2NZdFdleitlT1NGQW16VEx6VkF2NU9RenlUTDJOWkUrSERDamx1U0tlKzV0?=
 =?utf-8?B?REhNT0s5eEpRSzZsS1I5MkR2K21sZkE1V2o0SGpmc1FvK3o4ckNicmJLblE1?=
 =?utf-8?B?K2NOcTUraWNEYmo0SHFYcDlPOUlpbGJPRmFQUEd3b0xMV3l4UkN2eVAvRkU1?=
 =?utf-8?B?dzBkc01USUx6SUNoQStCRFFwcjlia3U5d01kWlBwZEVIZHpHUlE4M2djOTN0?=
 =?utf-8?B?WW00L0tQNDNHRUlEdTNZTDdZb0VCUXE4N3BhTTZuV3NMUHlBdE9ESW9idXB3?=
 =?utf-8?B?R2JKTzlUbzhWUmZTSzByUEY5d1dKUTdDOVVGbUU1NFI1ZDVFSkdxcVJNZFhq?=
 =?utf-8?B?R280bmZTQUltcGJCdW4vRnpMTmVmTVFka3lyYmlUdDRIMVlLRkRubHJEV2Vj?=
 =?utf-8?B?MGlRWkN3dmNPdzFib3I5a0FkTENGQWpHOEdRN0wyS1dySkg4UVhGWGtUZHRC?=
 =?utf-8?B?L1YzOVIrd2NrZnI4YnFJMEtOakhlSG02ajRDSU1Iek5WMzBvb29seWg3cHdG?=
 =?utf-8?B?Qy9mR0tLM1REWE9HZU5hZDJzbTRDZkNaTkxiQzJsdlZtZTkvaDF6TVNwVlly?=
 =?utf-8?B?OEJOSG1YUzMxWXg5SUpvd2dsZnQzQi9Rei91NG9jcHBzb2NxaVFRN1YxVXZu?=
 =?utf-8?B?aWVFejNteWVCNHVpVWV1YXBJWHlkMmVjQUNRUXBPcG5xdmpTRFhWU2xrWlYv?=
 =?utf-8?B?cy9LeXhhbG5wMG02d09qRG1oRnRXSlduU3gybm1SNCtHRmxxSXprVWQ4ODZy?=
 =?utf-8?Q?WmIgIW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:28:20.0534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f5384e-f3ca-4e28-e27a-08dde4bd91c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241
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
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Support color format XRGB2101010.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_color.c     | 113 +++++++++++++++++++++++++++-----------------
>   tests/kms_colorop.c |   3 ++
>   2 files changed, 73 insertions(+), 43 deletions(-)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index bc90fbdca..adf08fa2a 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -132,6 +132,74 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
>   	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
>   }
>   
> +static void
> +igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *pixel)
> +{
> +	if (drm_format == DRM_FORMAT_XRGB8888) {
> +		raw_pixel &= 0x00ffffff;
> +
> +		pixel->r = (raw_pixel & 0x00ff0000) >> 16;
> +		pixel->g = (raw_pixel & 0x0000ff00) >> 8;
> +		pixel->b = (raw_pixel & 0x000000ff);
> +
> +		/* normalize for 8-bit */
> +		pixel->r /= (0xff);
> +		pixel->g /= (0xff);
> +		pixel->b /= (0xff);
> +	} else if (drm_format == DRM_FORMAT_XRGB2101010) {
> +		raw_pixel &= 0x3fffffff;
> +
> +		pixel->r = (raw_pixel & 0x3ff00000) >> 20;
> +		pixel->g = (raw_pixel & 0x000ffc00) >> 10;
> +		pixel->b = (raw_pixel & 0x000003ff);
> +
> +		/* normalize for 10-bit */
> +		pixel->r /= (0x3ff);
> +		pixel->g /= (0x3ff);
> +		pixel->b /= (0x3ff);
> +	} else {
> +		igt_skip("pixel format support not implemented");
> +	}
> +}
> +
> +static uint32_t
> +igt_color_pixel_to_fourc(uint32_t drm_format, igt_pixel_t *pixel)

Maybe rename this to fourcc?

