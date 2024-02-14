Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4B9C48BC1
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 18:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490E210E173;
	Wed, 14 Feb 2024 18:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAdZ7sde";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2866710E173
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 18:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707934746; x=1739470746;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Afap7bKCqHqK3RU8EXkOLDhZ2s1by4BJwTnw8xzJMXE=;
 b=iAdZ7sdejDb2RjzOyZea5Y3me7h36gOAxYuUkdspvAhEYv4ZG0W5zaw4
 1DwAkWBCOruDRzg9OSi734R8ODW4l1xC2OXZWvW6dhiQxEhHIP35TVyMF
 QNd5c8z7ktRWgxO8+wgxE4GWHkSTOuLkX3v6HQYh0LCSJRUtJPvYsnJRQ
 FK9N7rYx6Ks450GX+0tuC250nhmLtzHLGKjNpKi1GeB/t/z4c5pxUOgK7
 kiGMhZgXF+7Gu6vMBr1dgtgSm8Wq1voUpyh0qLJip17/NOdDmGqZyDqhu
 eSyXGYlbzrn/HidjWdpmPSgPJ+8Ua0CLrlrKjtTV+p0pnGcuXeRw5mDub g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="12626200"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="12626200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3254643"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 10:19:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:19:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 10:19:01 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 10:19:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jifS8acsx/V0s231vSgS4ZzUBL9dBbBXG9Lb/xhb/WmCVsntFGgDMfCrLQ39erHmOEDzp+b+i+zs+dnHbfhk4aqoA04Rpan1hQrCWqzRAQPMf5i1Sy+Y1HXsJu/PNPopXGD8uMxDU6ydrNzY3+2ikU5chDsxLbo7l+cgeta0Aq/qLg8y56nRbh/w+xOERp4Qp/e4wJs9OqblsOIeKV/hznEiyO2JsfuuICYrE0FkWtaKAmI2T18P+ikZs2W5K8o0iztSkVRSWo6rABXDq28DOc04KKtU7FN1EiJXmwEy5q1tVLap/JqEkMsgHG3qpDaUA06Mdo8UE4/XB/F+cxPShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=813qap479oklSRc6am2tq4EUnrXhCkMAwS6bCowh3Tc=;
 b=CgQAtnLm+UtFvYQnq4ActMJ9AJ2Fzw2YjtIh+vZVwn/W3du2ochkBy76ghCh+lcD7/lK5bee2JH/CO5sn1Bz4Pg9IKInseHGdS/wnxkSEq5F+DDIWX03vbfVz6hD9/XBlyQEcqEE3F1orvO3tQ5ROVU0g+6jzE8EPNtu5eyeLhT0mdo0GWb/P5rdlWF6ptMVVB3Tht5J1ozeRSYqacApRsPGQEukOhn2NUbs5WvNMxQnJjZZXhbRCwj2Otmxc8tPYbpU+wg6vWeDRifNdknOTqkghwwok2aJXsQm3A5o5sWtayA2yctRRzW46872GLhSGOglRuNsHuFdiZUZf397lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40; Wed, 14 Feb
 2024 18:18:59 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 18:18:59 +0000
Message-ID: <f4c2d784-6c88-488e-9095-d0a89578ea09@intel.com>
Date: Wed, 14 Feb 2024 10:18:56 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2 2/2] drm-uapi/xe: Add test to query HuC firmware
 version
