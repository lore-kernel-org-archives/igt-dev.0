Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16724D1BDE5
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 19:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C516310E4BA;
	Mon,  4 Nov 2024 19:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEJ4jXi0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94F310E4BA
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730748291; x=1762284291;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hcGg3bkKSdToYfhrCrPYyxxmDAQXaXmffD9hpCNjhQE=;
 b=nEJ4jXi0ESxSEJnOxPmIEsxXmeOSKaZnJ4bfih6oe2MNcste0lM0Wv0W
 mMJ89EwLPTuo3T9YFW4GMp2X+mswhKb2AdfK3FDu6479GPPboBOhAvr5L
 KtVcH1xY3pls24AVjtXb7J+mQ/pDsSfs9fnvN6Yh7yV6Sm7cKHwbfYtjY
 rTxoK98C5WMgrSRV/DzJveu45SLzYCL5LCZIGljB4Ok0W14R75mnhjmX8
 mDJEonBU77/mucDoCrZ5CfIpNJdVaefHI9+vZS8zFwhyOVlw6G8vcQPfp
 y7kqafOaMVbsBCV8f1ZFZraWe/hNnJyZ8oHnjKWkGZjlfF5MA9II/vXwu Q==;
X-CSE-ConnectionGUID: egknlZ7HTiO89hchTuI/Hg==
X-CSE-MsgGUID: Dl98QH+BTmGwZvJDzz9Whg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53031811"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53031811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 11:24:50 -0800
X-CSE-ConnectionGUID: JrVFpjlhTwSjfhxt9oPQcA==
X-CSE-MsgGUID: eLDjkLMqRtKhbmUr5pIgQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="114534728"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 11:24:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 11:24:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 11:24:49 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 11:24:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XygbN5pZgkv2kbkV3Tg8hNzwrK1X0FC+mpBLTZqa55p0sVe6XllbjCSBnM1zax7SkMTPjF5wsjxgMvAJ5SRRrOwpy7czUfu4/nBy4HwsD+B4asXHeCDUoI4V3oFQ35vs0/OqHue9Dt1A5ENlLyjjeFwKgK1h3SnQtY9IiPRoxocH9qiZAUKiSgu1YWnuHRhbIRQCyUohltRUIu4V6bCfe5Ls9vlKRLi17lES2C63+6ShHlvIz+w3N1XF8XsQ8140wUGRWdNK8C3+qSG3jhKPMH5nhujMz9MYm5UQKb2xtnJAKSKnTsXrCqTFAxY/XTnK8vEik3v86aux5f3srZUjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZavsdgNPu9jLHiKPT3qp9uIrCG2aqtdhOT4DinWVtIE=;
 b=lyW3bBduGrDeyVreuynrXHz7/t/sq881wpfG0d6pa5pX//dhO7Wn34RoF4IkVUeDQFBmodbS50LSGhnU6qFg3EsepRPkaBlYlld7oRDMeDxtUdkJCBe9yWKuQtdSIG4sxNZuvKYUS8U2IiB4sZWkqDY4G6T6NGEoc941u6vPsP2TcxChhoFmu+TX45IzPslNtm4TZWcZ10S/uFwRnu/Yogf7mP8mc8q3MO27wIT3AFVSphkucTbQLt/U05wpoScgoDzkOwg9uM47MenyWhgSwnZ2GwJQIDiVK4bkI7AKZmuYBbUxOA6FPuxOjHIoHnfxJ4/Jz1H+JSfxbFButaIMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 19:24:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 19:24:45 +0000
