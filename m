Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ACAFF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 12:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6613110E08C;
	Mon, 27 Apr 2026 12:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2Smvdfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ACA10E08C
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 12:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777293120; x=1808829120;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y+/UV0ZyZlM/D6zGUAOYfJrpAdu0/GXP58vhrJqXqVU=;
 b=I2SmvdfleiQdP/i70cYJKgtnU4v/mLiIkpn0oHe6WJXnIpXlSyZ3WwK8
 oTCrK2BNPGyziPFjpSROSpcmrtK1S55hkuuZ+sJlYtYo2VS1X+MBQs6ZC
 LaNjdcd3PDaYb//neuRRxrGcive6Se0IbSmdG3GBlL43cQEFApOdcv9yy
 eiTdDo+vSemFC0rWWz+LEb9NV0AM0L0JBmTbEOK9nlnxXeLjvJPP4A9N3
 aRtuev2k3r8tzUYYAQAfvBxx3n6YhArl93uHHelNgNCz4FVU1uBCPqPay
 EejgrolCTlyQ2bdcR+1AWW7935H3pASoy3v/7Vzoz7b1md2Zy0ieVAUiU Q==;
X-CSE-ConnectionGUID: aEqvFypISTWsBd3vvRQhHw==
X-CSE-MsgGUID: n0pHH7CQTcyKpKtrr1BldA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78096148"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78096148"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:31:59 -0700
X-CSE-ConnectionGUID: AtcHlc1uSvmut26YPexD3g==
X-CSE-MsgGUID: Ce9APasyRpeEJdlcTgupWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="230434512"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:31:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 05:31:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 05:31:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 05:31:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d794+Al1D5t5esLIOFipfegQI0STkrMWwj2IONbM4DgMZhdvXV3cpBrKJ7uaZu2waZkvfQDDgpWb5/b8kBpWNrEX3S3/fWh/SFfqVItno40XorDqQmkEWlEOtlznRT+Gk0uV8vJtWb3Mh11I28S+q75xHroaJ/O7nB6Y58otARHZ3TYzI/Ofzy6hyDrW+mIvQr3sxsgFRxB3ahJF/5Hbdzinyq/jecjwEP+d8NTFqTAKV9ehRw/LrEcBYPVRi0GL35mNRqTUuT/94GRKNpie1XTOFy5h+KsqCf0IdBiZWsBsXygS6MDeFM7ZqtSYprgRdiTNYyZceqlX1WNJBmrj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mjum7NrRXGkiLNIMj+hw5D+B+m34AAeHUU8XNqXNCyk=;
 b=mcIpur3IekAi9YjK2ZDkk9b385B+iK57Qmqk8W1+Bw3vfou4z82pGwzcriy5zLAbCQWbdbK/AXV3OsS0sX0ObvobDjKnOSiEte/wxX9eIzgO2bSxErDISKH8kajaEpsgwsdpBpJDf/OKYINmaBliwMB/6kNEFHoi4J3Ad7UV0uqsWCKTxZlrAwiVtjOFiT40J5wI2EuNVkLa37IgsWvmk0zpevJ1T52hc94xpSEIuGpSr17+FffA13smgbfkFfeCyjk5mrFuvaSu2JKisvQor4T85JyinN2jXTWFeWwBEst/+x/KN1hlX6tAHUwnq6lFMQTvbOcX5t8bILHGpnnlHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 12:31:53 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 12:31:52 +0000
