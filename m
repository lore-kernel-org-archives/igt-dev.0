Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CFCCCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 21:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8310E492;
	Mon,  3 Nov 2025 21:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x+R77zum";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010060.outbound.protection.outlook.com [52.101.46.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D0D89CD3
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 21:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grUdnSko9HkkbX3dGJR2PeLfggJG6mptEoEyykl3GuXlWUzQYdbijo30kvCVADuxXBxoKnqs/+1wpNbBuyi+VQOE0bO+yNB5HdSwALkY5OkI6bapQxhpaw5jSGe2MChGa/nq1p7Ov1MAKI6nspATVYvfpqZBEH/lZXmO9xcJ+OzoP9Imf/MQ3KV2DXlz9ZfHwN8HJTo+4uveuGSdLWQkjAAOdGs6qQB8/e/rVo+gIvhoh4ele+2sVBk5QjSv0xWc1zcjbFeIsszQmcPTcvijf5PLMm7Gu22ccXX3AUVZ0VrT7SCEuD6nX5lfBAR/f3YRcUyy5lKJSxMYMDFXdmQW/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxXKrFR41yrleENz9OekWHxhMfxNSkvHkfBiLyN3e7s=;
 b=BwC3h+Hs8auRjRafnhIdRyqdlCCXXSyLqhN6lckXWHt1JSsxMU33vdAe383qYOlDB9o2AVFYPmxesCzEDT3yJ8NZM83//s/W4VlPl9yw1U7ytraFxt3UG5r2DwDPhbzLCiu/M53BLDnl0oQKC8yCQbfBBjmRwGFYaj+1HKGvxI3vZULHZwVmdlSo0cK0IEX7KeyxiYhrxNb1/84GCirMvP5HMZwD9OUChXHSFnDXmvKqH+BO9Vpcvq42kTDc8Va9LT8QkTsYDfGABAYfk2ipwpIKggCrsoNezXogr5pe4oxHyj+6uhCRpBP++xpeTUPC4+5mupLzMrDDNFKNi4b3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxXKrFR41yrleENz9OekWHxhMfxNSkvHkfBiLyN3e7s=;
 b=x+R77zum+j2ljoRrwYulAFfJ1Kg+xqy+F4HGwQWz9ZjBF2ACIaKdB/x9IllKMK9MuWggVPhtbMCa0yxr5iO2HYrg1iOZwAzrECHkdZP4UOC0GIFVmXZjQFW3k+eBiD+zk11Wv6JK6OKg5CUSjQb4ZL7Ow5r3Q4LCl+Ju27rbbFU=
