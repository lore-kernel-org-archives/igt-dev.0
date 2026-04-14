Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C631F531F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD66010E587;
	Tue, 14 Apr 2026 07:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gx4rxqfr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C145910E587
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776152100; x=1807688100;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lu6VmV7oinpqAlbi7Im91BKEaLaQd5LFW6HgS+G3iyg=;
 b=gx4rxqfrF7YiOrK+FFYjBxP8fyIk13sMAB/COqz/JnOrpJAG4KLgpuOl
 69e2JIU8cAY5dVVmMuIqIrcAaiTwdVMhdGj3xUwHx+LJXRTglyeo42SBm
 crgS9mmat3VO15mHK1nLJdkkeeTNrx3/zXborwqjy5BxCn2MUqoOHXRzS
 4mvz2vV8L3ZxkqZq6GkHoJjV2O9koJ8BGKT8qLgFQhC/P/wJLXBMcs43H
 wywIk5txm9bvMKnXagOkbCb57PfrBUbsQsn6DEmsOC6NrpJe7aFoTGL4R
 3r10xIqIvUPPs0TVQINBzyaYW2eUxe/+2XxJpkWS065s8vqjpmaC9U1rG w==;
X-CSE-ConnectionGUID: FVhRCAerQ6GnKETUrgJbWQ==
X-CSE-MsgGUID: DszvfYejRjOH6hB8jQlQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77282728"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77282728"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:34:59 -0700
X-CSE-ConnectionGUID: yopCIhx4RNeJ08qWLEIqjg==
X-CSE-MsgGUID: rwDIVaPBSzOipwn66Zkcvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229141051"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:34:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 00:34:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 00:34:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 00:34:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrzBZfmOX9NVfhvNmyfmn6XeM9LsZNl6dpBm1dTNZbgxiSAax0na+rjS2NPN9LU2JWsZqiRePZiUGqy/O0OJERNd6ugRGJceyiT9wCseOPZ+BrHgXVY9t4sQVafYSBz4l5qHVzP33jMUKHHQhzkq+vWn9Uk33qzcRGnkiztt3k7rz4E1SbR4ADQhWlNsuWumnNEMdL2Ao9rsFDX4EeCb0G8OW3bQsRPgKeGIQGa9Tg0zwG5UbjWQm//V0c8Cj2MjoRJY4G77vzin5ISV9RUiJyLBu7KR/bcV8LPLFwFLNwygh2li8C3A7u835rYMIdnd/f5SvOmQl1cu5KYWXhfGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjqnjoAfNkE1/RUt6yqcqYfrH+8nORlDj4fJSUg5izc=;
 b=OVkOtPYwKXzG4tC+tXeIrZ/6LPoMBA9AyabJK9tXLUGxx2vwDF1ukU0d2Jfi6CjbQFEUES3SI1o20A7+KJPYhoq7fbtixBG8HKydotoewN5nyO7HiLDnC2GQSLSwI2/mpMyyPtd6ADK7t3ksWU8gvWCoQ/hIj5X2KumMBs6UuTo4r+0+AskDoLEXOXa8FHbRkPWktQg1/A3G7mfvMIs013kkNA7LnMbBcESlJnatIX63r3D3qQzv49KEp3j+yXyn9Tvs2mPYtyRzEQ9CbozFBYeGOUYlar5+8ANCX8tOUZwnu2iiO5YVBiAs753ecpWWnJubcXkAjthOsG0ZWEbaXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB5957.namprd11.prod.outlook.com (2603:10b6:510:1e0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 07:34:54 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 07:34:54 +0000
Date: Tue, 14 Apr 2026 07:34:41 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 2/5] runner: Create attachments directory to use
 by hooks
