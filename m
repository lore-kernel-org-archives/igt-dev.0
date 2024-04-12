Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B870FC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 14:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2159E10E376;
	Fri, 12 Apr 2024 14:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gG/5krUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8013810E376
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712931348; x=1744467348;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OzfBiUsYo0DRR0+FBoQLANN23oN/egNx+sb2fSnog7w=;
 b=gG/5krUNm9l8s56qaFK30uPcCGh4yRp2USCgcYRnummyglUy8gspJxe5
 mLQSU4DfgoMYBG70A38Z5NDiCXops9M1q9nwyzRe+b9ljeHt5ND7oxYuj
 fzSNW698bgZ3Z+lHuAtrTAOByWH3InO736RE+A4Id8Id7Y5FfY7Mp6FZz
 CuZQiSTWcTLo0pBvUtIhLLoKRHY35zpPkcPrGL1yBHSVInmE8UoBc6UtS
 UyouT4UBsGZKpjZr7qRhjD5kdxQH1jtQiPkVqCXt7BoDAjTKZjqWepmyi
 9TUsW6N4wLZvBKAcX5i/r4X79s/rhObhRe1Cua84ELMDgD4axp44bGK4e g==;
X-CSE-ConnectionGUID: O0+r8plzQ4aMOinJuQ1giQ==
X-CSE-MsgGUID: bP1DV+hdTwSvmp0P22W45g==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8941932"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8941932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:15:48 -0700
X-CSE-ConnectionGUID: MiIZCKQ9RNunEG22d+ocmQ==
X-CSE-MsgGUID: WpFvSHo8Qp+Jj1fw97y3YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21326368"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 07:15:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 07:15:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 07:15:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 07:15:47 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 07:15:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRJYCMivZ3X8HayqNyTWg1txK5TZUVypIZoTRVU/Ire86y8orFcT0w9UXneoN/ONuxMEiQ3sfm3ZrxvTEHDtQ1MR5UFIEg2GIzfLVFTo8wVRwtJnWfySAd1ndwBZe1DP6FJZnt5jWSTXr8XzX4zM9qz+JxAbkxpDkb8Ye1nrWk1a6opgVMwzwDrFatTz0HsbhlMSmxzuvMmvSw6m7MCXUcbEgvGCcm8pEcAs54rzhdZnhgV6UAQS60dPGoHLh8LCLWAcly1jFwRrj1Vq9+KDMer51JAl7upqlYRF9cp6sfh8+3L9GRqmH7TWPPmKnpITn9hc4yXIou40ZQelBHnahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzfBiUsYo0DRR0+FBoQLANN23oN/egNx+sb2fSnog7w=;
 b=Ng7GbHo5WlVvCJqcuJk9ceoE5FxKa7ftTaIq4OAhd3TE1r2hXOX+WW32qrd86g30TxLgNDxeaJYfh4PvAgwCDP+Cq6LkBZy5rcJUuS8NMLrZYR/kzfrpcdtzqZmb9JusPH/SzpH9VrV5zRgfK92VfudAuLXZz90g8YbEhml6VYMYeBqAf2U1jFj/gLIeCntwJIGG5f/rEeZEbIe7ZsedfbKb9MqeyqDl9uCXNsb/cMK+ODCAfnBCEJaHdJ2sSWGAz+bP70iR28quLkePv//RYJjjwMs9/DrYGCmKaS5PSQHc39O0CG14SiINAqZMaaVMyQHCrG1+HH2QT27d5YNmGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6615.namprd11.prod.outlook.com (2603:10b6:806:256::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 12 Apr
 2024 14:15:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 14:15:44 +0000
Date: Fri, 12 Apr 2024 09:15:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_kmod: Fix sigaction write to uninitialized
 memory