Content-Language: en-GB
To: Francois Dugast <francois.dugast@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
References: <20240214102435.7-1-francois.dugast@intel.com>
 <20240214102435.7-3-francois.dugast@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240214102435.7-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ace3bea-d625-406b-8819-08dc2d8969d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3FDX1UEAE3IiiXM2FVHSpACQFQYA0pG55Q4u4R89rMnma9ouZ1cPmfVDNPKCGQX7UZtX3Erpi1PfVH3D2d+ZzLsLdQmu0wy/wedfaKzENXzJePLP/vvRWD5K0ae4dH75qzcAfMdNrJ/qzFNTJMPbGHWulP4U//8hfiKwTtlYiizODHF14wKviZJyXJZ1H/5UPVeSwcEZu+bUe9e4TzWACtnLY/RZgyf9WelNd5EAjs9QPGTdriLK2nyVQhrqdroL9PashOEUnGKarv5kJlAOowDd1DersuX9h1XimBFoc0OUhwD6umvERsSmoIr3UGrat2bXhenSmdfKuH3Wm8e5zRhiHDePaEBoAVytp8k9PyD0v9v0NDOS+6QghKZi1DnHuhxqvybcxCHuCdab0SB3nDSwStPnQF3WT6s6r5YOe2e4W1b58rx4r8ac58iXRWKbs1JrrvwZ0p9ipw8Z6Xxix28rmZzorK+4F1LsgWYqStVZ6guCOADmd2vnShmuZFKnZXJbzsSJuptCjGDpgIffHMuGcIi2O6amrfsdDLFiTvdd2rBCrDpcwpbTU2ghhqB6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(86362001)(31696002)(31686004)(5660300002)(8676002)(8936002)(66476007)(66946007)(66556008)(4326008)(2906002)(6512007)(6506007)(6486002)(82960400001)(478600001)(38100700002)(26005)(2616005)(107886003)(36756003)(54906003)(316002)(53546011)(6666004)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SktyR2pwVlBISVp3RDdDTnhZWm5PNWlNeUdjRHFHNzZUeklObjRUSlRxcnpO?=
 =?utf-8?B?dy91dWR1b28wdE10UVAwTmdONE9ETFQxME5Eb1AxemFYV0V1V0Jvc1lPaS9q?=
 =?utf-8?B?bDNoM0wvaEc4bUFXNGJhSUJtMzZORCs0SXFMWFRITzVDNDhodWM1Uk1aS2ho?=
 =?utf-8?B?dk8vUng5ZGd2QVRsalFTS1pnbzFsWis5aXVkOUxIek82UTBSNUpzSDZKMnJr?=
 =?utf-8?B?NXBTL1M1Qyt4Q3ZaOHY0bml1VnR1aXc2WEVKSUl4NVBSQ1l6b1RyQnVVbWF6?=
 =?utf-8?B?c25hUGh5anNJUzNlMjhlR0tJQ1AvVEo4NG1ZNXMwaXRvRG9qWFlMcjErWUNE?=
 =?utf-8?B?eVNla3RGRWZINlZudjcyVFVkV0o3M1FmR1VYbldWWUR0NjNZT3Mzb3JIdjYw?=
 =?utf-8?B?OUwrZFpsaVdFamZ5YmFaRU5aU24yR1dndHl3RXludXIyZXJBSkRiUEhGWmF2?=
 =?utf-8?B?ZzFGQjRxd1FxcTZVaS9WK2pqVEczMUZNb1REZno5VDhTdXVJQ3lzWHVaZEd3?=
 =?utf-8?B?ZSt2Q2JjUSt0TVpYN1BoMEV0SmZWalVFeEVVdThYQzRvYkw2cEdNU0tqZHF0?=
 =?utf-8?B?RkQ5dDY0TDNHMkJReEMwT29vR0Q3Q2J6UnlOWUZUdlRMbWpxMFg2ZDlZMTdZ?=
 =?utf-8?B?ZlVBNW9rSHpMbFQyVVJrSVM0cHZKeGE5NzlSV21mTVYzcHFvNFlrZ0JnclF1?=
 =?utf-8?B?Y09SL2FVYUl5d2xtYUhEbmlabllteUlNNWYya0x1UDVCMGw5eEVlamZ2bTdr?=
 =?utf-8?B?clI2d3Mva3hyNFRjNExxNXVoNWd6K2ZrRklWcEFBd2hYTlA4M2FoUTE2Rkh2?=
 =?utf-8?B?L0VIL2VKajkyNVdrWjI4Wm5uUys0T203bFREWGpibExHNEI1UWtEbmhOZnJH?=
 =?utf-8?B?VjhXK21oTS9qbU1UZmZGVDdIdzJ1VzVKZHYvajkwZlh6TW9MRFNzU3B0REQ3?=
 =?utf-8?B?ZEFHMHJXaVI0SHpVcDkyeXJXdnk4eWZYaGR6d0ZXSkdmRjJjN214YWlTTHNP?=
 =?utf-8?B?VWxBZkVialV0RStodDNoRDhUejRwVkMzWG9YRmhSL0hPY1RSdWNJNkFDYm5E?=
 =?utf-8?B?akdFL0ZRbXEzckJlYWdlbjA1UzVIOHpubDRvejBweitFZjczNmg2Sm5ZcVhi?=
 =?utf-8?B?NGwxK3lDRWJoLytaWUFuL09PcTg4QlI5WStsYXpWNWY3U1A2Ukw2OUhydlpp?=
 =?utf-8?B?NG4xaEhMb1lwb1VHL1FpeFlYSEVjeGFic1AxQUF5ZngrWEVpclpPN1FmYlBD?=
 =?utf-8?B?S2FEdGtlTmRNQm9XWnphb0o5SmV1UEYxUFU4R3E0d2RkOGhUVDRHMXNQY1pv?=
 =?utf-8?B?RjNxNlFaY2d5d3NKUDhOVVdXSFZIbmFsM1MvUTJPUlJPTHNvZmhLYjlpSk03?=
 =?utf-8?B?Q1ZDL254aEZWYllPREY4WHlieVlQcVdBRGFXOEl4c3pNRjlBQXRnN25PTWtZ?=
 =?utf-8?B?T21VTm1PUFQ0THJxQmwydmIxdVdHQTFkS1lVb0wyU1F1eE1ubHZsTHgwamlN?=
 =?utf-8?B?YW1GeFlHUnNkano2cEw5RkNyWFZiUS9temxSMjVFcEVGVkUxcGtlZWZOREJY?=
 =?utf-8?B?ZUZST3k0UlpUb1BUYVM2NHVpZWl1a3lrRndMWFA4eVBTNllQOEFUMDhWaFJo?=
 =?utf-8?B?SDRucUZ3ZGJFb2twa3Z4clJVVTV6YlNLT0k3N0hDcUpaeHIzRWY3STdtc2pv?=
 =?utf-8?B?YWFLTXB2SnU2MXlCcmlYaXl4djFZdzB4OU80U2dxWmE0dFY4Y2tDN3FxRCtN?=
 =?utf-8?B?WDVybVB3cDhIZ1grS1FkeVZVOU5iZ2VRRE1UOVBWM2Z3ZmZTRzVXaDlhNWJK?=
 =?utf-8?B?Ly95NG1PSzlNaHVFL0pSTGFDS0dCL09JcUlud0s4VlJ2OXpQR3hOb0h6Q0t5?=
 =?utf-8?B?aExiZitzV0Nwa0gxTVdsbkh0K2FZamhyUXJGQUtUcytBalpka1NnajV6YjQ0?=
 =?utf-8?B?VHAyeGJXekJQU2lnaHdtZlVmdG5rd3prc09wYU1kSUM5NDQyUDhyU1hwVDhZ?=
 =?utf-8?B?dzJRci9KQzJPYTRKSnBPMGRCMUhmTHFvU05mbjdOSVNVWDdjL1FhYk0yc2Qx?=
 =?utf-8?B?Ym9rMTVHcjI2L2k2VGoyUy9OOWpGSlRPa3B4TGpkYTVlM20zRlFqNEdGS1Aw?=
 =?utf-8?B?c1V2NUlkUXNqUDNKa3VGWG11V3VFOHlWcHBmeVlGNzRCeUpNT0VzdEZiVHVU?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ace3bea-d625-406b-8819-08dc2d8969d9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 18:18:59.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8MF7wK95qSXgq7Gr/IlRebLB9eBSJtTy80Kve7yZrCaCD637zl9qlGxH1Ck6Pr+fLu3a3kgZTzcEAC4rd79gTv5g5kGPt2qqrXQ8jnCz0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
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

