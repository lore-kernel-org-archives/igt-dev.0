Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C1AC48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 18:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FADD10E24F;
	Tue, 20 Feb 2024 18:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnEgMrdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA69210E24F
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 18:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708455223; x=1739991223;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oVbQ9RaWpE7wQNAs8FygCPMe8DoWIrLJWsmmMP/Y1tM=;
 b=XnEgMrdQgFEFLq19MYT0Ih2KqHpoCS7z120eBx0McwbXdQvMBMs1wXPn
 1hsZOLkgm5p+Td4FWT81GH+MQUfuEjVvGpXArSGObBBMVy9PcUMCysUY/
 4HKWutAYbLau0S+DecpbI0IgVDfM429whPdg0HUZcsnbCNzBr8jUBCO6m
 U20S6Fzlf1dlXcZdyxFhfJvyriBLKnSkMfBcByEFJOuljpFFWtSBj5dyk
 qOGGCe0V3m25gYL6K+8NVJxdF6dKp7ydRGM9i3d7IPrMUVzxr6csHGkIf
 1TtIikkRBvZ1tBS8FY1igf0LuSzKUHf49/pJHfEn8DDDS31dKtCynVpXc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2721421"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2721421"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5217095"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 10:53:44 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 10:53:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 10:53:42 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 10:53:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 10:53:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzJ3rW0WzR2PqAM0rWXz8TXYTSGyVFFpFMAMZIeGIyHo8FlWWvMrjc6tWFSBQVsXLE24S4sIdoCzCoYPtPrURlzB0gMZ6azW5T8XM6kc747GITCY/438/+QGsBQcCTLu6hzjV3WSgyQFFI+HXhNpVJg08nMw/mLibqx3n+V7mlIbBMJz8BWM2NFoiqOuL9YgPN6Nsl9klfDpq8QEjOhTU2FKI1tnt6tQCWiprOk5xKqrkz91YH5R0DhVOAJfSYlr7tA1D0mpcQTy9rJZ5/cZKvwwTmSKvGu7Rhj+PS6mYUYVc298X2gYV7jVyA/ufEJ5vnp+yEAI5eW6Wb+o+GemBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOk9tkBPpAFWZ0YQ8U4APJM7t5262k/aGRBj9WloaU0=;
 b=gBVIRAKZSoLUOwirEr7sL0FkhicNdYK+nIApDiyUirTWxvGPBgAp7pjDKV0jxtOYFIIBKZDlmPcYDm8OO+zeDu6a+mqIsXbL8IF2Ic63O03xjP0ZUPoCNBrd3xOrkG59bLDdiw02kAj34ofR2uzjgOX/PxNB1n5kimme0V/7GVMRtqOdejDw4U4e5bfbK6yd3Nw9zYp8dpM00ep6Yvv0I4czzXi1RGoZcqs2EPy2TboesHZxoZ2m+nR4xlqVQ8k/1SQLQzGnPTocvYQZuueH9nvXolsKmR02XvtmsTr0obh22ZKZ39J8xm4D/2R+7+blKhRN3TJp7NsRaaC2/KNOpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 18:53:40 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 18:53:39 +0000
Message-ID: <0f24a546-682b-42c1-acf4-f68d68f975c1@intel.com>
Date: Tue, 20 Feb 2024 10:53:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3 2/2] drm-uapi/xe: Add test to query HuC firmware
 version
