Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C42FC79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 10:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95E010F3F4;
	Thu, 10 Sep 2026 10:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ex/bTGJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F07A10F3F4
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789035291; x=1820571291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eXgqUd1kWfKIEMyRuMoiSw534s7kOEy9LW+Btm37Db0=;
 b=ex/bTGJoIA9lgbmsvUcTtIDGVZAGx6DteKZ/89tqrcnK3T/TWKkqx0ZH
 Tjhzd5E7vQ/olFYiYjveONZakI5TxV23tkhdYMsIvQ/cXWKuHLMGM0jxz
 UzqgyBbIBIxLeJ4qIjRuLCIX0oiyGBo39KpLeT+oRMm9pAgquNEQBOhUI
 IFGV6B+z1JFgurkfN4EI3GS7fQ+jnmBD9npQrQM7ASG58+P+aDvHylXY+
 uDEPeHmZP+Ua/TNrUf5PnBRrXCGjosutp2sACUb/D3/0WmP40M0WOHwfY
 I8++19eOt63eJIx9rY2zi6mtpozX7t6q6jKgNC+uvycXRfaHnP6HML9AB A==;
X-CSE-ConnectionGUID: T80vGPbJSQalknLPCKUAZA==
X-CSE-MsgGUID: VGdNTDhYSciwJlurFmlcUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89521013"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89521013"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:14:51 -0700
X-CSE-ConnectionGUID: HaRl/dP6TBSiejyM4wsDqw==
X-CSE-MsgGUID: l/AJwuibQla86/DjNPcP9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="269818175"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:14:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:14:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 03:14:50 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OobOFZGyyJQNG5KDTvNzWBiw7VszC+M0jywJZW9WFxosq4LT5a/YIVGyD+1T0SUbuTQ52a3f5mBSNq184euwQK4srd7QDRSeVI7JLMLm5qjxyx832CxEnlOeex8/ZJ9U5+NDmeZ5Zy1tPmi1+0ue80H9ueP6H0KpHs2x9Q/wp4T9t6LU95VVfD+FE7YvScKhW2gukzQgFGaB4MquZ/aOUMtQcOiWqGmRGKgZKlKScWpeC/Qvez9SSXa9/99Lkp6rucuWqAxyuloPm+DchlCCPMIwG+77U8cQaRNsVL+ZxMku1EbrQSABpNeoM+ZxBNWIRWgpkTHcd9RkISnL02xdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W23ImS+sA+/8Tnyoz4fabtNcV3RCuCmd1UBYeScqKqk=;
 b=WubwjixOOoFd6HmpSSJlxFafN4AV1FvnpmMZk8lg9Me50YamuxLBP71GIn+hQaykMwsBovedffgUGzQxamITMJZ8z4Rt97ZW1hjosUjcPi/iBHgsysCfKSEzm6ThiNmHaLr+bzRo2ObY3ffFvyLiJPz8JtxSD6NeuWaJv11uwzOn30GYeLdJSnIWbzxwUrdQf1SouHFC8f0S1LSXAoFj5jZCjgxZHuMraXwy0fLJifWH0AlBHyktV6cNVVzVtwK1gVzZ/vplKaQiC96Fr1FQSoyZEE6oa/XtbEExOz8eIr6Kx+RnPKZaQKN+SLQho4uGZtbEeN6wbL3K72f3gacIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SJ5PPF867D7FF5E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Thu, 10 Sep
 2026 10:14:48 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 10:14:47 +0000
Message-ID: <2c19be1c-39e1-4dd7-9d24-25854e521eb8@intel.com>
Date: Thu, 10 Sep 2026 15:44:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/3] lib/igt_vrr: Add VRR helper library for
 display refresh rate testing
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>, <karthik.b.s@intel.com>
References: <20260907174836.3159214-1-ramanaidu.naladala@intel.com>
 <20260907174836.3159214-2-ramanaidu.naladala@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260907174836.3159214-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0174.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SJ5PPF867D7FF5E:EE_
