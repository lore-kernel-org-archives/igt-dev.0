Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6A7C531F9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 07:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF048825E;
	Sat, 25 Jul 2026 07:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y8iZg3kt";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011002.outbound.protection.outlook.com
 [40.93.194.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D8F8825E
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 07:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMIrY7OZz9b5hbmPR7UJiolUhgvE1fAw2gX6y05qx63/cTBzhH33WYHuvBIikusdgu2I8nRWtqqqycLuOFkUvn6Y36UTQWxaQQ4Y9eommgENbWtpjsOzCbo8R96e4OowPxgQgUXGdehgVK+9a4Pu9nOkTRtQdEZWUHBCvGxdwzm62/7gO/7WyVQnunCyxgh9ltpoNyryIUSr8mZJI6szbBrpQDVuwVgCbCg/RbEiDwa24c+80mAO6QHcblTqk9Cxp4Q3rNKcsnIKOQWsbEgLiBnvr0stL/btnlD/7aKJUbHGrPVxt1OJHNbDcFnpy9dNTK5+0+lxhg7h7j6icBi9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s9WHYScC/d9X2SO1joUGbLPJQ6VrJoyd2r9hiOssJw=;
 b=xBEF2ATL/T9MqwsZ8i7yLBcCBjD6RKwtm6cUip03JoZPjUjyiLch+/rzqiFYmDjU6bTH1Cvnfhr/zHx/CancyqGIIoiNG7NyTc/Qlfocz77eiCI393dJv/vYddoqK5RccfsAzhwQOVA2lL6xkqVKdQvUOBrUDC31/ZxGoEBfPrnh5ENVZldq9ZwhZ1xo++vPyopVL/q+472ha82+NsMVCBp908AC6nrNhhvjLfH15jpb3gdZksO7FqSWoHVq8xnCKcHg+LDsjT+YFCMOxxWEMf5/dsWEotZdaREcZJ+aFISjeidUK0dWXxFwX7z3jvLOLlyA+C19wyncx6608ltG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s9WHYScC/d9X2SO1joUGbLPJQ6VrJoyd2r9hiOssJw=;
 b=Y8iZg3ktPeigATt45sHqfjw5emw5bJndF2V+M+jg013ctnLZXr0TKTlHDNequVXAQJsBDQ4yJICpGKjnGLbo/hbWqW1tDbTfVedAZGjMhE3g46QvPHjQzDpzEklegFHiDM6idJK2s7uU3ogYMYDxzSiPWy+x7kT1T0FzHuzp1V0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN6PR12MB8566.namprd12.prod.outlook.com (2603:10b6:208:47c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Sat, 25 Jul
 2026 07:10:02 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:10:02 +0000
Message-ID: <acb18562-50df-4111-8a04-1ec88493d216@amd.com>
Date: Sat, 25 Jul 2026 01:10:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] lib/igt_color: Add YUV pixel reading support
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-8-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-8-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0352.namprd04.prod.outlook.com
 (2603:10b6:303:8a::27) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN6PR12MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 886a1b19-be9a-4e60-e57b-08deea1bbeea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|10067099003|18002099003|4143699003|6133799003|56012099006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: /6rzqVlofyMc9PshQhqHm+ItBnofVGYzAFjZZfC44rzUDRwhDKPqOsyIIdQVio7ge2KyPCr3hElNMlYy+VXpRy3Fc7j3YmkMTcfINI07/yNOqNe8+9WeBPAoKvL2Kd1eV/72rUSeqVhU53aivWdemgCoXIIOi6BAqleX86GddTbf8/nPQErJo77mKno+ec2sfPZc1bg9gto5Zvq8Q22gDLhXZheVYwXnKwRTPjYKIK5Da982JKHMo1A3yD0YD7TDGMNKlivNy0mQayGBuhVFwSdUdrd6LpyBxgMvQGl5Ny/OC/iN8ZhecAOjQ0r7x66v/aVycyFlZ8QYyZqK8l5MzYGGUhajj68zH82XpKdfIFJ1xKrZ+LT8iK6uF1CtP9dClOg8XLqlMP1WDH045YigWeRaMZ+dUFmHSA56WSGD7PIqniB8dtZHdvKTmMkiluxohHmvKyS5g5GHLcuPicoeZZFEvICR07geZJ9txBk4iIUCKuA5uVKqHQIa2Q48P48oVA/+vqK6flN/hBFGlXGlnUh4b2QUSGSfsYlNNSMY4w6FHUbhheh21VAeaL04UCvo0GDxlNHSUKN1e4o7/Rg5u1ScLnI3OcMQmznndOKyphOadPAqU9DRkwf8Kb4sTXNK9EMHPyBezsCsnKw1yK3MKWl9Xqvq9jhP8hokA2XxYF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(10067099003)(18002099003)(4143699003)(6133799003)(56012099006)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmxDbm5wMU4zcktic1R1WWcrMmNxWmZKeFNyQnBIRE1jSUF3VzR0Z2x6aEE5?=
 =?utf-8?B?YlpNYlJCSmQ4cENsVnY3cHFVSlJKc0VPV1FNRlZRbWZ2b2hWUExKZFp6akhm?=
 =?utf-8?B?VFNRbk56dFV1aHEvTFp0WndncEl1RXVYYm5EYlhuTGt0QkkwMTE0bkI4NmYy?=
 =?utf-8?B?VERDMlI5N0dOMHBvTTVvb3l1QXhOL0lEUUJUM0pqN1dNdjFpQ285S0tJVGFw?=
 =?utf-8?B?bFdYTFRrMGl1d0RqNWdLc0htelhWVjZMdHBvNHFDU2IzM1h6aE9LdHlCdzVX?=
 =?utf-8?B?cUdTdzNUdXZTZXJBRy9DZmhMbDJFR2VlQmgybTdITDl0SmRTTWpFb3V3ZGlE?=
 =?utf-8?B?VVFib0ZQdHcxMi9sRnRjNTZGK0pKNWJEK05PTlkvMlhmTmRkUGsyNXZqRG52?=
 =?utf-8?B?c2luNVF2K1ZXOHYvaWNuVk9QWFZBL2V6d1Jhc3Jac0psLzJHRHMwKzhtUE1n?=
 =?utf-8?B?UVY1eFllRTFTc2hzZDBxeXBveDBTTUZCUFdQdzIzR1Uza29Cc25qbEtjYzZa?=
 =?utf-8?B?SzBhMlcvd3ZLeUFOQWFIVjlXRncvMzJwNjZnajJzbTlxdEJ4eVEzQkgveFFt?=
 =?utf-8?B?RWtpMUpPajFGRGlBb1BkaE45ek5kT0JFYUxHYTBoK3FOdkNVMUdNNVBBNHlJ?=
 =?utf-8?B?bXpBVjNvaHlaalFiY0paTGIwVUx0MnZxbXdQQTFDeUFmem4vS3BjM0wzcis4?=
 =?utf-8?B?Yjk4VENVY0RrUjFNUXFxQUFQWkVGOGRDNkY5bGNHdFFENmJ1VEpBT2tJNnpt?=
 =?utf-8?B?RXZkSmE1OWpBQ1Y1WTlFZHNubUNjeVBWamRTQ091QnErRVBVTy9laGc0Zkpp?=
 =?utf-8?B?c2hhT1kvRVUxRGpjc0E1S0NQNDFDMWdPZEZVb3YvZWJnVmFqMHI1YktGRjJt?=
 =?utf-8?B?VUp6cVR0VWR0bEdWOWQ5OEZtSHR1MmlqWWNZWk5YTk1OZTlKNGVxekVTTy95?=
 =?utf-8?B?M293ZS9ockhJanE0aG9xOGJUVElpMnVLdTEvM2RyNHZ3aktmaXhSTUxZTFpO?=
 =?utf-8?B?OUQ1RklZbXVmalI5K1BXYkNUWWpzOTh3aDF5VnZmRVZPOVhtSmN4cXZYWjZZ?=
 =?utf-8?B?TEZ1Q2tMZGh6NUJxbDRmbTBqdnZKV05Vd2FuYzdrK05IWDE4VFVJcFd1N2w5?=
 =?utf-8?B?ZitvU0pNOWNWL3YxS1pXNzhuUzZZWG04UHpqYUw5Y2hTaFJnRGlFSzY1UDQ1?=
 =?utf-8?B?TXV4N3pKaXQvNnpIOVo0SEdpRjU2SGRiWXdRbEpmSU90YVA0MkU5LytXaGRJ?=
 =?utf-8?B?dTV3alVFTzcvMVRvZFpjYmdlSDM3THljR2Q3WThmVWxycFkzTWp4WStTbmlo?=
 =?utf-8?B?OEVKbGNQSGtlQU0wZDFtaTZreUNRWmF3WmJoc0ZxZ1lJWkw0ZCtjbExTUWYr?=
 =?utf-8?B?L1BmSno1dkFvbk9xenJhakoxdmlGNFgyckVwZDIveGVUTEM4NlBuMVlYMUFX?=
 =?utf-8?B?MmtYR1gzenFkemZtRml1TnZ1S1V1Q3dFeDBwL1U4OWxYUTlKQ1RSL0EvcFBX?=
 =?utf-8?B?Q2tVdDNyS1EwVHNHcnlMTkxmbzJLaHZVVXlRbENIMEord0lnT0dSY3Q1WnpK?=
 =?utf-8?B?TUswWkR3WHF4bjF4aFRLN2YrekVVMWFieURhc3l1QXpZK1d0QWdkVWw0c2Qv?=
 =?utf-8?B?V3cxVm93aUJOaGJjWWFqa1JDcXAwMUNJeXFWSUVnL0ZEMCtMK1FDQ2VQSFQr?=
 =?utf-8?B?Sk50dmozc0tDYWlIT1NoTmFYbE1SVGtndTk4UnZ3Mm5FMXI3SCtBWUZMaVBR?=
 =?utf-8?B?aE5IVmZQTjhaTFRtU0JQeGdSNzcxVDdWNFJSOE1Ra09mSDgzNmpwZFhLd3p3?=
 =?utf-8?B?b0NiK0pzeGNjdDZyT0s0ZzA4ajJWQjJ0L2tCWHBSckl5Znh6YlhORHRTcGpM?=
 =?utf-8?B?YXl1V2tiYldlR3BlQmhzeEFZdHFMTjFIc2owRWxkcjhnd0pja2lJQmx2bC9k?=
 =?utf-8?B?cEJzQ2QrbmdKMjBDZDRpeEZobW81TXdhQzRoMXNWeFhlZm1NQXpuRUhvRW83?=
 =?utf-8?B?K25hWGpxVG8yME00NUxPa1F2ZDQrMnM0aDd5SlVKR2RJOUlnRkVHNDdPMHNo?=
 =?utf-8?B?NTIxUGNFcTRjN0IvNnVPdmpIWXVSQUViOVB1UVh5NFBheEFjcEpKM3VZMnRu?=
 =?utf-8?B?MUptcWI3VlRJcFo0WVpNREg2dmhzdXBxSXp2Y1FpdXBaOUFzZGZBRWxweDZ4?=
 =?utf-8?B?UkE5TUUvaDc5RjA3Nng4UDluajBieWFXb0pkL3RxOWI2MEJOeVA1OEpVczRo?=
 =?utf-8?B?b1JnY0w0MHJDa1Y4LzZMWHNjVFI0OW92aEVlTExCSjNDUG40ZVdZZWlyTVNn?=
 =?utf-8?Q?M9GpSrqcKRIE4nEtZu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886a1b19-be9a-4e60-e57b-08deea1bbeea
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 07:10:02.2945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4xQxSowTP3GwwOQMtfUdQX2ThGvlZaq6MhOiug6nr2oKKXMrmiEEfsenm3Koc5Yak0XJMIDpLZ6TSta31PXOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8566
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 6/23/26 11:57, Harry Wentland wrote:
> Add functions to read YUV pixel values from framebuffers. Supports
> NV12 and P010 formats with proper handling of:
> - Multi-planar Y/UV data layout
> - 8-bit and 10-bit sample depths
> - Chroma subsampling
> 
> This provides the foundation for YUV color transformation testing.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_color.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index 8c405275acf8..a451f5642bac 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -259,6 +259,78 @@ void igt_color_multiply_inv_125(igt_pixel_t *pixel)
>   	igt_color_multiply(pixel, 1 / 125.0f);
>   }
>   
> +/**
> + * igt_color_extract_yuv_pixel - Extract raw Y, U, V values from YUV buffer
> + * @fb: framebuffer
> + * @x: x coordinate
> + * @y: y coordinate
> + * @y_plane: pointer to Y plane
> + * @uv_plane: pointer to UV plane
> + * @y_stride: stride of Y plane
> + * @uv_stride: stride of UV plane
> + * @out_y: output Y value (raw, not normalized)
> + * @out_u: output U value (raw, not normalized)
> + * @out_v: output V value (raw, not normalized)
> + *
> + * Extracts raw Y, U, V component values from a YUV framebuffer at the given
> + * coordinates. Handles 4:2:0 subsampling for UV components. Values are raw
> + * (not normalized) and format-specific.
> + */
> +static void
> +igt_color_extract_yuv_pixel(igt_fb_t *fb, int x, int y,
> +			    uint8_t *y_plane, uint8_t *uv_plane,
> +			    int y_stride, int uv_stride,
> +			    uint32_t *out_y, uint32_t *out_u, uint32_t *out_v)
> +{
> +	if (fb->drm_format == DRM_FORMAT_NV12) {
> +		*out_y = y_plane[y * y_stride + x];
> +		*out_u = uv_plane[(y / 2) * uv_stride + (x / 2) * 2 + 0];
> +		*out_v = uv_plane[(y / 2) * uv_stride + (x / 2) * 2 + 1];
> +	} else if (fb->drm_format == DRM_FORMAT_P010) {
> +		uint16_t *y16 = (uint16_t *)y_plane;
> +		uint16_t *uv16 = (uint16_t *)uv_plane;
> +
> +		*out_y = y16[y * (y_stride / 2) + x];
> +		*out_u = uv16[(y / 2) * (uv_stride / 2) + (x / 2) * 2 + 0];
> +		*out_v = uv16[(y / 2) * (uv_stride / 2) + (x / 2) * 2 + 1];
> +	} else {
> +		igt_skip("YUV pixel format support not implemented");
> +	}
> +}
> +
> +/**
> + * igt_color_yuv_to_pixel - Convert raw Y, U, V values to normalized pixel
> + * @drm_format: YUV format (NV12 or P010)
> + * @raw_y: raw Y value
> + * @raw_u: raw U value
> + * @raw_v: raw V value
> + * @pixel: output pixel structure
> + *
> + * Converts raw Y, U, V component values to a normalized igt_pixel_t structure.
> + * For NV12 (8-bit), normalizes by 255. For P010 (10-bit in upper bits),
> + * shifts and normalizes by 1023.
> + *
> + * Result: pixel->r = normalized Y, pixel->g = normalized U, pixel->b = normalized V
> + */
> +static void
> +igt_color_yuv_to_pixel(uint32_t drm_format, uint32_t raw_y, uint32_t raw_u,
> +		       uint32_t raw_v, igt_pixel_t *pixel)
> +{
> +	if (drm_format == DRM_FORMAT_NV12) {
> +		/* Normalize 8-bit values to [0.0, 1.0] */
> +		pixel->r = raw_y / 255.0f;
> +		pixel->g = raw_u / 255.0f;
> +		pixel->b = raw_v / 255.0f;
> +	} else if (drm_format == DRM_FORMAT_P010) {
> +		/* P010 uses upper 10 bits of 16-bit value */
> +		pixel->r = (raw_y >> 6) / 1023.0f;
> +		pixel->g = (raw_u >> 6) / 1023.0f;
> +		pixel->b = (raw_v >> 6) / 1023.0f;
> +	} else {
> +		igt_skip("YUV pixel format support not implemented");
> +	}
> +}
> +
>   static int
>   igt_get_lut3d_index_blue_fast(int r, int g, int b, long dim, int components)
>   {