On 2/14/2024 02:24, Francois Dugast wrote:
> This aligns with kernel commit ("drm/xe: Extend uAPI to query HuC
> micro-controler firmware version").
>
> v2:
> - Fix printing branch (Francois Dugast)
> - Make ENODEV the only accepted error (José Roberto de Souza)
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   include/drm-uapi/xe_drm.h |  1 +
>   tests/intel/xe_query.c    | 57 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
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
> index d51e73ea5..e523c380b 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -825,6 +825,62 @@ test_query_uc_fw_version_invalid_mbz(int fd)
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
> +	struct drm_xe_query_uc_fw_version *uc_fw_version;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
> +		.size = 0,
> +		.data = 0,
> +	};
> +	int ret;
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	uc_fw_version = malloc(query.size);
> +	igt_assert(uc_fw_version);
> +
> +	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_HUC;
> +	uc_fw_version->pad = 0;
> +	uc_fw_version->pad2 = 0;
> +	uc_fw_version->reserved = 0;
> +	query.data = to_user_pointer(uc_fw_version);
> +
> +	ret = igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> +
> +	igt_assert(ret == 0 || errno == ENODEV);
> +
> +	if (ret == 0) {
> +		igt_assert(uc_fw_version->major_ver > 0);
> +
> +		igt_info("XE_QUERY_UC_TYPE_HUC %u.%u.%u.%u\n",
> +			 uc_fw_version->major_ver,
> +			 uc_fw_version->minor_ver,
> +			 uc_fw_version->patch_ver,
> +			 uc_fw_version->branch_ver);
> +	} else {
> +		/*
> +		 * No HuC was found, either because it is not running
> +		 * yet or there is no media IP.
> +		 */
> +		igt_info("XE_QUERY_UC_TYPE_HUC No HuC is running\n");
> +	}
> +
> +	free(uc_fw_version);
Why duplicate this entire function? It could all be common code that 
just takes the firmware type enum as a parameter.

John.

> +}
> +
>   igt_main
>   {
>   	const struct {
> @@ -839,6 +895,7 @@ igt_main
>   		{ "query-topology", test_query_gt_topology },
>   		{ "query-cs-cycles", test_query_engine_cycles },
>   		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
> +		{ "query-uc-fw-version-huc", test_query_uc_fw_version_huc },
>   		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
>   		{ "query-invalid-query", test_query_invalid_query },
>   		{ "query-invalid-size", test_query_invalid_size },

