Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E1AC55162
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 17:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55A610F007;
	Thu, 30 Jul 2026 17:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xvkfrhsk";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B626910E1E7
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 17:10:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQmcwxgFQLBV4j3c28gT5l/b+jx8hzsgAw/urmTQ4V1ANq2+GdeAW2juSNQo2bPkN6Mu0FcgnoJGLfDz4HhgT1rQ5rogDyn6O6L8rthUQmQrhQJjpT5+wCHKTEGDAtaJHiOdNsxEbJpf2O1rKhie9+Z3L7L2xwezD9LIL2IDCzDAhL87XZ17MAsu3CBz3piAHFmceyGXI0iBqIAecbZrWv9myVo7vcvk2ikLKb/V6ZO20/+SXjFNCobSfrYZqYg+eXirMiQadvp6EKKa8s2lwwtZlcDzHI0HBxQv6POlQztUKUjSvNGNdJnPf/uyUhrC+tVogV0O7cFIgmwL8hDwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtxUo5vvjMTa3xbbycIxWSleAinrzz7rfflWY6duYrU=;
 b=B1Vlz7bI81EcCgDpvt3ipVeTIH+VVbKXU+MzyltwhWT2GwXIgjYTSMglOSyI6btept6oxOm9YSuJJVbGQVyogpGREYDr4S4vwMas8V1J82YxrQqabh9Rc/d1SWxpcALfgNSEIyhcgZGmw/36sKwpHz/XeTJqiuADAJuXouxTy6VTmBLXzNqgNr49iFcnC9d8lIT3o4JEqiOlTvuxIQAQkRetXIKv85JQ+RY9xlXKxylH2+c4xz2avVeOrUju0Qr8rnyGRpwOHw4JGZI41+WZL4Atai+dZ9XCQW625uzf+IfmzL0xVXEMT98P90bOC4szlXPYCjKzMp2E/2hv5BgkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtxUo5vvjMTa3xbbycIxWSleAinrzz7rfflWY6duYrU=;
 b=XvkfrhskVGT4YiIT3L5lx4ip7kvDxlXYuh4NMUEO8W+bmPNd6XE00qwnSkeJdLdV96PrIC1Yk3o2zvFERulX5sY75SRt2XijfcgCoeI6hnWAA1P3VmrIih/xZ+JWGvaSOPOaLwjLUpaR35vTZ3C1dc8W+IVlguTGbEoqnhO/kC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 30 Jul
 2026 17:09:58 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::bfce:c745:c822:204f%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 17:09:58 +0000
Message-ID: <319708b6-6a71-48c3-a11c-e07c9ad753c9@amd.com>
Date: Thu, 30 Jul 2026 11:09:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] lib/igt_color: Refactor transform_pixels for
 input/output FBs and CSC
