Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26784C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 19:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63F788C3D;
	Fri, 14 Aug 2026 19:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="474+i9Vp";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFE410E596
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 19:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zj9n83eo05szwzJmOpVtV5S2f2JUe4YcUbZP1kJT21CnG7DgXtD3/t2+k0L8N2Ckie08XMweVuYCgD5ldY6sVuHAiRpBnSKQFurYxMED4fhEy3xN+PAJ88AziSY4RyCN68XDqr/fTcUDosGxKnemCNvLbq3L/hu1f3BIRa1J/p8x0Lit8qs9r2svrUyA7gzehe6/eJ9oiMlwAR5dYZtINXHRAqPJz/6Q3Tp20Du/G9xXAfh3jOZGsDFqfC3QxjVRWRJG9ZoW6erlQiXhxpeBh2oySEGzTbEmOE9+MKg7vtWH2sZxQYoHU1dVbZG+sRn4mSF5BPTlvmFc/YCugTX7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgtO/oirAFj2NIMsRA4rYHr4zDaIc2C4SOo7tjkKz3U=;
 b=ud/6L7ahO3FK1pvZeL0g+TcHUUgIawld+TM255hPc0EfSZz3cWrepympRVInPpee/1SRb+P+s/zKev81dIbmEnv7LB4X8x7LvvTQu4qiCbcMkwcVLlNgdmt6bxma+QIQ3UNOZ79X6P0D0g4/lyxMaNdj7z/OjjE32fcTWvMl7dQiyK35QDVwijUe49YgD7KTfNSNXCn3CbcpUfDdlr0WLXzfWDYsdPJtzQWpVrDd8Psjxp6mFhQTjHYurCghpXHEqFwasDU+La6k3XFva0GdNeTHuyxWxaojsvPUGHgAaJwTSb069qEHrjIk14otVNAcJa0fTS/8IHU03pz8qiBj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgtO/oirAFj2NIMsRA4rYHr4zDaIc2C4SOo7tjkKz3U=;
 b=474+i9Vp47Tj91Ds1LAYoxuyxGDhlBbReouAEEFo9izo9vb86uVbqMDkZmiUjzkNnZvJnpYDbWdobIt8TRVEkohftOwY6TDas+A80g1L+13aLtAsh/bFHzyrLUYTTCA6MGnSg0sIOJm4vk8Nm7CSv1wdhwjLdeNAtsZQhY2f7zQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS0PR12MB8414.namprd12.prod.outlook.com (2603:10b6:8:fb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.16; Fri, 14 Aug 2026 19:55:57 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 19:55:57 +0000
Message-ID: <1f3716ec-2347-4c36-abd2-1eef68fe3228@amd.com>
Date: Fri, 14 Aug 2026 13:55:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] lib/igt_color: Refactor transform_pixels for
 input/output FBs and CSC
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260731180200.668795-1-harry.wentland@amd.com>
 <20260731180200.668795-8-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260731180200.668795-8-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::9) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS0PR12MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 93cd3d34-d2a3-4d45-24d4-08defa3e0e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|3023799007|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2SesmKPCgrKykKms3Bgy3MW8H3yXRV1M2D8jXfyXO0AuyQCm8l1zVkKNqp3M7PmknlcUsJZdWG0fNABHFc8NuZkfgupLFfM1o59Domn3fyYj56L/HjEpg0ZQgnBdnNsBTjeOSNc7hbNSF1VID2/usZvQl9wNHIhEciwohrskqAkxrYe60qKZ9hv7zuT8jbMyUxzMav5DrvvIzuWFKAnkWc2qBiTvwxOoTm6Q79tpTM1vxOSalGUud1RUpjjbHHtBKEHOVznrdkqaLRfnR4umy7pGx3ux+sLddkeWT1oAu+GeGm/Je2Jms0oXqIU9djPOhy1jw/TejRdjr1KwtHTkIGQcq1bhcidqZEF4OXPaxoSpEmIfkrXHAEn+ocwJpLcR+pA9PYSImpC9XvoLKWebN+LRpZ6cYak0vhEtR7vOML6uojgCw6zetcavl8j/16cOWq6fgpQkMgBwf6PNai13soeux/zUjW0kfhKVDh+47PVb0JLveZKFOwI81tj9hX2C9a8QHXrJPOG3K2cGvxOoCZyc71GYep1qPNxeN+nCnkRYk4al4+JiQCPhftZdsXv2NxCjhIZuO4oN3vAJaUjmGmhdXtfoDTgnNnpPd8W7qwztP4ngOSD6cD+/eLIMuazPUAC2Jyk8QV9WpM+lT687/q+8bAmfzFLzBQ2+N/2qFUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ci9CVmltSDUxbWxHM1RlMWdRUGkrQURrd3ZHNDNIM0UrMks4VUZUNjJvYW1Y?=
 =?utf-8?B?R1pnczFsZThBV3R3cWtsTjlkckhYMjdKWFYyQU5KdGkreGE1YVkwd1F3aVFJ?=
 =?utf-8?B?OFRwRDQ2Y0JxYU9DYWtIMml4NkQ3WTk2cnZFWFBoZ3RTOHdXanBES1NERjVt?=
 =?utf-8?B?MUFnNDFieHNLSE9jQURTQnBZL2luTHR4cE9MN3IyQU5lb214U2pid0RwSXRS?=
 =?utf-8?B?K1g3S05jU1dzbU00OXRZYVF5enRrNXpIZkQ0UERUY1RZMjFvVmFzVWdVek1L?=
 =?utf-8?B?dnZ1V0c2L2owbGtnbS9oa3NQcHVkV1BBM1ZOVTZhQ3JxbzVVbU5reHVTeGtj?=
 =?utf-8?B?a0dyc3VOS3pKQUlTTGM1VHVjdHJQVWYyQ1AvdEY0eDNqcVNhcWNJSkN5VWJM?=
 =?utf-8?B?OXA1TDZTeUE0VFpHZXpKbERiQXJOTVJqc3pLTGtuM1RPNnFNMFFJTzlBME9j?=
 =?utf-8?B?ejZMdVpZbERGVytQcEgvdzVSV2hyOTBXZU03OExZWjhUa3lyMnQ0VjZ4VDlV?=
 =?utf-8?B?b1NsNFh1cnRlVEQyc1NyMUZPb0dLUHkxMVo4NlBuV3NzY0x6djZ5VXdVRTZ3?=
 =?utf-8?B?ZmRBQ3dySDVxTDl3eUJISTd6clg0ZVZnZ1NKU1laQzVlazJGK3BpQ0FpZURZ?=
 =?utf-8?B?MXpiK3BITnIvSjZEWTlVZFJpTTMzSHZPTkJaMWhiaGd2ck5lK0ZOYnU1aHVD?=
 =?utf-8?B?TDFlQnlLMmtBbDk1M3BIMzczOEhmeDhLVlJSZGJFdEl2aVRISm1RaitYeVF4?=
 =?utf-8?B?amRGUldzekVQcDZrK2JqYWUwOTNJenhLaVNMalRZUFFONDJsMUF6d3NZdUd1?=
 =?utf-8?B?alVBWEtvV2NZelFhSCtROHU4VkJtd0FRS2hXaGM3QUFLbXRJTGN1d3BxTnZI?=
 =?utf-8?B?STRGMnBGeExrMlFVTE91ekdudkNmUkdPRkpOVlFBZ1M3d2hUWmVocHdPQnRT?=
 =?utf-8?B?aVlkQzZQQndpRWN3WVRKSFRRUFJxeHhLL1VnWHJpQmxUQzI3aXV3QWUwamtK?=
 =?utf-8?B?YysraEVqdzhVZUVHSXdRVHhMNk5scjRFTnd3OERBS3FHbHNJSnp3QndENDY5?=
 =?utf-8?B?MDNBZVFTOVpnNzN1eGVVSkdRc09rcXBlbFJLWXc2V2lDSDEyTmN6UjRFU3Mz?=
 =?utf-8?B?MG9FYlRkNHdldTBCOWlLRGhBVnF1VlUwQXB0TmJFazV5WlEyK2g0azlIaDJl?=
 =?utf-8?B?Yk5nRUdiUFZYa0c0VVRhcTgxMTJJcUlMa1VpQXoxWjk5MTJQNnJXM0hPbkxC?=
 =?utf-8?B?WUJ0bWI5Mm9lbjFvRFVIdFJYNVlhMDNOQnA4Zk5uc0RsS3hiMGxmaXJGZlh6?=
 =?utf-8?B?VWM3UWEwUktPTGxCNFhFZ1hEbXdWWnZIb0ZDSmRsUVYrdWttdVdjR29CR3hS?=
 =?utf-8?B?TkdhcFh2MWJMckpXYnY4YzlhczQ3TEFuQitSTFkyOTQ3RXVYM2g1REZyVWhB?=
 =?utf-8?B?ckdMQXlwd3dkRGcxZGlSM2pjUHhGWjF1SUtweS8rSnR2dnJFa2VtVHN1S2dH?=
 =?utf-8?B?eHYwS080d1NtWUNUbUUvdWsxWkw5Mks4aWpFRkdMbU1CQUFtY0xNMmc5eDkx?=
 =?utf-8?B?eTh6ejhOMGlGeXpmUHJaa21nMDdRQTBraWJSZHNacmdwaWY0K1VkL3p6ekhr?=
 =?utf-8?B?cmEvMUNtM3N5NnVEd3M1ZGJ1ZFhZNEhvaU80cnFmZkpaTnBWTFZ0S0hneFBy?=
 =?utf-8?B?eFBQVno1b2lTZDBKdld0azZ1OUJQQnFDaHU5QnZjYXlTTVlXcXpWanorWk00?=
 =?utf-8?B?VzBvbDN3QzNpaXJ0VXFwSEdWT3dJVTE1QThGSjFsYjkxR1AxQlRxcEtRQy9l?=
 =?utf-8?B?S05CNDdMQWRObkh5U0VhZFgyWEhDNktzVE40OFluVmlFVE9BdiszTlFrNW15?=
 =?utf-8?B?UlpuQlR3Y2k5SkxCbURncFZsYkFyZTNMZXdrWmVHMURvTTR1aksxUFF5Uzc2?=
 =?utf-8?B?cTlvOXo1dGJDWVVTd2Y4MThoZjAvVktWWVJmMTY2THY1S0lTUWpzaXJBS25n?=
 =?utf-8?B?MU9XVTJ4QnNHbWlya3gvVjU3bnIzVjRLK2VNWnhUWE4xWDVLNzJuUjB1M0kv?=
 =?utf-8?B?d0hZRDRPWjB3VC95S2ZzTlcyZWZ2bURnRW9nTzFUZ3FpdG01cEdjOGdTazJk?=
 =?utf-8?B?Qm5iYlpWdVR4L1pVUk01czRtY0xzY0E1UlZoVEM3bERlVXNXRmk2WDQ4T3N4?=
 =?utf-8?B?Z1Q3Y0kyS0I5bldjV1hxQVNqSXQyaU0xakRIVHorcFRBZlhIQ1M3d3huZGdN?=
 =?utf-8?B?YjdBTFp2bEhZMjd2emtUL2hqWHQwWFRraW02QTFwVnRMN3pmeHdPZ3FzRjQx?=
 =?utf-8?Q?ZCN5M+89+0KBfNWkN9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cd3d34-d2a3-4d45-24d4-08defa3e0e7c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 19:55:57.5564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nytzi/I3ahjHP6rphHXYAdZIdk6m4I0E3Uvk+Tra75Ldi3MMdRzYpOk0SHMN9FtZ0UxfKpOku8Stm1GyYBhcdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8414
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

