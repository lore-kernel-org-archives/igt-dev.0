Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81A8CD8CAE
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 08:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8334310E189;
	Tue,  9 Jun 2026 08:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vfykl53R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25D110E189
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 08:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780992658; x=1812528658;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+gDhPHu2cHgH96aT/61xKGFEcc4AT3YWpjuf9NeSTts=;
 b=Vfykl53RwQqVfrEzfHWaZk1ot9KugWxgbrpBvADce0oKsxoyvQT6eDOY
 V1TKKmPcVF/irpfdMgNh7snJphgCdP0z+APxbjBUeToujl5lgj1izdiCS
 /aWjxgF5q1QztwkFBahm6Qy8yeocqdVJ/nMzQRyPYe3dqAae/rCVAq0es
 IEd0RWbBPBfx21TwJS5YMLws0m/p4rG28DiiZV1UXW0FFnLF8oldtGAcI
 N0GNhjR8fqngn67V0fyz5RHYjvm7bQPTdVyOsH4joMzysB7+uUzYG/Pxr
 7Br3wgPYO4Lobk/iBTqc2LC2eSTtQRroK87MLZc5kLcnZJnhQzshN19Yd g==;
X-CSE-ConnectionGUID: EMJrSOXURo2VgzbNhiVWeA==
X-CSE-MsgGUID: FjHthhyLQem0lmWlha3FtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="84314258"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="84314258"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:10:57 -0700
X-CSE-ConnectionGUID: bC7eegg0Rs6Orz8bfJ2GSw==
X-CSE-MsgGUID: bth8hor6RriWqLEOb1i+hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="242847818"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:10:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:10:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 01:10:57 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 01:10:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O98m044fMCFQRg48uQm5s5eWZsNpJVEpYM2cclm4G38ZVCtmYPXUTjptPGwOBOD7cro3tlJr6FCHKz0l5QYRANL0K7VqCIeeRUCTpfMqhcUZz7la+DPFhL3GkSEgKyesdDnXO7tTYEwJvzSew2X/sjlqmDgRiLMykj/2Uwp9KGkps3+8jR6LGyJSY8RSz7TT8Uv1zifdjrkx7AecoLHRZxmaGiMsBfc76y4ghl6OyWTqYWJPxyiDjTFbPNUEXReqlfNujzax/M3+8AY4g6KTybj+Lvdf3q2EbzDDiWW1St2tdFupzZ+x1/+0+GSI8XN4qHlBQtQbu9z44lN7HVjzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2h9ZskQO1lq9XEjENHTU+JiLFzG8LrCE6He7Dlwdn1s=;
 b=Emd18X1Fs/ZUWBOb+5gCzlSPvGOBs2sgamAx5LjwMHV28DBTa8phptky4Pt3sdxip1+Lh00gMga8C0vAt2ahLa0CCiXMDoaVL5/1+Xqm1dFmEEamsWxknmPGamIwBpL943PekMOswZoXTL9b2FG59F40cKfboCF/3Wu700qJC27HwzRcTgRwhO78MxdC4sqAEjmCdy9LgM02zhUOf0/yGR49AMs34XVvGPj3WRqh85P8j51z82Fv1uS+4pord6LH4cSnvadqwSV81UmiIE0RIIHFBcZqR4JIDo09Ml23yHb5eYk9okbMDwStnaIlqMycVdjemY9vJk2IdFHoark67g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 08:10:49 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 08:10:49 +0000
