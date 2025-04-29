Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937E6C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 15:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446EF10E4D2;
	Tue, 29 Apr 2025 15:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZoKLbAeD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910FB10E4D2
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745939855; x=1777475855;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7a6w/WvUSWSkvLTHL5yE0fe+VM9x4GHFW6K4pSi/Gfk=;
 b=ZoKLbAeDPFlLnzcvoS1bSOAIpspkyIioqwdi2FVYEKSjfFE5Rje0CHrY
 NrQsxYGSdtlixk1cBraV7c6t0ciO9VSVPOeiWpKRFZ89ZtVSazCTI8EgZ
 pYtfKMDVZcZyzpwtqYoXbSsXXv69F8VCu5Aiks65WueYc6BrLQbNWsbGM
 karDLHc0dXM5I0rdftbPsENtBaaZtHJY3HADL++EkD2y1GUpJaCm5bu5q
 Vu7g/brkGECpz5bM/E8JjF8hs6oSxAxHCHcfSLPjDb5xc1TCTnQugcaK0
 J1B8C82uBq3YDGARUWGJ4OYRFw3mq8kuJZADUR2SbKF7WGosEbsmJApkZ A==;
X-CSE-ConnectionGUID: UHixlrwNTmqSB0ILwEYx5w==
X-CSE-MsgGUID: A6Bn7ABoRs2Ok4p/2TvQEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47725068"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47725068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 08:17:35 -0700
X-CSE-ConnectionGUID: Nh5KoVB5QfeKdYoWIIHH3w==
X-CSE-MsgGUID: gTj6FZjJT+atx0ylV0oxNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="134352222"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 08:17:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 08:17:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 08:17:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 08:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uk4iV2xEURHYHrw8/6pHr+58GpRwUO4oSr/JWTIpFSVdH8IUjV8n1NrcWcrZaA8lS+QsYrysPaVX0whAjVJnPqtt8Er7hIt7LjphKIUt9zG14r7hMPR2MUFHMdCBvyJe5yDTLAgzP5+NvuMT0KPtWNmca8ZoRvAUSAV/MjoWzZuwAb++Cls6jilyTYtC8CJfyc1ArrQ464tc5+DxJsz2VTq7I+MTm9sy1NWPcYmoA87OQpnAnwphk2X9msNaV5+H5Qxr8l9VTRsWUfBEzAXYkW2dDthViL73QNQZp5dv2abAy15LDnT6VHierzHcamkmHpIQIfl4+MNEMfuJQLREtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6qylMpjwUrY60310oq1fZJnJh7ckdRUVclxNJVF4Tk=;
 b=PM062QyHVrmgxDmWIeTgQMRRUFKFLrCqM7yY9QlRN35qRi5XBfdyDTt6qhrppRAlmN9qHLFvhiV+AAT2Bu/tSxkCnRysIEjSpaOV0oz1Yk8y5+MEa5/MnFphvP7e864dOa/Cmo15wjSj/WcYpRHirYXP9oUl/MRLFJeQB+p4xPGjmHLm1ZioerqwhkGAcQqlLSEtMoPTk3wiMZahFJGyJxI+3biw9s3PxMiPVRDBRW4ghcYvwPp1rHOoOZ1puIoB8DIN+8aZjyfsnu+e14uBDmdRwkzXji9bC9VNDQUDe9gLzooUT1x65SEAghTdkeqeaMrQYv+yXQErlLCNJ7GdHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CYXPR11MB8712.namprd11.prod.outlook.com (2603:10b6:930:df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 15:17:32 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 15:17:31 +0000
Date: Tue, 29 Apr 2025 17:17:22 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Fix 32-bit
 compilation
Message-ID: <aBDtgmLTn6kGgj1B@fdugast-desk>
References: <20250429143051.36969-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429143051.36969-1-kamil.konieczny@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::16) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CYXPR11MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce6ccb7-e130-479b-00b7-08dd8730f62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TEFeKJMnFv9/R2vmJPyrVDWte+Ir114/1pqttmkB3cVgSiaQ6HsW/7La3K4Z?=
 =?us-ascii?Q?Dkk0IvqcHdlkXxUO9D7/nKo0UIG7X0A7BadfgSdbwpFtOFkuZup9UItwcoh3?=
 =?us-ascii?Q?GHNKgv6kLEb2R60iZBZRzdcvy+eKNeW+kJwFosClslG5NNCdjmUaUy0TWCdu?=
 =?us-ascii?Q?EuLkowNrWkO/VRCp5jUdYQLr2WAp0Z96ulHYP+fz9AyM1sVRn+P8x6t7AsaV?=
 =?us-ascii?Q?fJL3dct+0H/qo2z6IbJy35dVCLGZo6+hHWEpdh65IZUmhUouSX/Imm61m41x?=
 =?us-ascii?Q?vpLkQrShez1SwBL8xOZZMP+CNTTvjUDAU+B0R3A0al+1e5EQv43zAYGtXOqW?=
 =?us-ascii?Q?S/qSvJ6bpnIHVGGuOtU+WbnumS21prnv+t/Au3UTyKFHDuLVZcz4RM6UXDJd?=
 =?us-ascii?Q?fivZOoaeUWx1W3x/fcyQsesgl0QsutiY1C3xH/PfceJ2JmIpRTsSlAremMgN?=
 =?us-ascii?Q?HP8wIU7DGmELZa+vzyLii6+qswQ2X31Cog/Y4VcJ9RKsSV+AjkoaB6B4tC+v?=
 =?us-ascii?Q?puErMHqMadBHI5bdHUmo/UHDvAGZ7JpT7KpEMd/F/t1ZBQwyMDrUfAZ1HiLR?=
 =?us-ascii?Q?xyBW22mmI38Xm/oUiGp4pHLRitltX/W0rkUzP9ewF3KxCpNDKujyQiN/Q2rd?=
 =?us-ascii?Q?+krXSY7acq3RTa13ZD7Y/KzZwwbxI40FRIlQjvx7U6WrbZJUciSEneutNBeA?=
 =?us-ascii?Q?7thGO5luM5rgTQgh8Q9UxY8iFnodweMkF+2K2DR5973dI1DYvw/7FOUNbjxL?=
 =?us-ascii?Q?SpEN/jXsAn1RxhDTGpOKZeDFbMSbL2DTPb2lFQxL6cbw082gK5/1mmeposTC?=
 =?us-ascii?Q?psR99H8JI1HgmatjzIjH9f+DqFx0mhLi+SkHhEi32Q5DqnwRgIhNdHMbSjUn?=
 =?us-ascii?Q?/yhicIIQAUmw/hz3nEaJ2ETF/do1B1jM54IwWJgWI1BRzChNWxrMyS8KaUJ9?=
 =?us-ascii?Q?eQ/0lH7cdjJnDn1FaNslGThONIv/sUYSdAI2Qf8ItfgsSDRTzi9GYiySQ0UM?=
 =?us-ascii?Q?nlU2eE8pAp6uFzCmRA/hGhl+6Rr7MXqrrsO93xf43Q6341bh6sV5wua6bdZ0?=
 =?us-ascii?Q?/1PZvnge2MxKWRYvOABR/h9dBOPDz3JC210IseS2YPUJsIjD2gjyIQnzbnIZ?=
 =?us-ascii?Q?KqS+9YXdz+5HQ5mdAi1wF7hXV8Nn5aXvJOQh7j3V1I7iHa806rjx0Uj6YG3g?=
 =?us-ascii?Q?PgiLltKcOXoD+0D9QQTorAVt/v5BubjjfAhS6LyXCkOx59Oq3f7ePTfYbrc0?=
 =?us-ascii?Q?hf2SqxVdDexoKCxC+EWw8TIv/xmsNUgZodIRnnRxSsq+EnB+3MllKyPXeWoK?=
 =?us-ascii?Q?x65Mpf3OUeRcBTPF5XzJK/vqPCV8ZATCij9GcJ4WMZzgTCTWhW/fMOAYlmrJ?=
 =?us-ascii?Q?Y4cXtEnceT5mUT8EntGi/6Hrp6fDFSpeQ/m2D+Bf24zYcjArnupr4dfup0xr?=
 =?us-ascii?Q?wbe5rrK9VC8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xiDmbhInVLqoxEaY4kU/4dYqSJxZ5lHXSeYCSAECA7f/5wvPH+eHXlZ3BEtf?=
 =?us-ascii?Q?tTywzZvhOs03hgaP3iLguEkKYlPzeIRbLelyb5vmI6+kyilycJG8WCXD1pup?=
 =?us-ascii?Q?MOutGZrMEuiYmIu7SkJrstIzn5Ecudy4AIZ4MuQU2xFrM52MA3QWBMVAGt1d?=
 =?us-ascii?Q?wZN8FakbzrihJh83jrGm+lXUyR3MbjfnKevSLe38Ch9eTEQX8KhWMUbuMt8P?=
 =?us-ascii?Q?U8SaZtlRMPp6uQg7f+mp5Ad9WmKgUfxrzwB+G+Urfdq4LtXNsF6pIidENdWz?=
 =?us-ascii?Q?MudLVLiJTLWwTkPDi7d3o1RpDjBEGMMmKttAjcWyQV57L3ZykWDhXpMyZdJ4?=
 =?us-ascii?Q?RRkmU8oxfU9NiKHPmuaAK2ciETPj1sQUcIoUe4kJ7W7dO5B8ji2HcxJfmq5R?=
 =?us-ascii?Q?D9Qp0MRWM+xxBE5HgG8qwVbiA8XCQaDQI23nzXnVPAULTJWmewtjGT1u9gJK?=
 =?us-ascii?Q?qhS4Pbu6Wd6mO6Od9/Suqcd0TVXQu0Y4UopLuho1HF2NkUjQe8f1SfIX3H3M?=
 =?us-ascii?Q?wzWuuFlTtj+PAbVZck1nH5s0tGot5uvCx0LdbGkxTrLtKcsvz4AKrqvin/tC?=
 =?us-ascii?Q?f1qPNNMJGE/nDwR9a5exJCUphuJoBXd3VZdKm8ISeYvcoDcAwcTWbD+zA8qb?=
 =?us-ascii?Q?UYBBpiRZcNrCQRb/rYF6y0uWe6rH6cYrclVsskLCIiOe8NZ4Wk1R+sWZRmsO?=
 =?us-ascii?Q?kuakqCkdDcQZR14U2jOII1wHr8sOiCcUhJloFjm6++dLnCD0Ul5SUTMAtWEH?=
 =?us-ascii?Q?tj9b7LF2Arv+fPjwSaLEv1pOGxjF4MRDDZrM+qKgNf/Vz2DmPK2NaXuqqq1b?=
 =?us-ascii?Q?6+R85PjQWL5n7YBhjaLM02Gpc2HNODvqobarwMl77/BMlDFUXQHFvO9fInr+?=
 =?us-ascii?Q?vlC7/pTvh9D/wcXMt+l2xXhqG7otxN0pvs8Rx8uGNnpW5XKMiUy21Sro4pnf?=
 =?us-ascii?Q?vkOJuEJS+yGKgX5KkNwVb96wfl9TJNwSBH+6O8qJaPRlEu2LYjH3VPWoXH0W?=
 =?us-ascii?Q?PqXWPcpXOb7SpPQf/X31e92A6CR3gXd3dkHg9wMjd0C6HMrs6Pukvt6LBmQV?=
 =?us-ascii?Q?VH87naYzbbyknDHsicLvSTluaUlqG2hg0f8UsyRq4V+Qa8c6/OHY/9H/zPYO?=
 =?us-ascii?Q?TYfcksEFk8KlDO+4tBSiGXlKYLaXolvF3eiRB39JJgGQAK1KIRY0tw0mbh/B?=
 =?us-ascii?Q?VY/r0/UzZHj8xDXr33xuymA5QjNv+Omj9kNpeCdcZ1HTocCpicA75c+5mCqV?=
 =?us-ascii?Q?spIfU4BaOSuFYr5l8Eea+cuYCcK4xcLM9n60bi84kzuh0P/eJ+vugMLpp07Q?=
 =?us-ascii?Q?DGi7EbtJGtPH5cfQcJ8uQz5moZ7fL1lsH8MnCom00yNVEiaNTof7+rOMXTnS?=
 =?us-ascii?Q?gB3jF1b9+RvAbLqOyJO3djLxr+sq3/VI+pe6k+dlhVwAOzyyBZBlNMs9+7Z5?=
 =?us-ascii?Q?pW5YGtmEJIFU1FRvnAXd6RNckokNRLfJKIiD0ljBwMNgYn8P3oYHIPvSldI9?=
 =?us-ascii?Q?LE4fpZLURRKerqJ+riwIpUZiFetEKtlzakHPFywXRIDTY5DbFpJlRTtVaNY7?=
 =?us-ascii?Q?x62Tg1GAtqweRF/lYiknj0tPwHMz8ri471RGMWY73Rhw9lTXX0wHq8jQ0Tig?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce6ccb7-e130-479b-00b7-08dd8730f62b
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 15:17:31.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CisMG+S/zgA5gkm1IFINfl9oTQzRzxpbXd+reZC7M3GfbrfZ5ubelQEy8Q+q5/wvbFmBur1hX3l//jEN8q+rBGhru3e3JBWJm7fSg5zRAiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8712
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

