Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2C5CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 21:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4746210EBCC;
	Fri, 22 Aug 2025 21:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q/lWzv6D";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4492210EBCC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 21:44:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2KQIHJ916tNWEadnTsWwIAJh1T9/KnLdnVgZuZ6EwASaftagN7YB3uusr0Ni+wTmL5PBmYsskCLeJqYsk+/AtNrq2WdppJWbaq6sPtmyNSjnVb9Ek1fiQdl47eViLfQmhKKmDOtPaRDrS5JcJsx0Z7cb2DP9Adn/JwdnWyMBWDT0OV2w3eG52lj7a6VOGCEPEYKP82yP5wYAwvuSDfbYRFeqKIb4p9XRBsXCu33bJ+xdde/dT2ED+TPCnHoSCunodaGgTxNPr1OJj1A8v/Lb6bGr3gQrHYbnph9UsHF9HAY4KkHupViL5ZunETH7Rfdf8sJja1ciEyTLKH+I6UlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzVpS/5paVZZI/9b5+A59Wf9zVwJMTH4CTT2D31ynE8=;
 b=IYK2sKvXVxo7qmbEpP64SECPDbRbYR2NW09VRl7imtRNA8nATdOjB5Qvn8A9TXhLW47Ysr4y7J+p8BGh8+pBrfQebxM5hKtynz9K2U3u0XwlqtNohUU4mbvEXWYBmZjQ/c0aOGGplWfuLkFInIAym0TdiGXCq5g9lpoH/UuAW6Vp4gvoPSIzH0yu+SGBl0HJAqpxsPqJOFuh5B/1H1IfByGI5axJYs8LKHppQxG6lpX6x3NR4dlqksA5rETpxD+BTebMnpkX7oTX7uUczq4EzsatozcghkTNtOlzVX4NZOvNvE3ZMyMqCTnYzTRiePtIGA6QRcrPAn3NKfhpdgvqDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzVpS/5paVZZI/9b5+A59Wf9zVwJMTH4CTT2D31ynE8=;
 b=Q/lWzv6DNk+k1TDNfkSYp0OuUtPhWSKO2SHwEnzpVXKCdiIy4QI2QKns+KYCMS4DR6oIQdiL5MGlEoZC6SU0PUm9Tk5TEAGwZU6k6H82UMflUx0ne5WQZOQ2w4N2cjb7bw7bAKeKQSA+fhx9KlDaeUIkuRvWZ3uGO+lKWJ+lK9E=