X-MS-Office365-Filtering-Correlation-Id: f44508b0-65a2-4c14-4aea-08df0f2457cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|6133799003|3023799007|22082099003|56012099006|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 5iHUNg954ohVEg118wcqIpPekpHx/PtpUL1v0g+y+XQ1uXBysvlPmfvFqNWDIvag119K4YFNGDvISWAYCFlH34vCTbDsom53TcJoMFD/3s2lkK5wiCLB/ePgPsxUTGuVNMA6wSPIul+XX1zycJbS3SZoUZVBt91fQwiXGnOHXngb5iZmP8whCvCt+WCAnVu5ZPfVfJ4rbLVrquHq5ILFfWFP+X0zvI3jfLGeM7HAZ9eodhSiqytfLjNOR1m4ATh7jEDOUALb0ydwCHcvKRf6OnQir/WPE01nHtcw0p/8OemvisvBlN+R5HcGZX+u1oEXI7edno5mYZzYsYOFe4s5bCygJyOpcJdMSTUh5iLENa3HMwys35R/wbj9+eiFczPluBMiOvXnl0ygEGDxpbiSRh/DxPTtHTrMb1maaYV0p6rExLQgdfbcPUguFP8miPp92UkDoykMhra8Qt/LAp1nEhSMpjLaHSqLLZ974mqvXssOTjJLHt2M9PKafjNyYi8Xwkl6aW9QXh6Ib5eoCl0qGICJQgbiqz0xNC+VMbBBhM+cwm6iavGdnthBpElayecadkP/TNoFtftiuFXkag338Kio/aDBdY1bc6j3gxyk6fXK8rBlycbulvAzwHgSyrXaYBKm+ggeEClwCAcBwWPb+uxkHx7m4AZVNdJ1XFI6pf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGY1aFdKWHdaSHlQTUNHeGFMTlcvUVhOV2hTYm1hNzloUUFEYlliamRTS1Fm?=
 =?utf-8?B?Y3NoWlFUMGcvdlF4WnBvYnJ1VWZjbmFBdDZDVks1MnN2dFR3d2E4NVJVSkZu?=
 =?utf-8?B?S2Y1WEZsTmRlUFVpcWp1QVFGSlRWNmpleDhFL3JXTDlQOXhNczVmZTVkY2J4?=
 =?utf-8?B?YklaYUVpSk9UMEVxOWIzTENVaGVjUDFITHoyVGlLa2lrNFVUcmhFOWdYYnNk?=
 =?utf-8?B?bEp3SlFzb0o3UTJkRjBqUk9nOEIwUkZvY1NaTXk0bDhQT0k1b2FFQ0xHVS94?=
 =?utf-8?B?YmQzTEJRYTU1cFUwMlVxUjJFMHJkelBuZWI2dlhCVnVtQzNwekJTOTBmSGFo?=
 =?utf-8?B?Ri9ILzZPa1hTWDUzTml6NVFINUg2V014M1hLb2pHdTZWQ3NJYXhLMmt6MGZ6?=
 =?utf-8?B?ZFcrOHM3WEx4TU9IUGthakM2VnU2UDBjekJkNzlET0RQaVhBeDl0c29aWWQ0?=
 =?utf-8?B?bkRhQW1TMC81UEhVbjJXU1lDNDhlYUdPWHlWVXIzOC9IckhxWE02SjZ0enpY?=
 =?utf-8?B?L2tDZnNsNzhzK3VwZ29JNnM5UzArVXBDRkNjaEN5Q2xUVDJNdTV4MVVJaHlS?=
 =?utf-8?B?bjkybkpGSkVFeGNweGlJNDE4WTdMVG9nWHVWYmRkendCQ25ySVhOeEkzSkRE?=
 =?utf-8?B?SHJnTEJlM3Z4VVdWOVhHaC8vdEMyNmlYaHlVdkVOVWdOSGRjSEtKbDgxYjJB?=
 =?utf-8?B?ejRGVUdGYzBydDhGanRhNkgxd0NGa0FLblBGQW9EMXg5TTVySkFRK2xhVHV6?=
 =?utf-8?B?eW9yVUNmbzB2blg1UEZsakpDclcyUTFCSmpvZmg5aGdCUFVUc1RaTGdlZTM4?=
 =?utf-8?B?RjM3cEZ2aFlsTzhCdXJuL1NZWUg2M2tyUGptZ2NCSnUwWktXbmttbkZtT1V1?=
 =?utf-8?B?Z3hhSHlzTEsvV0JDVjlOZG9oVlNmQlZKNFpoaDJwYk1SSXRDQkdpZkFCU0V4?=
 =?utf-8?B?bWJaWGdMMEpjMHZPaENDQXhoRlRUV1V4VHZ0SFpYcHZVb0t3eGt2L0RqVzNO?=
 =?utf-8?B?Y1pXSStRVE9OeG9aMmV0OXBPVFQ5dWhqU2JHT1FrUEtRNjAzUVY0UlJ6N0Vy?=
 =?utf-8?B?Nk5MSEJObkFGSkdPd1lHdjFVYzh4VVJSN05mNExUNzdJMlkyeTd5NjR0M1lD?=
 =?utf-8?B?ZXpvejBmMDJ2Z2czU05tdE1PTzNVTFhTQlRJM1B6aDYyWmxZcmZOYUFHRThn?=
 =?utf-8?B?RnJmcGZTYkdQMGF6dDNqSnQya1I5Mnc4djRWSlNtNFFEdUlCWUhuSWZGNEhH?=
 =?utf-8?B?bm8ydVBOb2ZuQzVKVVNEcWNxTSt0OU9kQlNsN2Rmbm9JT2JHYk96NS9vNjM3?=
 =?utf-8?B?Qm1jWmRkNTNHa3pzWWk2RUxUZkNSc3A2SWdXVmFSalZtUnhSK1JsZ1BkV3I2?=
 =?utf-8?B?NDduOHN0QkJ1dlpaT2JHQURYM0h3N2cvWDNwSzhsZUI2YVlKRDdubXJaVW1z?=
 =?utf-8?B?VWlPOVA4Q0tsMVhEbTZRem1uN1J2ek43WS93K0lZWVZSemhDTTZxVEhuVUxm?=
 =?utf-8?B?U1V6ZjJaTHhPa0NZTEtja3FEYkZvWVV5dHUvTk9hbk4xNm9IWXRzbko5OXMv?=
 =?utf-8?B?aSthQ1gvRUlydm5HZEo5NDdGR3I5cU5wWmF4MkI4OXZYUVdSWXlva2lVLzBs?=
 =?utf-8?B?UzMwVWR6ZVVZV3d6SmJYTWg3MGM5K05rZzlnMWo1c0RPT3FjVWhScG50ckFC?=
 =?utf-8?B?VTdneUR0N0k0S1lianVHcXIrS0F6MnRoemgvY3dDcXdWa3lPcUxvZDd3MHNk?=
 =?utf-8?B?SFBYTlFscHJXUGUyMXVrd3Irdm5MYVpnaDVzdjJNYm4yN29VSjJsZXF1TVBR?=
 =?utf-8?B?bCtXVEgvNk4vSEVQRlBUbmpUeTYzaTd4NHEra0k3RkZGbExsTzJhbFNNeno3?=
 =?utf-8?B?TWkrTys5VExTQXd2T3Q0L0VVTm1OSzUxbGV3a3NJUlRJNEdmWkN4eHIzczNy?=
 =?utf-8?B?ZStzZnlKZHFHNENHcjhFcXNqYWtHWENxb1VGUktycUZnbWZSVHFsRTFsYkxD?=
 =?utf-8?B?ek9UTzZORGs4MTVFT09iSkJ0SlZqa005Y09FZjRmV2FCclRCTWpxdWltaWNt?=
 =?utf-8?B?SzhGN1pXTGs4WGNNNVpLNndDUklKZDlQV0RRRE5CTVJic2UvY3l0RGZxUWla?=
 =?utf-8?B?UDlLMzhYM1V4aGVuZkN3N1JNSWpOVXMrNUFtU0crK0JGUFR2MmRCUTdraDVx?=
 =?utf-8?B?b0czblUyRXM5UlZqMG01M2t1UFZSOVFyVzZZM1RRNVZYTDBGZFBOWWpySm8r?=
 =?utf-8?B?eGtGSm5kVU52SkNiU1RWc0Jzb0dBejBic1dNcDVYVU9HOGJ5bEpMZFZrRU5u?=
 =?utf-8?B?UjJJb0IvR3NVUWFEcTREMkxBeDF6NnluakEwam9xYnpCZUlXeW5HQm8xN24v?=
 =?utf-8?Q?/io6DLvpdYGazmqZ6Pm7n/Y1mPn/ivNPs1UFM?=
