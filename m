Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B017CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 11:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A2D10ED20;
	Wed,  6 May 2026 11:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bE6DXed+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E647B10ED20
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778065547; x=1809601547;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=McDcVZIdt7Rwx3VQybNG7N1LG7O0H48oycJcTeDJdzI=;
 b=bE6DXed+2GdRvy6/MuisON8xjNIipvVY4grF6STCfS9gssWvRx8yPNf4
 /Xzl083guHGDPsSnO17sJuCeLQ4VQmknP9vtOfc2cn0gC6qcVbK7NyjKy
 9aQg01OH/V/8oesZQ0YfNj8WP8+EVfglkG8b66SFBZIqSDHxefVqZ28TN
 Qo8TVewsNB/V0AqTrF5UOhKpX71hhVSx1mFy6V+el116de/wV4exU7ZaY
 xf0USvh3sIA32+pgO9AcOdey5SHh1+cRH2M9avoAegPyvyBmoDXU0lXR0
 jyI673qWvFm2BwT05SWtTbqxCjLTa3lcq35Z+eF/Pfrr5iUDBvEQqHuID Q==;
X-CSE-ConnectionGUID: /iYrXBaZTvaJPZuNq+9VIQ==
X-CSE-MsgGUID: rxIyywVuTAG2N+GGvIewxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82836617"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="82836617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:05:46 -0700
X-CSE-ConnectionGUID: dwwHfqtUQjWqt9dHXY4yJw==
X-CSE-MsgGUID: dFlcJzRGRFS2A/F5/rTfFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="229705000"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:05:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:05:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 04:05:46 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kX4luupNMv6D3xYCQYWNzc2fA4ozK2t8UTi0xKJdlPAJDJ1RFWkn4aU+keLenaaGGmTKSl84AgYBEl5FtAd9lyNUfRnUpNTYkORaZJ35Ehe2meXifpNp3Tb/X8WyNJxz2/GZvbmjJSH+Yu20n3O+PoqMZn7Iu0X2J0A8xNDv8TUe0KnSZJXTtvmyvgQBZTPB/YIS8rKdoEqVLAAjS6YLHf+8sHWfGKxxkuqUVJ3ogtwdTL3gjT9L2g7QSjj4KpPpvClzLvb8jZ3imhkqapNofc/D4408TOHrM7BG2N4e4x7ONCmmC2CIF7Prrv0IQuFVaMWQqHqk34jviLdH6167Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrXJNMQhXNeAVSB8/CSnRK8djExDJIlliiK3v9b3064=;
 b=V46RIi23yWBGSa66TLFCKJLPGKunZAjLPi56x7ORpryXQmDJSBPLL28yocGK0stPrc1iVPS8EDbG2zmLulKAQlPeihFgMA8WPrQqVuvzfinHNcJ21macSvQfydjyE1t+1OD2bF1sIX7b6Ik5zEG3gNcx74oGJbkx82vzrOpI76euwOFQH3RcqG22Qa/Cqe57As1NLfDDbNjD/Cywo3UqUXF2zY2yfBZ7PEzLH0scRfGvKg4k79OSz3A5lQItgCCkoDBMWyrr6lUmPq3ci4J6oCTUraIXo/hCHIx+pma1vahvtIOimfkDKgMhujVtYIyw1i4QBCUn5WP9wZSgb76raA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM6PR11MB4755.namprd11.prod.outlook.com (2603:10b6:5:2ae::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.27; Wed, 6 May 2026 11:05:44 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 11:05:44 +0000
Message-ID: <b4107214-bc8d-4a27-87b0-128fc628befb@intel.com>
Date: Wed, 6 May 2026 16:35:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/3] tests/kms_content_protection: Pass crtc
 parameter and use per-CRTC FBs