On 7/31/26 12:01, Harry Wentland wrote:
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
>   tests/kms_colorop.c |  34 +++++----
>   3 files changed, 160 insertions(+), 50 deletions(-)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index a451f5642bac..582fc6c0c3bc 100644
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
> +		igt_memcpy_from_wc(output_ptr + y * output_stride, output_line,
> +			      output_fb->width * output_cpp);
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
> index 16db0b8ad37f..bdfe312b8124 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -195,15 +195,25 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
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
> +		yuv_encoding = colorops[0]->fixed_matrix_info.encoding;
> +		yuv_range = colorops[0]->fixed_matrix_info.range;
> +	}
> +
> +	igt_color_transform_pixels(input_fb, sw_transform_fb, transforms, i,
> +				   yuv_encoding, yuv_range);
>   }
>   
>   static void colorop_plane_test(igt_display_t *display,
> @@ -217,11 +227,8 @@ static void colorop_plane_test(igt_display_t *display,
>   {
>   	igt_colorop_t *color_pipeline = NULL;
>   	igt_fb_t sw_transform_fb;
> -	igt_crc_t input_crc, output_crc;
>   	int res;
>   
> -	igt_fb_get_fnv1a_crc(input_fb, &input_crc);
> -
>   	/* reset color pipeline*/
>   
>   	set_color_pipeline_bypass(plane);
> @@ -235,18 +242,15 @@ static void colorop_plane_test(igt_display_t *display,
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

