Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3883D358DC
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 08:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E16C10E261;
	Thu, 29 Jan 2026 08:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdEtCLfS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE0810E261
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 08:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769674776; x=1801210776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DYDdgeH1bAkbwksG2p/5cC2+0z3pYMaJHm3vF65f77E=;
 b=KdEtCLfSBZVFYt37pxDrJuEQibAI62hsfZfrNciOgJLw0kwy+PuZDxa7
 EiE2wUyt7d2XxhMZMTMhV+nZAAGLmHTtKr4B5e5UkDmsAbnqdznpuJ8UA
 WdiiIx1H3nHsYAdyfbeCDkZXt6RKPgpvcbsErZSF4JcTthDyzVZbNFoVG
 jYJT8x7sOduMmuxlGdIsN/wOcyX/SOM9X2r9EvLN/04IfuDYOlqZyUj8o
 esw1i+7WoUyoedXgxlJPoT6H8AKupSZUcqeCd2sxG5L8Gr8AxYNoPxcW5
 CVaVraGAivIY3Ua+DHXzAm5cmjAX3Kd+NCPKjzUPHkztwlF34wio3D03r Q==;
X-CSE-ConnectionGUID: EK5C4stwTJuK0XM93dAS6Q==
X-CSE-MsgGUID: 4GtcrgK5Q12P19wfRrTHyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82333256"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="82333256"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:19:35 -0800
X-CSE-ConnectionGUID: Jt1JpEkRQlas1DoGS8lylA==
X-CSE-MsgGUID: 4bwjRLaQQHeqHST1rNxUXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208609709"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:19:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:19:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 00:19:34 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 00:19:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8m28U9uRPpdkXx9PAAZkFbULWeEGPeultEwx4LbBYUH+P0kfSyP5BXhU7zgdN/pVB9O6OfNIKxdw4BGcR7ahr5NpkRunxzTgpPLMemkQotkim3xLLfu9vG8ZUeDsL1QEzWyssC9lkA5pw0HtbBbYfEkvvcAcTjZikPcIgWpKnXkrijwZpwzWX/Y1PT0pPGN8vsYQwovGpF+Ah+s/AV26GILhCIRMSVBVXwKosYbufPh03d9r3ZI1T2oCyY9l4E/uWljJyWsoKpmzZ882sOgtf020eg0lpPTCIeAZcq9RmcKzEl+ACvB6PrOx0JTZrcPNABEuUM/4MGyyNHDDxtrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fl6pLRI5KPOgsbLGVLDYuMKIOfYJf+pkvzlX87NxfJc=;
 b=zR8+x3y35Y7hIWpyCwO3TVk6KZy52cbYoeTMUPT1OyV/AU57oo6tgF/X6fJmGoFVKcpbrqY8nRmlgTMNV9QYFO9m+RrWWooZrI7S662LH4eCMLeClECOQ3cgsJgyU25wSq3QaCqERkhsstdT8xHZi44xialEHAWBEzc6whhErLytcZ9l0M0qpH/HXMyur2BcjbQAcPVFiTWwNYiiGVogwDhlhBe1r2J2eTS5iQbcBYzyZ19Xr45CniP+mMpj/5v5djFKF0P2MvHla2+9Ee/PB/wdUnAf+jfxfZjd9GFv5XM/mOhIFdvU9t5tNeWQcsF4VsvvbeOD09OVDbutgsyqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA3PR11MB9087.namprd11.prod.outlook.com (2603:10b6:208:57f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 08:19:32 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 08:19:32 +0000
Message-ID: <066a4ec5-2440-4b2c-8f8d-4d9448fae771@intel.com>
Date: Thu, 29 Jan 2026 09:19:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 02/10] lib/tests/igt_sysfs_choice: Add test
 coverage
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
 <20260128180819.1373376-3-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20260128180819.1373376-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::41) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA3PR11MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: bb73d218-6a40-44ba-4e8d-08de5f0f2175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7142099003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2djeGJmV1pRVFVpeFc1bzZ5bjJYblhvQmI2WDMrYmJrZ1NqdElNalFFUTI2?=
 =?utf-8?B?eGZCRStXRGF0UGRNRGlUZU9vQ0FOcUM1Z3U0VjhrbTNCNFM0OERyWk53U0Zy?=
 =?utf-8?B?RGRJZ2J6d1g3ZDZtRms0WHF6TUtyK0F3L2E3RzROZ00vcklMU1l1d2ZYZTRm?=
 =?utf-8?B?TVhrSVpWclN2KzkxTG9PK3k3SWcyNHlnYWRkK0lyMExFRktxM082Mk5aR2c3?=
 =?utf-8?B?WDdGMWFOSnAyRkhQTlovYTZTaDhJVllpdHZ3MEtZNFlNY05wa2tVUVZ4bFZy?=
 =?utf-8?B?a3ovdkhsUG5kd3NqalBKZ2EveFhEcE85UVNZay92VUs0WVBmK0prKzZYZHVu?=
 =?utf-8?B?MnBxbFBOeGlacXdRUWdhbUo2ZmltQ3NkQ3U0aWVJNjV3Y3NiNUJzc2ZwZCtO?=
 =?utf-8?B?LzhqQUQvTElsTmE4eWg5SkRJY2F0RDJIdDVaNUI2RUJGSjBXTGt4OTVXL252?=
 =?utf-8?B?Q0QwTU1GNXVwOFk4bjM2d3RQa2dXN0ZMTXlyeFdRdjRRS3JLRVhNTmxvZEtS?=
 =?utf-8?B?c2dmbExjR2NwakN2VU12cHJJeFcrUytEdmxYM0xqZWs3ekRPYXdHN1NIQTZC?=
 =?utf-8?B?N212RGhXd25ISE5HenRubk40djB6amVpTXRtVUQ1c3RSK0tLYjM1T1JVZzZ4?=
 =?utf-8?B?Wm5xdWlkMkVlNHJoS1hWbVhJd1lsWmUyS1hYVUJlL0ZZUGtlOHFjdjBCK1BH?=
 =?utf-8?B?aUVsNXpocHIzWVRlb2NxaCtqakxoRHBBelBmVlZHNUx1ekRzUzRKNDdRS012?=
 =?utf-8?B?YXRQcGVUS2QvdVN1NmRldUQwYUsrWVhkdTFzWFBDTDhhbVo4TWxVeU5kM2Zy?=
 =?utf-8?B?RWIyTUppbU50bXhNckJmaDhaVmUwMUo3ZXZjYjNCU2EyeS9RZ3A3cFM2UXlI?=
 =?utf-8?B?b21mZkVIaXVsY20xcGRpb3FQdVE0Tk9XMVl4WWtqaUMzaEhCM3hmY1hKdXJk?=
 =?utf-8?B?UmJ6UGJyMzZkbmlPNTRhenpxcjNrbG8xendaSVVIK2xMaUpJdXNDWTVwMnZB?=
 =?utf-8?B?aENUZE9EbG00WHNIOGxWeHRYb1JrNllPbmdqUVEzeERDYjAwdTJxNGdWS1dB?=
 =?utf-8?B?dk56TlFCKzRFVFJFM2dRU25FQUJSQUdJT1pjZzRLNFJCVTlNeU5EalRTRVI2?=
 =?utf-8?B?NDM2MG1XZzI4SllYcnhWZWNWdWh5R1FxMDQ5TVFoK2o4VHdjdkNXYTYwTG5r?=
 =?utf-8?B?Q3kwa1pBL2xmZXZ5UVFCVjlRR1Y2Q1hHUTZ3cXkrOFZSOEhnSEU4WjNhbW95?=
 =?utf-8?B?MWpJSzlKK2g2UDFKSjV2N3g1RXZpZTZNNjJzTGVEM2FqMUN5eXhrd3JZR283?=
 =?utf-8?B?YlBYd0g5NzVGNUZxTGthdkJFd1BPTnlaaFNPbWp2bnhybU91SkxmaldOVWtr?=
 =?utf-8?B?d014ajd6TzJiVWtTQWt3Vk5OQnhoUVNYdlZrWTZ5cmNrMGtOUUFUdGpBTUdl?=
 =?utf-8?B?eDVuZE9ONmV1eDB0bFZzeFl0cjI2WHVCZi9XVXhQTnZGV0JTYWxzNFAwZE91?=
 =?utf-8?B?WVJucEZvME0xS1ByYWxTQWNvVFpDTlYyWVJ4WVNSaGRnVUl2bURJU3BZd293?=
 =?utf-8?B?d2h5Sy90MWRTQ0JscnZqakY0MW9PQldpN3oyQm9QV0tnSUduQzFZYVdjRVNk?=
 =?utf-8?B?OHZMSUFoZFdsd3huRHg1ay9ObWpBYWpacmlYYnVLdkEzMDVMT2UrV0JhL2U5?=
 =?utf-8?B?a1dlUEIzRWVBWGxkdGI3ZHdQVlh1b3pIaDZwaTVEaVZkOGVXRFZuandYZlFn?=
 =?utf-8?B?cjB0V2xMOEhUM2xRYTB0dWJzUnBKZGd6MTJpd3duNCtyczBnbXVrRUVFelMv?=
 =?utf-8?B?QUVQV1NpUk1UZ0ljaGlXeEIwOHQyWUJQOFQ2MnlJRzdOcWRmanBiVk9sRzk1?=
 =?utf-8?B?N1J3aWtmVGtlT3RJNTZ3OHRxTk81SnRkaCtsYzdNUGFpNmdpR2NhNDZHQmh6?=
 =?utf-8?B?elhlVkJFMi9EVE5RTURvUkc3dWQwd2FKN2thVXc1S2dnREdRQlArcFlkY0s4?=
 =?utf-8?B?cHJmRlBiZE8vK2VvRjJYQWJQNVY3U00rai9Scm9rN1IrNVR5bU9kZzlyWlZq?=
 =?utf-8?B?Vjl5emVob05jb1dEZFNIMjFTQm1yQ0hCYitWK0ZLR0c5NVE0YmdLOE4rcGM4?=
 =?utf-8?Q?noOk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjlpZjQyWGw0YW40QkdqbEpOY1RZbjNNVC9rZ2QyNUh0Qmx6OVJ6b0MzNThG?=
 =?utf-8?B?VDMwVTI2bk0yMkFEbmxZQlYxdEhXLzhVZHI2VHZ1alZqVmtYUmxFR0VQZVBJ?=
 =?utf-8?B?TVY2UkN2Zlc3Q3FFMDNZbGpzNU9na21HakhUVk9zNXVFZFFzeUxsUklaTlZ3?=
 =?utf-8?B?a0J2MVVpTDZUaUc2Tk1HTUJxTVJaZm10bW1WLzlVUEwyRXkrWXlOeWVPMk5k?=
 =?utf-8?B?M1hDb1E1dVFGQ0MxVzZnSmFnV0dkaTVmT05hYjlBaUpFQXpwbFVtYVRSUW9Z?=
 =?utf-8?B?YjZmMkFiR2RkVTRTYlhVZ2V0YUN6YUQvTEsySGl3c3RVSGlBYThBUzNKL1Nh?=
 =?utf-8?B?dEFBT2ZOZngzVWFFNHNLNTJ5Q2NDa2hCNmdHdE5iN2wrelRGTXhPdDF0cUhC?=
 =?utf-8?B?OTFBRHZ4Z2tBK2loUmc4eU83d2xqQU84cmtuMzVraGpXbS9yOXFsbFNpcmNt?=
 =?utf-8?B?OHV0djhTb0MvQXR0SmlWZW9hazZyMk1EcEN5bkZuaEUyT0RHcGM1Qnp1amlY?=
 =?utf-8?B?U09xV3pCa2ZFOGZMN1RKUDA5Y0hpNTVjZzA0Sk9DWDJrRDBoL1NQREhYWHpt?=
 =?utf-8?B?TTFHQ2lBRHlWT1gzUXkwNlpkbnAyd2dTd0hDeS9WQUhrKzVlbnJIWnNLeUh1?=
 =?utf-8?B?RDAzaks2WTVWb0VDK29jQ0xhZVVlT2NGZjF1RmloYlFoQ1VLdVFVVDBxeGVM?=
 =?utf-8?B?NWNFdnJ4S1RwREltdjRxTTZqTTJIUlJYZmZDUFA5RFp3OHcvbTM1TnE1cFFl?=
 =?utf-8?B?bXd2Y0QxSFFoK0x0ZDFWQXRLdUVaTG9wNkpycjVPb1R1NXVVcnQwRVVOWkJT?=
 =?utf-8?B?US81SlJKR0JOaHBSRDJrMk5yTkpyWERKTUtpZ2c1VWJ5Y2VIa1FBZkNuNTVE?=
 =?utf-8?B?bmt4MElJLzB5QU1xY3o5YXFlaUU5bEJvTzkwckNQRmVvNFFFNE83elRsdjVP?=
 =?utf-8?B?YkxHN1pXK0Iwbmg0SCtWajBmQStudmQyMWE2SGhkWkswL0V3ZGpaWEtNemxq?=
 =?utf-8?B?T2dxZElBKzVWM1lNbnJLbkVXekZhM0JEb3RNQWYzNk52NU5VZnZobTdjV0hq?=
 =?utf-8?B?ZXJyZU5XS0l5cERpL29GZ0RqTVVLUStJbjROc0F2Mjl1aElMNWJaalUzSE03?=
 =?utf-8?B?d0gxNWVLZ3pKWk0yOEpsazNXeEJpdngzT3VFZVNNSkhhM3dSWFQ0TTJaVytv?=
 =?utf-8?B?THJaclBMM2IwRVNMZWhZUURBWTYyYW5UU2NTQTVjYzFMaWoyVVRlL2VrcktM?=
 =?utf-8?B?dWVKeXVWZTIvdEhDQ2drKzQ5VU1EaHJkeUh2Q2owUkw4M0o0VEpWUzZNR2xh?=
 =?utf-8?B?b0tjejZ5eU1HNWN5MDB6MmpsNlppT2owMnlnVmt5TU9ma2NtWndjSjVsWDZn?=
 =?utf-8?B?Vlhvc3N5bC9RQ1drYlczQ2JEUTdUTU1GajBMSEdMSWczeW8xOWxaWXNJTEp4?=
 =?utf-8?B?ZDV0ZnJySFJ1Z0tra1pEQWRWMzQ5Z1N4VlZCcS8wTjhFVUxlZ1g1WmFMdzFM?=
 =?utf-8?B?eGJMbUpSL1h4NTk5dGhMZmhZT3Qza3pXb2VqVGlkTlF3Mjd3ZjQwcWNiRCt4?=
 =?utf-8?B?SkNDWHRPUEpyNFpYL0UvT2U0eHdVNTlETFI1MlY5TTMvYk9MMFFOaHZQb2U0?=
 =?utf-8?B?RFFKR083VE13eitEcVpWQmR3ejY3USswYzlPNFlGYXpFckJYdXpVTHpWQ25U?=
 =?utf-8?B?QXlwZTR5N3BtdS9CbXFCQlJhc1cwSzJiNGV1NHRMRW5TNnRwb1RGZmswQTVG?=
 =?utf-8?B?clUxcll6Y21LUE0vTTBObXU1aXpEVnRCc0tRaVZJU3NMSm1FUTBWTHBqNnpU?=
 =?utf-8?B?SzQ3KzJ0MnZnd2Z0bHJlMjV0SER6a1g0WmxGVkpBdkdUWHQ4NTBKVUlsMzBx?=
 =?utf-8?B?UXY0bDhXZWtNSlVkcmpOYXJGN25maHdEYk1VOGczVXBRQUpJcHFieXlpTlQv?=
 =?utf-8?B?aFhKeHJZYS9rdmlyelVRTnAvNU9FMDMreDVxRm8rMHZwOW5xT2ZBelpPaVBT?=
 =?utf-8?B?aXRkNVhrQXNTUWc4NGpHbFRSdVprdFJrdUh5bWgySERxdnJTZTZqTm9xL0ZM?=
 =?utf-8?B?bWxvNFZUV29JN0pWVnNBQXowUHY1TEtvSFR4RVhMOERLNzhwNXBURXozMVNS?=
 =?utf-8?B?UFJFL2F6QXR5MjlMQWFuTlNHdlBTTTFpSm5vVUJKZUdhM242U0U2NTl6VnJL?=
 =?utf-8?B?VDlNV1ljWGRnWFRxWENrSlRSaExjU2pDcWk5d3UrS21MZUhOQU5DV2pud0py?=
 =?utf-8?B?Z0ZVM0lBLzhFaWppNjdwc0tqRnh2UFlYSTFkYTVLdUtSZHRtZEtLUm00Q2JZ?=
 =?utf-8?B?dkY5U2QxNTRKeHR2QWpaTlRlSFdLZWpBYnZRbi9pQmxNWGJQQ3ZYUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb73d218-6a40-44ba-4e8d-08de5f0f2175
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:19:32.4424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ULMGEaSn5i9X8aNrL0GrtUYMuhYAAE5/0c+cgowlwhrZ0xPcX0PUS5DxMY5i2MDqGcNIJIvP/YtkiA0twKTvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9087
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


