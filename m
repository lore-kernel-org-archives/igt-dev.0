Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51538CCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 21:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2C10E223;
	Mon,  3 Nov 2025 21:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Blaa4qb";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0341410E223
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 21:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfB/iP/w1vG4ZkWK+RZ5gGfbeYHTt0QOoaPtYmwUX6w4gTEXMih1NDUsrA1cYNwW+hrpV0jd941FyX7deXOV9nkgldYQc8A00f5PjppnPUQ82diQedWnJMJeuZwIeEGIVrlD4ozVlqQAHZ6KCxYWg7FadlYKly9CQtuf08TLxOzNt9HlyyOESC/l5t0tHGMoRssCGJvhu6Q3YcOlrkUsY6rOuKMS2gdWY/bAAjnsqjhfGoy2NNmpFl4ypyORlm65XbhO696oxEtyiVQXh8K1uQ3sBgjxDpg98jiSL+VQsuPuH6lFHK2FhlGK2EIFosuaZl6U/CzUYbMeaWxeKBVlfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psaQS4kaRtKt11uYd8TqKoRAxsbuwGWFAY/TT4kCaRw=;
 b=CqzoOz9DCCrMEju4B4EDvqA8qjZEkec5e7kOYzke/QvDm7qLcIXI9Ok1HYf12eI6Rfcrdbykslg3JDK1uyzX5ZG3nLrtmmPvhKohzopuEy6ISmCeTrL2Oo/olwYOzy11A9qIV7qUMHoezumZuuEP+sA44x162IQUOeVank/B5ellrmU61eLEus86FRVnPH/QT8iaXQ02UIHShIwgFxAQB4MUvyBifqaXtOY5AtBNWKmEvV1LL+oaf3ea224ZDj1s4V/HyecPae/5a4J+TMhFAyeUt4w4kTYvdiV32ed+Om502chWsHr7cwsP3hJ2DVJdmvDDyT0Lg/yI7vXdfBkXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psaQS4kaRtKt11uYd8TqKoRAxsbuwGWFAY/TT4kCaRw=;
 b=4Blaa4qbryucBmwJaOkmUEGxxbsFYhC1T57IjiYly5tjxxY1yNFjdi1UvTnt7zHNDvZHIKaZ2rVHuZrBkgHbB1L+PbRL89rv1HshHVHXVHPVa0REWyeUH9T5w4RW3Y+Ghlnmhx+tzL/5qZ3tG/1tJauPvvDkOuX7Gzf5fRozyW0=
