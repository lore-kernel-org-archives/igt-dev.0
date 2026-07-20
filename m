Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97560C4451B
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 06:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B1810E0BA;
	Mon, 20 Jul 2026 06:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCzZGR8W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A28710E0BA
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 05:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784527187; x=1816063187;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bXlkbky8EbrCDKWGH4AkJmNSMOhXZwEqJYW4+mXGV+I=;
 b=nCzZGR8W0nMlyBHG3HA5I7wOigaxlW+Fv9vr/u69ehzqdRsGqsm/rZCU
 5FCsMa8oeh8jeisOZYkaa0arvDd88/yGev0GnyYLBRH7uJqFGB1LIuODn
 J9X0B/bezjOWrwcfsiRJGH0fuuJqTEm0R/HgQkvB2xlrnXebzCau0Hcvs
 KeZdkjwh0HfMb/t/6b+4upIsQnxvTzQQ0X/0e2QwkmDCOh2jQeKsfWmkd
 ZjNBn0KXwVwrP+26tKXpGcB2QwysEPAS3IC1ZX2Bx2RJWZrihr7IpOAlZ
 MFc9fFCFzro2M0oRRr0w0AazUukLqsst5iDZjr5nIxietw7GisCwHyDRp Q==;
X-CSE-ConnectionGUID: G/p0BfAyQKC4eZTBNbFl0g==
X-CSE-MsgGUID: ZeqJPagsTU+WnehNW9oL8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95457622"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="95457622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 22:59:46 -0700
X-CSE-ConnectionGUID: nDl/+FONRHa5Vk0qLzA8hQ==
X-CSE-MsgGUID: f0JAWIhARiqGcDwRXYS7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="262327211"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 22:59:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 22:59:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 22:59:44 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 22:59:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=In3ODKf28w5G1yhZt/q7VPvfdTMn20IqI0VCPrxD+2d4rJbjRCxQ0kMRE3XdEXIq8woCR6ZA6uSNeaxIEb3zg4bAev1G+S0CSc7Y6ZxHlp1vA2x0afEe/IeLukRXzil35IgLGLGyqsvHZxvpU+s8Pkn9hR7DX8vHWLeEmYzSPTOfT/NJPI7OnuzkYkdYRgRWjtwM4CMV4fE+b7jaFsZ8PKzCFlnSjPMMODz5WJynJtUT7gpVwpvK8z5VEpcsrhopZrzKZz6yBVtLnh4plljplKmUicoE7sRQOzOT5aBXwpeSlp3up1gIN/HH+isqhpSsVPJmNDHt0Pa1otV/RZNUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dnIJcz1oY1ABNoUVCthgahoexsH6/wnUdQrT3Cgpnyw=;
 b=EAiaRpKOaMk092b0yA1r5ojIpAQRJ5srsUymIt3Uhu7xOKgkqBmn6HnrWYSYXFRVi7i5xSXSPxzW5bTL1UuM4di2XRgSWQzXxi8Hg5qn38UK+qENKbYEYcFx22/dBJnnyNcFno3gvOvEkURXBj+k8wyZZjMln7+I2Z49FD040lleFuAclGTTulsJySYT2eoHg/1KtxxX1HzAE5pHGwjHE5/3MtN1MGOuqhcrdYxXLfwcbHEgHfjl1k8OBqggN03Tk+0+AADm43z6rXtmQmKFqPW5QwSOkbHaIxkVSgXinDeA90R1/jkoSnmLD/VnnHSsiUOVW9jFkI5vSwBzlb9tDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 05:59:41 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%5]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 05:59:40 +0000
