Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535F7C5CFDB
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 13:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F5010F612;
	Fri, 14 Aug 2026 13:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTzBzSbd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA73910F5DA
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786715934; x=1818251934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WzC9NA6l6opTgRxaPVusSHT6psOgdGKemiBBtefU8xs=;
 b=FTzBzSbdfoHjLAgoulYwcvVsENGFeSXqprMYNOeTq7sLC2oB+TDiXlQ2
 yzG2N6/RUcjgj2cjaPRn7etcuq8nnXYeByd7hozxRItPtdMpld+JtrZ1W
 qC2MpZtFmRSBUnHQ3Ay0cTGGbUTkYpABobrYaWyR/XRBejXoywTm/8Xrk
 dxjj5B+WU15PWyBQLoOgcP4sFlyFLWRL9BLxMZS4cdCDQvcESqvT80z6G
 pJCCOxdTUvhPGXHnepxmWZTwghyoAv6cvQ3A+kuLG+aVNAyLSDT/uSClB
 vCwz6ibnVeMuieIhFoVNWfxqTUcrJxWetXB326KsBHTB2731Wv4s/+q4f w==;
X-CSE-ConnectionGUID: 0tPjKtyiQsK+HFUjJF9RQQ==
X-CSE-MsgGUID: 6zvvL2+QSQuq41cgxnVGpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87423377"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87423377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:58:53 -0700
X-CSE-ConnectionGUID: Mzdnjl1tS5aTuPR/kI7aug==
X-CSE-MsgGUID: duDpdZQ9TvyDysDpo21rqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="287714944"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:58:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:58:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:58:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:58:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGSxLM5nJtEp26rB0F3mxM2Y5iXCC0MqrqkH536JUdyXvqvcx2SGXuOtxVYLPaEg0Plob5qjDfiAkqAx3+yeWAbzcdAec+AONpw81azCrbh/5HcefDuLK1PKcfAAf2A1y9LtamhsBXqPGeg04HH07rIHOzgZ8KRjwMP+ltcG+2a0vnUixrJrEZFQrfEXNnj1LXUTczAE2WfwQi2MAK1UP/p3EU0po/3yR+5LdZVDOUtSwy/zsrW/u3yyTLj1dAmIDPp/UVpvnvHvZhhWuWaWW41x64OIrtStZ+2LdcnM2Gh2G/yzrmye4ikrHg6MJqbgXY3Dqtf/DRTGThRbbXjTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipxYpFO90Ntq+szurksEI34oxqnMsMNjcIxlkaUd/ao=;
 b=J3L3GcbVYiX+kguq1Yz6hn03B263AgqUu0IQYMp+/j/StbKEWtD9jQKB4R8VK6a/OtVBNmoG9mjj5eROZPmdxgvFrEhnxQKinolwSrGM/jnk/zXFySCPVByQAFuAy74oyGUW/j/q9zHczd2JGvShjmoeE5EZkUptswj1eRZ1VYjgva6UWtmJiXRla5OIl/2rsxJcRRt/wHh1p1cD59uWVFNr2dBYQ+CzoJ6bThhTCyzsQ3g+Aq0d08UeDVT59VSZEO/VdzUq2fGXRkAnSjTNa5hrydrEkf+ZzO2KDAZ2gvlNULk7nIIs1t696wY5Dxl3VS49X4Tep5EFe812gQaDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA2PR11MB4859.namprd11.prod.outlook.com (2603:10b6:806:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 13:58:50 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:58:50 +0000
Message-ID: <8fe92398-5835-4493-8679-c673b0277e60@intel.com>
Date: Fri, 14 Aug 2026 19:28:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [5/8] tests/intel/xe_err_injection: Add GT UC Unicast GAM Walker
 Command Parity Error Injection
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260729121959.603890-6-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260729121959.603890-6-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0299.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::11) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA2PR11MB4859:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fe55ff-84cc-4634-b55d-08defa0c2ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: jMltxVafe3yJnBHdmowA79PMckJA0sT5W0fefstFWP4PzlkS1GltB6nmlZdr81m/FpxqsEGo8RceddmZqTVuwxpOTaMKyhr6CDxia1WeUsYtGbFvzlfaRSyMtCO6JHRHNM47TOV6ic9PuqRrkxemRW5CbFA4QLnuN0ujk79/rdKkCeUh12Yyn4BPiT+fVJmhSH9uztjp1orl7aXxxTpdjFLRFqsl7pCDwvG31DpDPPKYWJzMa5r+CFLAR6Kt9UrH3Z321TrJU9lHS6YlPcyN2H0aQBiiEMgu9wM6fHojy6XHqmDbNtxxVTJLQhjNjbx9ywU6pHdEVhfYHrWecl4A8LT/6gSxaVpYSQBFwhTNLydT/rfGS+oTMiBMQSJhaGJwU5K29RxeD8msrxVqL0j6iwJ/2e93DGKtnmdLqsL8r5PGv7sHtsf70ceFmfXYGMqhbWKtDgWF9cfxdxzK9WKM2dT9wo7GVa9ZoyVeNQMTRQtami/I9BTxOXXjZ78kNN7hdORSyYNr10q+ggoVYcT50NGMJzoIjlamTvysSRitAroswlbs0LQxRyi1sgodWMqY6j/m0l2cGP7wCoDB3tBRsm1TZXgi7FyCikOKTvAQ/U9W8JlPZHjzPBe9HqmjQ5fMD5SYWc5GoMUhm4F7mtGsCQmVQTLH7Y31qXGL20nIqf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHJrSnZyMVRVVUw2aHFCcnRoMkZDRmxabURiTi9pd0loc1dDL1F3aXM4R0dj?=
 =?utf-8?B?UTFkWmt1RHNMYzVOZEVYYzZIZFYxeEV6Y2pyeUlUdkhLRFpNYktZc1UyQkJN?=
 =?utf-8?B?YUw1Uk1nWWlBNGVMM3I1eDUrMEtyYVFMMzBuS0dNUmhmZlJXV2Nwc3krN2F4?=
 =?utf-8?B?TGdQTWJuZGp5STZzaFlWRm1FandBdkRwSFNqMWxObTh6bmczQXJrTGpEUWQ4?=
 =?utf-8?B?eWVyTG5obWg4cGdGUVJoWGVVb2FXUEhWakVjVXFRUVRxT3ZLUTRxTXZiYW9w?=
 =?utf-8?B?UGVjUTZiMXJaWitqVmJrcGYzM3ROa0orUlNGOVdzbUpmd094ZG1GWUNCTnZy?=
 =?utf-8?B?OFlHUURFTFhvYW55WU5od0xSOHhhM3A4ejVjRzNvczhUR0xENG1oc1I5RGhI?=
 =?utf-8?B?cWtTbld4eEFvVlBQQXltQlNZVjl4UFhjbTZUYXZxZHZ5UjFRVCtRUnFoVElr?=
 =?utf-8?B?UGFVZ2dtWlRaWElNakY3VEJ3bk1HZEhoenNLM1k2cjZDYzJLUFgzeGFESVpu?=
 =?utf-8?B?eVV4dTVtV1RacEhVZTRhbjFHM0E0RHk4bGJHZ2RsSFRsampCOUdMc24yUldR?=
 =?utf-8?B?Ym9icEk5UlBCSzRod0o1R3Zib3NFcURlQ2JYMXdYV0tCRklKQjIwdWticm00?=
 =?utf-8?B?ZEFSMEdZNmU5YnJVY2JCMFVPME5TQ2V2cytNZFRkQ0UyV2ozWHZqRFd4T3Rl?=
 =?utf-8?B?bjdjRVpjVTB4TUlSTnoweExMeUtzQkIrTkY2aEF2NlNuYk9ydENpcmRJUzJG?=
 =?utf-8?B?MlBpdXlxak1obmI5YlFDRE1EYnluSDBXU2NEcUNXUTJlNk1vbnhHQWNuYk5R?=
 =?utf-8?B?VFA5VXo3Y1JwWjZJNm1UVzczZ3hxS21IVnQyS09GNFVGcU5hUjZ1aWF2SXoz?=
 =?utf-8?B?NFI1Q2ZyVlNlb2M4OW44U1hXY2U1MVJoUWVLV3lTVzZjS01rNmdIc3BVZ2Qx?=
 =?utf-8?B?NjFrRXhTM1FXRXVXRk1RSFcweWhuZEE5bU5uSFkvRjZ5SzNoOE9QbnF3bldo?=
 =?utf-8?B?RDdNclVKdXdoamhqS2EwRGgvS2kzWWZ3eUw2bE9laW5nNU91L1V3QXBLSUlG?=
 =?utf-8?B?ekZENlAwc054aTZ2cCtXdEtNTjhJY3QwMmhWL25wSWoyWlJGZG8ySkFMNmdB?=
 =?utf-8?B?NmdGbjh6ajZaUlNLTXhoMFczbFFTUUNFVGlzSVdwMFo4am13N0h0UmN1ZzlV?=
 =?utf-8?B?MjJ1UTkrRFl3bUVIenlvcjMrK3VlQUZ5UWhvbTUrVHF0d2tvRWxicmQyaElo?=
 =?utf-8?B?VklqVlZ5eUZKOFdNdEI0bUhZN2RyWUQwc2hocyttR3U2eEpZT3JNQ3ZmMWNE?=
 =?utf-8?B?TnAxMVVOd0lxOElPd0VKajU0ZTZzZW5CNVBaanZwMlBOOWdXWVBURHgrRkZz?=
 =?utf-8?B?ZGlPWWlNMWE0K05Sek5jU3d2UTNJZEZWNEFwS2Fnbmprbk1GL1F3VjUydEdx?=
 =?utf-8?B?MFhIUU9ZcHVMU09VWktvcC9nYmxJdks1UWgrNWtKaTBvSmFPd3VsaXIweHpD?=
 =?utf-8?B?VVh2a1loZEZ2U29PVGN6Y2g2dHZ0ckJ4KzRIa3lFRXRMbklzWkZKQ2ZTYXNQ?=
 =?utf-8?B?T1hmQVpUbFZyQS9WVHZKSEtEK21qdEZUWTBkTFAreWJSejhKVDlJTnoxd1NT?=
 =?utf-8?B?S0lqQWlCSHBjN3liN2J4bDNwL2pHSk4xVXZtdThjK29LNGJZWDJRM3k3QmlF?=
 =?utf-8?B?MmVjVkc3VXFYM2pFdUJNQVQzaXNUblplMzZTRWozV1lxRWM0bDRwSVIzdFpM?=
 =?utf-8?B?ZWlsSEtTSFJUV2V2ZVg1UDdVQXpMNnBCZkhVemhpWk11ZW9SMksvblNWOWxs?=
 =?utf-8?B?NXEwd29PMkVYRC92UUF2QU1BNXY4NlBqN2dQcVFyZTIzOUNTSHJ5Z3VacmM5?=
 =?utf-8?B?aklpZnd2dVMyUzd1TlhkdUdHeU9udTZEMXlJUjVXRkMzNk1SZjl4T3hWOTdC?=
 =?utf-8?B?d0o4UGViQUNRamkwajFqeXhZU29qSHB2SmkrZGx4NWhFNjRqcmQ0ZjNJc3RR?=
 =?utf-8?B?NS8wMzNkSEJIT3BZWnl5QkVDQjRhUHVKdUY2VGZ6OTF3S3ZQb0pBS2E2dmIz?=
 =?utf-8?B?Zmh0V0h6TmVDb2pPSUdoeDdkZ0Frd2J0dU9WUWRHbjQ1c3dSVWcwc2VzRjgx?=
 =?utf-8?B?eStMazZveEV4K0gzZ2l4OUovMkx5RmszbUxZQlF2L2ZIR1FJYk5GREFzeURy?=
 =?utf-8?B?MjBnbGVCTVpIYjgzWTltVkk2cWc5UklXdW1qcUxqSEpQTGxxVVNRaFEyY1pC?=
 =?utf-8?B?aFcwVnpSTE9DRlAyQkdPbDIzand0ejJmSUVsVU1na2I4NnYvZjJZd01WT1J5?=
 =?utf-8?B?bGlTK0VOM1BwTkkwTmpqRUR2UjhSNnlsRUE1czNpbkxaMll5alRZOWE1elJy?=
 =?utf-8?Q?U1d4BR3Vzu1SY1VE=3D?=
