Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E18C4451C
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 06:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1EC10E2AC;
	Wed, 22 Jul 2026 06:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a18oLltk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7AF10E2AC
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 06:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784701536; x=1816237536;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=METGnKRz4F0N5dxC0HyzsRojduGXCvM1LztyTfXU9N0=;
 b=a18oLltkpc/+yWOwCb8IGHWEiNlg2zBI4d3T/atI13FEz4PF3N9axxnN
 r6Z/+UTxOfivxE8uB53DkzKMtbIvADWaOdQ9XSIlgl9amrfljGbtFgwJh
 HGIIDsmRyLPwiJVG/JPfX8nncwtah/fB8d2d450BUbfMTWsdFJ2Vl8ius
 quuCa+WFSOzHjFAezjh30A2DuWa4VdsWG++R0D997NYBR/JFRu3fBfcws
 1kxIEQrZjog+j0IC9MLHYDLi5/oUTv7OBWkn7wUXLq52dFjYhzkiFbZ7R
 ci3pE8GHbAw562iSJXZZ4t9w1nh9fBrgl9Cadpps9oEDD79C9rqbE5xoN Q==;
X-CSE-ConnectionGUID: B6A1awpCSSOPY34UItwVDg==
X-CSE-MsgGUID: CpEr/bKASu2td1mIjrDJIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85268480"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85268480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:25:35 -0700
X-CSE-ConnectionGUID: QjN+OhxySnmsSOK/EqAziw==
X-CSE-MsgGUID: ICQ/BmgHSBWL/Aw8HIV1Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="262931224"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:25:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 23:25:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 23:25:29 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 23:25:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFQ0cooG3BoXvdLaExXwkYybJdu1eo10YtYEPqwx6V3++gLdS+HWV1/4RjdNvjP2xnHIArYsCaNci/EKJ8jCMuitVL403bOexQQBi01mDUkvaz0jew5q/ldWrlH/EHNE2hfp0rLCdRZX/DvLY+aaMDuJClCfnoUV53Kk5mz58ZjWan890Bglr/UXG4PxwZhIP7etFtS3ey3kn/C2CABtKS9ap3K2RvZNDCiD5r+dYRTiwzBPPCGMwRn2DdM3PwkTsbmzAo7E97Jaer9W36YlIlZOPXMcYjbdpZGsgK7Yy7/86LRqWnpmu65on2reawBzSaTAGK1vAMUiTqti7ZaKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnCMrdIJEdyLaQmB2cAjYPsO5+a1ohshbuwaGlziZRY=;
 b=l+pYXun2Xebv49jhY2J4Q0y5E3RAL+NmzlwjQ/PAdqonPBIZCin2uv94Y04hQ5BGT7BGC2zW9pLQq63WKaKmL3xWBdnzF7B+aKV036/UV7bcje7R47G/FXgkgQ5SwDWKdENtHC4GJTxdbrDnZQknjKb9O8KhEExYaar4WuELUckGpXkd8aopmsWcEqh6+7vmMtMUuOpYYBFjoWRLTtlKZA2W7tugIESSyDrVOgsndeKtXCT8eBTTlFhZ8/6h30Oq1LVfc+yZWTIB+uA1GhzNDxoxuQHOX9WyX3vS9axfB2hOUcNlBKSsOeFi75d66v6axkTl5BV1O5urwd2O/NN/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 06:25:26 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0223.015; Wed, 22 Jul 2026
 06:25:26 +0000
