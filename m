Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32412C67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 08:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD02910E23A;
	Fri,  5 Apr 2024 08:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTrPhEAa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D026D113A44
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 08:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712305052; x=1743841052;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=P/X137THjKZqMX9JO99J9be11Khgzk0KI8I6qgdEMjg=;
 b=hTrPhEAaZ6jWllzJZULv6uA4Uy70acfhEvFfSIo+YimTPgRJ3/LQ7BgD
 q7gVtN/vVKeoma0ksNc97uIteUzCSKiqzoX9q04SaMMZVFO5DwzpBpcV1
 IT0Ntrn82r5ieA5g39jpwO1c3xl9ujvtEZAOYBLNlcniLotiuaEowjj81
 19pZ8UwzFfV0hpmj0B3rhKsYkTrNSceN91koFkcc2cwxGmTyavgOl3lhe
 MJhxRTWVVGVD5kLhoCrCIrHOwYzFRmx/tSaMoLFwJMpsL3dIeXykJKn8s
 2QwD2lUK/iZyZc+tBWEN3p50G2NQ0waSBu/9fpjC7vmQsKFmKlDRJ4xxo g==;
X-CSE-ConnectionGUID: UU1I3RVGSKiFKrS/LvsohA==
X-CSE-MsgGUID: 1kqxZAoMRwWxsrZM3qJsOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7751974"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208,217";a="7751974"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:17:27 -0700
X-CSE-ConnectionGUID: 2hNqS8UOTQK7AEEluzcCbQ==
X-CSE-MsgGUID: I4n/Ci7KRzmQ+1yi+F5PEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208,217";a="19091230"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 01:17:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 01:17:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 01:17:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 01:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5cHLTbGwPSHt3Wof/qt7NltkpcTsGtnxXlXpFzUfkTHjrlb3iKfhbIF+bR+Twz1lCJSi2oZ4yi3shZwoXoluoFOwzmKJC1QPWyjpFLAj6pUw670gdZuvTSQ4GVKEzXb9rq3qgRsjS410c1Hqfp2lvr4g0mNz/hzyCD5wip9mhfsXTmT8yuKOW4PA3ZKfh8RlWxlF43kDRWdQOvY2Emmahj0xSUxszVBzjL5mEF4oH4baEnnMeR0EU6nddO8DXubVE5ym4HyyB1Mgwr155LCCWvpR/HjE7W4frrmud3N3nLXH6p4XXlfXnl1Psh3woXa29CVCG6W1s7UsMgpT7dvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JM7dmOtOdku1ZOihyUosJGlXu/OR7f8VuoeaNzpfdSw=;
 b=GqehdG6x0968iJ9ICD/orBsM9BWCDXnR2ntYYcI/a/xeyzPW4hekPfprClD7CaykgHmare6OKp9Ig8wLX5VcE0hbyjf9wKAbI02hfxtSRNk3Xz42tk0NUucH+LUgy/OPf1bm60wTc9doNMGnaH/Kf6VuKO6+uDCwfAP2Cg9AoWHD45NGtzQUvEUcFcGAgjGrtQ185sQIozu2AcqGASVhNgfCgEXke7BCm987x1q1519tkYMt7oAa5JCvQswxDCMRqYVi2jot+m9chpPofm7O2MZcVI4cMPSU9PFRLd5a2+qQupxeNz3klIgnKPJD1JsD7vtC+yBzhbVub6ff58pLtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 5 Apr
 2024 08:17:24 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::24fd:9ff2:8ab:3484]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::24fd:9ff2:8ab:3484%6]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 08:17:24 +0000
Content-Type: multipart/alternative;
 boundary="------------rTDNP50OZ5Wi0QM1GyVkZbOD"
Message-ID: <b9ef4bcd-7daf-4476-8ff6-c2833a6d911b@intel.com>
Date: Fri, 5 Apr 2024 10:17:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v3 2/2] lib/xe_mmio: Introduce Xe MMIO lib
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240403120955.4070545-1-piotr.piorkowski@intel.com>
 <20240403120955.4070545-3-piotr.piorkowski@intel.com>
