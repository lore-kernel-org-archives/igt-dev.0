Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A02C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 06:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C0810E2C6;
	Tue, 21 Jul 2026 06:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOR7m/hD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ADB10E2C3
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 06:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784615959; x=1816151959;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AWcJ7K8IJN+getwICYfb6kphnYe+cdqMlFqB94aid/Q=;
 b=XOR7m/hD0JVvFpNvF34MZOumS5eXeSAXvv7/yIs6QIj2wAK29th2XlvG
 34Gt3aJGFfCi1aQFCsBg62HixHFicDys656kJncJnZXZ+8GI4R98HOBfI
 pZJq1k3jyc41dydr9PApuWCbOnCe41d8ZUFFoSnwDq7YkGuGFcEM/3azA
 igDpM0Q2QLe5HUUpInq2pYILHt3JJR23VHGUGfQwY60VKuZIbU6OmCY5P
 AE136W9YQNrgINPKscts1vuvnvYTlTB6pm6IJReOlFnUmACSIMXGLypTm
 tpr7ipGQSXhKhqMnrMShk9TSv1oIeMLsA730sL21d4a43GpNbbsnqz9CT Q==;
X-CSE-ConnectionGUID: 45bcdDCnSfGphZnBy+xxdw==
X-CSE-MsgGUID: 5sgWFZXATwa2gb9CiuDkJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="107992400"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="107992400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 23:39:18 -0700
X-CSE-ConnectionGUID: CdJQUtKjT4i7NnQmB+NLvg==
X-CSE-MsgGUID: IjVckwFJTxO/+WfOWiIOKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="253326354"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 23:39:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 23:39:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 23:39:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 23:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZJSgIdzAPl72BZ4kAHO1rnvzOJTxUcMSm94Otjln39IVEs47HKgk3eFePgCcbBpNjJkFoPsaNPFESHhRt3DrEp6UMjE+eIPUfNO+2Ogt8nXLmSVD+g3PqHMAIkKtKRTMB3lGIX8XaPiUV62D9RwN1b4wsv3sb2MaU/DnY7sSSnq5Zg54gt4zegwiXLWWx4qa0RXSnQhsg0wrMTnXDfV+qJdR+a8h4WtIf6gxDM3TxEeAB5knPrA+gR88zkjJ+NvKG9fR7BjNPjlaNTg+3EJay5v8DV1/KtBt596uGwN+Vv67mkUBXi0BvBCEH6T+Kc5eN0l4Iy+542/UdSHenO00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXSQec5bUQyPOyDw8Drfwkny3LDj7ryPjeWSLB/Bekg=;
 b=lM4xd651MHcrokd8P3qSZ95v2cPjdUB9ozSGIK1D1wYwPHIGY5k+M6n0v4ZgItboT0uJxuDKLsCQhyE66FxVxBYgfMT9q3ij1/ttZ6dMDqronpJ8A6gTuvmKTFKT4v/aEnb2yd0kBYOkNpbuf5y8z2cMBD6yOaMnbfgXaRdEqg/6kwFhcDckH6gz4ijhHEdcJqQleGzMI6UxHFsSepks4rtJCs6KA1WlM2QqaofarFs7hF5xh26P4QWRbonIunNRj+mmS0dOI3jLhv2iPVvEGOAYPT+h2+ChuEOt4xCUzlLTfdCVOA/qWe1COY2XZljrZGumGAqMPOZ/Qnqu2F0bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by DS4PPF240F42FB7.namprd11.prod.outlook.com (2603:10b6:f:fc02::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:38:52 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Tue, 21 Jul 2026
 06:38:52 +0000
Date: Tue, 21 Jul 2026 06:38:40 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 24/31] tools/intel_guc_logger: link with minimal
 sub-libraries
