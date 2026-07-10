Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EEBC43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 04:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FAE10E127;
	Fri, 10 Jul 2026 04:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhW9Day+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B01810E127
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 04:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783659056; x=1815195056;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R0sIw0YS9Cuc1dQqga7vZsuOma4yWJY76u6x2C7KQbk=;
 b=mhW9Day+2SolsuH4amxLj7tjW5FkMhk7iuHlPC6Q1nTfU8XcuMcLdBTH
 btPIf8Zy8mpyKETAsU7+ZflMbLyfVSXqpnopd2ywH48BKTRp1xFuSQRGu
 589y75Wi/+493aoDAGl2/RC6/Ipgysz0EkGR6P3JAKEczB8Mwg0UMN8+4
 0LNeBTKBDkTqS8kspntaxeLc0cP6ZkDqND2IUSfBT0K72B4VKUzRaEUKB
 pcPvg8roqB5W1nO00zmAeMrboekRnEfgD8BmOZbuBNDngIwxDaN1Bbpk8
 QWdejnCPufbgl3HZSSLyaY2CWY9zhk/ayVMZ+dvXNNx5W/1JKBPNTSHow Q==;
X-CSE-ConnectionGUID: 11tNqQJcToWqbSAPRLsFXg==
X-CSE-MsgGUID: /g9ZvpcHR1ePHrqzbfLgVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88040186"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88040186"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:50:56 -0700
X-CSE-ConnectionGUID: OQy5UinnRvu5tlv4wuJ/uA==
X-CSE-MsgGUID: jfvX5VqNQcGhBJ29US8vKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="292986257"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:50:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 21:50:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 21:50:54 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 21:50:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqTFv0Banby6G1g/BVfITiFiBHVmFUpiTI+hRSeeuQYYcCUd/d4mPPscx/ybikUm92WP60KqqjwIHb96sx8dZrzuXou6gMHXwJsnGPRdnCJlWdN3EQbBOR6e+bzpzo1Po3O2V5ALk2Kru1LVil6485W7sdMke/xUwfD6gXunDnkKfWpKkdtb6lX5RQJ6N1NwgTGNwnhTmNbmO7sl/7qcfs8RG/Ze3+pWheqAm1q7mvSMLstS6WsuxrLHR0QvHYndMKHun1FR6/VNDOgW58o3a60xgDjjDqzczlZSm91gKPcVv7YLIKqyi37drVIIxi18B6La6n8L58j0QU/9e3ODBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeCg79KVjg076AtgUU+g/C490JoRB6/FFF6ZMtOS564=;
 b=pTg2VSTFKxiqednFwTb/8uAW2acZMYfvaF+IuCQsB7xoBHCOHKMD1akEuYfoGDvF0QXLDvEe7hkY91XPg6e4+u0URmBBcDDBkO+NAWFXebBDVikpg+0i/JkUQ58D7QT2tH30w65W/9Sd/UARPjSDWaHBvwM/+o6WrFfgAOzhKQsxxd5duD1u4SdiQe4+C7C5AJ5tU3VZHGMZXYi06j8Ixl4/F5H1mbBMk+mOHCfLKZSR+FNE7s+cGNJ2K8+k6kyft3gEC5/TLDahtYnV6MQW7IWj5o4rRcqDn5KMqEQr6p+0vTQqQXbbV+mmreMd2s9KzA44nuqv2v7Mjv909Gu/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 LVWPR11MB9907.namprd11.prod.outlook.com (2603:10b6:408:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 10 Jul
 2026 04:50:52 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 04:50:52 +0000
Message-ID: <35ff3b8e-d025-4ef5-8542-1548bb334648@intel.com>
Date: Fri, 10 Jul 2026 10:20:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 01/12] lib/i915/fbc: extract
 intel_fbc_get_fbc_status()
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-2-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-2-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|LVWPR11MB9907:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b55322-d483-4e90-39e4-08dede3ed1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: fHIgHdyiVvrEdVDIwpJ5KoEPpz1v4/8VO6CA8peB/RKf5EDGzrPXmYyt/4OODybvD4+vTKReBK+QCrxlqygfxJEmQFYWuC1jwoAQnPGLTem/3+9M44bepczj9H7wDa2pkcO50yUVcKxW5qZn/En/4Cz+/l6gKRhF+yt+8dWk26ZNXjmR4EfXQJK1iqNM5Q6hxvd6WdKMlB9yAegRCoWj2FGlS+AYMOcqqosd/cmPclyas3L9bVCvjhdd2PYVV7/z2wN9yFhFnIHOFg+0JnfRb9mz5ipi44kRU3Ex3ZMtCrMlgsXyy46II82fpseO5o2dtlmN68guawMTp4OKOVdgUyN5EdiTurOmikjX1UgeQIAKYenkoQjoORjtEyscpxwrsQZyOFozEdN4+CR9YzybgMC74Fe0ia2lAdmc7JuAPnOCEOlkzzeHMakYPp11PQyza7E9BNcg/tkihLjhtdl+c0JPwqtmDkEKExuZtOf2o+qpiURI4l4PZWA9m4UjKkLZ19tPOFr3Nd5h3lsWO9+GMpbXuQP9OXcL3ZSjdgEGsZ6DsEN5yx1xAZ+1qP7dovjC7Q0bbu9s0f05+DArA9FejyPBuZjAjhnFhV9U+jn2V2P0k2Ta0qNthynWuukSLcRwJlXA0X/z6TU1TAMb9YnEH+YjhAlGR/pv9qyuUBbWW8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amdGa2pmOXkydmIrVFF4OXJzTDQ5cHIvTHFOS2JDS1hXQno4azc5ZEpxZVRx?=
 =?utf-8?B?Wi9UdXpYY3p2LzgvVTRZN2RwcFNLdDZHWW9rcUhUaDNMT1UwbjJ2ZVJoV1Ny?=
 =?utf-8?B?dm1GN0kzWVN0NWZBWTVFRng1ZUpVdUZzNXMxYzJUMHZ4Ym5jWjYzcWU3SkEx?=
 =?utf-8?B?UG5BNlZHTW1lbFhZRmxDd1RveGhMS0I1b0F6MC9HT2o2eUJCdUNRQTQzQ1NK?=
 =?utf-8?B?KzVXbTYyZUpoZ2VqMjlDNzdWMm1BajVLWkVFUFozd0U0bURUTjFKZEhidVJJ?=
 =?utf-8?B?aURCZ245T1NrS0hBR0ZZeGNwclUwc013d0NHUEpCTHJsaTM1K2hVYXFpS2k3?=
 =?utf-8?B?TXhYckpwekFtRWxGZVBKWEdmd1AvOG5qV0V5aXNCMlk5S1BZMldGQnNxV3RR?=
 =?utf-8?B?T3RWZzI1ZGdRU2tZYTErK3pTRjFvNDZXcFd1NXZ0Vk9qWkMrUFdzYmpqbXNy?=
 =?utf-8?B?QkFhODduMlNoNFYrb2E2dWtrMFRpYUpmM3YrSmtUeHIvRUZmMUdJRFlKU01o?=
 =?utf-8?B?THVWWmpoTDlkbTZ1WUdhTU9vUnJ5elYyT0g2ci9tOFI3MjZWRGp6TUg0eStZ?=
 =?utf-8?B?ejNEMkFTMTR2ZzhCM1JVV2ZnTGdicmdXT1owaUVEck93NDJHQkhSNFM3czY3?=
 =?utf-8?B?RjM2V00wU01mWG1xamtIT3JpdXEyVFo5cWlhMTBzVGRKdEQvL3lIb0owd3B1?=
 =?utf-8?B?VXMrS1lvOXkvZlBzZHhKRkY3VklzdkpOcEx1NE5LU1lGVVdtOWltSm5JUUJT?=
 =?utf-8?B?ZlpBTVNKbjI3ZUNmRXdpQ3hXZExoNlRVcldaL1hHRG5aRUdWbVZyWHo5bUdi?=
 =?utf-8?B?UTl1aFdMbzVCNkVPeTRLTnZjMk1EcGNLVEpXYS9oV0NrMWc2alkvU0tER01D?=
 =?utf-8?B?WnZubTI0SWtaeStQaEpMUnBGcXBXbnl5ZVpzdGRzNlBIZjY2Qk9QM2hrakdM?=
 =?utf-8?B?NUtCM0VoK1M1RUdxUWVsRmppSFU1TWhPMHhTQkZnTW01NjlZb3NrdDd2K2Jo?=
 =?utf-8?B?WGJPcmg0T1pDUitkczQ3TFZqM1c5RUtWNzZpcm5CQ0lwbDFIcktQZ0I5U1o4?=
 =?utf-8?B?VHd3WmF3dE5IVDFXTndydmU5dHlhN2dKUXl4V2tRd2VKZ3BoZkpreWpmcDNk?=
 =?utf-8?B?OUN2akJadWJvSnhITWdGd2c0eFVnb3RnY0I3RUJtSWswV1E1WUxTK1l6K0lK?=
 =?utf-8?B?Q2x5STV2eHVxWHZTbkF3anFjS01TU3ViUnVhWkVSSFQ0OFB3N3hqK3JqaFkw?=
 =?utf-8?B?MUtpTHRPaFBCQTBVNVUzNzNPcmVIWW5yQ1BRbS94a1NiM3FGbjdUOXpuYk9B?=
 =?utf-8?B?U3pLb2pVeTZrSCswdlNFM0JOdzFpa0l0bk5NNlY1czJ4eUpucGtYaFVjMXg0?=
 =?utf-8?B?dEhjS28vNTV0VmRUNjlYVnNlcFZvLzlySVAyNDZGaVJlay9jbjM5RFMrbCt0?=
 =?utf-8?B?OVBJdkN0T3RhS1FyUnQ0SllHMzNQekNaaXp4Mk5ZS3FFTjJiL3BXSHJWSFdq?=
 =?utf-8?B?bnBsRWRsOHpaNzJOS3NNYnFudkc5UHBEM3lsdXBPdTlLT1NLSG9kdVhEdzZn?=
 =?utf-8?B?czkxNzFZNHQ5SnVnMGdSZWovSkRzTVVibEFqTmVqYzRPM1ozU1BJOXZPN0tZ?=
 =?utf-8?B?YjI5b08zRzZjd0JnUGFtK2xiN0srbmUvQU9wY2xrZ0ZxamR4QmJ5a3JFL0pL?=
 =?utf-8?B?MVBPNXpyVGhLWG53a3ZaUEFLT3A0SkwvMUVlRXZJeFZ6MWdjak94NzdSczVu?=
 =?utf-8?B?Y2JzQ1FxUStuLzFZQSt2Q3VBOW84akwyaTJLOXluMVJJeTlBYVo0eGFtVG95?=
 =?utf-8?B?blFoTDUyTG0zNWJaRU51M1dmdG14MWdiOWlkRVBsVC9hWTdRamx5c29RVFJq?=
 =?utf-8?B?d2FoT0JiTVQ5VUlWY05SOXZUS2RVaDl0NUVoWi9rak4rUnIwNjJnS3FXSjR0?=
 =?utf-8?B?WnZqbkdtMWxtM0J2U0toWXY4QUxUU2E2dHBSN1FUQ1R0YXBTYjFKeWh5ays2?=
 =?utf-8?B?NUpyTDZEek03OEVTV1ppcG91NHJCZWZnMHkyY08zTU1TNVovMCtkb0ZuN0d6?=
 =?utf-8?B?ZXBaN1N3c2p3eEhGYmpPNTUxRHJQWG5xZFhONjU1ZW14cmxPVGU2U04yK2hj?=
 =?utf-8?B?Z3d1MmZFRmYrTTJOVkh0QzhYeWp4NWdpVWpTdDV2aUI2aDYxbjVITENXeFpk?=
 =?utf-8?B?THBxNlJ5dlp6d3Y4TDVvOC9HdDk0bStGRjZRYVo4aUxoaEk4QWxucXVSMGZE?=
 =?utf-8?B?MFRLZFpLNFppYzFabWVqTllsNzJFaG5aZExsVTlTT1BFdXZ5a2lLT3djMTJO?=
 =?utf-8?B?TE11b1ZOUnE4MUkvalZ5bk5UUWdIODdNd0tmQmdhY2llUHljd2Q2WHF2VGdH?=
 =?utf-8?Q?YROQopo2CnJJhd8s=3D?=
