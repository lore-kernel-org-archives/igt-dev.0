Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF3FCED26B
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 06:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897E710E03E;
	Tue,  8 Oct 2024 06:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDmFl/Ap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9DF10E03E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728367709; x=1759903709;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=zhZWHrxkDoL/nRtHL8bkkAfPwS3mTS8eKQCnB0Bk/TE=;
 b=ZDmFl/ApmBfm7tdArKC+5lqBmCDCi0BkFmu87M8kWxDPMQ9K4+KubNd+
 JcHbBPzKhD1sLlUnfm0pIf9ydGc1AhwAxerk/+1Gz9kDGZ+wmBFWpXLRx
 AoLAEXxeqzYnbP5bvanycueSuZBFxx3WoHS4evEQPjPEgW8zPBi9pWmr1
 XJ5ZDzZjzyhPYWTEAD5gisRMlRTPmygYz0NeRJxIj108Qws7pQDV8YHTS
 JZ1pfIRjQayWynStloLonkR4tGHRvAYJVDMRFrxwogBB+ZVcQEZvONH6d
 3hU3fg3hOw7nKUUK0P/UrcxHEFK8pS7DS8rbdyT9o+A+8hAp64WtnWsg5 w==;
X-CSE-ConnectionGUID: tOz56TePRdGBNIrkzSAkZQ==
X-CSE-MsgGUID: cLhORYLzSaCkl486lTeNZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27352171"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27352171"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:08:28 -0700
X-CSE-ConnectionGUID: kGTKWVjBQGC5/Plm0VgLIQ==
X-CSE-MsgGUID: 23K+5wqETaGa+Rdg9YzHEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="75965755"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 23:08:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 23:08:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 23:08:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 23:08:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAZXAHpzwOXRxCwE7T7dOEvpqA/AbLjtp49MArjlKdPWoT03b10PF07F2sA5CFqDYxy8ZcJe4t6MuEt4McR83rml3c6oxyCX+2vIMg0gQ1fTLn54pw4vGmUw9uYS7sz8ZoOKKPCKLAInQ4oqRqcIgcV5HfEroy5FOt6J07EjNYNs9kk7WYW77DopseKf0d3JA51+LrSTVEUw/F33AzuR4POdLouUzcVsZ6bjZuLpHEbZ+e+7h0ZvtCZL/t71lUJP9YCYKOIzrKEJIQ1vw/xgEnODugV28LdkZW4acuQWtqEsIuy8L01FcOUkHkGsgZT+3F9AKiJMgrwBqydO8wGXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBiWSPBm1LVwUIBatjpNnkAdZectloou45SB+f/8vqM=;
 b=MO+99tWugGEEFkrQnL/aGNUaB33BBWHVcIVYjbvQKIxD3F+nFVUie/hu8a42e4hKgsLIMLXiLWzBbLv1GsH2oh23bmIcnpJcab9qrywBgfWb1IYB2VD1C1vRRYB4ynb6GnY8DI8FDa/fJzARdSKnoBfmvYTXaZyIQeRw3gMsfwQesjEwpoLIoSpHDT44nnGBEcVEfdu0BocaiO9DDBJimp71nz1RXPoumJHUQzVO3BdMa0Ws6eYdUVhUY5abhb//BcMzGrTvvCjiA3n5CXqWrtq04yzDBQADGi0Wk7oNYzHj3ut5h+Rp6hx4vr3DToz4ZwhEkTUpkK/f9oV6h8jsUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 by BL1PR11MB6028.namprd11.prod.outlook.com (2603:10b6:208:393::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 06:08:25 +0000
Received: from IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147]) by IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 06:08:25 +0000
Message-ID: <0ef20f52-6043-4bbf-9726-9cfb3ecef1be@intel.com>
Date: Tue, 8 Oct 2024 08:08:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] lib/igt_audio: Replace GSL FFT usage with
 meow_fft
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ryszard Knop <ryszard.knop@intel.com>
References: <20240913104434.56529-1-kamil.konieczny@linux.intel.com>
 <20240913104434.56529-4-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@intel.com>