Message-ID: <acd6bd12-8270-42d3-8f3c-5062c30ec886@intel.com>
Date: Mon, 20 Jul 2026 11:29:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Add test to validate
 YUV420 with DC3CO
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20260717035658.857405-1-jeevan.b@intel.com>
 <20260717035658.857405-3-jeevan.b@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260717035658.857405-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::14) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca307b7-31a9-4b88-16f6-08dee624165e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|4143699003|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lInUMaSQguT5maPT/N8rjIa1wet5CSt+SDXoCV7FrQW+oLyoOKmN5MmKtLj+YC3ogGFOZs69PSomhDGpX9kCdKLFXYKHkAXrX9iD3RWIxVbeNtHXg1TcJkBZpZ1FfiSXPa6o23j+rEIXMu5ckcnPakmcfn0PwgxaGrq/LaRzGQ0YXwBQxyNkvUMOqZTR1U/fSqLwJGEzg3BPabwH1cQCXawKqR+inkDwJZ0ha/9hZ1ZIh1Bq8eno7F8jSxinDXLN13jS2Wu4wObeISdUTON6z1oxx409p1KG+3eW/HO6qGBH9Rufxr89/iyZc9kaoknPPuPAATTGnwMef6pi0VQT0eqWSvPzzT1xmyZ3PD8fQQisLPXtrF9ZDVzbChfI+3EBEGg8bdU7py7D1HRKPx+OiIbnQGh7sAcyfLiWopyhL5Npb9O4B/3KeqfOqTVCnREgPBOU8qRxXW2fcCB8qXUcd69789wLkBtKbUZWiqTHFlSyzvv2kZoQRR9I95eqiin/MqN+SKXrn4rt2T8kNPpoZHvCVyQgA7DWwyGQCwSTRZfoLeGfF0EzpDCE+pCj91CHXEp5AFlFRMnM/NOdcIH2zeZllil8ICOMoxnAnX189uA7mk9+PKkH+MoOsAdcLdTwd1jU3QXfbDPX8cjbX88YLD973RY8/+J5eRipKnbx+zc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHI3UVZXZ1lHNVdML0szYjY0bUpqTUFaNHljUWNmamNlU3VYU29mck5EUTdu?=
 =?utf-8?B?SE8wVHE2c0dGZ0orZU0vMFJ5bmFpRjBUZ0lGUHVWRy9zK2RpUmt1VkFlSUw2?=
 =?utf-8?B?WFlyTWo3WGZqSllaSS9aQTdXejJKcUxUTEpwZFU1UWRzQnFNS2R4WTllbGU4?=
 =?utf-8?B?VkZWcGUxM3JROTBiRDJXQ3JiNkFXRm5kUDREbGZnZWdRRlJ1Q3ZpQjl3d0FQ?=
 =?utf-8?B?a2V4L2ovdWwwcjNRMXFpTGFOSUJNMmtNOWlvMGZpNVpFL0ZHYzNVUEhwMEZF?=
 =?utf-8?B?cmF1UC8wczVXM2RlV0xnVStQekFQY2ZISngzSjdTaFVBVWpTRkpLbllLb0RQ?=
 =?utf-8?B?b3N5NjQ3amJXYktZTFY5MHdYV1NqcUY5eDE5S0IvT0NzTFFDTkVvNHFqNGZm?=
 =?utf-8?B?S08waHl5NzNmSDViUk5lKzN2SmFza3Z4Z1lUb3o4aWdDSHVtWXBBTVRmQkxL?=
 =?utf-8?B?Ry9SQitKYVVuNHlkbUE2cXlyeXM2QzBoWGtPcEFxajdFVVZXSGxWZmxDazY1?=
 =?utf-8?B?QmNKQk5KTmdTWW1OVEdoU1RFSk43dUhPOEpwTFJUUTFFZWxQM2lnWU9qSjJt?=
 =?utf-8?B?Nm1qaGdtOTB3c3JtaDZUaUp2T0RnbmJ4R3RaU214djdHZlZBRU5RNk5iVEsy?=
 =?utf-8?B?eE95dW05Y2hjWWFVc1ZWZ2tXNU91YjE2RlY2L0FkL0hxSkMwbmtFY2Uza0JD?=
 =?utf-8?B?eVVkZE1zQ3JBOER4ZmdVanE1N2VtckU4dVVjSDFqM0FMMUFLRTdpSHg2bTgr?=
 =?utf-8?B?MnJ2U2ZxU0kyYWpiSnVnaUN4KzR2eFN6THZNTWxpNEgvcER6Vzl6ZVduamly?=
 =?utf-8?B?QjVkQUhacWZzYU1NOTRDbnJEY1FmaHE3OUZka3pPZlpLbkNYNlI5WkI3bk5y?=
 =?utf-8?B?bmh0OFROUHpFZmVCb1d4ZEhZR1YzbWdwK2hUOW1rUmgwZTZjKzRndUg3OStn?=
 =?utf-8?B?OE1aYlY0YjI4V0xxNHU1a3IvVEFlQVdNamI3ZUE0WHR6T3VnQ0k2UUpscWFG?=
 =?utf-8?B?alFvbDhDR1NOaHhjdzZ2N0dWVEJQWFQzMk1TUCttNG0zeEIyb1M2V1UzYi9u?=
 =?utf-8?B?SDRUeFF1dDlTbTRNLzRPeWoyR2ZvZkdkOTMzSDcyUmhqRVJTOE52S1Y3akh2?=
 =?utf-8?B?dUREWm4vbFEvdFl3UTBkZzA0ckJKZWl6N2NOOG9jcWd2WEpUd1BOaFhMamR2?=
 =?utf-8?B?S0ZDaFV3UjhUY3hPZHZQYWF6YzNQSDgxc1VTOEtPZHNQOHA5OStFZmZ6NStX?=
 =?utf-8?B?Tys2VWpvSG0vcGh2dFFsNHVOdXQxam04dGc2VEtXUHJKV1VxZXpybjU2Zkt3?=
 =?utf-8?B?RyszMDcwcGdjVzB6aHBWekt0UFNaL0R0N01tdWN5Vy9XQ2JCRG44cnJYdUhW?=
 =?utf-8?B?amZoV25UUktEeENDTWZ5cldDZUYvY1FDMEJmRGJzTDI2bWZOdFg4bkxNMjR1?=
 =?utf-8?B?MnlYQy9PajhBSkgwZWszcHNBTFBDWmxHWUE5TytPQWdLS1hGOFlWWkgxTHFO?=
 =?utf-8?B?QXhiZlNONTY5RGRQaG5UUmVIdlcxcFNiaUdlNGpJRG9qdWNjV25YdDhBUVBp?=
 =?utf-8?B?WEJDUjBPQ2Y2TG1jdlJybmRKSmNCUFRZYXo3TVFWSWNJS1ozeCswVEFac0V5?=
 =?utf-8?B?eFNkY1UwZ2FieXJkSlkxVWswZWFpT2srUHVXaWR3dllVdWx0RVJoeDFCYytu?=
 =?utf-8?B?c1BnR05CZHYzbzRETXZJclloODQ1VEhlVGhDS0tQK1IyNTh3SWxGbWxCVU1M?=
 =?utf-8?B?YnR5WUJHU1BvVFZmY1ZtVHExRHB0clZXV0dYd0U2VFZRMkltY25DdE96eUNS?=
 =?utf-8?B?S2QrUkZnRUZicnlmaHVKV0t5MmhKSnNJdERHODIyYm1vSjZuNFVaSk1qWndL?=
 =?utf-8?B?UUhlbWszMmdITk53aWM1TXA1NGNrV3VwZEt3RDBoMGdEbkVBOXpYTXJBSlk3?=
 =?utf-8?B?enVxRS9BL1hkb1EvNmZ5NWlXUFo2OWhaQjNrZDM4ZE44L1hScncraWVRUk56?=
 =?utf-8?B?d1RiOEpTU0psWi9QZERkbW5SVkhGM2dHRmRTcDJDTnNjSGM0MTkrTGJpbnRi?=
 =?utf-8?B?L3J4OEdQbVJqVWRoeG02L0ZDR0owTWtVV0xyeEJtSXR3Y3hTYnJGdHVPYURh?=
 =?utf-8?B?L0Q3ZVl1UnpQTjZMVXpjT0NuNUdEYmVnQ1gxdGVNYnJtSmdPL1NOYmZUWVRQ?=
 =?utf-8?B?VXlLMzVUV0J3eVFxdnNNMU1nOEEzK2pmNVhNSnJvSjc2SXR3cjZJeUM4RmRy?=
 =?utf-8?B?TUQvdDJyM1VvMk8vWGFQL2I0L2MvRnFVUVhkV20rZGxYQ3V6ajVjTDUxYmtI?=
 =?utf-8?B?QnZKY1kvdERTY2M2S2N5YndzaC9wQUxWT2NwelZucGpWSlh0SFVqc2pOdDQx?=
 =?utf-8?Q?f6ne5+tJCC+FopTxsr7y1OBBussvBz5ToJFzb?=