To: <igt-dev@lists.freedesktop.org>
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-3-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260330032205.467130-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0172.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::16) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DM6PR11MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: d307cc80-f936-4703-0ace-08deab5f6b25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: sptThJj+WxzswUh71HELbCd/OyFJOVuFRXDo7KPaBHjoK4dqNWlOInSqG29q6JoTUv0s5tIH44eEep/I8MA6WqMxy74Qi1/WhdYswTzIM4RyuKKyzxMb4KbSZ4VkxxbOdm07tV4FkxpB4Qs21qi5n1Y0yfS7jInQoReN04WRzs8YxQGMz+o5hTUPlq8G5eXN3WDlf2hXMUtzILLhEsrAC+wY+xJXeX3YlPZbUF2+z9ts1wYNXGCFmQLg3ayC7v8cWTHdTLJuwULlA5akVbEc4MTh/PIszrG67W0uLefw3sn6mAWkdAe9G5chyagE3/8rYn14PbI6euAkvfDfniKHdTI1t2otX+SJ8fiMuSdYYUiZMwIKdwtBI35LZgcbNb4/pCNY/jjsCtPJj80RfsdtqWm/AeO+lYGx4XZ5gpLQD/Xja+WGuIe9RED1khTtEGQwEOO2gyk0xtRN+fl2JtGZlqk3KgLyITwLlOXI5XJG3shOst5v2psP+0Re7CBhU+ly5kTwtbN7mGMKRLoN4hpzXaQDkOqWc381zrR5+vegrb4YgRs5Ckp/9cctINA3qLG73O/hmp85cbPRVkIVKAgTDUtW8FkhmsJqX4NoPVLjdxV3PYwbvbPZItw3OYEBiEdQf22ricGUmPMYrYO1yO8UF+3ScER2qy3beJRI2JmqEDqG4V1fhSU+wbTxhpZcn0SD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NllCcktrdVhmczZZOVZxMFZUMGFNYnN1Nk9HYWRnR21Ld0tPdElnbXpUODFH?=
 =?utf-8?B?N3BNYnp4Ymd0TVlZN3JoNjdyT0pPZUxMYUxuUDFLS01IM2JReVZ1Z1VRSDlO?=
 =?utf-8?B?VEZaZEtweDFVNkJJaVlkbDNmU3RMV2ZEL1NuWUJCc2tGQlBUcE9tM1ZHNVNm?=
 =?utf-8?B?RGxmSUZOalN6YlVHTlpZbW1MS0RsNFd5QVMxOVZ5SkViYmtzOUFRdG9rUkNx?=
 =?utf-8?B?bVRRRFpLMm8ycGxjNWJWbC9UUE5mckhkY2pudVFSZGVJT2pJTE56dC9LK3ov?=
 =?utf-8?B?WnRZWEN0NU9iQ01OaEJYdWVwWTFnMnNtcTFNOXVORUYyZEV1SEwveXcwU0c2?=
 =?utf-8?B?cjRhMVYwMk0xN2R0NUIyNW5hMXRtWFhGbE1nYm5iT1lZbUw2REZYVXZ4S1ZH?=
 =?utf-8?B?cndJL0pLWkwwelNBcHE0QjB3V0xtc0IwQUxQMFpZL3IrdEVNREhGRE5wMmVU?=
 =?utf-8?B?SmdkbVRYWFVrUGpmK3hXQVFlVHJIOGh2YW9ndnJpbHVvWkI3c1hMQ2hlTFRq?=
 =?utf-8?B?eWNhb2U4YVY1MjM1THIyNXYwVHRHdDNHS1cvTUUxMjNnVVoyU2xnTHpnb0RV?=
 =?utf-8?B?QVhZS1BoR1NwM0V2UlFTNjVsdnVrSUxmU1ljTEVVdlNDbU95VldxdXZBcFNL?=
 =?utf-8?B?NXhQeHY4L2YvMUJWd0ZvMUNCOEQ0R3FLSHRHRC9XQ0w1V1lsUTdoMnVkVmhx?=
 =?utf-8?B?WDl3bWJZdWZ0QXZmaytTVm1oTnJ3eEFsUTVtNjF5Z1o4WXE0TkZYVTNBSnJk?=
 =?utf-8?B?SUErcCsvTldtWnRidXpTejJOdVhRblRWcWhubjVNUDhCQzBzbXpGRTJORHBx?=
 =?utf-8?B?Q2JuR05Cbjh5SHljR3Fab21QMWQ0ZDJnNjh5ZTBsT0RCSmRpMVo1OWVNb3U3?=
 =?utf-8?B?c3ZTOWpZSkFzLzNOVEJ1aDZINld3ZmEzazI4dWg5eUE0SkRwR05tMWhIcUJN?=
 =?utf-8?B?OWlKVmtSMGd5UGlwNUpFZmdrVEsrWlVLWXFGTEhWWFJNNlBBWU1PRUxjT0VS?=
 =?utf-8?B?QXNSYk9JS1lBSmo3OTVuU3g3YVRHMDYrQzJRQm5GbGxDNUxQbTlDbTZoMHll?=
 =?utf-8?B?b29VZkdmejJwREhNMHdRWUJJc1RCY1RIbG9JOC8wZ2lBK0UwWUVMcWZKT0lj?=
 =?utf-8?B?c1ZCbHkxSGxSNDNseTUrYU8rM3BDdlY2V3R2SVIzTnVtb1NwT2tEMEtwTWNO?=
 =?utf-8?B?OGE1SHU2eFJGSzNPMnZGMjEvZ1RITytFaGFwbVlEQXF5SjlWWkpjbjNQT3Bu?=
 =?utf-8?B?S1Z6S2VDRk1LL0xkZEw0N2FHekhobDJicUhYSVAvZjh1TGRYZVR0YllyUTRM?=
 =?utf-8?B?WEwxQUF1Vml0Ly9WRnc5WkNsV2w5SFdhcWJBSlBPaloyVDlLTGZ4a3hYNERL?=
 =?utf-8?B?N2todnRkT3grbjh3T1ZYQ2RCemVEaW9mQ0lyU0NMSmhXcWZyQ1oxWE5QTUlP?=
 =?utf-8?B?QjJSd1NZWThNWGtPeFNjdDZ4NEUxNHI1QWpsMUR6bUhITURCQ0N4cy9rbWtK?=
 =?utf-8?B?Q0JZU08rQ1RzdDFESTM0eU9HdEppRlJ2L2k0S2hSZS9vbHVTYUV3ZTErSmNF?=
 =?utf-8?B?NXpPWnZYMWVHb2NRcUp5N2ozRWh6L2dKa3pjWURCUzR6blJiZkp1LzNLb1k2?=
 =?utf-8?B?VGhCWUpBcE9tdHAyZ2d4eksvc0hSa1V2enJJNDJXUDN3RFNTZkFwZkx0cS9J?=
 =?utf-8?B?UlRzOUJXQnNpMmw4RHkrWERGdVhQeXVkTFcrVDZqV1NuUzNMOWNPN0cxQm5R?=
 =?utf-8?B?UUE2Z1pCdHVxa2NPNmRxTWhxZktuaFpsMjZpdWNhTWdjTXY1eEpBOXo3cjhZ?=
 =?utf-8?B?b1JMNzhaSDBWSXNWRmlrWUV2R3BnQ1pzWVErSHN4WGxDb1AwYjlhZVl4dVZo?=
 =?utf-8?B?aFR1YVR5ZnFGU2w2Y1Z1ZFJseVgyMzlBZ0tac3V6NFNmRUQ3Y3YzcjBUSmhx?=
 =?utf-8?B?UzZyK2dEbWpFL3ByZjRZMUhGenRxd0VkemFod2I0d3RlYWhkWkV4VEwwblA0?=
 =?utf-8?B?R1IrZmx4dTAzNkwybW5rdStJaTk0cEdsdTROSitjL2s3ZElFY0xyeEkyUkli?=
 =?utf-8?B?blluY1hRVnRqUlZoL3YvcDN0T0dxcGpwRzl6U2tHN3JEcDJlaVlEeVpBYWZE?=
 =?utf-8?B?UXpjblVkTXhRSkdvc3ZMc3NGcnIxN2tLcW5hK3BDWnpVUzZRdnV5cXZOTGRG?=
 =?utf-8?B?TFJSSUhuZEtEcC91NHY5NWJmVUxBYmw0R29lc2trVCtvS2M0TkU3RG42bFE3?=
 =?utf-8?B?MkJZajMvcW5ObEk3QnZESUhkTzhCMk9kUFovdW84MEd2cUhhdzl5NFYyMlBP?=
 =?utf-8?B?ekJDRURZQ1pScVl4VW9UaEtRY1YxNVpyeE1Ea1JTWldleGVoM2c2ZFBSR1A4?=
 =?utf-8?Q?lNF/aaWt+HlgrQAP0C/ilcVbSsFSR/36fKm7j?=
