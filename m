Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB68710706CF
	for <igt-dev@archiver.kernel.org>; Sat, 14 Mar 2026 11:57:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BDD10E4AF;
	Sat, 14 Mar 2026 11:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGdLdzcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10F310E4AF
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Mar 2026 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773489427; x=1805025427;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PU3BDX19DvkSoTffIxM5pdWsNodRcYfsaJ0RpHzZ+aQ=;
 b=HGdLdzcV2hzVbc4XdMbpRVFSD3fFqVira99hzcSlTOkWJbWMkLNjsBLD
 Sf5jMlMVGF1Vp5VV1mceltmu3HohjXwAvffZGYJs5MrL2Yi9Gg4ZUOw5x
 vKFihcnwfBOuV70JMexSzh3/MMhEPBLxdjeFudfE0kDzrFpw+GQavIAUg
 dzHZX+26/8Otyij8hEljEeL1Lw4lwknSQe0cYxHq5F1qohep7Ssxd8i+N
 p2WAe6XcdsgJKE7oUhwP0c9nu3ILHt1RddqpZiZlPIaPyMeOmKvQZilMY
 gy+QCjKIInHOAEqMTag8jfWHw7bC8u9ataxpaRkOjwtI7qMnBHRhs+4jg Q==;
X-CSE-ConnectionGUID: aHiqBZxfS8CIcX+qoF1L2Q==
X-CSE-MsgGUID: 6cW81WBsRci1eTCWDzMAnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74493884"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="74493884"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2026 04:57:06 -0700
X-CSE-ConnectionGUID: Wvy/fTCMQleek/cORrajWQ==
X-CSE-MsgGUID: QyYzxQH4QM+NVVlUZAjJmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="220487286"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2026 04:57:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 14 Mar 2026 04:57:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 14 Mar 2026 04:57:05 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 14 Mar 2026 04:57:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0ZK6uryFFl8Hp0YaE8euWmmRQryDSgufNHgZco5KvfLkO7NtqkFM7GxOLX/8/QzSdphWQQP+xq4PHInLSXWMYEgxp7DvXf5GRrWKigOpgQjTWKH6fP1E3C/7OMdTjOJg0HwTPwBUhh6sAesZowFi38O1/Qp1hZBnx25o5lTtcLwR3Y51/1a4OlDs9nLadVP3cIO/tjWVLPSlfD2Z9VQHXv8kXhk6WPpdOIPeLa1E4sg1r+fSfgXY2Jx9SfKBQB1BmfHEvB2nt54zfmyeLMads1oWEu5A6nu4amhI3esWEc2HwtsZD8UPKKG7lNopELTEKlPpjAKY1iFu8iQLPrAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seD6jKaWFhcuvbx+q84/XZ+K4QHA7pYfXFybfU6hRCg=;
 b=XmuDYcxgIQlcIzmIfsrxtKUEZgxcR3AZd87QSyAbzEEwZ1vMNPJ3u6CnLDW0kh131oegKHu11tqmTZgxhocK3sbOBkRL7d4aW+toSe3FgqEvO5pWAie87IWO8waNPDHjptBurIDujJgYky5Loh3e7n7eddflxoQWLMxQ5WLTH3X0NERsVZTSpsl69TbmXR6Ey+DyZSHEkCLc77hYBoEb9jxxkOcTw5N9ol4pydE/shmsBDa6eY3zE7EC3yMsom8f5RxB9MHIMW2K0xHjWic3j2AV/sF2OueruGlIKT2tUGk75swinIgAQYF78ocQsKquX8a3rL3X8JDVfbOuJOOsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Sat, 14 Mar
 2026 11:57:02 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9723.006; Sat, 14 Mar 2026
 11:57:02 +0000
Message-ID: <9784b105-06b7-4ef5-9ccf-55de50ab57ae@intel.com>
Date: Sat, 14 Mar 2026 17:26:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 4/6] tests/kms_flip: limit number of outputs wrt
 suspend