X-Exchange-RoutingPolicyChecked: dnDLs1MHcn3sdcU6+vyeeZJcnWgaDROf+8KEubjk1TRe3o/I3ImUaZWpKKKb7SSUqjfxDDIIO2fXwoqDzm5/0RGT1mVUfcgyGCRbwlzICzy8rGyVgsoRbYfegINcliKKJbp1z/u618CZzeUtCEr/XdoAbkXuTfQ0ZDD73ytfEQYRLVmPRhjybgwqoog/D/Ls4TVcJza8YUvrjUw98Bq1hp5lsZiUQwwQwZbbmjir8YAbB67KefPMTFYmZJJ+F0gozXg3tSMiKWaH/jrfurz6XMbE/VUwhx4HK+2JZgeETxFNda0PrU/VXGw+7+ejeVM0or7UEnoRLG16CP3Q+M74BA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fe55ff-84cc-4634-b55d-08defa0c2ab8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:58:49.8951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3U7A6RWnttL+Q5wVd42LATHCgRzMbhRvgie6v5EiLH6+9C6HHm+ERNXbnuUYtrdzXzT7wi3BofaE5D+fJSC/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4859
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

Hi Ravi,

On 29-07-2026 17:49, Ravi Kishore Koppuravuri wrote:
> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
> injection to verify the Xe driver error handling and recovery flows with
> the help of DRM Netlink API suite
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   tests/intel/xe_err_injection.c | 313 +++++++++++++++++++++++++++++++++
>   tests/intel/xe_err_injection.h |  18 ++
>   tests/meson.build              |   1 +
>   3 files changed, 332 insertions(+)
>   create mode 100644 tests/intel/xe_err_injection.c
>   create mode 100644 tests/intel/xe_err_injection.h
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> new file mode 100644
> index 000000000..afbaf0646
> --- /dev/null
> +++ b/tests/intel/xe_err_injection.c
> @@ -0,0 +1,313 @@
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
> +	RECOVERY_FAILED = 2,
> +	RECOVERY_TIMEOUT = 3,
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
> +	ret = init_nl_socket(&ctx);
> +	if (ret < 0) {
> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
> +		return error_value;
> +	}
> +
> +	ctx.node_id = node_id;
> +	ctx.error_id = error_id;
> +
> +	ret = get_error_counter(&ctx);
> +	if (ret < 0) {
> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
> +	} else {
> +		error_value = ctx.error_value;
> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
> +			 ctx.node_id, ctx.error_id, ctx.error_value);
> +	}
> +
> +	cleanup_nl_socket(&ctx);
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
> +		igt_info("Injection status SET: %s\n", err_name);
> +	else
> +		igt_info("Injection status NOT SET: %s\n", err_name);
> +}
> +
> +static bool gt_uc_wkr_parity_recovered;
> +
> +/**
> + * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err
> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
> + * Functionality: error injection
> + */
> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
> +{
> +	int fw_handle;
> +	uint32_t error_counter_before_inj;
> +	uint32_t error_counter_after_inj;
> +	uint32_t node_id = 1;
> +	uint32_t error_id = 1;
Why this magic number ?

soham
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
> +	if (strcmp(injection, "GT-UC-unicast-wkr-cmd-parity-err") == 0)
> +		wkr_cmd_parity_err_injection(mmio, fd);
> +	else
> +		igt_info("Invalid Error Injection specified\n");
> +}
> +
> +/**
> + * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
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
> +	igt_subtest("GT-UC-unicast-wkr-cmd-parity-err")
> +		inject_error("GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
> +
> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
> +	igt_subtest("GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
> +		igt_require_f(gt_uc_wkr_parity_recovered,
> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
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
