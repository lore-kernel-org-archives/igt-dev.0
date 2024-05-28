Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FF0C25B78
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 03:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69F410E01F;
	Tue, 28 May 2024 03:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EN9sV3lE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A81510E01F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 03:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716868294; x=1748404294;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BoTMQ2XpvHrzVqEfoO0DPirKXh61CC5zbiqq1DPieHQ=;
 b=EN9sV3lEFCUeQjEMuez80rspQ1ElkCT/zx9r3MBX5ClOBiXvGiZfWDWW
 bT2bjK+xMzwynlBMgrRO4TwmIqXwavJFfNAAwgfXGJlZg0aq/ZixjFKAK
 C5y0Yb9wW8Ir3l0lL9s/JQp2cIe+e+C36Lq+q9B/GENnEPfmdfUFCIxHu
 rboRFk6SimGncvc57jqxfkro3kVysA/9zjQoSCNdNph8R+cAkC/eksDtK
 XGU19v1uGNhxGU63V3qinyQRYdtY2j8D/xG7b1FwwicAaELu0OLsjdTww
 a+cxRRdN8LhHtRgrIQtTXHHugZ0NaIDODrB+JWZU+5uHPRWNfd3Lods5W A==;
X-CSE-ConnectionGUID: Gn9dxvT5SS+NIqoSvyJzug==
X-CSE-MsgGUID: 2askFG3YRCCKkA/Q2NdHog==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17026560"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="17026560"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 20:51:33 -0700
X-CSE-ConnectionGUID: GRX9zMBDQZuBvVyKEDmcDg==
X-CSE-MsgGUID: mYKcRuuoRQeV+b9qRJyv5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="34846879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 20:51:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 20:51:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 20:51:32 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 20:51:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDecFid7JZHhhQd41NQMEap5suDF0fPdT0SUUA2lyfY2TFvT4/p8GqQYAu1VEQf1NNy0fgpk/Iw3kojKXRcOPVljJcyTG8/J0lgnm8WHWBdXRNHv9WkylNfKjzyxMnAacN+iHhhkeAvn09oQ+iLkEGA2Hnzm7U3G+oyUQEsLa3uXc3hacrCQcvxLe6KSZI6v5yzLwAn8ha/USDn1FuorAMl7Ok2YIjgoD7oGIw+Ht2yqUcklQq4C6xLCZ26BoPir4GnBjdRZDfwxZc3+dc/12/ZLDi6d1jIXxsdrTnBvr76pcVLEBVD/5t8t6q4SrwWYGlRDAUcxaHNtsCDjqIfQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wgLBHyCpGfEy3zm1kG7SEQkjX/m2z/13sajN9eTPwU=;
 b=gWhLqPQ8aFe8MkSzZ0mu9GZ/CXpv8rUh4L55D/1aglsbNt31mSik7bcZ6oNoYxO0M6o9whYsvHIItBrAIPFqG7D+MGaddI+gdDocYJ6zOHNHrQ9GTUZuCsU4UNuqA8oP6XGCkyE0tua9+LFUbktMFXna4+n3lblowqOIxhc1c+45B7xatQAl2ncggWckq9mrVn5nu8UtWy3xljzqw+Og8QnI0IzR2CTb9HCTtwn1MopZGVU2T7lubQuzbTYEfi13BITEqm+wwXB5nxgkiBnfw6EXhNlgngwivNFByA7W8wZd17Iw6rE1tdHTMU4CU76JakuBID/ONrBlJhUGMv1efA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 28 May
 2024 03:51:30 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 03:51:29 +0000
