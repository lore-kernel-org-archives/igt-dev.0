Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524B7CD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 11:49:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D5610ED5B;
	Wed,  6 May 2026 11:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="je0+Lvx5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A88E10ED53
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778068135; x=1809604135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eQaF3X1APYf0ib9S1T9MKZtLZnDbuaIz+awB8xve6do=;
 b=je0+Lvx56SeGq6DCQL27BBLJwiAEd0t4GBBRkFMDICTCbvvXTmyIlc6k
 HDyovxmUWns7+szBJMOuLD5LA5EOs36qPFxdNdPwjeQAa3f+df167ZlFO
 GPggf7JcIxVMg0h6Z7047YnTR+YokLsSAzSe8pS5RqrjL7NUuhd+SPGQM
 UY7vcmXZpiTaJVNSZsu8Yd1DoUlbZC29TcM29l2RrtX2kYrFoaE4xAZCl
 +f/ZReHY0zOhngsLPseZ5idpyXGglDu4dwC5Hz2mgWVC2H/CtO+IwxDQB
 l0LbnuhalUuEiySd/6YCvBQTyA4F/oQrhCAiNSvgsXzN95SW8S6Tq1w+U A==;
X-CSE-ConnectionGUID: YxVCowOWTWW031GFXBZF5g==
X-CSE-MsgGUID: VJRIPbx9RT65I8OrmmfASQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82608348"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="82608348"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:43:51 -0700
X-CSE-ConnectionGUID: NLNfEyFqSKGBL4Wpus3L8w==
X-CSE-MsgGUID: 6iXYRBcaRN6TLgjYImvulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="236224585"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 04:43:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:43:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 04:43:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 04:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0yamPPhSCNFTJ3AvhKu7avSjukjJD7SRpeE1w84kuXxYVrjWGltlPrNnaGPEn2pyi0ap/isM7vnaUlyXhiP6j0GBRhYl587k2t4JBqli9x3jpvfL7gp8vmmDFa5NkFi9EFnn4ZRFB60vYKaKNK8XofEsfsc5QjKtWfQ8eUgzgLZVuGb5ksCqr2gWQ5nF78PXHNdZf7x2kPwU6LNI27CU8RLj3vx9JFYwrRqzAyl8vQX0y22d30oFRPBlhvv1qCLkco4xFGxHiu3VRDCENQTFOdAf2DG+DrQDs42Vfb4UZKLamoOyjqAlwtLcjlifB6UMXtVAXMeyQOAg0YZJNgQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LARKcIW97Pv4xT5tyKnotJrF18QfgPnljz5Ysm76IWE=;
 b=TmUCHcmPw5HRfu7Lmtvm+yK4Z4JO78nuGvRecJrKzn/QxzEaG5ciKt1e0nrb+1KvkAnBvXPSqTeIWeb2zkBqWyM9jOmhErqKZwsjsXPMXWAwvgb8TemlRX0vHol7XylKCQqYUUbNQzaX/6e9m6ZLNzS0rz7NIn7IpPYDAIeZ12gdOvz83mTz58C0Q+Hf5qIZ/ZTjucdq7wfpqTMEL1YroSw6JlEcCYn16SNfUiPkmAU8Q6l92N6kXzwAGwRBSjCaTYqY2IZH44S4LorL6mQhiJ4ofaAV61UVC2hviRRLYR4ydkmzxJ1cTCXZUuDF6k++OsDFdgse/8QP88VVn9SV9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 11:43:46 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 11:43:46 +0000
Message-ID: <17d2434d-90e6-4824-87b6-bf9a3644a275@intel.com>
Date: Wed, 6 May 2026 17:13:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t][V2] tests/amdgpu: Add amd_hdr_visual for manual HDR
 verification
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>,
 <kamil.konieczny@linux.intel.com>, <jani.nikula@intel.com>, Wayne Lin
 <wayne.lin@amd.com>
