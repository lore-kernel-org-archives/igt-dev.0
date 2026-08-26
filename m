Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A557FC61DC2
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 09:19:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1D310E274;
	Wed, 26 Aug 2026 09:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUfpxPXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A2610E274
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787735941; x=1819271941;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q3qQFnYHW5uuzLl/XYFTQCL0Y6I15uO9y4TZKKj80BY=;
 b=KUfpxPXI5SjOKn5F2uBVOM1AgMrYZICikzA11f25PgJl+D0vjWf5RwHs
 NvEbQ8woPz12wX5K0sCqY/bIQarrYLK+nrxi22BBbCg+bFBRRz27uVi9t
 dcnNAjvTXuFy/dQgpArocDlUwaCcvOLlhQuFoBb7DpMmLkZ3v6MJ70HOp
 NBA5kUcG3Fzwv/gzkAC6ATHf5HOEslOu7UtF6RSBGeAdTJVSRHlT5IBJK
 7V/vnTYmjRW9yWee4GXa/3CeISzcXjKeoBxoAfwa6k77xZziIQzO6KSTU
 JeieargNveclY8RDvrzl6APjTVhtTsQwzaUWOo1+bJaruVJjIiTI5N6kO Q==;
X-CSE-ConnectionGUID: 6KCEXOPXQMO9zHh5iF63TQ==
X-CSE-MsgGUID: TVRSBUesQ3ivztBlgHnpQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88241231"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88241231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:19:00 -0700
X-CSE-ConnectionGUID: 0RKO10B1SYWs6mEKzW444A==
X-CSE-MsgGUID: H1oJm4KvTGqY5zGF9W9tkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="268094050"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:19:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 02:19:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 02:19:00 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 02:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcyN9IRJxnBui9JV9/z3t0CXfDbnMdhSajnUK+TBnTbmfmQCneBhLZl1cpecsvAAwKRUk8wVkDF2+S/QS6DrpFG8oBq1/KNfKe7Z38lN3piM6xQQBZWI6lLhnqJ7etruTC6w25SeqdOS5K/dYHiAo57KLghFUae9TIuMz1tnpgbFcaCm8R50E5b4DMnRJpcKFT4UaVhWx1KSQ/WdQQpN39W1QPG0BTBWHiBm/lO+cXjUoDZHpNQ/rFdQtCw6sxFENldHPKb5Cb1DlQPxVb19Au8IDYmPkTz4keN1ooHUJujR+QXet9ZoUpH72ydo67UA+254kzvfgm/SBO/TeKhdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trJv5BL2nP1gKHqNYTkdOie0xFL7F5GAO8xvhcMl+zQ=;
 b=GxfLLx1NxY2RDt8VrBXC9W24RMJ1oVPJlnnwbh9dx61jYDA7XRyik0eLlj2kjyLuZq2y9u17WdA2ksOtdtMSxpSZ6UQlPMe0RSV2Hakwfj964awTGrB1p3VIDu/OnfnQgbQV6OAGdfWlJ21DsKo57zoJblOpUBkUwGH4nuXh4Uoe6Dg/D+XECcQXgLPX5537S9zkPc1YOpVpt87gah6xhIBcZJNdFRiXuYCO0y6ainfmJNS7uivEAN/qot2MHUMfcez0wvCx2NHSd7N6Y7xvkcvymQIsR4MQXJtUfXRRdaTNVmcW/0zviZFJGFB53EUi/OCbF2JcfystmeZmmI/PsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA3PR11MB131926.namprd11.prod.outlook.com (2603:10b6:806:595::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 09:18:58 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 09:18:58 +0000
Message-ID: <8ac9fdd8-4bdf-446a-8ca4-f66bec6a6f7c@intel.com>
Date: Wed, 26 Aug 2026 14:48:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260824164133.129138-8-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0169.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::13) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA3PR11MB131926:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ddfd3a-16cd-4eac-11d1-08df03530edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bPcN5zPN52gSBN07xRP8f3rHd3kJeyyj9So6T+DqWach/oV0AwrA5VbcIjT3udBr3oJV4rAEF/ZY6OiaZn4ZF7xz1ZGmUfdNbcMccSxvAJked3e0BHRT2Rigmrsd6q2LLK2Rf5+JnPYo5gq2UXMqar6oGzv2ttwDGbSDtlFpF3JYk02sQhjdqfmFZDTjdm+3G45Asin5w5LoOXyfyFG+FlSFNGyxG3J1lLwFX+vFY1N0drrpZmR5gE14bnHuZM0fd2U15TOA+TmFxHlwts/AVvoysIzeR4qvZkbZJ+xTvpzeXS9rm9ScLLhkhRthcVoEz+NWl7AqxtT4VgD628o1EBjJRsYTh8nEVYH7aaLzwCChq5USXZ1uWsfXnm4mXMnmqeZEQdJRGediR8gmYLE4lH2a0a6Sd2qc+WWEX8GLjgBKTZtA3m42RA1y4eueumRzGFooArwvDM1WB5jQSPSriosiDccF+vQRjtdXCA2BsWBlSg2SE9O7C1Kj4BzIKn35qIw/i/GnbMrzMPsC7+ODWky/MXVDCHDkmljo2B6M3sJfuhVoneHnG8E7pHheaN2VwmjX/3tVI4xldDl8xHs3cW6MzotIHl7e5cIqH0r67soK/cn1M6QyIQMrGOvTG3oMF4+X2ApzO15QTiYWfKGsQF/U5tbG8H3zx8XzgL/6P5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2RoMXZCZEdMQXBSQXFoSEZtREtYd3VscHJ6Q0JtV0JSNVFWTk9tbXEvM2ZZ?=
 =?utf-8?B?ejBvakx4KzM2blEvQ01SeExoeFN6TGl5UkZYQmtCd3V5d2hnM2VKQXpGS2Vo?=
 =?utf-8?B?TDdaZmdMSXF4YWpKNjUxQmxSbm10UklLSjM1Z2ZFL0s2UjJKeCt5ZldBUUdp?=
 =?utf-8?B?Y28zTjhDYlE1em9DditHMU1pU1dCK0VWVE5nbTU3OGhyWHpnb0gxVmJnSzJq?=
 =?utf-8?B?bnJuZ0M4MzNvZExJdE95VHZvdHRwY21JbStIL3hXZm9ncXJIb21QSFpIcnZp?=
 =?utf-8?B?cmYwOTIzRzZsdEVsak5GNzJVcmhqSnJ5TXhWdGZWV0UzV2hwMTVTM2FMa3ZW?=
 =?utf-8?B?ZGxWaVRXYWdITlI4T1p1cDBNMkNWRDExSEJwWWR4ZC9yd3R4S2Zid3pud3JZ?=
 =?utf-8?B?R3F0dFZXZXFsVGlmZ0UzYngxQnh6L2JlZlRiVDJPbEVoUnh5R2pYQWFMTnRT?=
 =?utf-8?B?NE1KNWZobVYwUkJFMlZsclVnaExGN3Vkd24zS0dMNkJoZ0hGOSt4NlVIRlBI?=
 =?utf-8?B?TWlzZGlmRnduUkhwR1NtWXg0TWY4VFJLZGhhOURQcHRDOGFHQmNQRjI5bHRG?=
 =?utf-8?B?R2UwdFJseHhDbFJhdHNnN3JWd0ZnYitQZmkwVkwwSmdRV2xpMEFaUEduWnJs?=
 =?utf-8?B?N1k0Y0tPWGwyVmN0RCt0N3FQaUpIU2tjalUvNjg5L2N4VTE4eTk4WEk4TUg2?=
 =?utf-8?B?ZUg0ejlHRjV6Rm1CejljV29RS1VTa1JrNHBDMXNOdXBvRmV0L0VyOUk4Tk9H?=
 =?utf-8?B?NFp5TW5tWlhQcG0weGp3clV0dldjYXhESlhEeWxYUXZ6MmdJaVZsWEt2a3lZ?=
 =?utf-8?B?eFVxQVBTWWVmZmZyWUJLTzU5dDlRTk5WR3h2VFFFYWxWdzQ4emR3SGJrQmg1?=
 =?utf-8?B?M3ZIWkRIYkVVejAvN0JJUnE3ZTVFMldDaDJPMGtkVURXRm1jRnNxenBVeTlh?=
 =?utf-8?B?ZEVvb0hUZlFFK21VUkMvSytjL0VHQ0N0eUZmWFF2Sm9uampNZXp5MGxWMzVy?=
 =?utf-8?B?SUp3UjVYM0x3SU5sSnlJUkVGSnFiaTlTZVpPZ2NGVUE3aHZ1NWV5eEtDeXcr?=
 =?utf-8?B?RnR5RWI0TE5ENnZKdFM2OXVkWXpqODlaVFYwRVNMOUlGN1NjNDJPZTkyVnlm?=
 =?utf-8?B?bmFiM2kyWFloaHAvUkZ2UFozMVhwellOR0tEVGZ1UHcvdnhKK0RGU3lLNU96?=
 =?utf-8?B?ZFVBMHVKS2lVVmROUEtPV24vUW1tM2w2OC9lTnRDeHNTbFFlY2Q4ejBCV2pH?=
 =?utf-8?B?cU9LTGM3bklFMEVOWi9hYnN1ZjZoanR6MmhMVGJFWndjMk50M0FHOWpIRWVW?=
 =?utf-8?B?clRyK1QvSVNVRk5jTGsrYWtXandBUmhFNHNNQUJxd0toREVpRzYvdm9vd3p6?=
 =?utf-8?B?bEtscVNLQklHSk5zRzB3S3A1eUJ0L2Naa25mWG5NalA4YytDMzIyNE1JNEtE?=
 =?utf-8?B?MVhvZ01xeSszVHV5U0MzeHBUNDBWUDNRanM2bXV0YlZvcHZleGhDNXdIMXRV?=
 =?utf-8?B?N3R1WDdWbzdiendMOW1ZRzRMTkpDQUowUHZ2Sm41NWR0UlVtRzlFaDlmM1k2?=
 =?utf-8?B?MXNXM3R3TWNEUmNTbDEvWFpDQkpwekVLSTlRQ0Y3dWR5Mi9yM1R2S3NaamFx?=
 =?utf-8?B?dkRYK2ZCZzAxMXJKdGlUcVg5NXhOazFLd0wzREM0MjVjajFlZjlFeU44TC9N?=
 =?utf-8?B?YkNjY0lHbCtWY3FkWXBsbE41MGYyc3ZWVld3ZnZoc2ZWMk1aVTJUdk1wN0Vt?=
 =?utf-8?B?NXRsQTI5NXBRUzFrSFdNUmRoc2FzUXMyQkQxRkExcmQwTE5ITzFsUEJDemNq?=
 =?utf-8?B?aDBFc1MxNFVGT0VnNXlWamNrNHl2TlREUi8zZ2lBYzJGZDgyVVRCMitwR2ZN?=
 =?utf-8?B?SjE3U3FzZ0tIODY2aFI0eTN6S0MySklZajFXRFpWTTdRNXF6RDhSOUVNSkQy?=
 =?utf-8?B?N3JscDdKRWw1UUFOQmI0VmZxYkNwanNyREY0ZnJuVFNvYVJ1Mnk5QkIybjF3?=
 =?utf-8?B?UGduUmpRREMrVEczclU4QmhBS1piaHNxaWJzaGc2eGFUcm9oaDFUaWNRTldv?=
 =?utf-8?B?K0dXVVZyVWZnd3FGMUE4cXF2TnVSTG4zVE95Ylh6V29NWmthbU5xVWFMeldQ?=
 =?utf-8?B?bWJnb0FnbDkwWGl6elc5SWs4QXIwMWozZ2xEOUdVbjMyaUY2NnY5cnkrbVdu?=
 =?utf-8?B?eUdVbUNRVER1ZjRZaGo0bGJscUFIa1UyRTh3WUhISzJlVjN5WXVocGVCcVdY?=
 =?utf-8?B?YjAwdDNvREN4RTZZMXQxb1o0RE1sbnIxcUlPSGNHMDh1aTZSUUF6VUoyNGVK?=
 =?utf-8?B?c2JJbHNCR0IzdmtremE2UEhZV2JJWnBVL1c3ZEw5ZHhaSjRXR3hBUTl4SE04?=
 =?utf-8?Q?zZ9EMpITUDklNZQs=3D?=