Hi,

On Tue, Apr 29, 2025 at 04:30:51PM +0200, Kamil Konieczny wrote:
> There is one more place which needs fixing of Xe test
> compilation for 32-bit platforms, reported errors are:
> 
> ../tests/intel/xe_exec_system_allocator.c:382:41: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
>                                          ^
> ../tests/intel/xe_exec_system_allocator.c:382:27: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>   aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
>                            ^
> cc1: some warnings being treated as errors
> 
> Fixes: 9eda33fedff7 ("tests/xe: Add system_allocator test")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index e1121a862..30b99f3ed 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -374,12 +374,15 @@ struct aligned_alloc_type {
>  static struct aligned_alloc_type __aligned_alloc(size_t alignment, size_t size)
>  {
>  	struct aligned_alloc_type aligned_alloc_type;
> +	uint64_t addr;
>  
>  	aligned_alloc_type.__ptr = mmap(NULL, alignment + size, PROT_NONE, MAP_PRIVATE |
>  					MAP_ANONYMOUS, -1, 0);
>  	igt_assert(aligned_alloc_type.__ptr != MAP_FAILED);
>  
> -	aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
> +	addr = to_user_pointer(aligned_alloc_type.__ptr);
> +	addr = ALIGN(addr, (uint64_t)alignment);

Is (uint64_t) needed here?

Anyway, tested on armv7l and it fixes the build, but let's wait for CI.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

> +	aligned_alloc_type.ptr = from_user_pointer(addr);
>  	aligned_alloc_type.size = size;
>  	aligned_alloc_type.__size = size + alignment;
>  
> -- 
> 2.49.0
> 