Received: from SA1PR05CA0011.namprd05.prod.outlook.com (2603:10b6:806:2d2::13)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:53:11 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:2d2:cafe::27) by SA1PR05CA0011.outlook.office365.com
 (2603:10b6:806:2d2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 21:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 21:53:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 3 Nov
 2025 13:53:10 -0800
Received: from [10.4.13.158] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 13:53:10 -0800
Message-ID: <fc709df4-1591-4125-bad0-6a77acf17d2c@amd.com>
Date: Mon, 3 Nov 2025 16:53:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 08/32] lib/igt_fb: Add igt_copy_fb function
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-9-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20251030042801.2315866-9-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 070ceee0-4e7a-4a52-b60f-08de1b23618f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|42112799006|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFNtQXlLaC9IWmpLR0g2cEhsY2JvUndhT1RrNlpHSy9ERnE4cFkwclllUGE2?=
 =?utf-8?B?WEdLL2tzdlZlOGNMOHU3bmdZRDh3eTJybFlPMHZTNllpeGk0dlBMQnRpOE1o?=
 =?utf-8?B?ZThHMVQ3cGk1Nm9keXNiU1h6bGR0dlMzMkI0ZU9FVTIvYXYvTTFZVjlpbmJn?=
 =?utf-8?B?RGxkZWUvazlDZU51RkJOYkpNYStMU2c0N3ZlM1pBbzc1MXYxdXRpSDVvSnRT?=
 =?utf-8?B?SERxL1NXdGR4NG01OGNKQlB1U1dEZ211WXh5d0pJcnhKL0NMTHRXOWJvMml1?=
 =?utf-8?B?bVZhOFliZU9ISmgwMXUreHI4VTdyRlFNNEdMdERZS3FWVnNSNEJhaC9CMk05?=
 =?utf-8?B?S2xucHRkYU5jbnp3S3E2dDV0MFJ5OGlBOXprY1p2MTJvcVJSYzFBL2Rna3lX?=
 =?utf-8?B?V2QxdjBnYmdFdDhFQ3NYL3dwQlZVcmRaU2NGSUI5dFhQOUVlanowS1dDZlVJ?=
 =?utf-8?B?S25VVVN0OWRvZTRpL1IyY0xuWkkvMGc1c2VFL0o4R2JWV0xBTGJFUytERE52?=
 =?utf-8?B?blBQVTVrRmJYSjl2eG9YNTByR2I4VVRXM2dUem50QjZmMVZjNWxCSHRMK0Fi?=
 =?utf-8?B?RlJCR0g0SmFKKzQwSC9Xd0ZhS2J2Z0NENU5SRlg5bG0wWVhqRHlReUcrOWx1?=
 =?utf-8?B?K09uOU5LamZ2cXBCKzh0T2RnZWdrUlNBTXJWZllpcW9XYWdqdnp1bjhDYTU4?=
 =?utf-8?B?RlB1QUw0aTgrbmNIK0pubjI0djJKTktyeG5rYU82UGtsM21CYmtZQ1hYSSt5?=
 =?utf-8?B?c3VxOGtiRzg5SjVRSFd6b0VPalZrWjBraHFGREFvUzE3RWhmZTBReFA2T0N5?=
 =?utf-8?B?eDdlVk44MXJwQWx2S0JNUkRwYWJnNzg0bXNlVG02L2svUGR1ZXdjWFJhSUZ0?=
 =?utf-8?B?cnE4MnZWc3hYdURzemg5QzZ3QVVEazUzTFphRXg3bEg1QlU4K1NNSCtLZzd2?=
 =?utf-8?B?dFhRUnpidEc2M0hkYVJXRDZ3VDVjUHo1Wkx1TkM0VVVTMUtrUnRnUjB3aEc5?=
 =?utf-8?B?UmtXd3Q5UXBEbmlVeUZQQTZIRCtCd0JsSG1MT1pOa05RLytTdnk5TUl4TEIw?=
 =?utf-8?B?YXRmdjJONWpuMGttMGhqUG9HeHIvYnlGTHk2VDk4RnZnRDBDNUM5TCtkcE1O?=
 =?utf-8?B?bFhrcVJ2WnV5M1lKSUlGYmNveHZyUGxkY3BGU1lQYmZsZ2NFUVVCVnp2cWRj?=
 =?utf-8?B?M25HOERBaEtVbkpva0R2WGJsTGRkdTJmUzBXQmpNbWtJRmRwTnFreXVpTjZz?=
 =?utf-8?B?bDRHaER0ZXdhTlBONm01cHBZczAwbTBnT2R2SnR4eE91eDc5OVV6UWNMR2RV?=
 =?utf-8?B?Mk0xY0owM0pSd1luMUxUUFlIZDY5Ly9ieDBYV2hLcnk0blBNSHJPTHloYWNV?=
 =?utf-8?B?U3lnS1FGdWxNNXJSRVJ3bUJpZVN4SjhOZ1dUTE9PUnc3ZklNVEpFSjJ5eEFs?=
 =?utf-8?B?Lzl3M1RRdWVvTnl1cG82NFBzN3ZTLzhOZUdRdlhlYytGU3Y4WHNXbHJPVFV3?=
 =?utf-8?B?STd2V0hVdlB6YngzT3pOS3UrMTZvVzl3R04rK3o5bjRkSTdpQjh0L29pUzY0?=
 =?utf-8?B?K0VXWXlMRGxqOGV2czdkMEFhdVhuRGd4blNyeW9KY1pteGZSTTExS05JQXJr?=
 =?utf-8?B?Wm5FQ2I1aWlhZTQzRzBuU2tMQ0Iwc2VuU0pIT25sTWRxS01adDJNb2dQNGVL?=
 =?utf-8?B?TjQyVkFlMDI2aHkxVk1ZSk1qKzFIWFVtekM0bUdQUnhiZFlvanIxWnZ1aWtL?=
 =?utf-8?B?REU0TVdITEVaSjNmSCsybEJKd3RRQWlrODRIQnJoNFNNdDBiS0Nqb2NCdFNG?=
 =?utf-8?B?VUFUK1dBeno3MytKdlQyS3hwb2ZlMTlYckFJWkJiY1JsaFBJeTBQakl4Vnd0?=
 =?utf-8?B?R2MrdXA3dHA1Wk5DaVd1M3JYWTZCc2hENWJIdlhVMWlwdFpxdzd1MEZWSXRh?=
 =?utf-8?B?TzF6YzdhTTRPeDMwTXFIWkhxSDd6bXZIRE1LbGk5YkVYNUhZcXdXVXNSbFNU?=
 =?utf-8?B?cU1QOC9YaUw1WjNGOUk2Y0wzYk5sdXAxY0d3dEkxOVZwaDA4c3lSaEdnTDRP?=
 =?utf-8?B?M2lCSUxwZktka3VBcVVadzdRRGN5dHJuVFJwMnNiT1dXeEJUZHp2RXVMVytw?=
 =?utf-8?Q?F+8Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(42112799006)(376014)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:53:10.7143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 070ceee0-4e7a-4a52-b60f-08de1b23618f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215
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
> Add a function to copy fb of DRM_FORMAT_XRGB8888.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  lib/igt_fb.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  lib/igt_fb.h |  1 +
>  2 files changed, 42 insertions(+)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index a1df3d070..4ec7ee5a9 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2172,6 +2172,47 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
>  					  fb, 0, 0);
>  }
>  
> +/**
> + * igt_copy_fb:
> + * @fd: open drm file descriptor
> + * @src: pointer to source #igt_fb structure
> + * @fb: pointer to destination #igt_fb structure
> + *
> + * This function creates a new framebuffer with the same properties as @src
> + * and copies the pixel data.
> + *
> + * Returns:
> + * The kms id of the created framebuffer on success or a negative error code.
> + */
> +int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
> +{
> +	char *in_ptr, *out_ptr;
> +	int fb_id = 0;
> +	int cpp;
> +
> +	igt_assert(src);
> +
> +	if (src->num_planes != 1)
> +		return -EINVAL;
> +
> +	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
> +			      src->modifier, fb);
> +
> +	/* copy buffer contents */
> +	in_ptr = igt_fb_map_buffer(fb->fd, src);
> +	igt_assert(in_ptr);
> +	out_ptr = igt_fb_map_buffer(fb->fd, fb);
> +	igt_assert(out_ptr);
> +
> +	cpp = igt_drm_format_to_bpp(src->drm_format) / 8;
> +	igt_memcpy_from_wc(out_ptr, in_ptr, fb->width * fb->height * cpp);

Does fb->size not work here?
- Leo

> +
> +	igt_fb_unmap_buffer(fb, out_ptr);
> +	igt_fb_unmap_buffer(src, in_ptr);
> +
> +	return fb_id;
> +}
> +
>  /**
>   * igt_create_color_fb:
>   * @fd: open drm file descriptor
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index fe0bb580c..ac0e0909e 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -141,6 +141,7 @@ struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
>  					  const struct igt_fb *fb, const char *name);
>  unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
>  			   uint64_t modifier, struct igt_fb *fb);
> +int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb);
>  unsigned int igt_create_color_fb(int fd, int width, int height,
>  				 uint32_t format, uint64_t modifier,
>  				 double r, double g, double b,