To: igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-9-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-9-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::31) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|SJ0PR12MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a4a7fa-77a6-4c76-ec6f-08deee5d61f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|10067099003|56012099006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DnXAMJ2NeeKjh5tApVCwMQSgJOshZRFfkQKYbgUdYOqy6v0bMJ6ljDBd4vzGwVoOhHeb8n7SH/29eZZsqI0sOCF7N7bludhDhAdJDzIxDovDTDp4pfXuH5laPlrsp7ySg3PnWhr8RHPreiNEpiIEw/tJy/8sawuqKr6yl+mjbUmXXVpoS8SOHv8PWRX+M3k/jjJdXmld+7NFQOU6B0cdVxkuODsDMuO4kLuNWg/9w1GKl5onSEuPRSqAyVY3d3LY1JIsrVfkIZIDma8pIQnSr2bbO4aGP022QEvcja8Urxj6Oy98+dwSmdFRbldjSy763kRP3mgJDCQTEeQBGaQdPPp8Rr83NGFgktkHsbSPnAfMcGg5oPIld64UR+I8zDbjcgLmL+uJ0K+3x0cCBHVw1FrIUbb6vgYWemo5JhTT4mChuhgZPg1aetGKZfQy3iMbfOnb1dZ7AvC7hItWuFe+IwhGM4tn7MkNBFBM08yJn0oXwpyxIRkQWEe8qFf/VaKhhnujqkDSb4vL/H/1Lt7CGzuSDBsz6aoYxPvgKKWhGNiYbwyXKYI1y5xGY4oq2H6PX9AdQTDvny8amI5hDZ5+w2c6snPA3zmwbUGE9QdU2TNKz2JWycGRHxO81hpc+V96IbJKwPqakZ0J0iPwE8ZzdMrf38bFVzcr3kYqWkun8rk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(10067099003)(56012099006)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVpEc1BMSVgvYWZnMGVNQjBlWkozQzJtWkI4ZmFydEVHY3dDRDRONkM5RElu?=
 =?utf-8?B?NmpUbDNjSHMvV05hZVF4YzFGaENWWVVFYkhsZjl2R2dqalNQWWRYY05saGsz?=
 =?utf-8?B?UEVERjMyMm0wUDluL3lGT05FV05LbFJ2cEswSFArOG9zMzMyTzh3dHFtSmR3?=
 =?utf-8?B?QmpBaVFtNVBTcC9aeGFNUk9ZbVFrbGJicDFyeEJsVWNkRXN4OER6c2NtUUor?=
 =?utf-8?B?Rk13QUMvZW5OZVNFNWtscGJmcmRPRjNRcHd1K1UzajBIZ0FZL092SGVLZDIx?=
 =?utf-8?B?TGxPUDUzY3NZK2RIclMxdGZSY2hSTWFqcWtES3dHZ1JuY05sOTVGRkhsaWRq?=
 =?utf-8?B?b2V3dUZ3bVFqVVBzU3N3M0VwUldnbFA1NHMyZEpRUGhMdVlhTHlaL09kNEto?=
 =?utf-8?B?NS9ldG9vWVpTbHZ6eXpMUmFlbGo0N0dIQkxNam5BRlRnc2IySU9DNVVkdEdr?=
 =?utf-8?B?ZHprQWJRb3h2TzE5cjhuOXdMdHFJQStabW95NFNXcVNRSWdTQUhWOEUrUUdC?=
 =?utf-8?B?ekFNUytlQjg2K0l5NWw1NE1TUHVqNHBMQU5wT2V4WTNTN2txVnU0Rk1PVktu?=
 =?utf-8?B?SktwZWE3Y3N6c1YwaWl1Qm5GdGRSb2h4bWhGeGhNTU5JODQxZnhWVEdRQXZG?=
 =?utf-8?B?a05ES1FZbXJtQk0zNnZuakl4V0JNTVhGdGpVR2FLTnJzcEloSm5aSE12NXdv?=
 =?utf-8?B?aVBxTmxreGc2b2JHM0JmbUhQc0psMThNWVpjb1MzaXhpWFEycmJCT2RZY3dK?=
 =?utf-8?B?MWp4WVU1WTlubmY3aGJiQmZVUUd3OVYrcThZTTJXT2ZYazBlZHk1YzlTTG1P?=
 =?utf-8?B?bkFHZ2NUNjZGV1g4NDhYNkhCb0JFTjR6TWNpOXdxNmo0aU1lbkpTTUVrRWE0?=
 =?utf-8?B?RmVuZmVXNHFnZDZqRkFzU3lSdXpRKzFxc1FFeWYyazlBZ2dlSHRGZGVPSDdn?=
 =?utf-8?B?VnFuUVg3S0dFQXlKNUhvRHV4MVFJNm03NXpVczhBZW9iOExmTXFabzh5RDZn?=
 =?utf-8?B?emUrNFVmMDI2OEJpV2lsdFZ2SGxCempNUSs4L2ZzL1RvMXFQTFVvY09KS25B?=
 =?utf-8?B?UEtDaDQyMytUOVZsMGhBeXhPdGU3WnFzckIvTEVjTU1ScnQ0OEtWTnlrWWU4?=
 =?utf-8?B?SHJOWG43ajBBUGh1dmtJNFF6cVVTeDlSc0pMQitObXNVNE9hcHRTV3NwaUZQ?=
 =?utf-8?B?U3VzemErekh4N05ESUQwc1hIQnVuZ0ozaXZPRk95aVJBWXVVWHJxeTllU1Nm?=
 =?utf-8?B?ODl5U2lHaG1NQkVhRW5FdnBVa0J6TDY0dW9reWZKUy9nRGxSNnRydlFJNXlK?=
 =?utf-8?B?R3NKZnhaeG1PVkoweHZHc0pLU1c3SkZ6VGVpMkNrOWgzUnpLWWI0T2wvb3pa?=
 =?utf-8?B?bEJ4MklEeGtGbGVoZXV0OUZDTldXMVg1VzNPRzZFODR1Y05xZDJROFVOYXA5?=
 =?utf-8?B?WUt3SWl1ZWg4U0JlNUFHYUJRZG9aL0RwQ093TjZKQjUzRW9ReHFQb3lsOXpv?=
 =?utf-8?B?dDBkOVQ4ZWNlWXVua1ZqZmRKYjd6RncrbytmSFUvL0IzZzRNbXBJRmxPanpN?=
 =?utf-8?B?M041cVZuR2UvYkxObkRUV1FxSC81K09EVDN0TDhvcWFrODVMMm1IenpQbUpK?=
 =?utf-8?B?NmtiS3RzQlF2dDNLLzN6K3d2aVBrZGZBdGs3SnVUYWIvY2EzZk5xelNRaFg3?=
 =?utf-8?B?YVpiQXJLMFIrYUd0WExlRWd3RSt6ZzF1OVcreUlmOU9ybWxZeDdEZU5jT3Fu?=
 =?utf-8?B?WHRTOERaN1c3R08zbFhKYkpwMlVIeTFCMWFzbzFOVTVuTzg2bHB3c09QdzNa?=
 =?utf-8?B?SFpDbkE2Z1JqZ21HMjVFZy81SHFCdHhiRFp4aDRTK285eEdkTUFqL0RudW5B?=
 =?utf-8?B?WVFrK254aGFpeDc1bDdwWVBXOU8wZ1N2V0lHakFyVnlJREFNOVRMakdEWVFo?=
 =?utf-8?B?MXg2YlVJeC9jNThDTUl2NWM5TVh6R3FBTFV3YkxiN0JXUVlWZnVqYVhHaW1s?=
 =?utf-8?B?cjY2NTdTQTR2eXA0ekFqZ3lUK04vZU1rU3VKVERwK2lyUFFNc01EK1lwekRT?=
 =?utf-8?B?N0x0QWw4czhGOXNMekVaRDdMaUFzclNLSExOQTZYV3ltMjAxSEFPWlJHSlF5?=
 =?utf-8?B?OVd3Z1BpdjhPdjRKQXBDSktMMUc1VGx3a0szY2tSK3kzelhYNkZ1Q2wxQkRp?=
 =?utf-8?B?NTRqQk5XbkNlU1pQR0R4SEVJV3h6ZGRUQnYzVVkwbmNKellFNllqYVp2NHNF?=
 =?utf-8?B?QUFkWTVNQStXbDRXc3NOR1JKY0VYbzVoS1djR0xDYTd6d3laTUVqYTFRdTE2?=
 =?utf-8?Q?snhuDONaHhKoQDMYM/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a4a7fa-77a6-4c76-ec6f-08deee5d61f4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 17:09:57.8486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXNA/H7HiqK8z6sJFqn9kJ96IMe2QpXzwreaOdxZv/9X/YPvL7MtTfHARm8RXJPr4fja3zu9cjEwiwQXzIXvkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5673
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



