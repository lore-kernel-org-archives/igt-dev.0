Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF38C369D7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 07:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E161A10E894;
	Fri, 25 Apr 2025 07:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juiQn5W2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A1B10E894
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 07:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745564909; x=1777100909;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aNzvOnIjCmI10YaBF8ptTZgPmYGmozVx+gY+gQSx/i8=;
 b=juiQn5W2kHfvh++oDgq6w6rB2QwdM23fj3A3N6aiUtDkvpdUBlimxetO
 L81UVPfT8xEzu5/2C7lAhH79q7NVyhoSVRABcDNdGuAO2u/JPJnEfeGYH
 wFADniZHetWUumo+vpHzdW+iLwVfAH6ngghojUvVxX23MTTxMhFzyTPfG
 4IM1ZMqfWyGP4TpAkDgHrVAFcYySCqd94WqSbkLdD/nf3SY0zoUbk0l7s
 YoM8Ig8Q6k9Rvbqtlb+YQlBjKrD2xTNNXQxvHITUaH/79DsZb5F+Mjaab
 lCV8P/fj3yljydOBV+r4LDWM/pSTaNWCIS6nmOCGsDebHCRLYVmx/5qNg Q==;
X-CSE-ConnectionGUID: QTfFaMFYTgmVpX8I0FXJ8Q==
X-CSE-MsgGUID: 8osFJw36Q2OTZLmi5TAtbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64636459"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="64636459"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 00:08:29 -0700
X-CSE-ConnectionGUID: r8XSHTuvReKIJvPJEX3hfw==
X-CSE-MsgGUID: oUfKwRnGTcWs82WceRMkvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132574089"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 00:08:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 00:08:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 00:08:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 00:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MV7aF8kcA0FOZZCPDLS6i14j0AG9GMufHVdQCRTMPsFwHBcq8hyoX74Pmj4P3jS4BdUTQRRHlDldEUC9kFj2FW6f7+voNCU2aO5w85lPf8Ez5q84Bb6Hwe4nvU4MVpzYWr2j/YezWs/esm+JFC5JPTGSB09BsibBE5HpUxHA5mc/ILzZ8RIqgAcmOF2KXQ9lA5l4RKKBJ1BLa4rnFNs2JfgTvAGTpWZbciERkEKVJ690Q2aHvxArkkipv4+pd62lha+25xoF0hGUrIbSZirwyvmZgxYQi9kleBAZqyrigRZpLBFclrbSZ6Qqbt3rHWXvw2wJ+fmcqIaegwZ91EI1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2TJtSVHyc52VXQ5l4rGh7NyNXe4sMWzjOGkiwiBfW0=;
 b=FI8XfVFskZLAetiPMeAbNIwOEfLSXSLVMbZn2Ml5Gm9rqFDwDD0AmkOTUWIjSPzgvmtQ31W/c4x+cub6fWdMbdMPitJEvGbFhvVuA6nL13e+GDIUe0CwKoyvKpc8GR6K+cWHe8fv5+/BsrxLSdGyRcnBeehrMmrKOjVU33Ucz6Xz9/3nJk5lyqvAt4yQt9W1pBlfqghxrJvx2JD01OeSkLajwKpTEYmDN8vFSANTAijeH88wCvVe3WG5d34Q/w8QfLPTXuXo/hZprzyfhPoDyxhbCdQSv/gAKcr0ok1sfJQZZn63jIzwsB2IFF+VZLEWGLKSWTmPpbzGSdffNJkVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 07:08:23 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 07:08:23 +0000
Date: Fri, 25 Apr 2025 09:06:50 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] tests/xe: Add system_allocator test
Message-ID: <aAs0inUFNpuawTI2@fdugast-desk>
References: <20250424204406.656794-1-matthew.brost@intel.com>
 <20250424204406.656794-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424204406.656794-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR08CA0244.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1354f3-df29-453d-8f19-08dd83c7f75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?h3RaoU/niUUQXcg+jG/Ld6czIQFf17+FJCQLolU23fdN/wf18rpUakVwNb?=
 =?iso-8859-1?Q?8Xyomconuk6izb1lqhJrMGstFU8crOHCC4d824RTeF97AEyfk5qnkBwIyE?=
 =?iso-8859-1?Q?o97VYQaJ9BnUMVtO8JW0tHMbLdZXbInaNo11+O0OjioODxP1hed7YMDQvM?=
 =?iso-8859-1?Q?DO2ro2yXTT6uNLj8cBjBDF6MA6A6Dez5ISW7XKPKhBceS3JKUAe4w5xHt/?=
 =?iso-8859-1?Q?en/5HU2gAyjdoEZRBmxKIpAjDrRZwiwCrkodsRzjBUB0ncEVtXpPojKurk?=
 =?iso-8859-1?Q?hy4ZvwEtrP3Xrd0Q5YwtTUyCmLCajrVq1omjMgPawvuJrvVsRgiCFGlOaP?=
 =?iso-8859-1?Q?6cCkuC3QLnLa8+tXnomOXTHWcbw+gSSBcDMGYfqKrhEYqQoKP2dbrg/kzO?=
 =?iso-8859-1?Q?vfpEIkmvTZ8XICv49TUcnPTkX9EJSQtsMVRQ0iA80D9yjLOSX6sbRQhv+v?=
 =?iso-8859-1?Q?mRCemhXt8UWIre5Bq5Jmyu5AtkKUFszrTEC3INJ+osUtd0eNU5RZ316UYm?=
 =?iso-8859-1?Q?ftku46t3N2ih0Abm/2A0D3Ko2L2bpjQpzlX1cdYiQqhUCrbVP43NNG9E7E?=
 =?iso-8859-1?Q?0LlPIsyUTod+JsAhw5639/5NYLsRjurTctVVNjacX2uMvSlgAObwMGnxW+?=
 =?iso-8859-1?Q?GbeKtkO3vclw/DRc+XQ3DXf7DIvJfrnFcLc63XvHKy//cw8XfMFryU3Jda?=
 =?iso-8859-1?Q?9hEKFP5VRKL7YVTcBIGcvCtUYEgeuxpTUZX+HDK0kIwFnJoEG9kSzYomui?=
 =?iso-8859-1?Q?HZAK9vgL2Ydam8wzcDLS/MwHBn0jvnosn0yeiarpWscZxrrUGkALJI372W?=
 =?iso-8859-1?Q?sgpTXwI8sLW+0afQD+NDiskxvSm1O3hm+nitpPl5+f5TqCkzyPaWB0Boez?=
 =?iso-8859-1?Q?gsEyEpt2pmEAYVPQs6qn3jOPSlOgJezZaXlGFeyk/AbbEMB5GcWt91C+67?=
 =?iso-8859-1?Q?rv+oXHqZ6a1eaF6ljlkZ+eR/talcTcOfKoE0yqIukjBrG10oV3xK51Zqw4?=
 =?iso-8859-1?Q?FamBADkp0XgSfC0foaZOme3aqsIXQJnSoIXpE9JHsru1v0FnSN9nbd9962?=
 =?iso-8859-1?Q?A0Ipv5BcQrS/CZkV6DsJNavQF/kzrdD/acNSlrXoPl7vAmseTZxvZQujUx?=
 =?iso-8859-1?Q?VdN1xsjg9j3GP4ZrmCy4u53N6Jce5JefMxLI2cCr6OGjp+zzYVOkT0rknD?=
 =?iso-8859-1?Q?l6FJvkCZUT91Pl9KE4dymHISFn1lMI+jAUtPl5Fxerz5D2p/gzaXT/me4m?=
 =?iso-8859-1?Q?uckWfdx9fNK6ABGfpouFlil2lm7aIMYjXY/u5xXxCDy8fQ3XpHRBaTiOE4?=
 =?iso-8859-1?Q?yxTyu4hXOxr3+DQMtMiQLPeZnDGDzsvGFi/qALoL/X+H5U07RjAgJ6kCAk?=
 =?iso-8859-1?Q?IbWANm3hzMiaK3VwQmt13/4nQ5IJDfNKmxE54AM7fMrzfXw8onnxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?h2blie/htHTDprfI1xy6VJGi+U7luertY4V/Mt6KqjwcPEjRfZSsvjA95u?=
 =?iso-8859-1?Q?ZwGUKSVLL+ynMALa0sp/5lyW+HKqdqr2bItbY5LMD0miLd0R+Rzo0vZ2XH?=
 =?iso-8859-1?Q?UTvlm0tVlZ1/ZcC81CxVUD1iGeBEoeIFlPqLrCyXbI60F2LsfVQTY+hmrU?=
 =?iso-8859-1?Q?huunLqRFV6JZZnbrA4TezVyTy6EIvgkDS7G11FPVTgXahTuOdxpGVCjVQ3?=
 =?iso-8859-1?Q?ND64Iz1blYlUL7To+kWxAzXC/R24NaC9Z0luEIFk6IL5YHhk8EzOJi7wcd?=
 =?iso-8859-1?Q?79b37oaTLDqeoos0ZaqpUgtcqRjVp53GHBLCV9gD5s2bvzL9ftmEcdCTQO?=
 =?iso-8859-1?Q?owAG+X3HfkL/6t3MfQeOIUDhQdb8atxMi+cKvnudnhdAdUqgJ7hIyRUxXc?=
 =?iso-8859-1?Q?MX8I8DNN6QIFhv3W4lHMooF10lSnhqWMSxEW/k2QDQBu+0VQonuBUCwPgh?=
 =?iso-8859-1?Q?EvfGW4CIWchGKN65ao5caz1IXI3I0oOP+O+YhdgNJPrDaah+wiodMUkB9V?=
 =?iso-8859-1?Q?0kNlNnpW4CVQs5aLQBpoVRG5OyKVsPP4sNOVomKRFCjMBkYmCQEMZa9927?=
 =?iso-8859-1?Q?oRBvQa2PBSALJchF9Qd2CmyHZC4x+TecCasBNuLLYMRmb3NkkIf4gRLBlK?=
 =?iso-8859-1?Q?O17c2TiIGlUqZNtbaMm7lEYsH2vu9YjapbAQLsTLXXyO9Mp57j2Kg07cLH?=
 =?iso-8859-1?Q?e/u6WnyCoKF7n5NEa3g8k9MUgIGN0XdpGlvpe2H2jWXxjdsSlbqhfZLtR0?=
 =?iso-8859-1?Q?1KWIHUmaBIDlwmqF8b6oP2wl5XbXBZi8Hl8r5+9fpO3p7Kew7L191EMHVC?=
 =?iso-8859-1?Q?GB892WxNZjHWtWYrwds1/Ym68+znhkKH9sgklhrpIT2wqBVzjlr/lv4M08?=
 =?iso-8859-1?Q?0BM6+WWDTQrWfPr/X/khiQFdfCv54GXGj4EIeTvRl4HFuJlB9MmqBxnzoF?=
 =?iso-8859-1?Q?f/7/kkiu0JvhIykNKe741bhO/lGyjWF/SxvGWZkXtObKrr5r76cv2q3J+q?=
 =?iso-8859-1?Q?FQ2NbVTj6Gu6083nAaU4y3k9RkshlWIYmlR1Zl8/JVeVktphemp96ksdmz?=
 =?iso-8859-1?Q?myUzmcM3mkL38WcIaP8KfZxA+dg7+Jwou6z+vermgOLWcC3zpj1AMxKIx6?=
 =?iso-8859-1?Q?0CvkGNLv8xWYHrGM7Agj4LIIlZnZBVwZNU33D+APev26EMQhM+a/4SkiBc?=
 =?iso-8859-1?Q?xPVJdfIsSHUko3gok3clA0fvGC6C8GU7GCQrETqk/CvhHxAchcmGbPGXo1?=
 =?iso-8859-1?Q?rX6Yw3/zGVeMRauOOVmO7v6rpq4sACtpxMcbM+rF0ju5lh49vPEIiVGtHf?=
 =?iso-8859-1?Q?c+4opNnVzy6WCD1jk9xAQiiisDWmwOmRuobzxaFEcU0e+GOyo3nnfKPAIg?=
 =?iso-8859-1?Q?SniyQ3Khpyel9pDp2sa6ZyXovEQqk4R14Qgo7R7oxR/4JZunUMw7RXsskr?=
 =?iso-8859-1?Q?rrmMF7KZkCSHl8nTnTrOX37LsOH6F6us7D20BqCNF8ccIYKMTII/EIMIOj?=
 =?iso-8859-1?Q?J6BmAGtG/s5koqUMjY/dU20mRu8zbTlOOpzMFohwj513l0znkSmLbVmC6u?=
 =?iso-8859-1?Q?8+bkhGokmm6RSzf181te76j/CO8Qc3GIMQWkpkGJsbxz2bIbh75GbTG6tv?=
 =?iso-8859-1?Q?72jHMB2dEf0HjaIsCYKFx6t0PeHhjC5JUph/2E4CXF2/MGvwATsguzvA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1354f3-df29-453d-8f19-08dd83c7f75d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 07:08:23.2511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFgd83rPCFULhugWAzb0DdNKm0H7+WKzrjlvYA5IEKIetzAo5HMJ1ty8d5BojAzMBiVxcSsUEMFhWvvsRflQcQiPpk3wCWE60s059OeR4go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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