Date: Mon, 4 Nov 2024 11:24:43 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kmod: Export igt_kmod_unbind()
Message-ID: <Zykfe7D05TPf/wwG@orsosgc001>
References: <20241023050502.3049664-1-lucas.demarchi@intel.com>
 <20241023050502.3049664-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241023050502.3049664-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0362.namprd04.prod.outlook.com
 (2603:10b6:303:81::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: d635a9db-ce3d-4657-764e-08dcfd0656e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnRvcVNVZ0xhYWdtcGxzNlFJb0taU2V0Z21lNkJieVNnbUdOS3lodE4weGcv?=
 =?utf-8?B?bFJ5d3ZYd010U0c3RE1aSlRoeFEyRVVWbHJKL2dwc1VpaUNJbk5nT0xJbHJV?=
 =?utf-8?B?NVVhNjB1TzBlZ0hiUXFUcmdIeVlxeXVIZkJDTWQ0SE1aMWd5MHRTeWJ5WFVt?=
 =?utf-8?B?emdXUUVOWkNZNTMwMjhHSDYweVhIblg4c3Z6VDNrRzlFNDE3bVZiTjdmTHlS?=
 =?utf-8?B?eTRRb1l1cVNKMmRHTnU2Z0ROVDRKSXlzM1h3ekl0eERObjNySkZCbE1QbGlL?=
 =?utf-8?B?RHNUNzlHaXpRT1lScVltWVIranVNL1RJakQyR3FNU3IzQ1lLd0JITUlnWVM5?=
 =?utf-8?B?ZllHV0xZNnJjMVJIRXJQNkRLejBibURkQ2xjMW9IRlZ0SDBocDFMZUtSUWp5?=
 =?utf-8?B?d0tKeGVYWGZ1ak11cVVYU2ZIUmNNb3dTYm5QcE9iZ1ViUUd5TlhJNEFXbXEw?=
 =?utf-8?B?V0lWRjNrZlQ3WUlsQUNESGVoQ3FNU3NVMFdoRzRIWjIxMmVSQWFCUG1ZSTVE?=
 =?utf-8?B?SVJ1b3VBQlVtUTJFZ01zYmZ5NjRxWjNFTzhpMWNWd2NmTTFRcjNJNXYvRVJh?=
 =?utf-8?B?QVFRcTQ4WEtEdmlPVjFMTmphSWcvcjV1aS92OXFkK1MxSGFDWjZiZElTMzk1?=
 =?utf-8?B?QnVTZXhsNlRNbTByMlpnT1A5UkRtaWN0WEx6R1hDcFVpTndxQVk5MWhnNytE?=
 =?utf-8?B?OU16TnhHS2o3U0ROTE84M2ZaZmNUbk9jL0ZIS3pIQ05UZlVnREt2QkwyYUZH?=
 =?utf-8?B?R092TVVCOGdwS0IyUitiVSswc3R0U2pybVBIdjZCVzE0enFNNnNuSUNIcFJG?=
 =?utf-8?B?KzJ0bXNVSnkxSVBuVkF0TXhnVStNU2FYcmRkVDZIcVozeVdMSHR5WllIdGxn?=
 =?utf-8?B?TnB6cXJqNUl3cFNoWS9XRGhqZzRXSHJQeEREQThkc2p4Y2doc1hCdFVaNzMy?=
 =?utf-8?B?SW10WTAvQ1lUTi95d2RoUFdaVFl0MWMvZDdlWGM4Q2NQaTBmeE11NHV4dGtp?=
 =?utf-8?B?MStxWWRhTmZOd1l3RmdxQXY4N0hjOHdkR055T2c4YXZNM1BWLzlTcTNrc0dZ?=
 =?utf-8?B?NUN1RXhVT2xEb2NyVUc4TW50VlF2bFN2THArUUdZanZURDlxczBCWFRZcGJ1?=
 =?utf-8?B?UmN0MVNTR3h0dWMwV0tRUkFrNWRPMkVKY0NyV0dMekZnTVFadFZrVisva0w2?=
 =?utf-8?B?WWdNdzhoY0Z6VjFKai9ibi9Rd2JqVkRzY2Y2SE1SbjNQNTdaOVdodlJJQWJJ?=
 =?utf-8?B?R2h2NllKY0E1SzJRRXRFNmV1Q3d0dGRMZXBIY0E2VDFXdUhadFoxY2hQSVo4?=
 =?utf-8?B?OGE4MzdPWUNtcGNQQ2hFbVVqcTNNYWV5QXN6ZlBvVzdxWjhNVkorUUtvQldV?=
 =?utf-8?B?blQ1K1htZlhQbG5wRW5VNTBvblpTaDlDcEFUM0NBMXY5Q1huM1hFTElpNHB3?=
 =?utf-8?B?ODZLeGFrNmw5QjVnTzQxSDZqRTVYTVQ5UkRybkdVVkxha2gwQkxQU2NsYUU5?=
 =?utf-8?B?WnFGYzN2eVdkOTkwWWZkNklVWTFGblBESzV2UktLdEk0NDd3MGZTSzZMVVJM?=
 =?utf-8?B?bGVjWVBaYmJhZDRPaVVmYUFMNTUxSGxLUUJnTmdnQTBQazA5RjRDd3IyOEdF?=
 =?utf-8?B?c09HM3RLVHVraHdQSW43KzBialBlRi9rc3k4dUUwcDFjV1dmclVHdzBlOGw5?=
 =?utf-8?B?OExXV040czhyVzVodENMc25tZE5LZzgwSkk1UXFITVpXR1pKT0pGUktUQzFC?=
 =?utf-8?Q?KMU7VmpKQoJv4+AZVQInNgL97Uqumu9mP2SqWOd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdyY3ozNW9tS0tFckgxTTBaMVlmV1NlYTZjYlUrc29sOG80Wlh2UjhVL1RD?=
 =?utf-8?B?djhzTlhCcjdKdE5aUCtmK2xDOHpNSzdvcDRyK1k1RkduZWQyc0h5QngzWVc3?=
 =?utf-8?B?aUFValRWRzRkeTZ3WFY3S1Z3QmVtM09kSm1TbUhRTXF6NlN3WnkyQkRKSm9N?=
 =?utf-8?B?L0dKaEpGU1JWdWdKZVdDNHNwdUVpa29BVzMvUWljVEltRnBacjV5cUpVelMx?=
 =?utf-8?B?RDN3UG9JWWlLbVpDS0hQTTh5SkdvSFdLdEhNOThlcjIyTW1ZS2NHaHVtbXpY?=
 =?utf-8?B?Mnk0czNKUkhYaW5TT3lzVG5jSXl0VXN5K3JKMGFiY3FCZjRiWGhPeEQ4NnF6?=
 =?utf-8?B?RytUTmxLbXVHYkJjaGVsRThpSEgyNFNZRG1ONG4zVmRHRldRTy9WbTJwYXVq?=
 =?utf-8?B?ZXpSVmo2aWcvTGZ3SjlPNXU5TVIxT3k4US9pZGh6dXFGREU3NDlPcVNWbWJY?=
 =?utf-8?B?YWRwRXlDUXlES0VrK1JNZHk4NE04OGhCUEJpZGgvU0hLRnYvMDVUZmk5UjJX?=
 =?utf-8?B?cmxWMXBBNk1VSGlLSElKM2p6Y2p3YnNHTXR5Znp0OGs1dTJBa1RHSERoUCth?=
 =?utf-8?B?N0tlSnU5clk1ZDk1NUNLUkZaWFAyUjdqUnZiNTBha0RtZmdpcHo5TDFjQWZZ?=
 =?utf-8?B?OTJxWTRFS2k1T1V6ak5QY0cyZlVqSkVsQWN2TGZCOWpiS2QvSDVqOXRTVU1l?=
 =?utf-8?B?dkRiL1ZWZ2JUemVSYVRCRmNSaXQ4V2ltMEtTdlJXUlZLTVl6Sllla3ZQTXZ6?=
 =?utf-8?B?aGdqSlhtZlJqY0M4QmxwVlBBckFNemlYNDJ5RmhhSWVnRVIvWXNwYk55NnVu?=
 =?utf-8?B?WDh0SnM1NjBuc3NlRG0ybkRPL1JDZ2lucE05NHhMMjdNdDVmUG1ZNXN6K1Z1?=
 =?utf-8?B?Q0ZTb2tLYTU3RXZCZW5oajRVbjRzWWpYQlJnWVEwS0pjWjBJdHp3RGNxZmYz?=
 =?utf-8?B?Q0pHUlBvODNMVnRDZ3I1YjM0Y2xta0FYeklucXZIOXJaWk54L1lveGMxK2J3?=
 =?utf-8?B?V1MybWVLemZVY0JuekMrTmpHUmRvY3hJL1RNYmdPUkgrWkNyWmtUcUc3SWIx?=
 =?utf-8?B?elpBV3RmWHcwTE1udmU5UGpFTUQwTFlQKzlpNDdYM1NNWkVqV1haeUVkMllv?=
 =?utf-8?B?WFBLaUxHa3VBbTNjaDhHU2pZMW1vU2NJZStmbFVVZHQxOE1NUDlpZXp5VS9p?=
 =?utf-8?B?cFhOc25VcGl4ZEx0T0o2V0l4VE5oa05LMmRqajBqTmRTRkxsaDNUY3RNOWpZ?=
 =?utf-8?B?c0R5UW1BTllsU0tMNm02bUQvb3NYazhsUGk2Q1dCZW5rYlV3b0MwYWY2ZXo1?=
 =?utf-8?B?TkxiMm9ZR1JJVDJIdkc0MGFiNEtkS3dwbVB3dE5PRzJWL01LNVplUVg3UkNi?=
 =?utf-8?B?R3JYbW5yR3pGNW9JenBsSTNwNzVNWW9ZTkl1TWZtNzYrVEpRUXBGSnFOaU5P?=
 =?utf-8?B?MDJHQjlMNDluY2ROb1V6YXlneVhCZjlyWkdrajNSRlNST1NTRnV0UVppai9N?=
 =?utf-8?B?YXFSYXBFb2sxK0RRTnBlTG5yQ3h4QmN5d0tRMDVQcDNIcGFhdkpIdzREc0hQ?=
 =?utf-8?B?aDhDRHpsK0s3c1RvRkdJZWVOc1NxVG5XQndYR1pISmpZRURhWStqRTdNbWtX?=
 =?utf-8?B?SU5yQ09xR1ZJVFhUNkFjRGZOQmhzbnBWK01zZjl1dDVtcXMwY0hKb3BxM0hy?=
 =?utf-8?B?WWE1R1RLWnJXdUlSZEVnSGs2VkdvL2VhWFdZNnZyN3BNd1phaFZZZlNnZlNo?=
 =?utf-8?B?dkJtTngvY1RweE9tSFJxR2RIem9paG1VS1lEM2d1UElkb2hpNjNhM0gxS3pI?=
 =?utf-8?B?aTIvdGE2cWNNQThCbEFMd0xGRURYVWZETDBGUnN3aGR0QzRlUzhZTzFqYmVR?=
 =?utf-8?B?QzZTK0FRd2dLWXdQOExMdXE4L3FWNXFUL0dIM0FQKzN4a3RxbDgyV0s1SGRm?=
 =?utf-8?B?dEdGd0cwOXhJSnFMMWxxc000QlBOaXlJTG9WdW8yNUZVMlViSitLeXpuUzhZ?=
 =?utf-8?B?cWtLd0g0Q1JOZldZRkJQU0huME8yVHd5MkNCa040cXpMVTJCRXNVb1ZiYlIr?=
 =?utf-8?B?Q3ZzQklvMGlBb3pMcHlZd1Y1bDRMaTN4Zkw0Tk03T0dhNmZ0dXZXZTZTQVFl?=
 =?utf-8?B?dEZWaSt5RjVSSng1MFJsTW9OMTBFM0h2RkUvZEVhdHBySjM5VlpramsrTEhz?=
 =?utf-8?Q?So61jAYI/PD4Crx735UXfQE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d635a9db-ce3d-4657-764e-08dcfd0656e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 19:24:45.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHZvI3NPGHVJpN4P0ZFuaj7Y40NWYeWpCCtfeyne17YV0KrUVPYgQoEVO3f2TURkuvguhBveHEnS6vkf46fV4bayzJvLSP/C6+/4XiFDkhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
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

On Tue, Oct 22, 2024 at 10:05:01PM -0700, Lucas De Marchi wrote:
>So it can be used directly by tests and other libs.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Tried it with Peter's patches and seems to work fine. Ran into the 
CONFIG_PM case, but you have addressed that in another patch, so this is 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> lib/igt_kmod.c | 6 +++---
> lib/igt_kmod.h | 2 ++
> 2 files changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index 75a0d057c..039309328 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -663,7 +663,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
> /*
>  * Unbind driver from devices. Currently supports only PCI bus
>  */
>-static int unbind(const char *driver)
>+int igt_kmod_unbind(const char *mod_name)
> {
> 	char path[PATH_MAX];
> 	struct dirent *de;
>@@ -671,7 +671,7 @@ static int unbind(const char *driver)
> 	DIR *dir;
>
> 	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
>-			  driver, driver);
>+			  mod_name, mod_name);
> 	igt_assert(dirlen < sizeof(path));
>
> 	dir = opendir(path);
>@@ -744,7 +744,7 @@ igt_intel_driver_unload(const char *driver)
>
> int igt_xe_driver_unload(void)
> {
>-	unbind("xe");
>+	igt_kmod_unbind("xe");
>
> 	igt_kmod_unload("xe");
> 	if (igt_kmod_is_loaded("xe"))
>diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>index ee1719a8f..193b95627 100644
>--- a/lib/igt_kmod.h
>+++ b/lib/igt_kmod.h
>@@ -36,6 +36,8 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
> int igt_kmod_load(const char *mod_name, const char *opts);
> int igt_kmod_unload(const char *mod_name);
>
>+int igt_kmod_unbind(const char *mod_name);
>+
> int igt_audio_driver_unload(char **whom);
>
> int igt_intel_driver_load(const char *opts, const char *driver);
>-- 
>2.47.0
>
