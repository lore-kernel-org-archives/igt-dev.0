Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7462C87FD2
	for <igt-dev@archiver.kernel.org>; Fri,  8 Aug 2025 10:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9905D10E4EE;
	Fri,  8 Aug 2025 10:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VErc9amG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0F310E4EE
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Aug 2025 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754650689; x=1786186689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0F9iPisi/gS3p9RcmNsNaxhQaTVKQxRX23tBrz3Ibew=;
 b=VErc9amGdOiewSbmaW/Jpr0X4ZxXe84mfryVprADOvcyy0w6wMqb4+5C
 rncMizB3ScWN+23DhzkZBONtIKg49y2Irafq8WTm8qVKA824brcd8wxel
 cN11F5PTh8lRy3+oVpcehHKLdwH8/+8MtwCzBvTa9+qAVKy6H8Qo7GNR4
 azWsZuykieqJpZ+dIkufetLjTEtr7ueyuSmORI+9mcGIsP2SZlobhGYS1
 8k8QFShT07ItLyv5Iea8D3pHQu/MU6ZZ4BlwJZOuNOYdOMpswBWD+L/9K
 WarqDwtCDUZ3mJb86BAzBX+Rgu/rf+2P1iEDigsfjMYi2k1t4viRky94x g==;
X-CSE-ConnectionGUID: lSx2R3YiR5+hhpkuzubN5A==
X-CSE-MsgGUID: ZRJAtyTFT8uGJhD27y8hMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56032034"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56032034"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:58:08 -0700
X-CSE-ConnectionGUID: izjLvqBkSy+ZMy0uffOEag==
X-CSE-MsgGUID: bwa/VHpMTyyL7sWRUGV97A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165684455"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 03:58:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 03:58:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 03:58:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 03:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sbj+XZFAWYsjjWntyoO15mbFzJf54X+sgL6NI9bkUbwhWTwnlQcIfu3y5l/fifrPsVkcc2GPL91lsDZc90CXnx5gt+yMkl9DWWWE7GaVEA+9vwGUeXfJj0eUp4+pmIgcgngRfbCNQRoWkeuRscROxWtgw91/5hPGpsLjdrYoQmpmMHyPpphUb+8UcZTj1gy3Jaj6pXdV5fxcXhKsjw4ohja5XRkvW+D/bSRGsGmxOP6KrXc+Goudex0wGSwjfMmflpCp01ZMYNswYAVvjJt+3hsfB8bly+tuiViebA2kLZrhv72Tz7YE2ZtG97ARPdjhuT+lDWRCqCCksn3PYpWBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUlJ5+FPR1Q41zsOIz9NcveS3+BliY/ArLdbwgMQc5g=;
 b=yNiggC7G8gTNiLgcLbBGxzoJmBA20nzWatA1pKeG59SF88Mzj2jeZmmVEzFh+ea/qWNUAJjQPhqFXd2QBncOm+j4qbvGkWpNxK35p9v/cIpJv+hRRp7b6Ulf9uJ1xvD73sBb/liBI8cJL9cL0iEnbRSQ0omLe4fWoIj5IvkYkJpg78LXeaxMadxlHzDEoWcKECDmCoqavnp6OznZt+JacVb/TwrH2P6vjSncsm8kkxvQpqcqKSOKGnMD98dqozfIFNhXsUxRRPQklYqDb5kR2xrKx70pV8enT79rNG6sKcm/MQPFMPiMIWkxDxrBgpPg1OJcaIUTKByRrzGjsR0dWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 10:58:06 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 10:58:06 +0000
Date: Fri, 8 Aug 2025 12:57:57 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_system_allocator: Add
 prefetch-sys-benchmark
