Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACD0FB5177
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3731910E2E2;
	Mon,  6 Apr 2026 22:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heoc2Szb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5F710E2EC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514856; x=1807050856;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=91n59r2mMUkLXzYF1i0vNMuUsEoGR/rRAqH2h/RO8Zo=;
 b=heoc2SzbFmcLuQggz1ZLp0ErhCrjoV5WBzUEzSoRPGOijVRw5Ht09EGo
 FFBDA6iikXmV0RlRQ4z2WrU8II/0W13l0EVti0saU+aaQ7biCdSwazvlb
 rwlYFO9m8Kfz6G7QJhNmtKlKyGJnNF+bR1rdEyFhnckrmODZRQTOO8Ret
 Fwqlose9yWmnErfgEgIlJwRgt8dDN117nxsvfmvzGGaD11ISrHn/a3M9E
 wB7m8yBMKI69tNMb565XbXw2cWjPZ3qlVq4hGrVWUIOEws5n7HGCYeCoZ
 a9egHysbrlNrxD+x2vUn9+FwLn7ACJnIFawHP9y0IvS/4fMZFXwN18NhL g==;
X-CSE-ConnectionGUID: 94BDLwf3QtGVTfuK0CZ3Aw==
X-CSE-MsgGUID: 7C9vOPEpTiuLYaG8r/uzoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="79061590"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="79061590"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:34:16 -0700
X-CSE-ConnectionGUID: JjsD0G1cS0GbkTiajoPVzA==
X-CSE-MsgGUID: Pc3GNuCTRL2YdA9CVFCEhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="232042872"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:34:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:34:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 15:34:15 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:34:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k42PolfitF+6SfALRfH7RkIKb7SaQt/DOpVy2IUnWUdWoIABgE5FOCWa41/T580Sp1WdXGM7co2cO4yiBN1M9glH5bMROjsTBPVaxaQYvak7Q5Si7kXG5xfqCYzxfk5efcL1NRowO3dbA7jxWh8aXv1a5A3akln6vt13iU2zwmlFfUDXaMEo5+xCcT84IZ24IDabp2oQtuvqpNQhIDW6h9Mx1AJry06B+Sy8eNiojIJzga9gMIgwYrj8uVaIRiVU906xms8Uwg5BqMkWYo8qPPAM0LgiIOallPR/0eJzjY+C1fR5AQN/Kac4az9fSv1DIfmyrs11Br0zzM1UgzfQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uw/3wTsTojZ4iWCK6gabfpkXPNRpCjxDcCgm4oVRtU=;
 b=m9e0X71tsDjgTK7IF9z9C9fSz0Ta+0RHse0rv9ijhpeSmjF7N2oC7UU2GF/+wp4uV3Rr6GpGbhCuiPuuUiLz6UHBRz6bSiDsekL+V7xqjUJjE+LjYtkm6MhZGWhKSnMx6sXShGr15iUxwZcoIfusu2z3yottrQN+AQM+bZWYaMtG84dva3zAtGJIZYAnEczCO/D65hs041SgQg9bmM7liCsmLzUrggCXY1xTjAFr96dXEytt/PWJOd1kLnjhT8AoNICiUHB2LXdy+BzCEndfiTr7VyLl3r9hNJNSxgdonenWhS1ROE71bNp5r1fzNXURqGDNDJx34aw8AAK7WaaWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by PH7PR11MB7100.namprd11.prod.outlook.com (2603:10b6:510:20f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Mon, 6 Apr
 2026 22:34:11 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 22:34:11 +0000
Message-ID: <10acd127-00fa-4f3d-8b7e-7b1e9b1b2005@intel.com>
Date: Mon, 6 Apr 2026 15:34:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,3/4] lib/xe: use debugfs info to implement
 xe_engine_class_supports_multi_queue()
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260403071322.366766-4-x.wang@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20260403071322.366766-4-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0167.namprd03.prod.outlook.com
 (2603:10b6:303:8d::22) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|PH7PR11MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a8671d-9a14-465e-3dce-08de942c9fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 6igCRBslRMW9+ZcwiH5+1ZW6pJqOw/RTfA/HvB9lr9NDWb2ug8dWNvgWy4Kv9uYN12pdRBumbkjT5a6T/GzjjO48v3e/UxyABCfEg6KNZJ8xtNNGBR6ncH4zBXr9/NhrvgqoXrtNaN3iqZV7VctuNvKkyNpPsrfpA40SpGxAGhikPM3snMbDc5NV0o9Qtd5ysuinRoqBZXqtxstmHEECg6cxI64TLYHNN0p4wR7y19j2q6iVF0zuYM6+hLNzouKDx+peXETs0NPii4U3xTXsfaWFBzst4JqNphF8s6WyV4hhuganut01YeMpieQgYE28Q/dCLVlmhxZUos8bzgtGJqeu0hQ4TKnGJ4h/GNXaY1CSfwAe0tHVVnhAJ9dIvWLQvggBooNi0/YEh2gWZdDR1rgJ8E7LMGojFA6wBTlp6zsyHCHFTAXWEEmVR3nkyhlhLedUrRBnotV1L3txXpEe6bD++r44NJr+H3KHXforLAcWH3dMNhl846h7Y2De3I0V95OapzbZK1sGxVSNOWm0dn7+5UgZswkVa1ODwJWb25e77WzDd8v3JylK01VCQ9GhNbRkaTFDuOxB9+6duC0d8FYGQo6nyg/4rqTgN+MG/qgcHjyuEYOsy5KACFaRCiKsXgeFwBsMWT+deMqB72RO1WdofL3DYvux+T0ItbLShUVhsl2K0d2VL5sDitPte/S7qnEiycKokU/D7BTkB6g8UZVI/WlHTPKJnnRYUB/7jhI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFB5cE1rM1lvZ01CQ3Jwd2NHQjNuZzRWTnlZWkRmQXEra2k0T2FuYU5wWkFx?=
 =?utf-8?B?N2xzZVRMTGllbGJ3cnFaMXRIZnU1VGxBY3k1eDZ0T2Q0dHZPZFNMcVcveEIw?=
 =?utf-8?B?NVhoK1dXYlFPM1RoNVc1K0pHbFlRZzNySExzWDlGNWdKUFM5QWNqYk4wS0tw?=
 =?utf-8?B?WTlabjNNbXFLY3U1T3RKZmk4ZFlhTllWMEhVcitxVDdhMStLa2RyczROVXZq?=
 =?utf-8?B?UXVTNUNaanMxSXIvcnJveG1sM2ZGbHJxbXFIcVVvRWdsVHdjK0E4b2RqaEdU?=
 =?utf-8?B?Uis1ZXNERkw4VzZ2NVpZUnNZWjVWNFlNUmgvcVp2TEEzcEVUUkh3NVBVWVRT?=
 =?utf-8?B?UjQzS1JuL2I0c0tzZktzSzVtMGp1Szd5OGtxUkM3Vm8yd3AvbmNFTGlyV3Fa?=
 =?utf-8?B?R1AzRWZ4Z2FoTTcrWGN6Rjgxb01mZmNvLysxeXQyempEMWIvVVFiaWFNK1px?=
 =?utf-8?B?OENkRnpIVWpFNC83S0NTUmJtcWVJc1hsRlJXVHU4bmdMZi9lL3N0OG5VU0xy?=
 =?utf-8?B?aVJpV2kwRDQwcE1WRHJCZkVMalhnMGc1Q1J0TU5vNGlXeXdDUWNyaWs3ZkUz?=
 =?utf-8?B?SEs0am1qYXBsdzM1VVM3VjJMYVE3SFkwelN5V1ljcG9kTDYyaXYxbTdXY0tj?=
 =?utf-8?B?enU5OFNyZmgwMDJ4S3VwY1RoalYyVjRiZVo1MzV2eG9LZ044WG9uOVAxaVNG?=
 =?utf-8?B?L2hhRys0cnRBY2o4MEJ5RURSb1dnbTByKzR4OUg4RGp0a0wwd1VxWHBYNllV?=
 =?utf-8?B?N0U0cTJOMEtjN0YraVB5cjdtRFNSSDBHcjF0UEFEakxza04xZytvalNXNVRu?=
 =?utf-8?B?RWNiWmVicTRDajRHUG5BR29mdDN4TldrQUxEQU1FSDlyUDRCRUptV3ovemhC?=
 =?utf-8?B?UThwZDhWbVVmTEZqNUxIN1k1UGNpWEhIU1QwSkxJNnB1d0RHQ201K21GUE8z?=
 =?utf-8?B?MmtXd29PNTlRVysyQjU3QXpTbTFKbGNnV3NGQ1RDL0RRc1FPcmh5RzJvTkRz?=
 =?utf-8?B?RGU5YzdVN2RiN0FHc0h6NWZFbVo3bmJlclRwRVFTMTVLOHd3dHZzQVBWY3Ey?=
 =?utf-8?B?ZEJzYVlaQVIreHpmODRvNW4xK0xDMlNJYWxKZ3ZsVU5UMWliQkM0emJweTZL?=
 =?utf-8?B?Z09GRjMySnAwQUdlSHBXdGlYQTZscFVaS3ZRRlg3Mkl3MUdjdDR0dDBUbThF?=
 =?utf-8?B?RFQwNmdxeGp1R29vSjM2UE9Zakd4OHk4ZTQ1elJramdSTlZtVkpWOGlLV21Z?=
 =?utf-8?B?SUltQnFQdENYTXd2K29tMXI4aGNXV0dIWDA4cVdIL3AvUTV0RHMyNVc0NjlX?=
 =?utf-8?B?R3lNK3VoK0liTFBTRFhDYjIzWko4VUE3VVhuTDFkdkxpY2ZUS3RuL3hDYkND?=
 =?utf-8?B?Smg4T2kzZnZyeUJsbG95N1NGakdHaExmekx2aU1GaFRMSWdjSkVoSmZBY3hV?=
 =?utf-8?B?ZCtnaEgwT2pYWXNKMHFWc2dIbHk4dCt3QVd3QVZ4S1V1c3V4S2JuOWErOXl6?=
 =?utf-8?B?OThITG5EQWtjeTdOQ2QyT3ZGaEhGUDhpb0hhTnk3NTRJRWVJRFZXUmQ4TXZK?=
 =?utf-8?B?VXBRYlVGRHE2cUcyd25nb0ZHTlVsMHNPeHlkQ3RQd1VSNWZ1YjdWY1RrVUky?=
 =?utf-8?B?Wmxwd0FaODYvRFE0c2ZBOG9WN1pFamVLS3F4eUJLTThkbkpWUEprbC8rcEt0?=
 =?utf-8?B?WFpDaXBPR255VS9vNjlGUGMyWHNRK2d4dGd6cHZRaVIvM0MwcTBjZ2F6TTJG?=
 =?utf-8?B?WmRyYWhDNzVKTWZVaTIyRXVUOHBZY2dCMENMT1FibTRNM2dEZDJYYlZ6WHM1?=
 =?utf-8?B?SEZEOXlyZitvMHhVRmpuaGpnYjFpZ1RVZGlNOWo5SWFKRWM4VTMzcDA3RWFP?=
 =?utf-8?B?NWFQdEpMKzFYZzJ3SjNKNnZaRkwwVUswMWhsZVJDWXVhUllwTFdsVU8vcU80?=
 =?utf-8?B?Mnl0WTBIV0ZPbUdHMG5lcFA3QkdxdVd2QkIrMkcyWitveVFJSjdPd0NvcEh3?=
 =?utf-8?B?N3YwOEdDaE41MHJ6Sk05TnVBQ2VndDlLeHZiNUNlcjBHSHlmTHVnOE50YnpS?=
 =?utf-8?B?UHVkbU5zQzN2Nzg1Vkl2RDRFUStYZ0p6eXVwd1UvUC9QVk9EY2hsekowUXVD?=
 =?utf-8?B?eUd3eWoxYTlVd2xzVFA3ZTNwSlR2dHNXRjB1Mzg0Q3pyRnN2RU1ueTJWazFB?=
 =?utf-8?B?eEgwQnQ5SU1aWDBPRjJQSHRtVklTNzFaNlNRK094NkxKZy93RTlFMVdmU3FH?=
 =?utf-8?B?QkVyZFU0UEFpYzJ3UUN6anRJbzA0OHRMMjFDeUVybjYwQWQzc3c5by9FbnN5?=
 =?utf-8?B?Y1BNOW1scERHcHZBYXlTbmhwbTJlWm9vaHBHWVR0dW4zT1ZhK3FLaU04L1Bh?=
 =?utf-8?Q?Kjt6P8FcIwYpIGiM=3D?=
