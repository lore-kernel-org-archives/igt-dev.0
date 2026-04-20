Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122C2F55808
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 10:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4FA10E4B2;
	Mon, 20 Apr 2026 10:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApTioRl5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D56B10E18E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776680892; x=1808216892;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ey5e0FHik4AMPbY+opIVofUc7+q7nwNAvKu9nUDX4Vw=;
 b=ApTioRl5X+yyHK4C6QRpMDYuYQKTRsYdHp01SZiB8f/bZLTQqNDZjU2d
 GUoLabIzif2iOdcnWuLbjd7eCjuFblBUC2fqwtwZVqC9gqFJ2WEF6tZwV
 EqDtNMmVdzpOaFeT9JzhosG2ezOtL2Vuh/GcBP3s92iYzIDncL2qgNFkm
 HAZRN97uu4Br6Gq4iAOTFJrGIij80w8O+1IWMPhj3rBtTpgw0mi8+phsn
 PCxqsELMnSbiTPyOVCXrsYQv6KrvHBWjPq0WrFchas1bzGbnXhXzrvWIC
 o0WDVRlHeYQrRe8XrWPVOiNO8Q+svkLW2tzeCoINiHbrECTNWnyDJyvgv g==;
X-CSE-ConnectionGUID: YCMhDOjfTBWsg5WhApKpMQ==
X-CSE-MsgGUID: 4TUKgkL9Q/Ob1B5AyBj19Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77507701"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77507701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 03:28:11 -0700
X-CSE-ConnectionGUID: sP3wUOAITPiV+q7+AOMJzQ==
X-CSE-MsgGUID: sFETXBTvQr6Vsw9ZfnDpaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="227346796"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 03:28:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 03:28:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 03:28:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 03:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dr1wl1CWOSAkeOmQhreTJcxp87pvaBoO/T73GmzhioKHuJguuFSpbZ7wWhIgsPWg2OiYReeFW3CQeqRjs49JwgUzj5HEkMMRtQV1m5vooVGPwMyvUWARCijQm1+xyvKzMWuisTWAZsD361LFGQ1aEdOd+RKsNg+9hgwyMs0VNCfXzJZl8LYkeXtu4KOCfAYeQGCHCz/qmTMudGqdKTN1/oJ8N3daFu/4CV3oJP5lUGuJ4kVFCS9HLw5G5Ns4l8jo4GmDr+qmEWOxflU4feTQ2Eo3ByntkEorbq/KCifvLLeMEidgIVzxBAM0ujwYgYz5XFpXgarbK6WqB4eqX+6dRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4Wg2YWosON1ZIZnKS3/4Fin2qKVvp8NLkXAUoCy0Is=;
 b=NvKRlTHWZZ70EEVJWUTeddKpHXoLGdWay9HR8cpbWDzp2TLiT8MEZ7lgFj4gTeBy5NhBqIhxXJ4c9kA6j9qW+Nv6zqHVmiwszxznc1PbgxcB/QKkVjFRofTtgXOvPzFEqtAl6f0OriRf/RkOMPSSHlSeR2tmHKkDdgG5j3Te/mk+GaQAl+/8bTcPYLo4rD/uG9H56j3OaIxkJxbKeq61d0QUxSe9GP8CfF+5hZywz434Du1BCW72ass79AhsKylx6TllF4d/+MgszZthpHnw/HOCJlu+iraVvd1VcFGhQyCgzkWPvGt7b+g+xNmMYSRXqr0Vry4rZJ/Kw4/LAcQG0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB6877.namprd11.prod.outlook.com (2603:10b6:510:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 10:28:04 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 10:28:04 +0000
Message-ID: <ce96730f-d6f2-4169-a90f-0008ff1ce60c@intel.com>
Date: Mon, 20 Apr 2026 15:57:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_madvise: Fix armhf compilation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Arvind Yadav <arvind.yadav@intel.com>, Nishit Sharma
 <nishit.sharma@intel.com>, =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
References: <20260417181157.177299-1-kamil.konieczny@linux.intel.com>
 <20260417181157.177299-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260417181157.177299-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0252.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: aec2f016-ce40-497e-10c4-08de9ec7818b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Aw20pl7WUY7Q535L25Ce4PQMD3Ca3aInYPKPMyZKS+zkBxeCEu4tKGLKxZoEhPBbkZ2izsq3F35AIJV6wxu83MxwITMlbbroGh4agMfcxVCiY6JSBHSMh681FwS4GMrSjeHSJgi0XrhUQrOSb7Z+W416+ycgp2l+7GlZHcofmDu10mG8MHdN84lniVEFy4Pc2sYuGunqyrZIkFQDNEPlSrUQ9rUrmsTojlf5FfUYqKcRjv+6pZCQ22eDLpZEnAlcvrLt3mYxYHsu0CA6a4CfT9zxlPifyjVja9YB1u7vlgLaBTvXM3D4nhYnpB0Io0ndEKU7We8+Plp6csYXE9pg3qrg3fOVliEO1GPBL7nrSS+g9NQV6ohn7Sk/HsXVo6WmJwhmvjes/9uGg/pdgy8Y/cvTLwnQSFlrgQJ01wzIAAu8ADPcJQZUutKym4RDB4nulaXgYjztLNRuntH2oDj5fJMXB5DBMKVBasVDCXMuRP0uWK747zMIpNimxJ48lfYXsrkt0HY+SLSnZs/EI+Q3ILYj3ia8GlWp0QBCcY3h2JsULjkScnVYf/nnPe6PBQBEqrFtvyS+4wPVmEYNFX9v1y5K0EXnvv9pYKsPDE8cQ358eHR8lF6A9o2YyYCCKUvWsB/Lazf0Fhe5aVkjgum/IGmAznMG0+9u/RTXZIf4nftcccBYcjmpgiEdGw70o+2QadHevGyRkLzTSXIYEV7qNAem+AzWBpE631i/q9JAKVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHZVV3lVY0ttU2NhUUxucE1ueTBXVGFZWWI1L2pObzFRVDVGazNnV0lJTW5o?=
 =?utf-8?B?dkVHZ0V1bXJYUjl3MHZza0swdkxkalRTYlEzbEM3eGU3WlhQZW82OUVNN2NV?=
 =?utf-8?B?cG9NdjFsd3NoSGZiRE1zV3dEd1NjSG5vc2FYSzhsSjN6YlorK2hwRTdNeTF0?=
 =?utf-8?B?QUtmemFrZW1PZmNQYUtVUVkyWWYvWitPVkNWQ2JBczRNM2EwSEZJRm5DSzh4?=
 =?utf-8?B?TWNiZTFQelowek9SMjdjNDRwVDZYRXVDODIyNCtjSHNEM1c5MWVWZHZDMFhC?=
 =?utf-8?B?S3J4YUIvSjdRVDlDa2FjK240YjJCSXdSRW5RV0d0c3Brc2dSNkVvcjU3Z1NP?=
 =?utf-8?B?ZVJKTm9xTmNxK1lIaTc5TEhiR082ZDdCSElPQThkN1lqUmg3ajlQbWh4Y1dE?=
 =?utf-8?B?bGt4ckpJN3VYQ0VLYjByUEpTenpTcGNZN0VWV1U4LzJtcjJBNHZuaHRGcURz?=
 =?utf-8?B?WEd0cHFMMm4wRjdhQytoSStFbHBCZWgrQlhvTDVzdHJyRzNFVDNlWkh5SVQ3?=
 =?utf-8?B?RmsxK3EvMDdreXdzdHRYYXhmdjVVUmF3b0NZQlVySE9KcjR0T0hnaDBaR2hL?=
 =?utf-8?B?L2NVdDJSV2xwb1phOGtCQ1dUR2V2Y25vd2h0LzB4NGxLRUZqZDJ4aUM0Rmp0?=
 =?utf-8?B?NFpmVi9qS0Y4ejNFTVNOVDd0ZHFNdjN3bDlYQ1pKakxsS21HSlZmTGVuZTJW?=
 =?utf-8?B?bVg4eERBL1hoam90OXZ1SDI0OGVmNmRhL0RYa09VSTkrbVNKRG0rUGRsTWlV?=
 =?utf-8?B?SmZ0UzJXVzI2VEFzL1h3UmxScU1uRWZUY1R1eHVNMjYreTZXbmY3SmdXVHo4?=
 =?utf-8?B?VXpZSVY4RlE3THlTWVFoWmlBbGgzZXRLSmN0L2R6SWltYkRrMGpOVUhySVdY?=
 =?utf-8?B?YzE3UjJzbTJqYTM4Vk1qSTV1R092OFZ5MllSZ3FIWFlFSFBiVlY3clYzdjlj?=
 =?utf-8?B?M1R2bVNCOXk4WkdkZ1RCNEExSnpxekQyamJHL09sN0hMVDhjOXNXVmRRVWk4?=
 =?utf-8?B?RmFHbG0vTFNONi9rcjUrdVhkRW1ZMGgzVlIzaEV4N09iN3BZc3o2K3ZrdHR5?=
 =?utf-8?B?K2RFSlJGa3A4Ui9yWGNoL296REZsTVhFaEdoZFIyYktoMVlyY2FxblhmODJJ?=
 =?utf-8?B?YTJ6U0VXa3I3bFV4T2ZBM1ozRGRYY3FzRUJBQ3ZCSkRGVkpWSVk2N1Baa3lZ?=
 =?utf-8?B?QW9ER0xTTjdteHJ4eS9XekRuUWJGVDVBWFpQQSt1NmdUeW1RdnJscTdMWDcz?=
 =?utf-8?B?WXVEWVNzbVdFT0ZuSjRIUWp1TFIya0wzdEN4RlFzM2liYnd3VGtYMjJ5MEQ5?=
 =?utf-8?B?UkE0WE13VytUWjB5QnNncVk1U2ZmRkc1L0V1RE9Xc3lLSklyd2VFQU9ZVXRm?=
 =?utf-8?B?Smc5TFlaL1hKY29ZRVIvaHByVFFVZmhzWGFQT1NTeXZiUm1GdjFpaFQ4OVF4?=
 =?utf-8?B?b0J1N0EzTWdHdWpsaHJWWGFzQTlucTEzczNNNXUrQUdJaDh0RFBJdVloQ2VD?=
 =?utf-8?B?cFF3MmF5K1RJREpPMDJueHY1R29MYUxQSDYzQmxJTC9xTTF5azhXd2gxRnhm?=
 =?utf-8?B?Y3MwY0h0SFBhK0VCbHRWdmNyc3I3ZGN6SmZTeGpZTmhMM1BvdTVqT3grRVNJ?=
 =?utf-8?B?bSs4L2Z6YmFwL213MUlISHlMKzYzRUtld0hpbmpDaWk0VlhRVWpSeEM5RnRT?=
 =?utf-8?B?NllEMVBVaU8xRTVxTzI0aHRuTUdqencxZGs5RC9GN0FDTjZmdVRNMUZGZm5o?=
 =?utf-8?B?M1lGVWFYZThYK0pwWDJhR2JRbVJPMitHZ2F4TWsrMVEyb2JLOS9aVkVma1ND?=
 =?utf-8?B?UVAxV09RaUY2a3pUS2dlUUowS2JKNkIzaWZWdnhybHRIMG4xYlRnQjErL2lz?=
 =?utf-8?B?WUlnbE9xMHdNcXpCb0tBbXlsam1lUVhialYrbngzdmltT1RldGg3Qkx5dGRm?=
 =?utf-8?B?STJJSC9WL25MVE9YSncxVExnQ0hFeWs2YTJCZEpGZGN0aU5oK3pCTlF2RzBp?=
 =?utf-8?B?Y0pLTm5EY0JvdGFIclhJZFBtc3dyaXVlNHR1TDV0cERmUy9BbElPa2luMExM?=
 =?utf-8?B?b0N5T2lvYmFWYkNnMmRicnRjOGVkQ0lmRzlmalJTWVcxWkNiV2JGcXNJT3dk?=
 =?utf-8?B?dElibVBTOU5hak1sYWNOR3FMcWt6OVY3SUYxOHlFcGtJVFB2aHZkZGljT2kr?=
 =?utf-8?B?aFFramhKTytQMTRyRVY3d3ZzZllleW1qdW5yWHE3dldFWGR1UHBQeHFWbEZz?=
 =?utf-8?B?QVZDMFhkYzdEY1JHMEtvL042L1ZEWmNKZUo0Slo5VEN0RVVCbmJOQTdZQ3Zw?=
 =?utf-8?B?NS9CT2JRajhxMEpMbnRydFNuNmxaOU92WWdyY3ZEdHJ3OGtiempkQT09?=
X-Exchange-RoutingPolicyChecked: CIWQiV3DsS+0s1rwavApzSJK4poCXOowXv7BWDC2eFxKoG1Vs/r9t9bk6UgzSQTRrQRmmV5+Ga27Z2O+LMxRyeDZfIVQb0EB/bzpLEzD9RqT0bywMxP0fQkAI4i/Cbq4qXrsOPAtDOc6JhUZISlbNhB4vLPbzl0+RW67vyUwROYb5Rf+ecF6F/fPkPrELvD36XOIVyjRx8HlIdQGsiU1W5OVZXl3L+3TpHsILzyDget42X/OKp1shhui7z5wZ6BZ8TIyBij7/CSP21nLGbb9QUK57paMk6n1oZoTPLvn2Mrl5fAuTYzR3ilpS7ytCqo1qbBquAkzQBB7EmT2NtEEaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: aec2f016-ce40-497e-10c4-08de9ec7818b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 10:28:04.3700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoNJEpBy9Oq5UUmCvNaF2O91tGUSMEsS5h+IBmtDMEDb7/21+9SUhVYRy8P7l8g3PjSQYwkVn+XKub3INd1nig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
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


On 4/17/2026 11:41 PM, Kamil Konieczny wrote:
> There are a compiler errors on armhf, related to a cast from pointer
> to uint64_t:
>
> ../tests/intel/xe_madvise.c:201:20: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>    201 |  igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
>        |                    ^
>
> Fix it by using igt_assert_eq_ptr() macro.
>
> Cc: Arvind Yadav <arvind.yadav@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Fixes: 42d669fde782 ("tests/intel/xe_madvise: Add purged-mmap-blocked subtest")
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/xe_madvise.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 805de793a..e9bf55ff5 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -198,7 +198,7 @@ static void test_purged_mmap_blocked(int fd)
>   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
>   
>   	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> -	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert_eq_ptr(ptr, MAP_FAILED);
>   	igt_assert_eq(errno, EINVAL);
>   
>   	gem_close(fd, bo);
> @@ -340,7 +340,7 @@ static void test_dontneed_before_mmap(int fd)
>   
>   	/* mmap() on a DONTNEED BO must fail with EBUSY. */
>   	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> -	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert_eq_ptr(ptr, MAP_FAILED);
>   	igt_assert_eq(errno, EBUSY);
>   
>   	/* Restore to WILLNEED before cleanup */