Content-Language: en-GB
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
 <20260309092528.3336467-5-michal.grzelak@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260309092528.3336467-5-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::8) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 8040d063-3ea7-4d49-6f1c-08de81c0cdf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: iP7SVg4Pkx7V5LZODFJGK9iJbaZ7+7bAzKHqZqIwhOh5pHiL+W6DULbwoPnZ0ZG+cdPS43VZsjJTgW5t57R0jCmq/CazddxT59F3I3Oc2JUy9V7UmSOAHODeSXaR/XeRO8aqGnkvvu8mbLKqiM1R2Gw/C/vtNuent4DATs/RtwC6F1J/zo5CvDTDf88VwlxIJKOutOheuAIaeRgx0xZySDrwOhCEwTLOnsTQxhL+hQJmTWQzD3c8eF2HBoJGHG7wJv5BPclLhlw7uLadDHI0uiFg6COIPl3bJiTcpY6Z7MRQDBs63ZFIBEJSkOxEHm84lyiaF6+NIEEcbaVllia5YC8KZlDJ+aEcYYl0Hi+a4HyARv8lhed5W+irFVpaq4xfdx28Z8ZTNqkmea2eryQzkF+L3bGuQOHkUMejS14sbwamXpvwHXVcO3Qy/J8+a5ALZdsIJX1XDYxPm/iF0WycJPPRmWbfjU9h0LBVi1wmGn10FX9D9JVovCaWEPRzGA/AdNOuhEpdEBxAT6Po9pMdbJBoQkwB7qyd6i7Tn17NMezT4P72dWuREJFI5jOicpMy3aBRmtxUH9+3irTK3J+0L+x19VmarG47dbEHkGNIXMKljDfnn+TdcTRcAy3ngc4qO//oie2gGPda/wB4ja74c20tQt1cYl3RHuh+3elBHRzY0bwkYywZXb54MXXk+j9WUn8rv9P1Y9xeBadjmQzgeZG8/F5PdJuxqCl3/wO62cc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnU5TXN4QmhqWkVwazJTUThJY0hkWjE3YVpXR1N5SUtKdm95SnZ5VTc5N2hD?=
 =?utf-8?B?NVN6MEY3MWhsVVhPZmY0K0FZMWZzeGdOUWZnbzFJZnZQSWtkN283bFhuSzZq?=
 =?utf-8?B?ME5yQ3RpM2dVUUUrdE9YTE9vb3BtWVBNKzQ1VWRNN3EvT01MTThtSDdpZlF4?=
 =?utf-8?B?SzlFYS9zWE9sNGtQSG40dmNuZWVIY2ZKd2JCK21GeUU0bEVMMEVyOXFlTjdD?=
 =?utf-8?B?OHl0M3RUeWNVbFQwelh5c3J4Z2FSU01vWk95RnVVVTRXRnA0QndYSkxLSDR1?=
 =?utf-8?B?V2NMMC9ETDhGQk83cmswZW4rODJRQnhXVm9JUWM3YzA2MnNuTm92MTl2ZVYw?=
 =?utf-8?B?MU8vOGd5aTFsNnRmU0txUHRDVk5Bcmc0UEpLR3p5U1BiN3JhRjhDRWIwSzN5?=
 =?utf-8?B?RmE1N1k1RzRQZlM2ZFpmMEFxdDZleHdCRWZIdy9ldjZFMTlaeFl3QW5ZeUw3?=
 =?utf-8?B?RUtIOERsK1RuTVZ1dEFidjlUaXVudnFoR2hJTllHSFdVZDFRNFNCUDRtL0lB?=
 =?utf-8?B?NlBWRWQvTWJuSHdScVgxZG50NjBqdG1GVjVkeUwvRTJWenhaYUx0aVJvVFRP?=
 =?utf-8?B?dEVneEdjTlFYc0lZSk91WXhPL25FeHJZQ3pwNnI2RTV5aisrSHIzQmYrWTdI?=
 =?utf-8?B?NlRKQlVGOExrZU9MVFVMMWhKZXZJZkxYWEUzdE81cGw5eHN4N1B4ZU84Sjd1?=
 =?utf-8?B?Qmk4Y2VuSmtpc0trSWIwaW5GeGQzS0FXRVZ5N0QyUFdad2VPTEhWa0dXWFZF?=
 =?utf-8?B?QkRxU1BQRFpKTjdJNzNZOXk4QmpWZE9weXhIc3lGZlFSZVNUOHZGeVlBcnRP?=
 =?utf-8?B?UlVoZVpzcWZkRmMycXdoUERtYzJoMjlRTDF3YndaZlVGd2FMcngwSFNFU3FS?=
 =?utf-8?B?MFVwRGxKcUNqZVpySi9CQmZick94eWc4L3JPaFlibjkvTS8wY0cvSDAxOWtr?=
 =?utf-8?B?Rk1Rd2JVaXZCa0ZES2xVL3UrcldOTklndm43c0tLUUJ0eURLcXpsaHpRb1Nt?=
 =?utf-8?B?dU82VjgwNnRBSHRUaGg5a0Rmakh3U3RSNkpISjIzdzQrSldvNG9Fa0VYcTBN?=
 =?utf-8?B?L1QxZ3h4dm8wKzgvbkNSVmpCdlRHYXFMY0RKNE80S2RYTlZlVlYyRjZ4ckdQ?=
 =?utf-8?B?OThvbHkzNHRocVM2VXVLd1llcHFaaGFBWERSUTBTREpFTVZxMWdMajlKK29k?=
 =?utf-8?B?aUU3VUJrM2p5cHFyc0llN1V5MllVZENlR1BYbEMvdklxZEVubUNnN085RXRO?=
 =?utf-8?B?SGVEUzUwNkU5RmNMSlJNNkp0VzNPS3hoUXNrTEFrOHBScmVDbHMyQTE1TGZV?=
 =?utf-8?B?YmVNNDdPay90V0NkZlJvZmlMMGVVdWRTaWhSL0ZIZHQ0eDJuZE5NcXFQbm9k?=
 =?utf-8?B?ajBaekNuUHBCT1BGb25yWkUwTlBsVjlwbVdHZERqS1NiemJJN0pueVZSSlpW?=
 =?utf-8?B?a0dlT0c4MlhoQndHdmRoVUJJRmJ4VllLMUdVVzIzVldsdDBNQ2VOck5BOFJr?=
 =?utf-8?B?SXBqekVRVkY2NVNLTlM4SmNCc1V4NHBEQnFzeDJEaldVVHpPR1VVdHg3a1Zm?=
 =?utf-8?B?eDhEV01ZdW9GUlpDdVBEUDhBNHVCc3ZFOTQ5L2R0NnpCemlTdDJXLzZ0MEFi?=
 =?utf-8?B?R2R6SGZmTEtQbjVYdEdsNDdTYTJWUElMYjFXcE5xRnVFRzVQTGlCdU16Wnhk?=
 =?utf-8?B?SUFmN1lQaUk5ZS83RzVxcHpDZWhjR210ZjZ1Tm5wUnRUK00yOHM3eEw5U0dP?=
 =?utf-8?B?b2ZzQXhWL1NPY2tZOGhDWWw0QjZsMFpBOVdITG1od29zenpYOGxHbGJNQWJh?=
 =?utf-8?B?RnEyc2x4V2VMRDJBSGpEVjRjUnBRODJNTlJVMHRwNkQwMVg5VUlGODJsOXlF?=
 =?utf-8?B?WjdsczA0MFg3VkdyOWlVcWFlQ1R1aHIxM05uTWVWQ21GMGZhdHY3bUl0T3M3?=
 =?utf-8?B?SklUdXlWQjNWbVN3WU4wQWFVc0ttTWxBYUU4Z2YrQmtxQlpiTnlmcElBZ1N0?=
 =?utf-8?B?YTVhNWxzaUE3QVFsSFVuV21DU3hLbU1jcUpoZHB6ZjNoWHUwbUIzVVlMZlJj?=
 =?utf-8?B?dkw5eXdZWlZveGh4VjFrOFdlUFBQRmRFY056RmlhK0FObE01Z1h4OG5lWWxy?=
 =?utf-8?B?aTlNZVl4ZUp0TDNqb25LNmVZaFdHak9kdGp1eUtTQnY3MTlPR1hlWXBQTDB6?=
 =?utf-8?B?ZmxQQllLeW1jMGRudll2UStRaXBnVmRkdUlzSjBkMHJ5dmQxcmNUQzQzZHpm?=
 =?utf-8?B?SUVBbHEzd1JGYzQ2bXAyNytZQVJlMHp4cFprVUFoUXFCY0ZZanJCQWNBNHVl?=
 =?utf-8?B?cjVRTENQSUdvcTVuaDJ1ZmxpRDgwRXQyNjVWRjNMUXdmVzdTNW5oZmRpN2Nt?=
 =?utf-8?Q?ldv3Wq+2tyuDV6Zg=3D?=