Message-ID: <4xait5mvo6ucmtro5awsypjyscqfipercq3royxobm5ujfwycn@7xmk75cvaate>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TL2P290CA0020.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::9)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 8850d1d5-1e40-484f-56df-08de99f85234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: vu1YDUiLZypW3M9tG3HuXIZ3DM3DMUQVG9iHSJnIUdKY8t3Cfv2fur52kkasCMLgNqxIHO5CKYvmQPli/duVpF5rDfp74KNOHxErCmA0K07rS0E7Aq5QiI/0RLC6DdgBmsbvIbf087WqVVWk3+7oRm/YcsN1wvEndI6WIAEfuezdRorq9rkJD5swPseE4AfrnKnK60IvEDD02BoR53h7q7AUDqSUSkBvI8BVSIPQ/3Mn+IhqjsknoAH0vGBjxv8AXCyGiieakMrGfhWLovRoE5C8wvm1vf7DdF87WRsxb+824EQ3xSJBa2g9AypcUgGZbszOX41dZR4qjULGxB5oMIONUMZMn08EcUms2U5WVzfR7AmkjZCb4opgn6/KhVDWpSaxIrLRlTfhpulCx9z3ObLzse2zy/0a+iYjAOZKdym2lQg6s29rJzbC4itqxJr17MmykOKYVb9zRblHSDoNTqAwYOLRtSTeIEKSKqHwftsZz2qbtaN7tMNy9pcppznZKsNmUkvCL4FqBm2ljLZvA3ILZ8qzvW8qjQ8cSoiTPMTh4DZ9QmgRisEUqpru0FoNDf5u68e3So3w8B7yvTzhCL4fRWvk8HTcIo6S/TrZRneZTAVPwitTwqyhTJ32Gcwzd6IcLCsngIX/JmkELKBxJ9RGkNZSsFtvmBetgUFvr6Anx+p3/XEuzcIb0CDdM79SQvQi6YxbwjeoF/NUaTja9kJeQsDPyhIQtI3XUJG2uyM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGYwVUlIS3pIUUxOMGZwQ1k3SmUzUDBSRytDdGNsUEU1QkE1TzZubU1SckZj?=
 =?utf-8?B?WXN0LzBLbVBBSG5acUR3WC91MzZRVGNnaUtYdjIzQWxyZ0thU1FRUnQrc0hk?=
 =?utf-8?B?NFdHMW90cDBUcFhmWGJSaUV1dWVXWmMrL0lQUWtuUkpMN1NpRlhrR2wrOTNp?=
 =?utf-8?B?Zy9vK25mWm9JMW5mQmloOFBqenJQaCtDenJkL1pwODFQM3I2SWVBQzlmandJ?=
 =?utf-8?B?RmdoSmxISUxjellzWk93bmF5NGwzampxMFZLWnk2Zm80VUJQL0dIbWNYeXUv?=
 =?utf-8?B?b2srb1lCaFFwL1NKbUsvYTV6Rmdhd1I0cUZxa3JxaUc4OGI0RHFSQ2ZONW80?=
 =?utf-8?B?MDQxTnRtWTZ4V3FyZ1d3anhybHZvWWdCbUtJTk8ySWtDbjRZV2Fnc3kxdE56?=
 =?utf-8?B?b3oxN2lkTHJaRzVGeWUrdXNxWEg4RGY0RGQ5eTAzVnFnR09wSEpuVWVRTmFB?=
 =?utf-8?B?SHZUcEdqd3FSVFlPeXpDemZsRU9YTkZRbG1HNWpWYVRrRlNVc3ZxQjV6L2Rn?=
 =?utf-8?B?TUx2YTNSeGFzRHVvOVJGUnZYcEgvMWZRQ2pNSjJiUVpoRDB2N0tKYjU0U3p6?=
 =?utf-8?B?S2MzbG1pZDhrN011dDV5bjVZYWhpdkF4M3ZGcjQvQlZSZnB3UzZlaDBlekxq?=
 =?utf-8?B?N203Y2FRTUtKbTVsZHIrcDNzS1loekpxQmxOeUlZdHJWVWpFTlU1blI5ZUpx?=
 =?utf-8?B?eGpPaFllNERqVVRyZDFoa0J3cHBEOUg3L2xiYVFteEg0cE80UUpPQTFjeVZ3?=
 =?utf-8?B?RXdvL0puaGxXb0hwbkFVeHBjaHkvQ2llQjJKZmVvN3kwSGRIQ2kyRFNEc2c3?=
 =?utf-8?B?a29ZdDFjL1FKUnJwZGJkQU03dmR2diswZW9qS283MXl5M3lvWE5JYS9vdU9n?=
 =?utf-8?B?Nm84RTljRjd4M3FOVmM5d2txcVUzMjl2SUUzeDFQWlJUT3B6ZTdNaXVnWFFB?=
 =?utf-8?B?MjVBZTUvY0NDK0VNVlNKN2NzNWM2RzNoOEVDQ2FKTHdMR1diamRncE10cUhi?=
 =?utf-8?B?SmN3Y2xMVDFSRkQwdkVUeTkxWHdBVWxSY3Z4ZS9DR2RYVUM2ZmpYYW5QRVJS?=
 =?utf-8?B?d25sbEJiVExEL000ODNJUVZidldOSEVtS2VWVSs3YlZ4My8zeng5R3pxWS93?=
 =?utf-8?B?cWlPUTJsdW4zY0gxS3F2U3lFbUlxMGFkTlhEVFhZWjJKMUNvSUhJQkxVaWVo?=
 =?utf-8?B?YURBTGZMQ2FmS09qWjFqVHJXcGlvemlIYlh2eVlBdVViUTlBRDFUUkkxME5j?=
 =?utf-8?B?dmE3YndXeUc2d3VscFN6ZGtpMVVlRERpZDZUMzJHbmJwN3VXbFBPMXV4TTZ6?=
 =?utf-8?B?S2IvdG5Nd1R4ZC9FMTJRWVprWEcveTFYclVKMEVDM0wzamRMMGoxVEZoTTRp?=
 =?utf-8?B?aG1mZHRmeE8zTTBFU0FKQ0cxZko1NEJnanZiMi9rRVhRVGM3NnVLOUFxVXMx?=
 =?utf-8?B?ZkVWaHJlUjRnVUNvVnVqTG9Ga1dZWWU1NkpIRXh4dnhXdG1Ed055Rk9rZFd4?=
 =?utf-8?B?a3VKOElKY3BlWG13dHExVTRFdGVYUTdSaDhFSDJhclU5VDNHSGlydnJQTDRr?=
 =?utf-8?B?amd6NDJ3Znp0Z3RBanR5SWU4ZGk3WVNjUlFSejkzSWNNbUJYRVozeGd6bFlm?=
 =?utf-8?B?Z2k2ZmhoVHBVNlN2QXBkRzJBVi9oeVRrdk04dmFpY1hxYU50N3pEVmFqTjBX?=
 =?utf-8?B?YkxNR0JzUnRhQ0lCWlhtVERwb2NWVnpXS0JuK01SNlJlcGpQdDIvblc4WGEw?=
 =?utf-8?B?YjcrbUZvY1VmUmpGMWhSamN4YXNOUUh4OWs0UUx2OVRXZCticHMreTFGWmZN?=
 =?utf-8?B?YitKV2RqU2NzWmZTSVBKTUtra21iandpS3Q2RmRDb3NoNFFUMUVDZWtpWWU4?=
 =?utf-8?B?ZHVQSXNKTlBHQlpJSWpTWVlzUXJRQVUzZ2FXOVozbzdDaWRHOUEwZDhYOHhS?=
 =?utf-8?B?QWdXMTJjQ0krbGI5TTlwaE5KYUtpTWVlVGJOOWowWFkwNy9zdlFDR0p4ekRp?=
 =?utf-8?B?L0syeHpnQWNwb2JRdEpUakJGRGdZUUw3ajNSTk9heGVjN3ZHZmh0YldlM2V3?=
 =?utf-8?B?dmQybzhHcjMzSFVnamNTZ3dWRUtmeCtQNS9XREtjRTl4dXFLTzdnbGExS2FX?=
 =?utf-8?B?Qk9RM21hS0tlSS9vL256NWtXYVNZL0Zka1Q0RmdqQVpPbVJSOFRkcHNHc2Zh?=
 =?utf-8?B?S2VJOC9FeDc1TFpTTUpMRjhKbU9TR2M2cU82YUhxdFJ2QTU1OXlKanllN1dP?=
 =?utf-8?B?UGRlNkRYZVNxOE1ZcjZ3MksrUkdsRG9xVG5Gd3dLTjFydGhyMDZRcVgzemx1?=
 =?utf-8?B?VjVjUDM1bUNXVnlkNmRDbkljQllEOGVYMWhPNzNiRUJHdFVCeDhNNHVUVEtL?=
 =?utf-8?Q?Okt8kBnBm/XgcZR0=3D?=
