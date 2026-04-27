Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEADDFF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 05:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629CA10E199;
	Mon, 27 Apr 2026 05:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9bo7kOb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEF910E199
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 05:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777266579; x=1808802579;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+N0sprDmNwK/CU0GqhIzICzM6hxfCJXYT+Egq5B71mg=;
 b=Z9bo7kOb/HqoNtLRfVE+XjjGONdWn7QAyC2943lCTVepTCFQivSz0+dA
 VNLh+BNRdysa3zfw3uoyB7rb3uFkQIwmd3hvsLmy72J3hZ8qdlbM1fj6s
 DH2H8OeI0BX1OBvb5EtfSdM0bKxo+Pjl5yY/yvsJ51QBIdjuXMLMhF921
 Q8E/bBshuvtJ1ytF0x6mw14gV+qX4dtDx16ooJ15y91L272SSeAM+uTrh
 ykZUkYp/yHr5ZUzwqrEQQlHObs+wmd1KDDudOXeKUVECwqprY9xIL88Df
 XwVVIKta5k4Xu5/GNAjdrBE1BFh9pfmJiG7nNdNgPNEIsfJZaKGIZ8H7Q g==;
X-CSE-ConnectionGUID: gy+EBLpvQIWMmohI04GJZQ==
X-CSE-MsgGUID: R/uAqGiCR0GgHVG/JAWRqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88460275"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="88460275"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:09:38 -0700
X-CSE-ConnectionGUID: 2jZW3g2gQGC9mJlqWsVUXg==
X-CSE-MsgGUID: U/UG1qVDRr2oohXxfqYVQg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2026 22:09:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:09:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 26 Apr 2026 22:09:38 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 26 Apr 2026 22:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URJuYHrklZ+y6khNxkG6UcgKa8/rCuJ/yUxB6BxwfvTwu3Pe4Y3FEtodhbLRb20QdR0Ww8O+ZQ6wmpa6oNwVowCjqiMXBWFGcyWy0LV311azRE9rZDnXJQ8IDpHmUTeqjZ1kDPXJEHNw4VbSEPU/i9TYqgrjxwfJYokZmnqoXWohvZWfD1LzbwldbnyKEMuQ35D6v6c6Ve8C3j/JT5S6Rp4peibsBFsQq3HaCWw4SObKsWUPF1isiwen3HGPmxTZDzBWT2IyOcglmopPr9Klt1xkQOLiftXUpkB2Cgzu8Oxau/MkL71VtQwkgMFyZsMzQBkGPOQGGrh22GUX+pg9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PwXjjcmxEjcyHaD0iohjGGVY/N2+edk30jdyglyAYQ=;
 b=CWsgc38l4xYesW4HF1rWvEPRZ+F8qr1UGnId6Ow5zqxOwMxYLKwQmWE+bxU7fVwHPuaEwasohSCQFbCRWg/5EgVTMswEArzXytPPIo9fnQjrS1MLJ/e3pGWF29Gl/r8wKpJzhNMqiHFR0YYBphNCtGtgee5x/Wv0A5vyfu5surRi1tFBnnk6zNFrUO92LLyaxSFWYI52nODQ55armHrXvNY7mkx5bzi8h+rwmVKU+3zBWdAwNb6hqEV0ijQq2ZClLiLBpaDx8ArPjXEC9GgQXZV06PgYk6vc4sS6z7odWfi8NO1hvpPYvhGBLvkCLB7aogWnE/NAEZx70nm0epUyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by CH3PR11MB7793.namprd11.prod.outlook.com (2603:10b6:610:129::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Mon, 27 Apr
 2026 05:09:34 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::70ce:b376:4721:9b85%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 05:09:34 +0000
Message-ID: <695ee632-f5a1-4b2d-abe1-ee3f35d2ee48@intel.com>
Date: Mon, 27 Apr 2026 10:39:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/8] tools/intel_vbt_decode.c: Include
 linux_scaffold.h
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-3-ankit.k.nautiyal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422034335.2326098-3-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|CH3PR11MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0e7664-fff7-47b9-3b96-08dea41b2bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: uW0aTmu5nBE5ArztwUrt5jwYEh83Q+7pT7/HI+7cI8tRDYPlw/aBtIgebRMcrMkruKYAzHfJDHE4rXX93+UJuBm7a83P3piEglNgN6Ma6WbWUP2T6AP9fX+QwldcsG6q1U14AhFeIzNTfli+a/BJ52Z2+6ek7njuYUtENmooiaW3YK6DnypRGe3+ommV9l+ItPz6CGLaDg/A+q9pwk7s02LcGHSFNeNu9UX9/OOapRoLQZUqvTP27eCK7vomZ+nduYhurhyC+6lhIW0O4lUwEsM3uQocj/9ShWZbNE7WxcRfxCpFZilGtYeIRPJZcJdhGRE0vXNymjjAvdepqTdEeCJD05GSV9cAKDDyaSY8p2MfUTHqtfv0y4+Yqt5uuGiEJpxSBfivijHgJpNRlKJsLxCrYChGBumQvVl7WlDPUb6MLuLF8dQAl/HPO/YlWD2YnbHrPTSdnqU4fh/bIHhb6kaNNVMbzwuzbIhobF0blcu7FxDWxEPskAF/N/MwuiHwwxhyfDCYxAteAjOKqLgodMLJZPDpjbOUraVuS8CD7eWrKGoAfcolMKq7yVDjkNb1kTEKj9TVyr0eLZmeeHm4Y8sP5yqPsly7Y1kckEceEDx8SdTsj5+a1b3WBqXTzncC0h+sweOIc3OLv9iVvEPdIHBBEU8nBCO94fe2GKQCc+Ho+KtdxGEmRIcUi6CPJzJUGlPRvojpaMybSJIbVCFb65eOChnN7cpy3U8wDmQDoe8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0hCaEJIRkRDUjYwZkNRK3dEbTZCYU5kWlpYYjdxbWt3cGNXYjFrbW96YzE0?=
 =?utf-8?B?Zmp0QlVkanlPUzBGL0tJM3ZNbCtHRUVTdjl2V2V0VVpIbVVXQnNrRzBYOU4v?=
 =?utf-8?B?NUJyaVJ0OWtNWnRNemFLcGFkTDhwaWJoZEVRTS96SUNSY0tlTG1WYW9WdFhU?=
 =?utf-8?B?MnBCU0ZBb201OHhGU3dQaUhtT3lzVS9LTExzZmtkemwzTkl1Zkd6QmRCU21N?=
 =?utf-8?B?TXpWZHZ6K3FGekhaZGFuVzNycWpXWG5VUy9RakZCRmZPK0c0U0MxZnROS2k5?=
 =?utf-8?B?Q2ZXWWt1bm56K0JkcStKYjRKL3RwQWFmOUNlUDhpR0ZXbkcwVWVQRGIrZEs4?=
 =?utf-8?B?MlJxRS83VVp5N21Bdnh0Q3YxU1VMZ2s1MHUyMXlTRHAxT2M1Tk9BN0VpZmV5?=
 =?utf-8?B?aWYzT0JkWGhtZy9DdUxHRHlCZHhKRjhxTFpNUktST3hmekF0UHpRQzNzZnhi?=
 =?utf-8?B?UWs1WmxmVm5XTU5IUktCKytRZEVMcjZaVHRlUU5rZk5UQWNKVkFQaFk4aklL?=
 =?utf-8?B?bFlqWnNZVTl3dDR1UWJwek80SDhoODZ0ZTBqdlhZMnRaV0ZVRGk4bjJmb1JU?=
 =?utf-8?B?NjZWR3Q5WnBuZ3R1STVQN2FqbEhncW44Y1NyZDhmTHkxVGtWZ1hVM0ViRFkv?=
 =?utf-8?B?N2Zwenp6ekFSa0xaUmhRYXhlcDloOGJOUG8wS2FMQWl4bkIrSFEvN0V4dGh4?=
 =?utf-8?B?TlRQQTAwSVV6eEVJV3ZJRXhwQ0hacjFKRkFmWkNkUHBTdCtTbTNER1F4R1h6?=
 =?utf-8?B?SU9oWHA0b2xKTGdHemF6d0N5b1IvblVMVmhkRWNHcnhXRlNqU1RObjdTS2RD?=
 =?utf-8?B?amptYXFVcjI4bE5pT0JrSmVFM1BGUUV2Z2NJbnNxWkpsU3B3d0QxT2laVFls?=
 =?utf-8?B?VzdUTnJUOFNzZVFPQVlITmNnSmlpSm1JdTRuVFBkYnlCT1ZaZkNucCtYWnF2?=
 =?utf-8?B?Zk1HNEZQOFdVNTNQU083NDdzcE9nZmpXOWpzdFREMVNjRGl4cXRpVGZnNjBu?=
 =?utf-8?B?WG5oNWhkUUU0ZnZBZGJaL05QcU8yL2YwTFhka0Qyd3MraFhHUmtKVTYvTks0?=
 =?utf-8?B?WGhCaXlMZ001TlJwV0ZuenhKNVZFRkdUUHRydCtKc3RmQU95d1NpeFFMR0ho?=
 =?utf-8?B?R2x1aE1sNVlxSlZOZFJUN3BGWFNMUHZqSUpZbGRpTlJrRS92QnNvV2xPeEl2?=
 =?utf-8?B?OTZ2TTh6TVhBdFRoMzA0ZitTN3B1amJEODk3ZXdxNXcxK1VYTm8wbmc1NUQ0?=
 =?utf-8?B?NHJESEpBbFc4WExaVWVtQkRWQUY1NUNSNlU4b0E3ZVZPSEhubUZ3UHdNNUxJ?=
 =?utf-8?B?ckFrdE13Vy9JaGRISE5aM0c2MGRsdFRTRjRDV05JRVViQjJEMjNJcEFlZmlR?=
 =?utf-8?B?WStGaEdlaFdxaXg5M0R6YXBSZUErc21KTzJIQVFVOHZhaFBxK0F2TWNYSDZD?=
 =?utf-8?B?WEdkTjdCSC8xZDV6YVpNcjMwV2hxYzhUdlFCdVRjWk1jRm5jREJpWk4vSm9T?=
 =?utf-8?B?a0xxMUdNQkVQVzZ2dmRZTUVMY1BxaUVRSWFLZkpFM2RrNnhsYmlqUjhFY1Fy?=
 =?utf-8?B?WTZHNThSRm1CdXMvRTRQbVJYdVdPd2tsb3AxYXl6VFh0ejZyNUhSVks5Mmw3?=
 =?utf-8?B?Z2JmSWZadU5MaXY3cExvcGsyQ3Y5dVdOZzdPSHkyZW1XUW44a0s3TWs1dDNk?=
 =?utf-8?B?Z2tqQUVaTnZGMGxJTVEvdlRPVlVFQ3FGZElmSVNRcURtRkUyamYvalBCTVV0?=
 =?utf-8?B?U1ZRUzR4QmRBaU9PNm9oc2JESU1aMWIrTENJMFlkRXROZG9oREhpN1FCQUtL?=
 =?utf-8?B?dVd6bkhRbE81VUFpdTF3V29BWlNFSndINStDV2ZZQVdrbXYyQnZjS2VLNWxF?=
 =?utf-8?B?Z3JWa1EvSWsrTDRiYWhHVE43ZGtrM2JQSjE4NEJBZ2xrM3ZtTDFpNWpNbGY5?=
 =?utf-8?B?WG9rSEdNejlFbmZnNDloaHhtRzRWUWYvaXFPWDBhMUEwN2ppYk0zbzRrZ08v?=
 =?utf-8?B?S2JQYi8vY1RjM0pVMjRXTmlxYTcyaXgrOUIzVjkxM2N6dStONDZaaS9BSlNo?=
 =?utf-8?B?ODg3UVBtQ0ZKdXJGSDA1N3h6NGV2ZGFRNlNuakZLYUlaSjk5eFY1Rk1JTmxn?=
 =?utf-8?B?azl0UTkwNUtZeHNpSzRQdWtCK0daaXBHQWI2ejVpRHhzWDJhV0oxMWZ0bGFn?=
 =?utf-8?B?RTVKVjdmNlVjRm1mOUI0Nm5LaEs1NDFXM2FuTnE4MkY2eDllcjNvbnJFcWlX?=
 =?utf-8?B?TkFPV2NCUy9MQWh2Ymd1azJ0MVBwWXBta01vYnp1UzZSWnJ4ZGJLc2c1T3oz?=
 =?utf-8?B?YWVWeEpFM0FML3hhZEhucHdhNjhJejBWTkR0aXlyNWhlTkZjUXVKQT09?=
