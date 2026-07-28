Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E53C54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 15:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D34610E1F5;
	Tue, 28 Jul 2026 15:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tv3PSq+d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D2710E587
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 15:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785252181; x=1816788181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RTNHdwsCXZ//LEUGOCrLivm+QDhIaf/aIjCEyOl95s0=;
 b=Tv3PSq+dLJ6TntAYoCPel4yDvA16qNdF4onVituUWHrS9f9vL70Tjnwb
 bNZ/VEJyZl6hRjxAU4/YENXisp8mXiaWa+5cEa26QTQlAMaYcCc1cNOxM
 +VxjefE5Sip3EEa3ylX0oooh5z/t55cC3RRVrqZzUj6aIbiA+Vd/wVuV9
 mr9qiD9QGf2D5ebL5xWPNs2/oTrJ/cuVRjJ3ozx4nclu0yeWP/CePWmhD
 yTdTC2QReeuw6bG17hsBLYYzAz3FU/G4X6oDmY+o/3EfN0a24cZQFZO4Y
 bU7K8JYMdd1FzQoGryTzrUHwMix11Chb+vvp+27KMBCxZgMaVZuDyquCM A==;
X-CSE-ConnectionGUID: cE8TUfBWTce6Ul1Da+mmkw==
X-CSE-MsgGUID: ZDTpxpIPR/m36SK30uL67Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85691948"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="85691948"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:23:00 -0700
X-CSE-ConnectionGUID: N0n8wQ6PQEiKJItsUZ56SQ==
X-CSE-MsgGUID: 6OxfSRdcS5irG8cHqvWjdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="257941777"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:22:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 08:22:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 08:22:59 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 08:22:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnRNuzfOKg3F+blsyd0xXXO0KXFtty78t5Xjy+cIO4rXd9gYdjy+oXFZ/ja4q3SzuNzKsREhHp7NeU2FsH8G9TbTMcDLlCGoMWdWPm5Chj3R/V55yMaXHP/vUjOwXfxjq6vd4/CC4eeQgv6KFBS84fZguL+FjHjOR2PGfU9i0FmHnLW9GiuuCLZsP2mIapBahHBpbeyQrA4TuEbUAET4KWeHr+AerCpr17X3oMNHFddiciNIWrKU/mCErJfcVoE6wWC/a6Cd8/ptbLqRnyw5sx9joyFaA2i7afFPWMSLWMcUWzpta1379Ez/TcuhGjXulRRcCFfiMXtjLkLRSp3IYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtZxCBTYi3+KXU4Pe5oTPXOjl7M335YrW3ffk8m3Cqs=;
 b=TjLEXKYTmC2h78zJX7+7HuMd1tc8ntoWLbXretSAT/EwqR2CvCCADv2SdTtuzB/TlTjgcmufAmzR+J5ZaZMtZdfis9/4TavCQxwTO+hb/Vvp/dFzdQIdYMezYsZdW5P+Qm2xEsmig4NhWboaiDcnOLuueBDNSqVgjEMVwueo+xuPdxXrQ+/07ngT6tjYULCndYNU8/K+Kfn2p8rva+4QN6LEMlat+fkWrBdyKryEyP2nW0pKIrEMPFnN+ZozWV0BwlnkYuYupYanZflMT49pz7a6iZkVz1aafX7MTLDHYFoJojIckE6THJr2detmEuNDecTq9u8BH/knhxorK9feEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ5PPFE62D2CE76.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 15:22:54 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:22:49 +0000