X-Exchange-RoutingPolicyChecked: pbmd/u2JIiLR1p5do5Tu/Wx+1Wf8qCLvRoNs+M5Nqow0Vrngd0JcitTpW9WdWrP6EePzycGs5t2LwKOG9G50Oyh1PBjn7pcZQbPuqsLiOXaaODBEgyaFAnxVuMemZ0Zy37UnqbQBgvovb6piXwNIHiPaC4oFrc03tDc7wKoILbYCuZ7XASv3zQ+N6h2WSn5MDYVlH3pt4bdBpJRuhmDyETCM1BHOUBydzijxNH5H3YhhXf53kM0o7TG0wxVvHbE4f0j1jT7sjKmgkICz2zZQ6K0hn1sB0yVHAAcm+QgFgarPs+lyAOTn4lrJ+Z9akFISt5vC+r/8AySh12/ltfwOQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca307b7-31a9-4b88-16f6-08dee624165e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 05:59:40.8894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ml4itZDTX7WqSdP4wCvwOzfK7UZ5Hbe966BwTrdJ/QAdZ8dfyKPuZA4DhVUURXn8JWJ3rTNEsbnNbUsDunr8Kn1Y6xuzHXKIyQ5AS34pQgeMjHq5FoQt4GX5yXYMg4Vr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

