Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850AEC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 11:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D15710E6CD;
	Wed, 22 Jan 2025 11:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/DPp28C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7377110E6CD
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737546443; x=1769082443;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=al8eGt5bY0Gpzal532gkT3anW/507Mc886Jx3Fvmgn0=;
 b=Z/DPp28CFDfLdsbvBkd3evqftU3CUXnScAmy8wBvnXJG/u1EiO9MD28e
 aB9QGUJ7DkNGWMsonjdACV3UneaNwoEJVgaqs4bm0bOiWKddnfULfoUP5
 8yzW+ivMtkXbnEw4Aq78PKcpqd694nyUuSzRMNkZcMtrduEPNezdhDIDH
 jEZYTqIgWKSBT1KFOARNYGbGH2iFZgYYo1YEXOv2zboQ5uFIQQfJy5DA8
 rQdBmvyxqWhk+kqxqvOUq2lZgBWOkS4DIXup7gboc1L+hDjmS8ErM6zi5
 WES2ozHbeUjTysASVBJpxzyZbjdxZNyuaE9M8x/abJ9eB8xsZ8ZB/0YxE g==;
X-CSE-ConnectionGUID: 62KmYRzBQUesn3AUazZvSA==
X-CSE-MsgGUID: 39cKTUbeT32/Uxxta36maA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="48595561"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48595561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 03:47:22 -0800
X-CSE-ConnectionGUID: R8BLViNWTgSmDdAEGWgIcw==
X-CSE-MsgGUID: xBd0Ig3pRoG5f9pzfH06Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111146638"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 03:47:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 03:47:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 03:47:21 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 03:47:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TN1dNnK8PaLeuP1xwrWMrqGJjff8ZUNztPUsTtuBeGMiWUY3oJipzhcvwvhgjzOZqV50GnXCjSCZXPxDinaG8vKP5xRPCTemzh7OAkcTNyduEvR0actFF3YBlpQ+SxdDcSs4HPQXj8CdCmBeqOANkD6LG0hhzW42CvGCPGeKZVpNL3XvsBRn93ljwDZZkeCiSCAqxXnj9948YACVox4WHjbI4ljU9tSWJW5WxleU1Sk/Zd1XBLuA1RRujq5w5AgcTjR7kZWKMdE+7MRIq0x1TvHPfkF6qy9vbtXZfQo5QtFQmbsYJe4j1nFwwLu+ozUUiTzt8jEi3Lp0xMss+MCi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m9K223YfnalWJmNK1T/vgMKeS4gTHwfYLX4jSWiBxU=;
 b=bI/iUWMRPacqnHHff7jvhdRufvwI6Wt+YQ1TbngjxK72p8vChIkc21ggGnFygJP9xR9X8sc4Z9M/hVQRcV95kwlo+vIxeLg5xh/Ww1JOZWz2sQEv7CDmI9HV+vXQ0qrhSqXD5Qu4WxWXhQVDc1GbG1ZZp9ijnEKXNcPQKdlSIZFpNMe3mQp0NHsdhHMq+0La8xzJ35Yrdk5UTIb8UJPKtRfjI7YRKZ8z+d1zfbQWeAbtEx7os88QcD+jGc3FVZeQ4wTwjuSki2DOYcAnw5kq8XVBBqDYV59vp6dTRld0cBu/liUnl1wp6FiGePHT08wZOw7vKe2OUCbKBV/ExZCDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM6PR11MB4706.namprd11.prod.outlook.com (2603:10b6:5:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 11:46:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 11:46:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121225733.808978-6-lucas.demarchi@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-6-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 5/7] runner: Free settings at the end
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 08:46:33 -0300
Message-ID: <173754639369.5500.6720737629497603639@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0368.namprd04.prod.outlook.com
 (2603:10b6:303:81::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM6PR11MB4706:EE_
X-MS-Office365-Filtering-Correlation-Id: 70576430-394d-47bb-a1e6-08dd3ada6dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEpuUmlUK08wV0tPT3drMzN4YklicEU0aXhIVi9FSmFmVjJkWmlXbU83Vklo?=
 =?utf-8?B?UXMxWFhNbmVrdmdhU3cxbTl0a2I3dWRGVkNVd3VaNWlYYWJZNmRqZ2JYbTZs?=
 =?utf-8?B?LzBpbVltaEtnQU9PZ3MzVkljS3hHNTliVyttZkp2VWNQK3NQYnhadTRUQjlS?=
 =?utf-8?B?b2VuMUpYaVU1Vlh5UnRRSEl4bTI2QUlBYXpub3NhTHIzUURGNEhpWC9mM1Rs?=
 =?utf-8?B?TEhkdkVQZUtXaSt4VGYwUlplZUxlcFBLT3BRNFVkbnNOREd3azlwbDhleU1z?=
 =?utf-8?B?QStSZTVHUWVnbTQxS0J0U011bWdlTnp3eU9QV2ViQ25WcC9pRVNBdXM3MG9v?=
 =?utf-8?B?MEJUbnZ0MVd4VDgrK0k5Umd1QWtIZEllNkhPa0RmRkZVMlJJK0N4ZHhkNTNZ?=
 =?utf-8?B?OFV4eHhDTEpoMzNQeHVCS3d5Nmpzb0MxTXU3YTJDcEQwMlZmSlRaUDRKZ1JE?=
 =?utf-8?B?WVYyOWtxYUZtVk1lck9xVmpPcXZjRFFwMVZaUmVuWGYrUDZxUlpJZEkvWDBw?=
 =?utf-8?B?dFNtQVlMR1RrOTdlMEE2cGw2a2M3Z1pTWi92ZVkwTXRnRE4rZWIvaFZ0NGZM?=
 =?utf-8?B?WWJHbmllQ1VOQjR0WWtQbTBkWXFlL2RLNlMwMTNLSzdMZ3ZZOUxlWW95cHlP?=
 =?utf-8?B?TGZOVEh0OUs5RUdIMGNnNHdlSWNPcHlSQnNuMW9IOFpySWRwdmNXVEE0Unh4?=
 =?utf-8?B?Ym5mYm9FQ25UczNhVnVXS1hFSy85WXZxa3MxMWMyWEo3MmxIYUx4eE1VZCtL?=
 =?utf-8?B?RExGa1EwVDFySFJucjIrWFBaaHJEbnhLaG83cVRkdithWXlHa2UyNWNBZ3lm?=
 =?utf-8?B?TVhKZWZHeXZBbDVpbU9Edi9DYnZuZlBVSmQvQ0FJQkJLUzZabE5mTmpXMkQ0?=
 =?utf-8?B?anBUT01scThzQ092YWhVL3ViMDU2K1duN0tYYU9FUEVJMENzbC9EN2srN0tC?=
 =?utf-8?B?REtSZzdUa1FtVEs0U1ZpeW1xeDhORTNocFU2Y3VFYVJaWVFKWjMxWFFPK3Jr?=
 =?utf-8?B?ZU54TWF0VWYvSVJ3VlBZcWNKY2RwNExUTTJnZy9OaW5qTUpmajNGbklJWG9P?=
 =?utf-8?B?TjNVM2ZyV2E1NGxrdHVpWUNUVlp3WXZZbHhSZEtkelZhWGM2aTJqWHJyUkVi?=
 =?utf-8?B?M2RNclFidi9UMlYzUUllYi9adDIzK0E4WTVoUHRqRGtpYTEwNElBQmpzY0Rh?=
 =?utf-8?B?K0NnM0pYS0hwS0ppL0FXeUNjMFFLL0pyWkExaHBuYjUxWnhpN3lub3VQd2NK?=
 =?utf-8?B?LzZDM1FGdDB0RUNSZG9sZm83RHZpNU5sRFhUZk1udGYvRlBoVGpUdWFPT2dG?=
 =?utf-8?B?UmUvNHB1ekVDKzBaSC84dmVFM2RaOVBUNVVuOHlLVEN0Nnl3TnVDRE9ianpv?=
 =?utf-8?B?MS9RdVlvR3dWcEtFYXZ0WDFUd1VCOVVnbEMyVGo4SzBTWjdGNjg2T0h4b3pz?=
 =?utf-8?B?bzFtS3NLeHVKVTh5ejB2Z3BpM1JuWHBvR2tDVU1hVVp3d2Q5WGt0WVQzOWpq?=
 =?utf-8?B?cUxFaTNtSUxtUWd0WjZ3VU1UTkNvZG5oeFU2b0pERDN0OXBxZEtRZWxDdHhw?=
 =?utf-8?B?TjhsOThkMlk3T0Q0Ym1OeXhwdUVubGZ4S1NKY21wRS9lcllkcDdLNW1KRHdO?=
 =?utf-8?B?V3JNNDVsVWhCZGlzY2xqdjc4SlcxaW8vdjIvYUI2U1U5ZDdYczB4RVByRWpR?=
 =?utf-8?B?WEYyVEtSSlppT2UxUG1IV1B1eG1paTk0ZHpoTURyRGZNbCs4cThTUlZKVkpm?=
 =?utf-8?B?Ny9peVdEdlp5WE1HcGFKYnJ5K2RhQnFQS1RaeEpONjZvWVdXcVZpZVlXT0Z3?=
 =?utf-8?B?ZGk0R3JVSlJ0TVRyNDhiakhCUi90UVlBcFdyTzUxNmxyU29jalI5ZUdjRFNF?=
 =?utf-8?Q?5Y7ww5tCHkZCS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2gxMzNpWHNJcEkrbmNjTXlZOFdSVGJuU09mVmxlcm9GZmJMTi9MN2h6Vkpi?=
 =?utf-8?B?RS90SWI2ME1rWnBmRytHN3RLR1E4R2JsUW4yVFVTdWZXdWJhdm1xWG1ZRkdU?=
 =?utf-8?B?Unh2dHdXWlFCd042b0djUERKVzZORElqTnBQb2JpWVJURkdDZGdMdnI4U2Mr?=
 =?utf-8?B?Y3I1L0VwZlVmeXI3L05RdEJzS3A0L3pxYjk4Rmd4d05GanZNRlRpOFVKZ3JT?=
 =?utf-8?B?ZWhNeU14NnJNck51N0t0UHFLb0UrenIvK0NoaWFqUDQ1MURXZW5ZSTJZWU1p?=
 =?utf-8?B?VllaTW41NXZEOWttRWZPb1VGaGJOY1hnWDRVTndNTXh4VGo0a29vREI4TDJi?=
 =?utf-8?B?R3RpMlA4V2NDSWtkOVVkUUlDaE5nNjdQc3gyc3VTb0k4VFBxQmFYdDBiMFRk?=
 =?utf-8?B?WHUvMHZxOVNyVUtsWTNWUk1FTS9mRFNkbUdFbGswYUhZVngwNWNJdHBoZnY4?=
 =?utf-8?B?YWgrdWpYZytrZlVEVzZjRGNRaWI5UU1FbmF1b2k1OXFwWkNwcFQrMmE1TUNT?=
 =?utf-8?B?NWJtQmxxNVZCcGhETTRpbE5jQXBFdW5PZzM0b0xXa2w0RXY5UjZ4dFZLaTQz?=
 =?utf-8?B?eUxiQ1VabnZHNnR4QlBvRDUxVGhOWHRzKzhUNWF1bXlRL3FjbHNLbEN2K2d6?=
 =?utf-8?B?bXhnaWhHOThSa3hiR1dOcGEzeDhJSHFNVnEvaVlaKzVrU0xEbHI1SzRUbHdI?=
 =?utf-8?B?Q0xIdlUxRWlLMEhmVDlDVWtGMXV0MUtTNWhQaWoxRUtmTi93aTdBTDRkeUJx?=
 =?utf-8?B?Z2F5bnVDRGZNNzk0NGhuNm1FWVhSVUJqcVBXY3lHSGFTZGdFMmtDRVdCMDB3?=
 =?utf-8?B?Z1RqZ2p6ZlduQjVKZU9keFR3V0hGakVOa1cvN0QyVzZoR2M2OWR0ZHkzU2k3?=
 =?utf-8?B?SkRPSjRaa0JXK1BQVTMrWk9XRDdzcW5MK2dKcEEwVkh4NGRCNXh4SWcwS1ZY?=
 =?utf-8?B?U3hQME1ldEl4bllRdXNrZWNyUkJMRHFscFdCblFULzgxb0dOUkxTSW41Uy9x?=
 =?utf-8?B?c1Zmek9FaUg0U2xaWDlYbmswU3ZtYVkwQlpBcC9heVdPa1JncHlWbjd1S2My?=
 =?utf-8?B?WE0vZWs3V1YzOUo5UGtMTUZEcVovcERNelJsTFJqVzBRVWpxRy9DNUxIemdu?=
 =?utf-8?B?MnBRZGYyWkFYb25JdU4reU9kbWdPWmlYbVZrZmRzWVpjNGFXemJCS2cxbVF5?=
 =?utf-8?B?M2tUeVBJYjBDQ0hOVm44Q1htclNNM0xQM3AyS1drOThPTGU0alI3blRtaGlZ?=
 =?utf-8?B?SHV0cHFPZEV1SUxsdkFuZmZYczBERjZtS0FaVkxXdFVGMHU0QklvZm9TMU1W?=
 =?utf-8?B?dGpYbnVYRzNvY0xJS0pZVGx0NHNiTXBVQ3RTWEJOYSsvUjlxUzNwSzE2dXRM?=
 =?utf-8?B?YllyN1VpVCtwMzBwaEliQmJvV2RMVTVTOHZaRVp0dDdSRnBHWk41TlhaVTNL?=
 =?utf-8?B?ODJmVGk3MTFaRVRKZll6blBySHIyT1Z4RDFzMlMzUElVVFpSQUN0VFVVajMr?=
 =?utf-8?B?czZvZElSMEdZNm82Qmh1TGNHUzduRmhZUHpsYmw0SzNQQUY5b09mV240TnI1?=
 =?utf-8?B?VW16d09rMzd5bGR5azM2OWRTV0Uya1RycVMxcGs1K25hbmtQVjRXSmRxNXpH?=
 =?utf-8?B?SW84YjdTZXB2YUdGOC9BWHZNc2hyVWJpL0o1VGhGWlVka2ZYZGtVbjVxeEhi?=
 =?utf-8?B?aWdqRGVzVHhUb2xpWFdwcjdIeGFxZkc3ZHpGNmxZS3VEMSsrN09QUlhvUVBN?=
 =?utf-8?B?cmNQS0xkbWdTRWkvOTRhNVYwdVE4U3RVYkhIZUpyb011K0JJa2QvWTc4bmdh?=
 =?utf-8?B?RmFKOFpRSEZVMGJVRDllRUlERGRGR1h5bjl0S21kMktMNFNHTENLZ2V5R3BW?=
 =?utf-8?B?OG8vL1pKcUxHdUs5NEVmUnFBd0FENlFEWWQ2eVR3Q2xXYlQxK1ljTlAwZVh3?=
 =?utf-8?B?UVdvVEs4cUpkQjdjRW9Ob2hZVUFTeGgzYW9NZTN4TDg1Smw2dEVtZkhEdzdX?=
 =?utf-8?B?OXF0eTNFWHJXT2pidUdGaDNwWXdEZFRUbGc1dTV3UnozcytaZmVLSzlBOG1I?=
 =?utf-8?B?NFNlTzA0bFpHV256dXB6RjA2SlIzb1Z2YkhmSytFQjF5a3ltRWlManp6cnlt?=
 =?utf-8?B?dGgxTzdRK3hFR1RmcmU4ZEJFUFgrSERCUjd1Y1QzUUdlVWlwNVlYWGV0K1dj?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70576430-394d-47bb-a1e6-08dd3ada6dd0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 11:46:37.7238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WrXAFdiR2Rjxtr1zTEhffA26YyyI269cacTSI4QS3HSatQ8tfr1huaTSDq9K3MMNDtxx7o3VxLuCTKaV25Lpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4706
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

Quoting Lucas De Marchi (2025-01-21 19:57:31-03:00)
>Keep valgrind happy with the normal allocations so we can find the real
>leaks. Avoid this kind of leak:
>
>        =3D=3D806592=3D=3D 8 bytes in 1 blocks are definitely lost in loss=
 record 46 of 188
>        =3D=3D806592=3D=3D    at 0x4846828: malloc (in /usr/libexec/valgri=
nd/vgpreload_memcheck-amd64-linux.so)
>        =3D=3D806592=3D=3D    by 0x4BD534E: strdup (strdup.c:42)
>        =3D=3D806592=3D=3D    by 0x10E6AA: parse_options (settings.c:863)
>        =3D=3D806592=3D=3D    by 0x10D2DD: main (runner.c:19)
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

This looks correct, so:

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

, but it seems we also need to make initialize_execute_state() and
initialize_execute_state_from_resume() properly clear_settings() when
things go wrong internally.

--
Gustavo Sousa

>---
> runner/resume.c | 2 ++
> runner/runner.c | 2 ++
> 2 files changed, 4 insertions(+)
>
>diff --git a/runner/resume.c b/runner/resume.c
>index 0f4e42bfa..ed17351c6 100644
>--- a/runner/resume.c
>+++ b/runner/resume.c
>@@ -55,6 +55,8 @@ int main(int argc, char **argv)
>                 exitcode =3D 3;
>         }
>=20
>+        clear_settings(&settings);
>+
>         printf("Done.\n");
>         return exitcode;
> }
>diff --git a/runner/runner.c b/runner/runner.c
>index 4855ad641..258b30b36 100644
>--- a/runner/runner.c
>+++ b/runner/runner.c
>@@ -49,6 +49,8 @@ int main(int argc, char **argv)
>                 exitcode =3D 1;
>         }
>=20
>+        clear_settings(&settings);
>+
>         printf("Done.\n");
>         return exitcode;
> }
>--=20
>2.48.0
>
