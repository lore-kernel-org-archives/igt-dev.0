Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CDACF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 09:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE7510E3BC;
	Mon, 23 Sep 2024 09:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBYMUNfS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD6810E3BC
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727083024; x=1758619024;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zPpbivy+fUqpOujiOMfpY5KbqSW+wChS50znarUiaW4=;
 b=GBYMUNfSVPzS2ZiEPgbn4nywDpNml/u+3BtTvAhKo9wQe2RykNM6fQpa
 jEw6N4ryyoyycc8z4fTw2z2W2tAdqJ4cog/CytKwpvl7dTCtvK46c/ISQ
 TrYA4wtnuu1kYieG/rtIqc1hacYxhVkmd7MLM3XG3EZwZCbDTes4RfJDG
 /6XqEoeOaVEXnNKBuZZtoJDOQiGFVYn3CQO/G+Oq3c7OreHt8Ppfx3Tum
 IdNmFE8KIH3sTihKPYnL/+xLElCsVnAv0Rbd9hN3pm1CDbBvjM5mxq8Ce
 EHV4fy6CF+JrqBInhJLascFDkl7L1BpC88RcaYZxPLA8dZ2Dw1BFiwVM7 Q==;
X-CSE-ConnectionGUID: esSJVMazRTqm14vtctMNIw==
X-CSE-MsgGUID: 2ge+Yy+OTRCGahpJa5Cz1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25500075"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25500075"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 02:17:04 -0700
X-CSE-ConnectionGUID: nexRRLX3ROmH1wEMnHJhrg==
X-CSE-MsgGUID: mjvBNVJXT+irFzxg82y4Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75772377"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 02:17:04 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 02:17:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 02:17:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 02:17:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsZ+2NtrcRX6jz75g+F9PgMWuRjzJZfTuI7IDgsnb4L9XSFRNtbHOS0OX6+UA4a8DpDDRjwV+z3AdLM69a4kS421C1OnV4e/UZlOxQL81e6/aD75tkEmtAwBoWBuJPJhWQIvBstWMw9/GQefI6sav9cxKyMkZ0NxK3g2hf60v54XiqNgyRkMNwvarTwDNF4ymEcs0J13+dl8zAyUgsGFYI2IItRMivvP4SMzJwreL04thagGRbEl8MPrEv5B8biep2wKmLS3FvR9XWT06Tf61RNuzTpeigrDmX0FjFWtKJS7AKOaLVCR+L6iO/XLAyoZX9IoVH5ZnOezW2UZZL1f/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnW5vBV9X19VpGTMztoIfeci4oggFT6AzBrYlMThq/w=;
 b=qKb8YBaYPRFrYU6ET+nPobe2/TmeaT7DjzCfKJtopOCevwUo50J45VJJLzp6+MvQNoYWz28oDRrpmuE9Gf3mTQQexLlaUXyuUGpt17+RQycRGZCFKkImiOFknbK+07YbltjlY52w85I/wc6j+uJ1X+gGX2tAh+MyRg/jhYlbpEhALvbWyz5b4feezwxDod6JKN92v1lwLt7WYDOdSG9KXmFzgX9eqLeOdWOJRoIyF+rp/t4/zWqIRD2IntjRHaGaXatUvV67FMQKySqOsfa0v4kMQO1Dg76+UthV880A8Nhp3dQKnAccHLCCvml8EmDImwos5gKU/gxesi1KNFxYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 IA0PR11MB7210.namprd11.prod.outlook.com (2603:10b6:208:440::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 09:17:00 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 09:17:00 +0000
Message-ID: <ec07695c-39aa-4698-b1b8-136b81e71fbd@intel.com>
Date: Mon, 23 Sep 2024 14:46:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution and
 sleep times
Content-Language: en-GB
To: Riana Tauro <riana.tauro@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
References: <20240920083315.1763178-1-karthik.poosa@intel.com>
 <CY5PR11MB6211A751A26CA560A3575536956C2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <dff59643-3f71-4ddd-8a57-6a27e5cbaa24@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <dff59643-3f71-4ddd-8a57-6a27e5cbaa24@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::16) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|IA0PR11MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: d57a7153-9256-4300-1750-08dcdbb07ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RURDTnY4dm9XSHJQMFo1ZVNBa3BMQlltRFpBaFpLOEkxOHQxQitJbnhNWUp0?=
 =?utf-8?B?Nld1SWxYNjJTRDhEb1hhcitTbHZ0T3AwZy9nejBLQXMwU1Focnk4NTVGZ2hG?=
 =?utf-8?B?TDRFYUdSQkpuZmFPakVPWmZXZjlXM1FXMC92dlNBSFplcE1DS2Vvb0FzMFgw?=
 =?utf-8?B?RjFVa09TQ0liYUN0R1FKOU0zWTNETVdSb0MvMjVzY1FvQmxDclFudlgrT0tK?=
 =?utf-8?B?SHlTY3hScUNTQjhPRjBSaldTYVlEUW5DOGhjNHNPWi9uQVN2Z29kdGY4NTRJ?=
 =?utf-8?B?V0tUOTI3eVFESXVGNDNMaGxheWsyVmcxSkQ2bkpuSHc1YkRjaDJudERlV3Fm?=
 =?utf-8?B?cFZWdldJZWZ6TitzZWd4akhTWi82WnEwQnIvSE9ka3dpRWt3dFM2cWc4OXpm?=
 =?utf-8?B?STdSVlQrRVFBcjVPWm1VbGtSeVBYZm93NEtkaEdxUHpaamVtOWgrMHk3emRv?=
 =?utf-8?B?RVFkU29Ma0lROEJSSU9YallNb1VrWTNTZkxtdWxVMUR1RWovbnhoMEtHM3V0?=
 =?utf-8?B?My9TUTlOQlBSRGpVNWxRMUtUN1ZYREYzT2FZdjFGUklqNkhWRWhWcXpOUkVR?=
 =?utf-8?B?VlVZVFl5SUdMeWVXMXp1SlpVQ1l4Qy9jeHVsS2lrd2JHaHY1QzNCQ3V0NWwr?=
 =?utf-8?B?d2hWK2pPZG1OK0l2K0M1cEt2Y0Z4NlhaSmpjV3VLQjRnSjBFSVJKZC9COFJ0?=
 =?utf-8?B?NmdIcnBTcEIwSzU5cE1jVHp1QThVdE1nTWFWMkxNTE5CZkFWRnRoTnBDbWJD?=
 =?utf-8?B?RUJ2bFUzYVNFdFpBc09oWmpqRUJXaGI4T0R6enVJVVZPZURJejFoYjMvbG1D?=
 =?utf-8?B?QWFHd3U3QzhlUmdxNU1KVkxWSDY0U0s3R2pGMzVMREtUMSt5elFUajFEcGNS?=
 =?utf-8?B?UVh3dWxGdzFoSTdjV0NGNjlSVWJSMWNIWHNHbjJzbFhrSkQ2TExNeUx5SEcw?=
 =?utf-8?B?SmRJMHFKcU1odkNtQ3dwOGFOTHh5SzZZMmgwMnBQVklLK0tnYVpXcGZublgz?=
 =?utf-8?B?aDRJeU1mcjhwTHF2aFNUMTU2eVhMYUk5T3ZMUWEvY05YTWpXbHJTNU5uSVdq?=
 =?utf-8?B?bXFVaFdzb3RXaGpMV3U1ZzBaeTR6NjQrd3JCNDRMeEhkZndPVHpaNGVvdHFV?=
 =?utf-8?B?dk1JTWVaMlFKanlnVlIybkkrVUpDTUgyTk1HdkM5d3UwZUxMcmNTMTczZFpv?=
 =?utf-8?B?Ri9Gb2VNY0IweDZFVDQ4TkduUVgwQlcrMkcxYXhWMHVGKzdqNDZjRkQ3RVM4?=
 =?utf-8?B?MDZEWjdRQnkxeXJSNks2Rm91dy9WOHpnSFF3RXlsWEw5clNrdUJhckxTa3R5?=
 =?utf-8?B?YlVKZ096ME8xajlKYkptVE1FcHhhejRCU1F1VENDM05XQkErMGhwSHFaMFhr?=
 =?utf-8?B?M3pDWGhsSk5yMkl6aFJxbDUxRmhJT0YxSmt2d0FQbTFoL21ia2lvQ3prRUlq?=
 =?utf-8?B?S0NGUlBQanB1WUlVRDl4M0JqWmtEc1NvRjVoTXlXb2g4UzY4U25nYlZhQ1No?=
 =?utf-8?B?MHNQSGVVY0xnWmZrR0ZseDA2cFF2LzQzdVBvNDhDNks4a0oxRy9RSmxPcUxJ?=
 =?utf-8?B?YmlOaDFjb2w0eFNyakVmWkVocFN3T3pXdUFwU0RSYjJjdUVUdVh0N3VWcDlt?=
 =?utf-8?B?RmFiZWU4NmU5TGpJdUFKcnR3WXJsdlg1bEJTTFN0c0l2dXFrTitpMjMrbVU3?=
 =?utf-8?B?SmlQLzVwbHBabFZnYVA3Z3cvdWcyREdROHl1dUt3MHRxd0hZaXpjWE5hTlZM?=
 =?utf-8?B?Slk0YXFMUlQ5R2s3Vkx0M29obUhaMmU1L1ZaU3JyWk44Z2pPWDdaQ0lQcE5j?=
 =?utf-8?B?L1E2WXMyVjhWd1pLM0lXZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUU3ajdmMlZROGJVeVlnK3ZhV3pVYzlxSVAzWUZKa0NIMnBnUHRmUjE2eDJa?=
 =?utf-8?B?MlJtak41azR0RG9VaFVQVXA5M3M2Q3FlZlpxQzYycW1qN3o4RDRGaUtMR0FO?=
 =?utf-8?B?bk0ra2hlcE1vRlVwN3kxdWZjQmFnSFRJVzkzMkxiSld0WXNEOHkxaU1jcFlw?=
 =?utf-8?B?bWp6Ykg2MEVsbkh6bjZDUjhyRW96L2hpZmpab3c3L3d6eGxuTG93aGNJajJk?=
 =?utf-8?B?MmVlRmVDenBaMGU4dldhMC80RXVrYzBWLzZiVlRsbkNiVmMxdVhwbldBZ3ll?=
 =?utf-8?B?ZGtyU1o1S3NlWWdFTkltOGgvdTVqYTh3Nm5UMUtVdFRScTdRWkdRZktuNitr?=
 =?utf-8?B?dW1TUEFOcXB2Q0l3c2dXMm5NaWY1dlZyenVTSWpWakF1NS9TZWhMSDdVNS8r?=
 =?utf-8?B?cktYRE5HZUtnWkVUUzdRNmZrajBWT3luMEYrMVRmOHVsMStSUE5CL01OR3FR?=
 =?utf-8?B?QU9DL1BuRWIwRDF3a2JCVTFHOU5tV011OExtOFFHaHZYVmdiZzVWN3Y3b09o?=
 =?utf-8?B?R29nOUlqRmJTQndOdEQzbkh0VlRpVnhQS3BoY1RpTXFRRGVXTlMyT3JLZE9N?=
 =?utf-8?B?QU9aalhXTUZ2MWc2SkNlOTFacFcxY2hlaXExbTl5TGo4RVR2UG1JRHhsbzFs?=
 =?utf-8?B?ZkprNityYVFmM1pmRmlhbGx3TnFSbjZuM1pBdEN5RkFxMEhQRVRGTlhqZXB4?=
 =?utf-8?B?RlRDUFVWd29qL3dscFBEVVhjYnB4VDh6TkduVVR2Q3NzVWsrbTAySUJGbWNK?=
 =?utf-8?B?bjRvQmQvUWUybm41NkNHeFlWMHVJTFg1RHdqQjdPV01OZWw0b1pKdnlHbWR4?=
 =?utf-8?B?RkZ3SVhuR0hYQVlGVVBiR1ZKdGhLV2s0amg4QVJZaCtXQVFhayt1RTJGQmZi?=
 =?utf-8?B?Yy9QL0d3eld1dmRYMjFYNnR1QWVUUWx5WnlhODZIY3hxMnRvOEhqNGVudDdE?=
 =?utf-8?B?dTE0T09ZTG4weDlhbTRiekxqZ1ZETGlqQXQzT05NdXRYU3FPakJkTCtLb0xr?=
 =?utf-8?B?ZTJDd21VOVFRTVNmWm1EbkJRME5ZNDI1QWZJdnZPYTY3MEtOSmJ0Tnh2TWVm?=
 =?utf-8?B?YzNKMS9UU3ZFUUNId2NoenUxVDRnVDcxa21qWGQreEh5Ykw5L1NwZm0vc0lB?=
 =?utf-8?B?Vm41VWNhRTZCcGZKQ0lMbU5kOHN6dU9WK29qRk80MnNSMkc1bE0zTzI1S24x?=
 =?utf-8?B?RDJWM2J0THVtSkdQb1p4V2EwcEh2RVk0TXRwRi9zQzlUMXlBSVNDTldoRnFJ?=
 =?utf-8?B?MVhTbkJiZDFQcHIydC8zbzFGYnIxTnR5STJVL1dUeHJPemhtNGQ1K1JOMkxU?=
 =?utf-8?B?Y2EvSlVYSERwYmJVQjhUdW9CVUx4S2JxOUpERlk4NDRramVTdU1RU2xockZJ?=
 =?utf-8?B?UldiZUdrRk9CY3NIcHVXWlc0UmdMMHlWZXMwbVUxQWsrK1ZVTGgybFVVejYx?=
 =?utf-8?B?SHFER1g4UW1yZkROZ2laQ2ZLczBBR1dvRVJhR3Q0RTB3bVIxKzFlZU5aQ21o?=
 =?utf-8?B?WVJmUU9SOU1sZ0svSTRrSFZFYmZKeW81ZnhmUDZCUVJqOE9YSW5kNXIwdTRK?=
 =?utf-8?B?VWIza1AzbzVLTHlFbWlKQXBMREZ4ZkFVT3N5RG9hazlOdWNOcXk2ZGlUWmFI?=
 =?utf-8?B?NVErbVpSSEVmbjBTWmtaUVpKd2NxcW1CVWk3a0Q0ait0bCtDVmJIa2lVa1pr?=
 =?utf-8?B?K1hoaXRWR3FxMjlocXMvRk9xOEU0dldNZktMQlpxTUNpdE1Zek4wa29mZVFp?=
 =?utf-8?B?SCtCakpVNXlqbDljSXNXY3dyODdJM0NuZ2xsWUtWWDNNV1k1L0ZXK0pIMndz?=
 =?utf-8?B?NUF4R1h6cVRjOUVLL0lTTFFScmZ4bTFUUWhjTTFqZ0lXYzh5NFFKdDVtVVFV?=
 =?utf-8?B?WGNPcDF3MlUxWEl4d1g1Q1lWVVVtY1BhdlNkSVdMcVZBdGJlM3haMXhtbUdr?=
 =?utf-8?B?UVp0ajNHbnZZYkRLSmN1V2VhQ3I4VVkwVHVwMkR3WDZsbnBpelhDN2QvN1A1?=
 =?utf-8?B?YUc0U2pDUEx2SHJKbExPYUU2RFNpa2x1MnZwR1B4WWZ2L1BXY0VkM3Eya2NK?=
 =?utf-8?B?YWtadEcrVDhrd2pVNjZXRG5KSkpreE0vV2pGWkFJdEFqRkZ0YnF1OHNCQTVp?=
 =?utf-8?B?djNiR1F6SFllbkphM1YrbmJuVzFxRGFjY2hncExGTHFOMTdSR1RucEt0L21B?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d57a7153-9256-4300-1750-08dcdbb07ac6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 09:17:00.3699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCR52qbeBaD77KMcJS9sY0oJ/doJBvdXhfiOB20U6KtxH51bZ2nqdXucVQQW37c9e+oLQ7PNLORRc2XpDercxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7210
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