In-Reply-To: <20240913104434.56529-4-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DU7P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::22) To IA1PR11MB7824.namprd11.prod.outlook.com
 (2603:10b6:208:3f9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7824:EE_|BL1PR11MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 031d8e39-fc4e-4c68-10cc-08dce75f9ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c282NzNYengvTW9sTTllUS9KMzNpMXRYWTZWY1J6MEEvOEpqZUpua1VneXV2?=
 =?utf-8?B?ZnJPanNqTmo0ejY0aU1VcmJQZ3Z5bE83ZEJPU1F1ckpXN0NOdzQ5L0UySm9U?=
 =?utf-8?B?Y0xYZEdjMys1OVFQZEluM1JCZ1FyT2ZkbXZzcUxVaWw4clBpNjZLRGNKeXRH?=
 =?utf-8?B?b1JaT2JoQ0dvVm9EQ1FRYlVHckd0MnFlU1JBZmszeGJmVEQ2RGIveHJDOFNC?=
 =?utf-8?B?NGFxbWNJQ29hRTdPaVgwNlpUTXY3eDdTY3ZRS3h4SzhuSExLV3hFY0xQVzMr?=
 =?utf-8?B?WStGUjVmbXA1S3lncFR3Qi9PdFpDekdXQzE3c3l6VW1Ca2t1Q2VKVlE2WVNQ?=
 =?utf-8?B?cWhIRUEybEY0T2RwdHRDV0xyWGV0amtveEVxTkp3WHJUcXI2UEpwcGZjeFdi?=
 =?utf-8?B?Z2FxOWhQMjY2UXQ0R0tMcXlTNTBRVGkzTFFZL09TMHNhZXVQbndnbkVDVHhU?=
 =?utf-8?B?NXF5RkRVQStjV3hseTJoZUFJc1ZTNXNTQkIrdEgvUVgrOEFIOXdDMjIvMnVC?=
 =?utf-8?B?a1VidUhLZ0xpSGIrR0dveVdrWG90UmZ6eCtjeEtaREhZVDJoNytaSXpCd2J0?=
 =?utf-8?B?dkRpOUlPM2x3bmRuQkNDU2NpYU1ZVXl2bTRqRENlRzBhYlNjRWd0QllzVGQz?=
 =?utf-8?B?MnRDTFMwbWE5aEtVbk9qNVBKb0szLzJzUUw1RWJKdU9WcXZxR0dqcEp1THZ0?=
 =?utf-8?B?TDRRb0NXNzRqSWNJSWlrb0I3QVNxd3BZdnpiUWI4MzR2eEFFemRBY1NaYnRM?=
 =?utf-8?B?bUpYVXFaTjdteWtpenRmTjdoODZKQUpzWmxROHA5b1J6ZnUzMTVxV0paeHpr?=
 =?utf-8?B?YmFoT1htMGF2MXI5dTZ0MDEzazBIZ0ZrazIvVEVCZzI0NWxqc0V6czgrWGsz?=
 =?utf-8?B?blFIbldLbzQxaGFCOE9aUEJVc3R6S3R3Q0dYbVpzSkFFZmpKSkhZTHBsQS9B?=
 =?utf-8?B?RStCcjFtODRHSXhPRlhkR0M1eUNnbjJ1aWxlTkdJOElOMnBHQjFPVXpib3RN?=
 =?utf-8?B?R3NqL2ZNYjVTR3c2bHR3WloyLzMvNW9TNkNaMHc2RGdOY2syUjQwc0Z6Ti9N?=
 =?utf-8?B?QWJsM3FGY0ZVdGNsdmp5VjJnTkFNTVloT1hWYmFIWklDdXFpYUIveFUzaFU1?=
 =?utf-8?B?TVBacjJQbjIrQ3F5NEUvaUFQY0NucWpGOG8xU2JVc0NraVVwSW5EWGIxeEN0?=
 =?utf-8?B?eGo5VXJ3SXFCcTdJa2tZaUp2OTFyZzhlOXNkTW1BWGJXQ1pKUE9ZVE85Ujk0?=
 =?utf-8?B?K0plMk8zYVFKTHhPWVZsMVVBV2NDWFB4LzAySWtVdzd1RlhMSzM2c1V3RzNB?=
 =?utf-8?B?b0JYcW1JSmNIbStXWlpjVXdJOHdheHZVNVpiQ09kZW00cGtDYm1ZazBKU29I?=
 =?utf-8?B?bC9HT1FaWnFhbjJwTERNS2VxekUzMTArMjQyUTlhKzVubGFCNXhNVFE3alJW?=
 =?utf-8?B?QkF1QzgvQWRCOXp4QVBkTWNGY205R0NDcmdhTUJVTCtTYnVNMEI4TlJUdmFn?=
 =?utf-8?B?bExRa2JYTWRJbWNlY3Q0RHh4SmFWM29EanBlSDg3bUZDMlVxSXdvY05wdUNY?=
 =?utf-8?B?cVZEeHZORC82aVllTDFPNG9mVHJwRi9hQ3lxc09FNzZteFNmSFBrZVlLM3pI?=
 =?utf-8?B?T2ZtcWhORXNxUnpEdjBUYnVEQ3VacTlqK2RqWVdRUXFrdytjeXdTYnpFRHp0?=
 =?utf-8?B?eUZNRGdYQTdHTkYwNjd2cXpkK1REeGl6LzRNdXhrSVBoSSt0NkpTb0hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzhyUTZjcXBLOUl3Vy83U3JGcXo2cXUwN2psVTVITUptbEt1M3NHczFid2Zt?=
 =?utf-8?B?MzRlSmJUc0wrcHhpekJGUEF1ZU8xc2RnM3NINFltcTZ4d010K3FPV0J1S3k1?=
 =?utf-8?B?YlpZUFFWRWVXVHBYZXZ0L3pOT2hYa1RuS1hoeVZKZHprOTB0bks4a0NGY1VK?=
 =?utf-8?B?OXdEcjFYWHZtUlhkZXBBcitPOUtZcml1T3NBVmtGdE9CYUFNWTFKKzBxd0Mz?=
 =?utf-8?B?aUtZU2J5R3FlSFBqckR2bUtqRmRza3BTc3VCZzdWTDhDY0FKcDBrTUFjVnRL?=
 =?utf-8?B?dHBTYkVhUU4zSlJSbitEODM5a3E4MUN4d0d4YU1JTlFhTjhuVUpTbFFmbkJH?=
 =?utf-8?B?bmFhYy9ON2FncmF2WXFSc3pnUGt1YkQrclNkbWlXbEFWQmFYL0ZkOGNzZnZG?=
 =?utf-8?B?aHBuUCt0ZXl3UC9wUkU3eThWdW8zaEY1RU91MVRVaTRCUEV4UXR2UWRvNjVO?=
 =?utf-8?B?TVVySzM4WVhFcll3Z2szM0hQTElDVmIrTHVrTFFWL25hbndiT3JxMEE2TnZu?=
 =?utf-8?B?L2xxbEZKU1ViVzE2d1F0M1B1QUZHYTY1Nnk0RnQ2WkV0SWtVaVQ1eFdjZ1pI?=
 =?utf-8?B?VU1DSW5LdVZzd2JNS3oreHV1TDNxZTdzdnBqdzloWFBkNEE3MXFFK3IvVnor?=
 =?utf-8?B?Tm04RnpqTDBUMlNmY2tMN0ZQYXhEbHhTak5qaGJBb25HTVpQelA4cDV4MXQx?=
 =?utf-8?B?Rmk3SEdKN0MwZEJIcjdBVG8vZytqdVQyVEpiVWoySmlXNVF0c0dVTnFIeVd2?=
 =?utf-8?B?UkwyQlVhVU5HczFvVnBiSTRONDJ1b3BKNDRjSitGbnlVSmYvS0pjbWsxM1lz?=
 =?utf-8?B?cXlzNWtxRzl0bDRpUjVuKzhPd3ZFaDViZWxhVjVKclQwTkY2SmRXaWRqWmhl?=
 =?utf-8?B?VHFsUmI3ZE1sM2NiWE5xQUJFUFprTjNrdlU1K2w0ZEQzSmlCRFphaHFMLzBh?=
 =?utf-8?B?citsd2pkaTJGUG14WTJtdWtHL1IreVFkcUhpYlExQmltalhIVnZWM3NoMGFC?=
 =?utf-8?B?dEpkS3ZUSmFZWGNub2dPdmlmcXp4UGxCenhGWml6dlJqbDFRYStYSk8vY3dk?=
 =?utf-8?B?RW9KTmhEUFg3THdLY3UrRHBpOXFuUEd2V215UmNXWGl4WUo3WTJ1UStOSEla?=
 =?utf-8?B?Q0xreml6Y3pwSEdNN1FIcC80RVNrTi9Cc0tMU0lrUHVGbVBCMk9JZm94Rmg5?=
 =?utf-8?B?YVJCY0srUDdPWGlTVEFyUzdBSWx1TmRqNk9qUFk1K3ZhS3BwZm9sQ3NxTjh6?=
 =?utf-8?B?L29oZ2RueG1qOWJSb0VVM21sa1MzSVF0dll6azYzQm5POFE1MXNVMy9IMHFU?=
 =?utf-8?B?K3FaRkpZSzZjM0lQUkRWUUJOQklCQVhHUnFOeXVwS2x4VFRHUGo3dElPby9w?=
 =?utf-8?B?UUc2K0hlalJZVlRHdHVGR2NSZFYxZ0FuUG1BL01JdllTNGM0U05wUkREZ3l6?=
 =?utf-8?B?bjJVMm1FZ2dNL2sxbzdRNFZlYS9uZ3FIRE1md3QrR2FJZEw0WnpFU0J1MGxX?=
 =?utf-8?B?MS9pOERVcUNRWk9qY3NGZU5tQ2Vjam9CMmM3elcxbmw1cVFmZFh0RWNZbHBN?=
 =?utf-8?B?UkJPL0p3U1c1cnJlOHRINlBYTDJFUFFTai9IWDkvMTAwWWtwYVlFdlhQZlI1?=
 =?utf-8?B?SVo4ZjU4YkRESG04S09lc1A2Tm8veS9PMkhsNE5MSzhDa3Q4eWMrb1dXS0tz?=
 =?utf-8?B?elZjQTVoZjlDbGN1c1F4T2xBM2RZbHZRdE1MczdlRWVvdE1SV1V2c3dXK2Vw?=
 =?utf-8?B?WS9rVVhNWExkc2xrakpNTGlQc1A0OXFEeU16TWRyZ25QRHQ3RThjZnEvdmZa?=
 =?utf-8?B?ZUlpa21CVHJJL1h4TEZMNjhSNG9McTlkcko4YlllSGJIbTJjQzRhSWtITUll?=
 =?utf-8?B?Ykc5WXV5V0habGdJL05VUlArcjRRRmFsUngwWUhHM2lVK01YSlhPUEcvNWVh?=
 =?utf-8?B?ZnNFUWx3RlY2RHlKWEpQKzhGSnFzcUxEd1FlT0ZvQ09hRStBTkdlWmw4Yjl5?=
 =?utf-8?B?YlF6dUVuc1hJZE1YamZaREYwUEhLbTFGU1B1MHNFNEpFazYrQjVKenJ6UUk4?=
 =?utf-8?B?ckVNWUpCZHcwazNRSk5lMWZ6dE5ZMEpGdVNpQlRvWjY3TXg2SUQvNmZlUTZw?=
 =?utf-8?B?RVBDeld2b2NnRElhSFVKcmhSY0I2dDNYVW5aTGlYaTRaZkpqZXBrbWc2K3Bp?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 031d8e39-fc4e-4c68-10cc-08dce75f9ec5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 06:08:25.2872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXNWmZPoxvi5iP33Rp5MfLpo3lr3gmO2vGzwzLZ0avkjXPcKrTtwuUt7ZT9qoK3GGH3umBzbdxcdNuNCsBRoWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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

CgpPbiAxMy4wOS4yMDI0IDEyOjQ0LCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6Cj4gRnJvbTogUnlz
emFyZCBLbm9wIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPgo+IAo+IFRlc3RlZCBieSBydW5uaW5n
IGttc19jaGFtZWxpdW0gdGVzdHMgcmVsYXRlZCB3aXRoIGF1ZGlvIGFuZCBjb21wYXJpbmcKPiBH
U0wgYW5kIG1lb3dfZmZ0IG91dHB1dHMgaW4gYSBzZXBhcmF0ZSB0ZXN0IHByb2dyYW0uIEl0IGFw
cGVhcnMgbWVvd19mZnQKPiBpcyBzbGlnaHRseSBsZXNzIGFjY3VyYXRlIHRoYW4gR1NMIChyZXN1
bHQgZGlmZmVycyBhZnRlciB0aGUgNnRoIGRlY2ltYWwKPiBwbGFjZSksIGJ1dCB0aGUgZXJyb3Ig
aXMgbG93IGVub3VnaCB0aGF0IGl0IGRvZXMgbm90IG1hdHRlciBoZXJlLgo+IAo+IHYyOiBzb3J0
IGhlYWRlcnMsIHJlbW92ZSBibGFuayBzcGFjZXMsIGZpeGVkIGNvZGVzdHlsZSAoS2FtaWwpCj4g
CgpSZXZpZXdlZC1ieTogUGV0ZXIgU2VubmEgVHNjaHVkaW4gPHBldGVyLnNlbm5hQGxpbnV4Lmlu
dGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSeXN6YXJkIEtub3AgPHJ5c3phcmQua25vcEBpbnRl
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlA
bGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0X2F1ZGlvLmMgfCA3NCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2MCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGli
L2lndF9hdWRpby5jIGIvbGliL2lndF9hdWRpby5jCj4gaW5kZXggZTBiMWJhZmUxLi4xOTNmOWFh
MDUgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9hdWRpby5jCj4gKysrIGIvbGliL2lndF9hdWRpby5j
Cj4gQEAgLTI4LDEyICsyOCwxNCBAQAo+ICAKPiAgI2luY2x1ZGUgPGVycm5vLmg+Cj4gICNpbmNs
dWRlIDxmY250bC5oPgo+IC0jaW5jbHVkZSA8Z3NsL2dzbF9mZnRfcmVhbC5oPgo+ICsjaW5jbHVk
ZSA8bGltaXRzLmg+Cj4gICNpbmNsdWRlIDxtYXRoLmg+Cj4gICNpbmNsdWRlIDx1bmlzdGQuaD4K
PiAgCj4gICNpbmNsdWRlICJpZ3RfYXVkaW8uaCIKPiArI2luY2x1ZGUgImlndF9hdXguaCIKPiAg
I2luY2x1ZGUgImlndF9jb3JlLmgiCj4gKyNpbmNsdWRlICJtZW93X2ZmdC9tZW93X2ZmdC5oIgo+
ICAKPiAgI2RlZmluZSBGUkVRU19NQVggNjQKPiAgI2RlZmluZSBDSEFOTkVMU19NQVggOAo+IEBA
IC0zMjIsNiArMzI0LDUzIEBAIHN0YXRpYyBkb3VibGUgaGFubl93aW5kb3coZG91YmxlIHYsIHNp
emVfdCBpLCBzaXplX3QgTikKPiAgCXJldHVybiB2ICogMC41ICogKDEgLSBjb3MoMi4wICogTV9Q
SSAqIChkb3VibGUpIGkgLyAoZG91YmxlKSBOKSk7Cj4gIH0KPiAgCj4gKy8qKgo+ICsgKiBydW5f
ZmZ0Ogo+ICsgKiBAYXJyYXk6IFRoZSBzaWduYWwgdG8gcnVuIEZGVCBvbgo+ICsgKiBAbGVuZ3Ro
OiBUaGUgc2lnbmFsIGJ1ZmZlciBsZW5ndGggKG11c3QgYmUgYSBwb3dlciBvZiAyKQo+ICsgKgo+
ICsgKiBSdW4gdGhlIEZhc3QgRm91cmllciBUcmFuc2Zvcm0gb24gdGhlIHByb3ZpZGVkIHNpZ25h
bCwgd2hvc2UKPiArICogbGVuZ3RoIG11c3QgYmUgYSBwb3dlciBvZiAyLiBUaGUgcmV0dXJuIHZh
bHVlIHBvaW50cyB0byBhbgo+ICsgKiBhcnJheSBvZiBOLzIgc3RydWN0cyB3aXRoIHJlYWwgKC5y
KSBhbmQgaW1hZ2luYXJ5ICguaikgcGFydHMuCj4gKyAqCj4gKyAqIEZvciB0aGUgMC10aCBGRlQg
ZWxlbWVudCwgb25seSB0aGUgcmVhbCBwYXJ0IGlzIHZhbGlkIC0gaXRzCj4gKyAqIGltYWdpbmFy
eSBwYXJ0IGlzIGFsd2F5cyAwIGFuZCBpcyBub3Qgc2F2ZWQgYW55d2hlcmUuCj4gKyAqCj4gKyAq
IEZvciB0aGUgKE4vMiktdGggZWxlbWVudCwgYWdhaW4sIG9ubHkgdGhlIHJlYWwgcGFydCBpcyB2
YWxpZC4KPiArICogVGhlIGFycmF5IGRvZXMgbm90IGhhdmUgZW5vdWdoIHNwYWNlIHRvIHNhdmUg
aXQgYXMgYSBzZXBhcmF0ZQo+ICsgKiBlbGVtZW50LCBzbyBpdHMgcmVhbCBwYXJ0IGlzIHNhdmVk
IGluIHRoZSAwLXRoIGVsZW1lbnQncwo+ICsgKiBpbWFnaW5hcnkgcGFydC4KPiArICovCj4gK3N0
YXRpYyBNZW93X0ZGVF9Db21wbGV4ICpydW5fZmZ0KGRvdWJsZSAqYXJyYXksIHNpemVfdCBsZW5n
dGgpCj4gK3sKPiArCXNpemVfdCB3b3Jrc2V0X2J5dGVzOwo+ICsJTWVvd19GRlRfQ29tcGxleCAq
ZmZ0X2RhdGE7Cj4gKwlzdHJ1Y3QgTWVvd19GRlRfV29ya3NldF9SZWFsICpmZnRfd29ya3NldDsK
PiArCj4gKwlpZ3RfYXNzZXJ0KGxlbmd0aCA+PSAyICYmIGlzX3Bvd2VyX29mX3R3byhsZW5ndGgp
KTsKPiArCj4gKwkvLyBHZXQgc2l6ZSBmb3IgYSBOIHBvaW50IGZmdCB3b3JraW5nIG9uIG5vbi1j
b21wbGV4IChyZWFsKSBkYXRhLgo+ICsJd29ya3NldF9ieXRlcyA9IG1lb3dfZmZ0X2dlbmVyYXRl
X3dvcmtzZXRfcmVhbChsZW5ndGgsIE5VTEwpOwo+ICsJaWYgKHdvcmtzZXRfYnl0ZXMgPT0gMCkK
PiArCQlyZXR1cm4gTlVMTDsKPiArCj4gKwlmZnRfZGF0YSA9IG1hbGxvYyhzaXplb2YoTWVvd19G
RlRfQ29tcGxleCkgKiBsZW5ndGgpOwo+ICsJaWYgKCFmZnRfZGF0YSkKPiArCQlyZXR1cm4gTlVM
TDsKPiArCj4gKwlmZnRfd29ya3NldCA9IChzdHJ1Y3QgTWVvd19GRlRfV29ya3NldF9SZWFsICop
bWFsbG9jKHdvcmtzZXRfYnl0ZXMpOwo+ICsJaWYgKCFmZnRfd29ya3NldCkgewo+ICsJCWZyZWUo
ZmZ0X2RhdGEpOwo+ICsJCXJldHVybiBOVUxMOwo+ICsJfQo+ICsKPiArCW1lb3dfZmZ0X2dlbmVy
YXRlX3dvcmtzZXRfcmVhbChsZW5ndGgsIGZmdF93b3Jrc2V0KTsKPiArCW1lb3dfZmZ0X3JlYWwo
ZmZ0X3dvcmtzZXQsIGFycmF5LCBmZnRfZGF0YSk7Cj4gKwlmcmVlKGZmdF93b3Jrc2V0KTsKPiAr
Cj4gKwlyZXR1cm4gZmZ0X2RhdGE7Cj4gK30KPiArCj4gIC8qKgo+ICAgKiBDaGVja3MgdGhhdCBm
cmVxdWVuY2llcyBzcGVjaWZpZWQgaW4gc2lnbmFsLCBhbmQgb25seSB0aG9zZSwgYXJlIGluY2x1
ZGVkCj4gICAqIGluIHRoZSBpbnB1dCBkYXRhLgo+IEBAIC0zMzMsMTEgKzM4MiwxMiBAQCBib29s
IGF1ZGlvX3NpZ25hbF9kZXRlY3Qoc3RydWN0IGF1ZGlvX3NpZ25hbCAqc2lnbmFsLCBpbnQgc2Ft
cGxpbmdfcmF0ZSwKPiAgCQkJIGludCBjaGFubmVsLCBjb25zdCBkb3VibGUgKnNhbXBsZXMsIHNp
emVfdCBzYW1wbGVzX2xlbikKPiAgewo+ICAJZG91YmxlICpkYXRhOwo+ICsJTWVvd19GRlRfQ29t
cGxleCAqZmZ0X2RhdGE7Cj4gIAlzaXplX3QgZGF0YV9sZW4gPSBzYW1wbGVzX2xlbjsKPiAgCXNp
emVfdCBiaW5fcG93ZXJfbGVuID0gZGF0YV9sZW4gLyAyICsgMTsKPiAgCWRvdWJsZSBiaW5fcG93
ZXJbYmluX3Bvd2VyX2xlbl07Cj4gIAlib29sIGRldGVjdGVkW0ZSRVFTX01BWF07Cj4gLQlpbnQg
cmV0LCBmcmVxX2FjY3VyYWN5LCBmcmVxLCBsb2NhbF9tYXhfZnJlcTsKPiArCWludCBmcmVxX2Fj
Y3VyYWN5LCBmcmVxLCBsb2NhbF9tYXhfZnJlcTsKPiAgCWRvdWJsZSBtYXgsIGxvY2FsX21heCwg
dGhyZXNob2xkOwo+ICAJc2l6ZV90IGksIGo7Cj4gIAlib29sIGFib3ZlLCBzdWNjZXNzOwo+IEBA
IC0zNjAsMjcgKzQxMCwyMiBAQCBib29sIGF1ZGlvX3NpZ25hbF9kZXRlY3Qoc3RydWN0IGF1ZGlv
X3NpZ25hbCAqc2lnbmFsLCBpbnQgc2FtcGxpbmdfcmF0ZSwKPiAgCWZyZXFfYWNjdXJhY3kgPSBz
YW1wbGluZ19yYXRlIC8gZGF0YV9sZW47Cj4gIAlpZ3RfZGVidWcoIkFsbG93ZWQgZnJlcS4gZXJy
b3I6ICVkIEh6XG4iLCBmcmVxX2FjY3VyYWN5KTsKPiAgCj4gLQlyZXQgPSBnc2xfZmZ0X3JlYWxf
cmFkaXgyX3RyYW5zZm9ybShkYXRhLCAxLCBkYXRhX2xlbik7Cj4gLQlpZiAocmV0ICE9IDApIHsK
PiArCWZmdF9kYXRhID0gcnVuX2ZmdChkYXRhLCBkYXRhX2xlbik7Cj4gKwlpZiAoIWZmdF9kYXRh
KSB7Cj4gIAkJZnJlZShkYXRhKTsKPiAgCQlpZ3RfYXNzZXJ0KDApOwo+ICAJfQo+ICAKPiAtCS8q
IENvbXB1dGUgdGhlIHBvd2VyIHJlY2VpdmVkIGJ5IGV2ZXJ5IGJpbiBvZiB0aGUgRkZULgo+IC0J
ICoKPiAtCSAqIEZvciBpIDwgZGF0YV9sZW4gLyAyLCB0aGUgcmVhbCBwYXJ0IG9mIHRoZSBpLXRo
IHRlcm0gaXMgc3RvcmVkIGF0Cj4gLQkgKiBkYXRhW2ldIGFuZCBpdHMgaW1hZ2luYXJ5IHBhcnQg
aXMgc3RvcmVkIGF0IGRhdGFbZGF0YV9sZW4gLSBpXS4KPiAtCSAqIGkgPSAwIGFuZCBpID0gZGF0
YV9sZW4gLyAyIGFyZSBzcGVjaWFsIGNhc2VzLCB0aGV5IGFyZSBwdXJlbHkgcmVhbAo+IC0JICog
c28gdGhlaXIgaW1hZ2luYXJ5IHBhcnQgaXNuJ3Qgc3RvcmVkLgo+IC0JICoKPiArCS8qIENvbXB1
dGUgdGhlIHBvd2VyIHJlY2VpdmVkIGJ5IGV2ZXJ5IGJpbiBvZiB0aGUgRkZULiBUaGUgcnVuX2Zm
dAo+ICsJICogZnVuY3Rpb24gZG9jcyBleHBsYWluIHRoZSBzcGVjaWFsIGNhc2VzIG91dHNpZGUg
b2YgdGhlIGZvciBsb29wLgo+ICAJICogVGhlIHBvd2VyIGlzIGVuY29kZWQgYXMgdGhlIG1hZ25p
dHVkZSBvZiB0aGUgY29tcGxleCBudW1iZXIgYW5kIHRoZQo+ICAJICogcGhhc2UgaXMgZW5jb2Rl
ZCBhcyBpdHMgYW5nbGUuCj4gIAkgKi8KPiAtCWJpbl9wb3dlclswXSA9IGRhdGFbMF07Cj4gKwli
aW5fcG93ZXJbMF0gPSBmZnRfZGF0YVswXS5yOwo+ICAJZm9yIChpID0gMTsgaSA8IGJpbl9wb3dl
cl9sZW4gLSAxOyBpKyspIHsKPiAtCQliaW5fcG93ZXJbaV0gPSBoeXBvdChkYXRhW2ldLCBkYXRh
W2RhdGFfbGVuIC0gaV0pOwo+ICsJCWJpbl9wb3dlcltpXSA9IGh5cG90KGZmdF9kYXRhW2ldLnIs
IGZmdF9kYXRhW2ldLmopOwo+ICAJfQo+IC0JYmluX3Bvd2VyW2Jpbl9wb3dlcl9sZW4gLSAxXSA9
IGRhdGFbZGF0YV9sZW4gLyAyXTsKPiArCWJpbl9wb3dlcltiaW5fcG93ZXJfbGVuIC0gMV0gPSBm
ZnRfZGF0YVswXS5qOwo+ICAKPiAgCS8qIE5vcm1hbGl6ZSB0aGUgcG93ZXIgKi8KPiAgCWZvciAo
aSA9IDA7IGkgPCBiaW5fcG93ZXJfbGVuOyBpKyspCj4gQEAgLTQ4Nyw2ICs1MzIsNyBAQCBib29s
IGF1ZGlvX3NpZ25hbF9kZXRlY3Qoc3RydWN0IGF1ZGlvX3NpZ25hbCAqc2lnbmFsLCBpbnQgc2Ft
cGxpbmdfcmF0ZSwKPiAgCQl9Cj4gIAl9Cj4gIAo+ICsJZnJlZShmZnRfZGF0YSk7Cj4gIAlmcmVl
KGRhdGEpOwo+ICAKPiAgCXJldHVybiBzdWNjZXNzOwoKSW50ZWwgU2VtaWNvbmR1Y3RvciBBRw0K
UmVnaXN0ZXJlZCBOby4gMDIwLjMwLjkxMy43ODYtNw0KUmVnaXN0ZXJlZCBPZmZpY2U6IER1Zm91
cnN0cmFzc2UgMTAxICwgODAwOCBadXJpY2gsIFN3aXR6ZXJsYW5kCg==