Message-ID: <7dd89b7a-3564-4910-a33c-8c567524f842@intel.com>
Date: Tue, 9 Jun 2026 10:10:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] tests/sriov_basic: Arm SR-IOV exit cleanup
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>
References: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
 <20260602141609.3941750-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260602141609.3941750-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0046.eurprd02.prod.outlook.com
 (2603:10a6:802:14::17) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f958367-9eef-476b-0c8d-08dec5fe9d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 1LNZeq0fSIrm0FISdKWReb+KBN8DCdX9zBBMPWJKE/hkD82rWRYUi9TJNvaED2YoRYne5HCwAJO9dxU/B20MOpFB+u7RN0/anBe21/ES2aIrCciC0AzWq9wD67TlVKjkb7xkJ3wiLhXk/3UAOsTxTfdtGr0eBzieYvwfdCEdLb18qEfrPRoyxDJ1fjOYDLkSPn3KZAYL5gI5ZVzKyxcMSX1EJnFtqYZGRXiNQJVnIXkcYpqFfrRr6RRAywL8Tcuc8Ciy/zYRE403Bfwy0tSRoum6vHAFEA89ZfPH0QzVcG4104bQ3+U3ZIA5nLrm7tT4qVE//SmTqOnI3lh/zC+8FbRuVE3X3JRj6yzpsvOEAPqkOYH1VGm8N4ngl7acLfX2b6CvDa4vOyXekw7wUa1ghe2PABJP/brjgv7Q8eYxe1bdx2tsnol39jVAznuM/oKf0Z7j2gWCsiGXnVLJt09swBvUVlqP+ZvvcrK9qhH177IkmMaZ4eO9sh3P3Kpcng/UGWWMVaARswpZUU6rJoG1oInJd8A4jAmuwkuxr0Zi48yvWwQjK3RBwsNVLNZawZmk4Wvn7HowM6060l3ucEcs1rAs97956OUrznxfw/lvfMCddcHwdvyTChGvMxZ8hImzAkt0m9FW4wfUZaBkgT45vl3X9DP/fv3747e8jnkqde2Pq0EG2JF4usKswcgeKzrs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R09lWmdWV1l5Y2lLL2k4dm9sRG85Y3k3a3pTRzNycnBSU2F4SVoyTHpwaUVx?=
 =?utf-8?B?cG9Wd3VpUVhabXRkL2s1blAxUit6ak1Kai91Z2pQU01HQnZyZW5uVkpJTDVH?=
 =?utf-8?B?OHRlY1BVa1d4cGRWVHVQSlZCTjlmS1dpWEx5K3NCRGpWOWs5SmVzM29qQjBK?=
 =?utf-8?B?R25UVW9ObWFaaHdMTVVqVkpNTm5QdFR0aEJEdnpFK2U1ZnphaUNqWDk0TUI5?=
 =?utf-8?B?RGd2Z0hUeDFiYjJEcW9zMkhpbFgvdlZZZkVTc1JUc01yUU5OVHVZWEg3bVFl?=
 =?utf-8?B?ZWduUVFmUFA4T2pzWlF2N1hXV3Z0K2dnWlJTQ1pZV3d1VGdLWE1IQ2EwRkgy?=
 =?utf-8?B?bVJtT2xjNENrTksyVWMzTlhURU15MGtRTUtraVgxdnpJbThISmdUNGpuckRX?=
 =?utf-8?B?QXVBSEJUbWd6OERYaUk0WEFZdkpYZFVZa3RZSm00czg5Y0xBZTJsTWx4MUQv?=
 =?utf-8?B?R3IzTUpQV2lSL1VmTnNOT3A5STFiaXk3WDVBeEF4eElyMUxGVU8xNXB4RFJK?=
 =?utf-8?B?dEdwNGk1NTZSKzIxUHZ5MURLTW55cmN5K0dMU3B3b3BRdkZCSWI3bHZDQUs2?=
 =?utf-8?B?cVdOUVBscU1YWGloOWNqWjBJWU8yWHhMSVd1UVJOZmd5L2RyNHdJUkRuNU1Z?=
 =?utf-8?B?M0FyVDg0VnlXTXJzNy92WEROVHRFc3NBNHlHSXpFcUNzMG1uaEk3S1Z0RGtX?=
 =?utf-8?B?bCsxOFM1N1FqYkR4VXVZV1BvSDRiVDVOWCs5ZEc2WTlJcDQ4ait3K1BDNXM4?=
 =?utf-8?B?RkZHZHI3algybnhiQ2RxemduWHlSVVZnMURqKzd4L0Z2MmxoME5od20xN0Zn?=
 =?utf-8?B?ODdiOWtwSVVrQWFLL1JmUWhzeWJYRzV3NFZ4aEdqVjFtTWtsUzZzc01SWENl?=
 =?utf-8?B?dzMvWFRFa0dsMUp5Z0tIZEo1Y2VQeUdlWEJKaEhleDBJc0JRZUNGZFRVSGlN?=
 =?utf-8?B?aG12bjI1R2ZFbE1OWk1ST2ZKaXFValVjZHIxYThCR1o3WllWRTZLSnV6bEpT?=
 =?utf-8?B?Y1dpdUxBRWlUKzdwV0VRYUM2ZzJSY1N4VFVnUkpSSlFSMllldG1LeTJDVEdw?=
 =?utf-8?B?M3A4V0RrMTNqZlpjU0hRNlJ5WGVqYUNSSmNKM1BXTXp6YjJHaXQ1MHVGdWQ1?=
 =?utf-8?B?WGhySEtJMURCMDV2QUhNTDVyOFlQdTlXNm02S28xenNJeXh3emlLNDVsMjdl?=
 =?utf-8?B?MlMzRkJSUU5xdjRFdko3TWJNdEl3Skcwem8wc3JqZzZLbGtoRUU3SklTZWxD?=
 =?utf-8?B?TjV1c0pFZ0FhV01ST3JXL3lweHBwclZ2M21EVjJBb1Q0aWg0WjhkTnhIOStl?=
 =?utf-8?B?WDhSNzJBRnJFTG5xVFNpWXE4cm9tSzBuSmRtNmx5dkZqbERPeVZOU2g1Y3V2?=
 =?utf-8?B?SmcxOFpFYXV1T2FTbUhoSi9NQmxpb1J6RmJPQ0g4U0NpZ05hYktNZGxTL2tW?=
 =?utf-8?B?RW1qSCtpSUc0YWR4SnM5bms2YStyK3ZBYkRrQ2p3L0xxQmtmOUpnTG1qVDBy?=
 =?utf-8?B?RjZPamF0NW5odlY5YWgybEx4M2VXRlkzMk5oVXNhUFhXamc5N0xyK2UzaXJZ?=
 =?utf-8?B?NThrUS9iNE5NNFUrOUtsT21oU1BLNU5SVEF2YlE0cmJjSytxQUFkNlg5QUk5?=
 =?utf-8?B?ZSs1YjJ4QVY0dXVzV2ovNkVQZjBCTFRUdzVMQ25MalhZQklDQU1EWEZMc3VK?=
 =?utf-8?B?RlJid2VFa21LZjFkREZZdWRMbGladisyZG1mYzE0bXRZUGdyeVBVdWEvLzht?=
 =?utf-8?B?L08yUzBiOVhZTmpYOHhsQ0RabFdKWmlob1VmOXJCNWlCbmppSStVQXhqWlEy?=
 =?utf-8?B?YkhOMXJpc0d3d3FVcjUyK3RLMks3UllnemdOZjlwdzZsMmlTVjhkSHpYMHo1?=
 =?utf-8?B?RmtNZXh6bTliVE9YL3B6cHA4dmRWL3BOTnpWOGEwZENqNGh5SnpUN00yQXEx?=
 =?utf-8?B?dWthRUtxZEF6ekhJTTNvRXl5eFNqMnNKUTBaWEpFb3RpRy9mZmllaEt3M2g5?=
 =?utf-8?B?Y25NRXhYYmhnZ2Rvckd2L25wdFovUk15WWk2bU45VDVUSlRBMWoyWjBsSUpn?=
 =?utf-8?B?MDNJSVFIellmRjRlM3FvWStvdnIwcDNSbTNKd3ltbWdoMzRQL2c2c0FFcndn?=
 =?utf-8?B?QVFzYUhkYzNUQWQ5bkJnRDc0ejlMMDhreGYwLy9HemxDVTFxTWhXelJIeUd3?=
 =?utf-8?B?L3lURWo2Z1hwcUlVYVlIbEg2U0dKMWFaMVFVS0x6ck5RS2QrZ3ZnYXFRZEN6?=
 =?utf-8?B?Y2lURzVSbHZyb2dvcThPSStYYzBkWGZRZVNxaWZkR1RXekdpTEc3dDFvblJu?=
 =?utf-8?B?VEVTcTNyMVp3ZGU0MXFUbWhGWlFiaHFYbC8vZTRPUmhJM2pnYSswZz09?=