X-Exchange-RoutingPolicyChecked: A63BgvpIRJILBoosSmNC9/06VyAQI5sor7+sAdkS3x1bnPsiOV/SB6BZcdKrhqTNNdYXkkphlMOC94bT8oWOZmBg+Rzk21l963yBib9s3w11lA+WceFzlcQLNllOw87anPSMr2hmfqnJY9hfGDuN41oomDmzWsChd/1vLQn2FdI5lmsmB8A5nozns6mzdPO1Tz/FseI2nIiXGY6i7yWwN1ky5+mGOD9OqN4MLwIGru61eDej0H1jb0bj1tQJvIwM+DjJh1CpRrfxGWZIgWfOhyJr6OZXTPP0N8duuC3fWSGURDo2x6vz1aXZm38Bv97qJr43i8jfFAgzehwIHPMPHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0e7664-fff7-47b9-3b96-08dea41b2bbb
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 05:09:34.1438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDa1OFhoPBp5ZrEGkDO4vEzuBfvKLpElTWkwDd5xfHcbJim98ZHZJMFlQLwIkNzzO4EawvBhy2REp+DMX2c+0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7793
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


On 4/22/2026 9:13 AM, Ankit Nautiyal wrote:
> linux_scaffold.h provides kernel compat macros including GENMASK and
> BIT_U32, which will be needed by intel_vbt_defs.h in subsequent changes.
> Include it in intel_vbt_decode.c and remove the now duplicate typedefs
> for u8, u16, u32, and u64.
>
> While at it, move drmtest.h in asciibetical order.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tools/intel_vbt_decode.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index d4aada743e42..7785e9e82b1f 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -38,17 +38,13 @@
>   #include <sys/stat.h>
>   #include <sys/types.h>
>   
> +#include "drmtest.h"
>   #include "igt_aux.h"
>   #include "igt_halffloat.h"
>   #include "intel_chipset.h"
>   #include "intel_io.h"
> -#include "drmtest.h"
> +#include "linux_scaffold.h"
>   
> -/* kernel types for intel_vbt_defs.h */
> -typedef uint8_t u8;
> -typedef uint16_t u16;
> -typedef uint32_t u32;
> -typedef uint64_t u64;
>   #define __packed __attribute__ ((packed))
>   
>   #define _INTEL_BIOS_PRIVATE