On Thu, Apr 24, 2025 at 01:44:06PM -0700, Matthew Brost wrote:
> Test various uses of system allocator in single thread, multiple
> threads, and multiple processes.
> 
> Features tested:
>  - Malloc with various size
>  - Mmap with various sizes and flags including file backed mappings
>  - Mixing BO allocations with system allocator
>  - Various page sizes
>  - Dynamically freeing / unmapping memory
>  - Sharing VM across threads
>  - Faults racing on different hardware engines / GTs / Tiles
>  - GPU faults and CPU faults racing
>  - CPU faults on multiple threads racing
>  - CPU faults on multiple process racing
>  - GPU faults of memory not faulted in by CPU
>  - Partial unmap of allocations
>  - Attempting to unmap system allocations when GPU has mappings
>  - Eviction of both system allocations and BOs
>  - Forking child processes and reading data from VRAM
>  - mremap data in VRAM
>  - Protection changes
>  - Multiple faults per execbuf
> 
> Running on LNL, BMG, PVC 1 tile, and PVC 2 tile.
> 
> v2:
>  - Rebase
>  - Fix memory allocation to not interfear with malloc (Thomas)
> v3:
>  - Fix memory leak (Francois)
>  - Break out uAPI into own patch (Francois)
>  - Use mkstemp for sync file (Francois)
>  - Use mkstemp for file backed data (Francois)
>  - Drop i argument from READ_VALUE (Francois)
>  - Fix test description (Francois)
>  - Add comment to check_all_pages_process (Francois)
>  - Prefer igt_info over printf (Francois)
>  - Fix types in messages (Francois)
>  - Prefer odd macro (Francois)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Earlier comments [1] are addressed, thanks.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

[1] https://patchwork.freedesktop.org/patch/648841/?series=137545&rev=4#comment_1189490

Francois

