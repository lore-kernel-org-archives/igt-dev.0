Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F328DC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 06:08:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38C510E043;
	Tue,  7 Jul 2026 06:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UP0EUW9w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C36110E043
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783404465; x=1814940465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ueu2rU54lPlK1Hc541BZ5yAIbYLMvMSGHOq6U6E2JOk=;
 b=UP0EUW9w8FpEeFryQG1XonnHOC145J1ariT0Cx42H5O+ui7MEt/eRvMT
 4Jar107v4OmorhJUO2ofv7IBCfRjE0p6a+3teyA77nURkPsb5W+gcvE4a
 k9Ky4RKgdsayUbdynEn1LZOln7ToErv6mD5svJ3aJECn195oFCXOVYNTI
 sJ+8CrY3ywR7C4mumVCVV7k9ydawxRJIyBS1pDluKxFvuvTH6dRQZaPyb
 XHmTM2McZSWT/ln++bP8czRduaGQXUKNnSBVWFQ2gIIoo1VDb0PsXuewa
 1idHj1vCHC0cdUa24YWFwaI7EQJuqNtWdWZgOscf6ugb3MUMM9fB0z8EQ Q==;
X-CSE-ConnectionGUID: CJtb1ZOhSk6bW38Z3btGWw==
X-CSE-MsgGUID: vtfQXOhGRNOsLpOnHi3nOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87861988"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="87861988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 23:07:45 -0700
X-CSE-ConnectionGUID: YnDlXF9AT/O6YV36Miy6qA==
X-CSE-MsgGUID: cTQ7jkXORF21Jp+ErleDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="251236510"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 23:07:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 23:07:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 23:07:44 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 23:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sngh2NINyUgAZC+bs2+w5XkMtfur0MIbcuXVgrLKUYW29kAmvta0/84U5PxB0KxWzkwL6dugU11curRdnpBHqGP80x6BqwUr3UA0HKwKtQfSostLYABE9y470Fv1kUoLou8vWTKDxQcKQsXuM3E7psdIYJiEEPcRjqmP8Xnnv4qu7C1c9NNTXKe29i8gZXsk4KecmKm5a0fT96sS2q76Etk90SwS8avzmECJhqcVNlRwgVn/TX9/RBWqsNT6usbI4b9X3WegZmxnikiFarf2xXlWQvb1p8RT7T+xZTZQDJN9Qgws1ZkiqbV6c3q53d3BuXaKJ4htAjFYKDt7J+RHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSodFa73s6QVuc3DPmmXIoE/I+3GBt/Mvvjd8YuNCew=;
 b=CsmTjv/Gbq+lNNABvM3Lylqf4DUMgGh70cHojtjMpaXOsU6w8qEBf3yNQZJARnpjvkGHI9n2nmXAZkXmA3ib2wugJrv1SUwNG0VF7x6iK6NwJNuJo0a8LXy4dT1SqRRMfgjmcehiTdOs6cVexwAbtKMq/KYe2XVF+RX9Hbtx+URNVDbxl3UG58z8RghSbdPDQnD0KcLwUVWamwxBdqUQSPOIpHXDsgyQviw1TAV+8w3foBDmmhlNgr6aCMHKOJ8kZZ2irh1VaIX56/h4d4cRElcEIQkm/fJ5Lv31UwbXLlN6l5A+cCRGIQm8PqAOi+xujwzj62Krusn07m6hYssrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 06:07:41 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 06:07:40 +0000