On 6/23/26 11:57, Harry Wentland wrote:
> Refactor igt_color_transform_pixels() to accept separate input and
> output framebuffers, plus optional YUV encoding/range parameters for
> CSC conversion. This enables:
> - Reading from YUV input (NV12/P010) and writing to RGB output
> - Inline YUV-to-RGB CSC using the igt_color_encoding matrix library
> - Skipping the first transform when CSC is applied (since it's done
>    inline via the matrix)
> 
> Update apply_transforms() in kms_colorop.c to extract encoding/range
> from the first colorop when it's a FIXED_MATRIX type, and pass both input
> and output FBs to the refactored function.
> 
> Also update colorop_plane_test() to create sw_transform_fb with the
> output format rather than copying the input FB.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_color.c     | 170 +++++++++++++++++++++++++++++++++++---------
>   lib/igt_color.h     |   6 +-
>   tests/kms_colorop.c |  38 ++++++----
>   3 files changed, 166 insertions(+), 48 deletions(-)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index a451f5642bac..cc425cfe5ac9 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -13,6 +13,7 @@
>   
>   #include "drmtest.h"
>   #include "igt_color.h"
> +#include "igt_color_encoding.h"
>   #include "igt_core.h"
>   #include "igt_x86.h"
>   
> @@ -578,58 +579,159 @@ igt_color_pixel_to_fourcc(uint32_t drm_format, igt_pixel_t *pixel)
>   	return raw_pixel;
>   }
>   
> -int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
> +int igt_color_transform_pixels(igt_fb_t *input_fb, igt_fb_t *output_fb,
> +				  igt_pixel_transform transforms[],
> +				  int num_transforms,
> +				  int yuv_encoding,
> +				  enum igt_color_range yuv_range)
>   {
> -	uint32_t *line = NULL;
> -	void *map;
> -	char *ptr;
> -	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
> -	uint32_t stride = igt_fb_calc_plane_stride(fb, 0);
> +	uint32_t *input_line = NULL;
> +	uint32_t *output_line = NULL;
> +	void *input_map, *output_map;
> +	char *input_ptr, *output_ptr;
> +	int x, y;
> +	int input_cpp = 0;
> +	int output_cpp = igt_drm_format_to_bpp(output_fb->drm_format) / 8;
> +	uint32_t input_stride = 0, output_stride = igt_fb_calc_plane_stride(output_fb, 0);
> +	uint8_t *y_plane = NULL, *uv_plane = NULL;
> +	int y_stride = 0, uv_stride = 0;
> +	bool input_is_yuv = (input_fb->drm_format == DRM_FORMAT_NV12 ||
> +			     input_fb->drm_format == DRM_FORMAT_P010);
> +	bool output_is_yuv = (output_fb->drm_format == DRM_FORMAT_NV12 ||
> +			      output_fb->drm_format == DRM_FORMAT_P010);
> +	struct igt_mat4 csc_matrix;
> +	bool apply_csc = false;
>   
> -	if (fb->num_planes != 1)
> +	/* Validate framebuffer dimensions match */
> +	igt_assert(input_fb->width == output_fb->width);
> +	igt_assert(input_fb->height == output_fb->height);
> +
> +	if (input_is_yuv && yuv_encoding >= 0) {
> +		apply_csc = true;
> +
> +		csc_matrix = igt_ycbcr_to_rgb_matrix(input_fb->drm_format,
> +						     output_fb->drm_format,
> +						     yuv_encoding, yuv_range);
> +	}
> +
> +	/* Validate plane counts */
> +	if (!input_is_yuv && input_fb->num_planes != 1)
>   		return -EINVAL;
>   
> -	ptr = igt_fb_map_buffer(fb->fd, fb);
> -	igt_assert(ptr);
> -	map = ptr;
> +	if (input_is_yuv && input_fb->num_planes != 2)
> +		return -EINVAL;
>   
> -	/*
> -	 * Framebuffers are often uncached, which can make byte-wise accesses
> -	 * very slow. We copy each line of the FB into a local buffer to speed
> -	 * up the hashing.
> -	 */
> -	line = malloc(stride);
> -	if (!line) {
> -		munmap(map, fb->size);
> +	if (!output_is_yuv && output_fb->num_planes != 1)
> +		return -EINVAL;
> +
> +	if (output_is_yuv && output_fb->num_planes != 2)
> +		return -EINVAL;
> +
> +	/* Map input buffer */
> +	input_ptr = igt_fb_map_buffer(input_fb->fd, input_fb);
> +	igt_assert(input_ptr);
> +	input_map = input_ptr;
> +
> +	/* For YUV input, set up plane pointers */
> +	if (input_is_yuv) {
> +		y_plane = input_map;
> +		y_stride = input_fb->strides[0];
> +		uv_plane = y_plane + input_fb->offsets[1];
> +		uv_stride = input_fb->strides[1];
> +	} else {
> +		input_cpp = igt_drm_format_to_bpp(input_fb->drm_format) / 8;
> +		input_stride = igt_fb_calc_plane_stride(input_fb, 0);
> +	}
> +
> +	/* Map output buffer */
> +	output_ptr = igt_fb_map_buffer(output_fb->fd, output_fb);
> +	igt_assert(output_ptr);
> +	output_map = output_ptr;
> +
> +	/* Allocate line buffers for speed */
> +	if (!input_is_yuv) {
> +		input_line = malloc(input_stride);
> +		if (!input_line) {
> +			igt_fb_unmap_buffer(output_fb, output_map);
> +			igt_fb_unmap_buffer(input_fb, input_map);
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	output_line = malloc(output_stride);
> +	if (!output_line) {
> +		free(input_line);
> +		igt_fb_unmap_buffer(output_fb, output_map);
> +		igt_fb_unmap_buffer(input_fb, input_map);
>   		return -ENOMEM;
>   	}
>   
> -	for (y = 0; y < fb->height; y++, ptr += stride) {
> +	for (y = 0; y < input_fb->height; y++) {
> +		/* For RGB input, read line from input buffer */
> +		if (!input_is_yuv)
> +			igt_memcpy_from_wc(input_line, input_ptr + y * input_stride,
> +					   input_fb->width * input_cpp);
>   
> -		/* get line from buffer */
> -		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
> -
> -		for (x = 0; x < fb->width; x++) {
> -			uint32_t raw_pixel = le32_to_cpu(line[x]);
> +		for (x = 0; x < input_fb->width; x++) {
>   			igt_pixel_t pixel;
>   			int i;
> +			int start_transform;
>   
> -			igt_color_fourcc_to_pixel(raw_pixel, fb->drm_format, &pixel);
> +			/* READ from input buffer */
> +			if (input_is_yuv) {
> +				uint32_t raw_y, raw_u, raw_v;
> +				struct igt_vec4 yuv, rgb;
>   
> -			/* run transform on pixel */
> -			for (i = 0; i < num_transforms; i++)
> -				transforms[i](&pixel);
> +				/* Extract raw Y, U, V from YUV input buffer */
> +				igt_color_extract_yuv_pixel(input_fb, x, y, y_plane, uv_plane,
> +							    y_stride, uv_stride,
> +							    &raw_y, &raw_u, &raw_v);
>   
> -			/* write back to line */
> -			line[x] = cpu_to_le32(igt_color_pixel_to_fourcc(fb->drm_format, &pixel));
> +				/* Convert YUV to RGB using pre-computed CSC matrix */
> +				if (apply_csc) {
> +					float rgb_max;
> +
> +					/* Matrix expects raw format values */
> +					yuv.d[0] = raw_y;
> +					yuv.d[1] = raw_u;
> +					yuv.d[2] = raw_v;
> +					yuv.d[3] = 1.0f;
> +
> +					rgb = igt_matrix_transform(&csc_matrix, &yuv);
> +
> +					rgb_max = (output_fb->drm_format == DRM_FORMAT_XRGB2101010) ? 1023.0f : 255.0f;
> +
> +					pixel.r = rgb.d[0] / rgb_max;
> +					pixel.g = rgb.d[1] / rgb_max;
> +					pixel.b = rgb.d[2] / rgb_max;
> +				} else {
> +					igt_color_yuv_to_pixel(input_fb->drm_format, raw_y, raw_u, raw_v, &pixel);
> +				}
> +			} else {
> +				uint32_t raw_pixel = le32_to_cpu(input_line[x]);
> +				igt_color_fourcc_to_pixel(raw_pixel, input_fb->drm_format, &pixel);
> +			}
> +
> +			/* Transform pixel through remaining transforms */
> +			/* Skip first transform if it was a CSC that we already applied */
> +			start_transform = apply_csc ? 1 : 0;
> +			for (i = start_transform; i < num_transforms; i++)
> +				if (transforms[i])
> +					transforms[i](&pixel);
> +
> +			/* write to output buffer */
> +			output_line[x] = cpu_to_le32(igt_color_pixel_to_fourcc(output_fb->drm_format, &pixel));
>   		}
>   
> -		/* copy line back to fb buffer */
> -		igt_memcpy_from_wc(ptr, line, fb->width * cpp);
> +		/* Copy output line to output buffer */
> +		memcpy(output_ptr + y * output_stride, output_line,
> +		       output_fb->width * output_cpp);

Can it be igt_memcpy_from_wc instead of memcpy for consistency?

>   	}
>   
> -	free(line);
> -	igt_fb_unmap_buffer(fb, map);
> +	free(output_line);
> +	free(input_line);
> +	igt_fb_unmap_buffer(output_fb, output_map);
> +	igt_fb_unmap_buffer(input_fb, input_map);
>   
>   	return 0;
>   }
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index 722446400f01..d66cfebc4191 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -72,7 +72,11 @@ void igt_dump_fb(igt_display_t *display, igt_fb_t *fb, const char *path_name, co
>   
>   typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
>   
> -int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
> +int igt_color_transform_pixels(igt_fb_t *input_fb, igt_fb_t *output_fb,
> +			       igt_pixel_transform transforms[],
> +			       int num_transforms,
> +			       int yuv_encoding,
> +			       enum igt_color_range yuv_range);
>   
>   /* colorop helpers */
>   
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 4db83470df22..5cf1f688832f 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -195,15 +195,30 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
>   
>   #define MAX_COLOROPS 5
>   
> -static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
> +static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *input_fb,
> +			     igt_fb_t *sw_transform_fb)
>   {
>   	int i;
> +	int yuv_encoding = -1;
> +	enum igt_color_range yuv_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
>   	igt_pixel_transform transforms[MAX_COLOROPS];
>   
>   	for (i = 0; colorops[i]; i++)
>   		transforms[i] = colorops[i]->transform;
>   
> -	igt_color_transform_pixels(sw_transform_fb, transforms, i);
> +	/* If first colorop is CSC FF, extract encoding/range for sw reference */
> +	if (colorops[0] && colorops[0]->type == KMS_COLOROP_FIXED_MATRIX) {
> +		enum igt_color_encoding encoding;
> +		enum igt_color_range range;
> +
> +		fixed_matrix_type_to_encoding_range(colorops[0]->fixed_matrix_info.fixed_matrix_type_name,
> +					     &encoding, &range);
> +		yuv_encoding = encoding;
> +		yuv_range = range;
> +	}
> +
> +	igt_color_transform_pixels(input_fb, sw_transform_fb, transforms, i,
> +				   yuv_encoding, yuv_range);
>   }
>   
>   static void colorop_plane_test(igt_display_t *display,
> @@ -217,7 +232,7 @@ static void colorop_plane_test(igt_display_t *display,
>   {
>   	igt_colorop_t *color_pipeline = NULL;
>   	igt_fb_t sw_transform_fb;
> -	igt_crc_t input_crc, output_crc;
> +	igt_crc_t input_crc;
>   	int res;
>   
>   	igt_fb_get_fnv1a_crc(input_fb, &input_crc);

input_crc is not used below so it can be removed too

> @@ -235,18 +250,15 @@ static void colorop_plane_test(igt_display_t *display,
>   				NULL);
>   	igt_get_and_wait_out_fence(output);
>   
> -	/* Compare input and output buffers. They should be equal here. */
> -	igt_fb_get_fnv1a_crc(output_fb, &output_crc);
> -
> -	igt_assert_crc_equal(&input_crc, &output_crc);
> -
> -	/* create sw transformed buffer */
> -	res = igt_copy_fb(display->drm_fd, input_fb, &sw_transform_fb);
> +	/* create sw transform buffer with output format */
> +	res = igt_create_fb(display->drm_fd,
> +			    input_fb->width, input_fb->height,
> +			    output_fb->drm_format,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    &sw_transform_fb);
>   	igt_assert_lte(0, res);
>   
> -	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
> -
> -	apply_transforms(colorops, &sw_transform_fb);
> +	apply_transforms(colorops, input_fb, &sw_transform_fb);
>   
>   	if (data.dump_check)
>   		igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");

