Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9E5C369BA
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 18:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C34D10E299;
	Wed, 16 Apr 2025 18:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLbNLFSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC4D10E299
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744828549; x=1776364549;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=B5YLttiFdg+Et98GmEyKt7eREDTNr8Wvj9kIfed8BFI=;
 b=lLbNLFSEYwjiUXVx7ZHf5Io9MC3ACdp0crIR3cqoLiiuFPJ3w7l/nBgm
 gPe/N1OolFUnimiW0cDLn0bZYaWJPzCQk+3noQDEtIt52FU6GhQWEBHSi
 8Lrd1DKnBqFN3I/gmorxUV/JbPqIUEHhGI3hRimtLukmoEspD7/kZY8vl
 cy3zJeqFVkaMVLxsRW6Ijo0l0SM1gTjWmmgHc7BVJlHiNVIjtr/MzfF3S
 XxJhLqe0URkx4Ha936Wy6+9mwGYT4BMXTcN/B4ADwnHiU+Cc7B0Bc2LRK
 1IwhVh7CtCJRX0ums5u4bj42SejoMznzA/t95OGrUclinMBQRv67jh8uJ Q==;
X-CSE-ConnectionGUID: NNkXya5pRxW03ZL0/19boQ==
X-CSE-MsgGUID: 3xkQ/emqTPGyXflbKMrQfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63802939"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="63802939"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:35:41 -0700
X-CSE-ConnectionGUID: J4hAcTO7R/6ERlotl8IXbw==
X-CSE-MsgGUID: ry/p2b1TRWy7HSXe3xdsNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="131095739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:35:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 11:35:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 11:35:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 11:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndX0o7KHQjwOucHJqUQsZ7FdeHz86wR6EothqBwksWNOJlDyq1hWGQtT17EzRuCV0MVn/WYhayKdrw//An5eDmLxFZuqznimNVBLTnBIlU+PHPdG5ydmF92PfnumNK6Ja7g1mNkdAuwCDqClyv/M2OoyXnxS5DUJfNMoGiSwhKjwdQA6BXmAs81WDmzzOMj5+wBvtvyPkFp5TmiKaAPwqpsvAmXygPDZ1Vcv6QLb9Hew6PsiK3y2ndFHHNvI00OoyHb7jQxG/PHkRYHGFxuBNxKCpHRavwqALyyL7blxpApkcICPd2kelirLZS9pNJ8+KtsAA/MabKH6Nc0ZwWchIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4FI9LzwcPlXSiED1mTSXCwunCMQuwKEJ62odXSp14g=;
 b=Wa2zEEHJYgS7OQ2m7kYXX+AXBqVVTD0A59hsvx6W1TE2Rok53G8mew0Q6JHM00WA/+ZNoAqctErJOu1+FKiBAGsEi2l1IFM5tQbx7lmBjeMoPhgqXO1UJGx7/2NA4NvuZjV2HeGYUjNPwkBQviZqOTPD9+rkJ+U254PdhL0JxOLI8odLHID4kHQ75wh/n4X3S4qh1mpmgVAcTjrpr0Xkktvzq83gbqL0W3O+iGkEUPUsyWBeN1/6u4r+XT7UvQcJCgjhhrShuRHF8ONnELk55+kgMbSmDu6A13M7UrElgbFHJREOyYk5lt0lzi5xM0ceeAQE/gchlYD3wrg7MlLgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7688.namprd11.prod.outlook.com (2603:10b6:930:75::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 18:35:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 18:35:09 +0000
Date: Wed, 16 Apr 2025 11:36:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/xe: Add system_allocator test
Message-ID: <Z//4rF6oSl/jlCjT@lstrano-desk.jf.intel.com>
References: <20250416022040.355100-1-matthew.brost@intel.com>
 <ac738d56a54052862f5e9fc74f905d05315c33c4.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac738d56a54052862f5e9fc74f905d05315c33c4.camel@linux.intel.com>
X-ClientProxiedBy: MW2PR16CA0031.namprd16.prod.outlook.com (2603:10b6:907::44)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb796dd-26ee-42e1-f271-08dd7d156a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fQmubo6SC3j63bepZt6MB4p+U91c7sb38z3Y3okpzIXzhRthD2KgfrJ025?=
 =?iso-8859-1?Q?ExGh5hsb4+tp3j9jmS87ebdtHq4xuWfD2ghAWjIxaMN0JBsjJHCi2cmHgy?=
 =?iso-8859-1?Q?P2ttj1hmGAxodULoXcu12XoOiGuU5B8ZQkRp1n2b1TheJXuyIRNiTtX05k?=
 =?iso-8859-1?Q?Si6aCXUBQgYwd9QW606vTgfWIpNj94yCxaa4wN/BuR7D57kixOMhKKfWC/?=
 =?iso-8859-1?Q?p1XJmu4wu+G5y5arKxK7EpNKkjBPJsnjVm8BaTzsUGt++xniArb8UhhP8l?=
 =?iso-8859-1?Q?87g+ZNybQCPTW0rI4rAcvsFJiEBwntWh5t89kCWRPfeRFXeV06UanUREbX?=
 =?iso-8859-1?Q?VzIFAq5RkJTg1x8ebrm1OGfKEB2rK+MYt04tNN5GayV251poLGLfOk8hfx?=
 =?iso-8859-1?Q?OAvYomg2Mvh6rifkWgm9kUnivqFJuj1ZGpesLQ8NmZlOjvpZHe4SZS38k1?=
 =?iso-8859-1?Q?MOYHF5x/5eW2jDeQtx9Erk4i9G7Jrc5w38UAI+Ifi3VKp7TCFJy6xfTPsM?=
 =?iso-8859-1?Q?tRkIWaPl/AE5vSIQqZdRAMn23X54en7Qg4Sx4rYohBY5ZnOp6d54sfIRJd?=
 =?iso-8859-1?Q?1viHgYWTy1ieMSeWQXiUiZ9rPxCR9Oy/g/cLSuVjFbbZmOoUBra6uGCifC?=
 =?iso-8859-1?Q?Kv/GZ6sG+daCtLt+ISSxpgWNkZ2lTDZaVDrQEWQthHEpiZ5ihHDvAq1y+x?=
 =?iso-8859-1?Q?ufjjEQi8+M2HqbhalgDYvpoM0aS+ctaZXzCghRnKZrIRzRQvkM3qP3iMJ0?=
 =?iso-8859-1?Q?6+YnkiYdnoPc9m/eIE/wbLi4rrOQ6MN+JqeUbtft/Psts2EbyIc6zJARF1?=
 =?iso-8859-1?Q?vIaKqUQ0AJ5UWq7XpfTcKZhAlL0uR86Zlcl0Q/b2hEk1qGwSOHisHHqSBN?=
 =?iso-8859-1?Q?h2jmhzZeYbcZaM1vhwKhxWktYrOwTsnR1TScUf9Ek1WbCCmfheibDEBQ1q?=
 =?iso-8859-1?Q?9tzZODN6+lNjuHCWshz/O8PRj3E7U+/gYBje/Miy5xx6H8QC0EIcmYgfTG?=
 =?iso-8859-1?Q?OXgBdHdP212fbsOxHYR93LTz///yhzqD9ySzGR/twp19CEow3lT5PmJ468?=
 =?iso-8859-1?Q?ynDT9xpk69cZ0v+ccp6KQkWBmEU6msG7SvnK74f3CH6Tnz+QZx+qHJwdrs?=
 =?iso-8859-1?Q?vMj3WE6Pst7aMa2cCWZCLV6tZkI1zES6VXFy4H+UTfrG7VvhQ1cqVs3GTC?=
 =?iso-8859-1?Q?M2UuVa3x5st6on3oOvg0tR9hfUCqSAM6D/Vo0WMPBgHRVPKbEJz0FjulHh?=
 =?iso-8859-1?Q?iO9q7eZlBmAdfh2nf7zk4ILeCpHTRNxQrUhDgsexPNURRtVJUKWxSsux2n?=
 =?iso-8859-1?Q?4d/zzYGldyll1yLPOYlZWZjWqPvw9nt6IO9ocSnbOMVgaXLSkqHVLkyVYY?=
 =?iso-8859-1?Q?2SXSQEixsYqu+mhjL4YKdl3qX6l/QWiJ+KRmnMLs0q/hP9L6FRwkXsbf5I?=
 =?iso-8859-1?Q?rdrPtXKV+eOYoGQQ5aZ/QfYyRLw5pIh/JdqkcIb0RgaEOfGIxBDxpL9XNz?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D6eS/cLRWswqqdSNwQ08dbvi3JILpa8FyQmyFGAhZEANHDoqQJM6f4sYX3?=
 =?iso-8859-1?Q?0abfCfbsBuz2ZDH+L3DlqkTjieC4BiYD44y2R5ONI0CrTFWs8A9viOPLWH?=
 =?iso-8859-1?Q?UEdDbF3dOV71+KoCsdTvEbyEUOawQb2PAok0vuRn7HazjeVnr8b4MV4odp?=
 =?iso-8859-1?Q?oamJOebeDV0FUaa7jJW689rUUI/koG/3K5UL9gsC60boj8/8sDzt/2dIut?=
 =?iso-8859-1?Q?wf8FVAb2/DEmHPPTatgaB0W6vQD0ftLQ9s95d/GyxDtdCmyEPdqMlAGoHF?=
 =?iso-8859-1?Q?d2dQ/SJoens4NyfH8M9z4YZLKYoLnSFuxz2vNkFzWsIPyVKcCrXbDeqCuX?=
 =?iso-8859-1?Q?PKYueLeQMDLIP5hM/ofMQMrhYZL/9h4inL7uNc/EdcmhCxYdYLLyf3lVGf?=
 =?iso-8859-1?Q?WQFYCpaSVtfnBxYMzHXRJKa5Pj7sH6N3CfWslb3qPrM1jm4Nspn/tH9HIJ?=
 =?iso-8859-1?Q?i+8ERnskXGLD/THR3lurYOCcEFCEZWcal2Yic2fwaMD0Q843MCwqhEQ1Pv?=
 =?iso-8859-1?Q?5OHmD6LTedAuOa4zLMx2wKomHFj5RP3dFcj0Md6mJ+OTzJQjIOPx17bC6+?=
 =?iso-8859-1?Q?vs1x6wopX8jrUwsc3Bl0ainoamwDIGJkCx3/5dSGnc/k76F+v8tKD8hYzF?=
 =?iso-8859-1?Q?eZ0LnyuFUVOPMxb+NNO6bui8CAnefdWO+7ZczPV4v25iyCkTUDC0zpm9Ly?=
 =?iso-8859-1?Q?GfQaXoO0H6ykS/beORPyIRw+KkjtNgsUGsh/RN3cqy2cjaEoYih8AVRCjb?=
 =?iso-8859-1?Q?TIjbbPkqceScmzYrrQZ0amfubJuLiHULNMk0x7gyCy0FYD4ks3lC+HpU0+?=
 =?iso-8859-1?Q?WQaXdnaWvbss6+ZEEiOSsdJaRpC+SJQJXvSStd7EFExCwWrdTE2nHeEoHV?=
 =?iso-8859-1?Q?qsJL+M+G+hpE0KKMlwL3xMmG/pJsRuqSz30Lu2X46WTcjjnFN2wl8/Wc5r?=
 =?iso-8859-1?Q?MjxsnUZczNDfwVKAg8eaX21ScTTrVaiL/jdR6Gp/mxbi38M7GK7V3FhcpY?=
 =?iso-8859-1?Q?1B3LYLh8L0Ce1nbhGtsbTIHQNUOB5rTNLkmMfUCoPkRhkE0RQwoiK2smzZ?=
 =?iso-8859-1?Q?a/zae/imIlE/uQPkc884F+yA8NnvLD6znPx5CS2qlWDJtb6ZD1Y3LXPcrO?=
 =?iso-8859-1?Q?+3siTTYTJzLJDJJewWBm/UYazFdwjyybb1n6Z2Liv0hXq3gh0w8v12fhxd?=
 =?iso-8859-1?Q?JsmWVIuPa4ZzTLpYOkijq+HBX3iNoO+wmUJNvvbfeexg5ZpOrnmHj7BCN9?=
 =?iso-8859-1?Q?J2TbzZTAbx5gUTnM/96PkVVcL4rk+FQ/ssCr00uxGGbKOJhx28XBUYtM3z?=
 =?iso-8859-1?Q?0I8gc32FROB+j9GQKzd1/wEaMFikjHJE/wODXlHPyB8VbeF20zKi1dWtlg?=
 =?iso-8859-1?Q?rpk38zvPPYrm8xhbudyeptFSBhNDY5sdgg45mJwtkvc0aM1MEjwOVc5aI8?=
 =?iso-8859-1?Q?A28TU5snainF2pzzD/zS0h/BZObA24Pf5WEUF2sUABI1cGnDjUaj5OSy8j?=
 =?iso-8859-1?Q?cWQJsv5q8VkoXEmvXSFBI6lkAqGpJtUSLqJf3xlt+Zi6gosEfhGUcAgVrp?=
 =?iso-8859-1?Q?EhC3pJJGhTX1qa0O8hBF3V8Z8l4D0EVLE6Jqf3KRq2J9GH1d5TezEEgDeC?=
 =?iso-8859-1?Q?jvuuK5FTJUXw8J53UTtvFSPiZr6xcDxQBblTMW+NB3R9aKMgbjfhUw5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb796dd-26ee-42e1-f271-08dd7d156a5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 18:35:09.0615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ditFLXvOq/B6xgNBTz1AJicf+6m8JoHUGZ4yPSqL/8hEhSPrl0pjElYXODX86jvdOFtVSC/p0iZziSgFwtV/nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7688
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

On Wed, Apr 16, 2025 at 07:09:40PM +0200, Thomas Hellström wrote:
> Hi, Matt,
> 
> On Tue, 2025-04-15 at 19:20 -0700, Matthew Brost wrote:
> > Test various uses of system allocator in single thread, multiple
> > threads, and multiple processes.
> > 
> > Features tested:
> >  - Malloc with various size
> >  - Mmap with various sizes and flags including file backed mappings
> >  - Mixing BO allocations with system allocator
> >  - Various page sizes
> >  - Dynamically freeing / unmapping memory
> >  - Sharing VM across threads
> >  - Faults racing on different hardware engines / GTs / Tiles
> >  - GPU faults and CPU faults racing
> >  - CPU faults on multiple threads racing
> >  - CPU faults on multiple process racing
> >  - GPU faults of memory not faulted in by CPU
> >  - Partial unmap of allocations
> >  - Attempting to unmap system allocations when GPU has mappings
> >  - Eviction of both system allocations and BOs
> >  - Forking child processes and reading data from VRAM
> >  - mremap data in VRAM
> >  - Protection changes
> >  - Multiple faults per execbuf
> > 
> > Running on LNL, BMG, PVC 1 tile, and PVC 2 tile.
> > 
> > v2:
> >  - Rebase
> >  - Fix memory allocation to not interfear with malloc (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Did you have a chance to look at the memory (or rather virtual
> adddress) leaks on the tests as well?  
> With the old version it would exceed 1GB after some time, which I
> believe caused some slowdown.
> 

I have not looked at that - rather just fixed mmaping mallocs which
would eventually cause the test to fail with -ENOSPC (e.g. if just ran
xe_exec_system_alloc eventually everything started to fail whereas now I
can run xe_exec_system_alloc to completion).

I wonder if the way I changed memory allocation fixed the leaks, let me
try running under valgrind and see if anything pops.

Matt

> Unfortunately the igt library funcs also leaks memory so running the
> test under valgrind was a bit noisy, but helped to some extent.
> 
> /Thomas
> 
