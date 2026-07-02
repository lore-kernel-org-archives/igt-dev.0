Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C21BC43327
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 20:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BFD10F371;
	Thu,  2 Jul 2026 20:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNZe4S/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4528C10F371
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783023924; x=1814559924;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zIx6lxZH4krhzUgW73gTvmqZ0rmMpIeFZXTCpjqCxfU=;
 b=KNZe4S/WNfJcvtgn0lNwWohM0g+CzKLHhwHJ8JlssqXeokv/pDknb4vR
 /qC30d+24A0+quy3jykK1F2lGiVq7XVMIQOatuFk7iZS+zIWeR/3xc+B2
 RCfv7PlvF5PdilLsi1QvSLT979JIhSauzkMsSF5PNhzi2687sIgNpVl+q
 vYxOq+9KjhffemhPXmymcuXDtH1X+gxMGYA2uc7yuZiqdCGt26PKzqDdT
 sfGtcYP5oanClq5EK2ueUJ8qtOSMCWTO63acDIAMi1sF/o1RqtsBawZEF
 IkIiuLEOeC6GJTdj+ob0JEa1Grl/CqqjhjIKPJyuRK63ur9WXXyHTob3a A==;
X-CSE-ConnectionGUID: MBczd6nhRCWyFWA+z5kRGA==
X-CSE-MsgGUID: qweuCEdLQM+tf2yyMgygsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94138805"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="94138805"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 13:25:23 -0700
X-CSE-ConnectionGUID: 9UZWt1FJRauQNnLQx9TUqQ==
X-CSE-MsgGUID: eu9oDtGXQnq4nigT6sdWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="249602817"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 13:25:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 13:25:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 13:25:22 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.25)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 13:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBt/OWFZXvXAFQF07LcdWgn5/5GfQt7YCDBylqUdwSVNez1oVA1HrcWSNWCz1tr73c/1gxE+dwnSjeAsRwXWsfiS/M2eaDWTfPPUf3d/fXwvyYQGlP6LERHiThcQB1lAk4rJTCxo4hNiHICIe1gVF4hnxqQyr3XroTT/nG1w1nQP0p0T8u+fMyft5MId5YFu1xIMsR4KYF2Xhf05SC7+c5ri/YkF7UDZtGQSkAh1XIWor/uAXTR3sw4X4PYIpBuoe2zyA8WPiT+iJAw/sMZS98zEU8mzUkO+OasgE+nqQaSXePtSTXOd29L7cliK7MmjUybT1E05XrjKEzBBM89k7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TwhA+8qaFFiRL4m4HFaBB+t6SgkLK8av2bWC4bw/Nc=;
 b=nZymGo1NVhKFuyIxMKwP4ZJpoL7sfjidYu5We4tjcGphjjazrYoQ7MTZ67afruOvC2hkTSmTs/QvxHwTkA/gcOQq0vnvdBn5INjEnc48XYe0gnDF0gj/IbnODkHE1uNu1ztt6WkSH4SVMBQMV9IhYmOFdU7qViixvKh0zzkW0XHdPJD1opMQNLQOsUzbkqJNNSeW+7Nw5w5mEyIxOKqdHtuaJOXIf4elZziwb/0puRAwN8EN7gVsQKx3nDnNpNxxxdPZnN6HPrCqvE0vI2OalT3dx26e68H1EGIw5PR2jlyMyOfO6MIc5uALn4kN3KUH957mOwiyAMteM/+u/4yTow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 20:25:17 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0159.012; Thu, 2 Jul 2026
 20:25:16 +0000
Message-ID: <47c11b32-2db1-4e36-b469-e48c36b4af45@intel.com>
Date: Fri, 3 Jul 2026 01:55:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] tests/kms_vrr: add support for full range refresh
 rate testing