X-Exchange-RoutingPolicyChecked: ibxpE8xFcNjIb3BZA2geoG9hV4vViQi/1MA2r7mC1Sy2L9KemQRXLX5ClO57texYgDAq3KcNb698qM2HUwwhG51tjzNA21fdU7fHxDBajjmiXryTzmFlE7HUD8xM5dMCY6fW+VKnRroiAr4iOOAQcj0NgzK6AhK8XpSZsnyvZAIys3YG6Cfm65owDmmThi0HGkaswgQ/iv5+3Xo/DsSYPW7IWP+3oSuCRdjQJUDLpRVGhH6+BLIC2ZCSaBK1KtXZp4g9ngLPlUezfhcWJc7Wm+TYNTvXMwe0Peu6rx7BFOlNBc6DN4Ic3kvPpxfyMa1OpzhlUnePWlj+FwvgMgVRVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8040d063-3ea7-4d49-6f1c-08de81c0cdf3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 11:57:02.5327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Wlttc81gSSrmo8VHDy2TA7sEUV2+WxJgkTqbx2JVarbI33Ih43GD1TLWsdC7Ou+nsNLaSaOpBnhiYSMpKRcC2yl3XlRjthlkDkg6EuPvx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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


On 09-03-2026 02:55 pm, Michał Grzelak wrote:
> When running suspend subtests on single output, we can still hit the
> timeout by testing too much outputs. Default to testing 3 outputs. Add
> command-line parameter to run on all outputs.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/kms_flip.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 917c5ed6f..ae38096aa 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -264,12 +264,14 @@
>   #define RUN_PAIR		2
>   
>   #define PAIR_LIMIT 		3
> +#define CONN_LIMIT 		3
>   
>   #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
>   #define DRM_CAP_TIMESTAMP_MONOTONIC 6
>   #endif
>   
>   static bool all_crtcs = false;
> +static bool all_conns = false;
>   static bool all_pairs = false;
>   
>   drmModeRes *resources;
> @@ -1822,6 +1824,7 @@ static void run_test(int duration, int flags)
>   {
>   	struct test_output o;
>   	int i, n, modes = 0;
> +	int conn_count = 0;
>   
>   	/* No tiling support in XE. */
>   	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
> @@ -1887,6 +1890,10 @@ static void run_test(int duration, int flags)
>   			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
>   				continue;
>   
> +			/* Limit number of displays run */
> +			if ((flags & TEST_SUSPEND) && !all_conns && conn_count >= CONN_LIMIT)
> +				continue;
> +
>   			memset(&o, 0, sizeof(o));
>   			o.count = 1;
>   			o._connector[0] = resources->connectors[i];
> @@ -1895,8 +1902,15 @@ static void run_test(int duration, int flags)
>   			o.depth = 24;
>   
>   			crtc_idx = n;
> -			run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
> -					     resources->count_crtcs, duration);
> +
> +			connector_find_preferred_mode(o._connector[0], n, &o);
> +			if (o.mode_valid) {
> +				run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
> +						     resources->count_crtcs, duration);
> +				conn_count++;
> +			} else {
> +				free_test_output(&o);
> +			}
>   		}
>   	}
>   
> @@ -2071,10 +2085,11 @@ static int opt_handler(int opt, int opt_index, void *data)
>   }

Here:  Below entry seems to missing...
static int opt_handler(int opt, int opt_index, void *data)

+        case 'c':
+        all_conns = true;
+         break;
            ...........
}

>   
>   const char *help_str =
> +	"  -c \tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
>   	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
>   	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n";
>   
> -int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
> +int igt_main_args("cep", NULL, help_str, opt_handler, NULL)
>   {
>   	struct {
>   		int duration;