Received: from MN2PR01CA0066.prod.exchangelabs.com (2603:10b6:208:23f::35) by
 MN0PR12MB6056.namprd12.prod.outlook.com (2603:10b6:208:3cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 21:22:12 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::6f) by MN2PR01CA0066.outlook.office365.com
 (2603:10b6:208:23f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 21:23:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 21:22:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 3 Nov
 2025 13:22:05 -0800
Received: from [10.4.13.158] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 13:22:05 -0800
Message-ID: <58e9bfad-b78b-4ea7-be37-f8ad158ce771@amd.com>
Date: Mon, 3 Nov 2025 16:22:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 05/32] lib/igt_kms: Add COLOROP properties and helper
 functions
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-6-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20251030042801.2315866-6-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|MN0PR12MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 283d80d1-e866-4abb-7c37-08de1b1f0d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mjc3YU9GU1V2Y3l1dHlQK3d4Y1JpVmVNU0JpYldTSlhxL0daVi9Fd2tCL3pi?=
 =?utf-8?B?SlAvZ3YxTUhjdVEwT1lIK1FMVDRIdFhMd2NRbE1abXozeXl0SWVwL3NEdkQz?=
 =?utf-8?B?dmlvRWZxUGlUQ3BoMEJDMjkraktvNUJYcmRreHNvZFJZYVFXWWpxK3FFb0Fa?=
 =?utf-8?B?cy9GcitIdU1MZkNNeW9nWEVPY3ZQY0g2TDlEc2JTaTliNXFWOXlDYU5RK2ZK?=
 =?utf-8?B?eGxVM21jNTN1M0gydktlNUlZYU9UQzhoMkpjc0ZRa3hRcW1aOEovbTMrQVZL?=
 =?utf-8?B?aWthL1VaNzlxdE1MenpkZnU3UVNXbk5lME9uOGFla2VzY2prM1p6STdCU0Jo?=
 =?utf-8?B?dExHa21qMWtpRHA4SStNQUFuSmJROGpyRnJ2YnQ0cEVBK0dGVlVFRlFId0dx?=
 =?utf-8?B?dFJrU2R2eEhld0RPd1c1RXVzbi9MR2JJWkpWZ1k5bklmUXpDd25DMDMwNEd4?=
 =?utf-8?B?VHQ3a052SUJSRFdMaXZLOWZpNHppUjRQUk9Yb2RPQkg2YUUvMWVNeVhQdk1S?=
 =?utf-8?B?cGQzc1VWUnJ1MjMvRDc0djB0aDhyZTFSZkZrRXoxNk5vdnJXQzRpaDB0OElD?=
 =?utf-8?B?V2RHM0cvUDhFUGd6L09ZSjM4dk9Qek8vZndOQmJSTG5QUGhXZDg2VTQwbThn?=
 =?utf-8?B?NVNLbzNUZ2thMU5zbFZLVkg2UktnbEpGaHFRVkZZSytqSTRNa3pIYitwSDJ4?=
 =?utf-8?B?Sm1JOUlRdWVhZURGZlpISnpIMUZVWE5NUSs1MGFrRXJHSVNlZXdwK3MvT3Zm?=
 =?utf-8?B?Z3FuWm5JblFDZzJvaFNKQnd1MGFldS82UmFHRWk5ZW1FYURFakJENTJzT1lT?=
 =?utf-8?B?TDZ5U2RpTzlDWWMwc0tZejF1S3ZEL1lmT2sxT0gySHoxVlF6RGI3U3k5Z1Q5?=
 =?utf-8?B?ZWxWRjJCS254NEUwb2c1d29WNzlUQXpXVFh6K2ZJbWJUN2Q1cXRKdWFYekFR?=
 =?utf-8?B?MWxTZlNGbUkxUjBuSUxkSmFWSVRFNkx1Q3AwU0RDTEtpVklGamhvcmtqcDBy?=
 =?utf-8?B?aXFla2k0K0RuUXhmdkcvbGl2NEFrVkI2V0pIMnFxKzdpZ2hmRU0yd3U3d0Zw?=
 =?utf-8?B?RWU3ZVhIMzJDRy9KbDZiQnNvTy9KdVY2ci95Y1lOS3ZtUGZjMnlyeDVlM0VQ?=
 =?utf-8?B?WWw4UWhmc0YyVGdDTGVVdm9YLzlDTzAzMmcweElJd3l2MW8vRkpyTTd3WVF6?=
 =?utf-8?B?RXN2TmwyL2pmd0ZGUFp5Ui9yeUpaZk8rbmp6K1U5NnpZdkRrY2dzdTJNZEJj?=
 =?utf-8?B?cndodkhuUVVRNzIxeGZxTEdHejl5RjF0bXVWZk0vUUJXLzZwN3ZmWGozV1FI?=
 =?utf-8?B?ZU1xZGEwSzVEU2xwN2M4VTdyR1VSK2JDeDUwVHg0MEdGZ21ScmYwWGozOHBl?=
 =?utf-8?B?MFZrZ004NDZqUForT2xySkVwMnA3K3dLcGR2enNQeURaYUVrQ0VrdlliMlpY?=
 =?utf-8?B?OURLbzBIWEkxZWNkVlpLdFZUbXBqaGJ3dWVwM1dEOGtxSk1mbzY2QlZSYlZB?=
 =?utf-8?B?Z1lYOUVxNGxLVEhySkRBOXozVDhsd0V4SC92YzU0U3dmdTJBek5DbUhNRVd6?=
 =?utf-8?B?TGo5UGFEV0dpMmhSUDcydkJ6bnQra3d6TEpMK09qL3U1M0srZndlNGhRem5Y?=
 =?utf-8?B?NjJENlluUE1GM3ZvQnVaU1RxdFJxUlRkcDN3UEtxZGxlZFpoeWVqT1M3WlNK?=
 =?utf-8?B?cndDUWYwZVJOMmRWaFJHSzk5aTFqcHVQaHNrNlZNNVJhN2VkSFBLdkFEN3hI?=
 =?utf-8?B?dkp6WmJCVDBwb095TEdmSkV5bG43cVIyamM2RDlhSVNaaG52L3NWRE5JcWVT?=
 =?utf-8?B?dmJrcDU4bk1QZGRuc0hXeDlIRXVtRUhHQmtXSnJ2N1c5Rm10a0ZiMXBZZ1k1?=
 =?utf-8?B?UEtQRjUvcXI1bmtvZ0VJWkwrNzRqVVRHYnUyQ0dZQldEWmluenVlYUc3Znk2?=
 =?utf-8?B?V2xJeldVbjNlcVBkT1FNZ09UZmdKd1JCRTVNK2pJSXU2Nm9WTWh6YWt3Wkdi?=
 =?utf-8?B?S2lCbmZ1aEN4ZFhzNEtOaVFpeHZORHNrbnhkakVzMzdQa0NpUjFic1I0OEJx?=
 =?utf-8?B?TzlsWStNamRHOUZSUk1tTUIvMXl0cjY4UlZNTnhGS3dmYlBjNjdsRk1pZmxD?=
 =?utf-8?Q?oZl4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(42112799006)(82310400026)(376014)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:22:11.8565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 283d80d1-e866-4abb-7c37-08de1b1f0d95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6056
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