On 7/17/2026 9:26 AM, Jeevan B wrote:
> Add a new validation test to ensure YUV420 works correctly when
> DC3CO is enabled.
>
> v2: Add YUV420 support for all DC3CO tests.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 70 ++++++++++++++++++++++-------------------
>   1 file changed, 37 insertions(+), 33 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 018def5e4..52f0be183 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -125,16 +125,24 @@ typedef struct {
>   	igt_display_t display;
>   	struct igt_fb fb_white, fb_rgb, fb_rgr;
>   	enum psr_mode op_psr_mode;
> +	uint32_t dc3co_fb_format;
>   	drmModeModeInfo *mode;
>   	igt_output_t *output;
>   	bool runtime_suspend_disabled;
>   } data_t;
>   
> -struct dc3co_test_mode {
> +struct dc3co_test_case {
>   	enum psr_mode mode;
> +	uint32_t fb_format;
>   	const char *name;
>   };
>   
> +static const struct dc3co_test_case dc3co_cases[] = {
> +	{ PSR_MODE_2, DRM_FORMAT_XRGB8888, "psr2-xrgb8888" },
> +	{ PSR_MODE_2, DRM_FORMAT_NV12,     "psr2-yuv420" },
> +	{ PR_MODE,    DRM_FORMAT_XRGB8888, "pr-xrgb8888" },
> +};
> +
>   static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
>   static void set_output_on_pipe_b(data_t *data)
> @@ -275,7 +283,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
>   	fb_id = igt_create_fb(data->drm_fd,
>   			      data->mode->hdisplay,
>   			      data->mode->vdisplay,
> -			      DRM_FORMAT_XRGB8888,
> +			      data->dc3co_fb_format,
>   			      DRM_FORMAT_MOD_LINEAR,
>   			      fb);
>   	igt_assert(fb_id);
> @@ -300,6 +308,15 @@ static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_
>   
>   static void setup_videoplayback(data_t *data)
>   {
> +	igt_plane_t *primary;
> +
> +	primary = igt_output_get_plane_type(data->output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_require_f(igt_plane_has_format_mod(primary, data->dc3co_fb_format,
> +					       DRM_FORMAT_MOD_LINEAR),
> +					       "Primary plane does not support format %s\n",
> +					       igt_format_str(data->dc3co_fb_format));
> +
>   	color_t red_green_blue[] = {
>   		{ 1.0, 0.0, 0.0 },
>   		{ 0.0, 1.0, 0.0 },
> @@ -893,14 +910,10 @@ int igt_main()
>   	igt_describe("In this test we make sure that system enters DC3CO "
>   		     "when PSR2 or PR is active and system is in SLEEP state");
>   	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
> -		static const struct dc3co_test_mode dc3co_modes[] = {
> -			{ PSR_MODE_2, "psr2" },
> -			{ PR_MODE,    "pr"   },
> -		};
> -
> -		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> -			const char *name = dc3co_modes[i].name;
> -			data.op_psr_mode = dc3co_modes[i].mode;
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
> +			const char *name = dc3co_cases[i].name;
> +			data.op_psr_mode = dc3co_cases[i].mode;
> +			data.dc3co_fb_format = dc3co_cases[i].fb_format;
>   
>   			igt_dynamic_f("%s", name) {
>   				igt_require_f(intel_display_ver(data.devid) >= 35,
> @@ -919,14 +932,10 @@ int igt_main()
>   	igt_describe("Validate that no frame drops occur during DC3CO entry "
>   			     "while alternating framebuffers with PSR2 or Panel Replay active");
>   	igt_subtest_with_dynamic("dc3co-framedrop-check") {
> -		static const struct dc3co_test_mode dc3co_modes[] = {
> -			{ PSR_MODE_2, "psr2" },
> -			{ PR_MODE,    "pr"   },
> -		};
> -
> -		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> -			const char *name = dc3co_modes[i].name;
> -			data.op_psr_mode = dc3co_modes[i].mode;
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
> +			const char *name = dc3co_cases[i].name;
> +			data.op_psr_mode = dc3co_cases[i].mode;
> +			data.dc3co_fb_format = dc3co_cases[i].fb_format;
>   
>   			igt_dynamic_f("%s", name) {
>   				igt_require_f(intel_display_ver(data.devid) >= 35,
> @@ -945,17 +954,14 @@ int igt_main()
>   	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
>   		     "and exit cycle");
>   	igt_subtest_with_dynamic("dc3co-after-dc6") {
> -		static const struct dc3co_test_mode dc3co_modes[] = {
> -			{ PSR_MODE_2, "psr2" },
> -			{ PR_MODE,    "pr"   },
> -		};
>   
>   		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>   			      "PC8+ residencies not supported\n");
>   
> -		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> -			const char *name = dc3co_modes[i].name;
> -			data.op_psr_mode = dc3co_modes[i].mode;
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
> +			const char *name = dc3co_cases[i].name;
> +			data.op_psr_mode = dc3co_cases[i].mode;
> +			data.dc3co_fb_format = dc3co_cases[i].fb_format;
>   
>   			igt_dynamic_f("%s", name) {
>   				igt_require_f(intel_display_ver(data.devid) >= 35,
> @@ -974,14 +980,10 @@ int igt_main()
>   	igt_describe("Validate DC3CO counter increments before and after a delay "
>   		     "greater than 6 frame gaps during video-like load with PSR2/PR active");
>   	igt_subtest_with_dynamic("dc3co-vpb-framegap") {
> -		static const struct dc3co_test_mode dc3co_modes[] = {
> -			{ PSR_MODE_2, "psr2" },
> -			{ PR_MODE,    "pr"   },
> -		};
> -
> -		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> -			const char *name = dc3co_modes[i].name;
> -			data.op_psr_mode = dc3co_modes[i].mode;
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
> +			const char *name = dc3co_cases[i].name;
> +			data.op_psr_mode = dc3co_cases[i].mode;
> +			data.dc3co_fb_format = dc3co_cases[i].fb_format;
>   
>   			igt_dynamic_f("%s", name) {
>   				igt_require_f(intel_display_ver(data.devid) >= 35,
> @@ -1025,6 +1027,7 @@ int igt_main()
>   		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>   			      "PC8+ residencies not supported\n");
>   		igt_require(intel_display_ver(data.devid) >= 20);
> +		data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
>   		test_deep_pkgc_state(&data);
>   	}
>   
> @@ -1053,6 +1056,7 @@ int igt_main()
>   		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
>   					     PSR_MODE_1, NULL));
>   		data.op_psr_mode = PSR_MODE_1;
> +		data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
>   		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
>   		igt_require(!psr_disabled_check(data.debugfs_fd));
>   		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);

LGTM.
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

