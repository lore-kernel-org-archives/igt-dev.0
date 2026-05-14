Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62092CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 06:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1824310E367;
	Thu, 14 May 2026 06:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPxIVlka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B210E367
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 06:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778739196; x=1810275196;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P+STf3uPKSgg+EvWe8DSGazEzOx8UMFRNeYsOygyqww=;
 b=DPxIVlkaBG/pajtTFF9e7xj+Z+6Ly20pUBdDhASN20EzG7cloQkPwx41
 yAY91ZWM9PE8q+7pFpkTGSoF/18IX8esfNAiSr0uOrIx/QeWqOEaXCuuX
 bn8Rl6k3vZwVFc/2O89JScWUm8Wgm0WjehoxVkxUwb2dAQPLNf/hk2r0m
 nOjFwuotGg08KWF1g0cfC1sApxv7X1OxkQmZMJDX5IuHl3aq2XsZ57Mru
 3zq3mG+PeUMgzECa0LYPw2I73BgWWEI0ndcYkOdJSXOpN8qexD5cxW+IV
 rcwhxfShjnQeTsiFzrrKikg3k1h2qlCrLvI+5HCssDWtNgg3nW0eY6+37 w==;
X-CSE-ConnectionGUID: m3I15lanS4OiArH2IRsUVw==
X-CSE-MsgGUID: +LCsO65oR2Sefvtrc45czQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67204558"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="67204558"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:13:15 -0700
X-CSE-ConnectionGUID: Wl+r3KpfSu6JsMH+YK0N6Q==
X-CSE-MsgGUID: TOsVSSHrTkG5M/9iQRsreg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="240136724"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 23:13:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 23:13:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 23:13:14 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 23:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAfCPPGtQOc42gQu5oFxGdIXfGw396v3bE3Q9s4k7efQBH4ADDwOTExx+8V+/TeD5stN4FAO5YJsHIyZPBk4OvtdtDi2UHT/Bh3vaD15nakiMQUX2fZZYf4s/kAiNPsuTEGrETJRK5REu7bztAKLhe/RbMGebdzqVGmCeS70quNKl5/fnv0nxtsEo8Vo0PBrIrhrM95DLAiIxbP28X2RK6awQtjKuPh5nQ5JDmkbfLKs1uqW6Xgo31baWF23de8GE/pjhtY+1YyKOSmfq+MJ1+q1uYTDEX/0wilF3k8Vp4v9jZyKmCAGiA7mMKuVFAPrm+LdgapL295t6n3ZC1oO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXabqfwC02xtgg3GYYyPERPtxViv3get7gi3mVPq+Jk=;
 b=Cn830ye9mJBMa936Pvx8PCmOrmi8CpZEWuTVI+atgebBgMmVzw/j/aznggs30sud3lMOUTAXFG0FtYMegyUR0KEn/n2dzmNz2ndnPSjBeOfrQnw1ntpxGBBTsh+/s1YYsT+BFwz+DuhIP4jeZ4GlpKYl39m6SAQMPrUBa6N8R+MM+ocpZvDipqHVAaSdA26w03s8U87hKB4kg41vY6mQe+EwFq6RBpXenPr0OYiVavGBfh9lYeLy3QV+5UJVrh3CjjeQPk/jGrJ4abxrkHs4QzdD7l/RRvoZd+Sddh3UvDY+XA0s7lY+SoQwaNPqY/Wmm81F/PQoH9Bhj+OyUhtrVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 06:13:06 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 06:13:05 +0000
Message-ID: <76a8a114-392f-414c-b9c8-437f1479f551@intel.com>
Date: Thu, 14 May 2026 11:42:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_explicit_fence: Replace fixed sleep with
 vblank wait
To: Krzysztof Karas <krzysztof.karas@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <pranay.samala@intel.com>, S Sebinraj
 <s.sebinraj@intel.com>
