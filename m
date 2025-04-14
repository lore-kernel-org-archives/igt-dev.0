Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E21C369B5
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 22:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C972710E320;
	Mon, 14 Apr 2025 22:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaXCwYNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D7510E320
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744669007; x=1776205007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IX2FNdrmTOdTkCWaiNBuFOEbKd+YQ+KqXX29JeDwFRU=;
 b=OaXCwYNAHcEPG0TdJmudMJunzt7V1Qeiumw64dk35Sh6YkzVFbDTWQfD
 5GwGPY3qt1ls3NjjTvk0PzP++40K73bdgr0kXLDlbIzuUUxB6eA5KxFxf
 194W849p20XxdGbr8NLriQImc681Ho8KgZDPqx7S+gn+QXpM+7UEfbHj9
 +ia+ana5rAGL0AgvWEFd553BIMbrx29nJC423kciYd+hNEgIfjZCUJJgw
 J+Xq3n6VzYMuROoGtqjkU6jRuH4iQEnnCi3x/Af+bo6DyV5dLBNxIX+e0
 tXfe8b1UbphjGwTvOs6kpFtAxyAEwsamO5bNQNpuyROt+w0loMIxTdmRi A==;
X-CSE-ConnectionGUID: sPew3+8qS6WuTV62yk2+wA==
X-CSE-MsgGUID: MPiAx4WpQqu5ZBwkmtfmuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49810981"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="49810981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:16:46 -0700
X-CSE-ConnectionGUID: euiwj24pRDaTgLw/3cjLZQ==
X-CSE-MsgGUID: oBtnYmc5SqyxJFFe6S7n/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134794657"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 15:16:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 15:16:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 15:16:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 15:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8PrLINb6DLfwkAGytZdylWL5s20k6zFPlGU6BK8mvn1g9N9r4P0MSJPFud+ccK6sb148Bpolhth0FlwewHO4Y2uFO6mUl1iU2fIl54jEXAg45YhpGtqmfYNnCYfBUpS6ksFuZoeBgVn0gcl6urjzy4PCqajVkN+c8hgkaqn5hamLjsr07YMuck7AsWPEawAxYMGbP6IklxFaBtDPQqTCZ3y+2vxDWegJKWB0QN4qBVmylAviBpw8DQUHPwmjOd+JkdmdlOqOneFE8zXjPKcdDnzCoc3l2nhO4jbycMYDI0gwBlbMDq2JZKS/Foctzn2PxyP5DsP6EZcTdcP/4zgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD+WLEawjzWlNFnU+dVoFp+B8j1twftFFh9ma7RagMk=;
 b=p1ZQIkZHJS7c+Zc9ark+8a3b3sFKeqRsgkI0MZdBjAQaniUvMVtfxZ7VzJDlGtLWp99AB/82VjURe++HJh+ZLbbrQl+0/rNk/RXhUbqxsUgXNvyJL8umhpcRMgkQITEZZxCXYJGYQ42HtBtL8HUoJgEC9Ba46Aomdb+xU/SqxHt+rSmOObVIXuRW1rjVA0QKh9kAAG8QIK535qgPPcpM4rT4VObJLAZid+E/ZyKlCRBMxjvU3iOcEm+uunbNvkd/65tAWHeLOZCfBZK7kEGA8kUmSioyr44mrEIugnMEeLC7M+NPhRYHB3fMsatfj/W3m53epD1S/Up0YLb7FtHXnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH0PR11MB5300.namprd11.prod.outlook.com (2603:10b6:610:bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 22:16:43 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 22:16:43 +0000
Date: Mon, 14 Apr 2025 15:16:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Check for
 DRM_XE_OA_CAPS_OA_BUFFER_SIZE
Message-ID: <Z_2JSd4MfJQllmM1@unerlige-desk.amr.corp.intel.com>
References: <20250411180314.1095215-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250411180314.1095215-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:302:1::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH0PR11MB5300:EE_
X-MS-Office365-Filtering-Correlation-Id: 55551a45-c52a-406d-4950-08dd7ba2096c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVhrQ0ViOW53bFhMOTcxMXN1a2tCaHpLVzl2UWd0Wk9jUGl4UHh5ZFJ4QUpl?=
 =?utf-8?B?UjlqWUJzNGtwQnluK1BCbHYxZHNNT2o4R0xqOWNzU2ttQ1IrK2ozZXNUelV2?=
 =?utf-8?B?eWN4UjdVWjlYRVZVSnlxcGJQY21LZEMrdUFpZStuNUcybFEwc0psYXZwYjdZ?=
 =?utf-8?B?aWpzbGh4UnRIdUxvRnc3bkNzUEdCOWcvbUtqR2NXaC9wb3ZzN1BhdDhCMDFu?=
 =?utf-8?B?Ulo5emZQbzdwZDAvVHYwRGE5RjUvSkRyVEFVVzFUL05kK3dQRnYyTDBBYlVj?=
 =?utf-8?B?VTFZNm5NVnlYVDhUTUpyKzdMNEsvNzU1WHhMbk5MUUtQclBpU0EySGhiK2kr?=
 =?utf-8?B?cXJwc1V5NmRWRWhaU1JvM2hKZUNDcWlucWNyR2ZjbUFucnowTGQ2KzVaSGRM?=
 =?utf-8?B?NjNkSVRldmV5UjJLRGxvOUNrZGUxVEdUQWE0V09pR1VIWVJGS2NWR0FGTlVW?=
 =?utf-8?B?QkdtN3IzbDkyeCtvZzBFS01pa0x2QjBJQ1pvZlhsYTJPSlFJYmxtbWJEQkkv?=
 =?utf-8?B?aFQzNHNMS1lCT0hLZkxsWll3Qm5yYzBTWTRta1RsWVA2RUhuOGtOOStXZ2Zh?=
 =?utf-8?B?OWJWbnVqWTBHUlU5T041UWYyYWx5d2R4eUdLZFBmWjVFU29zQ0kxbzFUSzlH?=
 =?utf-8?B?aUQydGR1R2FQdi93Mk9EMm5QOFBjNXJFZW13VEJma0EyUXAyYm01WlRZNHRZ?=
 =?utf-8?B?aGdDSGJGSUo0aUV3dTdYWkpLUE1SS3hKRUpFakovUkcyRGtmY0dnOHp0cVJC?=
 =?utf-8?B?Qjc1dldsVFdmSUU1eUtsZENpNmJaZStEcGRhTkpxWDFHUnNqZDRmS1dlQlFC?=
 =?utf-8?B?c2JRYzZHdWpwdTVTMkRHYXJmVnNLd2hJYjFKMlo0V0M3RDY3QUlNczhOcTVV?=
 =?utf-8?B?Y2hqd3E5T1NVNDJDd2lJbUZlV0NQMllkM0VZU2JCT1VkME9nditOMzV1NVFo?=
 =?utf-8?B?eXBnK2Mva1NXNElIeWFSQVdKQkpqNWRYaDMxcDNaWkVQNXdWUnlVLzhuMVRQ?=
 =?utf-8?B?Z0M5WFNtdGtMTlpoS2dpZVoyYWp2SVpka2FtRHgyQXNNRk1ZTFp2Nm9qeCtP?=
 =?utf-8?B?d2dxRklYekMva0d3OXA4VzYxZ1JNNVJmcFd6U1I0WUMxdkdxVzlhMTJCc1dW?=
 =?utf-8?B?amovelBadDdTcHIvQWxpVkQ1NURMaDVndmtGOWx5MEpKOHhiTkc4Rkhyb0NN?=
 =?utf-8?B?NkN3SkhpMFQ0ZjZ1eHhCVTBSTHFwRGtvMFNkd2lZYVZhRzRKZlZIelEwcnJK?=
 =?utf-8?B?OWRSd3NVOU9wVExzekx6Qy80bFZodUlrcFM5ckJMQ1dvMGx4YTJmRm03UkUy?=
 =?utf-8?B?RWdWMlRiSFI3NnNVc005Q1VDWTVHSWVnMjZIUXpVY3ZBQUhWaytBdE4wS05l?=
 =?utf-8?B?aWNnZjZLZkg1dUVlMWVqU3dydk5JemRFL3pqWVRDS1h0WTVDRDQ0a2NUT0Fj?=
 =?utf-8?B?Nld6K21HM2ZGZXhQSkg3Z2lJbXBJKytoRTFvSFkyU3hFcjg0MUVhRkhGVlcz?=
 =?utf-8?B?UmFlbFBMcWdBWE81YjJNYTZhNDVMbWg5SzlSbEQreVNBUzFWTjdFNnMxWHVy?=
 =?utf-8?B?YVFYSDhMc0U0SjNuNWFua1ZndlNTOUFtSEIxaE4wZjN0dCtsUmZYQnArUmE1?=
 =?utf-8?B?S3psM0tkNWR6NVh0MHkzRVJ3am05TkFhTVVNRGJ2eWM0Q2U3SFpTOXZIVzZ2?=
 =?utf-8?B?eWh6VTBjZXBHNGJ0aURybk5XQU8yMXFTK1d2LzBib0RidVZYVkVsdnBOZzNM?=
 =?utf-8?B?UWpVTGZuMzhrWHlzanh1M0VveURaNVJiNERuRzEwVE5xMW9tM1FLZDNQNzFR?=
 =?utf-8?Q?O3+nHR+f1tgLeIYZwfbImTRlzCqybOnwW3zzI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZZQzExOGZQYzZoVzdsNlF0OFFpUGdUcmRabzNnaHp4cnlrTlR5L2YxOU9V?=
 =?utf-8?B?U0JicVdzNXYvU3RvNFhYYTl1RlJIUEtPM3h6VUlNYmFFWVlNRzVvUHNtV2RV?=
 =?utf-8?B?djJwcGdlTnhMYlpxOGtxeDlpdTVWWElaV3ZWQUx5d21ZRVJ2Y1RTaW4zVXEr?=
 =?utf-8?B?b0ZtTS8yamdiN3JnVmRNa2tmN0J5K0lqQVB6bkdiQVhrVnVkMnpUanE3N1pL?=
 =?utf-8?B?dUtpcEQxRWdZeHMxWCtDSlhKTzFzZ21ZODhvT3lPWG02eHpPUzM0YjlwcmhI?=
 =?utf-8?B?TXpIODJPSE8rNldZdmZCYVB2K0hIYXIvSzE4MmRCZFNyL2xmTkgyM0ZNdXNG?=
 =?utf-8?B?Z3hyZEhKYnQxWGRadG16SXZrTnNRZXZPekFBSE11MWd5bnZpYTdSWVZxVWxE?=
 =?utf-8?B?VE9SN1A1VDJweTBkT2hsVktKUTBDcC9NbTFibHNsMWpoNzdSWnhEUkxEQmVl?=
 =?utf-8?B?Q3lKT1ZnN2pSbU53amphQTBmeU9OUVBLK0hGcFJHbHVBeEJXUnpPaU93NkpD?=
 =?utf-8?B?aEttTFRwSzRuc05yU2NuUEpXSWhLVm5oaVlDMlNoejR5RzZlZzJkdlh0aitp?=
 =?utf-8?B?YUlPdE9EK0licVNsaHhISDhkcGlLV05ONVlJMnRDMkZDN2o5dTUwWE9kMDNC?=
 =?utf-8?B?OERwaHFLWnJqVTVaUkxYWjZ6TVdsbEdPelk3dnJpaXVGNnN5MzJhc211OFBP?=
 =?utf-8?B?MHB3UDI3QnVwYWJtUFBSMjlaTVlybUN4cmpHWkJuZWlQNk5wS2UvZ1ZIY1hE?=
 =?utf-8?B?MHI0RnF5c2V2RldObGovZ2d0OXlidEdxUytXWkJEWmhlT0g2SkJhbDF2bkZB?=
 =?utf-8?B?cFEwSG5XUWtvZkdUL2dnSml2N1pXWDRucmJsSFpDc09tYjJ4a29RcGY1czB2?=
 =?utf-8?B?NUduSlp2aHlET053Sm84aUJQTnpZWlMzVHNKbENRb01lQjJLVEI1eCtOaUxi?=
 =?utf-8?B?OUZqdWJlWnRsb2NaMnp1Z0RBcGpsd20rVG01em5tWWI1bm1XUXRJMVBuR1h6?=
 =?utf-8?B?QnlabE9DenZsT1oxR3F6TjFJQjU5NXpwME5xanlkcFFzUGVFYUJZUERocG05?=
 =?utf-8?B?UWk5SkhEc2M0R1dTUWhHTUtWWDkraVNpR0lweEZXcUtnSWZ5UTVUVmlMM1BL?=
 =?utf-8?B?TXhJbi9TM0VRK2h4R0ZyMHpaTHBaa21HTFM2MXE0MFRHODhGaEkzZkNlRVlK?=
 =?utf-8?B?RW5zVzgwVHF5UFdqbE5HU3pVand3cnNPVFp4MEJWWjgxSGtSZ0NtNmpLU01O?=
 =?utf-8?B?VkFsWWN1UCtEWmNKWlNNbkRvSWF6cXZ6enVEejJ4Nk5VSGpSOHVsdStlZTYv?=
 =?utf-8?B?VTBXRnJUYy84S001M1I0Mk9ZYzY4YTNhK0Z1amdlM0l0L3lGUE96SVBOZW1W?=
 =?utf-8?B?cWJEeTFPbENnamZPSHIyckFiTUYyVFVnUW5hQUR6emkxMEU4eWlsNGNSSFBt?=
 =?utf-8?B?VGgzdG4yN0dsSmRQbUlZanZ2ckl1eDROR1EzNjRNaFBBWXBhejBadVRsUklC?=
 =?utf-8?B?Um5yUVZBMjgzU3VqTXQrSjFtWERHMDVXYmtGTUpTbWlpWW02U1MyYTU3TU9W?=
 =?utf-8?B?UC9WbWZOSG55ZlhnZWNIYkFkWWtmRWhrNlhxVVUyY2h1QnhOTjR0Y214SmtU?=
 =?utf-8?B?b0E5dW50UGNvVGRZZGJFUUJvM1BNVjBURlZXK09QUVFGK2Z5ZE5lQVppRVQ3?=
 =?utf-8?B?Q1NmUUVKZ2N6aXlhNHpGa3ZVdVBjMmdiTnVuR2FyTnc0VHJaRG42c2RNWmhw?=
 =?utf-8?B?a1ZiaFlGUXFqckNKR1I4eTBPYjlPVnFZMEI1ZTVEb1FHYkZ0TlJFV294Z2dE?=
 =?utf-8?B?OHFSTUczMExYU2VLT1VMWmZleGN5REI1alhBWms4aDF3UEpMMm01MlhINlNZ?=
 =?utf-8?B?WWZKYWNZOE95WEJHZzhJci8wWWUzMTR3amk0alVyZ3hIWFByMVlWMDA5aHZO?=
 =?utf-8?B?WVpjTm9LNWYzcFlIL2Vwc05kTmtEWldPUDhseG1laElJbktBajkwODJLQ1c3?=
 =?utf-8?B?N0RTNFlNWmdHMFFBNFNwa0FFU2xoVDUvRUdFY0lQUk5xV0d6NSsrOW85SkFr?=
 =?utf-8?B?VG1pV3B3QTd6aWtYVUtGbTZ2RVY3aTRRQUVTYy94QWRLRmFlQzBZNDNLVitW?=
 =?utf-8?B?NFRPM3FReGJmY2x4bkVSaERjUDVyMVYxYUpnN2ZVdkx4R3NOSkQ3MHBlajVn?=
 =?utf-8?Q?ymjpp9ZEtVDlc4icCbqpue0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55551a45-c52a-406d-4950-08dd7ba2096c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 22:16:43.1757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWzfPGfSSyXxrvAUx+qoQBBNP/0OdcblI7rQGVHfcYGpHAwYEj5JQ9ueXofRr6gYg7ZQNFtue+hxL4ASn6UoVZfWty7ax/jT8sNHWCCzVjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5300
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

On Fri, Apr 11, 2025 at 11:03:14AM -0700, Ashutosh Dixit wrote:
>Tests which use DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE should check for
>DRM_XE_OA_CAPS_OA_BUFFER_SIZE and skip if the capability is not available.
>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4678
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_oa.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 67acc74b32..891ce24518 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -4736,9 +4736,11 @@ igt_main
> 		__for_one_hwe_in_oag(hwe)
> 			test_oa_exponents(hwe);
>
>-	igt_subtest_with_dynamic("buffer-fill")
>+	igt_subtest_with_dynamic("buffer-fill") {
>+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_one_hwe_in_oag(hwe)
> 			test_buffer_fill(hwe);
>+	}
>
> 	/**
> 	 * SUBTEST: buffer-size
>@@ -4747,13 +4749,16 @@ igt_main
> 	igt_subtest_with_dynamic("buffer-size") {
> 		long k = random() % num_buf_sizes;
>
>+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
> 			test_non_zero_reason(hwe, buf_sizes[k].size);
> 	}
>
>-	igt_subtest_with_dynamic("non-zero-reason")
>+	igt_subtest_with_dynamic("non-zero-reason") {
>+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
> 		__for_one_hwe_in_oag(hwe)
> 			test_non_zero_reason(hwe, 0);
>+	}
>
> 	igt_subtest("disabled-read-error")
> 		test_disabled_read_error();
>-- 
>2.48.1
>
