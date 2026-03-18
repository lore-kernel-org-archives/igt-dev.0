Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11218FCD0DA
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 09:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B746A10E109;
	Wed, 18 Mar 2026 09:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WbptxAMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2B810E774
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 09:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773824431; x=1805360431;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0/QoodKHCrrMKJ38928T04x8Bij0zaBULfU0ekmxzl0=;
 b=WbptxAMXmBq/xdJs4bAjBeLG8tTu5EpjgFeKkTn0r9hJ8cCAfUnYK0kv
 cwJ/gpZhxAE1seyKgswhnU4io5iNrWuV7G3GYo3DuosN6xgfD482TPS3U
 vfKMzHyBxJF2fqd3Y2zWStr/hUDQ0wgkINCvlSvuf6RsGhBGXq9NJmKAi
 yZ0H42HKnixCNwfvwuTMPeHeDkbd6vKCmQKDJGUpzkb9NAQbsH3rK0z//
 TpytsNUElvBytyvs1c496nw0G65HmUECL3tRVSytqvcA+aFC9S9wRnF0v
 CFhHCw8grnmZnVm7qXd9+GTcyiTUOm4gBf9yfULY1A5CX4oKeUffP4bja w==;
X-CSE-ConnectionGUID: yPKdzRIpQIqHQ77Fm3crYw==
X-CSE-MsgGUID: NPSh52NRRuaNAzNJDx3RlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74759693"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74759693"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:00:31 -0700
X-CSE-ConnectionGUID: vOw+s6HOS6KXS3jXZNreJw==
X-CSE-MsgGUID: 3HUcpjb4SsSG1eOcALB0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221798486"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:00:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 02:00:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 02:00:29 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 02:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/fRQhjiv3etDMzLPqOTsbBdYX5chhMweUjO91CGUGaNM3cyZQhr5xvBBEWwDdq3vdQ/rUFD4cWH7rgM8l4dDzQOdTBhWNmrPxvGEMYMVkjo1NplShe33VJdMJIrMu4VdHvKgqXeh57FwJ2OdJrNrMxvWhOXSpyQBRDSeY/qmj9f3e+wqCixdRIlQpb3jiGeGGiM2qda9jZPRR7lx2aTJ4HedirGwa/2mAdVys/xdSDXVVi17xJlHvvuUG/nDgEJAxot4xmXAPKU7MERVMH4xlLYZBtitxNEsE43jdN+/SM8htAIrCuXgTbYSFvCO780VP69UP66w3TazEW9JerEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErvcnfSEpRIxzvawKRk0Wg3d3pCv0FpBCjIrMlyxcCk=;
 b=QImuQuU+xLbDIqFg2XtMlBsq1As4WC9ETs7LZ3TXxR4f5NxsIZz2+WV2lp3udyYc8DG3cipRBsz2D7tCt4B20f8JBrVwYusCQ0hTzC/uwwB3qCMybdd3iL0FMVsc0gedyQLntX2vkpULvGqbAmoQdgbl29nkdBtVkb3uvH24ZBS88ia9ty9zUX5Ybg6Z49PvwdovVnAvdeP7Z3CzRppP2Q7rVp1uKA0/zGGD/R7HdV8io5GMOpR8MYYarxKgl7qFWXEL/9/u9YnOLtrMrKHnWMV5+0qYrZHOatehF/P83yJmTNo8780FjSbXhgxugxiLSyIFV9aMzrvg/bFeXmF+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by BL4PR11MB8869.namprd11.prod.outlook.com (2603:10b6:208:5a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 09:00:20 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 09:00:20 +0000
Message-ID: <06b18696-f088-474b-b5a6-515dbe6925dc@intel.com>
Date: Wed, 18 Mar 2026 14:30:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_prefetch_fault: Add SVM and
 hit-under-miss validation
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <priyanka.dandamudi@intel.com>
References: <20260318063528.2212823-1-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260318063528.2212823-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::17) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|BL4PR11MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3de5b4-c519-4803-0361-08de84ccc80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Mmu0DII6Cdf9NkGzwEd4m5wTzKjrBUSEA1xexSbODbnUp/3qGjOCyeqROQye8V7heZ0xpC4IlePO0onwXW7oqyg7ryJ7ZaDIOqdBYoZfyyx6OJ0+eOE2fuzj0xLYK9GzvfMcz4f7CDaJHQWSQ3nWaCyBQ1vWyqPzepAcYZL5yBcjtujMZAfQhvLjrKH7LXe3jwKEvtVa/YVav7gGmsCcpjgsPslpwXulhYWMAcgR19bDgfbS77sQ+hLr1uGsmGIx8zu5FQtd/SUBtKhIa6HfAByPn6ITVCI9wNYqkuyG2NvfsGi/FTnNrs3dFfC1qLXkmApb2dMRRkwiCSh/2VXSVuggXw5LbPxe2IY0YNOPGUAnoPFAFa28BzrfzOlnQ98ntOZdCrM1WN3yyJBwpL4Id25+EAxtpJ38AhulTGHa18VDL37uNZ7zTCYkKY5/4FapeMwCA6P+QJlQqOMjcVHUxZMkLSli4gTmzcn3pLRqw7IASrlTAAnlUZVpROee2DyeZWYPzmfRscVC1HIMsNXyTNhOK+7/wFSYLoskxc6NUJyGy4RDaKTTvH26QUrv7Y+dXb0bk4FsvEqXRdjczREC+co4R0teIJDNXaW2FPvN5usgx2qffRttFbhYE8dy5JTQ7DpfaHX1Sz3RlRCUsOwAvzPnlntETcwbN+TdgFn0p4piBuuuUp8GGeMB+zfJCZ25efX6U1c/+vhKdH9IJPsmJ4mUiODGJsR7r49ayG8n0lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNuWjVuQXJuUzFnRXdoekVUNzBiVzBZaDRBSW1uY3VIM1pFTW5xQW9jTXNT?=
 =?utf-8?B?Qjhqb3NOQTBIQk5SSWpra3NCYVRSK2FaclBncVJiWlhXNHNmMW9INDZZZDl4?=
 =?utf-8?B?aFVKUEY1TXY3cExhbGJkc1RrNW5hRnJUcWpEVDBjS2hFOWUzQmF3aDdtVExB?=
 =?utf-8?B?Ymk4ZkJXVFg2cUV1UWNQbHBSclhQZmcyb0xjYlI5ZDBkdGZLd2tmblV2eEJr?=
 =?utf-8?B?Wng2bmh4Y0JKQUFidXpOR0pCN0ZEcWpSYWFoUDlJcmM0bGJCZVhZSmJURWZ0?=
 =?utf-8?B?S1d6cys5eEFNQ3cvQkZPaFA3akw5L1lqTjhnS1FDWWRZazBMSnViUVRYSXVl?=
 =?utf-8?B?eWpkZWUxeW8rc3VSbzhZT0JCRlFaNXhHRS9xRlBGcTgvWFh0b0FCSFc0L3F2?=
 =?utf-8?B?UCtoalNEQ0NsdlQ5VndnLzVmdjNvQlhOMkg4bVM2d0o0RTFBbC9pUnpMeFFH?=
 =?utf-8?B?WS9yN0I4V2VmdVR6dC9MWHhtL1RRaFZUVDJTeDFiTWUyTG10V0lMVFBUbkpr?=
 =?utf-8?B?WWRQejNyU0xYcTI1bGtRbEFaUDZqRkwzQkdySmNhRzU3ZC95a1IzWlRNbWg0?=
 =?utf-8?B?ZjRzaGZpZGZMcXUxRHdPZnAwVXN0SnkyQkJLaERhK0ZOcWxld3NIbU1GTU5q?=
 =?utf-8?B?UFM4anZMT2s1VnBSUGhQZzZveGpNR1RVY3lSUDV6R3Z4Mk5lNlpwMGxiK3pI?=
 =?utf-8?B?ckIya2ZMUHNXcjNuRXljTDNubXhTelJxVWc3UVAzL0V5U04wU2ZGdWV4elNF?=
 =?utf-8?B?czJGVU51RUlvbVp2WW56b2UyOGxsTUlqYmczTE53UWVVREZoOGYwRzVvOGdq?=
 =?utf-8?B?K2tVbU4rZjlzNlM0SDZKMUtYWFdmTkhQc1NIMVdWMXRGOWhSUXdzeStvYjJX?=
 =?utf-8?B?dXRKUTRQRGRKbm8zN25IUFdjZGZBTC9mZXQxV1dLcWc0SGd6VUVjU2dMeUtH?=
 =?utf-8?B?NGlEeXUzZk5QY0tSSjUrRHpPczc0anlUb3c5TjkyUW9KU0lmS0ozamEzV2pY?=
 =?utf-8?B?anlZRW5RY3h3R0V4YUsyM1EyQlVSVXpRdHJZY2xDM1JFUFRpbnlOT2psNU1z?=
 =?utf-8?B?S2lzZmk5S0F0RWhWR3F1My93YWpGNmJNV3RsdzNGUnBCM3FFQzVZdXVnYlRy?=
 =?utf-8?B?VTFGTWY3VThLRjYyV0h0VTlTTFI3Z0o1Rkp1NElUNTZlaTl1VisrS2RnVG5E?=
 =?utf-8?B?L2FxbGU1VDk1TGptSmUxZHVNVE41NzZPTjA4SnQzbHo2NFF6eUdVbE9iYkNM?=
 =?utf-8?B?TFlEeklWTE5zU2d3cGd4cjlKOU51c0s5TW5RRDJzdFdIQ0RhKzVnTThZNzZq?=
 =?utf-8?B?STdzdis2TE5mQWNuUDZhcG1ISEU5QWIwKzcwMjcrMFhQUmliMGN5K2pWL0s0?=
 =?utf-8?B?aTk0UHFUaDQrY2lneTZBSmJZNW0vUTJkcGNMc2M2dVozYmRwKytLVFJaSmRN?=
 =?utf-8?B?QVZZWjRib1A0aGp4THNXNmp1S3IvdGwzTHMrNlV6Y1RHZDNRSUN0LzZ4dTc4?=
 =?utf-8?B?dmptZk1SMWszVllpUlNDVjdPa091L0F2ZlhWZC9Xdjc1WkpRT3pLNkkvaDV3?=
 =?utf-8?B?REpiWnNWSmpvOWJCUTJrNE5wRzJaR0VQNGQ3eUJZOHJvNk10MkxSU0VxbVpu?=
 =?utf-8?B?bnBFcG54OG9iSndYcFBkNTkrU0Z5MHhCcDJPYXVpa3VUTW5CTzA3eXppdHAw?=
 =?utf-8?B?TUsvTUlGVUplYkJ0Q0Y0TUZ3b3ZtOFRlZEZWYUc2ZGJJemFLWUc0WFlGdDN1?=
 =?utf-8?B?eldJVjdwT0c5ODQvVXNpYzJpV09XRUYvaXd3U2xJWnBxREZWMWJlaVlya1N1?=
 =?utf-8?B?SU5RYm9tS3g5bkRaRmg4NUl1UmV2bXNDVkpjQmYxM0hJK3pLak1qMFp3Z0lr?=
 =?utf-8?B?c2c4YUNSQmVqRUdUR0drZkR6OFBwTmZ4a21jck9XYVhwaE5HaFJwMzVwQVBv?=
 =?utf-8?B?RmlCWUthaXU4ZEd5a3BPRlczR0R3Y1E5TXNLY1JPZzRuRllpNG45Ukx6bGNj?=
 =?utf-8?B?ZTJvbHFxR1lWQVBtQWZsa1NCRTNVaE5MUVpLMW5WTzRiVzNMellEUkxHa2hz?=
 =?utf-8?B?bWRMU3RMWG4wdFhoVzY5dWoxRTJCVi9hL3VaR3h4VnpTNlovV2pxOGh2QmFK?=
 =?utf-8?B?T0dFWHBHbjhwYzlXMUtiZy93WFlyY2VVWTBJUG1zMzFTQU5wRGhYUWpTaXRB?=
 =?utf-8?B?VW1NU2xsclBrTmtVMFlldFZFSERNckI1d3R4dU1sbDhWbGRuYlpaWmppWUdv?=
 =?utf-8?B?WlhZcXlOYmZobmU3Ry8rSm5nWVBGc1kzd1k5M3FObTE3bW1MZmJFcjgrU3Br?=
 =?utf-8?B?Q1k2bjRWRHdMRmptVWh3djNRa24xeVJwM1BlNURBNXFuUk9NTng0bDNQc2Ro?=
 =?utf-8?Q?9e5pEv8nQ0umpZwQ=3D?=
