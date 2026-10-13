Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3040CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 18:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D80010E985;
	Tue, 13 Oct 2026 18:54:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657E610E985
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917631; x=1823453631;
 h=from:to:subject:in-reply-to:references:date:message-id:
 content-transfer-encoding:mime-version;
 bh=tezzHli7KEJeNUii2yyy9E+uQievRaa284a00hcDsbg=;
 b=gtKLyofR/3iN23t8IghJZjeACwU/dvlkPjH9HP68e56BPhky4hR9j6Rg
 AmbpLOcH+TceS8tggnXqGjphTpuslf482w3JqD+slj+88iGcjhJzaMiiJ
 z1yOvOClZh5Y/3xi6SPtW55/P/wgMZH1RcfQgTAu/3i8fJ7hCs4rv6nbu
 tCEeBUUcONoFgEid6bhE3Y0C4f1La9Jx3FD2gYoxPcZRT6Nu6BUhdhwul
 35iHuk6Fw/IfvA+e0+vLnVRSbLwB/HApnNDXs0eZiHngYCTj+68VMgBvu
 GqtFodf+TUwxD+fAZylVXr1lqiPQg6UifPB5rre0USv1ceuEaLsJuUx0o w==;
X-CSE-ConnectionGUID: Rd6fjOQyTo69KL9qi5XZlw==
X-CSE-MsgGUID: oyoTcwKVScm8rtwdvbs6LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="542293"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="542293"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:53:51 -0700
X-CSE-ConnectionGUID: jG1UX/RmTsqsZK9cqi2q8w==
X-CSE-MsgGUID: D0OweydGTSqU/m/hPzirJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3076178"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:53:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:53:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:53:46 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:53:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcYlWXpQm9auIXextLwPoKGBRar+m9bVeZ8yFUWS0GLJWXHC+WRzB8nPrAIWQ1agbVJmvOXpteOu4jYpjyuai58tqgP/9UC2jZ+gwFrBefEh7+YwkyTZmiW/q4NNS90NB6GmNCv/rxlRILo/uPziCQDxN9zO4QCTnDZTfnKyeGFc4BpoxccyClJTOj8f+1Uwot++KPgE+wJEPHPqIJjcVH/0P0TNYEO5VbkwPHAfXKL29GNSwdGsF+LEqUaUxEGRE8Blr3VMHDqYPQljokHHUzaDP98j3iDWmUqemdSdh1XXfD5NlrP/zRTr9lWD3w+r9XQx1jdgWWX5lm/c3dYnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9IUa9ApGlylvBogwpeMtuqCJ+mIQPaszX88hzewH24=;
 b=F+cfDPvNptlIZhb7mOcp4SpQtYWsqvO1kGGE8hgU6EmIZwQ0FQo6UVpcjLITnKA/NKv1T1YGDpF6gcDnWKE4RC9ybby/a62Ye/HBNYV3dWouL48TGkwlKvxR1iIZmRCrNuJxH9XqiIcrsOaJgfvtLW/faflJHaXn0rEWYRYZ0/YgQonQUvH7OJHCj0X+/nnJX11odDq/D+Icu3Z1fUmX6NwXDdJZL1DBRSEkLmXM8Z7rSt+M94d9R/yn+tGDc0pKuZk7Wfksw0eL7LBawtQsqTHH2gtPUeM5BN+AL40s81h+1z5FQubuvbbV6Qz84/pUtkSMztQugA2xVQ24UVr0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SN7PR11MB7708.namprd11.prod.outlook.com (2603:10b6:806:352::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:53:44 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 18:53:44 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Daniel Charles <daniel.charles@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t,1/2] lib/igt_core: Check if helper proc was alive before
 kill()
In-Reply-To: <1f2844aa-cb5c-4c77-bfbf-a8e473698ea5@intel.com>
References: <20261007-stop-pw-reserve-v1-1-abbd3b879612@intel.com>
 <583c175f-9c84-4069-93f9-ec1a76cafd67@intel.com>
 <87o6cxa3ig.fsf@intel.com>
 <1f2844aa-cb5c-4c77-bfbf-a8e473698ea5@intel.com>