X-Exchange-RoutingPolicyChecked: O+C9JGdd93sguLyc+yd5wdWRuCjLB2E1do7RDf2NnahPJZKlS87rbfm2ndezNLTZtK20D56U2DeepI+uXfKs064Rfp7F3FJVHeqP8ATOWdTonVo8btmtHhdT+BGAH2NrZKqoYSMNZSn11VYqp0frteveOU2hEq8jQC55u8207yX2QXUNxaCz9BWuV7C2FLCrZZm/hc8eLFxVB2uU0ZxtvRuhEs6xHIE8a6EoffHtPtJshdDyNTLJXt0eVPR+MnMng30mHAseBJceMfQQN6gLD7GdQkeKz2dd4o1fHXaydlhj1u6LFm/GBTMnq2YMSNhKvsm/Q2tVuoIHlfxDYJ7vXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ddfd3a-16cd-4eac-11d1-08df03530edd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:18:58.0469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzC6a9E/tmbG95CqrVYjubyExsGsACztyeqd9GE1KmwoZsG081X7P600XH7gZSVNsImghqXa0OUlSbEZFv3sig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB131926
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


On 24-08-2026 22:11, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   tests/intel/xe_err_injection.c | 321 +++++++++++++++++++++++++++++++++
>   tests/intel/xe_err_injection.h |  18 ++
>   tests/meson.build              |   1 +
>   3 files changed, 340 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>   create mode 100644 tests/intel/xe_err_injection.h
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..ded5f558f
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: MMIO based Error Injection
> + * Category: RAS
> + * Mega feature: Telemetry
> + * Sub-category: Driver
> + * Test category: Error Injection
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <fcntl.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "lib/igt_drm_netlink.h"
> +#include "lib/intel_reg.h"
> +#include "lib/intel_compute.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +#include "xe_err_injection.h"
> +
> +enum {
> +	RECOVERY_SUCCESS = 1,
> +	RECOVERY_FAILED,
> +	RECOVERY_TIMEOUT,
> +};
> +
> +static void run_xe_compute_on_all_engines(int fd, bool state)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	if (state == POST_ARMING_INJECTION_WL)
> +		igt_info("Running compute-square on all engines post injection\n");
> +	else if (state == POST_RECOVERY_WL)
> +		igt_info("Running compute-square on all engines post recovery\n");
> +
> +	xe_for_each_engine(fd, hwe) {
> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
> +			continue;
> +
> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
> +								    EXECENV_PREF_SYSTEM),
> +								    "GPU does not support "
> +								    "compute on engine\n");
> +	}
> +}
> +
> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
> +{
> +	xe_mmio_write32(mmio, reg, value);
> +}
> +
> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
> +			   uint32_t bit_mask, bool set)
> +{
> +	uint32_t regval;
> +
> +	regval = xe_mmio_read32(mmio, reg_addr);
> +	if (set)
> +		regval |= bit_mask;
> +	else
> +		regval &= ~bit_mask;
> +
> +	xe_mmio_write32(mmio, reg_addr, regval);
> +}
> +
> +static int acquire_forcewake(int fd)
> +{
> +	int fw_handle;
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
> +	return fw_handle;
> +}
> +
> +static void release_forcewake(int fw_handle)
> +{
> +	if (fw_handle >= 0)
> +		close(fw_handle);
> +}
> +
> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
> +{
> +	struct app_context ctx;
> +	int ret;
> +	uint32_t error_value = UINT32_MAX;
> +
> +	ret = igt_init_nl_socket(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
> +		return error_value;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = igt_get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	igt_cleanup_nl_socket(&ctx);
> +
> +	return error_value;
> +}
> +
> +static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)
> +{
> +	char *buff = NULL;
> +	size_t buff_size = 0;
> +	ssize_t line_len;
> +	FILE *fp;
> +	const char *success = "AER: device recovery successful";
> +	const char *failed = "AER: device recovery failed";
> +	bool marker_seen = false;
> +
> +	fp = popen("dmesg", "r");
> +	if (!fp) {
> +		igt_warn("Unable to open dmesg to check recovery status\n");
> +		return -1;
> +	}
> +
> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
> +		(void)line_len;
> +		if (!marker_seen) {
> +			if (strstr(buff, marker))
> +				marker_seen = true;
> +			continue;
> +		}
> +
> +		if (strstr(buff, success)) {
> +			igt_info("Found \"%s\" in dmesg after %d secs\n", success, elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_SUCCESS;
> +		}
> +		if (strstr(buff, failed)) {
> +			igt_info("Found \"%s\" in dmesg after %d secs\n", failed, elapsed_secs);
> +			free(buff);
> +			pclose(fp);
> +			return RECOVERY_FAILED;
> +		}
> +	}
> +
> +	free(buff);
> +	pclose(fp);
> +	return RECOVERY_TIMEOUT;
> +}
> +
> +static int check_err_recovery(void)
> +{
> +	time_t start_time = time(NULL);
> +	time_t timeout = 5 * 60;
> +	int time_interval = 30;
> +	time_t elapsed_time;
> +	int status;
> +	char marker[128];
> +
> +	snprintf(marker, sizeof(marker),
> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
> +		 getpid(), (long long)start_time);
> +	igt_kmsg(KMSG_INFO "%s\n", marker);
> +
> +	while (1) {
> +		elapsed_time = time(NULL) - start_time;
> +		status = check_dmesg_for_recovery(marker, elapsed_time);
> +		if (status < 0) {
> +			igt_warn("Failed to query dmesg for recovery status\n");
> +			return RECOVERY_FAILED;
> +		}
> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
> +			return status;
> +
> +		if (elapsed_time >= timeout) {
> +			igt_warn("Timed out while waiting for error recovery\n");
> +			return RECOVERY_TIMEOUT;
> +		}
> +
> +		sleep(time_interval);
> +	}
> +}
> +
> +static void print_aer_recovery_status(void)
> +{
> +	int recovery_ret;
> +
> +	recovery_ret = check_err_recovery();
> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
> +		     "AER error recovery timed out\n");
> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
> +		     "AER device recovery failed\n");
> +	if (recovery_ret == RECOVERY_SUCCESS)
> +		igt_info("AER device recovery successful\n");
> +}
> +
> +static void log_status(bool val, const char *err_name)
> +{
> +	if (val)
> +		igt_info("Injection: %s Success\n", err_name);
> +	else
> +		igt_info("Injection: %s Failed\n", err_name);
> +}
> +
> +static bool gt_uc_wkr_parity_recovered;
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
> + * Functionality: error injection
> + */
> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t error_counter_before_inj;
> +	uint32_t error_counter_after_inj;
> +	/** TODO
> +	 *  Fetching node_id and error_id dynamically is pending to implement.
> +	 *  For now, using
> +	 *  node_id=1 (uncorrectable_errors) and
> +	 *  error_id=1 (core_compute)
> +	 */
> +	uint32_t node_id = 1;
> +	uint32_t error_id = 1;
> +
> +	fw_handle = acquire_forcewake(fd);
> +
> +	error_counter_before_inj = get_counter(node_id, error_id);
> +
> +	/* Arm the injection sequence. */
> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
> +	modify_reg_bit(mmio,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
> +		       true);
> +	modify_reg_bit(mmio,
> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
> +		       true);