X-Exchange-RoutingPolicyChecked: RWRmw3awjpQeWMHIpf9POqhymEBGaZgsjszaeYmZNRbwWoJoY+aepW+hYwrKm6d976CME2+rn2we72B0xcOaVutieoSS5i40sxrhxhL56yaKRsgxGOQfpHJqTwCRnD9Wr1JWijn6BOonkYemyU8+1edAyVqmJOf92zS+WCNouHok3NSsQ/WF13fegOTbM1B5CkzxFdsxKO3Uw3wFmBoQAOeA6GvXUcE3rcNTElaal9j6n1BIXMjpvkK2pQWSbudEu8NOgtLgzDFf8v65FUuw/8KNTcF0JXiIOu8W8PGE8V9fYmczrWQgbv11sC29ddZNMJgp218njwMpp3UvxKm8Ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3de5b4-c519-4803-0361-08de84ccc80e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 09:00:20.0463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNOW3Poi7uhPM/kWEPYqu8fmN16pfGk2kwNe0rukJeLWUrUdK0DmAv2dDeHlGHVc9hTq9YZwJbzOs+LEjmTe/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8869
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


On 3/18/2026 12:05 PM, Varun Gupta wrote:
> Add a second batch to validate hit-under-miss behavior: placing the BB
> at PREFETCH_ADDR ensures the page is already mapped when the shader
> prefetch runs, so the prefetch fault counter should not increment.
>
> Add SVM mode (prefetch-fault-svm subtest) that creates the VM with
> CPU_ADDR_MIRROR and uses mmap() at PREFETCH_ADDR to make the page
> GPU-accessible before the hit-under-miss batch.
>
> Other changes:
>    - Extract PREFETCH_ADDR and USER_FENCE_VALUE into defines
>    - Update stat name to 'invalid_prefetch_pagefault_count'
>    - Add missing cleanup (intel_buf_destroy, xe_exec_queue_destroy,
>      xe_vm_destroy)
>
> v2:
>    - Move xe_vm_create() before if(svm) as it is common to both paths (Nishit)
>    - Separate SVM and non-SVM specific code into if/else blocks (Nishit)
>    - Add BB_OFFSET and BB_OFFSET_SVM defines (Nishit)
>    - Add comments wherever needed (Nishit)
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>   tests/intel/xe_prefetch_fault.c | 127 ++++++++++++++++++++++++++------
>   1 file changed, 103 insertions(+), 24 deletions(-)
>
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
> index 4a143374a..988cf940d 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -25,6 +25,10 @@
>   #define WALKER_Y_DIM	1
>   #define PAGE_SIZE 4096
>   #define COLOR_C4 0xC4C4C4C4
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define PREFETCH_ADDR	0x1f000000
> +#define BB_OFFSET	0x1b000000
> +#define BB_OFFSET_SVM	0x2b000000
>   
>   struct dim_t {
>   	uint32_t x;
> @@ -118,7 +122,7 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>   	static struct gpgpu_shader *shader;
>   
>   	shader = gpgpu_shader_create(fd);
> -	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd, 0x1f000000));
> +	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
>   	gpgpu_shader__eot(shader);
>   
>   	return shader;
> @@ -126,63 +130,127 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>   
>   /**
>    * SUBTEST: prefetch-fault
> - * Description: Validate L1/L2 cache prefetch fault.
> + * Description: Validate prefetch fault and hit-under-miss behavior
> + * Run type: FULL
> + *
> + * SUBTEST: prefetch-fault-svm
> + * Description: Validate prefetch fault and hit-under-miss behavior in SVM mode
>    * Run type: FULL
>    */
> -
> -static void test_prefetch(int fd, struct drm_xe_engine_class_instance *hwe)
> +static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe, bool svm)
>   {
> -	/* faulty address 0x1f000000 should be beyond bb_offset+bb_size. */
> -	const uint64_t bb_offset = 0x1b000000;
> +	const uint64_t bb_offset = BB_OFFSET;
> +	/*
> +	 * For the hit-under-miss run, place the batch at PREFETCH_ADDR in
> +	 * non-SVM mode so the BO bind maps that page before the shader runs.
> +	 * In SVM mode PREFETCH_ADDR is reserved for the mmap, so use a
> +	 * separate offset that doesn't collide with it.
> +	 */
> +	const uint64_t bb_offset2 = svm ? BB_OFFSET_SVM : PREFETCH_ADDR;

small nit: use simple variable name

const not required

>   	const size_t bb_size = 4096;
> -	struct dim_t w_dim;
> +	static const char *stat = "invalid_prefetch_pagefault_count";
> +	struct dim_t w_dim = { .x = WALKER_X_DIM, .y = WALKER_Y_DIM };
>   	struct gpgpu_shader *shader;
>   	struct intel_bb *ibb;
>   	struct intel_buf *buf;
> -	uint32_t *ptr;
>   	uint32_t exec_queue_id, vm;
> +	void *cpu_data = NULL;
>   	int prefetch_pre, prefetch_pos;
small nit: should be prefetch_post
> -	static const char *stat = "prefetch_pagefault_count";
> -
> -	w_dim.x = WALKER_X_DIM;
> -	w_dim.y = WALKER_Y_DIM;
> +	uint32_t *ptr;
>   
>   	buf = create_buf(fd, w_dim.x, w_dim.y, COLOR_C4);
>   
> -	prefetch_pre = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> -
>   	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>   			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>   
> +	if (svm) {
> +		/*
> +		 * Enable SVM: mirror the full VA space so GPU page faults are
> +		 * resolved via HMM against the CPU page tables.
> +		 */
> +		struct xe_device *xe = xe_device_get(fd);
> +		uint64_t vm_sync = 0;
> +		struct drm_xe_sync sync[1] = {
> +			{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +			  .timeline_value = USER_FENCE_VALUE },
> +		};
> +
> +		sync[0].addr = to_user_pointer(&vm_sync);
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << xe->va_bits,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +				    sync, 1, 0, 0);
> +		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> +	}
> +
>   	exec_queue_id = xe_exec_queue_create(fd, vm, hwe, 0);
>   
> -	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm,
> -				     bb_offset, bb_size);
> +	prefetch_pre = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> +
> +	/* First run: PREFETCH_ADDR is unmapped, so each shader lane raises a prefetch fault. */
> +	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset, bb_size);
>   	intel_bb_set_lr_mode(ibb, true);
>   
>   	shader = get_prefetch_shader(fd);
> -
>   	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
> -
>   	gpgpu_shader_destroy(shader);
> +	intel_bb_sync(ibb);
> +	intel_bb_destroy(ibb);
>   
> +	prefetch_pos = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> +	igt_assert_eq(prefetch_pos, prefetch_pre + w_dim.x * w_dim.y);
> +
> +	/*
> +	 * Hit-under-miss: ensure the page at PREFETCH_ADDR is already mapped
> +	 * before the prefetch shader runs again. The fault is resolved
> +	 * successfully so the prefetch counter must not change.
> +	 *
> +	 * SVM:     mmap at PREFETCH_ADDR creates a CPU page table entry.
> +	 *          The kernel resolves the GPU pagefault via HMM.
> +	 * Non-SVM: placing the batch buffer at PREFETCH_ADDR causes the
> +	 *          BO fault path to map the page.
> +	 */
> +	if (svm) {
> +		cpu_data = mmap((void *)PREFETCH_ADDR, PAGE_SIZE,
> +				PROT_READ | PROT_WRITE,
> +				MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED,
> +				-1, 0);
> +		igt_assert(cpu_data == (void *)PREFETCH_ADDR);
> +		/* Touch the page to populate the CPU PTE so HMM can resolve the GPU fault. */
> +		memset(cpu_data, 0xAB, PAGE_SIZE);
> +		prefetch_pre = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> +	} else {
> +		prefetch_pre = prefetch_pos;
> +	}
> +	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset2, bb_size);
> +	intel_bb_set_lr_mode(ibb, true);
> +
> +	shader = get_prefetch_shader(fd);
> +	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
> +	gpgpu_shader_destroy(shader);
>   	intel_bb_sync(ibb);
>   
> -	ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
> +	prefetch_pos = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> +	igt_assert_eq(prefetch_pos, prefetch_pre);
>   
> +	/* Verify buffer contents */
> +	ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
>   	for (int j = 0; j < w_dim.y; j++)
>   		for (int i = 0; i < w_dim.x; i++) {
>   			igt_assert_f(ptr[j * w_dim.x + i] == COLOR_C4,
>   				     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
>   				     COLOR_C4, ptr[j * w_dim.x + i], i, j);
>   		}
> -	/* Validate prefetch count. */
> -	prefetch_pos = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> -	igt_assert_eq(prefetch_pos, prefetch_pre + w_dim.x * w_dim.y);
> -
>   	munmap(ptr, buf->size);
>   
> +	/* Cleanup */
> +	if (svm && cpu_data)
> +		munmap(cpu_data, PAGE_SIZE);
> +
>   	intel_bb_destroy(ibb);
> +	intel_buf_destroy(buf);
> +	xe_exec_queue_destroy(fd, exec_queue_id);
> +	xe_vm_destroy(fd, vm);
>   }
>   
>   int igt_main()
> @@ -201,7 +269,18 @@ int igt_main()
>   			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
>   				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
>   					      hwe->engine_instance)
> -					test_prefetch(fd, hwe);
> +					test_prefetch_fault(fd, hwe, false);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("prefetch-fault-svm") {
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
> +			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_prefetch_fault(fd, hwe, true);
>   			}
>   		}
>   	}

LGTM

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

