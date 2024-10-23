Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1D1CF538E
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 14:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E961910E180;
	Wed, 23 Oct 2024 14:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gd+5cb5t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC8510E180
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729692835; x=1761228835;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3XwZW9mmRjXOWV7JDhiLXxKCEQvgMqAPoluYvNV5aE8=;
 b=gd+5cb5taT7khjQqqVI23wEsLyck+v9u3y8RFkM0rGjJ1m3NP6SuYODH
 BHljnTULO5gtLiYFp+Q4aDxMfLt2IyZf1IHwHOZAjd63rM/HciRA+CT04
 xGrsIp0TDMNgJd9OT8a1O3uyfmAdTUgB2XPI8sBdvgPp9aK7zEHwQ8nhp
 YXu0pVukDEReJoScQx2LMmkJoxTccgdHtN6+QkUQk8bR5gFYctUgTYshB
 UrbiD6Ebq+WaxrbpVmz5g2/LKCeR+AR+rXl6p6ZNVHsRstzD00aonqjck
 SSYL42QYJNlTlS4MX+ceSZx28IvFwBgwN3iNV2u7UCUOlMOrj6C6TImCE A==;
X-CSE-ConnectionGUID: 7DEy3l5lSP6pr+9OrVQLdA==
X-CSE-MsgGUID: /vnQwmtnTEmXeh9C/c+wHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29384747"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="29384747"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 07:13:55 -0700
X-CSE-ConnectionGUID: Av0FGOoSTuqfcSBSt3G3oQ==
X-CSE-MsgGUID: YPHq+QokQvqXv35CN5sGBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="80147027"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 07:13:55 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 07:13:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 07:13:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 07:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kptOKNB9qLU93t+jJrpWCW/OfAlofEqi1aRaA8F38CZcsWfxTflltQxys0PMXKohHTnQOzEEuEmkVFuIHVnMCp6R3Yv/heinBHLr1u0zdwovnlr9OUN0YaMzmO7/+XS6tq8G4/P/zRnAjdtC0HMLNojo3DRkS/99n0QSdElEY4wfyaK0oJT8d2tIOSERkIxCaf9kmArw45GJHRhpMfPFZS2dYEaw0UewM7pdOMzLWLIz+eLFiUMoOfqZl3RyHAvxd+WRAWQCAdxzoyemOAq7sibc43prh0y1sDT8Xp4hpve+unDyVs8o+1Tqftd3gZTKYofySAD4kFR8/gc0+KR5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ced7BobB08yjXlqay8ZvEnAdKJ2/FTuaQOQ2xre4aNc=;
 b=STvnVc+BurqcTWiamfPSSA99kmYlIfew83Ov+ZeHwZUz1GOMI21g42iAwJdl55t+Dv9qjp55GQTxhmfyN5YViTmELS/y7l9WyARpyC7RD+U3Lm5Sg2L2Vi5IrzJpYtmtkZFdcI8GF3XPAnrOFwdj/SN4uQcf+mtpYe8Lg+ZLFcaC1JtKA1OIliHAsV4vpU1RCxkkrWreuKn/7auaCn7ZSeh6GE7OpX5DygaWVWHVzPp/TtqY19ZNnKP9xt4kWMJB08ngLzEbyqFjPbAutdECgoYMNEOUyKNOg/tg4Jf+gsjaBfUYP1MV0Y5FhleOYA62LGpayAGTQv10NyOZMFUIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB6874.namprd11.prod.outlook.com (2603:10b6:806:2a5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 14:13:51 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 14:13:51 +0000
Message-ID: <27e21d1c-bdf3-46c3-b813-be0ce3973df9@intel.com>
Date: Wed, 23 Oct 2024 10:13:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 0/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: Peter Senna Tschudin <peter.senna@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20241022163324.383145-1-zhanjun.dong@intel.com>
 <e51c2ddf-bc6b-4daf-baf7-88b436704195@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <e51c2ddf-bc6b-4daf-baf7-88b436704195@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e42ff94-32b0-4e90-0876-08dcf36ceb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3Z3c1RFUk00T2F4Wk0rME1WV3g0K3Jpbi94RzIvU05vRUJENldicC9HYnJy?=
 =?utf-8?B?UHdJdmZkV0FScHJmMEVWN09XM2hDZ2trZCs2Wmt3eFRuQW9XbGRIY0cybk53?=
 =?utf-8?B?R2N5SStBUXpWOGl6eE1UODVsbnVBS3lZV0daQkZTZEFvOVV2bXM2T1V5RFpK?=
 =?utf-8?B?dDVmLzlPVXFyNEN2MnYxUGl5Mml5WVJldTB4U0ZYWmh4TWszMnZBWEdmR09q?=
 =?utf-8?B?TVVRRVJrMFE2NjljRlBHbzdNY1EzWjUrZGtSbGRyOU9XSWpGUUY1ajJmZlpG?=
 =?utf-8?B?T2puSFZkWE4wQkpoSmRsamNlZ0pKVjN0MHRDZ0hKc0dDRldXRFpsTzRqeVJT?=
 =?utf-8?B?di9DY3FaZU5GUVRVaHNZaEYxeFdiLzlJUThRWWFJM3N1VzRJRFRCVzYxR2pP?=
 =?utf-8?B?ZW41UmZ2UHRXVU9LOEFia1JOUFVhR3BCekUyT25HVWhSVWE5amZPd1JvM2VD?=
 =?utf-8?B?RzIzZnFjRVhXdmF1VjVrQjFXblZSZlhwd3h6M2xJMTRxQ1lHUnpHT1JhOElZ?=
 =?utf-8?B?YVROREc4cmcxMHFEWDVHdys4MGdnRU1nZUpGRTFERjJjbTc2azUrUG04TmZO?=
 =?utf-8?B?K0gySFJLWmVWanJzcVZ4UEFBdlZ0dnBHalpZYmE3MlVhV0N0dE90Tm9OVnNj?=
 =?utf-8?B?TXJVMDBRdXB0TkYyVWQ0Tm1pTkJlaS8rRjgycTNVZUQzVGgyamwyanhoSzM2?=
 =?utf-8?B?c2lqY1piU20xQlBLS1owaHdJU201YjRyNVE2cGpuN3NhOEtNcmZhOHdhaE8z?=
 =?utf-8?B?a3JNR0tnNVVva1o2STBSell4bkFoRmN3cHVvVG9SbE9oQWFGN01nU2s3OUZW?=
 =?utf-8?B?Y1NRUjRKODFzTjRKanRRYjR2M0ZBcDlkVm9wc3FSekNmck5vRzlRQk9Pbkg0?=
 =?utf-8?B?eTBvbVovV0s2akZtcFk2NkxvbHpBZHlNZG9zTXNmZ2pkMlZRRjdLd0FGRUZi?=
 =?utf-8?B?eXJPOGwzbTV6elFwM2RlQkpPSmJtNk83QXhIa3pwRW5XTExENlZHeWFmR3ZE?=
 =?utf-8?B?NXpuenc3V2dzZllCMnl4TnNUR2o1Z0ZEYTZZMFBxdnR6SnpkSWJOdUNHVWkv?=
 =?utf-8?B?Q1ZRVWFHUkc2aGdzWTNYOVQrUG05NGc2YkFVODRmZndodVhCa0JlL3JZZVlO?=
 =?utf-8?B?bjFmajJSTjZEMjI2Nll6UlR3ejhsY2F3Q1NFQzg5NEMzQUNtSldmc1JRRitn?=
 =?utf-8?B?eGptSGhscHVEbDNUOVZ5b0N0Zmh5bkpSSHpNOGZPUG5lQU1VM05QM0RxcllI?=
 =?utf-8?B?MlRqajJ4a2JSUmRjL2tjM0wweFM3dTh5WmxPeW5kc2VNemtJRkxkMjNJb3Fm?=
 =?utf-8?B?V3ZHOEtMMVlPSlZGRGR3RE1nVlFYa0I0ak1yN1dKNXFCUnNaczFCZlBCYlly?=
 =?utf-8?B?ekJWUjRhTmFtOUJCSjJXcmRycGFVSmFkQnJEamU2WmFQRmVLaFhNcTB1YjU5?=
 =?utf-8?B?S05wejRtVWFmakwydDdJWkpFRFpnNjByWk4zZW1HaFNiQXpycU16UHMrdjc3?=
 =?utf-8?B?K2RFTDVyZXdZY1VkN0M3ZGY1dGJyUjhtZmNhREtaM1NUTk44cTBnM3BPK1Yr?=
 =?utf-8?B?Ti82TWpSNXJlVlhXNndCL1lqN2o5RFoxZklXSytXcFphZmNWTGc5Uks5bW9Z?=
 =?utf-8?B?Qm5nSFZRQ0tNOGs1bmtPcU1Kaksrd1dvUFVvTWlVSkpwc3BJZVZMakpzNmw5?=
 =?utf-8?B?ak4rMjJTRFBWbktyQmxFWEpaQ1lQMnBYczF5cmlWMEVIVEtybjMyZVhlZnVN?=
 =?utf-8?Q?uluwNRRSK3jZD9PI4JJe7qP/+hoefADG2m6RDZj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWo4L3gxL3A4RVJ3TklrcWFzVVg3RnB1WXU3REJqQlVubXdtVjM3aXhKeXN3?=
 =?utf-8?B?QUgxRFc5UE5mTDRnazlEenBGV0dwOWFvUXh5UE1McmJQWmEwV01BcXQ4Uy85?=
 =?utf-8?B?aGZJUkhJS3B6eThOMm5icFFCNUhuQi9aM21pTE4xZkt5OXNCMGVsZ2ErM0Nm?=
 =?utf-8?B?VDhXVlBBYWJmMjBCOC9KL1Jpc3pmTVQrMFFzQTF2cEVZSHYxWTFMUjBkS05j?=
 =?utf-8?B?V1FTbGROVnMvclJBbjdITmliNy9oVi9SbzAvQ2x5Z0ZaRDNLSmhZYjNvNHZz?=
 =?utf-8?B?aUZxcEVaZHZRTG5ORTM3U2JyZkI1MW1oWmFiV1UySmwycXV4UkFwSkswLzNq?=
 =?utf-8?B?cGlQeGI3K3FEcnZaYTBjeVEwM2ZNZEJ1eVhFQTVMRGJJd1V2dU5LYW8yK0VS?=
 =?utf-8?B?ZHkrcEN4QjgrWi9YaFhlMFQrOXFRVnMveTY5aUxYVVdLMGxCc1Zyc1h5OGU4?=
 =?utf-8?B?SzZ2V0N4S3VQV0cvb25iZ2VNa2xYNUtRVWNPS1FPaERkN1czQjhGZnVvMVZK?=
 =?utf-8?B?WFNsVmhiaWRKS2x0bEMvU2tIT3dNakZDUzNuYTc1bFlyN3F2ekM5c0VjakRZ?=
 =?utf-8?B?dmFMdGE1cjRrajdaSjRZTEJQQ3NSRzBUK3VDU0oyVTBwQnNyTTl1T1ZaUEpD?=
 =?utf-8?B?cElqZkRqNGZSczJYYVdUb1Y3VnhVVnJlVHBCbHFiTGlZampEUHdVWE8xUVRC?=
 =?utf-8?B?aDNuKzhiZTNFN0RVMVZROGc4M3lZdmNmTTRRMjlabHlmVHh3MEJwMUFSb0dt?=
 =?utf-8?B?NE01akdEeGE0Yjg5RXdmTnhJYXV0MUYzT3BVQjBBUkpubTVDSWdmRjg1azJl?=
 =?utf-8?B?OWxkZnZLeG1zNnk0bVVmTnRPSlJYU1l6NjFac3pXOU1BNjhMNlRWOUJKMmJX?=
 =?utf-8?B?aDEyWGxmcnpKaDJNczJ4OUFoYmVWU2dxL214WldES3Z4UHlJNmR1MWc0ZEt0?=
 =?utf-8?B?azBXc2JiTXBoZFU1S3Z3UUtadzBrVkUxUmxnVFdXaUFQNVRXYTRRM0JyenVn?=
 =?utf-8?B?SE9ONHVOM0tTQ2JuTk5lY0psb1M4MS9rQXgzNkZNQ0dDMlVnenJVNWNzc1J2?=
 =?utf-8?B?TXRZU3dIemdSVjZ4TDlNTytnL2dlLzk4R0pZR3h3T2VOd3NCRHpiS0FGSVpC?=
 =?utf-8?B?cG1xclJUVXNMQWIyOHpRSnVBSUxqQ0QwOEJWUjFtMjRPL044N0tHdGU1eEhx?=
 =?utf-8?B?V1dhZC8zR1VuMVJFb1FnbWVZRk5mSFh0OGxsQzF5THVWdWZndzdHNGdXa1Zv?=
 =?utf-8?B?cHE4VTRiVG9ncTQzdHFQOUVWMVdYRVliMkk0RzFGZUFMWnMvQ0t3cGxCYlpj?=
 =?utf-8?B?RnQzYU40aXBjWTBVNUlvVnBHRW9pT0hOd0V1SDQ0MWd4VkN5U2pCWUJENDE5?=
 =?utf-8?B?a2x6eTcvL0ZYTWkzdWRHTzNnOTFqOStxYzFRS2xHcmk4TDVSY2FUaTE1ZHVs?=
 =?utf-8?B?VnR2WXFiOFMrbWoyMytZYjdLZnA2WVAwUlZTUm9iRnZJVnJKUWthZHJmelVQ?=
 =?utf-8?B?M2t2cHpaOWhzRXN4ekhRZFg4Q0tBZEpISzR6aytjU0NKTExpckpDeVMzaVdQ?=
 =?utf-8?B?YSt0Rld1V3NRS1ZIdldyV0I0UnZiQUp3NWZBdm4yT1lrMHZnMSthaGRPM0R0?=
 =?utf-8?B?NWJUanpjRG9xaldCUmY0QThWVE4vY2kwc0w5aHRFdWwrS1V2Mm1NTjBJNnpn?=
 =?utf-8?B?SUxabCs1b25YQ2JrdW5mWmo0Vjh6UjZaTDNqd0pSdGMzMGt3bS9jVkt0SnVJ?=
 =?utf-8?B?YmdsRVQ0cWZBeFE3TTlpbTQxWUFYQy8rNVl1ekxlbVJpckVSMXpDRzRWSWJu?=
 =?utf-8?B?cithTmNDRU1zd2pzVXZPelZXUS9SK2pvNm0xbU9BclUwallma08vTFdVTy9R?=
 =?utf-8?B?NW4zMFRaeWNVWU5GV0wrZnU0UFVYc0lFMGhqWGRGN29wczFnYjJlaFJ1cGVW?=
 =?utf-8?B?bWhiREp4aUx2N0c2LzBTM2xvR2FFejlmaE9GR3d5ejFUSGxxTjY3M1lUOGFz?=
 =?utf-8?B?Y1JmOFFSUjFudkdDdndXR01jUjZiMGxRUlVFRFJCT2pldXBjN1A3SUJ5dDNn?=
 =?utf-8?B?RnVMSHBoL3ZnUFFLWlpYMlYycnl3S1laL0hSRE9FVkVXQmhJUVpLazZPNnNE?=
 =?utf-8?B?bi9Sc3NZemJzMWNFVEZ6bkthN2o1KytLN0xLdVQrdjM5Y1hBV29hcStuSVk1?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e42ff94-32b0-4e90-0876-08dcf36ceb60
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:13:51.3509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glSTdJnPV/i+sO6tnF1jYlHRqYHNbL82rz+I9lXext2G2a3p3N5DvVk69bQ56n3SkfAW46hfOYyKRqINGRqnCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6874
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

Dear Peter,

Thanks for testing the patch.
Yes, the failure is due to I add "Capture_source" field check since v3.
It actually find out a bug in my kmd code. Solution/Jira is working in 
progress.

If you want to skip this failure to continue the run, you can comment 
out this line like:
diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
index 3a8fa68f2..5fb50fe9a 100644
--- a/tests/intel/xe_exec_capture.c
+++ b/tests/intel/xe_exec_capture.c
@@ -280,7 +280,7 @@ static void check_item_str(regex_t *regex, char 
**lines, const char *tag, const

  static void check_capture_out(regex_t *regex, char **lines)
  {
-       check_item_str(regex, lines, "Capture_source", "GuC");
+       //check_item_str(regex, lines, "Capture_source", "GuC");
         check_item_u64(regex, lines, "ACTHD", BASE_ADDRESS,
                        BASE_ADDRESS + BATCH_DW_COUNT * sizeof(uint32_t));
         check_item_u64(regex, lines, "RING_BBADDR", BASE_ADDRESS,

Regards,
Zhanjun Dong

On 2024-10-23 1:18 a.m., Peter Senna Tschudin wrote:
> Dear Zhanjun Dong,
> 
> Thank you! I hit a failure while testing you code on a Lunar Lake machine:
> 
>   (xe_exec_capture:2227) CRITICAL: Expected value:GuC, received:Manual
> 
> Am I doing anything wrong? Here is the full output:
> 
> $ sudo ./build/tests/xe_exec_capture
> IGT-Version: 1.29-g210f35b54 (x86_64) (Linux: 6.12.0-rc2-xe x86_64)
> Using IGT_SRANDOM=1729660344 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: reset
> (xe_exec_capture:2227) CRITICAL: Test assertion failure function check_item_str, file ../tests/intel/xe_exec_capture.c:278:
> (xe_exec_capture:2227) CRITICAL: Failed assertion: !strcmp(output, target)
> (xe_exec_capture:2227) CRITICAL: Expected value:GuC, received:Manual
> Stack trace:
>    #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>    #1 [test_card+0x7dc]
>    #2 ../tests/intel/xe_exec_capture.c:341 __igt_unique____real_main334()
>    #3 ../tests/intel/xe_exec_capture.c:334 main()
>    #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
>    #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>    #6 [_start+0x25]
> Subtest reset failed.
> **** DEBUG ****
> (xe_exec_capture:2227) igt_device_scan-DEBUG: Found 1 GPUs for vendor: intel
> (xe_exec_capture:2227) DEBUG: Test requirement passed: xe > 0
> (xe_exec_capture:2227) DEBUG: Running on engine class: 0 instance: 0
> (xe_exec_capture:2227) DEBUG: Devcoredump found: /sys/class/drm/card0/device/devcoredump/data
> (xe_exec_capture:2227) DEBUG: Compare Capture_source: Manual vs GuC
> (xe_exec_capture:2227) CRITICAL: Test assertion failure function check_item_str, file ../tests/intel/xe_exec_capture.c:278:
> (xe_exec_capture:2227) CRITICAL: Failed assertion: !strcmp(output, target)
> (xe_exec_capture:2227) CRITICAL: Expected value:GuC, received:Manual
> (xe_exec_capture:2227) igt_core-INFO: Stack trace:
> (xe_exec_capture:2227) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
> (xe_exec_capture:2227) igt_core-INFO:   #1 [test_card+0x7dc]
> (xe_exec_capture:2227) igt_core-INFO:   #2 ../tests/intel/xe_exec_capture.c:341 __igt_unique____real_main334()
> (xe_exec_capture:2227) igt_core-INFO:   #3 ../tests/intel/xe_exec_capture.c:334 main()
> (xe_exec_capture:2227) igt_core-INFO:   #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
> (xe_exec_capture:2227) igt_core-INFO:   #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
> (xe_exec_capture:2227) igt_core-INFO:   #6 [_start+0x25]
> ****  END  ****
> Subtest reset: FAIL (5.963s)
> 
> Thanks!
> 
> 
> On 22.10.2024 18:33, Zhanjun Dong wrote:
>> Test with GuC reset, check if devcoredump register dump is within the
>> range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: Peter Senna Tschudin <peter.senna@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>
>> Changes from prior revs:
>>   v4:-  Support runs on multiple GPU
>>         Load all devcoredump content to buffer
>>         Alloc line buffer dynamic vs static global memory
>>         Changed to igt_assert_f to provide more info if failed
>>   v3:-  Remove call to bash and awk
>>         Add regular express parse
>>         Detect devcoredump through card index
>>         Add devcoredump removal check
>>   v2:-  Fix CI.build error
>>         Add multiple GPU card support
>>
>> Zhanjun Dong (1):
>>    tests/intel/xe_exec_capture: Add xe_exec_capture test
>>
>>   tests/intel/xe_exec_capture.c | 365 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 366 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
> 