Message-ID: <f3127da3-9f13-4b8e-ac6e-b17df3b11f5c@intel.com>
Date: Tue, 28 Jul 2026 20:52:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] lib/i915/fbc: xe3_lpd+ update the plane size
 checks for FBC support
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260720151349.130812-1-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260720151349.130812-1-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0282.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ5PPFE62D2CE76:EE_
X-MS-Office365-Filtering-Correlation-Id: 38dbcdee-a248-4876-d711-08deecbc1550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: i+41SXHkFIu92VIOllpCvbGjEHIE1a/hZ3mbGPz8nrXLDP7ifzKgwselAokgQylkMH/7C9CC6KWgHQ8RO3nx6nZpETjGyxanfAljos5sqXya4ZKKVnxYl/2fpv7mTU/X9l0KR8AsK0ZDvicdi2Df6lV42wDkrCqOwRAmHnyLCgU5MerD+RbS4o2/OuqSB81BxDFbia/onwULgZ2hYkhWNQ5MX/r4dr0F4J1Wn6PCqowMUkxtAHEqpWJeMiYBmEgAosv5ecUWqdnVaEtbSRN1GbCzCfX4e5CzoFcI/XmNvWCwEscKFmu81LnsLjOGF2hpl3iyawxgN8gc4TQ66ajFFuqG03KtAT+3rIyrVuE9NK83M2nU/YHu7fpo8/sgDfLRyrSTuea+w9o1TT6DYq64KsSkfEL4jzQSaEAez7jIUX/4vATT0HL6hC4ACG3GIM/u/n4Ut98t24HrCI5boa4wR2R16uOqEElMzbA1ChvqDt2cpFTuhJo4wutsN/OSZMTbzMp6VknbFOnSqOfpEgfHXFsuLJsq98ZQKWIoCBnb3fmcjpildfSUHEgOvwQc53xYgGhCz4DO2QmB/yvLv7wXliFSrST2DQicu+s8ynPYNvRNHPxtSm/jGAdgcskikiRcXsfgQyTPQFsSl82erVymyVA6daRSncCMF5vJQHAMt5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Kys3T3NIbmF2cWlnYk9HemgxV2NIOEhueWRuWm1PaU9jMmgrZXBGVHh3cDhw?=
 =?utf-8?B?Wk4yTHowR0JIWlZ2RGRVald1UzVzVGMzNll4bFRYRXVTekFSQloyUmg4WUpP?=
 =?utf-8?B?V3hKQk1UcEhMUFh0M3VHZE1EUXp2dUdwUG5FQnFYNk1kUFJUK1RwMUVRbGdv?=
 =?utf-8?B?UCsvNXdWWEVYaWgyc2l2L2swL0xSUFArbWFKNTcvYURVS3MxT0krUitGQkdx?=
 =?utf-8?B?Zk1BVHAxMWIralV4TTQxamFEQWpTNGYrY0IzSFB4UHhxdzRadzNadE1QN21Y?=
 =?utf-8?B?S1IwVDZ6dm4xREJQTDlyTzhLM2d3WEdadDZFV0lRUEUrb1BoUFB5WmpheGlF?=
 =?utf-8?B?UGZSNEZxMW54VFdYMFlkK21MYjhkRW1DbFFwdUM2dTFPTXA0dkMyQlNia29i?=
 =?utf-8?B?dEdGMVRXcm9pOXhhVEgxNmxqNDQ0VmJ2RE93MU5id0pkQUxPcER5ZnRPNHJk?=
 =?utf-8?B?Z0pTRUZrKzBMY0VrcFQvRjdzQ3FPdUxaamdyOTZEUkQvUGtxa2ljTzFPTzRS?=
 =?utf-8?B?ZTRLMGxVaUFiN29SbUYzcHQxSDRTTzAzNTNQZ29QWEt5aWhPV3BxeVJNSFpT?=
 =?utf-8?B?TjJUc3JYTE5kZW1ab2syNDhSWUc4aERqQS9EaWU3Y01vdEM2QlBkV0g1eVor?=
 =?utf-8?B?dktnZHZzRWxWMUttRU5zZGJLUmwrN1d1Z0JYam4rR2svbkxaTC9EOUd4MHFw?=
 =?utf-8?B?eXQ5UlUvZHdqTnlJckpGbmtlSU91NXRta0laOEZQT3pYNnlvSEVLSFl1KzFu?=
 =?utf-8?B?eUc3RGhXWDNkRG5zZEVNM05zR0Q1eHYvZm9LczdQQzRxcXdIMFpCdVBUd0pn?=
 =?utf-8?B?Qll4azhxa2tyMnB3ZnhpWS96czFvUXpCOWJiOWJxRDFDMHl2a1hyQytnbS9p?=
 =?utf-8?B?VE9YUjArcmk1L21mems1ZW1manU2KzhtRzh5MDRXZE8wRUh4a0RXUmg3MGU1?=
 =?utf-8?B?eVljNVhVUjZlOWVOSnBDY01jNENGeWRRVkxDZUdmQW1SVm50N3lHclB1TmlE?=
 =?utf-8?B?cGp5Sy95UG84emhMcWJWajdVMkx0aVB4RlV5TUFFNDRWYUtUTjZWY0VTV1ZJ?=
 =?utf-8?B?WGZ5bW00czVpekVpODFIc2xucm1MbDR4azRJNmp2NGxrMDhTS3loOGZsU1hr?=
 =?utf-8?B?UlpOdzhPNFVWUEdUN2d1a1VTcmYrc01OWkZsZmQ5TXZhZ3lmb0VLTjd0eXgv?=
 =?utf-8?B?Vi9vdGJHTGVjR3BWc2F6aFduS1VGRFFUbGVkbm5GWHFlVDdtcEVRM3NUUjZH?=
 =?utf-8?B?QXdsM0swaVVHdkRWSjhGV1l3bzhkVk8rcVhBcDl4Zkx3VDlOdk8zbmJSK2lD?=
 =?utf-8?B?OTI2M2RHbzA4Mzg2VkVnbmp2VTBZNEdOTGhLVDZIcmE1eGc4dzBKVG5takVj?=
 =?utf-8?B?QlJDb3k2b2JNY29jSTg1cllvUUxPTVY3TFJJamFMV2tKVkhxKzBoNEV4TGVm?=
 =?utf-8?B?VzF6Nmc5MjNjYXZzd1JTd0RDKzBMZ3JoMEJ2MU8zMlBDeXhTS2RNdEZKWlYv?=
 =?utf-8?B?UGV4MXpOSHpIZjAreTRkV2JseVhUUzYxQUlFZ29HMitYRWRubm5IQmYxTUo2?=
 =?utf-8?B?TENZRnJHb1hVelJ3OFBOR043WUNEdHNHTHJiQncyYXgxYnU4RjltSTdjYVZF?=
 =?utf-8?B?czE5OHVmNVpyc1I4UUVMOTVWdkZ0RkpBNjg0R0JwZGpCM0dkcE13RC94eUJL?=
 =?utf-8?B?dms5R00veTlyZEZGUU1rallwaFNTTXBPWjFnUGtZbUExc3dwL1hnZWQrZUFC?=
 =?utf-8?B?OHZDYnJJNFo5a2phbW5OWlpXam1zNWN5a1RZRG5RengvaU5ZV3I3REtCR2Q2?=
 =?utf-8?B?QW85Zzk3Y0FLMFcveVlrVCtmQkhXaFJuL291ZU9Md0tlTS9Na1IvTllJUXMv?=
 =?utf-8?B?bG4rWWNueTMzMUMxWXVTNXM5aXpvTWt5eVNRaDgvaDlCZGhKQWMzb3FmR3N4?=
 =?utf-8?B?d3NIQjB0cE5EWVNEK056MEpmU25tdGlqS2p3VkdoMG5IZjFnZERqUjRJT3RN?=
 =?utf-8?B?c2c3MjF3VkRFOFozcGVNQTVVVEloRUJ3Y094cGtTRmhHL3lZUVlWMlhGVFhK?=
 =?utf-8?B?cFNWU1ErdndlQ25kWURIa1gxVUgybHdGcWdzNFRuTHhnTjVOSG9sUlI5OUZM?=
 =?utf-8?B?bFBXTnNHNkVCQWJ4ZVh2ZzJpY005Wm5UanpqZFRIZkZYWlhBdmVVQmdOR0cr?=
 =?utf-8?B?a2x4VXNHcDloL0ZyeTVMK3RqcWEzV1BNcmtFaDc4VTRMSGw4TEcyUS9xTUVJ?=
 =?utf-8?B?UkFBOHdFN1JFY0trUDEreDV0SkUzbVMrTTcxTENVUlo3TjM4TzE0aTk5VEw4?=
 =?utf-8?B?emw5a2xjbkhIRWNhSEp6bVRZOFZYVExHaDdIemZaeUlLaWNZWFF6MDlTNHhG?=
 =?utf-8?Q?q2xUZmItSW86NFevGics1sjz624DpdjurlnGX?=