To: Lee Shawn C <shawn.c.lee@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260617064847.860438-1-shawn.c.lee@intel.com>
 <20260617064847.860438-3-shawn.c.lee@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260617064847.860438-3-shawn.c.lee@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0315.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::16) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bbdf0d9-edd3-48cb-f781-08ded8780731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|3023799007|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: zJ8NbmjMO0Z8f7G6MpFxu2T88M7MpZfrcTlk8ScoOINb5hmPJqvhxrw9z9TYVJot/Z6mqLFoT4Wx+mY0HqPBLRNonrZja7Ojvi3QN6QPwj/Q94GDV0kFjHIZvOmjnHoNR3EFOs4jaqKiPy/ITVN0gQ++gnumqExY+H5kjQa0EhF6gv7zff08+OKJxT5A+AkjtYuumtsQ9IToF2hqF7j9CTquRxyVo2Wt/v0j+ldt1yX3snzUo8a3Ea3LgYuVeO1O2xyt3npf9TWb4gSlmhr2uXHz9dHQt/k8SQ1akBBhetYGVfLSL4SAVsFEmCpIJxcXbZWoxu6zTnjzSnBEpr7zT5AsURuPqCcK95WYrShA0EjmFiWAeh9cnNaSG36MhEa9rYbrKBEgXpxTa3sqlgP8hterDlmVUinmmuva1MeQeDndSC7JbD6G9qJutkO20rOMToH6SJ5wN+IY2EEsDrEiixNKpgfoY8s5WKjEDKVC+oiy/WMRH5OyZMsfWTDoTz4pXYCP+yDrqidukyupcLeHar+Yu/oPzoXB8LHEf2PLqO31G0dcIrCgn9eAGBV30UbV4zV6r5Dv0n5VU4NlsmX+2sSd5WiQOCh5EH6d1MfWtmMloueuLKUVqe9M/kuOl878GQgxPUjJZG5OsWWdXm6Dn38Z0SsFWz0XwuLzGUDqDMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(6133799003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1dzNFVEZm02NVJ0N0hMZGQ5Z01Uc1JSTEEzTEJwMThlUC9PSXZjTmpBZW83?=
 =?utf-8?B?ZkNQNFdnWUVKcHpxbU1nN3hhdkdqM0FuVXNYU1d6ZTRzWS9SOXNDNnkxanRx?=
 =?utf-8?B?UGFwUUhmN3QxOFR1MmN2ZEkreVBGYlBtL3FoTFNSZWlNZG1UT2FYQjJJVkpG?=
 =?utf-8?B?UjBVUlRvYU5uTm9oRXpyWU5rdlRxclhQdHI0elpnMFpDQnFyd3pJeS9ibU4z?=
 =?utf-8?B?TmJsRGNZSkdTbWl5TlcvNEFTeHVUbGVuMENIK3ZlNC83dCtCelBPZGpVT2lP?=
 =?utf-8?B?YS80QlNTcnV1TnlzQ3VBemxhTUd2ZFZHWnVwWS91aGxJdWMrWUllVDhWQ0JT?=
 =?utf-8?B?ZVBDdk1LT2hFQ0FFVEZSOVo2UUVrVHJyT25YaWEvb3I4RHZuQXhwVjk3bTk5?=
 =?utf-8?B?elZtL2gwYVU1T2ZDcmV6N1JnRzVvbUkxQytSR3FtQURlUng0eGJhamZsbE9D?=
 =?utf-8?B?amVpZDFkbzdvMEhhY0NPTUo3VWRXYU9NVDVpY3dLWUV0alBRNVM0ZzBJQVJk?=
 =?utf-8?B?aXd5YkE0bno2ZGlsY0l1M2J3dWFUZnVTTWwrVGFOVFVHaXBhQlpvbzhnYUNT?=
 =?utf-8?B?Q0x6dExkSmhnaTc2aEphWjFHVGdDR2E1VXpiV3Ivemx1WXV0Nndad1BvZVlW?=
 =?utf-8?B?Yi9xQ0p1NnVyb1M1TTRQclExemxrbHpsMDRPdUliT3ZKRHJTWFFJaUpuWCtw?=
 =?utf-8?B?U3V6SlVSb1RQNWhiKzV4UkF0N3R5MnVqTmp5dy9FYU5lVGU2TXVCeHBSazQ1?=
 =?utf-8?B?cDF1S1lMKzErNTcwOEsrOG1zVXloSmVaRkJKdjVXYXJhdjFyNmhhYWxsYXVv?=
 =?utf-8?B?RVpUQ2MvdzhCMEpDZldwdjRzakc0d0NXN1pxOUMxQmFrRjZyMnBvT2JuYlNy?=
 =?utf-8?B?WDNobHVYdkZDYTJYanZCUEVjR3F6ZE1OTGQxckU1V0NsL2lvZk84aEJ1R2k4?=
 =?utf-8?B?ZWViUjNNMWlxNGJuczJxbHZGVzhuRS9SUWVndTZHYmVVMkpJdFRCaE5IalQ1?=
 =?utf-8?B?enQxQkxVTUNXaGxzQXNlSGtCRWVad2w4bFF4cVlNVWVtOGhESG9YV21VdjFh?=
 =?utf-8?B?eVk2SzhtSk9vUGQ5MnAraTRjL3Izd1VwZ1V6RlM5VHU4OXUyRk5oelcrZEts?=
 =?utf-8?B?QU1PVGM0Y0pwV291Tm5udzgrUy9YTC9TWFovSTBTQVgxMG11Uy9WZm1JeW9M?=
 =?utf-8?B?aTFHbUsxdmxKMWJqYkNGZEdnU1l0OW9LbXd4OWZ0NHZ5TEhvZGREK05WWGFs?=
 =?utf-8?B?M2x0K3dIM3RYTG03STZ5aFhYQk56NUZDTmQ2NkpBaG4vcVJoUmtIYWFzSVhF?=
 =?utf-8?B?QjZUNVRxMjdISEFMRmptZXZWNFMvZTQyYXMwZ0JjS1NYa05tbjFqbVc2c05Y?=
 =?utf-8?B?QUFQL2NRTHFkUDk1RHRSaDN0ZkliUVpQQUJwYmpXSThMTk5iNERGbEMwY2lM?=
 =?utf-8?B?ZGxrRjRrOEZhOGtCdDZXdjVzNm1xYVlmQ2M5OU16RFRqNDZqcWpXRFdFcENE?=
 =?utf-8?B?TFVRMFpEdXhuTDJOUllncUpMT3NoaVA4Rnh3UW5IQU84VG43a0dFOXIzckxT?=
 =?utf-8?B?MVNpakhJb2ZKVFNTV21IVUJXMnU4MzJJZm5ad2FZYTVFekxkOThxYmsrMk1S?=
 =?utf-8?B?dnA3UjUvQ2lva1hJZ2pEbi8zRk9RRXR1UXhLRUhUWGhZRVVEcVhhby9CZ2oz?=
 =?utf-8?B?Z0NHVWtqMXdhdVdlR0pzMmFObC9aRmNlSER2cWNleCtncmZXclZYaXpQcGFj?=
 =?utf-8?B?VHJxeElVR2MxRzdyeE9wL3F5U1VhVzVPSm5OZVlkS3FyTzRQWTlqb2VvL2ti?=
 =?utf-8?B?V1JaR0wrM242cUdpZVlYeDJKTDNTNGg2dEd3TGdHWXZPVkZabmhaSTRhbnJr?=
 =?utf-8?B?bVdwbndYTCtOKzJrcG1lSHM2b3EvRU9uSVVuMXFTVUc4alZUQWpLMCtIa1ky?=
 =?utf-8?B?UkUxWVJsejJWRmJJNEtoQ21mOUJiYllyM1dOd1p0TEdtM3lpOG9ZeStpUlNw?=
 =?utf-8?B?QjJJU1QzUkxZczFVYm5FY0k2Uy9GcmN0UlZheStaQkU2ZTdNbUNRN1FyMm1J?=
 =?utf-8?B?eUhGeng0N1dYcVkrSEIzSXJSWHl1dlVKZFJzVGYrZ3JmTHhLOWx2VlV5NnhS?=
 =?utf-8?B?K0REcDVMbGhKa3IrL3lWUG10RGJEWDZuR1dNK1VjODdnaFJLbnBkelJiQW9k?=
 =?utf-8?B?U1FYL3hsRlBpbStHOG4vT2RZQm03UGVaZUw4K0l2dVRPNFhqay9QNDdOdzRp?=
 =?utf-8?B?VG5WdTVMYlg5cXBkZFJNb3hLb2lDK2EzTTliRWpRMTNMUUZlcGoxMjFBaC8z?=
 =?utf-8?B?MVl4cFFsYzBaeWV4UHU3SzRJRVBRZnVPeU1MWTMvaVJUWTZNOFFndU9HNTc0?=
 =?utf-8?Q?JPVOyE7eHwdbHAPE=3D?=
X-Exchange-RoutingPolicyChecked: kYK9aw1IXbwc1YxiXjlY6bF6/XBpkuw/3Bf332xgnf7/dsgCvFuO4brKttwuy++c393nEdMa22VXeCThzdF+dhlufR7N7cF/IUEpbXRqmrLaIS0IrzUPFkPGeVVZpCw6mO/QEWM9Pv3QhqSdakATcUKlL/3vRTHoxxqeusHh7xgC8OW70UHvLThPp3tvmUMGvM/yMSV3Zm7nDAzPNzOCu4La7d0zUXnAymy4XieR8Ib+mkAoHm9vlW9oFTvHfAMFo/RMwgh/zl51jX+v1DQF/wzYQpBeeafX76b7ZxGPjEgIfmLEX3k08uaWIEpjqiBiEM+TFT8DZLkdnCPLYRBJyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbdf0d9-edd3-48cb-f781-08ded8780731
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 20:25:16.5435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFG9FAw+DeUwC18Ji/V0u0pF5BY/OuhBP7Ei/YGKNzYaDdV+NDRL6ebdbfLEhK1sKQwzz+dYrtZMrvQWLivJk1qLrs/49BLu41nn119JwNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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

Hi Shawn,

On 6/17/2026 12:18 PM, Lee Shawn C wrote:
> Currently, kms_vrr tests fixed step increments within the VRR range.
> To better validate hardware stability and potential issues across the
> entire spectrum, this patch adds a 'full-range' testing mode.
>
> When the full-range flag is enabled, the test will:
> 1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
> 2. For standard testing, maintain the existing behavior of incrementing
>     from minimum to maximum using the defined step size.
>
> v2: Fix build failure by adding documentation for the new subtest.
> v3: Remove unnecessary '!!' operator when assigning to bool.
> v4: Add full-range (top-down/bottom-up) subtests to verify all supported
>      RR within VRR range.
> v5: Fix build failure for the new subtest.
> v6: Revert commit 862eb176244f ("tests/kms_vrr: Start virtual RR test
>      above midpoint to avoid mode fallback").
> v7: Not allow to run full range test if eDP display did not support
>      multiple refresh rate.
> v8: Add is_pixel_clock_identical() helper.
> v9: Add ALLOW_MODESET flag to the initial commit request.
>
> Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>   tests/kms_vrr.c | 175 +++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 142 insertions(+), 33 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 8f5c4a7c1501..ad9e4e4757f7 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -62,9 +62,11 @@
>    * Description: Test to switch RR seamlessly without modeset.
>    * Mega feature: General Display Features
>    *
> - * SUBTEST: seamless-rr-switch-virtual
> - * Description: Test to create a Virtual Mode in VRR range and switch to it
> - * 		without a full modeset.
> + * SUBTEST: seamless-rr-switch-virtual-top-down
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
> + *
> + * SUBTEST: seamless-rr-switch-virtual-bottom-up
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
>    *
>    * SUBTEST: lobf
>    * Description: Test to validate link-off between active frames in non-psr
> @@ -93,9 +95,10 @@ enum {
>   	TEST_FLIPLINE = 1 << 3,
>   	TEST_SEAMLESS_VRR = 1 << 4,
>   	TEST_SEAMLESS_DRRS = 1 << 5,
> -	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> -	TEST_FASTSET = 1 << 7,
> -	TEST_MAXMIN = 1 << 8,
> +	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 << 6,
> +	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 << 7,
> +	TEST_FASTSET = 1 << 8,
> +	TEST_MAXMIN = 1 << 9,
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
>   	TEST_FORCE_RR = 1 << 12,
> @@ -227,7 +230,7 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	for (i = 0; i < connector->count_modes; i++)
>   		if (connector->modes[i].hdisplay == mode.hdisplay &&
>   		    connector->modes[i].vdisplay == mode.vdisplay &&
> -		    connector->modes[i].clock < mode.clock &&
> +		    connector->modes[i].clock <= mode.clock &&
>   		    connector->modes[i].vrefresh < mode.vrefresh &&
>   		    connector->modes[i].vrefresh >= vrr_min)
>   			mode = connector->modes[i];
> @@ -235,13 +238,93 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> -static void
> -virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
> +static bool
> +virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
>   {
>   	uint64_t clock_hz = mode->clock * 1000;
> +	uint16_t virtual_vtotal;
>   
> -	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> +	virtual_vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> +	if (is_intel_device(data->drm_fd) && virtual_vtotal > 8192) {
> +		igt_info("VTotal (%d) already exceed 8192 at %fHz\n",
> +			 virtual_vtotal, virtual_refresh_rate);
> +		return false;
> +	}
> +
> +	mode->vsync_start = virtual_vtotal - (mode->vtotal - mode->vsync_start);
> +	mode->vsync_end   = virtual_vtotal - (mode->vtotal - mode->vsync_end);
> +	mode->vtotal = virtual_vtotal;
>   	mode->vrefresh = virtual_refresh_rate;
> +	return true;
> +}
> +
> +static bool
> +is_edp_multiple_rr_panel(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	uint32_t first_clock = 0, first_rr = 0;
> +	bool found_first = false;
> +
> +	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
> +		igt_info("Connector %s is not eDP, skipping DRRS check\n",
> +			 output->name);
> +		return false;
> +	}
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode = &connector->modes[i];
> +
> +		if (!found_first) {
> +			first_clock = mode->clock;
> +			first_rr    = mode->vrefresh;
> +			found_first = true;
> +			continue;
> +		}
> +
> +		if (mode->vrefresh != first_rr &&
> +		    mode->clock == first_clock) {
> +			igt_info("Multiple RR panel detected (not DRRS): "
> +				 "same clock %d kHz, vrefresh %d vs %d Hz\n",
> +				 first_clock, first_rr, mode->vrefresh);
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static drmModeModeInfo*
> +get_selected_fixed_mode(igt_output_t *output, bool lowest)
> +{
> +	drmModeConnectorPtr connector = output->config.connector;
> +	drmModeModeInfo *selected_mode = NULL;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *m = &connector->modes[i];
> +
> +		if (m->type & (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
> +			if (!selected_mode) {
> +				selected_mode = m;
> +				continue;
> +			}
> +
> +			if (lowest) {
> +				if (m->vrefresh < selected_mode->vrefresh)
> +					selected_mode = m;
> +			} else {
> +				if (m->vrefresh > selected_mode->vrefresh)
> +					selected_mode = m;
> +			}
> +		}
> +	}
> +
> +	if (selected_mode) {
> +		igt_info("Found Target Fixed Mode: \"%s\" %dHz (vtotal: %d)\n",
> +			 selected_mode->name, selected_mode->vrefresh, selected_mode->vtotal);
> +		return selected_mode;
> +	}
> +
> +	return NULL;
>   }
>   
>   /* Read min and max vrr range from the connector debugfs. */
> @@ -754,45 +837,65 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>   			       igt_output_t *output, uint32_t flags)
>   {
>   	uint32_t result;
> -	unsigned int vrefresh;
> +	int vrefresh;
>   	uint64_t rate[] = {0};
> -	uint32_t step_size;
> -	drmModeModeInfo virtual_mode;
> +	int start, end, step;
> +	drmModeModeInfo *virtual_mode = NULL;
> +	bool need_low_rr = flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
>   
> -	igt_info("Use HIGH_RR Mode as default\n");
> -	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +	if (!is_edp_multiple_rr_panel(output)) {
> +		igt_info("This panel does not support this testing.\n");
> +		return;
> +	}
When clocks are different you can skip 
seamless-rr-switch-virtual-bottom-up subtest.

apart from this remaining all looks good to me.
> +
> +	virtual_mode = get_selected_fixed_mode(output, need_low_rr);
> +	if (!virtual_mode)
> +		return;
> +
> +	igt_info("Use %s_RR Mode as default\n", need_low_rr ? "LOW" : "HIGH");
> +	kmstest_dump_mode(virtual_mode);
>   
>   	prepare_test(data, output, crtc);
> -	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +	rate[0] = igt_kms_frame_time_from_vrefresh(virtual_mode->vrefresh);
>   
>   	/*
>   	 * Sink with DRR and VRR can be in downclock mode so
> -	 * switch to highest refresh rate mode.
> +	 * switch to desired requested rate mode.
>   	 */
> -	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> -	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> +	igt_output_override_mode(output, virtual_mode);
> +	igt_assert(igt_display_try_commit_atomic(&data->display,
> +						 DRM_MODE_PAGE_FLIP_EVENT |
> +						 DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						 NULL) == 0);
>   
>   	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
>   	igt_assert_f(result > 75,
>   		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
>   		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
>   
> -	/*
> -	 * Calculate step size by considering the no. of steps required to
> -	 * reach Vmin to Vmax as 5.
> -	 */
> -	step_size = (data->range.max - data->range.min) / 5;
> -
>   	/* Switch to Virtual RR */
> -	virtual_mode = *igt_output_get_mode(output);
> +	virtual_mode = igt_output_get_mode(output);
> +
> +	if (flags & TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
> +		start = data->range.max;
> +		end = data->range.min;
> +		step = -1;
> +	} else {
> +		start = data->range.min;
> +		end = data->range.max;
> +		step = 1;
> +	}
>   
> -	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
> -		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
> +	for (vrefresh = start; step > 0 ? vrefresh <= end : vrefresh >= end; vrefresh += step) {
> +		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
> +			continue;
>   
>   		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> -		kmstest_dump_mode(&virtual_mode);
> +		kmstest_dump_mode(virtual_mode);
> +
> +		igt_output_override_mode(output, virtual_mode);
>   
> -		igt_output_override_mode(output, &virtual_mode);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
>   		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
>   
>   		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
> @@ -1092,9 +1195,15 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("flip-basic-fastset")
>   			run_vrr_test(&data, test_basic, TEST_FASTSET);
>   
> -		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> -		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> -			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-top-down")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic,
> +				     TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
> +
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-bottom-up")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic,
> +				     TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
>   
>   		igt_describe("Test to validate the link-off between active frames in "
>   			     "non-PSR operation.");