> ---
>  lib/xe/xe_ioctl.c                      |   12 +
>  lib/xe/xe_ioctl.h                      |    1 +
>  tests/intel/xe_exec_system_allocator.c | 1849 ++++++++++++++++++++++++
>  tests/meson.build                      |    1 +
>  4 files changed, 1863 insertions(+)
>  create mode 100644 tests/intel/xe_exec_system_allocator.c
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index fb8c4aef13..785fc9184c 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -440,6 +440,18 @@ void *xe_bo_map(int fd, uint32_t bo, size_t size)
>  	return __xe_bo_map(fd, bo, size, PROT_WRITE);
>  }
>  
> +void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
> +{
> +	uint64_t mmo;
> +	void *map;
> +
> +	mmo = xe_bo_mmap_offset(fd, bo);
> +	map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
> +	igt_assert(map != MAP_FAILED);
> +
> +	return map;
> +}
> +
>  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
>  {
>  	return __xe_bo_map(fd, bo, size, prot);
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 9bdf73b2bd..554a33c9cd 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -86,6 +86,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
>  void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
>  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
>  void *xe_bo_map(int fd, uint32_t bo, size_t size);
> +void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
>  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
>  int __xe_exec(int fd, struct drm_xe_exec *exec);
>  void xe_exec(int fd, struct drm_xe_exec *exec);
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> new file mode 100644
> index 0000000000..4839090cb2
> --- /dev/null
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -0,0 +1,1849 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: Basic tests for execbuf functionality using system allocator
> + * Category: Core
> + * Mega feature: USM
> + * Sub-category: System allocator
> + * Functionality: fault mode, system allocator
> + * GPU: LNL, BMG, PVC
> + */
> +
> +#include <fcntl.h>
> +#include <linux/mman.h>
> +#include <time.h>
> +
> +#include "igt.h"
> +#include "lib/igt_syncobj.h"
> +#include "lib/intel_reg.h"
> +#include "xe_drm.h"
> +
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +#include <string.h>
> +
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define QUARTER_SEC		(NSEC_PER_SEC / 4)
> +#define FIVE_SEC		(5LL * NSEC_PER_SEC)
> +
> +struct batch_data {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
> +
> +#define WRITE_VALUE(data__, i__)	({			\
> +	if (!(data__)->expected_data)				\
> +		(data__)->expected_data = rand() << 12 | (i__);	\
> +	(data__)->expected_data;				\
> +})
> +#define READ_VALUE(data__)	((data__)->expected_data)
> +
> +static void __write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
> +			int *idx)
> +{
> +	batch[(*idx)++] = MI_STORE_DWORD_IMM_GEN4;
> +	batch[(*idx)++] = sdi_addr;
> +	batch[(*idx)++] = sdi_addr >> 32;
> +	batch[(*idx)++] = wdata;
> +}
> +
> +static void write_dword(uint32_t *batch, uint64_t sdi_addr, uint32_t wdata,
> +			int *idx)
> +{
> +	__write_dword(batch, sdi_addr, wdata, idx);
> +	batch[(*idx)++] = MI_BATCH_BUFFER_END;
> +}
> +
> +static void check_all_pages(void *ptr, uint64_t alloc_size, uint64_t stride,
> +			    pthread_barrier_t *barrier)
> +{
> +	int i, n_writes = alloc_size / stride;
> +
> +	for (i = 0; i < n_writes; ++i) {
> +		struct batch_data *data = ptr + i * stride;
> +
> +		igt_assert_eq(data->data, READ_VALUE(data));
> +
> +		if (barrier)
> +			pthread_barrier_wait(barrier);
> +	}
> +}
> +
> +static char sync_file[] = "/tmp/xe_exec_system_allocator_syncXXXXXX";
> +static int sync_fd;
> +
> +static void open_sync_file(void)
> +{
> +	sync_fd = mkstemp(sync_file);
> +}
> +
> +static void close_sync_file(void)
> +{
> +	close(sync_fd);
> +}
> +
> +struct process_data {
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	pthread_barrier_t barrier;
> +	bool go;
> +};
> +
> +static void wait_pdata(struct process_data *pdata)
> +{
> +	pthread_mutex_lock(&pdata->mutex);
> +	while (!pdata->go)
> +		pthread_cond_wait(&pdata->cond, &pdata->mutex);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +static void init_pdata(struct process_data *pdata, int n_engine)
> +{
> +	pthread_mutexattr_t mutex_attr;
> +	pthread_condattr_t cond_attr;
> +	pthread_barrierattr_t barrier_attr;
> +
> +	pthread_mutexattr_init(&mutex_attr);
> +	pthread_mutexattr_setpshared(&mutex_attr, PTHREAD_PROCESS_SHARED);
> +	pthread_mutex_init(&pdata->mutex, &mutex_attr);
> +
> +	pthread_condattr_init(&cond_attr);
> +	pthread_condattr_setpshared(&cond_attr, PTHREAD_PROCESS_SHARED);
> +	pthread_cond_init(&pdata->cond, &cond_attr);
> +
> +	pthread_barrierattr_init(&barrier_attr);
> +	pthread_barrierattr_setpshared(&barrier_attr, PTHREAD_PROCESS_SHARED);
> +	pthread_barrier_init(&pdata->barrier, &barrier_attr, n_engine);
> +
> +	pdata->go = false;
> +}
> +
> +static void signal_pdata(struct process_data *pdata)
> +{
> +	pthread_mutex_lock(&pdata->mutex);
> +	pdata->go = true;
> +	pthread_cond_broadcast(&pdata->cond);
> +	pthread_mutex_unlock(&pdata->mutex);
> +}
> +
> +/* many_alloc flags */
> +#define MIX_BO_ALLOC		(0x1 << 0)
> +#define BENCHMARK		(0x1 << 1)
> +#define CPU_FAULT_THREADS	(0x1 << 2)
> +#define CPU_FAULT_PROCESS	(0x1 << 3)
> +#define CPU_FAULT_SAME_PAGE	(0x1 << 4)
> +
> +static void process_check(void *ptr, uint64_t alloc_size, uint64_t stride,
> +			  unsigned int flags)
> +{
> +	struct process_data *pdata;
> +	int map_fd;
> +
> +	map_fd = open(sync_file, O_RDWR, 0x666);
> +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +	wait_pdata(pdata);
> +
> +	if (flags & CPU_FAULT_SAME_PAGE)
> +		check_all_pages(ptr, alloc_size, stride, &pdata->barrier);
> +	else
> +		check_all_pages(ptr, alloc_size, stride, NULL);
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +/*
> + * Partition checking of results in chunks which causes multiple processes to
> + * fault same VRAM allocation in parallel.
> + */
> +static void
> +check_all_pages_process(void *ptr, uint64_t alloc_size, uint64_t stride,
> +			int n_process, unsigned int flags)
> +{
> +	struct process_data *pdata;
> +	int map_fd, i;
> +
> +	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
> +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +
> +	init_pdata(pdata, n_process);
> +
> +	for (i = 0; i < n_process; ++i) {
> +		igt_fork(child, 1)
> +			if (flags & CPU_FAULT_SAME_PAGE)
> +				process_check(ptr, alloc_size, stride, flags);
> +			else
> +				process_check(ptr + stride * i, alloc_size,
> +					      stride * n_process, flags);
> +	}
> +
> +	signal_pdata(pdata);
> +	igt_waitchildren();
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +struct thread_check_data {
> +	pthread_t thread;
> +	pthread_mutex_t *mutex;
> +	pthread_cond_t *cond;
> +	pthread_barrier_t *barrier;
> +	void *ptr;
> +	uint64_t alloc_size;
> +	uint64_t stride;
> +	bool *go;
> +};
> +
> +static void *thread_check(void *data)
> +{
> +	struct thread_check_data *t = data;
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (!*t->go)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	check_all_pages(t->ptr, t->alloc_size, t->stride, t->barrier);
> +
> +	return NULL;
> +}
> +
> +/*
> + * Partition checking of results in chunks which causes multiple threads to
> + * fault same VRAM allocation in parallel.
> + */
> +static void
> +check_all_pages_threads(void *ptr, uint64_t alloc_size, uint64_t stride,
> +			int n_threads, unsigned int flags)
> +{
> +	struct thread_check_data *threads_check_data;
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	pthread_barrier_t barrier;
> +	int i;
> +	bool go = false;
> +
> +	threads_check_data = calloc(n_threads, sizeof(*threads_check_data));
> +	igt_assert(threads_check_data);
> +
> +	pthread_mutex_init(&mutex, 0);
> +	pthread_cond_init(&cond, 0);
> +	pthread_barrier_init(&barrier, 0, n_threads);
> +
> +	for (i = 0; i < n_threads; ++i) {
> +		threads_check_data[i].mutex = &mutex;
> +		threads_check_data[i].cond = &cond;
> +		if (flags & CPU_FAULT_SAME_PAGE) {
> +			threads_check_data[i].barrier = &barrier;
> +			threads_check_data[i].ptr = ptr;
> +			threads_check_data[i].alloc_size = alloc_size;
> +			threads_check_data[i].stride = stride;
> +		} else {
> +			threads_check_data[i].barrier = NULL;
> +			threads_check_data[i].ptr = ptr + stride * i;
> +			threads_check_data[i].alloc_size = alloc_size;
> +			threads_check_data[i].stride = n_threads * stride;
> +		}
> +		threads_check_data[i].go = &go;
> +
> +		pthread_create(&threads_check_data[i].thread, 0, thread_check,
> +			       &threads_check_data[i]);
> +	}
> +
> +	pthread_mutex_lock(&mutex);
> +	go = true;
> +	pthread_cond_broadcast(&cond);
> +	pthread_mutex_unlock(&mutex);
> +
> +	for (i = 0; i < n_threads; ++i)
> +		pthread_join(threads_check_data[i].thread, NULL);
> +	free(threads_check_data);
> +}
> +
> +static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
> +			    uint64_t alloc_size, uint64_t stride,
> +			    struct timespec *tv, uint64_t *submit)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 0,
> +		.exec_queue_id = exec_queue,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	uint64_t addr = to_user_pointer(ptr);
> +	int i, ret, n_writes = alloc_size / stride;
> +	u64 *exec_ufence = NULL;
> +	int64_t timeout = FIVE_SEC;
> +
> +	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> +			   PROT_WRITE, MAP_SHARED |
> +			   MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_ufence != MAP_FAILED);
> +	memset(exec_ufence, 0, SZ_4K);
> +	sync[0].addr = to_user_pointer(exec_ufence);
> +
> +	for (i = 0; i < n_writes; ++i, addr += stride) {
> +		struct batch_data *data = ptr + i * stride;
> +		uint64_t sdi_offset = (char *)&data->data - (char *)data;
> +		uint64_t sdi_addr = addr + sdi_offset;
> +		int b = 0;
> +
> +		write_dword(data->batch, sdi_addr, WRITE_VALUE(data, i), &b);
> +		igt_assert(b <= ARRAY_SIZE(data->batch));
> +	}
> +
> +	igt_nsec_elapsed(tv);
> +	*submit = igt_nsec_elapsed(tv);
> +
> +	addr = to_user_pointer(ptr);
> +	for (i = 0; i < n_writes; ++i, addr += stride) {
> +		struct batch_data *data = ptr + i * stride;
> +		uint64_t batch_offset = (char *)&data->batch - (char *)data;
> +		uint64_t batch_addr = addr + batch_offset;
> +
> +		exec.address = batch_addr;
> +		if (i + 1 == n_writes)
> +			exec.num_syncs = 1;
> +		xe_exec(fd, &exec);
> +	}
> +
> +	ret = __xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queue,
> +			       &timeout);
> +	if (ret) {
> +		igt_info("FAIL EXEC_UFENCE_ADDR: 0x%016llx\n", sync[0].addr);
> +		igt_info("FAIL EXEC_UFENCE: EXPECTED=0x%016llx, ACTUAL=0x%016lx\n",
> +			 USER_FENCE_VALUE, exec_ufence[0]);
> +
> +		addr = to_user_pointer(ptr);
> +		for (i = 0; i < n_writes; ++i, addr += stride) {
> +			struct batch_data *data = ptr + i * stride;
> +			uint64_t batch_offset = (char *)&data->batch - (char *)data;
> +			uint64_t batch_addr = addr + batch_offset;
> +			uint64_t sdi_offset = (char *)&data->data - (char *)data;
> +			uint64_t sdi_addr = addr + sdi_offset;
> +
> +			igt_info("FAIL BATCH_ADDR: 0x%016lx\n", batch_addr);
> +			igt_info("FAIL SDI_ADDR: 0x%016lx\n", sdi_addr);
> +			igt_info("FAIL SDI_ADDR (in batch): 0x%016lx\n",
> +				 (((u64)data->batch[2]) << 32) | data->batch[1]);
> +			igt_info("FAIL DATA: EXPECTED=0x%08x, ACTUAL=0x%08x\n",
> +				 data->expected_data, data->data);
> +		}
> +		igt_assert_eq(ret, 0);
> +	}
> +	munmap(exec_ufence, SZ_4K);
> +}
> +
> +static int va_bits;
> +
> +#define bind_system_allocator(__sync, __num_sync)			\
> +	__xe_vm_bind_assert(fd, vm, 0,					\
> +			    0, 0, 0, 0x1ull << va_bits,			\
> +			    DRM_XE_VM_BIND_OP_MAP,			\
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,	\
> +			    (__sync), (__num_sync), 0, 0)
> +
> +#define unbind_system_allocator()				\
> +	__xe_vm_bind(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,	\
> +		     DRM_XE_VM_BIND_OP_UNMAP, 0,		\
> +		     NULL, 0, 0, 0, 0)
> +
> +#define odd(__i)	(__i & 1)
> +
> +struct aligned_alloc_type {
> +	void *__ptr;
> +	void *ptr;
> +	size_t __size;
> +	size_t size;
> +};
> +
> +static struct aligned_alloc_type __aligned_alloc(size_t alignment, size_t size)
> +{
> +	struct aligned_alloc_type aligned_alloc_type;
> +
> +	aligned_alloc_type.__ptr = mmap(NULL, alignment + size, PROT_NONE, MAP_PRIVATE |
> +			      MAP_ANONYMOUS, -1, 0);
> +	igt_assert(aligned_alloc_type.__ptr != MAP_FAILED);
> +
> +	aligned_alloc_type.ptr = (void *)ALIGN((uint64_t)aligned_alloc_type.__ptr, alignment);
> +	aligned_alloc_type.size = size;
> +	aligned_alloc_type.__size = size + alignment;
> +
> +	return aligned_alloc_type;
> +}
> +
> +static void __aligned_free(struct aligned_alloc_type  *aligned_alloc_type)
> +{
> +	munmap(aligned_alloc_type->__ptr, aligned_alloc_type->__size);
> +}
> +
> +static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_type)
> +{
> +	size_t begin_size = (size_t)(aligned_alloc_type->ptr - aligned_alloc_type->__ptr);
> +
> +	if (begin_size)
> +		munmap(aligned_alloc_type->__ptr, begin_size);
> +	if (aligned_alloc_type->__size - aligned_alloc_type->size - begin_size)
> +		munmap(aligned_alloc_type->ptr + aligned_alloc_type->size,
> +		       aligned_alloc_type->__size - aligned_alloc_type->size - begin_size);
> +}
> +
> +/**
> + * SUBTEST: unaligned-alloc
> + * Description: allocate unaligned sizes of memory
> + * Test category: functionality test
> + *
> + * SUBTEST: fault-benchmark
> + * Description: Benchmark how long GPU / CPU take
> + * Test category: performance test
> + *
> + * SUBTEST: fault-threads-benchmark
> + * Description: Benchmark how long GPU / CPU take, reading results with multiple threads
> + * Test category: performance and functionality test
> + *
> + * SUBTEST: fault-threads-same-page-benchmark
> + * Description: Benchmark how long GPU / CPU take, reading results with multiple threads, hammer same page
> + * Test category: performance and functionality test
> + *
> + * SUBTEST: fault-process-benchmark
> + * Description: Benchmark how long GPU / CPU take, reading results with multiple process
> + * Test category: performance and functionality test
> + *
> + * SUBTEST: fault-process-same-page-benchmark
> + * Description: Benchmark how long GPU / CPU take, reading results with multiple process, hammer same page
> + * Test category: performance and functionality test
> + *
> + * SUBTEST: evict-malloc
> + * Description: trigger eviction of VRAM allocated via malloc
> + * Test category: functionality test
> + *
> + * SUBTEST: evict-malloc-mix-bo
> + * Description: trigger eviction of VRAM allocated via malloc and BO create
> + * Test category: functionality test
> + *
> + * SUBTEST: processes-evict-malloc
> + * Description: multi-process trigger eviction of VRAM allocated via malloc
> + * Test category: stress test
> + *
> + * SUBTEST: processes-evict-malloc-mix-bo
> + * Description: multi-process trigger eviction of VRAM allocated via malloc and BO create
> + * Test category: stress test
> + */
> +
> +static void
> +many_allocs(int fd, struct drm_xe_engine_class_instance *eci,
> +	    uint64_t total_alloc, uint64_t alloc_size, uint64_t stride,
> +	    pthread_barrier_t *barrier, unsigned int flags)
> +{
> +	uint32_t vm, exec_queue;
> +	int num_allocs = flags & BENCHMARK ? 1 :
> +		(9 * (total_alloc / alloc_size)) / 8;
> +	struct aligned_alloc_type *allocs;
> +	uint32_t *bos = NULL;
> +	struct timespec tv = {};
> +	uint64_t submit, read, elapsed;
> +	int i;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	bind_system_allocator(NULL, 0);
> +
> +	allocs = malloc(sizeof(*allocs) * num_allocs);
> +	igt_assert(allocs);
> +	memset(allocs, 0, sizeof(*allocs) * num_allocs);
> +
> +	if (flags & MIX_BO_ALLOC) {
> +		bos = malloc(sizeof(*bos) * num_allocs);
> +		igt_assert(bos);
> +		memset(bos, 0, sizeof(*bos) * num_allocs);
> +	}
> +
> +	for (i = 0; i < num_allocs; ++i) {
> +		struct aligned_alloc_type alloc;
> +
> +		if (flags & MIX_BO_ALLOC && odd(i)) {
> +			uint32_t bo_flags =
> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +
> +			alloc = __aligned_alloc(SZ_2M, alloc_size);
> +			igt_assert(alloc.ptr);
> +
> +			bos[i] = xe_bo_create(fd, vm, alloc_size,
> +					      vram_if_possible(fd, eci->gt_id),
> +					      bo_flags);
> +			alloc.ptr = xe_bo_map_fixed(fd, bos[i], alloc_size,
> +						    to_user_pointer(alloc.ptr));
> +			xe_vm_bind_async(fd, vm, 0, bos[i], 0,
> +					 to_user_pointer(alloc.ptr),
> +					 alloc_size, 0, 0);
> +		} else {
> +			alloc.ptr = aligned_alloc(SZ_2M, alloc_size);
> +			igt_assert(alloc.ptr);
> +		}
> +		allocs[i] = alloc;
> +
> +		touch_all_pages(fd, exec_queue, allocs[i].ptr, alloc_size, stride,
> +				&tv, &submit);
> +	}
> +
> +	if (barrier)
> +		pthread_barrier_wait(barrier);
> +
> +	for (i = 0; i < num_allocs; ++i) {
> +		if (flags & BENCHMARK)
> +			read = igt_nsec_elapsed(&tv);
> +#define NUM_CHECK_THREADS	8
> +		if (flags & CPU_FAULT_PROCESS)
> +			check_all_pages_process(allocs[i].ptr, alloc_size, stride,
> +						NUM_CHECK_THREADS, flags);
> +		else if (flags & CPU_FAULT_THREADS)
> +			check_all_pages_threads(allocs[i].ptr, alloc_size, stride,
> +						NUM_CHECK_THREADS, flags);
> +		else
> +			check_all_pages(allocs[i].ptr, alloc_size, stride, NULL);
> +		if (flags & BENCHMARK) {
> +			elapsed = igt_nsec_elapsed(&tv);
> +			igt_info("Execution took %.3fms (submit %.1fus, read %.1fus, total %.1fus, read_total %.1fus)\n",
> +				 1e-6 * elapsed, 1e-3 * submit, 1e-3 * read,
> +				 1e-3 * (elapsed - submit),
> +				 1e-3 * (elapsed - read));
> +		}
> +		if (bos && bos[i]) {
> +			__aligned_free(allocs + i);
> +			gem_close(fd, bos[i]);
> +		} else {
> +			free(allocs[i].ptr);
> +		}
> +	}
> +	if (bos)
> +		free(bos);
> +	free(allocs);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +static void process_evict(struct drm_xe_engine_class_instance *hwe,
> +			  uint64_t total_alloc, uint64_t alloc_size,
> +			  uint64_t stride, unsigned int flags)
> +{
> +	struct process_data *pdata;
> +	int map_fd;
> +	int fd;
> +
> +	map_fd = open(sync_file, O_RDWR, 0x666);
> +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +	wait_pdata(pdata);
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	many_allocs(fd, hwe, total_alloc, alloc_size, stride, &pdata->barrier,
> +		    flags);
> +	drm_close_driver(fd);
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +static void
> +processes_evict(int fd, uint64_t alloc_size, uint64_t stride,
> +		unsigned int flags)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct process_data *pdata;
> +	int n_engine_gt[2] = { 0, 0 }, n_engine = 0;
> +	int map_fd;
> +
> +	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
> +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +
> +	xe_for_each_engine(fd, hwe) {
> +		igt_assert(hwe->gt_id < 2);
> +		n_engine_gt[hwe->gt_id]++;
> +		n_engine++;
> +	}
> +
> +	init_pdata(pdata, n_engine);
> +
> +	xe_for_each_engine(fd, hwe) {
> +		igt_fork(child, 1)
> +			process_evict(hwe,
> +				      xe_visible_vram_size(fd, hwe->gt_id) /
> +				      n_engine_gt[hwe->gt_id], alloc_size,
> +				      stride, flags);
> +	}
> +
> +	signal_pdata(pdata);
> +	igt_waitchildren();
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +#define CPU_FAULT	(0x1 << 0)
> +#define REMAP		(0x1 << 1)
> +#define MIDDLE		(0x1 << 2)
> +
> +/**
> + * SUBTEST: partial-munmap-cpu-fault
> + * Description: munmap partially with cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-munmap-no-cpu-fault
> + * Description: munmap partially with no cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-remap-cpu-fault
> + * Description: remap partially with cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-remap-no-cpu-fault
> + * Description: remap partially with no cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-middle-munmap-cpu-fault
> + * Description: munmap middle with cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-middle-munmap-no-cpu-fault
> + * Description: munmap middle with no cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-middle-remap-cpu-fault
> + * Description: remap middle with cpu access in between
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-middle-remap-no-cpu-fault
> + * Description: remap middle with no cpu access in between
> + * Test category: functionality test
> + */
> +
> +static void
> +partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	          .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint64_t vm_sync;
> +		uint64_t exec_sync;
> +		uint32_t data;
> +		uint32_t expected_data;
> +	} *data;
> +	size_t bo_size = SZ_2M, unmap_offset = 0;
> +	uint32_t vm, exec_queue;
> +	u64 *exec_ufence = NULL;
> +	int i;
> +	void *old, *new = NULL;
> +	struct aligned_alloc_type alloc;
> +
> +	if (flags & MIDDLE)
> +		unmap_offset = bo_size / 4;
> +
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	alloc = __aligned_alloc(bo_size, bo_size);
> +	igt_assert(alloc.ptr);
> +
> +	data = mmap(alloc.ptr, bo_size, PROT_READ | PROT_WRITE,
> +		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +	igt_assert(data != MAP_FAILED);
> +	memset(data, 0, bo_size);
> +	old = data;
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	bind_system_allocator(sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	data[0].vm_sync = 0;
> +
> +	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> +			   PROT_WRITE, MAP_SHARED |
> +			   MAP_ANONYMOUS, -1, 0);
> +	igt_assert(exec_ufence != MAP_FAILED);
> +	memset(exec_ufence, 0, SZ_4K);
> +
> +	for (i = 0; i < 2; i++) {
> +		uint64_t addr = to_user_pointer(data);
> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr = addr + sdi_offset;
> +		int b = 0;
> +
> +		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i), &b);
> +		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +
> +		if (!i)
> +			data = old + unmap_offset + bo_size / 2;
> +	}
> +
> +	data = old;
> +	exec.exec_queue_id = exec_queue;
> +
> +	for (i = 0; i < 2; i++) {
> +		uint64_t addr = to_user_pointer(data);
> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr = addr + batch_offset;
> +
> +		sync[0].addr = new ? to_user_pointer(new) :
> +			to_user_pointer(exec_ufence);
> +		exec.address = batch_addr;
> +		xe_exec(fd, &exec);
> +
> +		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
> +			       exec_queue, FIVE_SEC);
> +		if (i || (flags & CPU_FAULT))
> +			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> +		exec_ufence[0] = 0;
> +
> +		if (!i) {
> +			data = old + unmap_offset + bo_size / 2;
> +			munmap(old + unmap_offset, bo_size / 2);
> +			if (flags & REMAP) {
> +				new = mmap(old + unmap_offset, bo_size / 2,
> +					   PROT_READ | PROT_WRITE,
> +					   MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED |
> +					   MAP_LOCKED, -1, 0);
> +				igt_assert(new != MAP_FAILED);
> +			}
> +		}
> +	}
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	munmap(exec_ufence, SZ_4K);
> +	__aligned_free(&alloc);
> +	if (new)
> +		munmap(new, bo_size / 2);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +#define MAX_N_EXEC_QUEUES	16
> +
> +#define MMAP		(0x1 << 0)
> +#define NEW		(0x1 << 1)
> +#define BO_UNMAP	(0x1 << 2)
> +#define FREE		(0x1 << 3)
> +#define BUSY		(0x1 << 4)
> +#define BO_MAP		(0x1 << 5)
> +#define RACE		(0x1 << 6)
> +#define SKIP_MEMSET	(0x1 << 7)
> +#define FAULT		(0x1 << 8)
> +#define FILE_BACKED	(0x1 << 9)
> +#define LOCK		(0x1 << 10)
> +#define MMAP_SHARED	(0x1 << 11)
> +#define HUGE_PAGE	(0x1 << 12)
> +#define SHARED_ALLOC	(0x1 << 13)
> +#define FORK_READ	(0x1 << 14)
> +#define FORK_READ_AFTER	(0x1 << 15)
> +#define MREMAP		(0x1 << 16)
> +#define DONTUNMAP	(0x1 << 17)
> +#define READ_ONLY_REMAP	(0x1 << 18)
> +#define SYNC_EXEC	(0x1 << 19)
> +#define EVERY_OTHER_CHECK	(0x1 << 20)
> +#define MULTI_FAULT	(0x1 << 21)
> +
> +#define N_MULTI_FAULT	4
> +
> +/**
> + * SUBTEST: once-%s
> + * Description: Run %arg[1] system allocator test only once
> + * Test category: functionality test
> + *
> + * SUBTEST: once-large-%s
> + * Description: Run %arg[1] system allocator test only once with large allocation
> + * Test category: functionality test
> + *
> + * SUBTEST: twice-%s
> + * Description: Run %arg[1] system allocator test twice
> + * Test category: functionality test
> + *
> + * SUBTEST: twice-large-%s
> + * Description: Run %arg[1] system allocator test twice with large allocation
> + * Test category: functionality test
> + *
> + * SUBTEST: many-%s
> + * Description: Run %arg[1] system allocator test many times
> + * Test category: stress test
> + *
> + * SUBTEST: many-stride-%s
> + * Description: Run %arg[1] system allocator test many times with a stride on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: many-execqueues-%s
> + * Description: Run %arg[1] system allocator test on many exec_queues
> + * Test category: stress test
> + *
> + * SUBTEST: many-large-%s
> + * Description: Run %arg[1] system allocator test many times with large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: many-large-execqueues-%s
> + * Description: Run %arg[1] system allocator test on many exec_queues with large allocations
> + *
> + * SUBTEST: threads-many-%s
> + * Description: Run %arg[1] system allocator threaded test many times
> + * Test category: stress test
> + *
> + * SUBTEST: threads-many-stride-%s
> + * Description: Run %arg[1] system allocator threaded test many times with a stride on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: threads-many-execqueues-%s
> + * Description: Run %arg[1] system allocator threaded test on many exec_queues
> + * Test category: stress test
> + *
> + * SUBTEST: threads-many-large-%s
> + * Description: Run %arg[1] system allocator threaded test many times with large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: threads-many-large-execqueues-%s
> + * Description: Run %arg[1] system allocator threaded test on many exec_queues with large allocations
> + *
> + * SUBTEST: threads-shared-vm-many-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test many times
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-many-stride-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test many times with a stride on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-many-execqueues-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test on many exec_queues
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-many-large-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test many times with large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-many-large-execqueues-%s
> + * Description: Run %arg[1] system allocator threaded, shared vm test on many exec_queues with large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-%s
> + * Description: Run %arg[1] system allocator multi-process test many times
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-stride-%s
> + * Description: Run %arg[1] system allocator multi-process test many times with a stride on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-execqueues-%s
> + * Description: Run %arg[1] system allocator multi-process test on many exec_queues
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-large-%s
> + * Description: Run %arg[1] system allocator multi-process test many times with large allocations
> + * Test category: stress test
> + *
> + * SUBTEST: process-many-large-execqueues-%s
> + * Description: Run %arg[1] system allocator multi-process test on many exec_queues with large allocations
> + *
> + * SUBTEST: fault
> + * Description: use a bad system allocator address resulting in a fault
> + * Test category: bad input
> + *
> + * arg[1]:
> + *
> + * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
> + * @malloc-multi-fault:			malloc single buffer for all execs
> + * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
> + * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
> + * @malloc-mlock:			malloc and mlock single buffer for all execs
> + * @malloc-race:			malloc single buffer for all execs with race between cpu and gpu access
> + * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbind a BO to same address before execs
> + * @malloc-busy:			malloc single buffer for all execs, try to unbind while buffer valid
> + * @mmap:				mmap single buffer for all execs
> + * @mmap-remap:				mmap and mremap a buffer for all execs
> + * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
> + * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
> + * @mmap-remap-ro-dontunmap:		mmap and mremap a read-only buffer with dontunmap flag for all execs
> + * @mmap-remap-eocheck:			mmap and mremap a buffer for all execs, check data every other loop iteration
> + * @mmap-remap-dontunmap-eocheck:	mmap and mremap a buffer with dontunmap flag for all execs, check data every other loop iteration
> + * @mmap-remap-ro-eocheck:		mmap and mremap a read-only buffer for all execs, check data every other loop iteration
> + * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer with dontunmap flag for all execs, check data every other loop iteration
> + * @mmap-huge:				mmap huge page single buffer for all execs
> + * @mmap-shared:			mmap shared single buffer for all execs
> + * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
> + * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with dontunmap flag for all execs
> + * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all execs, check data every other loop iteration
> + * @mmap-shared-remap-dontunmap-eocheck:	mmap shared and mremap a buffer with dontunmap flag for all execs, check data every other loop iteration
> + * @mmap-mlock:				mmap and mlock single buffer for all execs
> + * @mmap-file:				mmap single buffer, with file backing, for all execs
> + * @mmap-file-mlock:			mmap and mlock single buffer, with file backing, for all execs
> + * @mmap-race:				mmap single buffer for all execs with race between cpu and gpu access
> + * @free:				malloc and free buffer for each exec
> + * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
> + * @new:				malloc a new buffer for each exec
> + * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
> + * @new-bo-map:				malloc a new buffer or map BO for each exec
> + * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
> + * @mmap-free:				mmap and free buffer for each exec
> + * @mmap-free-huge:			mmap huge page and free buffer for each exec
> + * @mmap-free-race:			mmap and free buffer for each exec with race between cpu and gpu access
> + * @mmap-new:				mmap a new buffer for each exec
> + * @mmap-new-huge:			mmap huge page a new buffer for each exec
> + * @mmap-new-race:			mmap a new buffer for each exec with race between cpu and gpu access
> + * @malloc-nomemset:			malloc single buffer for all execs, skip memset of buffers
> + * @malloc-mlock-nomemset:		malloc and mlock single buffer for all execs, skip memset of buffers
> + * @malloc-race-nomemset:		malloc single buffer for all execs with race between cpu and gpu access, skip memset of buffers
> + * @malloc-bo-unmap-nomemset:		malloc single buffer for all execs, bind and unbind a BO to same address before execs, skip memset of buffers
> + * @malloc-busy-nomemset:		malloc single buffer for all execs, try to unbind while buffer valid, skip memset of buffers
> + * @mmap-nomemset:			mmap single buffer for all execs, skip memset of buffers
> + * @mmap-huge-nomemset:			mmap huge page single buffer for all execs, skip memset of buffers
> + * @mmap-shared-nomemset:		mmap shared single buffer for all execs, skip memset of buffers
> + * @mmap-mlock-nomemset:		mmap and mlock single buffer for all execs, skip memset of buffers
> + * @mmap-file-nomemset:			mmap single buffer, with file backing, for all execs, skip memset of buffers
> + * @mmap-file-mlock-nomemset:		mmap and mlock single buffer, with file backing, for all execs, skip memset of buffers
> + * @mmap-race-nomemset:			mmap single buffer for all execs with race between cpu and gpu access, skip memset of buffers
> + * @free-nomemset:			malloc and free buffer for each exec, skip memset of buffers
> + * @free-race-nomemset:			malloc and free buffer for each exec with race between cpu and gpu access, skip memset of buffers
> + * @new-nomemset:			malloc a new buffer for each exec, skip memset of buffers
> + * @new-race-nomemset:			malloc a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
> + * @new-bo-map-nomemset:		malloc a new buffer or map BO for each exec, skip memset of buffers
> + * @new-busy-nomemset:			malloc a new buffer for each exec, try to unbind while buffers valid, skip memset of buffers
> + * @mmap-free-nomemset:			mmap and free buffer for each exec, skip memset of buffers
> + * @mmap-free-huge-nomemset:		mmap huge page and free buffer for each exec, skip memset of buffers
> + * @mmap-free-race-nomemset:		mmap and free buffer for each exec with race between cpu and gpu access, skip memset of buffers
> + * @mmap-new-nomemset:			mmap a new buffer for each exec, skip memset of buffers
> + * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
> + * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
> + *
> + * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
> + * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc-race
> + * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses, racing between CPU and GPU access
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-alloc-many-stride-malloc
> + * Description: Create multiple threads with a faults on different hardware engines to same addresses
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-alloc-many-stride-malloc-sync
> + * Description: Create multiple threads with a faults on different hardware engines to same addresses, syncing on each exec
> + * Test category: stress test
> + *
> + * SUBTEST: threads-shared-alloc-many-stride-malloc-race
> + * Description: Create multiple threads with a faults on different hardware engines to same addresses, racing between CPU and GPU access
> + * Test category: stress test
> + */
> +
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +};
> +
> +static void
> +test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> +	  int n_exec_queues, int n_execs, size_t bo_size,
> +	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
> +	  unsigned int flags)
> +{
> +	uint64_t addr;
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +	          .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	struct test_exec_data *data, *next_data = NULL;
> +	uint32_t bo_flags;
> +	uint32_t bo = 0;
> +	void **pending_free;
> +	u64 *exec_ufence = NULL;
> +	int i, j, b, file_fd = -1, prev_idx;
> +	bool free_vm = false;
> +	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> +	size_t orig_size = bo_size;
> +	struct aligned_alloc_type aligned_alloc_type;
> +
> +	if (flags & MULTI_FAULT) {
> +		if (!bo_size)
> +			return;
> +
> +		bo_size *= N_MULTI_FAULT;
> +	}
> +
> +	if (flags & SHARED_ALLOC)
> +		return;
> +
> +	if (flags & EVERY_OTHER_CHECK && odd(n_execs))
> +		return;
> +
> +	if (flags & EVERY_OTHER_CHECK)
> +		igt_assert(flags & MREMAP);
> +
> +	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> +
> +	if (flags & NEW && !(flags & FREE)) {
> +		pending_free = malloc(sizeof(*pending_free) * n_execs);
> +		igt_assert(pending_free);
> +		memset(pending_free, 0, sizeof(*pending_free) * n_execs);
> +	}
> +
> +	if (!vm) {
> +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +		free_vm = true;
> +	}
> +	if (!bo_size) {
> +		if (!stride) {
> +			bo_size = sizeof(*data) * n_execs;
> +			bo_size = xe_bb_size(fd, bo_size);
> +		} else {
> +			bo_size = stride * n_execs * sizeof(*data);
> +			bo_size = xe_bb_size(fd, bo_size);
> +		}
> +	}
> +	if (flags & HUGE_PAGE) {
> +		aligned_size = ALIGN(aligned_size, SZ_2M);
> +		bo_size = ALIGN(bo_size, SZ_2M);
> +	}
> +
> +	if (alloc) {
> +		data = alloc;
> +	} else {
> +		if (flags & MMAP) {
> +			int mmap_flags = MAP_FIXED;
> +
> +			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
> +			data = aligned_alloc_type.ptr;
> +			igt_assert(data);
> +			__aligned_partial_free(&aligned_alloc_type);
> +
> +			if (flags & MMAP_SHARED)
> +				mmap_flags |= MAP_SHARED;
> +			else
> +				mmap_flags |= MAP_PRIVATE;
> +
> +			if (flags & HUGE_PAGE)
> +				mmap_flags |= MAP_HUGETLB | MAP_HUGE_2MB;
> +
> +			if (flags & FILE_BACKED) {
> +				char name[] = "/tmp/xe_exec_system_allocator_datXXXXXX";
> +
> +				igt_assert(!(flags & NEW));
> +
> +				file_fd = mkstemp(name);
> +				posix_fallocate(file_fd, 0, bo_size);
> +			} else {
> +				mmap_flags |= MAP_ANONYMOUS;
> +			}
> +
> +			data = mmap(data, bo_size, PROT_READ |
> +				    PROT_WRITE, mmap_flags, file_fd, 0);
> +			igt_assert(data != MAP_FAILED);
> +		} else {
> +			data = aligned_alloc(aligned_size, bo_size);
> +			igt_assert(data);
> +		}
> +		if (!(flags & SKIP_MEMSET))
> +			memset(data, 0, bo_size);
> +		if (flags & LOCK) {
> +			igt_assert(!(flags & NEW));
> +			mlock(data, bo_size);
> +		}
> +	}
> +
> +	for (i = 0; i < n_exec_queues; i++)
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	if (free_vm) {
> +		bind_system_allocator(sync, 1);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	}
> +	data[0].vm_sync = 0;
> +
> +	addr = to_user_pointer(data);
> +
> +	if (flags & BO_UNMAP) {
> +		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +		bo = xe_bo_create(fd, vm, bo_size,
> +				  vram_if_possible(fd, eci->gt_id), bo_flags);
> +		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, 0, 0);
> +
> +		__xe_vm_bind_assert(fd, vm, 0,
> +				    0, 0, addr, bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
> +				    1, 0, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
> +			       FIVE_SEC);
> +		data[0].vm_sync = 0;
> +		gem_close(fd, bo);
> +		bo = 0;
> +	}
> +
> +	if (!(flags & RACE)) {
> +		exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
> +				   PROT_WRITE, MAP_SHARED |
> +				   MAP_ANONYMOUS, -1, 0);
> +		igt_assert(exec_ufence != MAP_FAILED);
> +		memset(exec_ufence, 0, SZ_4K);
> +	}
> +
> +	for (i = 0; i < n_execs; i++) {
> +		int idx = !stride ? i : i * stride, next_idx = !stride
> +			? (i + 1) : (i + 1) * stride;
> +		uint64_t batch_offset = (char *)&data[idx].batch - (char *)data;
> +		uint64_t batch_addr = addr + batch_offset;
> +		uint64_t sdi_offset = (char *)&data[idx].data - (char *)data;
> +		uint64_t sdi_addr = addr + sdi_offset;
> +		int e = i % n_exec_queues, err;
> +		bool fault_inject = (FAULT & flags) && i == n_execs / 2;
> +		bool fault_injected = (FAULT & flags) && i > n_execs;
> +
> +		if (barrier)
> +			pthread_barrier_wait(barrier);
> +
> +		if (flags & MULTI_FAULT) {
> +			b = 0;
> +			for (j = 0; j < N_MULTI_FAULT - 1; ++j)
> +				__write_dword(data[idx].batch,
> +					      sdi_addr + j * orig_size,
> +					      WRITE_VALUE(&data[idx], idx), &b);
> +			write_dword(data[idx].batch, sdi_addr + j * orig_size,
> +				    WRITE_VALUE(&data[idx], idx), &b);
> +			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> +		} else if (!(flags & EVERY_OTHER_CHECK)) {
> +			b = 0;
> +			write_dword(data[idx].batch, sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b);
> +			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> +		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
> +			b = 0;
> +			write_dword(data[idx].batch, sdi_addr,
> +				    WRITE_VALUE(&data[idx], idx), &b);
> +			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
> +
> +			aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
> +			next_data = aligned_alloc_type.ptr;
> +			igt_assert(next_data);
> +			__aligned_partial_free(&aligned_alloc_type);
> +
> +			b = 0;
> +			write_dword(data[next_idx].batch,
> +				    to_user_pointer(next_data) +
> +				    (char *)&data[next_idx].data - (char *)data,
> +				    WRITE_VALUE(&data[next_idx], next_idx), &b);
> +			igt_assert(b <= ARRAY_SIZE(data[next_idx].batch));
> +		}
> +
> +		if (!exec_ufence)
> +			data[idx].exec_sync = 0;
> +
> +		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
> +			addr + (char *)&data[idx].exec_sync - (char *)data;
> +
> +		exec.exec_queue_id = exec_queues[e];
> +		if (fault_inject)
> +			exec.address = batch_addr * 2;
> +		else
> +			exec.address = batch_addr;
> +
> +		if (fault_injected) {
> +			err = __xe_exec(fd, &exec);
> +			igt_assert(err == -ENOENT);
> +		} else {
> +			xe_exec(fd, &exec);
> +		}
> +
> +		if (barrier)
> +			pthread_barrier_wait(barrier);
> +
> +		if (fault_inject || fault_injected) {
> +			int64_t timeout = QUARTER_SEC;
> +
> +			err = __xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> +					       &data[idx].exec_sync,
> +					       USER_FENCE_VALUE,
> +					       exec_queues[e], &timeout);
> +			igt_assert(err == -ETIME || err == -EIO);
> +		} else {
> +			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
> +				       &data[idx].exec_sync, USER_FENCE_VALUE,
> +				       exec_queues[e], FIVE_SEC);
> +			if (flags & LOCK && !i)
> +				munlock(data, bo_size);
> +
> +			if (flags & MREMAP) {
> +				void *old = data;
> +				int remap_flags = MREMAP_MAYMOVE | MREMAP_FIXED;
> +
> +				if (flags & DONTUNMAP)
> +					remap_flags |= MREMAP_DONTUNMAP;
> +
> +				if (flags & READ_ONLY_REMAP)
> +					igt_assert(!mprotect(old, bo_size,
> +							     PROT_READ));
> +
> +				if (!next_data) {
> +					aligned_alloc_type = __aligned_alloc(aligned_size,
> +								    bo_size);
> +					data = aligned_alloc_type.ptr;
> +					__aligned_partial_free(&aligned_alloc_type);
> +				} else {
> +					data = next_data;
> +				}
> +				next_data = NULL;
> +				igt_assert(data);
> +
> +				data = mremap(old, bo_size, bo_size,
> +					      remap_flags, data);
> +				igt_assert(data != MAP_FAILED);
> +
> +				if (flags & READ_ONLY_REMAP)
> +					igt_assert(!mprotect(data, bo_size,
> +							     PROT_READ |
> +							     PROT_WRITE));
> +
> +				addr = to_user_pointer(data);
> +				if (flags & DONTUNMAP)
> +					munmap(old, bo_size);
> +			}
> +
> +			if (!(flags & EVERY_OTHER_CHECK) || odd(i)) {
> +				if (flags & FORK_READ) {
> +					igt_fork(child, 1)
> +						igt_assert_eq(data[idx].data,
> +							      READ_VALUE(&data[idx]));
> +					if (!(flags & FORK_READ_AFTER))
> +						igt_assert_eq(data[idx].data,
> +							      READ_VALUE(&data[idx]));
> +					igt_waitchildren();
> +					if (flags & FORK_READ_AFTER)
> +						igt_assert_eq(data[idx].data,
> +							      READ_VALUE(&data[idx]));
> +				} else {
> +					igt_assert_eq(data[idx].data,
> +						      READ_VALUE(&data[idx]));
> +
> +					if (flags & MULTI_FAULT) {
> +						for (j = 1; j < N_MULTI_FAULT; ++j) {
> +							struct test_exec_data *__data =
> +								((void *)data) + j * orig_size;
> +
> +							igt_assert_eq(__data[idx].data,
> +								      READ_VALUE(&data[idx]));
> +						}
> +					}
> +				}
> +				if (flags & EVERY_OTHER_CHECK)
> +					igt_assert_eq(data[prev_idx].data,
> +						      READ_VALUE(&data[prev_idx]));
> +			}
> +		}
> +
> +		if (exec_ufence)
> +			exec_ufence[0] = 0;
> +
> +		if (bo) {
> +			__xe_vm_bind_assert(fd, vm, 0,
> +					    0, 0, addr, bo_size,
> +					    DRM_XE_VM_BIND_OP_MAP,
> +					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +					    NULL, 0, 0, 0);
> +			munmap(data, bo_size);
> +			gem_close(fd, bo);
> +		}
> +
> +		if (flags & NEW) {
> +			if (flags & MMAP) {
> +				if (flags & FREE)
> +					munmap(data, bo_size);
> +				else
> +					pending_free[i] = data;
> +				data = mmap(NULL, bo_size, PROT_READ |
> +					    PROT_WRITE, MAP_SHARED |
> +					    MAP_ANONYMOUS, -1, 0);
> +				igt_assert(data != MAP_FAILED);
> +			} else if (flags & BO_MAP && odd(i)) {
> +				if (!bo) {
> +					if (flags & FREE)
> +						free(data);
> +					else
> +						pending_free[i] = data;
> +				}
> +
> +				aligned_alloc_type = __aligned_alloc(aligned_size, bo_size);
> +				data = aligned_alloc_type.ptr;
> +				igt_assert(data);
> +				__aligned_partial_free(&aligned_alloc_type);
> +
> +				bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> +				bo = xe_bo_create(fd, vm, bo_size,
> +						  vram_if_possible(fd, eci->gt_id),
> +						  bo_flags);
> +				data = xe_bo_map_fixed(fd, bo, bo_size,
> +						       to_user_pointer(data));
> +
> +				xe_vm_bind_async(fd, vm, 0, bo, 0,
> +						 to_user_pointer(data),
> +						 bo_size, 0, 0);
> +			} else {
> +				if (!bo) {
> +					if (flags & FREE)
> +						free(data);
> +					else
> +						pending_free[i] = data;
> +				}
> +				bo = 0;
> +				data = aligned_alloc(aligned_size, bo_size);
> +				igt_assert(data);
> +			}
> +			addr = to_user_pointer(data);
> +			if (!(flags & SKIP_MEMSET))
> +				memset(data, 0, bo_size);
> +		}
> +
> +		prev_idx = idx;
> +	}
> +
> +	if (bo) {
> +		__xe_vm_bind_assert(fd, vm, 0,
> +				    0, 0, addr, bo_size,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +				    NULL, 0, 0, 0);
> +		munmap(data, bo_size);
> +		data = NULL;
> +		gem_close(fd, bo);
> +	}
> +
> +	if (flags & BUSY)
> +		igt_assert_eq(unbind_system_allocator(), -EBUSY);
> +
> +	for (i = 0; i < n_exec_queues; i++)
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +
> +	if (exec_ufence)
> +		munmap(exec_ufence, SZ_4K);
> +
> +	if (flags & LOCK)
> +		munlock(data, bo_size);
> +
> +	if (file_fd != -1)
> +		close(file_fd);
> +
> +	if (flags & NEW && !(flags & FREE)) {
> +		for (i = 0; i < n_execs; i++) {
> +			if (!pending_free[i])
> +				continue;
> +
> +			if (flags & MMAP)
> +				munmap(pending_free[i], bo_size);
> +			else
> +				free(pending_free[i]);
> +		}
> +		free(pending_free);
> +	}
> +	if (data) {
> +		if (flags & MMAP)
> +			munmap(data, bo_size);
> +		else if (!alloc)
> +			free(data);
> +	}
> +	if (free_vm)
> +		xe_vm_destroy(fd, vm);
> +}
> +
> +struct thread_data {
> +	pthread_t thread;
> +	pthread_mutex_t *mutex;
> +	pthread_cond_t *cond;
> +	pthread_barrier_t *barrier;
> +	int fd;
> +	struct drm_xe_engine_class_instance *eci;
> +	int n_exec_queues;
> +	int n_execs;
> +	size_t bo_size;
> +	size_t stride;
> +	uint32_t vm;
> +	unsigned int flags;
> +	void *alloc;
> +	bool *go;
> +};
> +
> +static void *thread(void *data)
> +{
> +	struct thread_data *t = data;
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (!*t->go)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
> +		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
> +		  t->flags);
> +
> +	return NULL;
> +}
> +
> +static void
> +threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> +	size_t stride, unsigned int flags, bool shared_vm)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct thread_data *threads_data;
> +	int n_engines = 0, i = 0;
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	pthread_barrier_t barrier;
> +	uint32_t vm = 0;
> +	bool go = false;
> +	void *alloc = NULL;
> +
> +	if ((FILE_BACKED | FORK_READ) & flags)
> +		return;
> +
> +	xe_for_each_engine(fd, hwe)
> +		++n_engines;
> +
> +	if (shared_vm) {
> +		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +		bind_system_allocator(NULL, 0);
> +	}
> +
> +	if (flags & SHARED_ALLOC) {
> +		uint64_t alloc_size;
> +
> +		igt_assert(stride);
> +
> +		alloc_size = sizeof(struct test_exec_data) * stride *
> +			n_execs * n_engines;
> +		alloc_size = xe_bb_size(fd, alloc_size);
> +		alloc = aligned_alloc(SZ_2M, alloc_size);
> +		igt_assert(alloc);
> +
> +		memset(alloc, 0, alloc_size);
> +		flags &= ~SHARED_ALLOC;
> +	}
> +
> +	threads_data = calloc(n_engines, sizeof(*threads_data));
> +	igt_assert(threads_data);
> +
> +	pthread_mutex_init(&mutex, 0);
> +	pthread_cond_init(&cond, 0);
> +	pthread_barrier_init(&barrier, 0, n_engines);
> +
> +	xe_for_each_engine(fd, hwe) {
> +		threads_data[i].mutex = &mutex;
> +		threads_data[i].cond = &cond;
> +		threads_data[i].barrier = (flags & SYNC_EXEC) ? &barrier : NULL;
> +		threads_data[i].fd = fd;
> +		threads_data[i].eci = hwe;
> +		threads_data[i].n_exec_queues = n_exec_queues;
> +		threads_data[i].n_execs = n_execs;
> +		threads_data[i].bo_size = bo_size;
> +		threads_data[i].stride = stride;
> +		threads_data[i].vm = vm;
> +		threads_data[i].flags = flags;
> +		threads_data[i].alloc = alloc ? alloc + i *
> +			sizeof(struct test_exec_data) : NULL;
> +		threads_data[i].go = &go;
> +		pthread_create(&threads_data[i].thread, 0, thread,
> +			       &threads_data[i]);
> +		++i;
> +	}
> +
> +	pthread_mutex_lock(&mutex);
> +	go = true;
> +	pthread_cond_broadcast(&cond);
> +	pthread_mutex_unlock(&mutex);
> +
> +	for (i = 0; i < n_engines; ++i)
> +		pthread_join(threads_data[i].thread, NULL);
> +
> +	if (shared_vm) {
> +		int ret;
> +
> +		if (flags & MMAP) {
> +			int tries = 300;
> +
> +			while (tries && (ret = unbind_system_allocator()) == -EBUSY) {
> +				sleep(.01);
> +				--tries;
> +			}
> +			igt_assert_eq(ret, 0);
> +		}
> +		xe_vm_destroy(fd, vm);
> +		if (alloc)
> +			free(alloc);
> +	}
> +	free(threads_data);
> +}
> +
> +static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
> +		    int n_execs, size_t bo_size, size_t stride,
> +		    unsigned int flags)
> +{
> +	struct process_data *pdata;
> +	int map_fd;
> +	int fd;
> +
> +	map_fd = open(sync_file, O_RDWR, 0x666);
> +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +	wait_pdata(pdata);
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	test_exec(fd, hwe, n_exec_queues, n_execs,
> +		  bo_size, stride, 0, NULL, NULL, flags);
> +	drm_close_driver(fd);
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +static void
> +processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
> +	  size_t stride, unsigned int flags)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct process_data *pdata;
> +	int map_fd;
> +
> +	if (flags & FORK_READ)
> +		return;
> +
> +	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
> +	posix_fallocate(map_fd, 0, sizeof(*pdata));
> +	pdata = mmap(NULL, sizeof(*pdata), PROT_READ |
> +		     PROT_WRITE, MAP_SHARED, map_fd, 0);
> +
> +	init_pdata(pdata, 0);
> +
> +	xe_for_each_engine(fd, hwe) {
> +		igt_fork(child, 1)
> +			process(hwe, n_exec_queues, n_execs, bo_size,
> +				stride, flags);
> +	}
> +
> +	signal_pdata(pdata);
> +	igt_waitchildren();
> +
> +	close(map_fd);
> +	munmap(pdata, sizeof(*pdata));
> +}
> +
> +struct section {
> +	const char *name;
> +	unsigned int flags;
> +};
> +
> +igt_main
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	const struct section sections[] = {
> +		{ "malloc", 0 },
> +		{ "malloc-multi-fault", MULTI_FAULT },
> +		{ "malloc-fork-read", FORK_READ },
> +		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> +		{ "malloc-mlock", LOCK },
> +		{ "malloc-race", RACE },
> +		{ "malloc-busy", BUSY },
> +		{ "malloc-bo-unmap", BO_UNMAP },
> +		{ "mmap", MMAP },
> +		{ "mmap-remap", MMAP | MREMAP },
> +		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
> +		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
> +		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP | DONTUNMAP |
> +			READ_ONLY_REMAP },
> +		{ "mmap-remap-eocheck", MMAP | MREMAP | EVERY_OTHER_CHECK },
> +		{ "mmap-remap-dontunmap-eocheck", MMAP | MREMAP | DONTUNMAP |
> +			EVERY_OTHER_CHECK },
> +		{ "mmap-remap-ro-eocheck", MMAP | MREMAP | READ_ONLY_REMAP |
> +			EVERY_OTHER_CHECK },
> +		{ "mmap-remap-ro-dontunmap-eocheck", MMAP | MREMAP | DONTUNMAP |
> +			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
> +		{ "mmap-huge", MMAP | HUGE_PAGE },
> +		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
> +		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED | MREMAP },
> +		{ "mmap-shared-remap-dontunmap", MMAP | LOCK | MMAP_SHARED |
> +			MREMAP | DONTUNMAP },
> +		{ "mmap-shared-remap-eocheck", MMAP | LOCK | MMAP_SHARED |
> +			MREMAP | EVERY_OTHER_CHECK },
> +		{ "mmap-shared-remap-dontunmap-eocheck", MMAP | LOCK |
> +			MMAP_SHARED | MREMAP | DONTUNMAP | EVERY_OTHER_CHECK },
> +		{ "mmap-mlock", MMAP | LOCK },
> +		{ "mmap-file", MMAP | FILE_BACKED },
> +		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
> +		{ "mmap-race", MMAP | RACE },
> +		{ "free", NEW | FREE },
> +		{ "free-race", NEW | FREE | RACE },
> +		{ "new", NEW },
> +		{ "new-race", NEW | RACE },
> +		{ "new-bo-map", NEW | BO_MAP },
> +		{ "new-busy", NEW | BUSY },
> +		{ "mmap-free", MMAP | NEW | FREE },
> +		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
> +		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
> +		{ "mmap-new", MMAP | NEW },
> +		{ "mmap-new-huge", MMAP | NEW | HUGE_PAGE },
> +		{ "mmap-new-race", MMAP | NEW | RACE },
> +		{ "malloc-nomemset", SKIP_MEMSET },
> +		{ "malloc-mlock-nomemset", SKIP_MEMSET | LOCK },
> +		{ "malloc-race-nomemset", SKIP_MEMSET | RACE },
> +		{ "malloc-busy-nomemset", SKIP_MEMSET | BUSY },
> +		{ "malloc-bo-unmap-nomemset", SKIP_MEMSET | BO_UNMAP },
> +		{ "mmap-nomemset", SKIP_MEMSET | MMAP },
> +		{ "mmap-huge-nomemset", SKIP_MEMSET | MMAP | HUGE_PAGE },
> +		{ "mmap-shared-nomemset", SKIP_MEMSET | MMAP | MMAP_SHARED },
> +		{ "mmap-mlock-nomemset", SKIP_MEMSET | MMAP | LOCK },
> +		{ "mmap-file-nomemset", SKIP_MEMSET | MMAP | FILE_BACKED },
> +		{ "mmap-file-mlock-nomemset", SKIP_MEMSET | MMAP | LOCK | FILE_BACKED },
> +		{ "mmap-race-nomemset", SKIP_MEMSET | MMAP | RACE },
> +		{ "free-nomemset", SKIP_MEMSET | NEW | FREE },
> +		{ "free-race-nomemset", SKIP_MEMSET | NEW | FREE | RACE },
> +		{ "new-nomemset", SKIP_MEMSET | NEW },
> +		{ "new-race-nomemset", SKIP_MEMSET | NEW | RACE },
> +		{ "new-bo-map-nomemset", SKIP_MEMSET | NEW | BO_MAP },
> +		{ "new-busy-nomemset", SKIP_MEMSET | NEW | BUSY },
> +		{ "mmap-free-nomemset", SKIP_MEMSET | MMAP | NEW | FREE },
> +		{ "mmap-free-huge-nomemset", SKIP_MEMSET | MMAP | NEW | FREE | HUGE_PAGE },
> +		{ "mmap-free-race-nomemset", SKIP_MEMSET | MMAP | NEW | FREE | RACE },
> +		{ "mmap-new-nomemset", SKIP_MEMSET | MMAP | NEW },
> +		{ "mmap-new-huge-nomemset", SKIP_MEMSET | MMAP | NEW | HUGE_PAGE },
> +		{ "mmap-new-race-nomemset", SKIP_MEMSET | MMAP | NEW | RACE },
> +		{ NULL },
> +	};
> +	const struct section psections[] = {
> +		{ "munmap-cpu-fault", CPU_FAULT },
> +		{ "munmap-no-cpu-fault", 0 },
> +		{ "remap-cpu-fault", CPU_FAULT | REMAP },
> +		{ "remap-no-cpu-fault", REMAP },
> +		{ "middle-munmap-cpu-fault", MIDDLE | CPU_FAULT },
> +		{ "middle-munmap-no-cpu-fault", MIDDLE },
> +		{ "middle-remap-cpu-fault", MIDDLE | CPU_FAULT | REMAP },
> +		{ "middle-remap-no-cpu-fault", MIDDLE | REMAP },
> +		{ NULL },
> +	};
> +	const struct section esections[] = {
> +		{ "malloc", 0 },
> +		{ "malloc-mix-bo", MIX_BO_ALLOC },
> +		{ NULL },
> +	};
> +	int fd;
> +
> +	igt_fixture {
> +		struct xe_device *xe;
> +
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_require(!xe_supports_faults(fd));
> +
> +		xe = xe_device_get(fd);
> +		va_bits = xe->va_bits;
> +		open_sync_file();
> +	}
> +
> +	for (const struct section *s = sections; s->name; s++) {
> +		igt_subtest_f("once-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, 0, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("once-large-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 1, SZ_2M, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("twice-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 2, 0, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("twice-large-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 2, SZ_2M, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 128, 0, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-stride-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 128, 0, 256, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-execqueues-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 16, 128, 0, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-large-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("many-large-execqueues-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
> +					  NULL, s->flags);
> +
> +		igt_subtest_f("threads-many-%s", s->name)
> +			threads(fd, 1, 128, 0, 0, s->flags, false);
> +
> +		igt_subtest_f("threads-many-stride-%s", s->name)
> +			threads(fd, 1, 128, 0, 256, s->flags, false);
> +
> +		igt_subtest_f("threads-many-execqueues-%s", s->name)
> +			threads(fd, 16, 128, 0, 0, s->flags, false);
> +
> +		igt_subtest_f("threads-many-large-%s", s->name)
> +			threads(fd, 1, 128, SZ_2M, 0, s->flags, false);
> +
> +		igt_subtest_f("threads-many-large-execqueues-%s", s->name)
> +			threads(fd, 16, 128, SZ_2M, 0, s->flags, false);
> +
> +		igt_subtest_f("threads-shared-vm-many-%s", s->name)
> +			threads(fd, 1, 128, 0, 0, s->flags, true);
> +
> +		igt_subtest_f("threads-shared-vm-many-stride-%s", s->name)
> +			threads(fd, 1, 128, 0, 256, s->flags, true);
> +
> +		igt_subtest_f("threads-shared-vm-many-execqueues-%s", s->name)
> +			threads(fd, 16, 128, 0, 0, s->flags, true);
> +
> +		igt_subtest_f("threads-shared-vm-many-large-%s", s->name)
> +			threads(fd, 1, 128, SZ_2M, 0, s->flags, true);
> +
> +		igt_subtest_f("threads-shared-vm-many-large-execqueues-%s", s->name)
> +			threads(fd, 16, 128, SZ_2M, 0, s->flags, true);
> +
> +		igt_subtest_f("process-many-%s", s->name)
> +			processes(fd, 1, 128, 0, 0, s->flags);
> +
> +		igt_subtest_f("process-many-stride-%s", s->name)
> +			processes(fd, 1, 128, 0, 256, s->flags);
> +
> +		igt_subtest_f("process-many-execqueues-%s", s->name)
> +			processes(fd, 16, 128, 0, 0, s->flags);
> +
> +		igt_subtest_f("process-many-large-%s", s->name)
> +			processes(fd, 1, 128, SZ_2M, 0, s->flags);
> +
> +		igt_subtest_f("process-many-large-execqueues-%s", s->name)
> +			processes(fd, 16, 128, SZ_2M, 0, s->flags);
> +	}
> +
> +	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
> +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
> +
> +	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc-race")
> +		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, true);
> +
> +	igt_subtest("threads-shared-alloc-many-stride-malloc")
> +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, false);
> +
> +	igt_subtest("threads-shared-alloc-many-stride-malloc-sync")
> +		threads(fd, 1, 128, 0, 256, SHARED_ALLOC | SYNC_EXEC, false);
> +
> +	igt_subtest("threads-shared-alloc-many-stride-malloc-race")
> +		threads(fd, 1, 128, 0, 256, RACE | SHARED_ALLOC, false);
> +
> +	igt_subtest_f("fault")
> +		xe_for_each_engine(fd, hwe)
> +			test_exec(fd, hwe, 4, 1, SZ_2M, 0, 0, NULL, NULL,
> +				  FAULT);
> +
> +	for (const struct section *s = psections; s->name; s++) {
> +		igt_subtest_f("partial-%s", s->name)
> +			xe_for_each_engine(fd, hwe)
> +				partial(fd, hwe, s->flags);
> +	}
> +
> +	igt_subtest_f("unaligned-alloc")
> +		xe_for_each_engine(fd, hwe) {
> +			many_allocs(fd, hwe, (SZ_1M + SZ_512K) * 8,
> +				    SZ_1M + SZ_512K, SZ_4K, NULL, 0);
> +			break;
> +		}
> +
> +	igt_subtest_f("fault-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK);
> +
> +	igt_subtest_f("fault-threads-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK | CPU_FAULT_THREADS);
> +
> +	igt_subtest_f("fault-threads-same-page-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK | CPU_FAULT_THREADS |
> +				    CPU_FAULT_SAME_PAGE);
> +
> +	igt_subtest_f("fault-process-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK | CPU_FAULT_PROCESS);
> +
> +	igt_subtest_f("fault-process-same-page-benchmark")
> +		xe_for_each_engine(fd, hwe)
> +			many_allocs(fd, hwe, SZ_64M, SZ_64M, SZ_4K, NULL,
> +				    BENCHMARK | CPU_FAULT_PROCESS |
> +				    CPU_FAULT_SAME_PAGE);
> +
> +	for (const struct section *s = esections; s->name; s++) {
> +		igt_subtest_f("evict-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				many_allocs(fd, hwe,
> +					    xe_visible_vram_size(fd, hwe->gt_id),
> +					    SZ_8M, SZ_1M, NULL, s->flags);
> +				break;
> +			}
> +	}
> +
> +	for (const struct section *s = esections; s->name; s++) {
> +		igt_subtest_f("processes-evict-%s", s->name)
> +			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
> +	}
> +
> +	igt_fixture {
> +		xe_device_put(fd);
> +		drm_close_driver(fd);
> +		close_sync_file();
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 6328792e3a..20ddddb89f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -295,6 +295,7 @@ intel_xe_progs = [
>  	'xe_exec_reset',
>  	'xe_exec_sip',
>  	'xe_exec_store',
> +	'xe_exec_system_allocator',
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
>  	'xe_fault_injection',
> -- 
> 2.34.1
> 