Message-ID: <54ecjzie3maj7lzz5mnqomcadfqd7o5io3yae6occ57oivl6ae@wj5reqylw2p5>
References: <20240412122014.341267-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240412122014.341267-1-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bb9fc7-a048-46be-f32c-08dc5afb0b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rIgUNTNxjdhxqDC0tvQFmv+0MxzbUT9pkVmCCw7LhEjQkwjrLUgBWlhNRU8u9/We4C8ngt4PhcDCs3VjmZ6rcEqLMseP/XXY9IFxDkeJeMtgkPZ5VeFqw63VmkOxRVQOCENRxwOVIHbXtSKvV/aOC5EqZLvz6OJKsj6eocCtAHG8Qu8/eAMv3tPLhju0GAxv+sOxKg5VqhY0r+CJbrnpoTULXxxzIsHeaaVJ/RJqmAZyoW1mT/rUuaGVXgQC556kG+gV0uNXgQ76/aWoNlqbLBDwHILmMf1pr/QiMnBi1RzwjYt5y4q1RZ0eTP2URJ24xMo0n1bo44e2c4vuykZF8vsgcwQi0UIKcgk5qRlNBYrJ3i4bg8sDlD10b5OZz32TsfIg/SW63WVKJH9S8t4JYWxfY3rx7i/vQqf0duldrf2qMJiPtgbv/4UCvCyC9QMDBkTzLOV04giXJsKohhHUJnvFeYgeNaODEwl7Z7OA843t5YXOE5tqYu7GQuxPeaGcWuVItj55dzCMNevkQwsavKNeYhVQOwQImLmbnfTgzVZRHce6Q3g9u0g99xoyVs0eK5FCvGD5D16EOzJfH8GveBB91EUYKGdfaUu4shL+vn/piaC14n5dZzTLqadY2paMq0m+3up9TmIbML4KiN+o+FFOu1UUZUeVnSJU0auco/4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWZ1YjBBUkVadld2N3pkcnZXaHJ1VHpBUjRpMTVJOGhEZ2JrYVJmaXV1RUt4?=
 =?utf-8?B?MXhOaC83QnRmU2p5eW1ESG1ZUis3QXFXTmNHeDZmN0tKTTRITktNc0ZxVTY4?=
 =?utf-8?B?Q05EaitrczVtYVFSa21RR3JWV1ZJTFhOTm9oTW5VdlIxdnFwNWpLU0cxN0JS?=
 =?utf-8?B?d1Z5Kzc0eXN2K1NsR1EyQ00xUVRTOTNZbnh4WmhjRTI4SmxjdUEwTW5vbzQ1?=
 =?utf-8?B?SkRvaXIwOFkvbGs4NFlMMllZQjFkOG02NGlkQXlKcFdVaDgzSno3VENmL0ZU?=
 =?utf-8?B?YmtRUEtvSnhrdWJGdkJDVHkyOWhmR2dKVEwvTi9ZVDJnYTRENU4xbzRLRHhD?=
 =?utf-8?B?NjJFUDR2d3RNUUY5aXhORHBWZnlvTTRRbHZFOHZQZ2xQbTdDcG5vMVRMbnZX?=
 =?utf-8?B?WHAxdUw3Qlg2VEFqMmZicFh0SXp2N2xGcStaSVdUcnNWSWNkcDh5ZEsyOWdZ?=
 =?utf-8?B?Q0xZVGNxeVdJRzBXRlF1SGZtR0Q5N21YeWgxaWtDakhGclloVWpxdGZ1dldp?=
 =?utf-8?B?SmxFRmk3WkI3cGI3b00xSVA1dXFHTVh3MDZ2cG9Vc25sZDdLM3hSYzhreDlo?=
 =?utf-8?B?NTB1NnlBSTFEQ0lDd2ZhMW5vVXZQT3lzMHlPL241UWIyUjB6RHlyKzRYN21Y?=
 =?utf-8?B?MG9HckJla1FoMkJDL3loSVF4bjlnaEtrQmVZUys0bVNnY0prQzkrc2lPYWtv?=
 =?utf-8?B?RWFudUt4K29DSmNDajZJVnUzRHRzeG5ZakFHRkJLVm1ERDVUbFdGUHd4b3pw?=
 =?utf-8?B?VVd2Szg3MElnRXVMdnJuN2llL2dicW5XVjQ0TW9kTzhoUlZhZERhZ0E0dm5W?=
 =?utf-8?B?OHM3ekNqVUdma3Rab0NhQ0RhTExtRTNrTHdzV1NsYWtkdFdsdWNraFBYY1pa?=
 =?utf-8?B?bEVMTitGUVROUEdyQUo0TjB0UXZ4elUvTlFKRFh2a3Q5YzNQSUFnY0Jybklx?=
 =?utf-8?B?ZHBudVVOVXdneEV0a2hYZ2NTd0U4Y3dldmZDa3BNWkJQcWxLNVNOZjJtUDJz?=
 =?utf-8?B?RnRPVUttaUsreUpteWtRN2h5Vys4UTEycjR4TEdDTURiMHVaY0tIUlNYMCtZ?=
 =?utf-8?B?OEs5RG9mTTNXb3BianM0UDhJcmVrdTRhN3Q0RnRuRjM1YnBwWEMxL3N3S0Q5?=
 =?utf-8?B?citCTDdlNDNXMjZkNituZnM3SUswSUdxWGVTQTkwWUFTRGZ1Zzh0NDY3QlpT?=
 =?utf-8?B?UXQ3bSs4aWpFakJnTGJOWXp5d01BOGlRcm5CeEVBb0N5MHRVTHdOT2RRbXFp?=
 =?utf-8?B?SVIzNkVvVmQ0b1diOFJQazIxTk1sNmVNcFRXK2MxMFRDaGRsbjBJam1wcTBY?=
 =?utf-8?B?UzhCM0ZDUk9iMW1IRDJqTlNzcDZqbER2SGZZWEZieFg0WGFadGh0WXJwSWlO?=
 =?utf-8?B?cUxxNm1LVm41cDhqc3ZtVGFjQjdBUWdIY3FBb2lMRm5xSXhuYXB5UnU1ancy?=
 =?utf-8?B?Mm9CZm5XYmhpQVo5Smg4QkQ0b2VkSmlqb00rL1NJUnptSGJOVzMwbDg2ZEtL?=
 =?utf-8?B?cGt5cjl3WGsrSTMyYmo0K1k3Q3dGMFZKMHZPdktLcFNMWDluOU03QjdkaWFv?=
 =?utf-8?B?SGZTV1IrcjIvWXZvNE9Zaklxb1Y2d2VXUno2RkFWZnpjN1NKRDA0M0YyVDlx?=
 =?utf-8?B?OTdtUGFrODliUUR5bGE1TnpaeHJEb3JSZ0RlSWRmRWlHQmFxOHU3L3Rlell0?=
 =?utf-8?B?dG1PM2VKeXBXRFdyS2JPRmFNOEhsWStkNlBTaTJLSmtYLy9vNi9MQXpZRVJo?=
 =?utf-8?B?MVdlRDUrSjVqcC9NQ0ZMVi9QOHExaXlIQUI5cG02QTFGL1paeVBNdmVMNU42?=
 =?utf-8?B?SDVoejZWZ25acEhTMEVQZllQSXVNSEhwejBuRW1VUlN4YXhDM1ltTHFPVTlB?=
 =?utf-8?B?MTc0STJBTXZadXRvZjV4TWpoU2dqNEorUWN3WHprV3lnWnFIS3BSbndIbU1l?=
 =?utf-8?B?cjlpdVhOM05MVnBkWUFRLys3ZEU5cEtGTkNCVDloQkFFNU1PY3YvNGFxYzNv?=
 =?utf-8?B?aGlQQUFUVmxyTnlxSFNyYVgrNHVyb1NiUWxVNmFWb2lhbHByRGtPc2o2ampt?=
 =?utf-8?B?ZHFtZ2x0elh6NTUwRCtuM2hDZStvNE5POFdwZWFoOVB2a0dNb3RpV0hIUXB4?=
 =?utf-8?B?MmpWQ0MzU3dUYVF5SUJUUUlIcDVXNTFGam9sUGFDaW9Zb0h5bnI0NlpHWTN6?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bb9fc7-a048-46be-f32c-08dc5afb0b03
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 14:15:44.9517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+Z3M6H0pw/H3Ye5Qb/CN/Y0qDZIW8/9IEKkgUK/HjKcVfu31prjAilCT8H1P90BocAItJhSBSiRRctcWDAeI8dd3awGNllBH3di2s6614A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
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

On Fri, Apr 12, 2024 at 02:20:14PM +0200, Zbigniew Kempczyński wrote:
>I've noticed on running kunit subtest:
>
>./xe_live_ktest --r xe_bo
>
>IGT-Version: 1.28-NO-GIT (x86_64) (Linux: 6.8.0-xeint+ x86_64)
>Using IGT_SRANDOM=1712922311 for randomisation
>Starting subtest: xe_bo
>Received signal SIGSEGV.
>Stack trace:
> #0 [fatal_sig_handler+0xda]
> #1 [__sigaction+0x50]
> #2 [__libc_sigaction+0x10f]
> #3 [kunit_get_tests+0x417]
> #4 [igt_kunit+0x35f]
> #5 [__igt_unique____real_main41+0x44]
> #6 [main+0x48]
> #7 [__libc_init_first+0x90]
> #8 [__libc_start_main+0x80]
> #9 [_start+0x25]
>Subtest xe_bo: CRASH (0.005s)
>
>Looks this is related to sigaction() write to memory referenced
>by uninitialized pointer located on the stack. Lets fix it.
>
>Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

not idea why we are using a child process here. It seems more
complicated than it should. But given this is indeed needed, the fix
seems correct.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