X-Exchange-RoutingPolicyChecked: M9G1tOs0dwTwG6nEScqzr6eyynlj40DX9kiEDBt4vMH+HFDrp+DGqI4vm/d0F0cfhJya2frpsxkM06J31BYkaLuLib/2HJU7Yi6eo1mXpuZbHZ/3gBE5LGZY6tuNW1mIyZm6YnrCRhaSSjXdpVLzYMGENpMa5TITKDGb0Mz8/adJpuYdTtvWeCKcsabPfnKfwcMhqvPi4NB8dXnn/QLhMlQnEkZoIjS4yvv6H/wo6ElbxcGshUrDdc5W8yJ2B3XgWfzv49mCEWKwfu/wrAg5mady4q7kVpF4iOyr48qZndKuOx4jMEcbIMY9jkypaxjQ5IEindxarVve8BBKzoQCPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f44508b0-65a2-4c14-4aea-08df0f2457cf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:14:47.7789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Czt4js8DS3lvZM53GRONLdcyMEvLZoq5Wnc3LOykpIqVILyEtlOCfh2qGRrizD1FEIf8bcthUSqNOOwgzNeaWvMSc9KNGVZu0kpqOkOLfMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
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



On 9/7/2026 11:18 PM, Naladala Ramanaidu wrote:
> Introduce a new helper library for Variable Refresh Rate (VRR).
> 
> Add helpers to validate targeted refresh-rate testing.
> 
> v2: Modify debugfs with helpers.
> v3: Add helper to check cmrr support.
>      Address review comments. (Mitul)
> v4: Address below review comments.
>      - Add source and rationale for standard timing refresh
>        rates. (Chaitanya)
>      - Restrict target RR debugfs helper to Intel devices. (Chaitanya)
>      - Make Intel target RR debugfs helper return bool instead of
>        asserting in the library. (Mitul)
>      - Avoid assertions in library functions and return status
>        instead. (karthik)
>      - Reorder source list as per naming convention.
>      - Rename cmrr_supported() to igt_vrr_target_refresh_rate_supported()
>        for consistency. (Chaitanya)
>      - Move CMRR-specific macros and enums from the library to the test
>        file. (Chaitanya)
> v5: Address below review comments:
>      - Add space after subject prefix. (Kamil)
>      - Add blank line between system and local include headers. (Kamil)
>      - meson: fix indentation for igt_vrr entry. (Kamil)
>      - Rename target refresh rate helpers. (Chaitanya)
>      - Change FPS count type to uint32_t. (Mitul)
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   lib/igt_vrr.c   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_vrr.h   |  30 +++++++++
>   lib/meson.build |   1 +
>   3 files changed, 197 insertions(+)
>   create mode 100644 lib/igt_vrr.c
>   create mode 100644 lib/igt_vrr.h
> 
> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
> new file mode 100644
> index 000000000..1eaf0c3f7
> --- /dev/null
> +++ b/lib/igt_vrr.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <inttypes.h>
> +
> +#include "igt_vrr.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * Integer refresh rates that sinks advertise as standard video timings, and
> + * for which a fractional (rate * 1000/1001) counterpart is also defined:
> + *
> + *  - 24, 25, 30, 50 and 60 Hz are the film and broadcast (PAL/NTSC) cadences
> + *    carried over into the CTA-861 video formats.
> + *  - 48, 96, 100, 120, 200 and 240 Hz are the integer multiples of those
> + *    cadences, also listed as CTA-861 video formats.
> + *  - 75, 90, 144, 165 and 180 Hz are VESA DMT/CVT and adaptive-sync panel
> + *    rates in common use.
> + *