On 2025-10-30 00:27, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
> 
> Introduce colorop properties (TYPE, BYPASS, CURVE_1D_TYPE, NEXT) and
> helper functions for color pipeline API.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  lib/igt_kms.c          | 278 ++++++++++++++++++++++++++++++++++++++++-
>  lib/igt_kms.h          |  89 +++++++++++++
>  tests/kms_properties.c |   3 +
>  3 files changed, 364 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 35c237fde..1305044de 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -92,6 +92,7 @@
>  #define MAX_CONNECTORS 32
>  #define MAX_EDID 2
>  #define DISPLAY_TILE_BLOCK 0x12
> +#define MAX_NUM_COLOROPS 128
>  
>  typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
>  
> @@ -702,6 +703,14 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>  	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
>  	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
>  	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
> +	[IGT_PLANE_COLOR_PIPELINE] = "COLOR_PIPELINE",
> +};
> +
> +const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
> +	[IGT_COLOROP_TYPE] = "TYPE",
> +	[IGT_COLOROP_BYPASS] = "BYPASS",
> +	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
> +	[IGT_COLOROP_NEXT] = "NEXT",
>  };
>  
>  const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> @@ -769,6 +778,109 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
>  	return rotations;
>  }
>  
> +/**
> + * igt_find_colorop:
> + * @display: display on which to look for colorop.
> + * @id: DRM object id of the colorop.
> + *
> + * Returns: An igt_colorop_t if found, or NULL otherwise.
> + */
> +igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
> +{
> +	int i;
> +
> +	/* find corresponding igt_colorop */
> +	for (i = 0; i < display->n_colorops; ++i) {
> +		igt_colorop_t *colorop = &display->colorops[i];
> +
> +		if (colorop->id == id)
> +			return colorop;
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * Retrieve all the properies specified in props_name and store them into
> + * colorop->props.
> + */
> +static void
> +igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
> +		       int num_props, const char * const prop_names[])
> +{
> +	drmModeObjectPropertiesPtr props;
> +	int i, j, fd;
> +
> +	fd = display->drm_fd;
> +
> +	props = drmModeObjectGetProperties(fd, colorop->id, DRM_MODE_OBJECT_COLOROP);
> +	igt_assert(props);
> +
> +	for (i = 0; i < props->count_props; i++) {
> +		drmModePropertyPtr prop =
> +			drmModeGetProperty(fd, props->props[i]);
> +
> +		for (j = 0; j < num_props; j++) {
> +			if (strcmp(prop->name, prop_names[j]) != 0)
> +				continue;
> +
> +			colorop->props[j] = props->props[i];

Should the values[] be read in as well?
> +			break;
> +		}
> +
> +		drmModeFreeProperty(prop);
> +	}
> +	drmModeFreeObjectProperties(props);
> +}
> +
> +static void igt_fill_colorop(igt_display_t *display, igt_plane_t *plane,
> +			     igt_colorop_t *colorop, uint32_t id,
> +			     char *name)
> +{
> +	colorop->id = id;
> +	colorop->plane = plane;
> +
> +	if (name)
> +		snprintf(colorop->name, sizeof(colorop->name), "%s", name);
> +
> +	igt_fill_colorop_props(display, colorop, IGT_NUM_COLOROP_PROPS, igt_colorop_prop_names);
> +}
> +
> +static void
> +igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
> +			       drmModePropertyPtr prop)
> +{
> +	int i;
> +	uint32_t colorop_id;
> +
> +	plane->num_color_pipelines = 0;
> +
> +	for (i = 0; i < prop->count_enums; i++) {
> +		if (prop->enums[i].value) {
> +			igt_colorop_t *colorop = &display->colorops[display->n_colorops++];
> +
> +			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
> +
> +			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
> +			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
> +
> +			/* get all NEXT colorops */
> +			colorop_id = igt_colorop_get_prop(display, colorop,
> +							IGT_COLOROP_NEXT);
> +			while (colorop_id) {
> +				colorop = &display->colorops[display->n_colorops++];
> +				igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
> +				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
> +				colorop_id = igt_colorop_get_prop(display, colorop,
> +								IGT_COLOROP_NEXT);
> +			}
> +		}
> +	}
> +
> +	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
> +
> +}
> +
>  /*
>   * Retrieve all the properties specified in props_name and store them into
>   * plane->props.
> @@ -800,6 +912,9 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
>  		if (strcmp(prop->name, "rotation") == 0)
>  			plane->rotations = igt_plane_rotations(display, plane, prop);
>  
> +		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
> +			igt_fill_plane_color_pipelines(display, plane, prop);
> +
>  		drmModeFreeProperty(prop);
>  	}
>  
> @@ -2594,6 +2709,9 @@ static void igt_plane_reset(igt_plane_t *plane)
>  	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
>  		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
>  
> +	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
> +
>  	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
>  	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
>  	plane->gem_handle = 0;
> @@ -3001,16 +3119,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		igt_assert(plane->drm_plane);
>  
>  		plane->type = get_drm_plane_type(display->drm_fd, id);
> -
> -		/*
> -		 * TODO: Fill in the rest of the plane properties here and
> -		 * move away from the plane per pipe model to align closer
> -		 * to the DRM KMS model.
> -		 */
>  	}
>  
>  	drmModeFreePlaneResources(plane_resources);
>  
> +	/* init colorops */
> +	display->colorops = calloc(MAX_NUM_COLOROPS, sizeof(igt_colorop_t));
> +	display->n_colorops = 0;
> +
>  	for_each_pipe(display, i) {
>  		igt_pipe_t *pipe = &display->pipes[i];
>  		igt_plane_t *plane;
> @@ -3321,12 +3437,15 @@ void igt_display_fini(igt_display_t *display)
>  
>  	for (i = 0; i < display->n_outputs; i++)
>  		igt_output_fini(&display->outputs[i]);
> +
>  	free(display->outputs);
>  	display->outputs = NULL;
>  	free(display->pipes);
>  	display->pipes = NULL;
>  	free(display->planes);
>  	display->planes = NULL;
> +	free(display->colorops);
> +	display->colorops = NULL;
>  }
>  
>  static void igt_display_refresh(igt_display_t *display)
> @@ -3622,6 +3741,8 @@ igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
>  	case IGT_PLANE_COLOR_ENCODING:
>  	case IGT_PLANE_COLOR_RANGE:
>  		return display->has_plane_color_pipeline;
> +	case IGT_PLANE_COLOR_PIPELINE:
> +		return !display->has_plane_color_pipeline;
>  	default:
>  		return false;
>  	}
> @@ -3669,6 +3790,45 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
>  	}
>  }
>  
> +/*
> + * Add colorop properties
> + */
> +static void
> +igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_pipe_t *pipe,
> +	drmModeAtomicReq *req)
> +{
> +	igt_display_t *display = pipe->display;
> +	int i, next_val;
> +
> +	while (colorop) {
> +		LOG(display,
> +		    "populating colorop data: %s.%d\n",
> +		    kmstest_pipe_name(pipe->pipe),
> +		    colorop->id);
> +
> +		for (i = 0; i < IGT_NUM_COLOROP_PROPS; i++) {
> +			if (!igt_colorop_is_prop_changed(colorop, i))
> +				continue;
> +
> +			/* it's an error to try an unsupported feature */
> +			igt_assert(colorop->props[i]);
> +
> +			igt_debug("colorop %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
> +				kmstest_pipe_name(pipe->pipe), colorop->id, igt_colorop_prop_names[i],
> +				colorop->values[i], colorop->values[i]);
> +
> +			igt_assert_lt(0, drmModeAtomicAddProperty(req, colorop->id,
> +							colorop->props[i],
> +							colorop->values[i]));
> +		}
> +
> +		/* get next colorop */
> +		next_val = igt_colorop_get_prop(display, colorop,
> +						IGT_COLOROP_NEXT);
> +		colorop = igt_find_colorop(display, next_val);
> +	}
> +}
> +
>  /*
>   * Properties that can be changed through legacy SetProperty:
>   * - Obviously not the XYWH SRC/CRTC coordinates.
> @@ -4116,6 +4276,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
>  					plane->drm_plane->plane_id, plane->props[prop]);
>  }
>  
> +/**
> + * igt_colorop_get_prop:
> + * @colorop: Target colorop.
> + * @prop: Property to check.
> + *
> + * Return current value on a colorop for a given property.
> + *
> + * Returns: The value the property is set to, if this
> + * is a blob, the blob id is returned. This can be passed
> + * to drmModeGetPropertyBlob() to get the contents of the blob.
> + */
> +uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
> +{
> +	igt_assert(igt_colorop_has_prop(colorop, prop));
> +
> +	return igt_mode_object_get_prop(display, DRM_MODE_OBJECT_COLOROP,
> +					colorop->id, colorop->props[prop]);
> +}
> +
>  static bool igt_mode_object_get_prop_enum_value(int drm_fd, uint32_t id, const char *str, uint64_t *val)
>  {
>  	drmModePropertyPtr prop = drmModeGetProperty(drm_fd, id);
> @@ -4204,6 +4383,44 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
>  	return !(prop->flags & DRM_MODE_PROP_IMMUTABLE);
>  }
>  
> +/**
> + * igt_plane_is_valid_colorop:
> + * @plane: Target plane.
> + * @colorop: Colorop to check.
> + *
> + * Returns: True if the given @colorop is a valid color pipeline on
> + * the given @plane
> + */
> +bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
> +{
> +	int i;
> +	bool found = false;
> +
> +	for (i = 0; i < plane->num_color_pipelines; i++) {
> +		if (plane->color_pipelines[i] == colorop) {
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	return found;
> +}
> +/**
> + * igt_plane_set_color_pipeline:
> + * @plane: Target plane.
> + * @colorop: Colorop to set as color pipeline.
> + *
> + * This function sets the given @colorop as color pipeline on @plane, or fails
> + * the test if it's an invalid color pipeline for the plane.
> + */
> +void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
> +{
> +	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
> +
> +	plane->assigned_color_pipeline = colorop;
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
> +}
> +
>  /**
>   * igt_plane_replace_prop_blob:
>   * @plane: plane to set property on.
> @@ -4236,6 +4453,51 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
>  	igt_plane_set_prop_changed(plane, prop);
>  }
>  
> +/**
> + * igt_colorop_try_prop_enum:
> + * @colorop: Target colorop.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * Returns: False if the given @colorop doesn't have the enum @prop or
> + * failed to set the enum property @val else True.
> + */
> +bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
> +			       enum igt_atomic_colorop_properties prop,
> +			       const char *val)
> +{
> +	igt_display_t *display = colorop->plane->pipe->display;
> +	uint64_t uval;
> +
> +	igt_assert(colorop->props[prop]);
> +
> +	if (!igt_mode_object_get_prop_enum_value(display->drm_fd,
> +						 colorop->props[prop], val, &uval))
> +		return false;
> +
> +	igt_colorop_set_prop_value(colorop, prop, uval);
> +	return true;
> +}
> +
> +/**
> + * igt_colorop_set_prop_enum:
> + * @plane: Target plane.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * This function tries to set given enum property @prop value @val to
> + * the given @colorop, and terminate the execution if its failed.
> + */
> +void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
> +			       enum igt_atomic_colorop_properties prop,
> +			       const char *val)
> +{
> +	bool result = false;
> +
> +	result = igt_colorop_try_prop_enum(colorop, prop, val);
> +	igt_assert(result);
> +}
> +
>  /**
>   * igt_output_get_prop:
>   * @output: Target output.
> @@ -4508,6 +4770,10 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
>  
>  			if (plane->changed)
>  				igt_atomic_prepare_plane_commit(plane, pipe_obj, req);
> +
> +			if (plane->assigned_color_pipeline)
> +				igt_atomic_prepare_colorop_commit(plane->assigned_color_pipeline,
> +								  pipe_obj, req);
>  		}
>  
>  	}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c8923127a..14152fad5 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -366,9 +366,18 @@ enum igt_atomic_plane_properties {
>         IGT_PLANE_HOTSPOT_Y,
>         IGT_PLANE_SIZE_HINTS,
>         IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_PLANE_COLOR_PIPELINE,
>         IGT_NUM_PLANE_PROPS,
>  };
>  
> +enum igt_atomic_colorop_properties {
> +	IGT_COLOROP_TYPE,
> +	IGT_COLOROP_BYPASS,
> +	IGT_COLOROP_CURVE_1D_TYPE,
> +	IGT_COLOROP_NEXT,
> +	IGT_NUM_COLOROP_PROPS
> +};
> +
>  /**
>   * igt_plane_prop_names
>   *
> @@ -377,10 +386,20 @@ enum igt_atomic_plane_properties {
>   */
>  extern const char * const igt_plane_prop_names[];
>  
> +/**
> + * igt_colorop_prop_names
> + *
> + * igt_colorop_prop_names contains a list of colorop property names,
> + * as indexed by the igt_atomic_colorop_properties enum.
> + */
> +extern const char * const igt_colorop_prop_names[];
> +
>  typedef struct igt_display igt_display_t;
>  typedef struct igt_pipe igt_pipe_t;
>  typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
>  
> +#define IGT_NUM_PLANE_COLOR_PIPELINES 4
> +
>  typedef enum {
>  	/* this maps to the kernel API */
>  	IGT_ROTATION_0   = 1 << 0,
> @@ -406,6 +425,20 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
>  	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
>  }
>  
> +typedef struct igt_plane igt_plane_t;
> +
> +typedef struct igt_colorop {
> +	uint32_t id;
> +	igt_plane_t *plane;
> +
> +	char name[DRM_PROP_NAME_LEN];
> +
> +	uint64_t changed;
> +	uint32_t props[IGT_NUM_COLOROP_PROPS];
> +	uint64_t values[IGT_NUM_COLOROP_PROPS];
> +
> +} igt_colorop_t;
> +
>  typedef struct igt_plane {
>  	/*< private >*/
>  	igt_pipe_t *pipe;
> @@ -443,6 +476,11 @@ typedef struct igt_plane {
>  	uint64_t *async_modifiers;
>  	uint32_t *async_formats;
>  	int async_format_mod_count;
> +
> +	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
> +	int num_color_pipelines;
> +
> +	igt_colorop_t *assigned_color_pipeline;
>  } igt_plane_t;
>  
>  /*
> @@ -501,9 +539,11 @@ struct igt_display {
>  	int log_shift;
>  	int n_pipes;
>  	int n_planes;
> +	int n_colorops;
>  	int n_outputs;
>  	igt_output_t *outputs;
>  	igt_plane_t *planes;
> +	igt_colorop_t *colorops;
>  	igt_pipe_t *pipes;
>  	bool has_cursor_plane;
>  	bool is_atomic;
> @@ -846,6 +886,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
>  				    enum igt_atomic_plane_properties prop,
>  				    const char *val);
>  
> +
> +
> +extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
> +
> +extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
> +
> +/**
> + * igt_colorop_has_prop:
> + * @colorop: colorop to check.
> + * @prop: Property to check.
> + *
> + * Check whether colorop supports a given property.
> + *
> + * Returns: True if the property is supported, otherwise false.
> + */
> +static inline bool
> +igt_colorop_has_prop(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
> +{
> +	return colorop->props[prop];
> +}
> +
> +uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop);
> +
> +#define igt_colorop_is_prop_changed(colorop, prop) \
> +	(!!((colorop)->changed & (1 << (prop))))
> +
> +#define igt_colorop_set_prop_changed(colorop, prop) \
> +	((colorop)->changed |= 1 << (prop))
> +
> +#define igt_colorop_clear_prop_changed(colorop, prop) \
> +	((colorop)->changed &= ~(1 << (prop)))
> +
> +#define igt_colorop_set_prop_value(colorop, prop, value) \
> +	do { \
> +		colorop->values[prop] = value; \
> +		igt_colorop_set_prop_changed(colorop, prop); \
> +	} while (0)
> +
> +
> +extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
> +				      enum igt_atomic_colorop_properties prop,
> +				      const char *val);
> +
> +extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
> +				      enum igt_atomic_colorop_properties prop,
> +				      const char *val);
> +
>  extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
>  					enum igt_atomic_plane_properties prop,
>  					const void *ptr, size_t length);
> @@ -1291,4 +1378,6 @@ uint32_t igt_get_connected_output_count(igt_display_t *display);
>  
>  drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
>  
> +igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
> +
>  #endif /* __IGT_KMS_H__ */
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index e646b8184..3bdf23aad 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -112,6 +112,9 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
>  			return true;
>  		break;
>  	case DRM_MODE_OBJECT_PLANE:
> +		if (!has_color_pipeline && !strcmp(name, "COLOR_PIPELINE"))
> +			return true;
> +
>  		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE"))
>  			return true;
>  