Received: from BY3PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:39b::16)
 by SJ2PR12MB8652.namprd12.prod.outlook.com (2603:10b6:a03:53a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 21:43:58 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::94) by BY3PR05CA0041.outlook.office365.com
 (2603:10b6:a03:39b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.9 via Frontend Transport; Fri,
 22 Aug 2025 21:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 21:43:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:43:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 16:43:56 -0500
Received: from [10.4.12.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 22 Aug 2025 16:43:56 -0500
Message-ID: <39138345-b3dc-49a1-b1ed-a5e391f1c342@amd.com>
Date: Fri, 22 Aug 2025 17:43:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 23/30] lib/igt_color: Add 1D LUT color transformation
 support
To: <igt-dev@lists.freedesktop.org>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-24-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20250815040659.3321102-24-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SJ2PR12MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f4ba53-6920-4098-fbb4-08dde1c4ffcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk9SV0ZDblVIUDZNTjkvNHhWMHFEREoraklGTGlUWGxHWHcyVVBoMTI0SEoz?=
 =?utf-8?B?MGpwRXRqalhPV2FGdEdCUEFjaDlsb093WVk4V1ZrZWlBVVM2NmthK09VMWlo?=
 =?utf-8?B?aFVsN1llZ2lSeVRuUk9pWkxHTXNML2xPeWZSUlRZTlloWHZ6a3MxK1QzZWlk?=
 =?utf-8?B?Q2RIY3VaZVBIYmkzNmhVS082K1BHdXVXejErdHN2UFVYNGRkQWZYSWZINHVF?=
 =?utf-8?B?UFEzQ0VBQU8xRS93SFhKSmZXWUVISGNzWGpiRUxKMGdXem80cnlNLzd0M1d1?=
 =?utf-8?B?WkxYOXl1RWdCRUh5aDg2eHdOWmtUMmgrMlA2K2NMRC9SOFZPU3puaC9xcUVr?=
 =?utf-8?B?SVVhbE1WT0xkZzRDYzRkbGF4V1BNYWVpeTFjcGdHd1J5eDJMK3Aza2s0dm9o?=
 =?utf-8?B?VzEvWGhoVWZMUlRVUGNJNmlrMG5ET0VFR3FnZ0lBNlNpZFlFdnB5ajBqUGhX?=
 =?utf-8?B?VmdNcUthUVpGKzd5K3JDUzQvTzJOOUVwQXlHZERuMUhXbGw5c1N2YWZUN25h?=
 =?utf-8?B?dktyd3BhNGJ3OE1LWGhjUmloTTRBNlVxUlpMOEJaUzk4dG8rc2tCbnIzbUN4?=
 =?utf-8?B?SGJvMm9OOHAybHVaS1ViZzFhNXZ2dzMydXpDY01LODJZUHpOU1hRZGtTZlpw?=
 =?utf-8?B?RVNsN1h1OWtiNXVlWDMwb0JzYVJ2ckxZNFQzbkhlK0pzanpiZEFQMVRyNHQz?=
 =?utf-8?B?bEFEYlJ3MktlSkJ1eWo5S09WMEJ0L0w1WFJhRFdia1VUbnlVRitvRVJ6anA3?=
 =?utf-8?B?bk5NeElycW8rRVlvU1BmWktaQ1lsNkR1alJPeVEvOUU3aC94QWptOForZEZK?=
 =?utf-8?B?NW5yYkNYbGhVb3JoWEQvMUxyUXkyM0Roc3VQVzZqSVJWdGJFc29uQjJZUE5Y?=
 =?utf-8?B?SW5BWWVmdDFodzZ1WnY4NlFtQXZTZnlLNGU0a1lBdFJhUWkxV21aSDhIVXRB?=
 =?utf-8?B?TVgxRzltWitWb2d6K25RZmRlb3RyZFFxM0FaQ3VBbi9oblBEVDBWQ1VCUmZw?=
 =?utf-8?B?RDlobU9yc01VTjFmOHUvRGd3M1IwbVFRdUJvTUEyYUNqeDMvamtpUU15Qy94?=
 =?utf-8?B?MlR0Zk1DMGIzRFVYM1ZvRjlWMU5uSE9salJnVTEzYUpYSGhDd2R2MGxGVzhO?=
 =?utf-8?B?WkJpck5oVC9jemdRT2ZtdVRBQUxQNU9jNm9ETVpMU3p5UnNaaDFMb2J3dERB?=
 =?utf-8?B?dy9aeVZYVkxRdG9GS3BReVRXK3daQ0xCcEdOZm5JRUhna1kwRzVCQ0FIY2w5?=
 =?utf-8?B?S1F4bTJoRkdVTHZDOWtsc1hFMVZKTWtJVmxmcTlYU3BrWnpIZVcxL0hCWjZB?=
 =?utf-8?B?RjhQNWVCQzRwM0tsZVVHRzNQdi9HK21ZL3M4ZlZVeVU1WVhBU1IvdDhIWHNO?=
 =?utf-8?B?VnhBRWFmb0dheHd2OGpEL0VFTzdUYzB4VU9CNjJub0RxaFhBQ0RqOEhpQWt2?=
 =?utf-8?B?VHZUQUNMR1FKejcxMUtHWjhpRzF0bUNIREtOK3dRRFNxYmFMeUgxMTZSeFg4?=
 =?utf-8?B?c3dCUXpPOEMwWlZNa0g3VEgzOERwQTg4TGoyL1l0ejJlOTNxamxwL2xSMlFt?=
 =?utf-8?B?ZHRibk4rT2c3UUVhMGQ1YlBCSDZjbUxMdzdGQU9CaytwWGh6Nkl0ZkIxRFJh?=
 =?utf-8?B?Ylk1K1B2VGprUmpXTjhqc2wrOENrVFJNZVkvU1BaT1hXdVhienhoQmRYUE1E?=
 =?utf-8?B?aVRGN3Z0MXpIamhWdW9VWW9UQ0g4dlZiakxQZlFZWkljU0dCUnZvLzErQ1U0?=
 =?utf-8?B?U3VzRTJuQzJrVFZvQTkrT3RNSWpLdG9CWGI0OGY2NmN4am1uZGY3QktlQnpa?=
 =?utf-8?B?cUs4QkZsNzBNZ0tLQWJTcTJhRkNETTV1UThDaENiK3RmQTZSditzQllPVWdK?=
 =?utf-8?B?dE9tU1lxejhJcXJaYXc3WkVxUVAyaGlNRnhqR1hlNXRFVnNCMmMyRk9pbDJl?=
 =?utf-8?B?SUVFK3cvQVB1MDlmV0RTbE5mSWtSQU54ZWFrdHU1aHc4RkxwM0w2NVVpdXlv?=
 =?utf-8?B?Qlo3M0wxMDhoRmt5a3RtNGgzZEtXeWo2THBXWUhOQ2cyWGhCY2MwUDJWaHJI?=
 =?utf-8?Q?1qIAZE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 21:43:57.6679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f4ba53-6920-4098-fbb4-08dde1c4ffcc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8652
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
> Add definitions and functions for setting 1D LUT on a
> drm_colorop.
> 
> Add support for the SIZE prop of a colorop, as that's
> required for understanding the size of the LUT to
> construct.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   include/drm-uapi/drm_mode.h | 12 ++++++++++++
>   lib/igt_color.c             |  8 ++++++++
>   lib/igt_color.h             | 20 ++++++++++++++++++++
>   lib/igt_kms.c               |  1 +
>   lib/igt_kms.h               |  1 +
>   5 files changed, 42 insertions(+)
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index fce45b5cf..106fbb889 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -874,6 +874,18 @@ struct drm_color_lut {
>   	__u16 reserved;
>   };
>   
> +/*
> + * struct drm_color_lut32
> + *
> + * 32-bit per channel color LUT entry, similar to drm_color_lut.
> + */
> +struct drm_color_lut32 {
> +	__u32 red;
> +	__u32 green;
> +	__u32 blue;
> +	__u32 reserved;
> +};
> +
>   enum drm_colorop_type {
>   	DRM_COLOROP_1D_CURVE,
>   	DRM_COLOROP_1D_LUT,
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index 6a639813f..a58ba0e57 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -428,3 +428,11 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
>   	/* set blob property */
>   	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
>   }
> +
> +void igt_colorop_set_custom_1dlut(igt_display_t *display,
> +				  igt_colorop_t *colorop,
> +				  const igt_1dlut_t *lut1d,
> +				  const size_t lut_size)
> +{
> +	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, lut1d, lut_size);
> +}
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index 9f56536a3..88de8166f 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -17,6 +17,8 @@
>   #include "igt_fb.h"
>   #include "igt_kms.h"
>   
> +#define MAX_COLOR_LUT_ENTRIES 4096
> +
>   struct igt_color_tf {
>   	float g, a, b, c, d, e, f;
>   };
> @@ -37,6 +39,17 @@ typedef struct igt_pixel {
>   	float b;
>   } igt_pixel_t;
>   
> +typedef struct igt_1dlut {
> +	struct drm_color_lut32 lut[MAX_COLOR_LUT_ENTRIES];
> +} igt_1dlut_t;
> +
> +igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
> +} };
> +
> +
> +igt_1dlut_t igt_1dlut_srgb_eotf = { {
> +} };
> +
>   typedef struct igt_matrix_3x4 {
>   	/*
>   	 * out   matrix          in
> @@ -94,11 +107,18 @@ void igt_colorop_set_ctm_3x4(igt_display_t *display,
>   			     igt_colorop_t *colorop,
>   			     const igt_matrix_3x4_t *matrix);
>   
> +void igt_colorop_set_custom_1dlut(igt_display_t *display,
> +				  igt_colorop_t *colorop,
> +				  const igt_1dlut_t *lut1d,
> +				  const size_t lut_size);
> +
>   /* transformations */
>   
>   void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
>   void igt_color_srgb_eotf(igt_pixel_t *pixel);
>   
> +void igt_color_srgb_inv_eotf_custom_lut(igt_pixel_t *pixel);
> +

This is missing implementation. Maybe remove for now ?

>   void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
>   void igt_color_pq_eotf(igt_pixel_t *pixel);
>   
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index d1c23b4a4..bdde2fc72 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
>   	[IGT_COLOROP_TYPE] = "TYPE",
>   	[IGT_COLOROP_BYPASS] = "BYPASS",
>   	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
> +	[IGT_COLOROP_SIZE] = "SIZE",
>   	[IGT_COLOROP_DATA] = "DATA",
>   	[IGT_COLOROP_NEXT] = "NEXT",
>   };
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 2a401cd3b..d0a7ed037 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -374,6 +374,7 @@ enum igt_atomic_colorop_properties {
>   	IGT_COLOROP_TYPE,
>   	IGT_COLOROP_BYPASS,
>   	IGT_COLOROP_CURVE_1D_TYPE,
> +	IGT_COLOROP_SIZE,
>   	IGT_COLOROP_DATA,
>   	IGT_COLOROP_NEXT,
>   	IGT_NUM_COLOROP_PROPS