X-Exchange-RoutingPolicyChecked: mpgbgPl1qMuhbQG08Feqg6FK3QOqsHNwUiiyGHPMPMd02qSY7plLBV52tDibdG+jnovD7ZhxZ2R9c07nfC4HRiHs7nkpv+b1XQkbKqWk0jfgfKCsTLNLjqychO5xB4ypdy9IvIL8A5YUfFFeqs8ysQZ0AnDvIaWYonwMc0LhGngzfkGOt27l2dvMWxJltHUg/TRhM/Tg0jQWueWusNRqVGqIAeoSl8WkdDhWy7SRc0cJvAD1qxW7ZjfRsSpElkgWFvOPvFmu4A9U/k4/yyDyA9xozYgsbJ2jZA/ThggyvcZN+vKWlDjL6h3iw9tEWC9Pxq3ztX/z055636q/Eh8skw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8850d1d5-1e40-484f-56df-08de99f85234
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:34:54.4888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyciVyhfoFR4RWo5RVGtC3aWedgwN1OUpQvuCGo3o0OewSYTsgj92SQhY9Xttxmu7QqP8lpFdKxvY7RhO1atHVUFLKrRG7rlfiXacGSWKHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5957
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

Hi Zbigniew,

[...]

>  static bool clear_test_result_directory(int dirfd)
>  {
> -	int i;
> +	int i, attdirfd;
> +	int ret = true;
>  
>  	for (i = 0; i < _F_LAST; i++) {
>  		if (remove_file(dirfd, filenames[i])) {
> @@ -1960,7 +2019,16 @@ static bool clear_test_result_directory(int dirfd)
>  		}
>  	}
>  
> -	return true;
> +	if ((attdirfd = openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> +		errf("Cannot open attachments directory\n");
> +		return false;
> +	}
> +
> +	ret = clear_attachments_dir_recursively(attdirfd);
> +	if (!ret)
> +		errf("Cannot clear attachments dir recursively\n");
> +
> +	return ret;
>  }
>  
>  static bool clear_old_results(char *path)
> @@ -2002,6 +2070,7 @@ static bool clear_old_results(char *path)
>  			close(dirfd);
>  			return false;
>  		}
> +
This is an unrelated newline, but I'd not block over it:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

>  		close(resdirfd);
>  		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
>  			errf("Warning: Result directory %s contains extra files\n",
> diff --git a/runner/executor.h b/runner/executor.h
> index 3b1cabcf55..bc6ac80dc4 100644
> --- a/runner/executor.h
> +++ b/runner/executor.h
> @@ -25,6 +25,8 @@ enum {
>  	_F_LAST,
>  };
>  
> +#define DIR_ATTACHMENTS "attachments"
> +
>  bool open_output_files(int dirfd, int *fds, bool write);
>  bool open_output_files_rdonly(int dirfd, int *fds);
>  void close_outputs(int *fds);
> -- 
> 2.43.0
> 

-- 
Best Regards,
Krzysztof