Message-ID: <aJXYNY9lzk70l0c6@fdugast-desk>
References: <20250808032402.1652099-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250808032402.1652099-1-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: cc659d2a-5bda-4832-0f2e-08ddd66a7435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dwlvL+CN2MFAcQTlVcDoHT14iKDykMimpgbhax9ZkvgFDVeOyChUojSfEZ16?=
 =?us-ascii?Q?nF9x7+CekFh2ntQRxIEOtGchx+nUx75u0dcs2Zqw7TGlIc4IvG8xj8CpFnSB?=
 =?us-ascii?Q?Llmqsh4JWgPizKahHllVWdwOcMIHo8WCgGbKKSOoq06d442X3R1CF7i8HXJw?=
 =?us-ascii?Q?BlUOxudzRMk2rIGqcXqx9iZCBEtNcq9fCf2DsRGRTDOkiZ6aUZ2qnwrQMd5Q?=
 =?us-ascii?Q?4TomgbnsX82SCWMLId8nj28aMta3pRDShaPwiMhxx9Cgl4JZrZ8mFba56ine?=
 =?us-ascii?Q?6P6E4w7eRqkWyU1xxmRXFRvm3hg6CXuEyw0OEWxOFUsv6QlnN858fnesF6hn?=
 =?us-ascii?Q?/nYJBAYS634s/PgyRUgACE70nZPvIqluvScYCkdv5v+96/kNSDmYj+2DLlvk?=
 =?us-ascii?Q?Wuyb4iMBTLXQtVVzcXQLxZEkSZyMUfAk0YAY82BavySianoOYQC2gw2iZ1TG?=
 =?us-ascii?Q?/BQvloG89cTeKxX1pbnztFkl4nYii+ohj54oWaOVspz/MNRmY2k+0xcOd0HA?=
 =?us-ascii?Q?E4qH1FXVovT8w7ZQ7f4dlLq1P5ws3LKhsWje2EhY0NFeiKAB5Fzh7aMaDS4s?=
 =?us-ascii?Q?zBOu4YNDKfoLPT2dplXneDMDuDNHiKA+7xWHURiDVYIiozy3z3PeyOylIIIP?=
 =?us-ascii?Q?6M/DQWWO3DYgfFXpzuPMYb1Kb5/VxfGeDpc0A7CPGlyzYqbjO+9xSpF2SbzO?=
 =?us-ascii?Q?EWkF3z/fqe8T5GIMBPe7dwAz79Fr4C6aimRppJ2jP7aaEhchSDKG40RA/+5u?=
 =?us-ascii?Q?MXXq0z9ycm872DLc3+Fy8HzSu9vCXYuRei4Oe7H3cng2x38OV+cO7s+KOX9i?=
 =?us-ascii?Q?iNSLi0b9V2JAnIL4nLR5VbsFH7/LqeVVYjcrbZv2V5mo/ID2hBOCZfWkfIoC?=
 =?us-ascii?Q?3+Jo2s18wVWczVI7wP4HExy0A4cYsh8a4B7y+EKM80E9D+T/FY6eCmODcfs+?=
 =?us-ascii?Q?xVZBRxYFy+z5xFqoBEvWfXdwWFPUcSag4xtgC/9OjSy1Qluxw7auJtdgmBCN?=
 =?us-ascii?Q?T9sF5ufgaHzu1wdSY0+1z3AZOEfynbyRvnKDqscgMUE8hZRMEPG3K5YJG9BU?=
 =?us-ascii?Q?UpIaaWgemsnChmM8P/axSs1vm03mQ32sfI03Di7MUVO8QFAaFg4kGab6CFDw?=
 =?us-ascii?Q?CjIzDyWHtmNoSKSkGd+wfzLZ8VA4bN2HeRrrcoVKzz6+53crZcKismWyDo8z?=
 =?us-ascii?Q?G3Nq3h58ygJdwu1lD8/vDFp13EFa1ykuazj5751S30VizVwr3+KLcBG+zftH?=
 =?us-ascii?Q?WXyyUq99YOAQG69hqKtkKZ5Cupoqh0nWdFSZBRTQH5mC171bHb9VJdRCVFGs?=
 =?us-ascii?Q?Cp/jiSB7kTzSbV9ehiIuiW/YyQ/PM4t8zoUU7KjTauAGaqZ9CUvgh1zQxYUS?=
 =?us-ascii?Q?0hBtdD3djUdPeahlErimzg1lk82izTG3NZHG1TqMF57DuejDgGZdBhRF1SGg?=
 =?us-ascii?Q?S3v+inbX8E8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6pHoW+ghX+YuMmXiROgWPjilFrCxuRcHnk6Zc+ubaurnDXp7kEhr816HjyZu?=
 =?us-ascii?Q?Xbx9w7zLfHy8J+KgY1P8P3E2tcuFlvViULujZXBN9IXrkqYMS1nTjnCEURv2?=
 =?us-ascii?Q?9RMIWKpoWgx034vhxBEQvV5Zmo9tgKrnhAvrRa/hhILShAHcqg38Itiy9BZ9?=
 =?us-ascii?Q?34eSbT1IrPvBoryANMPI+d3DD97IPhgH24TxTDQaNGcdq/kYIh6RbzTDMrwY?=
 =?us-ascii?Q?3lPZQFl61g9mWA1qbarHNOXI2gWwNJ05LrTpJ6LzCgAUxthHNVFOYfXsX66o?=
 =?us-ascii?Q?wqFb0jtyWkipxBb2qPaCjQl+alyloBfO5wqKldxDeqZEBTv8ai4RIih7YCLY?=
 =?us-ascii?Q?5idfRGmxAVseJ5rXh+uGASyxJL0j2drAL/Tgi7GOykdPE0YbkdEjZkEbCKQ1?=
 =?us-ascii?Q?uJYxvNVNpHIl/aG6ekTivh2cKz3WVl/qwCqgjxlekXZbVsGyBC3TPet2CY8N?=
 =?us-ascii?Q?C45xYvSPWVqzJl3zENmd2r92s7vvp6Xq99cHEzqORju/QirSAIyk11+dve+7?=
 =?us-ascii?Q?pXudMibhzNutJcu0TH7hVh5GTx/LrV2a8cLOqVttUcnhxO6VBV6IvrGG34EM?=
 =?us-ascii?Q?B5XHhuP9CYEjvZQtmBHC9maZeLRiE7r03rP2AA3hgivAwBnxbvzMyQ2Zo9M1?=
 =?us-ascii?Q?Cfe+PevCkV6Qvdjg/yICDdMC0t2AF1InayO03QojlBh7YbnSPX56lTnMgRKm?=
 =?us-ascii?Q?w20+w0G7Tln/G/i1Gd0Zyaa5S9hCyyCot6PbU+O6LU8p4gC1du76qSgs/Ej9?=
 =?us-ascii?Q?WEGZyBnd+bsWzMlJ1DatqgdGy/x7JeBmWqosX5uNdfDggPI3sF+NsyS7Tk0u?=
 =?us-ascii?Q?4eub7Z2kVo5+iWZeEsaJHdlSfaQz7xPRYL8HDA+fM4zdZnhpC8AHmUr7F1sR?=
 =?us-ascii?Q?ewXw4Mk6B3dxl+I6BiXtly0Xi6gM5TB4UXm/4m8dDs0xs1B+sn1ERhy1dG9M?=
 =?us-ascii?Q?GXBLbGgggjNCMbOPrs6D5LtkJxGV+MXqrl9EXXEMrrGrcpLR7HP8e+kLX4Ls?=
 =?us-ascii?Q?yd2dRQ8tmqr1cMAJqM1IaA8psk/h63IyOu2z22tt5FnYle44i9pJ4H11Ig9f?=
 =?us-ascii?Q?o3bf02PDGW/7bZWZdGP1YbMMR/CNoZwKEgkCvbo3cm2OIlKgeRbrTAQDNU+n?=
 =?us-ascii?Q?bJ2eMzATDwVe7ytV+tQ/cXfzdqYCV/8lUbZFu3Z/KHEa8wR/9Rc8I7YgAvHO?=
 =?us-ascii?Q?ZT4j7wEL/cArIsTky16c71h14njx7RGK9S1BPMK/JXp5gQ5olD0xgov+oAQ5?=
 =?us-ascii?Q?QpkHrmARa9aETFHXv+/85W5VAYK7Aw6aCv5L4xaVko9Y9oEPbYAT+yX44fO6?=
 =?us-ascii?Q?67eMEYic7OQNbjYEee/fHwkCD3ISbR2mTrYm+nQnAP+QDw3jhg74/BPQCiw1?=
 =?us-ascii?Q?kE5OLw/mpPNMOpoh6HU1EvkMtAj1sgYPFNTf1ludGnCCsopPf431sgPwyVlh?=
 =?us-ascii?Q?socXar1Vv3jwiz3b/hPU0pp3J67gaj3CN1cvF6S+NqjOB1FuDb+2uOUrk4/v?=
 =?us-ascii?Q?kKZanh4Io24AveoXiR3HweXpfGFdMlLfUV/QudiVMlkyLEBEH0M5eLZ3hKuH?=
 =?us-ascii?Q?PUnDASzPy4g9q4TtoFtQDq9e2OoPbFs3gWbx4pwpIRG/q7XSZjw9nH88mVRA?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc659d2a-5bda-4832-0f2e-08ddd66a7435
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 10:58:06.2609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4eG62DlKx580lADu06WxdQOO4bcO0y0zXVDDHj8HOD9Ga8dTjWviOstoMHZDJ22RP3lHFk6KmJPAGs6BqAzF1gVTMaA0AZ6XNkS/ChHH3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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