Content-Language: pl
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20240403120955.4070545-3-piotr.piorkowski@intel.com>
X-ClientProxiedBy: WA1P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::20) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB7596:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kd49+rtFAB86alRN0+ZCucpHNYHc9Vi/3FXpN4ZI2fuCu/m1NwYLA3Vzrf87dJLqq1+d78doHyyY/GVZycJN3EVB3ChChCPUTC16jY/xIOQMf2VWoOx08NPntMRVmLSDMsqpJrDDsyDjtSn3nDkfbMN+RyjQMWXheP4KRyAynI5+NI5mqJtcgYs8pS6UlxqVwygOSaZKmhqthPVopREqEyLJmBo8VCjWUFT50Jn8kUxDiUpY2dEdAl0hvHo1+ytfjwhWcm4u2Zs+T1L/6x17sHRaKzpIyh1+a/HKGA6nc86Ytw6WAnljg6jxppxLy93vW/PadUR1GC5QNUIbN/NMTyoJiWiJKsHaz5peuE1MY0gUDGLGpGlzYyav3FQlj2V8ZQX9yZLXUmEJNyqJ1ee10rbdIhb0O3EkNzT/SC/vogoQWW98fK4Mzsad2GmQ82ljHanOQW3zEo0QCcHrt95/P/ffY1z6uE2wRpfA/hVbmuqteOtVuHZlIGSCmJahC4YmXj1+TObnPtbM96TicP4GcBzWLd68ri/vAsYz5l6sMndAGmSBNKLW4ayNg3a3frxU5X1rsEzDqtfdEWKjO/4QvoymSTQDkM8XXwonsk3mBcqUhLHzt3UDWpAL8gA3EVoDn5rPZaX2Zw3wR2xSd8bsvR1A+gS5M3Is8VZ3dElDq5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3huYXpjdklzR3VqZEEzWktKZjh6c05VNnZMOXJrSG1DNC95UnVRaEZMOVFn?=
 =?utf-8?B?U1N4dTEvNERJbUk0T3NQMVFwSmI5eW0rNFhucE5Ud1g5dVRnY1NFblFJUHU3?=
 =?utf-8?B?UTFodlZvUkJXSWQzSFA0MkpmM2JYMFd6WFBBMk1kQVYrVk9qbER0RkU0QUFk?=
 =?utf-8?B?dytNZ0R0UDg0eEFsN3ZVK0crZU1DSE5VY016S1pMTlNHaFNhSVBOOUl5anNs?=
 =?utf-8?B?NndSYjJZVE0rTDVtUWMxZHlaNndyNm0zNGtYdmNZODR2bi92d3I3S3lUdTh2?=
 =?utf-8?B?andYL3BiTHFDUlgwcnU4NFRMZGZpcFlNY3lXb1VPc1BhYy8wb0hWVmlER1pK?=
 =?utf-8?B?V0F3K3JQUFp0SXFmWWdqNVZMaEhRUEhrd0lwTHRMc1RjUVJsbDlmNmhOc1BM?=
 =?utf-8?B?S3hQbEswM3lxUktzVzBXZVN6ekViekxIaWhFU05qR3BDaXhNQzA1RnZrMkd6?=
 =?utf-8?B?Znh0SENkWXJvekVxc2NrRmp4cFV0NVhQYWNwd1E5RmhPK0ZMMEVseVR2RHZ2?=
 =?utf-8?B?QUdKM1BrdjVLQmkxcjJ3Z2hhaDdITzVmSUVvVFZFM2ZLby9lSjNCWWNrYkJN?=
 =?utf-8?B?YmRXMmNldmdhSTlBb09zNFVWVnZha0NHNmFUS3dNTlNyQVdvLzBuZUM1bFVh?=
 =?utf-8?B?OXRXMC9KVmxrN2JhQ1ZFY0h5M2pXS1YzNjh5eEM3eFdpWm04bHNrRHBZNlVa?=
 =?utf-8?B?ZmFaMFduUU5EWlVGWEhrZDJGc01SZ1FPSTJSc2p6UEJnQ3dSckZDR1VuOHdP?=
 =?utf-8?B?Sm1KWEhMODB5eU9teXBTNkxDNDg0TkpqMTd1Zm1OZFluS0hWaWhOWEVYQ2U0?=
 =?utf-8?B?SXBIcnBDT21hdWttbXQ3QVVqYTZxUkp0YTdrc1gxcFo0UXR5ZGlQZTdJenlq?=
 =?utf-8?B?MDZvSk16a3FjbTJqWjNuYkZRZjI3cG9mazRnbk9pWnIyRGhyV1VJbFhNQ2lY?=
 =?utf-8?B?QlZnZjhuYlM3YzlncHlCRGZZQnhyREg0ekU0cHQ1WFZ0UHE5MGcvTmwxa1Jq?=
 =?utf-8?B?TEU5SXVrVWZtMWpNSFVTOGY1Nm5RQm1iMkNLR1pWY0tHMWtYVVZIR3F0MzB4?=
 =?utf-8?B?MGVWVVNDQWI5dHpYQ1R3WHpFaFJOY0c3K0M2T1BEOW5sZ043ZXcwc1E3Ukg3?=
 =?utf-8?B?OENVUjFoZGJQQzJHb1JBcnVBMGVCTC8yZlhRMFpWNnlWblZjbVpwcXptbTRC?=
 =?utf-8?B?SnlUVGtNbllGelRONnk2VUkyV1diZU5lQlFoM05NMStpY0h2V2FtV2RkanB4?=
 =?utf-8?B?eFV4OThpbSt5QkI5dU44Tm1zVFlnYlUrMVVxSzROQXpxZ2dqK0MvQ0owaUhC?=
 =?utf-8?B?WUJKb3l3dkZFMnpsTnBvRnlyemZVeUtDMWxZRGlvbGRRbU9rSUZ0QjU1NWxV?=
 =?utf-8?B?cDN0VnA4R0VPMldXTVk5N3lHWVJwQzRreDUxeWJ4alRFUmdqeEwxV1FhbWdU?=
 =?utf-8?B?U3FIVnZtMTFiYjhOL2xZWEY2YlR0a1A4U2ZNUVJielZuMForc3ZSREphNjlr?=
 =?utf-8?B?bVltaDEvRXR6Y3JtNjMwVC9zZytCajlkL1NhMFluQURlaGo2K1hvOHdxSVlK?=
 =?utf-8?B?RGhsQnpNY1Z1SkRWc2FhTjcxalVJR1MvL2xYWVFtc3IvKzBaK1NRMElHdk0v?=
 =?utf-8?B?Tm1jcGE4clBjMFpWcmRiREUzZjA4U0xFeEdtd2JkZlpVbEF4OTdxNnptS2FK?=
 =?utf-8?B?YW9yc2tZRWtweFF5TGRmYWJoUTVDbzZCVWZINzhrUk1vaWRoaXluWkx5bisv?=
 =?utf-8?B?clFxTFdVTzlERzc2U3JlcnVtak5LczZLYXVLMGNndFlEM0pDOWRFV1NpTXQ2?=
 =?utf-8?B?bkF5MXVveE1aZTBPVVNhTkNLOHVZa2F0dGYzQ0xZNGxKVEhrQWRxZ0taK29Y?=
 =?utf-8?B?SlZvTFZGQ2dzUzlaUm5jbmJacnRYcnI3eXlPZWlJSEJxM1hNSnltVE5sWGsy?=
 =?utf-8?B?eW9aMHFrd0wvbVM3WEtGdFFWUWgxSjI3NytMS1dYOUM0UzVaR3hkN05oaVF6?=
 =?utf-8?B?MlBWTTArczJ1M2pxVjlydmd3eWVDNVBFRFd4bU92U3lDWXlkRSthREZva1NK?=
 =?utf-8?B?UmtSUE80Z2RjWURhY3oveDR3ajBIWGlCMXIzS3NHYndsMHlwelBRQmdnTlp1?=
 =?utf-8?Q?xV+TthfarbwELv76vxZG5w0L4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adbe7fe-f0b5-4c43-73d7-08dc5548d25d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 08:17:23.7642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydvc3HC8AEc9TY+l9iEXtg1uh1GB4kMMZ9H13nzpoFD4n5G9gGhEOCig/2HeKk9SGFj/Q3Ow68rZt1f8anKeMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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

