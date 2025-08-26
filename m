Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CDCCA0FE7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 16:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F04410E69F;
	Tue, 26 Aug 2025 16:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ORbJEew+";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6C110E69F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 16:37:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mURErlJ0WYbj/OZLbAR4Lyb73avFiAMLWD6d2m3CfxHbgieqpqQq8CveJq94+4r+24Z1uli5YIQrM7ZUu+UhAwlX27jJpP1N383tkvIgzuHGXfZYlnZ47lz3jJXHjjY/cqiGBv35WB6XXIXXloSoPOefwcQ8R6kvjhW3WRxzQAV6X8Zw+3FgZGTJ/dn5ZWLGlrnxZ+ejOJdvsOT4298mFPVLd5UVz/1zMaNqu2Fm3b59sO62UKQvECM+W2GJzOq+AhVXlKXl+czWIwuD4S0+ySulUIQLiAPhS7t4ekl1ZO22xz5z24xe+h6qTIPFGAoz++IjPEBpQTMr+I/ToZN1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3l+rI4x8SZEISMG2omeoUyiWxWUYIKQyJfYqsiDI/Q=;
 b=AfWkkIGdb25DjAZGRzlHTDoRcc+YZyGq19waLGG3bCrCyjEF7mk6OZDLlv0W4eoNvJLNubH9bVXMxcZwpfOdTYw1Nn5bxTR3vy7PGlGDm9McpkuH/7QAM+nAttN93UWMsrz+7vn3k9KxnS5GUxiQLCHc9+SlgHio1iDyQMkNZFDeAJe3xsGl4Si/GEcsbBpZnmH/OQHjQrUZ23wHLyMNuzU8IWulUWzKkgdjul1kU+00il1vUZJSBVOTHaUozcsMzeh4nWNEKIp9Lb/46S2sv0P8IreY7PHNflw/Rz0VHi+EWnkcx36xhC7+9VcnOCzsr641s8mw6kxc28H9CAzdig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3l+rI4x8SZEISMG2omeoUyiWxWUYIKQyJfYqsiDI/Q=;
 b=ORbJEew+khLgPERFpPEf2mwQVWyHlwTB5IgKihvSDIOpuxksNzC/LLWSu/qsnmBf/FsdTLTN7u007yYMXYqfjMvElvjIGeDvZKylrrVHk/chZbzvVVS6SGNMDuFXVQl9QOja82HCPCENg0ckwO6Mtga8Xzj8mEEeyROEudGOxRo=