Message-ID: <e743b295-fc0a-4881-ad2f-afd3b0c59979@intel.com>
Date: Mon, 27 Apr 2026 18:01:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/8] include/linux_scaffold: Add BIT_U{8,16,32}
 macros
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <jani.nikula@linux.intel.com>
References: <20260422034335.2326098-1-ankit.k.nautiyal@intel.com>
 <20260422034335.2326098-2-ankit.k.nautiyal@intel.com>
 <8d5025f5-669c-4c54-bf7d-7057bdaff332@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <8d5025f5-669c-4c54-bf7d-7057bdaff332@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0249.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: c9371c0c-4f2d-4d2b-140a-08dea458f5c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: hZzuAQBbo0ZDUT5RTgvF2PQzp1VfGswyjaTG4x/r4DKc3LCod6Q/ueiDPcUKFbRQbz2Nff1YLsbqlTeZQtKvQrr9vF0gIJv9AIJO88oJCe7f7Mx0s/hYkRN7Y19mLrSMgBuL7VUVU7T46tZkemPw0o/Sm2WUT0Fl31s2MktESiftMQJaBm7fGWD5bYL0/kNYTm02Y0HV66j2EvWug7vgjFf4topgEeHAbW/ktplkXNP/xbh+6wjc34n2+/OJBhw5OzkUushzQH8oRoWLrhwSkwvNWxpTJq61IUEozzVhnUVrakYXdNyRShchHZjGR1WWRmCCpMSdp4QoEAs7IlA+Bhva0tY2T8foBr2yfJx2zq9Y6J4zzupR9vG/AWOJajN84jWfxrQQJlAySVOjwMcAYIPxItXVs5ucVp5RdA6aXuod5HnsiPTG6iVUazcD6x4F8mNKy/ZuDRTyOZUimYK+T57IYUlA6bNIEKHVD19aE+aYUcRZyUbNy/CJNLoEj1iFKbq3AIx6sKMKt6uD4jYEDLKy6y9bSfMUOVwgUmE41meaXOc5fabQP8c+NkJpC5r6PbE0PtfFzpm60aovWd6dpXJYhsGhMjuMWbH3nMZaDsBv5d+DzZgdtwBHN/zR/h2b5f+Y0N/CyX9jB4zrJfimlNErTwaw9iWwtqdXUYC9TBgYgoXzMgMamJkjrDYJwlh7gwHfuuOlq32koeA/MohPeVyt/iZRx5k8z396vQtv0jU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHduSlhtdnRkTzkyOWVXWVpkK3R3RkZ2NE1Td3p5eWdvUzNkY1IyNGY4SUVH?=
 =?utf-8?B?ejhkK09RcE9yaVRwM2IzcktVT2IzNEVZeVBDM2tHVm1STC84bXZhTzlDdURP?=
 =?utf-8?B?T3AwcVR0MGJQb0gvcCtYdUY4YTA3Z2NxVGlnODBpOTYzcWRIUk4vaFgwS0sz?=
 =?utf-8?B?MktlbTJVdXhUblZCVS9NNGsvbmNESzRGYldwTTN2ejVWYWhmb3lhdEkzbDQ3?=
 =?utf-8?B?V0lVM1NXMVRsMGhqN2dIZGRJQjJvYW1KMEk0OS84QlpKTnpGZVJrUnB2Q1B5?=
 =?utf-8?B?NGxpMzNQVlBFOEFMQWhBYXpYaFdYUnlkU1N2OE5YMEg5eURGZlcwaUlHR2N1?=
 =?utf-8?B?MXJON3IxTEtUN2M2aXVMNThuR2NFeDljRTdhVVMxbEFOL2lYNTdIbW5oQVFm?=
 =?utf-8?B?R3VRNXNHR1J6VGd4dzBlZUxBSGhRQis1d1hDRFMxM0JMNzY5MlJFMjNGcnZz?=
 =?utf-8?B?eFBzUnFJdXlsVlI4Y2FvLzR3VzZjUHBpaXZ5UHVmUlREUFJqYm92VHVlN2Fp?=
 =?utf-8?B?UFBjNFVNSmNqRUhETXI4NktHc0NxOEQ1b3dSUUhCS0NIb3crZDJwUytIYzlu?=
 =?utf-8?B?VmlJV2JIYTgyMnpQem54eDN1dGk0Z2liVFc4TEpNVWEzTXZoMy9waUN6U1dK?=
 =?utf-8?B?RkNXNElGWk9JYm5wYko3a1dBeGlvSm04SXg0ZDBlOEhBajBWMVE4Qkk1Z2Fo?=
 =?utf-8?B?K042aUoxTUJhT3h0QzFnYWw0LzRFWjdpYTh6YVpTeThKK3Q4MHRFZGp4b28z?=
 =?utf-8?B?ZmJVbGhNcnFZaTE5d1lxeXAzeWhwZjZhaUtvT29lS3R4a0c2UEQzRXlVYU1h?=
 =?utf-8?B?M29pVHZUR05NZmhWamgxZW5lVCtZYUkxK0hhckZBVnFueTJHTGJndXh6SVJw?=
 =?utf-8?B?dytGY0lmVnNxOVBsaVFEY2V1SVRtSzZ1N0RPc1VVaWo0bytOSWJwTitHMStx?=
 =?utf-8?B?UWl5V3dQRVBqSzZIRmU2djgwNlNhNFFhN3VKV2YxcmFJSkVRQ09LNFJCZ21U?=
 =?utf-8?B?c1ErV1N1UDdHNjBaREsxSTRBYjJOQnRMckhvRFBEVVlJYXUyS24vR09teWxV?=
 =?utf-8?B?Tk15dWk1NmF3a0t2dkFsREluRW8wN3ZzdXoweE9YSk9Nd3hCTGsxQ0E5b0Yz?=
 =?utf-8?B?RUhuMGZqQW9kNG9hTUh5Nmt6K2xQdndnUzVCSzhwMGhJQlhieVJERWlvMno2?=
 =?utf-8?B?a21UZXV1Vytmb0RiR0dFcWxGU1ZjcG9DbnUrSWRsZXVYVzlxaGZGZDJjK3ZL?=
 =?utf-8?B?cjZGenF3VndKNTkrT1hzcFBMU1hRNTFqc2JMa0l5cGtpV1pnMHJjRlMzNWxv?=
 =?utf-8?B?YTM3NmRYaU1IOVJ1am9MVUIwREgrRlpsK1FML2EyU1lpb3h6bzYyVUhBRXI4?=
 =?utf-8?B?V1FZZXA1a3lwSWsyWkdFVFUwVWpuT2lmbGNVd3MwUktNejNjUVVXRXdCMWQ0?=
 =?utf-8?B?U0FpUU5vZWJRb056TmhTVDUxc3hrSXlzRU5mN3h4Y1FRcmE4NVdETyttQ3kr?=
 =?utf-8?B?OWJoYnJjNXRjNjg3Wms1Yy8yZlRIbDVLSE1ETktITk84OW44cXNMa2pGYmhX?=
 =?utf-8?B?Vk13RXJGcE52cDl6dGhUMGtmYVhMd1NlUjZzN1dCZ0V0WmNNVnJ3eFRFWlR2?=
 =?utf-8?B?SlNyaklQQkE1MEZGU3VUSDFlblBIQ0ZJWHNSekJ5alBITE1RUW1BREYxa0N4?=
 =?utf-8?B?UUVZckhOM0VsUjl3VU95OVNQT0Q2NzF6R05PNG03Nlp6T1JMYzlOczlOTlpo?=
 =?utf-8?B?K05oUHIydXUvbTVpM2t1ck04TWFvdjBWQ2VtSGJhY0JrbEJUdkRHb0tuRmhx?=
 =?utf-8?B?T0Jmbjg5NHo4bWN2c1BLYTFUcEhpOE9XSVUxR21WS0F6M1VEOXd1K2xiR25H?=
 =?utf-8?B?ZC80ZVBHaExKOG04WEdEcUJXZkE3NzR5TFA5eDlnREM0QWVKTjExUmtNTkIr?=
 =?utf-8?B?VlorMmVGaUkwQ1k5T0JDekppb0VRY2VFc3U4ekxMMEJUaDhsL20vcmJSQ2lC?=
 =?utf-8?B?MFdKb2xmTVdMMXdZdUZmVFo1bkxkNVA4SHJWa1ZtS3RWeitld2xBZC9ramJR?=
 =?utf-8?B?YitNSmp5UStzdlpiNkNFeEwzV2FDSTE5d2dqWE5GY1J0bnkvOXFNZWhRajg1?=
 =?utf-8?B?VHh3TWtBWDZ6Sk9Zdi9YWUY0MXYxVXdQeUx6ZzhvRytoRElQL0RMRkgzYW1x?=
 =?utf-8?B?cU02RUFWSGEwTk1RMFJkQ1Npb3kvT3Z2S0p4Y1kzRWR1ZVVBY3g0cHphS2hN?=
 =?utf-8?B?VU1HNFdydW1zMlVQbW56S2RTQXhkL0R3L25lM2E3Lzk0dW5LOVBDdnA0RGUy?=
 =?utf-8?B?dHdSYytUL1FJSXJPWk13SWV6ak9xWWk0eWNBd3dQa1dRcXpEUEpFRnFsNU1L?=
 =?utf-8?Q?rg3Q+y3gj40mc/74=3D?=