Content-Language: en-GB
To: Francois Dugast <francois.dugast@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
References: <20240219143501.7-1-francois.dugast@intel.com>
 <20240219143501.7-3-francois.dugast@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240219143501.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e9f644-8eb0-45ba-6025-08dc32454091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RbpOb/K754PDQ9w4+90QkDC9KxqITQo7ZWbon4jTas3j0uUuhKdz9DE+tJbZUxZFR2Ka724U/MGT6jms95kNogNVpn5FisT4MNEP22G1cL0hGjOBGXOtPg7ibBMSG+BWgET+RN/7vqhQSI4jApZg5D5yFHge9jJERqq4hj5/1hYd0vJL1PId61iCgfUYmfnT8UeXryB9Vg/geasDRnK8fAY+qXzzzwnMujf5FRvQAQnb1c0mQGnkJeU5ZZhfDwErj6VMIbVffBVcyfgnA6xYpzcY3rzjtiFfH5Ko+o6vLhfcRr6a62iMSaa0MAmfGjwq2DbjXuHi52bjHb70k5ZumuzwKqCCUyK+5KMUnZAgsKV8O/5f7Hc1ibmjKl0HMiLaAJJDorwlp6rd4uygAScr2HjjTJOmgz7ou7hGVkSpLBp6FWiczAjZwJEiW3nGpMTcvxpt8mk/L1VLlszdctYIot567GTeZEjsQmT40LQ2gCUlriPhN8TsYBoXE5A1LKbwDHhLg1LzlwjsHM7xVRUq00z956d+io+zwj/WIWsh+Xo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REl3Sm9SeCtGMU8yZ0ZWdkhHQnJBcDd6TUZhQkVKVnd0YVZPZTRndytySkpO?=
 =?utf-8?B?VFZCZms5eFJqRi9NRU9oYzBQcnhLWlByNVM2dDZBUWdoelhaOVFyK0VJMWdv?=
 =?utf-8?B?aTYwWDZVeCtUNm12SUJzVE5aWjBEdk1MUjlDOXk3OE9nbTlKRklwY01QOEhy?=
 =?utf-8?B?ZXlNa2F4Q3lzNTBiZG9lQ21yMkRtdHVIc29VTVl5STNsSktuZ011R0VQM0s4?=
 =?utf-8?B?TFIvbjE2T2JoN2VKazN5aEh0eE1WdEhvSVNhWENVbmtOcDhyaXY0M0k4dUNT?=
 =?utf-8?B?bXJ6b2NvWG5naVNCOUNWYVk4V2lsK0paWXZLK3JtdTRVOW8wdHV1NnJoT0ow?=
 =?utf-8?B?T1p3T2ZSY1hoVFdveDB3SHg5dDBCSWZVU1RLQW13UVpmNTBRejBnNDdiMjl2?=
 =?utf-8?B?VGgyWjJTdWw4R2NERWJacnlMaTVOcUdocEZ2bWV4bktBY29VaGgvOWUvd1RP?=
 =?utf-8?B?V09FbVRvWEp1ZVNPWm9QcnVKQmdITlVDYWRxUEpsenJkb3Nsd2RkcHlXKzZl?=
 =?utf-8?B?aFhiSU1ROE00ZWQzRDZXR201TkFvNnpVdlZ5NnY1bVNEZlVTd0xJVDJETDZm?=
 =?utf-8?B?Y0tiR1ljVG5qSTRtaTFsTWVmcjJGdzB2RTNxdm0vQzR2RGNGckpZR1U0T1Nz?=
 =?utf-8?B?U0ZVSG03M0ZwQlRTeWJCT2NKN2JmZEVGTDVmUDhOSlVzdTh6MnpxWVNMTFM2?=
 =?utf-8?B?bWJVUTVMTmVSNVNHWWhYSmpCWjgrTzdCazhDdmZZQXVaNU5mWXhvcW92dXp3?=
 =?utf-8?B?am80dHF2S3hCcUhHc2RueVltVGc1ZjVTUGlDdjJCc1pVcnQrQk4xbndOTHl0?=
 =?utf-8?B?N3o1dk9yZktLTVBYaWo3aU1oZlJVZ2ZlQTlnbHFzL0lKdEFhZzlHL201Mm1z?=
 =?utf-8?B?amJjZ0dIbVBONE5xMmZUVEp4bEppMlQyRmkyTCtXYTFJM1lTamhjdlBVMzNn?=
 =?utf-8?B?MW1aWUtuVXVQMzk3ZEd4TFlqUFZrOG1wV2Q4UEVhMlh6MDUrUmo2bm1OSW1Y?=
 =?utf-8?B?Q3krakhzejhVUnpCc0ZxdFI3eGh3VGJDdFlFZE96S3hoTW9Ycm91RG1ZK2Vy?=
 =?utf-8?B?TnNiTmJTY3VTU3BBeXVlOUthaldXTnBFWExhYWp0UnArVVdmUWt1em1FRHA4?=
 =?utf-8?B?cmIvWDhXZTByY2VjSnRDOFlndFVUNzdFb0dUbERWVXZTbFpPVzkvWXBQcEU2?=
 =?utf-8?B?Y1RLeDRkVzlXdEx3NDB1QlRteEdIZkR2VDlrVmdmdzJzSlNJZFlIMHRucHo5?=
 =?utf-8?B?K3ZpVHQzcWExUmJYZEhMb1VYQzVTWm5LTFlDNTRFTlhOa0J5YUttejVvOUYr?=
 =?utf-8?B?QjZFZ0pUYVU5RDJBdHpxTDAyeHhlNlQ3dTNIN3dpU0JGM2FMWDMyVEFOWmNK?=
 =?utf-8?B?OW5wWTIxZ3ptRHRKS3VxbVBPTmxQOGo0T0s0cnBYdFJVb2pQcmllVkU2YUpJ?=
 =?utf-8?B?TVRXQkJVTHViTVVEaHlyM0U4QXY0ZklNRitWZzNOOGxBcXpVb1NBYTBCRzM4?=
 =?utf-8?B?RU1OajR1cjIxRW5rSWQ1M2xQRUJ5Zmc0bStPNk5ORFB3dmJTODhUaUk1clZm?=
 =?utf-8?B?NXB2c0JLWUxmR3ErUXVkZjhMODBDaTUxN2p5NVBtS2pibW1IL3ZhME8vSGdu?=
 =?utf-8?B?WXBPV1R2cVRqenB2NkxZTUlCbVNtMS9VZDM0cmRldVF2U09mZGR1Z1F4dkI4?=
 =?utf-8?B?RkxPSDVJOGVKNjMxUEI1NVMyMlBHemJOOWZvQXV0MW1abDA1N09GT3FMYnU5?=
 =?utf-8?B?S3F1VXVjc2VFRUUxb3FJUjNURzBrMDkxSDdUZk8wQzQ4bE5VbWxKS24wR01i?=
 =?utf-8?B?ZjVDK052ZFpnK1d5eTB3MmV4T3lua05oalpIQVY4bGYzMVJCK1p2YjM5ck5m?=
 =?utf-8?B?TmRZTU5ReTFya3dJbFFiaERQQld2RUhlMzJsUWxPR0p4Y1ZiL1I1dUJJc2hX?=
 =?utf-8?B?Mm9YeDJuOFVHTjlSWWx2VGJJVXRNM2RDNzNOeXBiL2xmZDlsSWFNNUlid1or?=
 =?utf-8?B?L2dNNzl3NlNRQUV1c2ZvK2J6dlB5ZGFLUFozaE1FOUtsNEphcFp1UVdqTVYw?=
 =?utf-8?B?bEE5akc3VGxmM0h5dGdqazVlSCtFZnNTeVBicnhvK1NtKzNqOWN6SXJJNm1H?=
 =?utf-8?B?M3greDljTmwrZURKRmRTTndNeXJ0d0k1SWpITkpMd0lQc09UL3pJV1dYb2FL?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e9f644-8eb0-45ba-6025-08dc32454091
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 18:53:39.8879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbhCg03g2xhF1GbwP2wY/z26ZHYRh/etk3soYHVJlv4Y5+dswLPCalhR8ZGW530xfsmtobKzgqJL2HUa5EElJeYwPKf75m88CBX5M64t8x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
X-OriginatorOrg: intel.com
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