X-Exchange-RoutingPolicyChecked: oaMeW6s1uXN2R1qtbVuawa4i8lZxwIEnxeZey0W9us7Ml8wi9VxiupICbj4Sbrt37ZpIkwrOOTSWNB/FKjmq3IXRVa3gtt/b0BVZS14wV1iH0/yVpK44cFcbEK5DbyNfxAdeVM4qlQ1cqMN8m9au3vEL8StSXVHlPBn/1bjCFGeqvGUHu0neAq1uf/mPphpNs5K8AjU0e4F3bkTrQF6+2Z9HE2OhbMWR6auv/kf9g1PrmMRfCN082qXcCbkZ2iO5lNGZOcZbxBcDJhcrwEXVa90LFxaAi6wJm3mduCnaLuHp7bCnXXwjZhTDrJaLTZO1d9jUhzhj/8z1JyGBATMB5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d307cc80-f936-4703-0ace-08deab5f6b25
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:05:44.2331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRdbrLsaiwRM8i5gzqzQuHPaSnsOeJn77TsZOUQI36ge6DGbWuz0bchvOX45PMbpAYeor7B4p2rQHDJIlT7sNtCkJctj6OUVExVHoXuTJ7ic04K0cAVzJGzmc8XmJa7u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4755
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



On 30-03-2026 08:50, Jason-JH Lin wrote:
> Refactor functions to accept crtc parameter and use per-CRTC
> framebuffers (data.fbs[crtc->crtc_index]).
> 
> Modified: modeset_with_fb(), test_cp_enable/disable(),
> test_cp_enable_with_retry(), test_mst_cp_disable(),
> prepare_modeset_on_mst_output(), test_fini(),
> test_content_protection_cleanup().
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_content_protection.c | 74 ++++++++++++++++++++--------------
>   1 file changed, 43 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index df9ff5efcaa2..b302d4cfd47d 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -263,7 +263,7 @@ commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
>   	}
>   }
>   
> -static void modeset_with_fb(igt_output_t *output,
> +static void modeset_with_fb(igt_output_t *output, igt_crtc_t *crtc,
>   			    enum igt_commit_style commit_style)
>   {
>   	igt_display_t *display = &data.display;
> @@ -273,18 +273,19 @@ static void modeset_with_fb(igt_output_t *output,
>   	mode = igt_output_get_mode(output);
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
> +	igt_fb_set_size(&data.fbs[crtc->crtc_index].red, primary, mode->hdisplay, mode->vdisplay);
>   
>   	igt_display_commit2(display, commit_style);
>   
> -	igt_plane_set_fb(primary, &data.green);
> +	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
>   
>   	/* Wait for Flip completion before starting the HDCP authentication */
>   	commit_display_and_wait_for_flip(commit_style);
>   }
>   
> -static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_style,
> +static bool test_cp_enable(igt_output_t *output, igt_crtc_t *crtc,
> +			   enum igt_commit_style commit_style,
>   			   int content_type, bool type_change)
>   {
>   	igt_display_t *display = &data.display;
> @@ -307,7 +308,7 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
>   	ret = wait_for_prop_value(output, CP_ENABLED,
>   				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   	if (ret) {
> -		igt_plane_set_fb(primary, &data.green);
> +		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
>   		igt_display_commit2(display, commit_style);
>   	}
>   
> @@ -320,13 +321,15 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> +	igt_crtc_t *crtc;
>   	bool ret;
>   	int count;
>   	u64 val;
>   
>   	for (count = 0; count < valid_outputs; count++) {
> +		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
>   		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &data.red);
> +		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
>   		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
>   					  CP_UNDESIRED);
>   	}
> @@ -344,7 +347,8 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>   	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
>   }
>   
> -static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
> +static void test_cp_disable(igt_output_t *output, igt_crtc_t *crtc,
> +			    enum igt_commit_style commit_style)
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> @@ -358,7 +362,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   	 */
>   	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
>   				  CP_UNDESIRED);
> -	igt_plane_set_fb(primary, &data.red);
> +	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
>   	igt_display_commit2(display, commit_style);
>   
>   	/* Wait for HDCP to be disabled, before crtc off */
> @@ -367,7 +371,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   	igt_assert_f(ret, "Content Protection not cleared\n");
>   }
>   
> -static void test_cp_enable_with_retry(igt_output_t *output,
> +static void test_cp_enable_with_retry(igt_output_t *output, igt_crtc_t *crtc,
>   				      enum igt_commit_style commit_style,
>   				      int retry, int content_type,
>   				      bool expect_failure,
> @@ -378,16 +382,16 @@ static void test_cp_enable_with_retry(igt_output_t *output,
>   
>   	do {
>   		if (!type_change || retry_orig != retry)
> -			test_cp_disable(output, commit_style);
> +			test_cp_disable(output, crtc, commit_style);
>   
> -		ret = test_cp_enable(output, commit_style, content_type, type_change);
> +		ret = test_cp_enable(output, crtc, commit_style, content_type, type_change);
>   
>   		if (!ret && --retry)
>   			igt_debug("Retry (%d/2) ...\n", 3 - retry);
>   	} while (retry && !ret);
>   
>   	if (!ret)
> -		test_cp_disable(output, commit_style);
> +		test_cp_disable(output, crtc, commit_style);
>   
>   	if (expect_failure)
>   		igt_assert_f(!ret,
> @@ -457,16 +461,16 @@ static void test_content_protection_on_output(igt_output_t *output,
>   	igt_display_t *display = &data.display;
>   	bool ret;
>   
> -	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
> +	test_cp_enable_with_retry(output, crtc, commit_style, 3, content_type, false,
>   				  false);
>   
>   	if (data.cp_tests & CP_TYPE_CHANGE) {
>   		/* Type 1 -> Type 0 */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc, commit_style, 3,
>   					  HDCP_CONTENT_TYPE_0, false,
>   					  true);
>   		/* Type 0 -> Type 1 */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc, commit_style, 3,
>   					  content_type, false,
>   					  true);
>   	}
> @@ -476,14 +480,14 @@ static void test_content_protection_on_output(igt_output_t *output,
>   			     "mei_hdcp unload failed");
>   
>   		/* Expected to fail */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc, commit_style, 3,
>   					  content_type, true, false);
>   
>   		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
>   			     "mei_hdcp load failed");
>   
>   		/* Expected to pass */
> -		test_cp_enable_with_retry(output, commit_style, 3,
> +		test_cp_enable_with_retry(output, crtc, commit_style, 3,
>   					  content_type, false, false);
>   	}
>   
> @@ -502,7 +506,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>   		ret = wait_for_prop_value(output, CP_ENABLED,
>   					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   		if (!ret)
> -			test_cp_enable_with_retry(output, commit_style, 2,
> +			test_cp_enable_with_retry(output, crtc, commit_style, 2,
>   						  content_type, false,
>   						  false);
>   	}
> @@ -513,7 +517,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>   		ret = wait_for_prop_value(output, CP_ENABLED,
>   					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   		if (!ret)
> -			test_cp_enable_with_retry(output, commit_style, 2,
> +			test_cp_enable_with_retry(output, crtc, commit_style, 2,
>   						  content_type, false,
>   						  false);
>   	}
> @@ -583,21 +587,24 @@ static bool sink_hdcp2_capable(igt_output_t *output)
>   	return strstr(buf, "HDCP2.2");
>   }
>   
> -static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
> +static void prepare_modeset_on_mst_output(igt_output_t *output, igt_crtc_t *crtc, bool is_enabled)
>   {
>   	drmModeModeInfo *mode;
>   	igt_plane_t *primary;
>   	int width, height;
> +	struct igt_fb *fb;
>   
>   	mode = igt_output_get_mode(output);
>   
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
>   
> +	fb = is_enabled ? &data.fbs[crtc->crtc_index].green : &data.fbs[crtc->crtc_index].red;
> +
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
> -	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> -	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
> +	igt_plane_set_fb(primary, fb);
> +	igt_fb_set_size(fb, primary, width, height);
>   	igt_plane_set_size(primary, width, height);
>   }
>   
> @@ -669,11 +676,11 @@ static void reset_i915_force_hdcp14(igt_output_t *output)
>   }
>   
>   static void
> -test_fini(igt_output_t *output, enum igt_commit_style commit_style)
> +test_fini(igt_output_t *output, igt_crtc_t *crtc, enum igt_commit_style commit_style)
>   {
>   	igt_plane_t *primary;
>   
> -	test_cp_disable(output, commit_style);
> +	test_cp_disable(output, crtc, commit_style);
>   	primary = igt_output_get_plane_type(output,
>   					    DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
> @@ -769,7 +776,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>   			if (!intel_pipe_output_combo_valid(display))
>   				continue;
>   
> -			modeset_with_fb(output, commit_style);
> +			modeset_with_fb(output, crtc, commit_style);
>   			if (data.is_force_hdcp14)
>   				set_i915_force_hdcp14(output);
>   
> @@ -783,7 +790,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>   			if (data.is_force_hdcp14)
>   				reset_i915_force_hdcp14(output);
>   
> -			test_fini(output, commit_style);
> +			test_fini(output, crtc, commit_style);
>   			/*
>   			 * Testing a output with a pipe is enough for HDCP
>   			 * testing. No ROI in testing the connector with other
> @@ -876,8 +883,11 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
>   		if (!ret || retries)
>   			igt_debug("Retry %d/3\n", 3 - retries);
>   
> -		for (i = 0; i < valid_outputs; i++)
> -			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
> +		for (i = 0; i < valid_outputs; i++) {
> +			igt_crtc_t *crtc = igt_output_get_driving_crtc(hdcp_mst_output[i]);
> +
> +			prepare_modeset_on_mst_output(hdcp_mst_output[i], crtc, ret);
> +		}
>   
>   		igt_display_commit2(display, COMMIT_ATOMIC);
>   	} while (retries && !ret);
> @@ -919,7 +929,7 @@ test_content_protection_mst(int content_type)
>   		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
>   
>   		igt_output_set_crtc(output, crtc);
> -		prepare_modeset_on_mst_output(output, false);
> +		prepare_modeset_on_mst_output(output, crtc, false);
>   		dp_mst_outputs++;
>   		if (output_hdcp_capable(output, content_type))
>   			hdcp_mst_output[valid_outputs++] = output;
> @@ -982,6 +992,7 @@ static void test_content_protection_cleanup(void)
>   {
>   	igt_display_t *display = &data.display;
>   	igt_output_t *output;
> +	igt_crtc_t *crtc;
>   	uint64_t val;
>   
>   	for_each_connected_output(display, output) {
> @@ -994,7 +1005,8 @@ static void test_content_protection_cleanup(void)
>   			continue;
>   
>   		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
> -		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +		crtc = igt_output_get_driving_crtc(output);
nit, Do we need to guard this for NULL?
Rest LGTM,
  Tested-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
  Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> +		test_cp_disable(output, crtc, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   	}
>   }
>   