Message-ID: <f4608c05-a46e-4440-affa-9af58db8e02e@intel.com>
Date: Tue, 28 May 2024 09:21:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_fb: Mark Xe framebuffers as slow access
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240527131747.1340992-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240527131747.1340992-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SA1PR11MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: b65389e6-6983-4597-4ad8-08dc7ec9749f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVhvaE5La25QcGVxZGpQd2pZSHMyRzJWVmpxdFRWMWtyNDJldTRKYW1zbXFi?=
 =?utf-8?B?MUVjMkRSTmdycFY1cUV6dUVMVC9aRk4xZGRoYno1cXFOalZjb0xJTHhiekdw?=
 =?utf-8?B?amVwUzQ4T1BBWU51RlJKSzg4eDBQQWZ0MytNdjN3di9xN0YwOXV2MFI2TkM4?=
 =?utf-8?B?RjVEUXpEUXgwRWNUSFdzR29ZTS9nVjVFR3NuYXhQMUE2Tm5tQVJ1YmhmZXlK?=
 =?utf-8?B?allZWWxuTkVxV2JLZGFhMmhncWdVRVNWUldYZVdXWGVVSkowS1NuZ01MM2dn?=
 =?utf-8?B?ZEpPSHA5SVYrUlVDbnJpVWtsMHZzYWFUaWxZSHhDQWZzMXdJeFFFajhaUnZB?=
 =?utf-8?B?alFQSjhpVW45T3JZSUlaanREaWJ1VStXeldIbCsrZElPbHJ5b1J6Q2lJY25m?=
 =?utf-8?B?TjMweG9PdnM1ZXNBK2w4RG9PZ1dSdnZXOTg2T2hNVmNiSHBhQjlBbHNDaUlT?=
 =?utf-8?B?U3RoSTMxSUpqMDZ1Z2N0L1JPOVpQTXJ2UWltVk80bHczSUJubUFGcTNlY2xs?=
 =?utf-8?B?ZTNpQ2VWb3c0UDJBRnc0N01OM3BlWURweVpESkhwNStwNzFPbHRpN0dncW5z?=
 =?utf-8?B?Z1pRWUNsdXhhZXpTUUg1T1pPd0NDSlFRMG5vMlQxaUlDWWp0Lzh4Q0JVMDZl?=
 =?utf-8?B?UGpmd29LV0JLeHhOMmZvQy9CUzVCVmxXbklsTlhZbWpNRUJpdWY2UmtBZHBn?=
 =?utf-8?B?dUFIZ2JmQ25HWDJ2OStadDRIZXo0TkY5WE5zb1RiZkxJOGtaaStweG5tczRw?=
 =?utf-8?B?TDJzQmVmQ1YvQXY3TUN6Y2I0TytTdlJCMFpyQmRpenJXZ29VdzU0UWFXazY4?=
 =?utf-8?B?aEJ5blNPY2gyM0FqUGpOSDRiajhCOVRXZ2EvK2dENTJBR1pJbzl0TWpWV05Y?=
 =?utf-8?B?K3ZOaFVFbzF3dXkzNy9jallpcy8yK29naTE2cTFFUnZKNlpDVk56czZzSzZ6?=
 =?utf-8?B?Q3M2dmlONkZYdFhVTDJhRXBmZ2tFUjYzZGs4b25CZGxad0Vtajg3bHdRZzVR?=
 =?utf-8?B?c3h3ZDZZaDVvTGZWRHo1bnFtRVM2SzNyM0UzSUp4WnhTSElzYldnbGRhekVS?=
 =?utf-8?B?aHgxRDVxRm9NUUQzVE0wZWxUdWNReWlIVTNISTlRZklzTEdpcXlheFRvZTJi?=
 =?utf-8?B?cG81SVNUTHZoSnB6eHR4dWI5M091Y0d5b0ZidTgvUERMdkJmOFdMbEhINUZI?=
 =?utf-8?B?YkVBUXFHSEtJbXZwU09SS3FRQktvRi9BWUV4bHBKS3hQcEEySjNvRTdETVA4?=
 =?utf-8?B?bjgxb2NlcmhQaEdhSlFkNWdPUkhUYks3UGo4OGgzS0ZCNnpWSFBGcHhmNkhl?=
 =?utf-8?B?NFhYWURsQWJRTEVsUTRPdmVMZ2Y0U2RZVUt3RXNmZ2xLZGxZZWVHdnlMeDhO?=
 =?utf-8?B?N2o2dzI5KzFoaUwrSFhHMmxnTEhJSDdNS1BaV1NYZVpOanNmVU1BQVZsN3hj?=
 =?utf-8?B?UVF0Q21vRGo3R1BVZGk0eXRpZjdUNVh2b25vOGMxaHRZa1FzaG1vSXVNbUtn?=
 =?utf-8?B?dkxXeWd5bngzcU1SVlpyZlFpZSthN1A5eDJSY0RMSzVqaVdObmhIREU4VEkv?=
 =?utf-8?B?ZGsxUVJQSm1xamlEYTFCNTNESndMYW9DNHBSb2N4ZmUzQ2lKUStqbi9PcVp5?=
 =?utf-8?B?SUVyM0RzR2pDSFBObFRDSnZ0VW5YUDRPRjJqWXU1UjZGRzV0WVg3bm1ucDFq?=
 =?utf-8?B?WldtTldaNDMrYU9naUpFdnVKMUliVWFGeWJVZ3o0QVVtMWlJbFRRUHJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmowalBGK2tzZG5MMmkxTnVybnU4ZVd2aTR1THFBa3FJck55OVVabStYZ0Jt?=
 =?utf-8?B?K0tMT21ranp3QllkY1AvVElMQjVkdHNVOXlaMzhiSFUreVhpRTNFNVo0eGgx?=
 =?utf-8?B?TU1lTm1PKzEwVVg4TkhrQ0hvMFdZNXNTcllwQkJiZlV5TTJWblI0bkRIT2w2?=
 =?utf-8?B?OVdNbkRtbE1lMFBnaCtWVkc4cGRGazE0MDdZanVHZ21LVEM3d0Fzb1IrUjR1?=
 =?utf-8?B?K09ZT1JCc01aVDFXeXgwZWlWS01zanhXY3NhdzJsZnNmM01MUjhIQStXYVhp?=
 =?utf-8?B?bTBIaU14azB5U1dWS1FpTm9CKzBBTmVNYlVudEVHaVp0aDlGSmtuODFyNjVs?=
 =?utf-8?B?S2VPM3hrVVlEbnl2L01XdG9Ea1lWandMMzZuLzc0cko0LzF0Ymhtem0ybDJ0?=
 =?utf-8?B?QjZXZTMxV1l1SXhHOGd3c1Q4NEdrbFUyM2g4WHNsZ1crY0hqaVZCOEhBWkFM?=
 =?utf-8?B?QXdzOGk4UTFLc2JFWDlxejBoYTdyTXVaL2JyV2U5enoxUnJCaHRGbTdpZHdU?=
 =?utf-8?B?SlBtM2ZobFhDdlJMSS9HeThqbTRwWGgzWTkvdGczQm42TmlMalZWdDhWOFJp?=
 =?utf-8?B?MzU0enlRZjFvQW5lL3NNRFBnaExISFMrb2NjTTBMSmJ2bTBwZ29oUGZsdm5L?=
 =?utf-8?B?Z0ZzNFZHZmZYdlg4UzBhR2gwY1FFTVY3bWVuVzRlWER4ZHNUM3JTVFJnRUMy?=
 =?utf-8?B?T1hGNFh0ZW1IeTNEQThuWFZuZ3Qya2o3cVlzcEFXdVRrVmxEVFFnUS9VV0Zv?=
 =?utf-8?B?bnV6dDlzT2IzZFF3WTU1cmNJbC93UDJvamlkZ0FpTGQ3RjQzNUY3TC81dDEy?=
 =?utf-8?B?VkhMTjEwS1p0b1RXQ0NSZlNIMzd3SlFCR1U2ZGZYZCtaTG9JTnVqSTZBUXBk?=
 =?utf-8?B?bm5ldGI3ZWczUkgzY3JxQmVKY1VlWTk5TVBzK3N5WXk2VEhnRG5GWXJmOHN5?=
 =?utf-8?B?SkZ0bU5XNEtUSUFycGJHN3lzcFIwQlNtd3U0VGlicm9EVVk3ck1qUEVuQjIw?=
 =?utf-8?B?eSs2bGcvSFBtdDZ1Ym1NYytWMXZTcm03YjdSQTN3S1JMbmxZckNVY3hQcllr?=
 =?utf-8?B?L0JmQWorUGFTbHZOckxkZ1ZTaWczKzhNMlhEaFFpYVJRaWZjUHEwRUM1bGdy?=
 =?utf-8?B?MFd4Mlh0alc4Z2hxV1NoZmdEangwTGhQbEZsQU9qTFlHdUNaQXpLbG44VjVr?=
 =?utf-8?B?RkQzN1ArOVRyS1JYaUNkb0ZHVXVpSmR0WGtlTWh4VUdpNFNDWGFzeHlja3Ft?=
 =?utf-8?B?SFlkWllld1poN2JtUkZ6VURxWTgrTFQwN1F6SEdyWTdNQlBCbDlmUEV3TW81?=
 =?utf-8?B?eTJuVmFUeDYreUJmSnpDcnN2bXFLVGxDcTZUNU5QMkZpQlJpMnkvaTB0WGx2?=
 =?utf-8?B?UExDS0JFdEF4elVaek5rakZrM3BucjZDU1dCeVZRMHJFa2Z4REVyZjZ5YzBk?=
 =?utf-8?B?ajFlR09rUTFxTkl2VThwamtWOC9YeVJxTXlZRGtPNC9Pc3RsY3I2Z0hOTXlk?=
 =?utf-8?B?VFZLaDlGcExCMlp4cmxxVkRoQ01JNFY1K2VTYmc5dWtJK01KMjd4TjRrRlB5?=
 =?utf-8?B?NUQ0ZDkyMjFEWThybHlEOUtSZjlYWlJIbjY4RUpsVDVhYTg3eTBRSnVVQ1JB?=
 =?utf-8?B?dzFRT0tLMG8zWGIrSk5zMmhUeklqZnlVRDJ0VVdQZ1kvQWpCOHpsaTFyNVFh?=
 =?utf-8?B?V2d5WHp6YTBHNmhaQmdOMWxwOEN3NDZ2MTNFdzg5dHNyNWFJTGR4WWNERHRw?=
 =?utf-8?B?QkdxcjBhK0VoQ0VEeHhLMlJGL3JuZFMxYnd2TmFPdjhNOS9lSGlyK1MwL0J3?=
 =?utf-8?B?cGc4eFZ4UmQ5OHlZU1JmZURlMyt6UHhZM3Vaci80aWpiS1ZUK0o3K2pTaXhI?=
 =?utf-8?B?VVlKOUQ4eVRQNUY0UXhOMzBSVTYrVngrVEdIQ1Y4Y2xyaVE0YXZ0UmdpWFRX?=
 =?utf-8?B?UkcyUXpIMC9idmZOMXdTbGg4dkcxb092dFRtZkpJS3E4Z1Zod0s2Zko5V0tt?=
 =?utf-8?B?ZHpBREdEQzJad0s3NlF4dk1MSlpRbEUySG5ubFZTdzYvbERuSkN0USt0akwy?=
 =?utf-8?B?WVhHUXUvU2Y4aHRyUTNTQ3RYLzRuVDJlZGs0Z016eDB3emk5aFRJbDg1Z0h4?=
 =?utf-8?B?NE5oVFl2TldjZnBLUm5xSlpIUThMcjF1NE0xbm9vcy8xbTlLcVRUYWpjeHNo?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b65389e6-6983-4597-4ad8-08dc7ec9749f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 03:51:29.3947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yck/4heNOuXaLIE9BUgR9qm30MnMH6iypylJZ5fPISg3vcdOry/oaVEbBg5FGel6/IB/ZpVd2uXbfcoDebgGp7EXXgyQJleniEVSFB+nZtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
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


On 27-05-2024 06:47 pm, Juha-Pekka Heikkila wrote:
> Reading from Xe device framebuffers is slow hence mark is as such.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_fb.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5df5cb08f..26d6957f8 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -4401,7 +4401,8 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
>   		setup_linear_mapping(&blit->base);
>   
>   		/* speed things up by working from a copy in system memory */
> -		cvt.src.slow_reads = is_i915_device(fd) && !gem_has_mappable_ggtt(fd);
> +		cvt.src.slow_reads = (is_i915_device(fd) && !gem_has_mappable_ggtt(fd)) ||
> +			is_xe_device(fd);
>   	} else {
>   		blit->base.linear.fb = *fb;
>   		blit->base.linear.fb.gem_handle = 0;
> @@ -4409,7 +4410,7 @@ static void create_cairo_surface__convert(int fd, struct igt_fb *fb)
>   		igt_assert(blit->base.linear.map);
>   
>   		/* reading via gtt mmap is slow */
> -		cvt.src.slow_reads = is_i915_device(fd);
> +		cvt.src.slow_reads = is_intel_device(fd);
>   	}
>   
>   	cvt.dst.ptr = blit->shadow_ptr;