Date: Tue, 13 Oct 2026 15:53:38 -0300
Message-ID: <87h5ipa0ul.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SN7PR11MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de1603e-f48f-4b3a-23c3-08df295b4e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|261009223027099003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: u17gXE++l7NURtfgDs7koHcy8cuaIu9rlB2uyTaWy6fTKpByafUg7mvZfCghvn70ApmlgIXhMKg96nQwIX5hPKuN7UOzeYzm3i83g7KGaOW63y3uc/9h/xheOGOo0yP+bjl/Qlt5AFxywD3rzAlg3LnHq7lAu1TI9tGGaciICftYsFbHi7Wu7huUU564fKGr0ebG01wz4eUPIxoGwmvBPe3tE+DEgs4zkh/Iui+sAf4mVRQzin8KTYi789wfLHPNwHsjAxz4wPW/81eeKGN1AKvTqBLp76iLXyebdnpChnlMH7zUytfeVdDoLGVU9jw9Xgr6FYP+I/m3xnxMdrzyzRVwQcRXoa03cDIIdJjCpjfHMhNiZYTxaDIfR/zqJ7odwZTI8PXaR3MUbGNPyU65Ix5v14hR6fUzEF5rrvT9o08wQqAS1S5TaqI75YZLgZgK6eXLMZXLOYXEpgn+SEUbwNatQrC3rXSBh024cwY0/uZ8u4z4hSUxFAZzxbIgOoRHSiHRtMe0bLIWaIuB4BEyFx2YfefEt34t7+wUrQdgzjGCLs8hUuaTYZc6j4f3k8HiY3e1kqkDu6pj1G+nir1RP1QE+dvKD9c7Mtcq7nSY8918xychk3o15kKcO0dLFkntJE63p3RrgCiFs+S+ekzz+Mqouwb95cMBUa6f2WIy/r4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(261009223027099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1RObzlmNjFvUzBmNWFCdXphR1NLVG80UmNrNnRRNWI2cmRWbitZT3JUMVhR?=
 =?utf-8?B?dk5VekpOa0JaSzBQZFdyRWRGMHd6bGFNRUg3NU1oR1VFbVhLZUVtanFiK3JV?=
 =?utf-8?B?TjFTa0tWUmg1QUQ0SVkvMk53Z1ROMDdlSE1jbUpwZUEyVk12bVdnTmNBTFhx?=
 =?utf-8?B?NDFDQ2tIYUdmbm1lUitOdWpRaUxONU42Vk1RdklTUlJWbWt2S05FVlpMVk5F?=
 =?utf-8?B?WG9SVjY3S1UvMlArbUpjRjBaWnJrdmdkNEVlWEpJVjNaaHlMQ2FDZnRyMi9Z?=
 =?utf-8?B?NDQxWTluemIrTFE4SjJkd0Rkc1huWFQ2bDU3L0Y5N0U0UmFkQjhPdzdsQklR?=
 =?utf-8?B?c1JpWGI5WldXbkY3a0RqZVp1bTQrRE5YUlZ5c1FObHE2Y1Jvc3VPWklRNm9j?=
 =?utf-8?B?QzExOTZzWldEUmxFM0tBSGdxR21iT1NwckEweE1hN0ZpanRnbDVZL2lCZFJs?=
 =?utf-8?B?OUp3T0Y4Y3NzL0twUU9JeW5Xbk83QndUaFFXQVhZY1BOTHBqTjdBQXFqT2FH?=
 =?utf-8?B?WXRZR0JRVFJZaTRNdEtYQW5kdHJzZTB4S3B4RlJtcjJ6eW9NMmlQZ002MkNB?=
 =?utf-8?B?TGRnVnB0ZWNtR2hLelRNK2JoaWpwdEhhM0xuM3daaGFOZENVN2kxMXY4UTVX?=
 =?utf-8?B?Mit6Q1RIQmJuaVMvRCtDbklCQ1dwZGpJY3g4NzhXbXhJYjQ5ckNTcmw2SXl6?=
 =?utf-8?B?Qm5yMjR1VmF1WDVzRFlFeisyZUFuSHhWTUZPeVBnVHF3SElqSVpwdXczV1lz?=
 =?utf-8?B?VXpha2U5bzIyVFJnT1crZXZ5SVpBd3BSeTVGTGlHYXpNTFIxZjFudzUvUVd6?=
 =?utf-8?B?anZBSFdyWklPNWtqSENUV0owZHVlMHlUbDI5M0IwVHRrQ2QreTlNOTMyeEJC?=
 =?utf-8?B?UGh3MEJoVkd0NWJ5ZW12U3JPS3ArNjJVVENDYTBSS2c3K0ZBNlhyb2dpb3pG?=
 =?utf-8?B?RG56aTRuMlM3WW5ScWh1MkNBTXNBZHd4ZUNkdXNMa3g0RkRCTEY5SWI2S0ZR?=
 =?utf-8?B?SWZLaG5UQ2VWY2JoUTd5SE5YUHRCOGVKQ29YV1BtRVFnSVVhREFuYUtvZ3l3?=
 =?utf-8?B?UkcvU2ZUTVJPbzFXMHllMHlvVnNieHlkYllTbmxFY1Y4TmpLMXBoYkRrQWU2?=
 =?utf-8?B?ZGZQYlIyT0V1SnIwL1BrajY5Y2dEOEpEaWsvdUEyTlJrOWpMSFpQby9ZeStt?=
 =?utf-8?B?SW4vaFZ6dTNMMkYyRG1JL2VGaEFPV1dPRTVabjV2dE9JeUQ5NFJSWHpaSk1u?=
 =?utf-8?B?NSszdlZMNCtiM1RvNXBML2FaTDMyWFZvNExrV3kvZHpmRXI4bGNCVXpJTFc4?=
 =?utf-8?B?dkgwdlA1YXdSYVhrUXpvMVJYS2lBVXFJT3RxdERFYUpuYTZEVU13UVZBRGV0?=
 =?utf-8?B?WlFOZkJVNzkwZ0h4dmwwYm9HVlJRalhZb1grZ1AvcCtuOWRYK2VHdnhlU2lX?=
 =?utf-8?B?eHhqaFZRSys2R1FyYWpRT1ZDU09HTmljYzA4MWQzTmllUEgyNDJsbWgzMEVq?=
 =?utf-8?B?cTRTVE5EdXp5R3pYaC9lY3I3OWprbW9KVWVTY2dvZG5DeGI5MWkzdzZaNDc1?=
 =?utf-8?B?ZHZRMWZJY0ZjSXBQa2t1UTFZT0F6RTVwQnE0Q1VPNkowREl4M0tUZ1g5dGpS?=
 =?utf-8?B?aFl6ZmQwUDYxNEJYU2YxU213RVo3b0JRUUh3MFkwWW10dFNndzJBdHN6ZUVN?=
 =?utf-8?B?WmdVaGpMc3Q4akE5ODdnNndwbmFaY0VIZmlwOFpyd3RSQUVxWVhrcUh6My9J?=
 =?utf-8?B?bXZyWGNQTHRYWTZ2STArUXFGR3llYTE2cUVaeDdoeGNrZnBxVkc5OGdqUW9p?=
 =?utf-8?B?cWk5cjJuQWlQcEJOUWRHdkdyOEtkaVIwK1pua2cvMVZyYXNwRlQ0S2hTb3JS?=
 =?utf-8?B?cnBUaDQybDhyNUtvRlhyYTE3VjN5TXNjUFJ3RitJTXpsYlBZclpseWdlVkpI?=
 =?utf-8?B?SFJQRWV0U0xPMGZKNlYwUklKaWRHU05pN25LdlYyci9SZFZ4a0lMbUlrd3lW?=
 =?utf-8?B?N09zL3hsZzhKQWp3L3J0b2lOTWV3aHZxNGFydzlaMmZVa0hFdWRIdnZ5aW1n?=
 =?utf-8?B?OHdWQ1h4TmxrOHBtZE5sWkl5U2Rmd09wMHR1Tm91U2RlaEpwd3lpa2pSUXZj?=
 =?utf-8?B?UklrdVZlTmdOemJwaFZjaVFhNFNGeVJXSU5zbFBhN0R0eitBQTlDeWZMYXdK?=
 =?utf-8?B?OEFtQ280SEwrMGVzL0tVNldVS3hKbEF2bjRIbTNjRU9nNEtJMkdXRHQ3ZkFm?=
 =?utf-8?B?UEhxOTFhSXh2S2xKUFpReHNvUUtCOXlLeVovOWJka1A3UUlxNEErNk14OUNJ?=
 =?utf-8?B?YXB5U0NYaVpQVkZSb1I5anQyOExSc0lqcldmTjlGbGNkMWp3THRIQT09?=
X-Exchange-RoutingPolicyChecked: tvmcwuCarNBJ6shXYv2YO0RaYgHToqN2ut1y7JdNGGtNsRJX3tNuIjGXE2BWiC7rk/68CQUYccKGyjZA6H5WWR4678LIBqrVEDURZJJjW/rkNSHTIoa4e0lTYTwTZQOJkQ74bluJExBnZPSU/8gWO49TG+muI6PDawvAfD5xdbMCupw5irSOj8XKEWCemDR6QR2KiVKc1KtBI++NCI9TlnZEf9z0lkRm3TeMI/6leDR5g4ts6i17vtrQx1Ugs3PWAlnXx6Pk7uDuymKTBeOHrslJE/zQr48uVsZ83V6D22k4i+oMU4rSBC351GTSMZ19t5ueqY6N+52nDZo9HjMpxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de1603e-f48f-4b3a-23c3-08df295b4e2b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:53:44.1252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6IQD3z58PnpS+V6iRORzYWP9uHtGY9yfCNc9Hko3FNA9ZuivEb8BnqkO5hq/xt0RpVo+3zWN2IfERkoWXQaKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7708
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

Daniel Charles <daniel.charles@intel.com> writes:

> On 10/13/2026 10:56 AM, Gustavo Sousa wrote:
>> Daniel Charles <daniel.charles@intel.com> writes:
>>
>>> On 10/7/2026 7:16 AM, Gustavo Sousa wrote:
>>>> The function igt_stop_helper() does a sanity check by verifying if the
>>>> helper process died "too early", however it does that by checking if
>>>> it was terminated due to not handling the signal used in the kill()
>>>> call.
>>>>
>>>> That logic has a flaw though: it the helper process gracefully handles
>>>> the signal sent by kill() and exits normally, igt_stop_helper() will
>>>> mistakenly take that as dying too early, because WIFSIGNALED(status)
>>>> will be false.
>>>>
>>>> That's the case with the pw-reserve process: in an upcoming change we
>>>> will change pipewire_reserve_wait() to call it with execlp().  Because
>>>> it handles SIGTERM and exits normally, a warning and assertion failure
>>>> would happen with the current logic.
>>>>
>>>> Fix that by checking if the process was alive before calling kill().
>>>>
>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>> ---
>>>>    lib/igt_core.c | 20 +++++++++-----------
>>>>    1 file changed, 9 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>>>> index 8ee9432923e6..d9949ea131f8 100644
>>>> --- a/lib/igt_core.c
>>>> +++ b/lib/igt_core.c
>>>> @@ -2652,13 +2652,6 @@ int igt_wait_helper(struct igt_helper_process *=
proc)
>>>>    	return status;
>>>>    }
>>>>   =20
>>>> -static bool helper_was_alive(struct igt_helper_process *proc,
>>>> -			     int status)
>>>> -{
>>>> -	return (WIFSIGNALED(status) &&
>>>> -		WTERMSIG(status) =3D=3D (proc->use_SIGKILL ? SIGKILL : SIGTERM));
>>>> -}
>>>> -
>>>>    /**
>>>>     * igt_stop_helper:
>>>>     * @proc: #igt_helper_process structure
>>>> @@ -2670,17 +2663,22 @@ static bool helper_was_alive(struct igt_helper=
_process *proc,
>>>>    void igt_stop_helper(struct igt_helper_process *proc)
>>>>    {
>>>>    	int status;
>>>> +	int ret;
>>>>   =20
>>>>    	if (!proc->running) /* never even started */
>>>>    		return;
>>>>   =20
>>>> +	ret =3D waitpid(proc->pid, &status, WNOHANG);
>>> put waitpid in a do/while loop to catch any EINT return that may need a
>>> retry.
>> Do you mean EINTR? EINTR would happen only if WNOHANG was not passed in
>> options.
> Yes it was a typo=C2=A0 and you're right on WNOHANG according to [1]
>>
>> This call is to check if the child process was still alive by the time
>> we are about to kill it.
>>
>>>> +
>>>> +	if (ret =3D=3D proc->pid)
>>>> +		igt_debug("Helper died too early with status=3D%d\n", status);
>>>> +
>>>>    	/* failure here means the pid is already dead and so waiting is sa=
fe */
>>>>    	kill(proc->pid, proc->use_SIGKILL ? SIGKILL : SIGTERM);
>>>>   =20
>>>> -	status =3D igt_wait_helper(proc);
>>>> -	if (!helper_was_alive(proc, status))
>>>> -		igt_debug("Helper died too early with status=3D%d\n", status);
>>>> -	assert(helper_was_alive(proc, status));
>>>> +	assert(ret =3D=3D 0);
>>> This assert can be moved before kill call to make sure the correct
>>> process is killed.
>> Hm... This function already assumes proc->pid is the correct process to
>> be killed.  The objective of the waitpid() call above is rather to check
>> if the process was still alive (the expected scenario).
>>
>> If we move this assert() to happen before the kill() call, we risk
>> leaking the process, because an assertion failure would keep us from
>> killing the child process.
>
> The process will be already reaped after waitpid if it returns the PID,=20
> then kill may signal a different process that took the same PID.

Hm... Yeah, I can see this edge case where the PID could get re-used
between the waitpid() and kill() call.  Not sure, how easily we would
hit it, but this doesn't make the patch right and I agree we should
avoid trying to kill the process if the waitpid() call tells us the
process is already dead.

>
> So call kill only when ret =3D=3D 0 ? and keep the assert in the current =
place.

I think we should call kill() only if ret !=3D proc->pid, which ensures we
also try to kill() if the waitpid() call fails for unexpected reasons.

--
Gustavo Sousa

>
>
> [1] https://man7.org/linux/man-pages/man2/wait.2.html#ERRORS
>
> --=20
>
> Daniel.
>
>> --
>> Gustavo Sousa
>>
>>> -- Daniel.
>>>
>>>> +
>>>> +	igt_wait_helper(proc);
>>>>    }
>>>>   =20
>>>>    static void children_exit_handler(int sig)