Is steering semaphore needed to be acquired before these operations?

Thanks,
Soham

> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
> +
> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
> +
> +	release_forcewake(fw_handle);
> +	print_aer_recovery_status();
> +	error_counter_after_inj = get_counter(node_id, error_id);
> +
> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
> +		     error_counter_after_inj != UINT32_MAX,
> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_info("error counter: before injection=%u after injection=%u\n",
> +		 error_counter_before_inj, error_counter_after_inj);
> +
> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
> +		     "failed: before injection=%u after injection=%u\n",
> +		     error_counter_before_inj, error_counter_after_inj);
> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
> +	gt_uc_wkr_parity_recovered = true;
> +}
> +
> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
> +{
> +	igt_info("Starting Error Injection test: %s\n", injection);
> +	if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") == 0)
> +		wkr_cmd_parity_err_injection(mmio, fd);
> +	else if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
> +	else
> +		igt_info("Invalid Error Injection specified\n");
> +}
> +
> +/**
> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
> + * Description: Run a post-recovery Xe workload after parity error injection.
> + * Functionality: workload validation
> + */
> +
> +int igt_main()
> +{
> +	int fd;
> +	struct xe_mmio mmio;
> +
> +	igt_fixture() {
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
> +		xe_mmio_access_init(fd, &mmio);
> +		igt_require(xe_mmio_is_initialized(&mmio));
> +	}
> +
> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
> +
> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
> +	igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
> +		igt_require_f(gt_uc_wkr_parity_recovered,
> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
> +		inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", &mmio, fd);
> +	}
> +
> +	igt_fixture() {
> +		xe_mmio_access_fini(&mmio);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
> new file mode 100644
> index 000000000..d7efc2fd2
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef XE_ERR_INJECTION_H
> +#define XE_ERR_INJECTION_H
> +
> +/* GT Uncorrectable unicast worker command parity error injection */
> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
> +
> +#define POST_RECOVERY_WL 1
> +#define POST_ARMING_INJECTION_WL 0
> +
> +#endif /* XE_ERR_INJECTION_H */
> diff --git a/tests/meson.build b/tests/meson.build
> index a62f447df..0f090dcee 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>   	'xe_debugfs',
>   	'xe_dma_buf_sync',
>   	'xe_drm_fdinfo',
> +	'xe_err_injection',
>   	'xe_eu_stall',
>   	'xe_evict',
>   	'xe_evict_ccs',