I am still not sure of these. For example 96Hz is not listed in "CTA-861 
Table 14" but can be derived from the CVT calculations.

But not a blocker.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> + * The fractional variant of each entry (e.g. 60 -> 59.94) is what a target
> + * refresh rate in video mode programs.
> + */
> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
> +	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
> +};
> +
> +const uint32_t igt_vrr_standard_video_timing_fps_count =
> +	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
> +
> +/**
> + * igt_vrr_target_rr_debugfs_write:
> + * @fd: DRM file descriptor.
> + * @crtc_index: Index of the CRTC.
> + * @rr_numerator: Numerator of the target refresh rate fraction.
> + * @rr_denominator: Denominator of the target refresh rate fraction.
> + *
> + * Write the target refresh rate configuration to the per-CRTC
> + * VRR debugfs interface. Passing 0/0 clears the target refresh
> + * rate.
> + *
> + * The debugfs interface is Intel specific, so this returns false on
> + * other drivers. Other drivers can add their own debugfs node here.
> + *
> + * Returns:
> + * true if the target refresh rate was written successfully, false otherwise.
> + */
> +bool
> +igt_vrr_target_rr_debugfs_write(int fd, int crtc_index,
> +				uint32_t rr_numerator,
> +				uint32_t rr_denominator)
> +{
> +	char buf[32];
> +	int ret, dir, len;
> +
> +	if (!is_intel_device(fd)) {
> +		igt_info("Not an Intel device\n");
> +		return false;
> +	}
> +
> +	len = snprintf(buf, sizeof(buf), "%u/%u", rr_numerator, rr_denominator);
> +	if (len <= 0 || len >= (int)sizeof(buf))
> +		return false;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +	if (dir < 0)
> +		return false;
> +
> +	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate", buf, len);
> +	close(dir);
> +
> +	return ret == len;
> +}
> +
> +/**
> + * igt_vrr_target_rr_debugfs_read:
> + * @fd: DRM file descriptor.
> + * @crtc_index: Index of the CRTC.
> + * @buf: Buffer to store the target refresh rate string.
> + * @size: Size of @buf in bytes.
> + *
> + * Read the target refresh rate from the per-CRTC VRR debugfs interface.
> + * The returned string is always NUL-terminated on success.
> + *
> + * The debugfs interface is Intel specific, so this returns false on
> + * other drivers. Other drivers can add their own debugfs node here.
> + *
> + * Return:
> + * true if the target refresh rate was read successfully, false otherwise.
> + */
> +bool
> +igt_vrr_target_rr_debugfs_read(int fd, int crtc_index, char *buf, size_t size)
> +{
> +	int ret, dir;
> +
> +	if (!buf || !size)
> +		return false;
> +
> +	if (!is_intel_device(fd)) {
> +		igt_info("Not an Intel device\n");
> +		return false;
> +	}
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +	if (dir < 0)
> +		return false;
> +
> +	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
> +			     buf, size - 1);
> +	close(dir);
> +
> +	if (ret < 0)
> +		return false;
> +
> +	buf[ret] = '\0';
> +
> +	return true;
> +}
> +
> +/**
> + * igt_vrr_mode_line_refresh_hz:
> + * @mode: DRM display mode used for the calculation
> + *
> + * Compute the refresh rate directly from the mode timing parameters.
> + *
> + * Returns: Refresh rate in Hz as a floating-point value.
> + */
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode)
> +{
> +	return (double)mode->clock * 1000.0 / ((double)mode->htotal * (double)mode->vtotal);
> +}
> +
> +/**
> + * igt_vrr_target_refresh_rate_supported:
> + * @fd: DRM device file descriptor.
> + * @crtc_index: Index of the CRTC.
> + *
> + * Checks whether the target refresh rate debugfs node is present for the
> + * specified CRTC, indicating CMRR support.
> + *
> + * The debugfs interface is Intel specific, so this returns false on
> + * other drivers. Other drivers can add their own debugfs node here.
> + *
> + * Returns: true if CMRR is supported, false otherwise.
> + */
> +bool igt_vrr_target_refresh_rate_supported(int fd, int crtc_index)
> +{
> +	int dir;
> +
> +	if (!is_intel_device(fd))
> +		return false;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +
> +	if (dir < 0)
> +		return false;
> +
> +	if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 0) {
> +		close(dir);
> +		return true;
> +	}
> +
> +	close(dir);
> +	return false;
> +}
> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
> new file mode 100644
> index 000000000..84d26cd1d
> --- /dev/null
> +++ b/lib/igt_vrr.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_VRR_H
> +#define IGT_VRR_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +extern const uint32_t igt_vrr_standard_video_timing_fps[];
> +extern const uint32_t igt_vrr_standard_video_timing_fps_count;
> +
> +bool
> +igt_vrr_target_rr_debugfs_write(int fd, int crtc_index,
> +				uint32_t rr_numerator,
> +				uint32_t rr_denominator);
> +bool
> +igt_vrr_target_rr_debugfs_read(int fd, int crtc_index,
> +			       char *buf, size_t size);
> +
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
> +
> +bool igt_vrr_target_refresh_rate_supported(int fd, int crtc_index);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index a7cde027e..d1a770b6d 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -56,6 +56,7 @@ lib_sources = [
>   	'igt_vec.c',
>   	'igt_vgem.c',
>   	'igt_vkms.c',
> +	'igt_vrr.c',
>   	'igt_x86.c',
>   	'instdone.c',
>   	'intel_allocator.c',