X-Exchange-RoutingPolicyChecked: LPBH/2/aQ5NFLEjiGXN/DIrVs5j3g4QT15/9jNpAj77mdpjgS6iT82JjUNda8bEfk36MAUnNK0xAOH6PAM3XvHuT24z5Qd8jAxe8w+QazrplMVtnElc88yPbPRieXQswCcoMA0UuC5Gr2iQTQVlJXVd0umMw555EVLM5WcODHHdM3HCU5pGajXYBXSA7CEYP1uWboY6fHE+yS28D2xrff8juBP81MVdAgxcTLlMKFz76fvSd79vfrDYFGtXu3VQyrPre7Hlr5v8NECr1TKfDqc70qmry0bV/mmFzBBThEqHgTI2pTTMcJhD4/zFhwryvLT8xGuT6XE7B+0tBefjlGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b55322-d483-4e90-39e4-08dede3ed1d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 04:50:52.4241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wje6BZ0MhOOH1zzjRZ5xHG64Pwoj/V9coNT7W6CNw0nzqburKd94OfT3sBVtE77+U+kLwkoGd2/qhOUYYxY4GJr5mGJsu2vqURFUxoqkCsqPU/pxsfkvrLxRuSlnutXL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR11MB9907
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



On 02-06-2026 02:13, Vinod Govindapillai wrote:
> Code to read the FBC status from the debugfs is being duplicated
> in many places. Extract intel_fbc_get_fbc_status() to be used as
> the single source to read the current FBC status.
> 
> v2: update the function name (Santhosh)
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   lib/i915/intel_fbc.c | 55 ++++++++++++++++++++++++++++++++++++--------
>   lib/i915/intel_fbc.h |  3 +++
>   2 files changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index b8c714d43..4e629097a 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -22,6 +22,47 @@ void intel_fbc_disable(igt_display_t *display)
>   	igt_set_module_param_int(display->drm_fd, "enable_fbc", 0);
>   }
>   
> +/**
> + * intel_fbc_get_status_crtc_index
> + * @device: fd of the device
> + * @crtc: crtc index

nit @crtc - crtc_index

> + * @fbc_status: Buffer to fill the current fbc status
> + * @buf_size: Size of the buffer to be filled
> + *
> + * Read the debugfs entry for current fbc status of a crtc
> + *
> + * Returns:
> + * None
> + */
> +void intel_fbc_get_status_crtc_index(int device, int crtc_index,
> +				     char *fbc_status, int buf_size)
> +{
> +	int dir;
> +
> +	dir = igt_debugfs_crtc_dir(device, crtc_index);
> +	igt_require_fd(dir);
> +	igt_debugfs_simple_read(dir, "i915_fbc_status", fbc_status, buf_size);
> +	close(dir);
> +}
> +
> +/**
> + * intel_fbc_get_status
> + * @crtc: CRTC
> + * @fbc_status: Buffer to fill the current fbc status
> + * @buf_size: Size of the buffer to be filled
> + *
> + * Read the debugfs entry for current fbc status of a crtc
> + *
> + * Returns:
> + * None
> + */
> +void intel_fbc_get_status(igt_crtc_t *crtc, char *fbc_status, int buf_size)
> +{
> +	intel_fbc_get_status_crtc_index(crtc->display->drm_fd,
> +					crtc->crtc_index, fbc_status,
> +					buf_size);
> +}
> +
>   /**
>    * intel_fbc_supported:
>    * @crtc: CRTC
> @@ -34,12 +75,9 @@ void intel_fbc_disable(igt_display_t *display)
>   bool intel_fbc_supported(igt_crtc_t *crtc)
>   {
>   	char buf[FBC_STATUS_BUF_LEN];
> -	int dir;
>   
> -	dir = igt_crtc_debugfs_dir(crtc);
> -	igt_require_fd(dir);
> -	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
> -	close(dir);
> +	intel_fbc_get_status(crtc, buf, sizeof(buf));
> +
>   	if (*buf == '\0')
>   		return false;
>   
> @@ -51,12 +89,9 @@ static bool _intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level, char *last_fb
>   {
>   	char buf[FBC_STATUS_BUF_LEN];
>   	bool print = true;
> -	int dir;
>   
> -	dir = igt_crtc_debugfs_dir(crtc);
> -	igt_require_fd(dir);
> -	igt_debugfs_simple_read(dir, "i915_fbc_status", buf, sizeof(buf));
> -	close(dir);
> +	intel_fbc_get_status(crtc, buf, sizeof(buf));
> +
>   	if (log_level != IGT_LOG_DEBUG)
>   		last_fbc_buf[0] = '\0';
>   	else if (strcmp(last_fbc_buf, buf))
> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index 8e2662824..60b86e366 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -17,5 +17,8 @@ bool intel_fbc_wait_until_enabled(igt_crtc_t *crtc);
>   bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
>   bool intel_fbc_plane_size_supported(igt_display_t *display, uint32_t width, uint32_t height);
>   bool intel_fbc_supported_for_psr_mode(igt_display_t *display, enum psr_mode mode);
> +void intel_fbc_get_status_crtc_index(int device, int crtc_index,
> +				     char *fbc_status, int buf_size);
> +void intel_fbc_get_status(igt_crtc_t *crtc, char *fbc_status, int buf_size);
>   
>   #endif