X-Exchange-RoutingPolicyChecked: QuP++R1i3jgDV0LWKchG07tm0Q16IG6z9bQSsI475XdbFFCvFb63WCRTb4U1DAKNgn97GVaLyE7+EnRy4d/7GXkavKohwGanD9r+XLceiHPfVniyt6Yi8e42CW1nVp/XRBSQVXyDcH/vMJe5Rgm8Tuu3icsg4gBcwlpqfjvkAPtm3F+ijPfp0yG6lMb8209pOJ1H7G5rKVtIeRcPiR0aIfutfAqaaRdw61BqFP8MU5485qPONIvy9181GaY08xGFVb3elu9nmzxTh6MuUzwrN17Rkpggpnhbk5f/BFJnrINlYGV2rDsqxRgBWoYLIrvnrD0fzfFeXAM5D9MRg4VuQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9371c0c-4f2d-4d2b-140a-08dea458f5c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 12:31:52.7620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tSHur/eco8Nqu60xW0tlOtTN2pvi1pvzDkXJkdHSMwyaTEcm+REf25dE0nBFgQleKtkfif7QSC5qQ0HD0sr28lbbdyyPLuzKyutj5oZ3O0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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


On 4/27/2026 10:37 AM, Karthik B S wrote:
> Hi Ankit,
>
> On 4/22/2026 9:13 AM, Ankit Nautiyal wrote:
>> Add macros to accommodate the kernel macros BIT_U8, BIT_U16, BIT_U32
>> in the header file `intel_vbt_defs.h` copied from the kernel.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   include/linux_scaffold.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
>> index 281aa5e730ed..a3acaa16117c 100644
>> --- a/include/linux_scaffold.h
>> +++ b/include/linux_scaffold.h
>> @@ -57,4 +57,8 @@ static inline s64 sign_extend64(u64 value, int index)
>>   #define FIELD_GET(mask, reg) \
>>       (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
>>   +#define BIT_U8(n) ((u8)(1U << (n)))
>> +#define BIT_U16(n) ((u16)(1U << (n)))
>> +#define BIT_U32(n) ((u32)(1U << (n)))
>
> Should the BIT_U64 also be added to maintain consistency with the 
> kernel definitions here?


Fair enough. Makes sense to add BIT_U64

I will add this and send again.


Thanks,

Ankit


>
> Thanks and Regards,
> Karthik.B.S
>> +
>>   #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