Message-ID: <bzblvifmftr6nxtu65evcrsv5cd4b6xeapncg46xohinmd2xw5@22f3ubn4sn4h>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <4a19b9a60fb9423f96697b1c59c7dcf1a064f44c.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4a19b9a60fb9423f96697b1c59c7dcf1a064f44c.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL0P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::13) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|DS4PPF240F42FB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ebd8e1-58b4-4b33-5a83-08dee6f2bad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|4143699003|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ApJgtJw4WBody5SJUMtNdzbH4XczkaVBsf0G7Taxfp7jdSaW2RLp1wfMQNJNAkdgRd0FOYpxPeWEnnxd3LVNdMQVvG4nBsCXtL1XKmHnh4ld5cRefq5+gFvIbt9LPez4J3ZFIw/js3cxGg924pSvi5GNzTUCMvwtuQnq+BEdXZVh2rPxx6ZAcJu13uUcZu2UV/C4zPeZAWuRcS+peRFVhoPBx+msd428anS8MXtbvFePLI0vlKAd4hZ3V283ehsX/7cVR/8n4s7X1OhRKlBzh8Ns3Uql2jZsXoCSM4++6OZN23s+0yCVeA9t0UfH//NKUfyMnM8jRJbWzGEA4zKhM7xEI59BI0zZniYapcRGuY/gX0eHAC7Ir5ioQPOH6s9jurgfj6sdovrViptrHUS/isCRI4GuARJoSveRq2zj0M5kuMGd11tnw1rHHrGdoJg1WKfFTMdIfkuE5o7pS8o4Vyo26pp6G9zK4fCUenMiI5jdTqDRaWyLbOrdiF9MepPnu/xinwkzc+ZVCKKgOXi5oZPKXEO425DP5u3Iu3MnyMn0aJsfBNvqZHx95+ho0rczDDmtn18/V9sk8W49Z3hG+1X/8bwzKpOkw6yc1owQ14U2aBb/BAGPx2lB1UYlqkBukcNfwHg8KzlEf31wiJfK0mH2Depfn6up/j7CI6Bb5Vo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU1ZZ0d4eUUvNExGNUpHa3lwZ1JlR2VBWW5WWTR5aU83eFMxOWE0RG1jdjZq?=
 =?utf-8?B?OGRkbzhGOVhkSmZLdjh6NERUQjhJckpEWW5JOWlTTURNaUFYS1piNUl5c09a?=
 =?utf-8?B?bkZsWnlVakNVTTBCdDB2WVQxUHBqTThKOG5MS2NrdjNIMlkwdk4vK3hYMDc1?=
 =?utf-8?B?UG5rMzhKSEVsUm1HTTExSXpzUzBZWEJvZC93M3ZDbXRZSVl0aVgvaXlIaitq?=
 =?utf-8?B?MFdqcXNxQ2JqaitPUzE2aXZLRVc5UXN0WmVEcVY5aC9tWGdLU2d4YW1YM1lV?=
 =?utf-8?B?b0MvMWJMT2tzNU4zWnJXWlU1eGh6eUlhOE5pV2lQdksxMmpPUEpDSGk3S3Zy?=
 =?utf-8?B?Q0N3TGt3RzV1R1ExTlJTbEcwbHhlZ3VJWXpHNlFMdWNFTDRmSWdMLzFCSEsr?=
 =?utf-8?B?VXJKQi9UTEJiUURMeGNNWnBPa3lBRjg4RlhUK1RnTExzdm95a01CZVhJTmxF?=
 =?utf-8?B?VUVHNG1laW54dG9VUy9DcTZEN3JQT1VwTWVaRXNuNHFjRHN0YkI0TWJDREs1?=
 =?utf-8?B?UTdMVkNBY21sMlpFR0FvTEoyUkVVVloxQ09WZi9oclErRE9NZHpzdkJXM1hV?=
 =?utf-8?B?eGtEREpjM051ZVdMd25GMHdCTHFzKzY3cENmMVhNNWxMSm5wSmdWWGdwbndY?=
 =?utf-8?B?MUcwN3FSMHJUYUtpMWQwQVRMUjltNDZ2UGFNRWpmVERPOWxzT0Nla1o0WUNS?=
 =?utf-8?B?VUloYlRZcDdwdzdkQW5ueldoTUpKMStPcE1HQ2tUbFVERzJsSmxacHNCV0RH?=
 =?utf-8?B?RTdGV0lqcUJINzhwTWJBb0kwT1dDK0srMU9DWmpNbEZnVGxmQ0JoOHJ2MzZl?=
 =?utf-8?B?dEh5OENLMmt6aTBEdTVwdTZVYzdUejNveEd0dmdtSjNqQTg0WittVFNLaVI4?=
 =?utf-8?B?ZWNQV0lUTzlhYlp2TWdvM3FSeWJpeUxOemFpa0l6eW1IU3dmT3pnR3g0MXJP?=
 =?utf-8?B?RGpLSXJHQmkvdFEwalNpRCt6UUhMQjM5NWl2YldQTlVjbFBEQytMdGtnbkxG?=
 =?utf-8?B?TEx5OEVZOXBXTFhYQkR2bmNjN1pWTXROeUlmeDFVVUZOQU5Eb1Rza1JEbzYw?=
 =?utf-8?B?V3dUSTBSZEI3OHNycVJiOHpEMzlleEZ2cnRkK0YrQWpCZlRqSlBhZ25ubVpZ?=
 =?utf-8?B?d21xbnh1T05VZWU2cjg2Nk1tT2NnODBRbzZ2R3JYTW0zOTBWY0N1aGsrbmcr?=
 =?utf-8?B?WUVsVTBQMGM3SENjTExISG9ITDJ0aGIrT2xhbUVFdFNRZG1xUDNGNVJCWm91?=
 =?utf-8?B?Rk1JQk5HWUxMWlhDMFVKdTNwazQ1Tk5CN0FPbWNJN29yeEVxVDM5N2w3bGFp?=
 =?utf-8?B?SGhSYmltTVhTZitSQ0ZCWkZKUCszYkM1dHR0Ump2VU90Ulp6NHBSL0k0SjlW?=
 =?utf-8?B?aGwvbHMxNE9KeTNzNWc2eXBIUEM5UFlFNWMrSUlkNjRrTlYxWHJTa0l1dVJ2?=
 =?utf-8?B?Vm5MYmJ3V1ZJV3czVmRSZVFPNjMzSnMxaXIzVzF1RXE3ZW0wYTRNM0NYYndS?=
 =?utf-8?B?VnFhYzY4T0RuRExKUktpQnlxZWxoQXVGT3FPMXd1R3NCdG1TWkE2NUd6cENW?=
 =?utf-8?B?QWhnV0EySDZKd1lhVEgzNTNLTGlCWjBwRTdHV0FWd2dCVzZLSWVqd0U2SzJB?=
 =?utf-8?B?b2N3ZWhOcWRtMXpReFVVazhocnhzYXQ2cE5NUWErUVZ4TTY5RTJUYmxya2Vs?=
 =?utf-8?B?UHpSR0ZaektMWDM4ZGloRmtOZWJSdm9TQnhyUVhNUXEyUHlhTnVQa1pZWFdN?=
 =?utf-8?B?S1ZQbEhZUXBHZXR6QlRvVE5BS09YU0pUYklybUkrT2hqZytkRnFXM0JZbVZx?=
 =?utf-8?B?Z2k5QTJ5dnhmUUcvWi9SYW00M3JVR3M5cVplMjRkM0JUeDlLbkU0bTFycDBn?=
 =?utf-8?B?RUVudFkwZWVGdEcwazBGak5mUDRjd2J1bFNrcUxQcGlqVWdQTVowYXdvWG5w?=
 =?utf-8?B?ZXYzR0J5dHRNcGQ1VjVMMlJ1RUZ6Y1pVZ1g2ZzN5SjVWZExrRGJhaThHUXI5?=
 =?utf-8?B?ZzhrcU1WMmV4MXpBTU83MWdmTExlTk5WbTNIdVJXMEphQk9KRzEyWXpUZCtp?=
 =?utf-8?B?MU44MGRMbm4vdnc3RitnZys1aENidC9oZE5sdFpteHo0dVVVUkxRNEJzZmxa?=
 =?utf-8?B?ZVovb1h4alZ4U3g1dWtpSHpzaGdnNzNCU2NDWFBZdjI3Mi9Xajk2a3hqUTRl?=
 =?utf-8?B?cUs1VVBnTmRPMXp0aFphaEI1MFNQcTlwb3ZhOFE0L1VvWFBsOVY2K2x1WGow?=
 =?utf-8?B?Yld1NytzeDZzRDBUYUJuaVgzTkxSOFhIbnJnNmM3eEJONWxrWDh5TmdyVVh1?=
 =?utf-8?B?MVBKOFFkZDFCeDBMZ1hGdTZkT2RwalJTSGJoMWVaTktzcEpiTit5aTY1VVBu?=
 =?utf-8?Q?JxN4ZGyDFT+4z3J8=3D?=