X-Exchange-RoutingPolicyChecked: TF/P+8TDswJlRORbuhVKWIkEhzSRVQHKOIcjvboksCZ6uYjaCknISdQ/Hyn2C1gcTp3wdl0fBiEw02xL9BlLDysv+8tIL1tuMNw+ahwHkBQVbiwL+Ta+9q1whzdBSvBv3Mvu7wHjkGu8Pg7NpjaTLPlj7Loj5kGgnjOt/tf3CCf6uUq8k/35NMtI+25zdwx6h12Iyrs0tfDvpXUIN8A64E9LazCW6enBAH02DGH5wTdVW2HBsm6ub2/oyKO4XGQ9VNrE9L0PZxlY78XVEDcHzY6aws/vYSlUNtGgI6SF3XDeP2k9LRVU4kKr9z/eCOxRRIf5Ze7KwFlvmE3JQZrVWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a8671d-9a14-465e-3dce-08de942c9fa0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 22:34:11.2418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0bOtMwPYc7A/ANlyRsJ+ed4fyZGjSrkDWIn6SBrYpRd491oLpz2Wj367+mqa6E9xby67FD6AxrxhQQjWqumMLjPsfBPYgSoxIbaUiph6/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7100
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


On 4/3/2026 12:13 AM, Xin Wang wrote:
> Update xe_engine_class_supports_multi_queue() to take a device fd and
> use the kernel-reported multi_queue_engine_classes bitmask from debugfs
> when available, with a fallback to the hardcoded default for older KMD.
>
> Propagate the new fd argument through the xe_for_each_multi_queue_engine
> and xe_for_each_multi_queue_engine_class macros and all their call sites.
>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   lib/xe/xe_query.c                 | 52 ++++++++++++++++++-------------
>   lib/xe/xe_query.h                 |  8 ++---
>   tests/intel/xe_exec_multi_queue.c |  4 +--
>   tests/intel/xe_exec_threads.c     |  4 +--
>   4 files changed, 38 insertions(+), 30 deletions(-)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index e13d5e143..3286a3b37 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -215,28 +215,6 @@ static uint16_t xe_device_query_engine_class_mask(int fd, const char *key)
>   	return mask;
>   }
>   
> -/**
> - * xe_engine_class_supports_multi_queue:
> - * @engine_class: engine class
> - *
> - * Returns true if multi queue supported by engine class or false.
> - */
> -bool xe_engine_class_supports_multi_queue(uint32_t engine_class)
> -{
> -	switch (engine_class) {
> -		case DRM_XE_ENGINE_CLASS_COPY:
> -		case DRM_XE_ENGINE_CLASS_COMPUTE:
> -			return true;
> -		case DRM_XE_ENGINE_CLASS_RENDER:
> -		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> -		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -			return false;
> -		default:
> -			igt_warn("Engine class 0x%x unknown\n", engine_class);
> -			return false;
> -	}
> -}
> -
>   /**
>    * xe_engine_class_string:
>    * @engine_class: engine class
> @@ -338,6 +316,36 @@ bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class)
>   	}
>   }
>   
> +/**
> + * xe_engine_class_supports_multi_queue:
> + * @fd: xe device fd
> + * @engine_class: engine class
> + *
> + * Returns true if multi queue supported by engine class or false.
> + * Uses the kernel-reported bitmask from debugfs when available, otherwise
> + * falls back to the hardcoded per-class default.
> + */
> +bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class)
> +{
> +	struct xe_device *xe_dev = find_in_cache(fd);
> +
> +	if (xe_dev && xe_dev->multi_queue_engine_class_mask != UINT16_MAX)
> +		return !!(xe_dev->multi_queue_engine_class_mask & BIT(engine_class));
> +
> +	switch (engine_class) {
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return true;
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return false;
> +	default:
> +		igt_warn("Engine class 0x%x unknown\n", engine_class);
> +		return false;
> +	}
> +}
> +
>   static void xe_device_free(struct xe_device *xe_dev)
>   {
>   	free(xe_dev->config);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 5c26a3e88..8815c6c66 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -113,10 +113,10 @@ struct xe_device {
>   
>   #define xe_for_each_multi_queue_engine(__fd, __hwe)	\
>   	xe_for_each_engine(__fd, __hwe)			\
> -		for_if(xe_engine_class_supports_multi_queue((__hwe)->engine_class))
> -#define xe_for_each_multi_queue_engine_class(__class)			\
> +		for_if(xe_engine_class_supports_multi_queue(__fd, (__hwe)->engine_class))
> +#define xe_for_each_multi_queue_engine_class(__fd, __class)		\
>   	xe_for_each_engine_class(__class)				\
> -		for_if(xe_engine_class_supports_multi_queue(__class))
> +		for_if(xe_engine_class_supports_multi_queue(__fd, __class))
>   
>   #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
>   #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
> @@ -161,7 +161,7 @@ uint32_t xe_get_default_alignment(int fd);
>   uint32_t xe_va_bits(int fd);
>   uint16_t xe_dev_id(int fd);
>   int xe_supports_faults(int fd);
> -bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
> +bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class);
>   bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class);
>   const char *xe_engine_class_string(uint32_t engine_class);
>   const char *xe_engine_class_short_string(uint32_t engine_class);
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index f987f8d6a..b5ded0633 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -1052,7 +1052,7 @@ int igt_main()
>   
>   	igt_subtest_f("sanity")
>   		xe_for_each_gt(fd, gt)
> -			xe_for_each_multi_queue_engine_class(class)
> +			xe_for_each_multi_queue_engine_class(fd, class)
>   				test_sanity(fd, gt, class);
>   
>   	igt_subtest_f("exec-sanity")
> @@ -1061,7 +1061,7 @@ int igt_main()
>   
>   	igt_subtest_f("virtual")
>   		xe_for_each_gt(fd, gt)
> -			xe_for_each_multi_queue_engine_class(class)
> +			xe_for_each_multi_queue_engine_class(fd, class)
>   				test_exec_virtual(fd, gt, class);
>   
>   	igt_subtest_f("priority")
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index f082a0eda..ab9565beb 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1141,7 +1141,7 @@ static void threads(int fd, int flags)
>   	int gt;
>   
>   	xe_for_each_engine(fd, hwe) {
> -		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
> +		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>   			continue;
>   		++n_engines;
>   	}
> @@ -1170,7 +1170,7 @@ static void threads(int fd, int flags)
>   	}
>   
>   	xe_for_each_engine(fd, hwe) {
> -		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
> +		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>   			continue;
>   		threads_data[i].mutex = &mutex;
>   		threads_data[i].cond = &cond;
Reviewed-by:Daniel Charles <daniel.charles@intel.com>
