Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFFDC531C9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 07:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D4710E0F4;
	Sat, 25 Jul 2026 07:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F4QHeuz9";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010060.outbound.protection.outlook.com
 [52.101.193.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D495D10E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 07:05:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXLHhhlitKSgh+/4xbv4tvE7eoRLhAuWz8W8k7ULW03wxJaR/9Ex4+SgL3drhxSlP3veDAG27MIVK98tWpRfq5TiubHnXq6vdPM0Fz3O9v2znKmCVMzUtA94JTvC396ahZX5SFfUNaPv+9ijXab1fJA7wtvVsVnws+IqHYDteAVDZ7Txgc7tAe1zFXp+0eTFY1Fj+8Z0Dr/wjYqqr/9R0IDm2EjCZP4qQlOrrArk9U6GvIhE+bAeIPVsVzuZxXPjk9meX4sbtL70b1+k0+nvdOWGo0uT0V8BrXqbt0sM+bm0etYPqL4iK4cfwz5d5nU2reAw03p9Z+DnCgIfbtfqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvXytQ67lJAnh+mdixPbz89hme63Ad5a1L7FNJb5TC8=;
 b=arUVYV/LQCRfpdSfYKldMdJylTrX8/gM2xJOgZBMKq51FnLR/tZIfdglDubOo7xfypa+Y0UehIBJ6luGGV9eJfYHFGvnKZgdTY3miMjgmrkL6hbmYMM2cyQT8RaEglvQ5NY6EiOql/B/rOfTf5hPQ+RJq9lfi1blaCt3BlwXHEbRQTeHi7IxbxEZQiLl+eFHeZPtD5HBIZPHt6Dggm7qorUb6TG92IpFMuGIWXla8RaDLp4FlJkXgdyEivVnvvBWtm/Bf+GTW8whTdTTG4sA5cgPCAB8rzSCTItrzrH5jGi2LS48DJOnKC+JEMKupZb/glKlevpwOWMJ1u/Mmmd33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvXytQ67lJAnh+mdixPbz89hme63Ad5a1L7FNJb5TC8=;
 b=F4QHeuz9yq9NT8Z+J7TzXgodRYE1PFSR1idaphHzPfhIE4XFnl+Rgk+U/f0wRZqhdaHB34EGBdUNCKbiuraRVIrF1HRKLbuoz8vTscosOSQTTQOAHuhp2E6hDLCfAqyg2GR4iWNJVm9uigW8rkAEvdbq7Tw7vxsQS7JZIyAasPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS2PR12MB9664.namprd12.prod.outlook.com (2603:10b6:8:27b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 07:05:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:05:03 +0000
Message-ID: <248fda45-9eb4-46cd-af59-f4d5c7224fff@amd.com>
Date: Sat, 25 Jul 2026 01:05:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] lib/igt_fb: Add YUV color pattern framebuffer
 support
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-6-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-6-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:303:16d::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS2PR12MB9664:EE_
X-MS-Office365-Filtering-Correlation-Id: 60dca378-30c5-4586-a94c-08deea1b0c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4L7314DO7u9S1yWpCIKWsO8sT++mD/aupjXhj75ae1A4YIpOYCLBrk+kXdOlD2pGcMXhhJJefWwJ91ev70n5RpqmYYKCxEd8sNJo6erDKIvwj0X2kT46LZkalEw6sM1PScsEGMiiE2k6j5yiVKsVny09VuL9PGpYRVrPsvfyDoDmgFbhJF0zQY3clmmT+35tLyR+8KJW3rPH1Pfp/TWKbyWGym2xKJIquyp70CzaVJYZOsB2gy3sLfCUQD6f9fCRU1mDBDd13sTUjHti5lf6xga5duyIoV1CmrrC2oP0GlV+en7zKjEFhtZTdgxWE6q1EKcNJnORSzMAoEOUFPjWOGY/w8wM+HWhGOI1+txScUFes2LHBoX7yxO5p4gtVnksLjBaN8yeHl1UZzmb7F3DBwu+WjX9du6r8y2sYdLOjpxinzFAwOfyNLNvtHh7mLvhdo2BBuDUqKHz3wSe0GFAaVAiWiKYq3D7tSrE6JSSoENAR/otpAwWLpBraUsPEP484d+won4fA3uXeStRhUUOaeLVGdT9G4qBIO+HWDGspHl1ZLJ2vEGeyftPkwO6kpZ90D3SCTbT6T4tZClON5mTI/2x9iqFmt9/Ofqpi+I0GvRWHwC+zTc22+cNYYlQzCGicZZx/pUtHLbVs8Yvf0h78WLgcLeZFFJc2KNB3k7wM7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGFHQ3FzMUpGU0NKeHFHd3J2WkFrdTcyVG5kQjhpTGhBWE9OQjlRQVBUbEZX?=
 =?utf-8?B?bnZlZmdsa2JCN3JDSTFYR25aZTBVWmVULzlJVTlZdzNmMlBZSmFuOEF4NHJ1?=
 =?utf-8?B?WjNGdkFmRm9kY212eU40azE3Nm5BTEt0WndsaGljVlYycGgxVWlaaUNOa28y?=
 =?utf-8?B?UkhDTXJKdmg2eCtsYUhBbTJUNXdaaFQ5aStqY1RpNEJXeDBSWmpRQUJlV1Jk?=
 =?utf-8?B?ajNVQ0RaTzF2a3BoQ3kyU0pGeDhIczJRcVEvejBxdzJ2anp5Z1VPOWVXdS9l?=
 =?utf-8?B?dGVja3hvcEhuNHQrQnZDVmc1S2JMdGgyMG5BNXg1QStObHNuV1F5cDA5SmdK?=
 =?utf-8?B?VGtRbVcxbmhzVWNPMnpJczFGdWpjVFlUT0tFUUZGYmhWQjRuQlN5SjcrLzlV?=
 =?utf-8?B?QWVqK0g4YXNpYnhtdWt5MmZ2M3k3M3RyVGlHV0VBYjZ1TVdaOWtyK1FiWEU2?=
 =?utf-8?B?QVd3QWVYZ1VDODVIL09pRDhqd0lEUkMrZWhUWjRmSmxWOHgxSkJkQWR3VXRp?=
 =?utf-8?B?L2ozb09ZOHRTOFdqMnQyUmxNWXBoTis4Z1oyQnZZVGJWZGNTR3VTZ0szdGto?=
 =?utf-8?B?MlpXTHBWK1pQNkJ3Y3MyZmE0TTI1VzZzV25lSUJsYml3ZkRwclU3bTFZUy9h?=
 =?utf-8?B?b3R6SHcxSFE1RnRnWWNQcDlac2JtWkcyd1NXZ1hvRFd2Z21GRS9UT2RIT1BS?=
 =?utf-8?B?MmtabUZUUmZFNk90NWlqSlJaMko1akV5MFdpMm8rWURIU2QzVnlrL21SK0Qr?=
 =?utf-8?B?UWJOVFJCTTRvMlhqQ0hMaGQ0YTh5MXFKOTlJMk8ycENKM3dMc0lQRmFSbEI5?=
 =?utf-8?B?b21aYkllalU0cXNqanoybFk4Zm13VzhZQUxzclVLbmNqbjB4U0tDdDdvdlN0?=
 =?utf-8?B?VGFZNVFLYmMxUTlQNWpiQ2FwazhCY3NHWmtSVVpLNm4welpBOW1CRWYzc25F?=
 =?utf-8?B?azlTdnhUT1dzK1hKbnppTXJaV2pDeE1XK0lSajh6RXE1cEVUSFUvT2FNNk9m?=
 =?utf-8?B?WnRaYjN0dUpITEkwZ1FrMGFoSkFyUHBBTHZCY3g4VnFrZmlVay9MdkFIZ2Yy?=
 =?utf-8?B?SUNwNzJvY2F0bGFWSUV2VWhOM0d4RG5ZT1RDOWgvZGk4N3kvdWNyTUdmWkxD?=
 =?utf-8?B?U3VkYnhVZlJtY2I1OUJUM3VUcGFzcG16VGhCWnU0YURlQUJRS3YxbUsxRXYy?=
 =?utf-8?B?N1B2bk1VaWkrb1VsUlpVWE5CTWF3dVNEWXNDRTVoTzZHdXlPVzd2c1VUdzQ1?=
 =?utf-8?B?N2xhQ0NrL3hidWMxNEJtUjYxNnpzbjZKblpraithQm0wTDA4cjdkdkovQlBC?=
 =?utf-8?B?OWx6U1Y1aW9HalBYUGhuOU90cDIxQ1hoeW9WUnpZaFZsNGFyeWpLQmRTYktC?=
 =?utf-8?B?aXkzdkErU0FUUldvQlo0bnowL1VtWm8yZUVPRmdhYkdGLzBwcWhOaTc1WU1E?=
 =?utf-8?B?eFRBeTNodEk1VzFEMmQ2UmNwWjNwOHZIUUZIUUJzRDI1U3RmNWsvTUswVU9p?=
 =?utf-8?B?VUp5emxqeUxWMFk2Vm01ZEJ2RnVJYUV1d3RZYzRETEw2WnR6c1Z3c2FOcW9G?=
 =?utf-8?B?eUMzVjBpUXppbU1GenN2bmN3ZldNR3dzYUhhQWtQYjRWa21rVUlQenNIRi8z?=
 =?utf-8?B?Zk1PQUVieThrdGoyQUdLOTVqRHo2dUJiN24yWjBsa0NoUzJaUUVubk5EeldY?=
 =?utf-8?B?TmNGZ0YxWC9DL1BKNVpBYm5rb0F4ZDVGSVZXYkh3SkxRbS9ad3JQQkFPMEEx?=
 =?utf-8?B?cklQQ0N5VzZHdW4ySUlERmpXd0F0NVZrbzNvVWhscWZlVFpXOHFyaHNYbi9r?=
 =?utf-8?B?ME1USkRNdmxZejhSWjZzZkw3YVRmQS9VcXEwSS9aL0J3VmtlSExkSnp0Zjgz?=
 =?utf-8?B?ZFliLzJOZlBvZ29na2pFQ0tBbldTVUZ1Sk5jLzZkb2lYeGE2Zy9ETHNxcHpH?=
 =?utf-8?B?N1AwVTd5VGtRTlFIUmlFMWxEbVNLYWxtWnpuZ1R4VVJZZEFnM1ZjbjdWeG9B?=
 =?utf-8?B?OFJZTWFqaU5xb05rbjhwNlh6MklKYStETzl0aDd2bnFHQ0xVbENXUmhEdnh4?=
 =?utf-8?B?VHRsenZ5ME5HMDVSL0lVR1k3ZVRudjdBczBIMlRtU05KV3UzMHV1aTNDTnF6?=
 =?utf-8?B?K081VGZKbTFzdVJWU1ByL2hPamtXdWhiSjRlNkJPL0JWSlJ4a0tNZXdCem1y?=
 =?utf-8?B?NW5LUjUvZ1dKUldVb3VtTmZhNkg1RHNKVE9GQmFQejZUY0IzOTd6WEVVOXo3?=
 =?utf-8?B?ZURRR1RsYmQ5ZloxK3ROVkx2dXlhQlVwaGNFZ09FcHY2ZXI5OUNBTlBZTVkv?=
 =?utf-8?Q?Mu83XhB7zFWFGpsS74?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60dca378-30c5-4586-a94c-08deea1b0c97
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 07:05:03.1216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ujLjrJQKSebqRjTkW9Kectp1Iqh6oyt+rfUptmuiCpIOcKbgntM4Ie8KvRkxKm2WS9DBONXyuQWV80gOkgaJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9664
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
> Add igt_create_color_pattern_fb_yuv() function to create test pattern
> framebuffers in YUV formats. This extends the existing color pattern
> functionality to support YUV testing, handling proper conversion from
> RGB test patterns to YUV color spaces with correct encoding and range.
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_fb.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   lib/igt_fb.h |  6 ++++++
>   2 files changed, 47 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index e623b2f64d7c..6c3b9b0b9208 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2403,6 +2403,47 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
>   	return fb_id;
>   }
>   
> +/**
> + * igt_create_color_pattern_fb_yuv:
> + * @fd: open drm file descriptor
> + * @width: width of the framebuffer in pixel
> + * @height: height of the framebuffer in pixel
> + * @format: drm fourcc pixel format code
> + * @modifier: tiling layout of the framebuffer
> + * @color_encoding: color encoding for YUV formats (e.g., BT.601, BT.709, BT.2020)
> + * @color_range: color range for YUV formats (limited or full range)
> + * @r: red value to use as background, 0.0 for black, 1.0 for red
> + * @g: green value to use as background, 0.0 for black, 1.0 for green
> + * @b: blue value to use as background, 0.0 for black, 1.0 for blue
> + * @fb: pointer to an #igt_fb structure
> + *
> + * This creates a framebuffer for YUV formats with the specified color encoding
> + * and range. Cairo is used to draw the background color and test pattern, with
> + * automatic RGB to YUV conversion based on the specified encoding and range.
> + *
> + * Returns:
> + * The kms id of the created framebuffer on success or a negative error code on
> + * failure.
> + */
> +unsigned int igt_create_color_pattern_fb_yuv(int fd, int width, int height,
> +					     uint32_t format, uint64_t modifier,
> +					     enum igt_color_encoding color_encoding,
> +					     enum igt_color_range color_range,
> +					     double r, double g, double b,
> +					     struct igt_fb *fb /* out */)
> +{
> +	unsigned int fb_id;
> +
> +	fb_id = igt_create_fb_with_bo_size(fd, width, height, format, modifier,
> +					   color_encoding, color_range,
> +					   fb, 0, 0);
> +	igt_assert(fb_id);
> +
> +	igt_paint_test_pattern_color_fb(fd, fb, r, g, b);
> +
> +	return fb_id;
> +}
> +
>   /**
>    * igt_create_image_fb:
>    * @drm_fd: open drm file descriptor
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 8e5907dabed4..213e2d77795d 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -153,6 +153,12 @@ unsigned int igt_create_color_pattern_fb(int fd, int width, int height,
>   					 uint32_t format, uint64_t modifier,
>   					 double r, double g, double b,
>   					 struct igt_fb *fb /* out */);
> +unsigned int igt_create_color_pattern_fb_yuv(int fd, int width, int height,
> +					     uint32_t format, uint64_t modifier,
> +					     enum igt_color_encoding color_encoding,
> +					     enum igt_color_range color_range,
> +					     double r, double g, double b,
> +					     struct igt_fb *fb /* out */);
>   unsigned int igt_create_image_fb(int drm_fd,  int width, int height,
>   				 uint32_t format, uint64_t modifier,
>   				 const char *filename,