On Thu, Aug 07, 2025 at 08:24:02PM -0700, Matthew Brost wrote:
> Add prefetch-sys-benchmark to uses prefetch to system rather than
> faulting it back and measures prefetch to system bandwidth in GB/s.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 42 +++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index dd5303855d..2703b7f1e1 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -775,6 +775,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>  #define THREADS			(0x1 << 23)
>  #define PROCESSES		(0x1 << 24)
>  #define PREFETCH_BENCHMARK	(0x1 << 25)
> +#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)

Nits: It could help keep things unambiguous to use the same term here and
in printf() for SYS/SRAM, and also to rename PREFETCH_BENCHMARK to add the
direction.

Besides, test_exec() is becoming huge. This code section might be a good
candidate to extract as helper as it is almost a duplicate. Anyway, this
larger refactoring would be for a follow-up, so:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

>  
>  #define N_MULTI_FAULT		4
>  
> @@ -955,6 +956,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
>   * Test category: performance test
>   *
> + * SUBTEST: prefetch-sys-benchmark
> + * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch in both directions
> + * Test category: performance test
> + *
>   * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
>   * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
>   * Test category: stress test
> @@ -1022,7 +1027,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	struct aligned_alloc_type aligned_alloc_type;
>  	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
>  	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
> -	uint64_t prefetch_ns = 0;
> +	uint64_t prefetch_ns = 0, prefetch_system_ns = 0;
>  	const char *pf_count_stat = "svm_pagefault_count";
>  
>  	if (flags & MULTI_FAULT) {
> @@ -1350,8 +1355,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				} else {
>  					igt_assert_eq(data[idx].data,
>  						      READ_VALUE(&data[idx]));
> -					if (flags & PREFETCH_BENCHMARK)
> +					if (flags & PREFETCH_SYS_BENCHMARK) {
> +						struct timespec tv = {};
> +						u64 start, end;
> +
> +						sync[0].addr = to_user_pointer(bind_ufence);
> +
> +						start = igt_nsec_elapsed(&tv);
> +						xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
> +								     1, 0);
> +						end = igt_nsec_elapsed(&tv);
> +
> +						xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> +							       FIVE_SEC);
> +						bind_ufence[0] = 0;
> +
> +						prefetch_system_ns += (end - start);
> +					} else if (flags & PREFETCH_BENCHMARK) {
>  						memset(data, 5, bo_size);
> +					}
>  
>  					if (flags & MULTI_FAULT) {
>  						for (j = 1; j < N_MULTI_FAULT; ++j) {
> @@ -1438,11 +1460,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		prev_idx = idx;
>  	}
>  
> -	if (flags & PREFETCH_BENCHMARK)
> -		igt_info("Prefetch execution took %.3fms, %.1f5 GB/s\n",
> +	if (flags & PREFETCH_BENCHMARK) {
> +		igt_info("Prefetch VRAM execution took %.3fms, %.1f5 GB/s\n",
>  			 1e-6 * prefetch_ns,
>  			 bo_size * n_execs  / (float)prefetch_ns);
>  
> +		if (flags & PREFETCH_SYS_BENCHMARK)
> +			igt_info("Prefetch SRAM execution took %.3fms, %.1f5 GB/s\n",
> +				 1e-6 * prefetch_system_ns,
> +				 bo_size * n_execs  / (float)prefetch_system_ns);
> +	}
> +
>  	if (!(flags & FAULT) && flags & PREFETCH &&
>  	    (flags & MMAP || !(flags & (NEW | THREADS | PROCESSES)))) {
>  		int pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
> @@ -1917,6 +1945,12 @@ igt_main
>  			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
>  				  NULL, PREFETCH | PREFETCH_BENCHMARK);
>  
> +	igt_subtest_f("prefetch-sys-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
> +				  NULL, PREFETCH | PREFETCH_BENCHMARK |
> +				  PREFETCH_SYS_BENCHMARK);
> +
>  	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
>  		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
>  
> -- 
> 2.34.1
> 