Message-ID: <569d0eed-444d-4c96-a884-b84be08c52b0@intel.com>
Date: Tue, 7 Jul 2026 11:37:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel-ci/chamelium-only.testlist: Include
 additional chamelium tests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260707041956.39997-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260707041956.39997-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SJ0PR11MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: ec61f44b-f606-4d9f-7bcc-08dedbee0d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nt6Q3YO/oZIwzDNL8500qbj0/P0e24lz2O647DTCqQLVx1RQvV1SqD0v6f3KGSEO7scE381NIKaxiy/Bp/gg4cQqpvFOwvDXlmUPpAnh1s71uxVh8LV3Pw+G73/5ugSjwk3AZ3Os9E1t/o6fXX2M0AHXrKgJpHq8MY6afRQ/gt7DEkAuqEGYteS1pSC/zapxdUcaE2JCKkVJrYh1/YkDPezp/1RulUD61ctIJFm4hVW5ea9avs3QojPm5Iejseu74brqT3+t/08Vt3RBSN8hPb+hPDJovl3xbfqmPyIMp7zxPObZQZmJJSZBu8cX3td2r7e19Z9RdDBG5R5k4X0nQI9UbvQLxsiY0eJsjkGC+FO0884gxgtkXSrSOMDrnnHvOdAfSwd8Dtmb2HTwybxDBpajZmFmQOpF7SX6rOtU16bmajc7I4V+ZK/QlxOsWhHSW88QBB3gigmwDVnQM5KTS2rkj+p6FqcFTA3sFbHzsxzd+AskJgrppMunGI4HhhR1UKbEdmXy/d3xKk234AvVI+NEGYSp6Ivz5+vXhos8dkOBIYTLRHcNmXrOk58pW4icTXjS0ZBAW+G2B6ZrUejaGp/AXFPc5/VMJRnSmchoApCa60yjut6czDN9IkKUEHpc0M3L4S7QHYek7AU0w0pJVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzFOdWFxNW40clJNd3FCSWhVQWc5clR3bllndTVvSCt2UWdrd0F0eGhaZy9O?=
 =?utf-8?B?SStQU2hnZ3NBOCtuVkVZWlloS1duLzU5Tzd4bzlUK1llVVo3NXl3UEt6Zkcv?=
 =?utf-8?B?Zi90T2NXNFRlNUR1VGZ2YmRlVFZOUFZxdkFPRldaV0FiSS9vMzRqWVdiSFpK?=
 =?utf-8?B?MHpVbEI2dWdaemVxcVB4Zm90YWk0aU5vOFBPY0Zrd1g4Zm5WOVY4L2tTZml6?=
 =?utf-8?B?RGJhdXBnRmRBT0xmVVhSRlF1ZHpyTEpnaTJVcjBqdWgrQWFtb1Myd2p0d2Z4?=
 =?utf-8?B?M2UyeSs0d3V6TWZWUEppRTdhaVR6dTBpamcvcUJveWF2VjJBYW5HcGtNWEZK?=
 =?utf-8?B?c0d1MXVaN0tEUllmRC8rWThsL3djZ1FQVWg2NEF0REZ6bFBPY0RtY284V3du?=
 =?utf-8?B?eXpjd0N4TytFYU5IRzV0TTZURzVzWWpYQUlGVDFMMU9ud2FEcGl0ODZTNytJ?=
 =?utf-8?B?Y2c5RCtHd2pNTHlrK3FWVHVwY3BrR0ptS0FvOExacnNkZ1JJblpQOXVFZHdv?=
 =?utf-8?B?SWUyWkFlMFZCMk53OFVpRmIzcDczVTZnc0doQXcrTjVzRHNPSzJ5aTB2UWRD?=
 =?utf-8?B?SGFMeE1oM3RnbmxkekxoY0xVNitoZ3RvSkVrRkVlL1R3NkhvM1RKeDgwWFBk?=
 =?utf-8?B?U043UHJacE5IakVtL3EyZ3A1dkxYZXpGU3RoV1ZTb2tRRUpEckdJcDJaQ01B?=
 =?utf-8?B?MDV4ZXJ1SFZMTzYyMmJ1WUJDajFpZTk3dU9tNVNYVVRNODFKMU9IZVNxVDVi?=
 =?utf-8?B?YXFJMjZuUVNJLythdVlZNHVvK0NTcHo4R1U2WWhqMlVSVUJtUnRTRU9ENEJ3?=
 =?utf-8?B?djIyeHRvekpyRXNzei9ZMDNWQ0pYbUxBekdtMk9DL2dvdEp1dUI5OHMxWVYx?=
 =?utf-8?B?eEQ1NGNJV1BlTXI4dXZ3UlBDRTNPak9vR2tqNzFsY213ZzcvTHl3bFAzNDYv?=
 =?utf-8?B?ck0xdDV1WU1kdjJvZlF1VS83MlFQT0hDVXhseWlrVFpLaWpzR256UkRlM3hx?=
 =?utf-8?B?MkxaWkJxL1ZOR0d3c3V4OG1XeEJmSkhhYk5oNWJUQ3czUlVDQksxYlp2Z0lL?=
 =?utf-8?B?SDBtbGZvaURGMDgzclNRL205NlZVbHFyUnhMc1ZOUnhyRzA0d1VpZ2VQWW1J?=
 =?utf-8?B?RHZvc000OCt4MHpOWTNBN295ZVppb3BmZk5hd2I5VU9weDVHR0pNYmd3N3No?=
 =?utf-8?B?NlhvQjI1ZEg0UDI1L2dUQUFmU0JZQVpXWlE3VVplY3k2cCswVWhCbGlLQXJU?=
 =?utf-8?B?QnV6NXlLd1owOGFiVWpKRHliYzIwTi9wVVdTNkNkUmZqZFhEK0pSZmZ0M3VL?=
 =?utf-8?B?WllVZzF4dTQwdktoY2NoN0ZhWDltUzNkZzJab25Dd1RYZDErc1hpOEI1emdm?=
 =?utf-8?B?ODRXZlhuVHlZNlVBd05QK3JncVRuemJtYzNCTVc2eXprZ1c5NWZQRmVxVmh0?=
 =?utf-8?B?QkFVekJtNnd6U0x4aDVlL0VVbXl5N3JJUnAxNDhoZkt0V3lNNlloMnVRemdh?=
 =?utf-8?B?RVBocFdMRWtVODVIQ3pPcFRxY1VsOUZxcml2dDBibzhWMnFHRDhjUTQxV2hj?=
 =?utf-8?B?T3ZQQ3pVWG12WlVtTnBWRUp4Ym9idm02TVhTMUF3ZU5pT3E5VGQ5a29IYVBN?=
 =?utf-8?B?eDVDUGxYSUk5M05ISnVOalYyOEgzRWVOVTd3dHBmR2FUNmJFMUIwaGZvVXdR?=
 =?utf-8?B?UWpMemk1ejlpZ1JxWW42RjJsNTc4RklqRCtLNE9GT1lvbzR6Qk1zQjdHeTRU?=
 =?utf-8?B?N2w5OTNlWENWS3lFaWJ1ampBSXJTVTRheG9KcUJoMFlaRUgrTXdQWEt5QXlq?=
 =?utf-8?B?NlRIYnhRdVdpWGxLR3g3K2NzTXNTQVhaa2Erd2xZWFFBMXpwTmpvZGM5Vy9S?=
 =?utf-8?B?Q2VERUYyYVNSaFo4NWExbEJPcTI4MHlzQ04vcTJFbEU2TTlBYW9KdEJpdkJH?=
 =?utf-8?B?TWF4cEx4UHUrNVIwL05STGhMRXZ5NVRIUnJYc05La1Y2TnkzVS9tYlllSHdz?=
 =?utf-8?B?U3R1VWRPemdTV0swNHNMWlBPTHMyemFsS21wL3NMQVVpc3AzVlZ5VWFRcGVU?=
 =?utf-8?B?WmJ2VlVaajlGM2Z2dS9JNkhrbC9KeG9rSExnUVg2YnJ6ZTh0ZTRtOEZaU0t3?=
 =?utf-8?B?Y0ZOUEtYR0o4TUZFTERlNkJiMW9wWmEwVkw0WVBueXU1aWcwZWdEWmhGLzVy?=
 =?utf-8?B?SGE2ZzR3VVpleDF3aGxHbzVzeFlpV0xvVEVock4wTXVxTUJmU3g2NUYvc2Vk?=
 =?utf-8?B?MHlrRmVsSTNmdzdqekJYYkx0WWlLRXhsNnBiL2RYczN3by9QQUJiWGRXaCtC?=
 =?utf-8?B?dEQ0UEhnNzdQWWJ4LytXK3U3RFo0VWJ3aWZIeU53NXlVVFhOd0h2QT09?=