--------------rTDNP50OZ5Wi0QM1GyVkZbOD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 4/3/2024 14:09, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Currently in IGT we have a library intel_mmio for simple MMIO operations
> on intel GPU devices, but it is limited only to accessing registers,
> has a lot of legacy code related to the i915 and offers no support for
> multi tile.
> Let's reuse the memory mapping from the previous library and add separate
> helpers, dedicated to Xe, for registers and GGTT access that support multi
> tile.
>
> v2:
>   - add missing std ifndef/define in header lib/xe_mmio.h
> v3:
> - remove vf_id from struct xe_mmio
> - rename reg to offset in funcs params
> - change return type for xe_gt_get_tile_id
>
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Kamil Konieczny<kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> ---
>   lib/meson.build   |   1 +
>   lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_mmio.h  |  41 +++++++++
>   lib/xe/xe_query.c |  19 +++++
>   lib/xe/xe_query.h |   1 +
>   5 files changed, 269 insertions(+)
>   create mode 100644 lib/xe/xe_mmio.c
>   create mode 100644 lib/xe/xe_mmio.h
>
> diff --git a/lib/meson.build b/lib/meson.build
> index a5651571b..e2f740c11 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -111,6 +111,7 @@ lib_sources = [
>   	'igt_dsc.c',
>   	'xe/xe_gt.c',
>   	'xe/xe_ioctl.c',
> +	'xe/xe_mmio.c',
>   	'xe/xe_query.c',
>   	'xe/xe_spin.c',
>   	'xe/xe_util.c',
> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> new file mode 100644
> index 000000000..57526d7cb
> --- /dev/null
> +++ b/lib/xe/xe_mmio.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include "igt_device.h"
> +
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * xe_mmio_vf_access_init:
> + * @pf_fd: xe device file descriptor
> + * @vf_id: PCI virtual function number (0 if native or PF itself)
> + * @mmio: xe mmio structure for IO operations
> + *
> + * This initializes the xe mmio structure, and maps the MMIO BAR owned by
> + * the specified virtual function associated with @pf_fd.
> + */
> +void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
> +{
> +	struct pci_device *pci_dev = __igt_device_get_pci_device(pf_fd, vf_id);
> +
> +	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
> +
> +	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
> +
> +	igt_assert(!mmio->intel_mmio.igt_mmio);
> +
> +	mmio->fd = pf_fd;
> +	mmio->intel_mmio.safe = false;
> +	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
> +}
> +
> +/**
> + * xe_mmio_access_init:
> + * @pf_fd: xe device file descriptor
> + * @mmio: xe mmio structure for IO operations
> + *
> + * This initializes the xe mmio structure, and maps MMIO BAR for @pf_fd device.
> + */
> +void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
> +{
> +	xe_mmio_vf_access_init(pf_fd, 0, mmio);
> +}
> +
> +/**
> + * xe_mmio_access_fini:
> + * @mmio: xe mmio structure for IO operations
> + *
> + * Clean up the mmio access helper initialized with
> + * xe_mmio_access_init()/xe_mmio_vf_access_init().
> + */
> +void xe_mmio_access_fini(struct xe_mmio *mmio)
> +{
> +	mmio->intel_mmio.pci_device_id = 0;
> +	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
> +	igt_pci_system_cleanup();
> +}
> +
> +/**
> + * xe_mmio_read32:
> + * @mmio: xe mmio structure for IO operations
> + * @offset: mmio register offset
> + *
> + * 32-bit read of the register at @offset.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset)
> +{
> +	return ioread32(mmio->intel_mmio.igt_mmio, offset);
> +}
> +
> +/**
> + * xe_mmio_read64:
> + * @mmio: xe mmio structure for IO operations
> + * @offset: mmio register offset
> + *
> + * 64-bit read of the register at @offset.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset)
> +{
> +	return ioread64(mmio->intel_mmio.igt_mmio, offset);
> +}
> +
> +/**
> + * xe_mmio_write32:
> + * @mmio: xe mmio structure for IO operations
> + * @offset: mmio register offset
> + * @val: value to write
> + *
> + * 32-bit write to the register at @offset.
> + */
> +void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val)
> +{
> +	return iowrite32(mmio->intel_mmio.igt_mmio, offset, val);
> +}
> +
> +/**
> + * xe_mmio_write64:
> + * @mmio: xe mmio structure for IO operations
> + * @offset: mmio register offset
> + * @val: value to write
> + *
> + * 64-bit write to the register at @offset.
> + */
> +void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
> +{
> +	return iowrite64(mmio->intel_mmio.igt_mmio, offset, val);
> +}
> +
> +/**
> + * xe_mmio_gt_read32:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: mmio register offset in tile to which @gt belongs
> + *
> + * 32-bit read of the register at @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
> +{
> +	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +}
> +
> +/**
> + * xe_mmio_gt_read64:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: mmio register offset in tile to which @gt belongs
> + *
> + * 64-bit read of the register at @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
> +{
> +	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)));
> +}
> +
> +/**
> + * xe_mmio_gt_write32:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: mmio register offset
> + * @val: value to write
> + *
> + * 32-bit write to the register at @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val)
> +{
> +	return xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> +			       val);
> +}
> +
> +/**
> + * xe_mmio_gt_write64:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: mmio register offset
> + * @val: value to write
> + *
> + * 64-bit write to the register at @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val)
> +{
> +	return xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio->fd, gt)),
> +			       val);
> +}
> +
> +/**
> + * xe_mmio_ggtt_read:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + *
> + * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
> + *
> + * Returns:
> + * The value read from the register.
> + */
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
> +{
> +	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
> +}
> +
> +/**
> + * xe_mmio_ggtt_write:
> + * @mmio: xe mmio structure for IO operations
> + * @gt: gt id
> + * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
> + * @pte: PTE value to write
> + *
> + * Write PTE value at GGTT @offset in tile to which @gt belongs.
> + */
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
> +{
> +	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
> +}
> diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
> new file mode 100644
> index 000000000..f144d4b53
> --- /dev/null
> +++ b/lib/xe/xe_mmio.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include "lib/intel_io.h"
> +#include "lib/igt_sizes.h"
> +
> +#ifndef XE_MMIO_H
> +#define XE_MMIO_H
> +
> +#define TILE_MMIO_SIZE		SZ_16M
> +#define GGTT_OFFSET_IN_TILE	SZ_8M
> +
> +typedef uint64_t xe_ggtt_pte_t;
> +
> +struct xe_mmio {
> +	int fd;
> +	struct intel_mmio_data intel_mmio;
> +};
> +
> +void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
> +void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
> +void xe_mmio_access_fini(struct xe_mmio *mmio);
> +
> +uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset);
> +uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset);
> +
> +void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val);
> +void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val);
> +
> +uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset);
> +uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset);
> +
> +void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val);
> +void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val);
> +
> +xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> +void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> +
> +#endif	/* XE_MMIO_H */
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 53a2b4386..6df8f4264 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
>   	return false;
>   }
>   
> +/**
> + * xe_gt_to_tile_id:
> + * @fd: xe device fd
> + * @gt: gt id
> + *
> + * Returns tile id for given @gt.
> + */
> +uint16_t xe_gt_get_tile_id(int fd, int gt)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev = find_in_cache(fd);
> +
> +	igt_assert(xe_dev);
> +	igt_assert(gt < xe_number_gt(fd));
> +
> +	return xe_dev->gt_list->gt_list[gt].tile_id;
> +}
> +
>   igt_constructor
>   {
>   	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 82af2706d..f91d16bdf 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
>   bool xe_has_engine_class(int fd, uint16_t engine_class);
>   bool xe_has_media_gt(int fd);
>   bool xe_is_media_gt(int fd, int gt);
> +uint16_t xe_gt_get_tile_id(int fd, int gt);
>   
>   struct xe_device *xe_device_get(int fd);
>   void xe_device_put(int fd);

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------rTDNP50OZ5Wi0QM1GyVkZbOD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 4/3/2024 14:09, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240403120955.4070545-3-piotr.piorkowski@intel.com">
      <pre class="moz-quote-pre" wrap="">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Currently in IGT we have a library intel_mmio for simple MMIO operations
on intel GPU devices, but it is limited only to accessing registers,
has a lot of legacy code related to the i915 and offers no support for
multi tile.
Let's reuse the memory mapping from the previous library and add separate
helpers, dedicated to Xe, for registers and GGTT access that support multi
tile.

v2:
 - add missing std ifndef/define in header lib/xe_mmio.h
v3:
- remove vf_id from struct xe_mmio
- rename reg to offset in funcs params
- change return type for xe_gt_get_tile_id

Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
---
 lib/meson.build   |   1 +
 lib/xe/xe_mmio.c  | 207 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_mmio.h  |  41 +++++++++
 lib/xe/xe_query.c |  19 +++++
 lib/xe/xe_query.h |   1 +
 5 files changed, 269 insertions(+)
 create mode 100644 lib/xe/xe_mmio.c
 create mode 100644 lib/xe/xe_mmio.h

diff --git a/lib/meson.build b/lib/meson.build
index a5651571b..e2f740c11 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -111,6 +111,7 @@ lib_sources = [
 	'igt_dsc.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
+	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
 	'xe/xe_util.c',
diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
new file mode 100644
index 000000000..57526d7cb
--- /dev/null
+++ b/lib/xe/xe_mmio.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include &quot;igt_device.h&quot;
+
+#include &quot;xe/xe_mmio.h&quot;
+#include &quot;xe/xe_query.h&quot;
+
+/**
+ * xe_mmio_vf_access_init:
+ * @pf_fd: xe device file descriptor
+ * @vf_id: PCI virtual function number (0 if native or PF itself)
+ * @mmio: xe mmio structure for IO operations
+ *
+ * This initializes the xe mmio structure, and maps the MMIO BAR owned by
+ * the specified virtual function associated with @pf_fd.
+ */
+void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
+{
+	struct pci_device *pci_dev = __igt_device_get_pci_device(pf_fd, vf_id);
+
+	igt_assert_f(pci_dev, &quot;No PCI device found for VF%u\n&quot;, vf_id);
+
+	intel_mmio_use_pci_bar(&amp;mmio-&gt;intel_mmio, pci_dev);
+
+	igt_assert(!mmio-&gt;intel_mmio.igt_mmio);
+
+	mmio-&gt;fd = pf_fd;
+	mmio-&gt;intel_mmio.safe = false;
+	mmio-&gt;intel_mmio.pci_device_id = pci_dev-&gt;device_id;
+}
+
+/**
+ * xe_mmio_access_init:
+ * @pf_fd: xe device file descriptor
+ * @mmio: xe mmio structure for IO operations
+ *
+ * This initializes the xe mmio structure, and maps MMIO BAR for @pf_fd device.
+ */
+void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
+{
+	xe_mmio_vf_access_init(pf_fd, 0, mmio);
+}
+
+/**
+ * xe_mmio_access_fini:
+ * @mmio: xe mmio structure for IO operations
+ *
+ * Clean up the mmio access helper initialized with
+ * xe_mmio_access_init()/xe_mmio_vf_access_init().
+ */
+void xe_mmio_access_fini(struct xe_mmio *mmio)
+{
+	mmio-&gt;intel_mmio.pci_device_id = 0;
+	intel_mmio_unmap_pci_bar(&amp;mmio-&gt;intel_mmio);
+	igt_pci_system_cleanup();
+}
+
+/**
+ * xe_mmio_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @offset: mmio register offset
+ *
+ * 32-bit read of the register at @offset.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset)
+{
+	return ioread32(mmio-&gt;intel_mmio.igt_mmio, offset);
+}
+
+/**
+ * xe_mmio_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @offset: mmio register offset
+ *
+ * 64-bit read of the register at @offset.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset)
+{
+	return ioread64(mmio-&gt;intel_mmio.igt_mmio, offset);
+}
+
+/**
+ * xe_mmio_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @offset: mmio register offset
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset.
+ */
+void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val)
+{
+	return iowrite32(mmio-&gt;intel_mmio.igt_mmio, offset, val);
+}
+
+/**
+ * xe_mmio_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @offset: mmio register offset
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset.
+ */
+void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val)
+{
+	return iowrite64(mmio-&gt;intel_mmio.igt_mmio, offset, val);
+}
+
+/**
+ * xe_mmio_gt_read32:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: mmio register offset in tile to which @gt belongs
+ *
+ * 32-bit read of the register at @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset)
+{
+	return xe_mmio_read32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio-&gt;fd, gt)));
+}
+
+/**
+ * xe_mmio_gt_read64:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: mmio register offset in tile to which @gt belongs
+ *
+ * 64-bit read of the register at @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset)
+{
+	return xe_mmio_read64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio-&gt;fd, gt)));
+}
+
+/**
+ * xe_mmio_gt_write32:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: mmio register offset
+ * @val: value to write
+ *
+ * 32-bit write to the register at @offset in tile to which @gt belongs.
+ */
+void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val)
+{
+	return xe_mmio_write32(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio-&gt;fd, gt)),
+			       val);
+}
+
+/**
+ * xe_mmio_gt_write64:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: mmio register offset
+ * @val: value to write
+ *
+ * 64-bit write to the register at @offset in tile to which @gt belongs.
+ */
+void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val)
+{
+	return xe_mmio_write64(mmio, offset + (TILE_MMIO_SIZE * xe_gt_get_tile_id(mmio-&gt;fd, gt)),
+			       val);
+}
+
+/**
+ * xe_mmio_ggtt_read:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ *
+ * Read of GGTT PTE at GGTT @offset in tile to which @gt belongs.
+ *
+ * Returns:
+ * The value read from the register.
+ */
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t offset)
+{
+	return xe_mmio_gt_read64(mmio, gt, offset + GGTT_OFFSET_IN_TILE);
+}
+
+/**
+ * xe_mmio_ggtt_write:
+ * @mmio: xe mmio structure for IO operations
+ * @gt: gt id
+ * @offset: PTE offset from the beginning of GGTT, in tile to which @gt belongs
+ * @pte: PTE value to write
+ *
+ * Write PTE value at GGTT @offset in tile to which @gt belongs.
+ */
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t offset, xe_ggtt_pte_t pte)
+{
+	return xe_mmio_gt_write64(mmio, gt, offset + GGTT_OFFSET_IN_TILE, pte);
+}
diff --git a/lib/xe/xe_mmio.h b/lib/xe/xe_mmio.h
new file mode 100644
index 000000000..f144d4b53
--- /dev/null
+++ b/lib/xe/xe_mmio.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include &quot;lib/intel_io.h&quot;
+#include &quot;lib/igt_sizes.h&quot;
+
+#ifndef XE_MMIO_H
+#define XE_MMIO_H
+
+#define TILE_MMIO_SIZE		SZ_16M
+#define GGTT_OFFSET_IN_TILE	SZ_8M
+
+typedef uint64_t xe_ggtt_pte_t;
+
+struct xe_mmio {
+	int fd;
+	struct intel_mmio_data intel_mmio;
+};
+
+void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio);
+void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio);
+void xe_mmio_access_fini(struct xe_mmio *mmio);
+
+uint32_t xe_mmio_read32(struct xe_mmio *mmio, uint32_t offset);
+uint64_t xe_mmio_read64(struct xe_mmio *mmio, uint32_t offset);
+
+void xe_mmio_write32(struct xe_mmio *mmio, uint32_t offset, uint32_t val);
+void xe_mmio_write64(struct xe_mmio *mmio, uint32_t offset, uint64_t val);
+
+uint32_t xe_mmio_gt_read32(struct xe_mmio *mmio, int gt, uint32_t offset);
+uint64_t xe_mmio_gt_read64(struct xe_mmio *mmio, int gt, uint32_t offset);
+
+void xe_mmio_gt_write32(struct xe_mmio *mmio, int gt, uint32_t offset, uint32_t val);
+void xe_mmio_gt_write64(struct xe_mmio *mmio, int gt, uint32_t offset, uint64_t val);
+
+xe_ggtt_pte_t xe_mmio_ggtt_read(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
+void xe_mmio_ggtt_write(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
+
+#endif	/* XE_MMIO_H */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 53a2b4386..6df8f4264 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -731,6 +731,25 @@ bool xe_is_media_gt(int fd, int gt)
 	return false;
 }
 
+/**
+ * xe_gt_to_tile_id:
+ * @fd: xe device fd
+ * @gt: gt id
+ *
+ * Returns tile id for given @gt.
+ */
+uint16_t xe_gt_get_tile_id(int fd, int gt)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+
+	igt_assert(xe_dev);
+	igt_assert(gt &lt; xe_number_gt(fd));
+
+	return xe_dev-&gt;gt_list-&gt;gt_list[gt].tile_id;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 82af2706d..f91d16bdf 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -99,6 +99,7 @@ const char *xe_engine_class_string(uint32_t engine_class);
 bool xe_has_engine_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
+uint16_t xe_gt_get_tile_id(int fd, int gt);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);</pre>
    </blockquote>
    <br>
    <p>Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------rTDNP50OZ5Wi0QM1GyVkZbOD--