References: <20260505205743.1839944-1-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260505205743.1839944-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0044.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::8) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2c2b85-df5d-4dc9-876a-08deab64bba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: rMXH/oQiI3TEJWCgWSqHAt3YW0+UxJHelLLZ6Rpb2G/8BQB0gDZXQ0dtw9fmS/VUPFKhuwQ5QWIrQhw2JKaPfH5VB6RYEhiMYHSI86H4n4xwEVG99kdCCAhZR8BMVaVx9DuMR7iKFt2LZwWBjcYQgOiNHaFxeHSAFvSdxekrIi4ADZescVAIMbYVrsiHCw/kXgFs6tS8//FP1BWdcmUTniYBaXizzTkejcmC8evHXzexblyfI/vHyEHlFo4ZXkSwwDm94ziQCEpLEq+esQxiZAASCl3VR7HDx6JwPdC2akdelqceGbzBkJr2xKa6TkiyJNS0SXJoPyFxdf5S2mLcjxNtGzA0PfPO9e+wroOgveYI80RkWOcxE1iBpDh683eAT4lSNnIqWdFmHuG5ghL+ErKH71LjxEAtvK4Y7kI9LawPBIZrIFyHaQwwbbvI1EzN7C+UYPcEOax4ZsSmo8RujEILfIzSWBfWGWKNEs0oKyQOny5pqfd4L0eVmCjTjvWZP09xgyVwyqHUAwrZi3L0h9WRiMuFyXnVLctxijCsVsvXbQp8hz4ySsA+nKyay+xSOijE1YyjdMP3jpvFUUSJPCQSeGYcKxjQMMeei9FxbAErcUfJKrrgutf/4dam5lqctYgGbhfTBIiX87EYTx9DiA0YYTNI/PrbB3Th9OS+QY2LuerINnvR3e+rBSzk5dPK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUdqMm9icWxVRVZOZ0F2amhnSTEvajg2RUJBRWNBMkRzc0J6ZysxR0lobUJo?=
 =?utf-8?B?cXAzemlvOXM0dElWOC9GczI3Q3ZlQjVNUHRiWDFpN0dZb0RJdWJveHRwamhT?=
 =?utf-8?B?d25lSTBXd2o2Q3NZa3Q1bUgyU1p5K1ZPVUN2U2I0dHFzWVp2U2ZzMm8vZ0Jh?=
 =?utf-8?B?YnA2S0xoWkVqNzRzdFFUbGU3UEZ3aDNPT3d6RGZsYitaYzJ6N3F6MlBpSkxj?=
 =?utf-8?B?eVpyZ2NWc1RCRmNQOGp2THIyejNnKzRZMGJjTEFqNnlZcVBqZmtpTFF1Z3J4?=
 =?utf-8?B?akhpb3c3Zjh2NUIyQjZBNmtpT0M0Rzl0bDhtNHhNQjB0WUYrdm5UYndXNE42?=
 =?utf-8?B?MmV3M1QwMGhZTTlLV1lCOTBIRkhKYU5qUi9xZ2Nybmphd1hvMXQveUZwSnZq?=
 =?utf-8?B?ajVoN0xLb2pkYUdJR0R2a3UzeTNhREN2eXBvYkZndllEV2N5Mk9pS3VXakx0?=
 =?utf-8?B?RmhISitSNE9MUk95SlZ2SmlWQ1ZRUitUcXJOTktwUkUxK0lVaHIwYnV5d3JP?=
 =?utf-8?B?WFBwKzVKYUlxZmplVFg3KzdCbXYramlqcGUrTnZNbEJBU1JIR041bU1xVEht?=
 =?utf-8?B?Rjg3cVlHRmtJYnFCaU1YM005aXBOc1BsZ1o3cHdiMm9jZXpRYmhwYWpMRExz?=
 =?utf-8?B?eWhVVXNYbytPNzlLV2pldlVudk00ZUxlODU3eEVuVm5QU2tGMWlQZEdoQzNE?=
 =?utf-8?B?dUI3eTFPSmNlREdlTlI3Y2gxTmdwdDgyWnRmdmFMK1JENHRuNmM2dVFvTUFi?=
 =?utf-8?B?QWlycnNXUk56ODhINlZ1NmdvNHh5RkYwYUk3NEdYNWdWcUZGQzhjWkJHTTlL?=
 =?utf-8?B?bGNtQWxXTzRka09iRW1FQjlhZllhQ0J0eDJkWnlNNDBDWEZZem5iYTZUNHhV?=
 =?utf-8?B?Z0cyY2x1OXZpT3BpQ01hMVZoTENFKzMzOFpKR0FZeVlxZ1A0ZkF2MThJdWEx?=
 =?utf-8?B?UmxBVEExVExjODgwOFlxUG9wb0xjTXYrblo2Y0x1cVZZT1hVN2MzMU1MOTZo?=
 =?utf-8?B?aURsdXB4dkVTMTY5dTJNQkphdC91cVFROE00TUlhcy9ic0tidnB0RzNMa3RQ?=
 =?utf-8?B?NW5VSzhRUzNUUjNBSlJ4VXRUV3FJa1dXZlpEZGEyY1l4VmZGR3hTaGtLNkNK?=
 =?utf-8?B?emFBQkZzRUZ6N2FkdXFrVVdtNkNYUWF3NS9UbHZ0L3hrb2lCRkE0dDdsVUt4?=
 =?utf-8?B?NURvQk1GMWlpV0xFRmZtV2NKa1dPWkcvWU5jUFhna2hLV2h1aFQrUkRXT05W?=
 =?utf-8?B?TnlZc3dCUnY1YXdCRU5mQTN3Vll1ZXdMenJObUFIVUI4MkdSOCtCcUhJNCs4?=
 =?utf-8?B?NmlQWmc4MFZQelJtTVNwTWNpRUV2QWE1Y01mU1grb0RWZnFqWWw3OU1UOWRP?=
 =?utf-8?B?aXA2MlBjOHpwS0NOcld1MExYZk9IYXoza0NZRXZuSnpzK1FLTjU5dlVzNzNH?=
 =?utf-8?B?cm80bWhqeVdValVpMERQYVZmc2hldWdIcGorcUdjOGhzN2l6eEFTazMwSzkw?=
 =?utf-8?B?dnc5R3lIdkxLK29zRWhjNjhQeWtUaG5GSGNwNFZXNDlKbGFNWnpDcWJvNVRz?=
 =?utf-8?B?TDlQcGNPY0l5UndCRk84OVJFRndmOC81Tll2NkRmc0xZSFdJbDUwK1BLM1ZI?=
 =?utf-8?B?RjRvaDNtTWJOY2did3ZxV3pSMHdQcFh6UmJNYU1RUC9GaGh6ZHcwNG5BK2tV?=
 =?utf-8?B?V0NlcXpmd09YU25kUHdaazlxWGY5WnNkM1paWGFtTXdyVVk3SmVBeW9nSTFR?=
 =?utf-8?B?QnVLRkNlZlRhY01FYWZUTmlWREl2OTNlRHJ1bkhDSVNsbjhoMmZoN0RTZERW?=
 =?utf-8?B?WVZYVElXQXRLRTUvTlBWenZIYm15dEZuYjdFMDNIL3JEOFk1MSthSzZMa3FG?=
 =?utf-8?B?QjFGRnNVcDR1cGlmYkxWRjlvdlU1SGZ3NG9UZHdPTUFhUjJuK2hkZ0RXKzRC?=
 =?utf-8?B?R3d0cjRQUklNNFNVM3dMcmdnaVRQOE9qUmgyRU80TVd0aVF1RHU1RlQ3QXlI?=
 =?utf-8?B?ajJZNUFCa2M3aldTNnFuQVhwVnYrUlcvWU1mc0JtTGlCcjdmcEJ5YURUc0dx?=
 =?utf-8?B?TXZFOGRseWVIek1iRHVQWURwRFRGTVlhbEJwdXMwNlROSjBKKzJ6T0gzcXlQ?=
 =?utf-8?B?L0c1R3k2RC95KzRqQU1qbmw2NmV4Y2ZRWmdUdm5SNldtQ2R3bVpuUkJzd3Y3?=
 =?utf-8?B?V1g2YzFESFpmTWpiQVFWcVdkc3lZbkJ5Q3lTOXdBYXhOemVSb0tUaXdUNjla?=
 =?utf-8?B?RXNlWG9ZZ2NVVXpsZzlYR0hmWUVIN0FxWURDVzVORWFVay9aY1ZNSEVMM2Y5?=
 =?utf-8?B?NEJwcHRML0I4UkJGb2FEM1hGaUlpNkRiMzUrcHVJRjhnVi8xcy9kWEk0Z09Y?=
 =?utf-8?Q?1dnHXn6f428KjWg0=3D?=