X-Exchange-RoutingPolicyChecked: Gtvt1mlSkoeADN534pv/9SayoN4QkaxPR+q/FkNB7EgYQAWup2Ekls5g0tFbAu/u7zlJgQCaqfAuMvGXbptwFBRhoYpatrpADclgUrp2LUZwYptWGHBo5gDwuKqO2JQhG8VWpWYIUGbirRZwb9uOkVXku9r4wpEPtlGRsTx19CY2uZ6tsEiEYreDpM7b6sWWzkrRBKBGKnNArblCjS3e95ba4oBFyiF4+wMNVYV7t4y+rXIrNStBwwelx2LbAZwQwnAWeFfpQmIPRoPsRxq9OPiAUht34ZjqvOQvTiM+k2QyQoXKQ9Yl1GKm6f/0jIwJrgmOAARQm3rjEcDyv3/G5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec61f44b-f606-4d9f-7bcc-08dedbee0d42
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:07:40.7922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+3fB0wEwH3GtUfVOPH49WTLeONi2DqHO9LXDC/T1UqIJ+hsysMtrLIaQZpdLmN2U3jEHlYVVeM2+/TNE6RpZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
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

Hi Pranay

On 07-07-2026 09:49 am, Pranay Samala wrote:
> Extend chamelium-only testlist with audio-after-suspend tests for
> DP/HDMI and kms_chamelium_color_pipeline tests.
> Blocklist plane-lut3d-green-only on platforms with display version <= 35.
>
> v2:
> - Update commit message (Kathik)
> - Add NVL specific test in other blocklists (Swati)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist      | 11 +++++++++++
>   tests/intel-ci/xe.bmg.display.blocklist.txt |  4 ++++
>   tests/intel-ci/xe.lnl.display.blocklist.txt |  4 ++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt |  4 ++++
>   4 files changed, 23 insertions(+)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index d627ad414..8d634b6cc 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -2,6 +2,7 @@
>   # To blocklist tests, use the appropriate xe/i915 blocklist files instead
>   igt@kms_feature_discovery@chamelium
>   igt@kms_chamelium_audio@dp-audio
> +igt@kms_chamelium_audio@dp-audio-after-suspend