X-Exchange-RoutingPolicyChecked: Tb2mZknmhvJ76TzcS5xFhu//ExiQaPyGkOsfY44evNa0jj3xCO3yC8/226XTWsDEGENPHSNK1Emvhk4/GEuYic/+tZHYeW8OB7HokOwQr+G5PJUbv6cnrMVfqz/Iw3nWIUFF1wB+G5dw08wMB+hQrWxVw4ahAoMg5JXLREhtEUu6r6U3vf76pKrjZXtosHuIGTv+Ef9zMer09R0nS1J1WowjCRSPEM2/IHCfLbg9ulBJO8xfTTI34opGTOJQn2m10Txdypb+zSPzxq6WJw8Iyd8KNm0Yxx2KdNYKf6flLuLPJ/3fVhUPTUajCkWHWTgL3rdrqgHbtVfFDujbLyzRMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ebd8e1-58b4-4b33-5a83-08dee6f2bad3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:38:52.5597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0sTg8cgxb4aoIJQMBsUaTCLKyV53KBbJBmeNQInnQi0qA5w6fYKrf2NRPVb1mAgL72tllr6jQRGEHzrPv8gD9+SLR2GM1rHJSRB8pUoVKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF240F42FB7
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

Hi Sebastian,

On 2026-07-15 at 14:15:34 +0200, Sebastian Brzezinka wrote:
> intel_guc_logger only needs core logging/assert helpers and debugfs
> access, not the full libigt.so stack. Replace the monolithic include
> with the minimal headers and link against lib_igt_tools_stub.
> 
> The tool previously used igt_simple_main_args() for option parsing, which
> is part of libigt.so and cannot be used without it. Replace it with a
> direct getopt_long() loop. As part of this: add a 'help' long option, a
> usage string header, and a default case that calls exit(1) on unrecognised
> options, behaviour that igt_simple_main_args() provided implicitly.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   3  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/intel_guc_logger.c | 21 ++++++++++++++++++---
>  tools/meson.build        |  6 +++++-
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
> index 629b4e660..3990aef87 100644
> --- a/tools/intel_guc_logger.c
> +++ b/tools/intel_guc_logger.c
> @@ -38,9 +38,12 @@
>  #include <sys/syscall.h>
>  #include <sys/mman.h>
>  #include <assert.h>
> +#include <getopt.h>
>  #include <pthread.h>
>  
> -#include "igt.h"
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_debugfs.h"
>  
>  #define MB(x) ((uint64_t)(x) * 1024 * 1024)
>  #ifndef PAGE_SIZE
> @@ -367,6 +370,8 @@ static int parse_options(int opt, int opt_index, void *data)
>  		discard_oldlogs = true;
>  		igt_debug("old/boot-time logs will be discarded\n");
>  		break;
> +	default:
> +		exit(1);
>  	}
>  
>  	return 0;
> @@ -382,10 +387,12 @@ static void process_command_line(int argc, char **argv)
>  		{"polltimeout", required_argument, 0, 'p'},
>  		{"size", required_argument, 0, 's'},
>  		{"discard", no_argument, 0, 'd'},
> +		{"help", no_argument, 0, 'h'},
>  		{ 0, 0, 0, 0 }
>  	};
>  
>  	const char *help =
> +		"Usage: intel_guc_logger [options]\n"
>  		"  -v --verbosity=level   verbosity level of GuC logging (0-3)\n"
>  		"  -o --outputfile=name   name of the output file, including the location, where logs will be stored\n"
>  		"  -b --buffers=num       number of buffers to be maintained on logger side for storing logs\n"
> @@ -394,8 +401,16 @@ static void process_command_line(int argc, char **argv)
>  		"  -s --size=MB           max size of output file in MBs after which logging will be stopped\n"
>  		"  -d --discard           discard the old/boot-time logs before entering into the capture loop\n";
>  
> -	igt_simple_init_parse_opts(&argc, argv, "v:o:b:t:p:s:d", long_options,
> -				   help, parse_options, NULL);
> +	int opt, opt_index = 0;
> +
> +	while ((opt = getopt_long(argc, argv, "v:o:b:t:p:s:dh",
> +				  long_options, &opt_index)) != -1) {
> +		if (opt == 'h') {
> +			printf("%s", help);
> +			exit(0);
> +		}
> +		parse_options(opt, opt_index, NULL);
> +	}
I looked briefly at other programs in /tools directory and many
of them implement their own arg handling (many in similar way:
while loop + switch). It would be nice to have them unified in
a way in the future, but for now:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

>  }
>  
>  int main(int argc, char **argv)
> diff --git a/tools/meson.build b/tools/meson.build
> index 15bd40dec..32a345e9d 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -19,7 +19,6 @@ tools_progs = [
>  	'intel_display_crc',
>  	'intel_display_poller',
>  	'intel_framebuffer_dump',
> -	'intel_guc_logger',
>  	'intel_hdcp',
>  	'intel_infoframes',
>  	'intel_opregion_decode',
> @@ -112,6 +111,11 @@ executable('intel_forcewaked', 'intel_forcewaked.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_guc_logger', 'intel_guc_logger.c',
> +	   dependencies : [lib_igt_tools_stub, libdrm, pthreads],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

-- 
Best Regards,
Krzysztof