X-Exchange-RoutingPolicyChecked: GpQY29cVfFj/I/kVMpQVWjRG+R/mVHjIIry9RoAEzOzqNcKl0PduK2WOoW/llD2AgyAf9Nk0Dagsjx9xhSIhn1GZZ1twdNECVK5MX4iAOqZvKMen2hc9cb1XxeOO16wF9qLfdLvxyDNiyoO1UiDvY+KCqqjdYm6UG3NNCtS6sCWMJoNRhyLNhhiWeYT47QDkNFm7kzGGbfOZFTfHQnLT4ZP97kYGvh9rLzDn2FPIsbQKsAFONfO8sbuLkbtSzvkPwS5JKI/jb4gvI9x7hJJuUVxhtfFTw6ZEwFN/9xBXVvv1N6I0tkTdms/WCcnVKqW4XqWZCdk7RZbKOswUBkH4dg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2c2b85-df5d-4dc9-876a-08deab64bba6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 11:43:46.8031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpOoIFDcnWXeuQxPctdUk1chMGvHA61VacJDLVY25rxLqV8lz4hW0xbWiepbnDdACpR9fqXb8lz+mW0JjSYaxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
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

Hi Alex

Can't this be part of kms_hdr?

On 06-05-2026 02:27 am, Alex Hung wrote:
> From: Wayne Lin <wayne.lin@amd.com>
>
> Add a visual verification test for AMD HDR display output. This test
> displays HDR test patterns with different metadata types and waits for
> user confirmation, enabling manual inspection of HDR output quality.
>
> Subtests:
> - static-swap-smpte2084: Display with SMPTE ST2084 (PQ) HDR metadata
> - static-swap-traditional-sdr: Display with traditional SDR gamma metadata
>
> Co-developed-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> ---
>   tests/amdgpu/amd_hdr_visual.c | 176 ++++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build      |   7 ++
>   2 files changed, 183 insertions(+)
>   create mode 100644 tests/amdgpu/amd_hdr_visual.c
>
> diff --git a/tests/amdgpu/amd_hdr_visual.c b/tests/amdgpu/amd_hdr_visual.c
> new file mode 100644
> index 000000000..63eed937c
> --- /dev/null
> +++ b/tests/amdgpu/amd_hdr_visual.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#include "igt.h"
> +#include "igt_hdr.h"
> +
> +/**
> + * TEST: AMD manual HDR visual tests
> + * Description: Test HDR metadata interfaces by showing visual HDR patterns
> + * Driver requirement: amdgpu
> + * Mega-feature: Display
> + * Sub-category: HDR
> + *
> + * SUBTEST: static-swap-smpte2084
> + * Description: Show a visual HDR pattern with SMPTE ST2084 metadata and
> + * require user confirmation.
> + *
> + * SUBTEST: static-swap-traditional-sdr
> + * Description: Show a visual HDR pattern with traditional SDR gamma metadata
> + * and require user confirmation.
> + */
> +IGT_TEST_DESCRIPTION("Test HDR output metadata visual verification");
> +
> +/* Common test data. */
> +typedef struct data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	drmModeModeInfo *mode;
> +	int fd;
> +	int w;
> +	int h;
> +} data_t;
> +
> +/* Fills the FB with a test HDR pattern. */
> +static void draw_hdr_pattern(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +
> +	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
> +	igt_paint_test_pattern(cr, fb->width, fb->height);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +/* Prepare test data. */
> +static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	data->crtc = crtc;
> +	igt_assert(data->crtc);
> +
> +	igt_display_reset(display);
> +
> +	data->output = output;
> +	igt_assert(data->output);
> +
> +	data->mode = igt_output_get_mode(data->output);
> +	igt_assert(data->mode);
> +
> +	data->primary =
> +		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_output_set_crtc(data->output, crtc);
> +
> +	data->w = data->mode->hdisplay;
> +	data->h = data->mode->vdisplay;
> +}
> +
> +/* Returns true if an output supports max bpc property. */
> +static bool has_max_bpc(igt_output_t *output)
> +{
> +	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
> +	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
> +}
> +
> +static void test_static_swap(data_t *data,
> +			     void (*fill_metadata)(struct hdr_output_metadata *),
> +			     const char *mode_name)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	igt_fb_t afb;
> +	int afb_id;
> +	bool found = false;
> +	struct hdr_output_metadata hdr;
> +
> +	for_each_connected_output(display, output) {
> +		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
> +			igt_info("%s connector not found with HDR metadata/max_bpc connector property\n", output->name);
> +			continue;
> +		}
> +
> +		if (!igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("Panel attached via %s connector is non-HDR\n", output->name);
> +			continue;
> +		}
> +
> +		for_each_crtc(display, crtc) {
> +			if (!igt_crtc_connector_valid(crtc, output))
> +				continue;
> +
> +			prepare_test(data, output, crtc);
> +
> +			/* 10-bit formats are slow, so limit the size. */
> +			afb_id = igt_create_fb(data->fd, 512, 512,
> +					       DRM_FORMAT_XRGB2101010, 0, &afb);
> +			igt_assert(afb_id);
> +
> +			draw_hdr_pattern(&afb);
> +
> +			/* Start in the specified HDR mode. */
> +			igt_plane_set_fb(data->primary, &afb);
> +			igt_plane_set_size(data->primary, data->w, data->h);
> +			fill_metadata(&hdr);
> +			igt_hdr_set_metadata(data->output, &hdr);
> +			igt_output_set_prop_value(data->output,
> +						  IGT_CONNECTOR_MAX_BPC, 10);
> +			igt_display_commit_atomic(display,
> +						  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						  NULL);
> +
> +			igt_info("wait %s!\n", mode_name);
> +			igt_debug_wait_for_keypress(mode_name);
> +
> +			/* Exit HDR mode and enter 8bpc, cleanup. */
> +			igt_hdr_set_metadata(data->output, NULL);
> +			igt_output_set_prop_value(data->output,
> +						  IGT_CONNECTOR_MAX_BPC, 8);
> +			igt_display_commit_atomic(display,
> +						  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						  NULL);
> +
> +			igt_display_reset(display);
> +			igt_remove_fb(data->fd, &afb);
> +
> +			found = true;
> +			break;
> +		}
> +	}
> +
> +	igt_require_f(found, "No connector found with HDR metadata/max_bpc connector property (or) panel is non-HDR\n");
> +}
> +
> +int igt_main()
> +{
> +	data_t data = { 0 };
> +
> +	igt_fixture() {
> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
> +
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Tests swapping to SMPTE ST2084 HDR metadata");
> +	igt_subtest("static-swap-smpte2084")
> +		test_static_swap(&data, igt_hdr_fill_st2084, "smpte2084");
> +
> +	igt_describe("Tests swapping to traditional SDR gamma HDR metadata");
> +	igt_subtest("static-swap-traditional-sdr")
> +		test_static_swap(&data, igt_hdr_fill_sdr, "traditional-sdr");
> +
> +	igt_fixture() {
> +		igt_display_fini(&data.display);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index d5a4820e3..7db1e2d9e 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -90,3 +90,10 @@ foreach prog : amdgpu_progs
>   				       install : true)
>   	test_list += join_paths('amdgpu', prog)
>   endforeach
> +
> +test_executables += executable('amd_hdr_visual', 'amd_hdr_visual.c',
> +			       dependencies : test_deps,
> +			       install_dir : amdgpudir,
> +			       install_rpath : amdgpudir_rpathdir,
> +			       install : true)
> +test_list += join_paths('amdgpu', 'amd_hdr_visual')
> --
> 2.43.0
>