Message-ID: <9299bbb2-b926-491f-840e-66d662746530@intel.com>
Date: Wed, 22 Jul 2026 11:55:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_properties: set client cap for color
 pipeline
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: John Harrison <John.Harrison@Igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Harry Wentland <harry.wentland@amd.com>
References: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
 <20260714144532.351294-2-chaitanya.kumar.borah@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260714144532.351294-2-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::13) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7b188a-c796-4ee3-7d3a-08dee7ba04e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|3023799007|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0s4/rtjEJWhTwjpDUv+oRAg/6WJEdiBBbrPrhW6dNb57jYbEYkFZir7Y5IZ/X/w04QBmGSONgQ5Wv0fWN4oG9Fc2lUCKan3GkTdF6MLyT+SBRSf04wDSgkSt1LhT0jFPmmJEyHRQPshsoFmjTVI8a0mYxMIf1WaIJzGFmVnVD3YlfhoI4yM4RKjmvH4zmDNyJerxACjzsbo5yJv7S7LqPKId6tCXfJltsFcyz8usPbuOk3sqhXIl0GZjaiUxWivP0aA3FkEFPxrSJrDlWn3LR4Q2Pdpv/xkWdqjSsQfmpK0g2LgZtZ82BsMV+Up5qKvPKo+/NjZIzUHVWtIoD5spfhtD7STBoBGmesf1xzhNx2wYKLA5GCyWZD77AjlOru1mHF5dxcNex1FHvr4mGkgKRQw7R3Z5AHTt7VvP6dlY4aRhOyI8Y1s5ajJSWDQnXkpR6Id5L+qcvnZoXHxitEXaJTgs7ebahPAv7KZbz9Wz1wdmepUJ92eGgPb0mbHvhAsDDK/4Iomm8tZZnRrhvD+4lJPvKBgwCDanvzPMJSeCgv712CfB/kct8sRFxXY+xc0/furfEzUsLVcq5D5g32/8vtkm4T4VKcvItNNB3Pb7PXGRxqr9XDyUgFxOHlL9M9D10gXccMAZG3lRCXRgvosTfIafJF7gq5LRVswylLMpTmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkFEaGV6WkFsNWVOZCtUZjFseEU0ZHE5akkzeXFPR2ZPZWs2Z2ZQaFcyb3lX?=
 =?utf-8?B?M3NsZC80S0t4YWQydWdudmZhc1ZhVG5jazdFR3hiUmpISzM0SDZucVNvSjlE?=
 =?utf-8?B?RkZmVzdxMXloYVBHbWIyOUNTcFRzZ2NITHZGak12UmZ2bEdJdU5GMVcxY2p3?=
 =?utf-8?B?OVQ5OXNYN1JRY0FMRUh0eEd5bHZlTEZqY1FWTVp0RDdNSFQzcEdrMXpadm5q?=
 =?utf-8?B?TTE3TmlkdllMZXNoR0Znck80bTZKdXgyYzRPejVxZUhTeVdxY1l5VG00SjBo?=
 =?utf-8?B?Z1g2eHljK3hIbmNlRVhqdEZmb0xScGxPdEwyTitWQncrNnVlL1h4ZzlsdUdh?=
 =?utf-8?B?VVJDMFNSemZpNFgvNjdoUy9mSmpiSHhEZ28vWWdlRG4wQURyNU5qSHhFNXFl?=
 =?utf-8?B?bDRZM1Vtcm56TzU0Sk5MVVlCdWNGSk5HQStaTHNZY2xLR0pLamNIdEdkYTVJ?=
 =?utf-8?B?K0tzYVRrK3pjNC9hK3p4L3p0cHVaeXNPaWgvTkpDdHoxWUtHMDlhSDZTQnpN?=
 =?utf-8?B?b00wQlloYnd4b2w5aTdERGJUb2J2VzFPN2hiRU4vQ1NxbnpFVGF6bHNvKy9V?=
 =?utf-8?B?ZmZxQ1JHZ05VMzRUMEdMM0pnYVQxWE51TEtvMC9Wd0pzTW81OU9CR0FHTm9M?=
 =?utf-8?B?NWYrVlpJS1dpdnE5a245TW9kTGkrblZxTUk0ZmoxYWM5YnhFYUVIVWFySXBB?=
 =?utf-8?B?aWlsZ09qWklYbjdwZnorWExORndQODZIOWMxeHBZYU4ycE45K2tWRFN0dkFV?=
 =?utf-8?B?bG9UR3F5SnB2STdWSjI5NTVNSVZQRDY4Zm00LzR4c3FyY2pFYUM5dHM0Umdt?=
 =?utf-8?B?QmNTSXcwUE1Oczc4TGV3NFZ0Q3pLa1dWdkZyTk9BcFFBTHdCaEIyYU5EVys0?=
 =?utf-8?B?K3RUVG0ycysrSVROanlSL3gyQVNEc2tlWlBFUjh6RHNtem1BeEsydEhxUXdM?=
 =?utf-8?B?QVRVVldpNGFIZ0ZxU3RGVmI0anhDQWdWWllDQklBWkE1dSs4V2c2blFJd051?=
 =?utf-8?B?OGtNWHlpYzc3NW53KzYyUkRrNFBYUTNyNXo2OFNTNkpqb20zcE41VTM4dFcy?=
 =?utf-8?B?aVB2TE1LTy96STM0aCsrSy9YR0xYczYwSEJiblFuSnNoM2IzNkZEUnZCRmFi?=
 =?utf-8?B?d3E4Q3M3Nkx3ZUhENVpJd1hWeEQ4OHA5UldnQ2pOdnVlN3lQYjdVVWx4VDRH?=
 =?utf-8?B?dG00VDBmWFR2OG9qdUVlQ0NYbWpkeW50b09UdVpjWG5JSm9nVDNySy9idkc4?=
 =?utf-8?B?b0FwZXA1UksrNTRnclNVWDhjdkd5d2dEYXNZbGhsT1JiSSt1OHBxOHdBOUlI?=
 =?utf-8?B?T3ZZamZyMzlBZkZqbyswTytOTUg0WnRwQzBNSmVlQm83Mjd0VENUWGRXands?=
 =?utf-8?B?a1VwRTRjTzJySG5YWHNlNVF2TEwwemszMmZRWmtEOEZDbldxaVI1ZWtxUlJC?=
 =?utf-8?B?K3dtSzNUWTZOK0oxR1kwd29TV3Q4WTIxSGc5NzhZOGhYaStNMDd4dGN0Q3pl?=
 =?utf-8?B?MHJQMzZidGJXNFFmeHZhelhsbEF2eFVVSnRBTm9wdkpZMU5QcitXbjl3LzU1?=
 =?utf-8?B?alV5a29paUlncDFzZ0lSTzlWbm5pMk9vN2dBVEk0U2ExT1FjVHFsZFIya2sv?=
 =?utf-8?B?RnJmamUzSGtvcWJmMVcyWUh0TFFGOGZ2Ykl0WTBnN3FPenVJWlBTbmpRZm5u?=
 =?utf-8?B?ZkZad1BZRmNkYlZEbjhuclU0empqbjZVVVI2WG9qakJSbDFGb0YwaWNQTWYx?=
 =?utf-8?B?SUZqVTQxTWU3NEVHbXdvTlUvWlliTUNPM1kyeUpDS3JBSitLNEE1THp1cjM5?=
 =?utf-8?B?aFFtNGdnVmhXQmtyQ01CNGsrK3ZRSytLeWg3em9xMzV6b3h5bmUwUExKRGk1?=
 =?utf-8?B?REUzMC8zOHVpYVBmN0E3ZXlqOWdHVDBKLy9oNGQvKzBaZEUvVEZHS2RuRFpi?=
 =?utf-8?B?MTIrWWdZNElvWFZRbEJvN1JBK1hMcUhLWXhmSVUxUlo5MlozTmx6Yi9LOWg0?=
 =?utf-8?B?Q0NRS3N0SUdQNHJqN3o3R2Z0YmdsbWR4RXU1YnptcDFZQ2hJRnplek5ZTGF3?=
 =?utf-8?B?SUQza1k3RVVJMTdhTGEySUh1NWc5SUFuNnh0ZWpmVUdOdnUyZzdDOHJhMFdU?=
 =?utf-8?B?bGFhSVpzeUpuRW01WVgyREd3aXNET3lwbUFRQTRZck9JQ2JrcEFiWVkxa3BR?=
 =?utf-8?B?TitsRHFWbVRlUHBWMys2cnNsSktVM3diYXZEaDhrNmdYcFRSOFpzaWE4UURZ?=
 =?utf-8?B?MjU4eTIvOWZIZThEcE5lZndWMUcySW95SXk3T2hrUW1rQVZTNFlBZDAvSWl0?=
 =?utf-8?B?QU9rYkQ3R2hCVUw4cUMxWjhndWxvOXFZbyt4WGFVeHdBSWZMK2gzUT09?=