X-Exchange-RoutingPolicyChecked: R+WyBFW94l+yvyfbs2eaX1ieH4f5As65RqXbHxR/GxLLQZ757m9wPEkHk2HKNm/aaSm1sveOvoxi1iBcRRQVcVkT+Iyn5exqY7Uv1Wd2APLzLysGjkzq1V98OoYd2pxmY/cX8j+2MpgaBvx8WThyBeZ0NdRl9yaaoMGmnFaSpf6eQ100LUZKWRFweBf0x0zPnoM1G0oYZtNMucuEKz4QFNrgLY7NB41MOwCN8Skg6Amtr0DjunFpLoJWDhk02tljQ/rNSTuwId8bbSIekjDhf32Y2a3IOfNR8zJ50dqV/vsbhu27MLgFQDPJnsmDVEW48w/CZO9TfAsmWsroQgmUaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38dbcdee-a248-4876-d711-08deecbc1550
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:22:49.0469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXPuSmcrCBt7POqL/0gZ0PXqm1sV5WgTB7PqpkRwx9ZNemrAxKrZD/8PxoO2PJ77GVaAM9ly0hSwQWABjQCvUGvtTSUMvXOYwEl2lC1GtUHZDBKm5ySLDzeYJ9EruVpc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE62D2CE76
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



On 20-07-2026 20:43, Vinod Govindapillai wrote:
>  From xe3_lpd+ there is no specific restriction on the plane
> width to enable FBC. Width can be the maximum supported width
> per platform.  The restriction on the number of lines still
> holds. Update the plane size check function accordingly so that
> FBC tests dont get skipped for valid plane sizes.
> 
> v2: copy the values from the driver.
> 
> Bspec: 69560
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   lib/i915/intel_fbc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index b8c714d43..9aa7b3408 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -127,7 +127,10 @@ static void intel_fbc_max_plane_size(igt_display_t *display, uint32_t *width, ui
>   	const struct intel_device_info *info = intel_get_device_info(dev_id);
>   	int ver = info->graphics_ver;
>   
> -	if (ver >= 10) {
> +	if (ver >= 30) {
> +		*width = 6144;
> +		*height = 4096;
> +	} else if (ver >= 10) {
>   		*width = 5120;
>   		*height = 4096;
>   	} else if (ver >= 8 || IS_HASWELL(fd)) {

