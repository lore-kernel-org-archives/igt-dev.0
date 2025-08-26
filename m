Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F80CA0FE7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 16:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274AC10E384;
	Tue, 26 Aug 2025 16:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZuOiIGjs";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B4B10E384
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 16:29:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyGmh+Zzo70tjSDyeOel/yKUEIhNzxF5l7G153m3DhGR2uqPJ5msLPfYT1OUMMGBi4Mc06CEE3PSTV4M/5Oua21Shi21A+E29/ERpXC9Yfw2MAoYg2gexQbL2HgOmWnJ4UxfxK8cM9KUv01C7pB/rgKkytYLKcnmQJyohEeAvghsJn8s4107MQ2xC93znEjOVxN3qaSwIqKt2lxqsBJX3ecKkDFmwgW1Hf0kmUDAevRlI+vp030SiDqbNjk03sgCAHuclGG+HFWTkwZwsUGH+ETAbElvZGTAd+O4hRaQlbaZ0+huu2SC/8C524Fr43ovDazQateMcrekz7ZuXjU3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj+60A3eBfazkv0DdZNbl3m1jfXQ4VmVka966hVrFZo=;
 b=qA2CK/nRJxZmKCq61KOcuHECM0xkqV2ngCHgLn5Ux9B7yGfz15f0V5u9FYI/e/kLrT0Ulywh/Dc6kemtkl+iFugpeM+yLg/Q8ZssEjljlIoYQG3rxcyFgXsCXO5LkfklzwxOGY9+sNCLzNPyWayBct75FR+CVJHCw+zrRGOvWuxMmIkAywQQQQ65f/HkSClhVp4lZe3+I8DnBVmkhs5iGxs8TU3dnB3oD3rd2S/2SeItKwpOglRPHr98hLWZR2LZFae2aPsWdX3kZVNyuMCeZkh7mYUqHkqErJ+iKGjmT+kik/RLpYnECYLKkRH6UIVwXh0g9c6OHWWPVs6a8R+eTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj+60A3eBfazkv0DdZNbl3m1jfXQ4VmVka966hVrFZo=;
 b=ZuOiIGjsLLIqfGSgVPV3dzB3JNy0hhbMp7alCNE4HEVOd5s4lurxIS7Db8ab5DhX7ANrlHascxi1DnCVdwHxmlbycjIkt7mOhNK6u8Yok8846u65LxtgaCdiQ3RjoGLDJRS5UKG20+qDanlQ4utGtlB/DnPOjYJxcTsEeQYuqJA=