References: <20260511081117.2315474-1-karthik.b.s@intel.com>
 <h5mztj3fvrf3rjiikxq5uzk2xojmpwnbhwcgmzxznhwbpbejgi@hahdvd2v3g7u>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <h5mztj3fvrf3rjiikxq5uzk2xojmpwnbhwcgmzxznhwbpbejgi@hahdvd2v3g7u>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb46f7c-6c30-4c37-7331-08deb17fdca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|42112799006|4143699003|56012099003|11063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PxIyxuElXv367lfchG0vhw1F7eGMx3pWz5+7xJaedeCvgy3AVhItlYPrbizZ/OLrXr7kOpsZWqI5mUt9GS93XovZLhHzE7P/L7v0tqBCVC2417lyEh8R4tQ9LY5LiTh0vMf9q0inpRkgn71Xi5u3wc1aFbvPHfw0SZzALinps0CDP/1qRjdUq6yordhQCrMYBrix0bYkxiMv7+dbfTeGvk7NW4F+Ia52fxsvJUH5RKhT7+gwPLP6qiE5+eEAZ1Dj8kcJCCZ30/XU2DHl2Rr+OtDdeJgDwkdhcJwNrEr1H7ZWV1rhb8d91K6ojArLiJ1F+EJJVepHwLRu/MKc6mxl8JJqibjtafPQXIL+pd5gps8oa3gZoTx+W/j1dT9oPCnr9YPMPt89Z/RI5Y3JBGZodNcK8CKCh4NUJ/+D6e26op6jmlWKAWEPNzgAhKezRuRObQzh1IbcW9wYUP2csEpUBk1uIiO8/Iedjd1ROrSq/4jcPyCAWT5DBIFNSsZOqZMIuQOTe+jrN0xshdrtMTxDPF7ukBe8A5YKuNsMS+H6dgwXqca5ekVQ4mtaMum7sCoICVXdg7IuXxz47DWhVC29tMhys+M/r93vdpclVPskzEe1jf4oeZWQbxXJ2CKPRctpIlLKPopw8W2vA3WGKwBtbHmYXtjkMD8DafKVUnWyUAjftq69ad60CdJDAlhgJIhh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(4143699003)(56012099003)(11063799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXQ2bjZWYmd3UXJqOEZva3laR1VicTdCTi9LODFhMGYwYlVUcWcvSitSbGJC?=
 =?utf-8?B?YXdpM2cweUN0Z0pLajY3c1Q4NTRtbHV4R2JBWUFvWXdMNm02TG0yOVpFRWpp?=
 =?utf-8?B?OWFudVFEd0d5Rzh2UVByZGhuWFBVMkdINXhmM1A1MFRxYWhHdkVIZUVveGwr?=
 =?utf-8?B?cmI5VWtKZGtMTkp6Sy9XdjluR0pNS0tzTHBOM1dzOHlER2hZUFVwZDkzTnk3?=
 =?utf-8?B?VU5ZQ0F6Y0RBck1Xb1BPVm9sMStWdmtER1oyRGNsUklLaFdXRzUrV1FYTTc3?=
 =?utf-8?B?Q0tnN1NweVMwY0hNNDNFM09SbndQbjhQSnpYNXMzTXFBYW51cTJIbHArSGFD?=
 =?utf-8?B?N08zbEUrODFZUW41SVYxV1lnSWpPQm5jekRyOFVXN2pRSi9CTEpmN2JGSWsy?=
 =?utf-8?B?b3JmSnF6OFRjNXI5bFBCY0sxOEhDdVpXNjV1b0JFazRucExiSXV1WlZQYW41?=
 =?utf-8?B?UllVc0hMOXB6NDl3QTdHNTdlRkhIUmJYbnJMeUFNQjgwTGNvRjdmNlhONE1i?=
 =?utf-8?B?K0E5ZEhSRUJhS3dia0RPTHAwakw1bkR1S2hoWU1FQWlwMm0xWVlzdjg4WWRB?=
 =?utf-8?B?VnlRU05YU3JqdjRnWnZoN2VIMVRXaGdvb2hRWTBZRG1RczRvUy9HdkdjMkxp?=
 =?utf-8?B?cmVWYjBoVkwrNFN1WXF5dDVONit5M2dlVHRzZXlKZ1V0b1VFS1M5WnN4d2FT?=
 =?utf-8?B?OWlicTBtV0RLNWliQ0V2UW9XQ3ZiZENmT2R2NmRBYStQeU5DajEwR3hLNThp?=
 =?utf-8?B?Y09wQi9jdXRWaDNCMVdKZUdsTjR1Tzc0QmIxV25RcG55Mk0yalhFSzg4Qjhw?=
 =?utf-8?B?a3ZFVlp4cWhiZE4yRlFaRXRKR2h5ZVdITmtzcHdoL25WUUtic3I0RTVHVkV3?=
 =?utf-8?B?TEtwWnhKRTJKUldhV3RDYkRZRURBcTlmcjRaMlo0TFlCcCtnaHVLcjhNbm0v?=
 =?utf-8?B?VnFCUDdtWm9namhYdG02Q01EQ0dNWXV0THZ6M2F3WENmb1h6ZTA2Mkwrdlkx?=
 =?utf-8?B?TEppZjBSV0ZHa2RPMmlnRGw3ZzkzMFdjUzRodTdYcHhDdGdPdUhBU1N2eG9S?=
 =?utf-8?B?VjdZWDhaRFQ3Zys4RVBvbG1VZXpkT0RIVmhsL1NOWTJWdGswdzJLaURLcXBC?=
 =?utf-8?B?SFgxY0Z3a0g5VnBJWHdHNUlraWZ4Rk12eGJCcWJzUlpmZjJGSmhLUHo2S0pB?=
 =?utf-8?B?WG9LWkRlUmxkZmJubzBqcXdhaFZibWVzcmRZRXlHZ1lZOGZCMUpCRkRManl1?=
 =?utf-8?B?YnlIMG9QRzNyMzVBeElJSWpRTnZZbFBZdm9WVFJvbUJhbEEzdzFkcE1FeXhP?=
 =?utf-8?B?ZWFNTjdzeHY0VXd0QjMvMWdXcktOQXdYK2lxQk1YMFB6VDdBM24zMUJwOFBv?=
 =?utf-8?B?OGM0Q2poZXZOZ0lZRnJNVlNhZkxHRzh0c090UjFQUkpIWWp0bjZDV1hzVitv?=
 =?utf-8?B?eE1OY0ttbXBNUGc1cHBER3puK0x2RVFSd0NnUkpxbXI5eEFsRXd3MXUzQy96?=
 =?utf-8?B?cGtqYktMcUJlT2JQR0QvR0R6ejIwU2laWW9ZcjJmay9GMUNmY3RPMjltVkhv?=
 =?utf-8?B?Q2g2WVB5cnB6eVdMYWl6MURRMnY2cGMrclRWWUVESGVuZmxWSnFYUmttYjU1?=
 =?utf-8?B?ZTRwUVVHcEhTTlVhRW5ieWp2WUdSRndmUzlXOFlTOUoyQ21JVTFIN2xaNjh6?=
 =?utf-8?B?YUQvTG1rVkg0YS9GaTh0YkprS1BuNUZzZ1ZyWFhZcThMZWgyR0pTVzdmTFN2?=
 =?utf-8?B?cWgzOWxpQmtKNWtxeFRuTXdFVkhBSWhzSEhidk05dVUvZmdKNDBaVGw2SE15?=
 =?utf-8?B?WThIZktJMVQvK3AxQmt1a1cxRy9UV2lBWnFJMUVCcmhmZTdhWlM1Z1dwcWE0?=
 =?utf-8?B?TytWdEdqV241Y01FbXBPLzQwSFpVSzJZai83YnlqaGtJenZuTXJoWDdTM1hB?=
 =?utf-8?B?MHprT3ZWUk5uRm5veE1Cc3pGUEwyWlBOaGZoK0hCYXNRZGgyUnZqTHdid0I5?=
 =?utf-8?B?ZGIxZ1YwbTIyMW9FMGFzWmNEc0lBMUxoNTgyQWxwNzV6aUdlcDNaMks2aFhr?=
 =?utf-8?B?ZmZRbElCMWVXQ09ubE1CelZMRWVaVGlXbm00Uml5OVp6bm9DRDhHVDdHVkNa?=
 =?utf-8?B?M3o5WVAyQXM5cXhzbi91aXhKVlprMXVxU21QVGsySGRiY01VV3pLQmlJL2dR?=
 =?utf-8?B?WUs2NW45WU8wV0oyOUtxQjZSY053MnI2dVl6dWtxYk5KSlBxQmNoUkZxTGZi?=
 =?utf-8?B?RkdJenhjbDRaSTRCcVBxakNPdGU5TTBLd3ZJdHp5d3Z3MDRvdzFsY3hPSkVF?=
 =?utf-8?B?K0IySmNpR0tRQ2ppbjNQYnBZb2NaNzI3b2NybVV0V1FWd2lsbnNoQT09?=
X-Exchange-RoutingPolicyChecked: DN8PFcO8RTiY+aae3m8ndNTuEW0fpYr7RbDXdMNoXdJRd0q5x0lKq5tsNJbSm3zYYoUsOxIM4/VO1wThvdxrmeTYXK9NzN1Votjm/1DtYCYvMec0I8UBqY+4RekSxwmG3gfcf1Lif07NIIemAyEYCLpIq9EazztpUeB0XPriR38djfoyDbVvIjSXvBDVEs4WILMF3JK274STYZaN550tT3yy7cs00fuqmNIn1Lw34U2IRT7tBZQWwh+VYDaHnAKABVgc/N/kPVUPzFn5P0EResdrgUBu8Ohlsn+U9RwRJZeP+9SUmPRmh98auq5CJf8S/Xink9ZJ1+xJh2B5i/xACw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb46f7c-6c30-4c37-7331-08deb17fdca9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 06:13:05.7806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irYv4YK++nrxc1humPu9zLLef3QK1XLkIsHUiT0ene97h0agFC82S8r9rdLQKT9xzq++EAUCfFzBupMA/cM2JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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

Hi Krzysztof,

On 5/14/2026 11:35 AM, Krzysztof Karas wrote:
> Hi Karthik,
>
>> The premature-update detection window between the NONBLOCK atomic
>> commit and the CRC sample used a fixed 100ms sleep. On
>> high-refresh-rate panels this 100ms wait covers many vblank
>> intervals (~24 at 240 Hz vs ~6 at 60 Hz) and is long enough to let
>> the display engine enter PSR/DC5. A subsequent CRC read then comes
>> back as 0xffffffff (read from a powered-down well), causing the
>> test to fail spuriously on these panels.
>>
>> Replace the fixed sleep with 2-vblank wait:
>>
>>   - It is the minimum wait that guarantees one full vblank boundary
>>     has elapsed past the commit, so a same-vblank-latch bug in the
>>     driver still has a deterministic window to manifest before the
>>     CRC is sampled.
>>   - It scales with the panel refresh rate, keeping the wait short
>>     on high-refresh panels (~8 ms at 240 Hz, ~33 ms at 60 Hz).
>>
>> Cc: S Sebinraj <s.sebinraj@intel.com>
>> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
> How did you find this issue? Should there be a "Closes" tag
> somewhere if that was reported by CI or community?

High refresh rate panel not present on CI execution so no bug on gitlab. 
But able to see it consistently on my local runs on multiple HRR panels.

Thanks and Regards,
Karthik.B.S
>