On 2/19/2024 06:35, Francois Dugast wrote:
> This aligns with kernel commit ("drm/xe: Extend uAPI to query HuC
> micro-controler firmware version").
>
> v2:
> - Fix printing branch (Francois Dugast)
> - Make ENODEV the only accepted error (José Roberto de Souza)
>
> v3:
> - Share code between guc and huc tests (John Harrison)
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   include/drm-uapi/xe_drm.h |  1 +
>   tests/intel/xe_query.c    | 89 ++++++++++++++++++++++++++++++---------
>   2 files changed, 71 insertions(+), 19 deletions(-)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 3bd795f27..ce4acf9d4 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -583,6 +583,7 @@ struct drm_xe_query_engine_cycles {
>   struct drm_xe_query_uc_fw_version {
>   	/** @uc: The micro-controller type to query firmware version */
>   #define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +#define XE_QUERY_UC_TYPE_HUC 1
>   	__u16 uc_type;
>   
>   	/** @pad: MBZ */
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index bbe5955eb..b21c3820a 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -730,18 +730,8 @@ static void test_engine_cycles_invalid(int fd)
>   	query_engine_cycles(fd, &ts);
>   }
>   
> -/**
> - * SUBTEST: query-uc-fw-version-guc
> - * Test category: functionality test
> - * Description: Display the GuC firmware submission version
> - *
> - * SUBTEST: multigpu-query-uc-fw-version-guc
> - * Test category: functionality test
> - * Sub-category: MultiGPU
> - * Description: Display GuC firmware submission version for all Xe devices.
> - */
>   static void
> -test_query_uc_fw_version_guc(int fd)
> +test_query_uc_fw_version(int fd, uint32_t uc_type)
>   {
>   	struct drm_xe_query_uc_fw_version *uc_fw_version;
>   	struct drm_xe_device_query query = {
> @@ -750,6 +740,7 @@ test_query_uc_fw_version_guc(int fd)
>   		.size = 0,
>   		.data = 0,
>   	};
> +	int ret;
>   
>   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
>   
> @@ -757,20 +748,63 @@ test_query_uc_fw_version_guc(int fd)
>   	igt_assert(uc_fw_version);
>   
>   	memset(uc_fw_version, 0, sizeof(*uc_fw_version));
> -	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
> +	uc_fw_version->uc_type = uc_type;
>   	query.data = to_user_pointer(uc_fw_version);
>   
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> -	igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
> -		 uc_fw_version->branch_ver,
> -		 uc_fw_version->major_ver,
> -		 uc_fw_version->minor_ver,
> -		 uc_fw_version->patch_ver);
> -	igt_assert(uc_fw_version->major_ver > 0 || uc_fw_version->minor_ver > 0);
> +	ret = igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> +
> +	switch (uc_type) {
> +	case XE_QUERY_UC_TYPE_GUC_SUBMISSION:
> +		igt_assert(ret == 0);
igt_assert_eq(ret, 0) otherwise it won't tell you what the bad value was.

> +		igt_assert(uc_fw_version->major_ver > 0 ||
> +			   uc_fw_version->minor_ver > 0);
> +		igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
> +			 uc_fw_version->branch_ver,
> +			 uc_fw_version->major_ver,
> +			 uc_fw_version->minor_ver,
> +			 uc_fw_version->patch_ver);
Do the print before the assert? That way it is more clear as to what 
went wrong in the case of an error.

> +		break;
> +	case XE_QUERY_UC_TYPE_HUC:
> +		if (ret == 0) {
> +			igt_assert(uc_fw_version->major_ver > 0);
> +			igt_info("XE_QUERY_UC_TYPE_HUC %u.%u.%u.%u\n",
> +				 uc_fw_version->branch_ver,
> +				 uc_fw_version->major_ver,
> +				 uc_fw_version->minor_ver,
> +				 uc_fw_version->patch_ver);
As above, print before assert?

> +		} else if (errno == ENODEV) {
> +			/*
> +			 * No HuC was found, either because it is not running
> +			 * yet or there is no media IP.
> +			 */
> +			igt_info("XE_QUERY_UC_TYPE_HUC No HuC is running\n");
> +		} else {
> +			igt_assert(false);
Assert(false) gives no useful output to understand why the test failed. 
Maybe have 'igt_assert_eq(errno, ENODEV)' inside a single else clause 
that then prints the 'no HuC' message? That way it will print the actual 
errno value in the case of failure.

> +		}
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
>   
>   	free(uc_fw_version);
>   }
>   
> +/**
> + * SUBTEST: query-uc-fw-version-guc
> + * Test category: functionality test
> + * Description: Display the GuC firmware submission version
> + *
> + * SUBTEST: multigpu-query-uc-fw-version-guc
> + * Test category: functionality test
> + * Sub-category: MultiGPU
> + * Description: Display GuC firmware submission version for all Xe devices.
> + */
> +static void
> +test_query_uc_fw_version_guc(int fd)
> +{
> +	test_query_uc_fw_version(fd, XE_QUERY_UC_TYPE_GUC_SUBMISSION);
> +}
> +
>   /**
>    * SUBTEST: query-invalid-uc-fw-version-mbz
>    * Test category: functionality test
> @@ -820,6 +854,22 @@ test_query_uc_fw_version_invalid_mbz(int fd)
>   	free(uc_fw_version);
>   }
>   
> +/**
> + * SUBTEST: query-uc-fw-version-huc
> + * Test category: functionality test
> + * Description: Display the HuC firmware version
> + *
> + * SUBTEST: multigpu-query-uc-fw-version-huc
> + * Test category: functionality test
> + * Sub-category: MultiGPU
> + * Description: Display HuC firmware version for all Xe devices.
> + */
> +static void
> +test_query_uc_fw_version_huc(int fd)
> +{
> +	test_query_uc_fw_version(fd, XE_QUERY_UC_TYPE_HUC);
> +}
> +
>   igt_main
>   {
>   	const struct {
> @@ -834,6 +884,7 @@ igt_main
>   		{ "query-topology", test_query_gt_topology },
>   		{ "query-cs-cycles", test_query_engine_cycles },
>   		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
> +		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
>   		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
>   		{ "query-invalid-query", test_query_invalid_query },
>   		{ "query-invalid-size", test_query_invalid_size },