On 20-09-2024 17:16, Riana Tauro wrote:
> Hi Karthik
>
> On 9/20/2024 2:01 PM, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Poosa, Karthik <karthik.poosa@intel.com>
>>> Sent: Friday, September 20, 2024 2:03 PM
>>> To: igt-dev@lists.freedesktop.org
>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
>>> Karthik <karthik.poosa@intel.com>
>>> Subject: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print 
>>> execution and sleep
>>> times
>>>
>>> Print the workload execution and sleep times of the test to help 
>>> diagnose
>>> timeouts.
>>>
>>> v2: Patchwork test re-run.
>>>
>>> v3:
>>>   - Assert if syncobj_wait took more than 1.2 seconds, as it causes 
>>> the test
>>>     to timeout because test would sleep for more than 120 seconds which
>>>     triggers per task timeout.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   tests/intel/xe_pm_residency.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_pm_residency.c 
>>> b/tests/intel/xe_pm_residency.c index
>>> 0e687558b..343fdd694 100644
>>> --- a/tests/intel/xe_pm_residency.c
>>> +++ b/tests/intel/xe_pm_residency.c
>>> @@ -139,11 +139,14 @@ static void exec_load(int fd, struct
>>> drm_xe_engine_class_instance *hwe, unsigned
>>>           elapsed = igt_nsec_elapsed(&tv);
>>>           igt_assert_eq(data->data, done[1]);
>>>
>>> -        igt_debug("Execution took %.3fms (submit %.1fus, wait
>>> %.1fus)\n",
>>> +        igt_info("Execution took %.3fms (submit %.1fus, wait
>>> %.1fus)\n",
>>>                 1e-6 * elapsed,
>>>                 1e-3 * submit,
>>>                 1e-3 * (elapsed - submit));
>> We don't need to change to igt_info upon igt_assert it will dump each 
>> igt_debug log.
>>>
>>> +        /* Assert if syncobj_wait took more than 1.2 seconds */
>> Explain by comment why 1.2 seconds  ?
>>> +        igt_assert((uint64_t)(elapsed - submit) < (uint64_t)(1.2 *
>>> +NSEC_PER_SEC));
>
> Why are we checking (elapsed-submit) here when sleep is calculated 
> only based on elapsed?

Hi Riana,

Because I wanted to assert on syncobj_wait time. We dont expect it to 
take in seconds for MI_STORE.

'elapsed' would have both submit and wait time.

See the sample log below.

  Execution took 1.202ms (submit 302.4us, wait 899.8us)

>
> Thanks,
> Riana
>> Your calculation is based upon the igt runner per test timeout which 
>> can change.
>> So better to stick with 1 second. Or better to get per test timeout 
>> via igt environment
>> variable.
>> Cc: Kamil
>> Is it possible to get the per test igt timeout value in igt test ?
>>
>> Thanks,
>> Anshuman
>>> +
>>>           syncobj_reset(fd, &syncobj, 1);
>>>
>>>           /*
>>> -- 
>>> 2.25.1
>>