Add suspend tests in the end

  # Suspend operations can cause system hangs or connection timeouts,
  # so isolating them at the tail ensures stability of main test
  # execution.

>   igt@kms_chamelium_audio@dp-audio-edid
>   igt@kms_chamelium_color@ctm-0-25
>   igt@kms_chamelium_color@ctm-0-50
> @@ -14,6 +15,15 @@ igt@kms_chamelium_color@ctm-negative
>   igt@kms_chamelium_color@ctm-red-to-blue
>   igt@kms_chamelium_color@degamma
>   igt@kms_chamelium_color@gamma
> +igt@kms_chamelium_color_pipeline@plane-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
>   igt@kms_chamelium_edid@dp-edid-read
>   igt@kms_chamelium_edid@dp-edid-resolution-list
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> @@ -53,6 +63,7 @@ igt@kms_chamelium_hpd@hdmi-hpd-storm
>   igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
>   igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
>   igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-after-suspend
>   igt@kms_chamelium_audio@hdmi-audio-edid
>   igt@kms_chamelium_hpd@vga-hpd
>   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 4c2a7390a..18712fb86 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -181,3 +181,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> +# Valid skip :- For display ver <= 35
> +########################################
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> +########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 1dbb24ae3..5d008ce8d 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -191,3 +191,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> ++# Valid skip :- For display ver <= 35
> ++########################################
> ++igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> ++########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 1041931a1..846527f02 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -182,3 +182,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ########################################
> ++# Valid skip :- For display ver <= 35
> ++########################################
> ++igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
> ++########################################