Received: from CH2PR18CA0030.namprd18.prod.outlook.com (2603:10b6:610:4f::40)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 16:29:50 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::5a) by CH2PR18CA0030.outlook.office365.com
 (2603:10b6:610:4f::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 16:29:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 16:29:48 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 11:29:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 09:29:47 -0700
Received: from [10.4.12.116] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 11:29:47 -0500
Message-ID: <9a96e6e5-d512-4af1-876e-b4bf1e9893ce@amd.com>
Date: Tue, 26 Aug 2025 12:29:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 11/30] lib/igt_color: Add support for 3x4 matrices
To: <igt-dev@lists.freedesktop.org>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-12-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20250815040659.3321102-12-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b28772-e0fa-4002-2e32-08dde4bdc62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFZCNENtdW50TnZ5bWg5azNDOVFvbDdKa0doZ2pxWDFmUUQ0Yk5mK0xRUDZ0?=
 =?utf-8?B?Z0hQdUJoWkh4R05ENEdpZzQ0bnJJVmFUZHc2MjlJRncwKy9xa0IyNG4vQmhE?=
 =?utf-8?B?STNReVhRUzZiSTRxdEpIV2lUMGlxTnZjWFk4cis1UXFGWmlGWFdrUWxKQU96?=
 =?utf-8?B?cXhyTHg0WHFDVlczNWw4R05MWm81N0dtUEgxZHk2cWxncUtDL1NkQ0VSNHIz?=
 =?utf-8?B?NDVqaGFnQTB1aCtsSU1NS21jS1doUGVzOGs5SnhiWHBJMzZoMHVKQ0pBazJl?=
 =?utf-8?B?YlNOMStJclI5dTh5N3R5cXMzTFlUczQxUWQycHNwMXlFeXR4c1YrbytYNXJE?=
 =?utf-8?B?N1JubTAraWVwcTFmQ3kyeTdqaHFqN3c4dlNvRXZiNzU2UXFCNzRrcm5rNzhI?=
 =?utf-8?B?bThOMXMyZ0l2WTBYcGJOSS8rTjNLMXEvWExWWUc3V3dnbnkzbk81bjdJODVp?=
 =?utf-8?B?ZENGU1ppRFpBbllDd0NXWW1zd3RsU28xeGJ4d3NLMkhUeVUzTmYzMjFoaE1E?=
 =?utf-8?B?VGhPLzUrQXVTcjlDQjdDU3ppOVovR2VjZG9NbUhISXhVMzNVUHp5VzI5ZkNL?=
 =?utf-8?B?U2pqQ21rSk1jeHpqTTkvWkNva2FwaDRkQUJWRSsrZEtIYUo5ODVqRk04eVBI?=
 =?utf-8?B?TEhrQUt3ai8wUENwQVEzVlhYUVpCMVZldDQrdm1EVk83Rkx6ZHQyTk4wMTVt?=
 =?utf-8?B?M3UvWldFcG9WS0czSmVsdE5lRDJQQW9NdUtuMDVjS1V6VjVVUEFsN2FYYWMw?=
 =?utf-8?B?Tm52SUVXazdpNHRobmJleW5ZLzMzZmxha1c5V0xaellkTlVNc1lZcUdyaTdS?=
 =?utf-8?B?dkF0N01iK2lheVcxSmZOR2V6Z1g0UXgyOUZROWdwYkdsZjh2M2JxT3dxNEtN?=
 =?utf-8?B?Ny9WY1lQVzFlMm5XY2tEeS9keUozOTZFV0JNTXl0WXlSUVJDSkVCKzUwVjU0?=
 =?utf-8?B?T3pFUzlXWVFPaUVZVnltdUc5MWlLdERHSjVUVk43K0h3UFYyZ0d2YjE5Rmdv?=
 =?utf-8?B?VVpEZjBVdUpCMlU0TVNNVXluL1pvbDBqbW9HN3dZUW1YQlNPbDF4UVJDRE1V?=
 =?utf-8?B?MGt2R2hWZG1DWEt1d0cyZnNoSUhjaEJObjNpQWFQY0t1TjBSZzJjV1NzdndI?=
 =?utf-8?B?SElvQWRrVlU5WGV4QVFycU80WXhxUWhLMVRFVktnNk9DNnB6V1FFNUFFck1Q?=
 =?utf-8?B?cGQ3eitEUjhyd0tRYnhJQVVkbGhNRXErWmhGWTNlcHlJR2o3Wk85YjFaM2ZH?=
 =?utf-8?B?d0FVQXlWd0RaSVJBWHJGZVBoREdjMmt1YkRaWDB4cW5nMHNpbkdiY0FkMDdh?=
 =?utf-8?B?NGtyR0RjbzhlNTNtcG9laWI3OGlGNlZMZ3lZb1pIWnBXcTQxKy96TVdmZUg1?=
 =?utf-8?B?R2p2NUYyLzh5U1ZBMjRIUTdyTHhER3IzOXcxYml1eU9rcTRMbVN3S2Y0M3gy?=
 =?utf-8?B?SmlmanByVHZKWHBpTkVHRUJNZkVGbkpHSkd4b2lBd0hzY2ZpclBIVG91ajB6?=
 =?utf-8?B?Mk9hcXNjckVicGljNGFXOVNoK2ZWY0k5R1Q0OS9JdFNjU0NjWHhVYWdqaU1o?=
 =?utf-8?B?VUtsendwQUJISUsyS3N4VEJxVWp0a2RUSEMrTmI3ZG1WOHdwZ3JMeVRWR0Fx?=
 =?utf-8?B?bXF1Z01zeXBmeTRhZjR2bjJJTC9OdFJFM1FHbzk0Y0p5UVFOVWxoc0RZU1RD?=
 =?utf-8?B?N05IZDFzZDc5c3VoRjBqVDdOZUdLWUcrdmhzUVBsdjNIWDRlMFFJVS9rU0J6?=
 =?utf-8?B?WUJWbWQycTFnTk1yaW9lcUN3RWdmRHZpMTA3L2hCYnBJNTZ2eFJzVzBzU1Rk?=
 =?utf-8?B?dUF1VmM1R0c3UjY5WUU3S0xWRlQ2UEdHT2E3WU9PNlFNQWQxVGhpQ0hQQXRt?=
 =?utf-8?B?dDZ4VXFkcGtic2ZCbThLM3ZLM3U3T2toc2s3UEdMK1YxZUNuUVFxd09ZSS8x?=
 =?utf-8?B?K3gvbUE1aG5NMCtZekFBamVzS1ZZaWpPd29tODlZeWZ3R0JIWGdXazExR1dn?=
 =?utf-8?B?eWcyaTlicWZlLzlkMkNnd1NKQklEbWhJVU56N3g1a2hSRjI3dlFvZzB1aVN5?=
 =?utf-8?Q?vnylzB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:29:48.0558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b28772-e0fa-4002-2e32-08dde4bdc62a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587
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
> Support 3x4 matrices in color pipeline API.
> 
> Also add a few matrices for testing.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_color.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_color.h | 54 +++++++++++++++++++++++++++++++
>   2 files changed, 140 insertions(+)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index 0e5f391db..bc90fbdca 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -11,6 +11,7 @@
>   #include <errno.h>
>   #include <math.h>
>   
> +#include "drmtest.h"
>   #include "igt_color.h"
>   #include "igt_core.h"
>   #include "igt_x86.h"
> @@ -76,6 +77,62 @@ void igt_color_srgb_eotf(igt_pixel_t *pixel)
>   	pixel->b = igt_color_tf_eval(&srgb_eotf, pixel->b);
>   }
>   
> +static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
> +{
> +	igt_pixel_t result;
> +
> +	memcpy(&result, pixel, sizeof(result));
> +
> +	result.r = matrix->m[0] * pixel->r +
> +		   matrix->m[1] * pixel->g +
> +		   matrix->m[2] * pixel->b +
> +		   matrix->m[3];
> +
> +	result.g = matrix->m[4] * pixel->r +
> +		   matrix->m[5] * pixel->g +
> +		   matrix->m[6] * pixel->b +
> +		   matrix->m[7];
> +
> +	result.b = matrix->m[8] * pixel->r +
> +		   matrix->m[9] * pixel->g +
> +		   matrix->m[10] * pixel->b +
> +		   matrix->m[11];
> +
> +	memcpy(pixel, &result, sizeof(result));
> +
> +}
> +
> +void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel)
> +{
> +	/* apply a 50% desat matrix */
> +	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_50_desat);
> +}
> +
> +void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel)
> +{
> +	/* apply a 50% desat matrix */
> +	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_overdrive);
> +}
> +
> +void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel)
> +{
> +	/* apply a 50% desat matrix */
> +	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_oversaturate);
> +}
> +
> +void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel)
> +{
> +	/* apply a 50% desat matrix */
> +	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_enc);
> +}
> +
> +void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
> +{
> +	/* apply a 50% desat matrix */
> +	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
> +}
> +
> +
>   int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
>   {
>   	uint32_t *line = NULL;
> @@ -142,6 +199,11 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
>   			for (i = 0; i < num_transforms; i++)
>   				transforms[i](&pixel);
>   
> +			/* clip */
> +			pixel.r = fmax(fmin(pixel.r, 1.0), 0.0);
> +			pixel.g = fmax(fmin(pixel.g, 1.0), 0.0);
> +			pixel.b = fmax(fmin(pixel.b, 1.0), 0.0);
> +
>   			/* de-normalize back to 8-bit */
>   			pixel.r *= (0xff);
>   			pixel.g *= (0xff);
> @@ -244,3 +306,27 @@ void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
>   	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
>   	cairo_surface_destroy(fb_surface_out);
>   }
> +
> +void igt_colorop_set_ctm_3x4(igt_display_t *display,
> +			     igt_colorop_t *colorop,
> +			     const igt_matrix_3x4_t *matrix)
> +{
> +	struct drm_color_ctm_3x4 ctm;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
> +		if (matrix->m[i] < 0) {
> +			ctm.matrix[i] =
> +				(int64_t) (-matrix->m[i] *
> +				((int64_t) 1L << 32));
> +			ctm.matrix[i] |= 1ULL << 63;
> +		} else {
> +			ctm.matrix[i] =
> +				(int64_t) (matrix->m[i] *
> +				((int64_t) 1L << 32));
> +		}
> +	}
> +
> +	/* set blob property */
> +	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
> +}
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index 4f34a1b0d..fe0037ae5 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -29,6 +29,47 @@ typedef struct igt_pixel {
>   	float b;
>   } igt_pixel_t;
>   
> +typedef struct igt_matrix_3x4 {
> +	/*
> +	 * out   matrix          in
> +	 * |R|   |0  1  2  3 |   | R |
> +	 * |G| = |4  5  6  7 | x | G |
> +	 * |B|   |8  9  10 12|   | B |

Typo here? 11 instead of 12 above