X-Exchange-RoutingPolicyChecked: Y6L3huqNcHTR6RPplxfm0Atkpxi4PGzU2lKfICRresKK3ivr+bkGkhWplXFG0bgeWm8fMS+2q6vRrmDkGFPiNLdRRDTHyuK4j+hnLhFGHKlh8Sopdg/53JQPz7ykyJQWQ60/vMXu9iWY1GT/B6oc9SskHZnIKMQUMClrMm5LRmfZPWHDAWV9nkmyi/gHXr47He+eomvhFnTlG3SqQEUtIMq24B7cD4XCj3sZXsxT3oHl4j94TnV4If7AelN6ER3ZmIZ7N7XFXbJnUDsIJ3DFgkX1s5GDTGAyoLZkoBl7cawKl0raYa3bKhTFVfR6zUg7/4XYHyfWTmkj+isoY1Nrig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f958367-9eef-476b-0c8d-08dec5fe9d83
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:10:48.9935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ex+jQ4IogQmyc8O0S7RFmY4p6OPPYja6/30HZy8JrhWXcefCqgQtexphKeOjKI6ABN2LtgVneEjuX7C1wK22wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
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


On 6/2/2026 16:16, Marcin Bernatowicz wrote:
> Install SR-IOV exit handler in sriov_basic so VFs and driver autoprobe
> get restored on exit. Clear handler after explicit teardown succeeds.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   tests/sriov_basic.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
> index 69240ab54..e551aed9f 100644
> --- a/tests/sriov_basic.c
> +++ b/tests/sriov_basic.c
> @@ -129,6 +129,7 @@ int igt_main()
>   		igt_require(igt_sriov_vfs_supported(pf_fd));
>   		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>   		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		igt_sriov_install_exit_handler(pf_fd, true, NULL, NULL);
>   	}
>   
>   	igt_describe("Verify VFs enabling without probing VF driver");
> @@ -217,6 +218,7 @@ int igt_main()
>   			    igt_sriov_disable_driver_autoprobe(pf_fd);
>   		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>   			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		igt_sriov_clear_exit_handler();
>   		close(pf_fd);
>   	}
>   }