X-Exchange-RoutingPolicyChecked: RB5mCe/2bDbetkklVNyi1sNh+f+KkmivZoay0LrTiTlgRRny7dohwv0PLDmffPjEuHL/HFKRVZ5Fs+KfLfvk7BoHPEIx++O3hFiWd7g67zB2KndR0xGjdtoluN5i/jt/6uKoAVb80HhK57NTs28yXFgEaTnAfOzvOj0ent48GlSvDGx0LrJF/hJ/CVXOKdQKQ36ZHnM4L9y6oYcbAvw6KTzCIP4jLsQ41tDNS4MEy86/oapXPazyZpGmqtbf1grQgmWrSABUlT2KAzxpfQXh4yBtKcIfgQQUY1oHaytAyoLJuPc7TItjBg+yrYtU+RcXgddi2r2u7Aog9BvDm2+ekA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7b188a-c796-4ee3-7d3a-08dee7ba04e3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 06:25:26.7213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWyU0sdtXb2k/ZH23TZf96bkpKZ0SY1m2ScXdBV1qlH/QENkiiyKmz4MOjixkiar+yIsumGyjIIJyHtfv5ifEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

Hi Chaitanya

On 14-07-2026 08:15 pm, Chaitanya Kumar Borah wrote:
> Set DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE for colorop subtests.
> Unset it when done.
>
> Cc: John Harrison <John.Harrison@Igalia.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_properties.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index f735839da..93bf1ea26 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -340,10 +340,18 @@ static void colorop_properties(igt_display_t *display, bool atomic)
>   	bool found_any = false, found;
>   	igt_output_t *output;
>   	igt_crtc_t *crtc;
> +	int ret;
>   
>   	/* colorops are only available with atomic */
>   	igt_skip_on(!display->is_atomic);
>   
> +	ret = drmSetClientCap(display->drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1);
> +	igt_skip_on_f(ret, "DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not supported\n");
> +
> +	igt_display_fini(display);
> +	igt_display_require(display, display->drm_fd);
> +	display->has_plane_color_pipeline = true;
> +
>   	for_each_crtc(display, crtc) {
>   		found = false;
>   
> @@ -369,6 +377,12 @@ static void colorop_properties(igt_display_t *display, bool atomic)
>   		}
>   	}
>   
> +	ret = drmSetClientCap(display->drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 0);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_display_fini(display);
> +	igt_display_require(display, display->drm_fd);
> +
>   	igt_skip_on(!found_any);
>   }

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>   