Received: from BL1P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::19)
 by DS4PR12MB9682.namprd12.prod.outlook.com (2603:10b6:8:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 16:37:12 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::c7) by BL1P223CA0014.outlook.office365.com
 (2603:10b6:208:2c4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Tue,
 26 Aug 2025 16:37:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 16:37:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 11:37:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 09:37:11 -0700
Received: from [10.4.12.116] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 11:37:10 -0500
Message-ID: <4d8ca661-618b-45ce-80eb-2c7e279abcb3@amd.com>
Date: Tue, 26 Aug 2025 12:37:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 03/30] drm-uapi: Add COLOROP object
To: <igt-dev@lists.freedesktop.org>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-4-alex.hung@amd.com>
Content-Language: en-US
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20250815040659.3321102-4-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DS4PR12MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: 77074a35-f48c-49ba-d755-08dde4bece82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elNxTG5UbUdjQk81SkY5OG1JbzFiZHp6SnM1VEhlN1BHbEowR01jZ1h2dGJr?=
 =?utf-8?B?RDJuVlM3a1NQSTVJZEpqWlNzYVY0bFUxa09FWWswMi93aTNsa3RFMTd4WXlq?=
 =?utf-8?B?OFBUTGhBS2hPZWF4MmNUMnRvMTc4SmJkMWRVdUpZYTVJSTA3UUhaZTYxQ0Q5?=
 =?utf-8?B?dDNvd1hsaXpUTGNjR0lLSkw2WkVZcmErbkJsZGwydThiRm54cno3bDFjaWdN?=
 =?utf-8?B?YVJyU1FLRGh6ZlRQdHBLWVdpb01Lb2hMVVNyemxwcERwd09LanhBdFYydFFO?=
 =?utf-8?B?SjdoWE51aDEvamVPc0VPZGxDVmVmSGZYbkc4eFZERlF0ZmpkNTY4M3pmdHZF?=
 =?utf-8?B?U2tENmpNeEFFY2pZQnJ5MU1jRWxXVEptQ1lIamlJYUgzWUIvYXpia3R6NGd4?=
 =?utf-8?B?b3BVMTRQV290OHpNK0g2ZjNtZ0ZRSlZiQlNkanVSNS9vanY4aXZ1ckc4WXI5?=
 =?utf-8?B?S3VqSjh6M284NjJyRkZZV016RWR0MTl0WC9WWGxCQjdVWmJuOFViYWVLL002?=
 =?utf-8?B?WWgvUmcvcnMwbVRXMW1NMldBdTIxKzRwOUI1eUNGR25EaEVxbWlpNkxjZTQ2?=
 =?utf-8?B?Nk9UVkliV2t4WnNaTWRpSFJQc0ZlQkVJcEVNYTlwaTNTZVpCNWMzRCtENGhm?=
 =?utf-8?B?NVhBYk9zMTNkR2o4NHFLZWJzdzBqdnF1Y3NCSjdtaVQ2NW43SktvYS9uK0R2?=
 =?utf-8?B?T0d3VFpRbmpUV0RDaE93N0UwanZMTGdvcnpQUEdQNWdxNnBJV2lyb1hHdndp?=
 =?utf-8?B?REhUbXlkc0tZeE5ySXdBVEJPZzlZVWdYVW95TjZCaWozekQ2UE5MM1ZLUnZk?=
 =?utf-8?B?RCs5YUZyOGZWMHRTVk1qZEFNWlpjN2VxRTZSQmtYd0g2RE1LTXlqeURuZFdZ?=
 =?utf-8?B?RVJTZldjRDdOQTBUclh4dEt5dW5keFdFQUJRRC9kVWFGN21aczZnN1N3MDhO?=
 =?utf-8?B?TUlMZlNGSmlCTVhkTE9SODdpelNFUDR1NjlhUzRGZ1FtcmlxOVFpaFF0VHc2?=
 =?utf-8?B?QUpremQ2cFpZM2FzbE02V0I2WjI4bEQrQkUvQmpiR0VmT2d2djQya1ZIWmFP?=
 =?utf-8?B?RFFQZU4vWm5tSkZVMTNuTjliQ2VKTVdkN2FnckhPNEV3MFp6QmVqRkFNajh1?=
 =?utf-8?B?M0Z1V0RyRjR4QTZ5eXFJYytvODJiSWdETnh5MXlZZ2VVZnd4K3NEWFY0MEQ1?=
 =?utf-8?B?cHk5NWlDTy9XOU9RZkJRTy9kelc3ZElOd2o5UHpkTWJTREVSaGtJQXBuOFpj?=
 =?utf-8?B?OCtITmFyNUFFRXVKYkE5YTA1UGtqUU5lc1ZveHpNaFYwN2NMUVZkZXIybEN4?=
 =?utf-8?B?bXFNcERzczBXekJ2YnZuZk1Ed1NibXgyWVNESWltYVlTU2xVclJSakM4Y3o2?=
 =?utf-8?B?bzQyRktkMlFLLzEzN1BXSGxtcDd1aWNXamFLRVZHK1hqSk1LbC9XTGVrQXZh?=
 =?utf-8?B?VlNlaUFEdUllYjVOVXYxcXJiOUdyZy8yWjVMeWFXRnB6SFprQXh5a25DQVJH?=
 =?utf-8?B?dElma2xtSjZLY1Erb2FJK3RVTTl0cS9xQmVWdTQ3VmhsWlV1WGYyZlF1UGtJ?=
 =?utf-8?B?cGZaVnNVVzVZazA3L1NRbEtzYi9nMEFhYkRvNE53bjYzbXZWcFlmT3lWSHJL?=
 =?utf-8?B?ZjVLSExiQ29naUZVT0pqcStzYzJablprWHI4eFJsUjRDYjZZZ0ErYWVHUXFw?=
 =?utf-8?B?NTc4a1paak1KUWF0R0xOS0ZyRGlyWmtLemZaZ2NZaG1sUlhmWkdwdVFKR3ZV?=
 =?utf-8?B?elA3ZG5SZlFrTnExWDlSdnZNSVg2dmRCNTJXT2lqaWsxd1o5L0Npd2FLa1hr?=
 =?utf-8?B?RmR6VEVMSlptRXg3VTlUVnd4TVV0NURnUHNYU0xGUzdJZkNOWjVLcGx5Si9s?=
 =?utf-8?B?a05YSkpWZTdNQnZ2V0NIdVR4RDNnM3JWWjIyeG9jVFhHQXhkZ25kaHhHUEZ4?=
 =?utf-8?B?MjRxWWMxb1liUDlHQXFLbm1JUWVrbCs2YU0wUXFOOTdIY2YzNDJ1SGJZdTBv?=
 =?utf-8?B?QmRpdk9UcDk3cEhCMUhBQ3FRZzJvTlNCMklXeFZGWmNucnA5YmkveldTZVZj?=
 =?utf-8?Q?acaqte?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 16:37:11.5649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77074a35-f48c-49ba-d755-08dde4bece82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9682
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
> DRM is introducing a new DRM core obejct, a drm_colorop. This
> object will represent one color operation in a color pipeline.
> 
> Introduce the object type in the drm-uapi, including the
> following types:
> - DRM_COLOROP_1D_CURVE,
> - DRM_COLOROP_1D_LUT,
> - DRM_COLOROP_CTM_3X4,
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   include/drm-uapi/amdgpu_drm.h |   9 --
>   include/drm-uapi/drm_mode.h   |  23 +++
>   lib/igt_kms.c                 | 272 +++++++++++++++++++++++++++++++++-
>   lib/igt_kms.h                 |  89 +++++++++++
>   tests/kms_properties.c        |   3 +
>   5 files changed, 381 insertions(+), 15 deletions(-)
> 
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index b38f27d69..ca24519c7 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -1590,15 +1590,6 @@ struct drm_amdgpu_info_uq_metadata {
>   #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
>   #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
>   
> -/* FIXME wrong namespace! */
> -struct drm_color_ctm_3x4 {
> -	/*
> -	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> -	 * (not two's complement!) format.
> -	 */
> -	__u64 matrix[12];
> -};
> -
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index c082810c0..fce45b5cf 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
>   #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
>   #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
>   #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
> +#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
>   #define DRM_MODE_OBJECT_ANY 0
>   
>   struct drm_mode_obj_get_properties {
> @@ -846,6 +847,22 @@ struct drm_color_ctm {
>   	__u64 matrix[9];
>   };
>   
> +struct drm_color_ctm_3x4 {
> +	/*
> +	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> +	 * (not two's complement!) format.
> +	 *
> +	 * TODO what's the format?

The format seems to be mentioned right above this line, so perhaps this 
is a stale TODO ?

> +	 *
> +	 * out   matrix          in
> +	 * |R|   |0  1  2  3 |   | R |
> +	 * |G| = |4  5  6  7 | x | G |
> +	 * |B|   |8  9  10 12|   | B |

Typo 11 instead of 12 ?