On 1/28/2026 19:08, Marcin Bernatowicz wrote:
> Add unit tests exercising parsing, selection rules, intersection,
> round-trip formatting, and mask conversion for igt_sysfs_choice.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> ---
> v2:
> - Align igt_simple_main() usage with upstream changes.
> - Corrected date, improved assert messages.
> - Use BIT() instead of (1u << n) for sysfs choice masks.
> - Adjust test for igt_sysfs_choice_to_string() returning error code.
> - Adjust test for igt_sysfs_choice_format_mask() returning error code.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/tests/igt_sysfs_choice.c | 388 +++++++++++++++++++++++++++++++++++
>   lib/tests/meson.build        |   1 +
>   2 files changed, 389 insertions(+)
>   create mode 100644 lib/tests/igt_sysfs_choice.c
>
> diff --git a/lib/tests/igt_sysfs_choice.c b/lib/tests/igt_sysfs_choice.c
> new file mode 100644
> index 000000000..c573a0dff
> --- /dev/null
> +++ b/lib/tests/igt_sysfs_choice.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <errno.h>
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "intel_chipset.h"
> +#include "igt_sysfs_choice.h"
> +
> +static void assert_token(const struct igt_sysfs_choice *c,
> +			 size_t idx, const char *expected)
> +{
> +	igt_assert_f(idx < c->num_tokens,
> +		     "token index %zu out of range (num_tokens=%zu)\n",
> +		     idx, c->num_tokens);
> +	igt_assert(c->tokens[idx]);
> +	igt_assert_f(!strcmp(c->tokens[idx], expected),
> +		     "token[%zu] mismatch: got='%s' expected='%s'\n",
> +		     idx, c->tokens[idx], expected);
> +}
> +
> +static void parse_ok(const char *str, struct igt_sysfs_choice *choice)
> +{
> +	int ret;
> +
> +	ret = igt_sysfs_choice_parse(str, choice);
> +	igt_assert_f(ret == 0, "parse(\"%s\") failed: %d\n", str, ret);
> +}
> +
> +static void test_parse_basic_first_selected(void)
> +{
> +	struct igt_sysfs_choice c;
> +
> +	parse_ok("[low] normal high\n", &c);
> +
> +	igt_assert_eq(c.num_tokens, 3);
> +	assert_token(&c, 0, "low");
> +	assert_token(&c, 1, "normal");
> +	assert_token(&c, 2, "high");
> +
> +	igt_assert_eq(c.selected, 0);
> +}
> +
> +static void test_parse_middle_selected_whitespace(void)
> +{
> +	struct igt_sysfs_choice c;
> +
> +	parse_ok("  low   [normal]   high  \n", &c);
> +
> +	igt_assert_eq(c.num_tokens, 3);
> +	assert_token(&c, 0, "low");
> +	assert_token(&c, 1, "normal");
> +	assert_token(&c, 2, "high");
> +
> +	igt_assert_eq(c.selected, 1);
> +}
> +
> +static void test_parse_single_token(void)
> +{
> +	struct igt_sysfs_choice c;
> +
> +	parse_ok("[only]\n", &c);
> +
> +	igt_assert_eq(c.num_tokens, 1);
> +	assert_token(&c, 0, "only");
> +	igt_assert_eq(c.selected, 0);
> +}
> +
> +static void test_parse_error_missing_selected(void)
> +{
> +	struct igt_sysfs_choice c;
> +	int ret;
> +
> +	ret = igt_sysfs_choice_parse("low normal high\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +}
> +
> +static void test_parse_error_multiple_selected(void)
> +{
> +	struct igt_sysfs_choice c;
> +	int ret;
> +
> +	ret = igt_sysfs_choice_parse("[low] [normal] high\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +
> +	ret = igt_sysfs_choice_parse("low [normal] [high]\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +}
> +
> +static void test_parse_error_unterminated_bracket(void)
> +{
> +	struct igt_sysfs_choice c;
> +	int ret;
> +
> +	ret = igt_sysfs_choice_parse("[low normal high\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +
> +	ret = igt_sysfs_choice_parse("low [normal high]\n", &c);
> +	igt_assert_eq(ret, -EINVAL);
> +}
> +
> +static void test_parse_error_too_many_tokens(void)
> +{
> +	struct igt_sysfs_choice c;
> +	char buf[512];
> +	size_t i;
> +	int len = 0;
> +	int ret;
> +
> +	/*
> +	 * Build a line with (IGT_SYSFS_CHOICE_MAX_TOKENS + 1) tokens:
> +	 * "[t0] t1 t2 ... tN"
> +	 */
> +	len += snprintf(buf + len, sizeof(buf) - len, "[t0]");
> +	for (i = 1; i < IGT_SYSFS_CHOICE_MAX_TOKENS + 1 && len < (int)sizeof(buf); i++)
> +		len += snprintf(buf + len, sizeof(buf) - len, " t%zu", i);
> +	len += snprintf(buf + len, sizeof(buf) - len, "\n");
> +
> +	ret = igt_sysfs_choice_parse(buf, &c);
> +	igt_assert_eq(ret, -E2BIG);
> +}
> +
> +static void test_selected_basic(void)
> +{
> +	struct igt_sysfs_choice c;
> +	const char *sel;
> +
> +	/* selected at position 0 */
> +	parse_ok("[low] normal high\n", &c);
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(sel);
> +	igt_assert(!strcmp(sel, "low"));
> +
> +	/* selected at position 1 */
> +	parse_ok("low [normal] high\n", &c);
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(sel);
> +	igt_assert(!strcmp(sel, "normal"));
> +
> +	/* selected at position 2 */
> +	parse_ok("low normal [high]\n", &c);
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(sel);
> +	igt_assert(!strcmp(sel, "high"));
> +}
> +
> +static void test_selected_invalid_index(void)
> +{
> +	struct igt_sysfs_choice c;
> +	const char *sel;
> +
> +	/* selected = -1 */
> +	parse_ok("[only]\n", &c);
> +	c.selected = -1;
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(!sel);
> +
> +	/* selected >= num_tokens */
> +	parse_ok("[only]\n", &c);
> +	c.selected = 999;
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(!sel);
> +
> +	/* empty choice */
> +	memset(&c, 0, sizeof(c));
> +	sel = igt_sysfs_choice_selected(&c);
> +	igt_assert(!sel);
> +}
> +
> +static void test_to_string_roundtrip(void)
> +{
> +	struct igt_sysfs_choice c1, c2;
> +	char out[IGT_SYSFS_CHOICE_MAX_LEN];
> +	int ret;
> +
> +	parse_ok(" low [normal]  high \n", &c1);
> +
> +	ret = igt_sysfs_choice_to_string(&c1, out, sizeof(out));
> +	igt_assert_eq(ret, 0);
> +
> +	/*
> +	 * Expect canonical format: tokens separated by single spaces,
> +	 * one [selected], no trailing newline.
> +	 */
> +	igt_assert_f(!strcmp(out, "low [normal] high"),
> +		     "choice_to_string produced '%s'\n", out);
> +
> +	/* Parse again and ensure we get the same structure. */
> +	parse_ok(out, &c2);
> +
> +	igt_assert_eq(c2.num_tokens, 3);
> +	assert_token(&c2, 0, "low");
> +	assert_token(&c2, 1, "normal");
> +	assert_token(&c2, 2, "high");
> +	igt_assert_eq(c2.selected, 1);
> +}
> +
> +static void test_find_basic(void)
> +{
> +	struct igt_sysfs_choice c;
> +	int idx;
> +
> +	parse_ok("[low] normal high\n", &c);
> +
> +	idx = igt_sysfs_choice_find(&c, "low");
> +	igt_assert_eq(idx, 0);
> +
> +	idx = igt_sysfs_choice_find(&c, "normal");
> +	igt_assert_eq(idx, 1);
> +
> +	idx = igt_sysfs_choice_find(&c, "high");
> +	igt_assert_eq(idx, 2);
> +
> +	idx = igt_sysfs_choice_find(&c, "ultra");
> +	igt_assert_lt(idx, 0);
> +}
> +
> +static const char *const prio_names[] = {
> +	"low",
> +	"normal",
> +	"high",
> +};
> +
> +static void test_to_mask_basic(void)
> +{
> +	struct igt_sysfs_choice c;
> +	unsigned int mask = 0;
> +	int selected_idx = -1;
> +	int ret;
> +
> +	parse_ok("[low] normal high\n", &c);
> +
> +	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
> +				       &mask, &selected_idx);
> +	igt_assert_eq(ret, 0);
> +
> +	/* low | normal | high -> bits 0,1,2 set */
> +	igt_assert_eq(mask, BIT(0) | BIT(1) | BIT(2));
> +	igt_assert_eq(selected_idx, 0);
> +}
> +
> +static void test_to_mask_ignores_unknown(void)
> +{
> +	struct igt_sysfs_choice c;
> +	unsigned int mask = 0;
> +	int selected_idx = -1;
> +	int ret;
> +
> +	parse_ok("[low] normal extra\n", &c);
> +
> +	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
> +				       &mask, &selected_idx);
> +	igt_assert_eq(ret, 0);
> +
> +	/* "extra" is ignored, only low + normal mapped */
> +	igt_assert_eq(mask, BIT(0) | BIT(1));
> +	igt_assert_eq(selected_idx, 0);
> +}
> +
> +static void test_to_mask_selected_unknown(void)
> +{
> +	struct igt_sysfs_choice c;
> +	unsigned int mask = 0;
> +	int selected_idx = 123;
> +	int ret;
> +
> +	parse_ok("low normal [extra]\n", &c);
> +
> +	ret = igt_sysfs_choice_to_mask(&c, prio_names, ARRAY_SIZE(prio_names),
> +				       &mask, &selected_idx);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert_eq(mask, BIT(0) | BIT(1)); /* low + normal */
> +	igt_assert_eq(selected_idx, -1);
> +}
> +
> +static void test_format_mask_basic(void)
> +{
> +	char buf[128];
> +	int ret;
> +
> +	/* mask for low + normal + high, selected = normal (1) */
> +	ret = igt_sysfs_choice_format_mask(buf, sizeof(buf),
> +					   prio_names, ARRAY_SIZE(prio_names),
> +					   BIT(0) | BIT(1) | BIT(2),
> +					   1);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_f(!strcmp(buf, "low [normal] high"),
> +		     "choice_format_mask produced '%s'\n", buf);
> +}
> +
> +static void test_format_mask_empty(void)
> +{
> +	char buf[128];
> +	int ret;
> +
> +	ret = igt_sysfs_choice_format_mask(buf, sizeof(buf),
> +					   prio_names, ARRAY_SIZE(prio_names),
> +					   0, -1);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(buf[0], '\0');
> +}
> +
> +static void test_format_mask_unknown_bit(void)
> +{
> +	char buf[128];
> +	int ret;
> +
> +	ret = igt_sysfs_choice_format_mask(buf, sizeof(buf),
> +					   prio_names, ARRAY_SIZE(prio_names),
> +					   BIT(0) | BIT(3),
> +					   0);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_f(!strcmp(buf, "[low]"),
> +		     "format_mask produced '%s'\n", buf);
> +}
> +
> +static void test_intersect_basic(void)
> +{
> +	struct igt_sysfs_choice a, b;
> +	int ret;
> +
> +	parse_ok("[low] normal high\n", &a);
> +	parse_ok("low [normal] ultra\n", &b);
> +
> +	ret = igt_sysfs_choice_intersect(&a, &b);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert_eq(a.num_tokens, 2);
> +	assert_token(&a, 0, "low");
> +	assert_token(&a, 1, "normal");
> +
> +	/* semantics: selected remains the original selected token if still common */
> +	igt_assert_eq(a.selected, 0);
> +}
> +
> +static void test_intersect_single_common(void)
> +{
> +	struct igt_sysfs_choice a, b;
> +	int ret;
> +
> +	parse_ok("low [normal] high\n", &a);
> +	parse_ok("[normal] ultra\n", &b);
> +
> +	ret = igt_sysfs_choice_intersect(&a, &b);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert_eq(a.num_tokens, 1);
> +	assert_token(&a, 0, "normal");
> +	igt_assert_eq(a.selected, 0);
> +}
> +
> +static void test_intersect_no_common(void)
> +{
> +	struct igt_sysfs_choice a, b;
> +	int ret;
> +
> +	parse_ok("[low] normal\n", &a);
> +	parse_ok("[high] ultra\n", &b);
> +
> +	ret = igt_sysfs_choice_intersect(&a, &b);
> +	igt_assert_eq(ret, -ENOENT);
> +}
> +
> +int igt_simple_main()
> +{
> +	test_parse_basic_first_selected();
> +	test_parse_middle_selected_whitespace();
> +	test_parse_single_token();
> +	test_parse_error_missing_selected();
> +	test_parse_error_multiple_selected();
> +	test_parse_error_unterminated_bracket();
> +	test_parse_error_too_many_tokens();
> +	test_selected_basic();
> +	test_selected_invalid_index();
> +	test_to_string_roundtrip();
> +	test_find_basic();
> +	test_to_mask_basic();
> +	test_to_mask_ignores_unknown();
> +	test_to_mask_selected_unknown();
> +	test_format_mask_basic();
> +	test_format_mask_empty();
> +	test_format_mask_unknown_bit();
> +	test_intersect_basic();
> +	test_intersect_single_common();
> +	test_intersect_no_common();
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build
> index 1ce19f63c..124a9ecae 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -23,6 +23,7 @@ lib_tests = [
>   	'igt_simulation',
>   	'igt_stats',
>   	'igt_subtest_group',
> +	'igt_sysfs_choice',
>   	'igt_thread',
>   	'igt_types',
>   	'i915_perf_data_alignment',
