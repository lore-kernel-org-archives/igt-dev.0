Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E10D2E014
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 05:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9091C10E732;
	Wed, 23 Oct 2024 05:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9/vp4sK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF610E732
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 05:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729660720; x=1761196720;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=MRiH5/xVAoTPBzOTKhSfAvw3yDBb4jmxiVweE2BZ/kQ=;
 b=P9/vp4sKQk2I0WLftyVOKDErwlhMNXh3Z0H3KaN0fZ8hObq9LFU5DpWK
 cK83uJ6AwmohAFMtjQIEPlH4e9+LLKKfFJv9/TMiPFeNryjmnqiKE0o4l
 IkXrkgTlSuij/2ZX2rvpdgRrN4jfxtmZ/gDgRdNNKgp+W7qVvAzomY7ii
 u9vRVuAPxgN+4KNMQQHRu/PwS33CidrWpzFqw08fTg5eUuyxW6Z14lb7G
 tWugiCxEqOKUYexslbykD8gGrE0hbWJFgEHmIarg+9oWZYSFjy1PS/hhd
 fzEQYgxtljtCVRfG71QNcHpdnCdadyICalebNX+fWAjq/i44oznzjgGHv A==;
X-CSE-ConnectionGUID: UzQG77EsR7yKUf22NmtEeg==
X-CSE-MsgGUID: 48P3JqP3RUW2M4qy2ZILDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46690257"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="46690257"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 22:18:39 -0700
X-CSE-ConnectionGUID: yg8TMqkJQUW3513gqG3CpQ==
X-CSE-MsgGUID: uR1IzWk4QgeWsp/OKOKGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80425186"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 22:18:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 22:18:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 22:18:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 22:18:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwQP9E4JZxHF21YgtqE87AwifY1Op+IxBaT8/dcQi/qyB1Vg75vPhnt1wicdTAowMNeDGUhyMrJ/p5GWw/AFn4fENYItLpRApC+ODZCXF6rgxIT4JgVw15DfkCRcABh+RD3NMbegZ1ScivnKXOCGDdzIBG0gC8LUAfHtZg6vwN9WeTUCzmN6cDRGxkitgH9SUqdgF6PJvXcFxq5dcjlv7x4VtySuQ1ldDUAIn6KQhh8/dWOph67A8fXDIjZjvw02axufc5BDGoUSUJWzgwTneQ5rOZvlWp0z9nzQAIdxI+9iiDKrgJhFEsePWqmdYJpe0gQ7BIzClADIsiT3NkKr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxA2CRurFAw3RMzmDKSM/KonDGrq9cYtaICC3/QEkZk=;
 b=FToEuUzIj/1ltGdlCZUsysYExjfZt9Ste/21eFhbPtW9PD9qmhjPdtNWVu/pIEMy0p4/8fCc3GCnf52plh6iOzvHxnwFvsC6HgoLVsYerPZFqDw6f5Zp4qq1SeW8abNUx6skjl1x04AaHsKzT1fpYlEMVDSzaOIiAN2Mtxtsxks5V7Y44URPdiqc4JFSsZ68/sIsUITYKuO0cLspY9dheu1pLJOv/ggORDdETjTgfy2gmBduC+4sshj3hOdPCdvd04S2PwNvkf7gAWgivNB6EVc7pBW/nYlu/daJsCkLfVWtOuPWqEe1/VpWwnwUOCUWkkRqoAfh4hYalsTR6JH1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15)
 by BL4PR11MB8800.namprd11.prod.outlook.com (2603:10b6:208:5a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 05:18:34 +0000
Received: from IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147]) by IA1PR11MB7824.namprd11.prod.outlook.com
 ([fe80::71b1:fad1:6598:f147%5]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 05:18:33 +0000
Message-ID: <e51c2ddf-bc6b-4daf-baf7-88b436704195@intel.com>
Date: Wed, 23 Oct 2024 07:18:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 0/1] tests/intel/xe_exec_capture: Add
 xe_exec_capture test
To: Zhanjun Dong <zhanjun.dong@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20241022163324.383145-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@intel.com>
In-Reply-To: <20241022163324.383145-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: DU2PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:10:232::32) To IA1PR11MB7824.namprd11.prod.outlook.com
 (2603:10b6:208:3f9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7824:EE_|BL4PR11MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 2319f39b-f710-4155-912a-08dcf32223e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUU5b2RwK2taK3hzQnRySTNvTTVBS2xwQUdHTGNkU1g2OXAwYUlPaHFIbHgx?=
 =?utf-8?B?ZzVqd29UTnNRR3lMdmF5Z2FSOWRmeTBRSXdZUEJGRGxkU09idk1HenNXamd6?=
 =?utf-8?B?QWcwS0paZTBVc2xNMTdoRm80ODcrcHNFZGFJRlU2cUVrOFlDczlDVm51V2Rp?=
 =?utf-8?B?Ymp5eVpWWnBsNjk4MHZsMEpCOUlnSmFpYTNUZGxxWDJIZ2tnUWtPMDRHT1pJ?=
 =?utf-8?B?SWQxcHdxVmt6cjc5RDR6UHllbzBDbWpVOWY1VG1CSi9NZ1hTTlh4Z3gveUpW?=
 =?utf-8?B?N0U1NWh2RmNiaWVNQWdLYWtoV0ROMFJ5TGplVFQxcDVJak8xcnFqNEM1NEJz?=
 =?utf-8?B?clVNcmRMbmRXckRIenZ0UGY5MjZMdXhmUjJ5SGJmQVhxVzh2aWFLT3VPOGU3?=
 =?utf-8?B?YTh3Y0hVTXA4Q3FGNHlqUjl1ZEpUMDFkSXhVd2N5WmVEZjZJZDdhaGRVS2RF?=
 =?utf-8?B?bnk4V05OWkJHbFVuR2lxenJiVDJWNitDNkg4VVJpbFhjY04wc1Fud3hPZnpR?=
 =?utf-8?B?bFZDdE9uZWo5Tnp0V2FUSlMrOTNMd2FRNzlRRWhGUUdXRUR3emtiejdKd1I2?=
 =?utf-8?B?KzY1OHQ2Vml4aGRhRnU4ZzREcm9SZlIzQ0JQYWpVbDFUSVNPa3h2cXdXTXFG?=
 =?utf-8?B?dXp1dHBKNXpsZHRLem9nZC9yWXlaa3kyUmJpWGxrSzB5QW0zQ1ZKZnlVSkJK?=
 =?utf-8?B?SmJSOGQrWFZUMjBQejQ0TURRVUlMYWN2TlhlUjlFODJMKzA0bDRuMW9XYndM?=
 =?utf-8?B?VThOWEtLeU1EWlgzaWhnRlN0RmR5ZGd5d05FYTFaRHBld3FqVXhuajRFdWpw?=
 =?utf-8?B?ckd0TW55R2ZyckhsMFJmZnlVTTVsd1gyN0lvd1VEWXoxNm9qOFBVTWtBTkZu?=
 =?utf-8?B?YTQ4V3lQVHBhMmdRR0lFUyt2WmU5S3BCeVhWMm0rL2ZnZDFGM3NLR2hZMm9h?=
 =?utf-8?B?a3V0L1Rua05LQjNWdkRSdXBoNlU2dWVMcFFmc0luYUU4OWcxUHc3Tm05YWll?=
 =?utf-8?B?c1paSEs3Z21VQkwrd1dMcjl1SkUvSkpYSFozK0ttcVNVeFNFeWV3b1V0ZExh?=
 =?utf-8?B?dEVMVVRuM1ZNVDlpZEFSMXJQeXd4aVBKR1pGblJYUWRnWFIyT01nQzkzWU81?=
 =?utf-8?B?L0RiOVpsc1dsRFVSWTB5Y1ovMWlaV285ZUVrUXZ1MStMTGx1YUtmZFZWZGtT?=
 =?utf-8?B?WHFJeldENm0yQmMwZ2l0aDYxd2xyazRJOTI4WUpaZkFRQmhoK0hubmQ2NTRT?=
 =?utf-8?B?MktVTStmcU5nL1JpcnFydXFVYjJuVko2VGZ5MURmSlMraEg3UVdWd1FiRVZ6?=
 =?utf-8?B?cUUwT2ZvNWJkNTU2d2pRQTFqVnVjYUY0N0FsYjJlTHJDait6Vm1pSGw3NWE2?=
 =?utf-8?B?K1dGS0REMHVrQnlmLzVQY2pZR0pOenp5VlhNcWZQVndaZjJqWVFob25TYm5R?=
 =?utf-8?B?dGJJMTlnUjdOa0V2eno4TnB4Wlp0U0VBYWlhUkgwWjVRalBOT0swcXo0bFY4?=
 =?utf-8?B?ODgxaE1FNHVzMEwyOU4wRldxL0pPb3dTRnhvanJzWkd4TU5sM0RjT0JLWnZ0?=
 =?utf-8?B?Mm1qVUN6UDVMNU5LbENaTU0vL0pqSVplTHJiY3E3NENEQ2RCWTlhaHZYL3dV?=
 =?utf-8?B?SHhGdGVlektCMUtXbVVIeTFIbFpYZ0RmYjdheWRPZDR1bkxtdkdQc3gzcXl5?=
 =?utf-8?B?cjF6d1NWdWw0K2dneWRGMk1XOTdYWmJaUy9sYUl4WW93cXJxSFpkandRU2ZC?=
 =?utf-8?Q?+8Wv6L9IKpSqTqWqZlY3IhlJmJGtwj3lmgXfOr9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2d6dVFSVGRISFQvZThQcWFWQnI1VlI2NWhySTBQWUpKMUxSdXJCaDl0Ym5H?=
 =?utf-8?B?WnpnZzgrcGNaZmZkUXdCRHM0TGJxNSttbWpkcTEzc3hBcUh5NHFtcDZMOUQ0?=
 =?utf-8?B?eG4zQjZ6RS9xUVlrWjRIelErWWxJbm5aRklkZmtRYkM0Z2JadVBXbmRnRUE2?=
 =?utf-8?B?M2cyUFE5VERJK21WV1Y4cFEwWUh3N1FYRkVydStjZkUvQ3lidlhZZXUxMXJI?=
 =?utf-8?B?NWpZRjljTFhqSSt2eWxJcW9kN0JubzBOK0RabUwvekF2bnBZVUtPNVlZMHVT?=
 =?utf-8?B?cGR3Sm8raFhEVWk5WXR2dU5tMURBYlI0UHNydnBYalhNbVU2MmowMTIvNm5x?=
 =?utf-8?B?RFlVK3IvRTlIVWlwVW1hQnNCcDZrcXE5cFV6Z3Z4Y2NEN28wWExMdGc0VC9R?=
 =?utf-8?B?bm1LUG9IUEw0MWNrc3dRdXE5MVZLVURHVk41ZnpVcmVXck1aV1g3UTQrYjNu?=
 =?utf-8?B?dDg1aTVvVDlNMWNOQXpPM1A0dVZiWXI4NmNGWkgyUDZJNEY5a1FyWGNwdFo5?=
 =?utf-8?B?OWdDSkZub09pSldKRkEzL1ZKYUhiRHJRcWMrNUwzMXdPTktSN3hNZHVYSFlo?=
 =?utf-8?B?MXZIYy9CeU00d09OQ1d1TDArNmdrRmlZT1FLZHdiaWhkV2pxZTNBeHJwSHVt?=
 =?utf-8?B?dTZUYkErOElKT3M4SDVrNllZcmRDd1ZreHZHeUs0dHVkNzVTSC8vSDYxcmpN?=
 =?utf-8?B?YVdTcVVOdER4bk9uN0s5TnMzVnNjeHRQcUpQODdXY2RSaHZ5NSt4bmFhOHFr?=
 =?utf-8?B?aVNndXJWZTdQclNqbkxaeTUwbm1iaVRqajI3TlVkK3c2WmNMN1dPdCs0UGlN?=
 =?utf-8?B?TDB3azRrejNKOVhhTWs4NUFQMW1vNmhacjBLaldIQ2p0bzFaMk5Dc3d0aENG?=
 =?utf-8?B?NDFlN1VWRk5RQWk4ZGFVcWhodS9mdCtBTW9xRXE1L0lFb0tKVkZ5SndUZTVq?=
 =?utf-8?B?VFNQVkJxOWRXN0hiay9SY3pkdzdBd0orMXpoK2tIaTl1S21QZWxYTTlIUnE1?=
 =?utf-8?B?L3Fya1RNTDhHZitlUTBUQXppdm52UXQ5bDd5TUhBTjUzWm9KTWk5Rjd4ajQz?=
 =?utf-8?B?eXRhdmI0WTRyQkxYUDUzT2RTcmdmcUNHNmJzNTZEMm1tVEYvdlFsV01ka0t5?=
 =?utf-8?B?eGIvQWtjejI2ZWdhSUNwTTFRRTZFQmNmcjVMLzV4S1M3ZnZ5ZXdobm8wWklT?=
 =?utf-8?B?ZldrNk85VWRCckhCb2ZndFhibmZGdEZrTnQyMnVvaXlnYjcwMFRINGwwemVO?=
 =?utf-8?B?Z1ovWmZvTlNqRXVnTklsWVoyZDhWbENKcEdqYmpNRklsU1B5bEh3ZU5iNkZx?=
 =?utf-8?B?d205dkprZ3ZkTHV3OGF3TnRTemlPZHJBMUFDdW1PeXdjaUt5akhZK0JLS2N1?=
 =?utf-8?B?dVBFUENEcGxLMDhmdzdSa3VJdVBzU1JERGhpR3M1VURRcDljbGxBTlNvOTln?=
 =?utf-8?B?RkxGQWFCTjVqZE9DQVp1MGtLM1FLVDEwN0xsR05hWWJ3VHIzSHZ1V0kyVjFy?=
 =?utf-8?B?OHRrYzd5SnZPbjB1UVRzTlFncHpCVGV0WmIzaHc5TTYzSlhpT01qenpzeFdq?=
 =?utf-8?B?Z0pXZGpQaEUwVlBxZlVMOXorT2x3NTV2TzRVekFwa2EwUVN5VjBMREtoblIy?=
 =?utf-8?B?cXVlRDZqRkhSQ2ZTTUdZVkJaTHZNeStQKzF4bzNCc0ZDem9NbGNyd0VCSkhn?=
 =?utf-8?B?STVTZ3pvZkg5VXVrNzFzeDZNdUxsbVc4bi9ZNmhXejZmeEtRMTFEdUFTUVpO?=
 =?utf-8?B?SjhpNXQ1cVR0TTdWOGVEL2hqYjVhbDlrenQvbXV3cXowYXFUUkhOWUNMeXBv?=
 =?utf-8?B?eUJRUXR3YnFCRHdZN0NjVUlDNUUrUVZjODBvYjVZaHFBRzVyQUtzeG1vMVpt?=
 =?utf-8?B?bStuV1k3eVVwRGF2TlZIQjZPZjhKTTdVb2d4Q3Y5Z09wQkNlTWVndE5CMm52?=
 =?utf-8?B?RnA0Q1Nvd0MxVVNFbXF3cVJSV3J5dHBLRWdHTFZLVWNjRW96cEZvSk9tWmJT?=
 =?utf-8?B?UXFsNnMzdWVVM0lyR2Iwb0paYTNxU0FMdTJXRjR0dytIWUM1OURCTHN3cndQ?=
 =?utf-8?B?TmxUZDRHQ0tWdC96ZVo4ZUtUQ1o3SDB0dGhEK2h3Zy9ra2U4aXp4dTA1REpI?=
 =?utf-8?B?ZDBOVVFTRGczUnFzSk5uVkpZeU1mVHd4bUplWVlJN0F4eDhMUDZnMGZkUGwy?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2319f39b-f710-4155-912a-08dcf32223e2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 05:18:33.8187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0hG6zrm6ytp9l7HXEvfWPxdJci/CIAwoS98yofdusWdExpnnrEyRjJKT6ynlLCoX+YnUxu+Yx9aX51MVM13RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8800
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

RGVhciBaaGFuanVuIERvbmcsCgpUaGFuayB5b3UhIEkgaGl0IGEgZmFpbHVyZSB3aGlsZSB0ZXN0
aW5nIHlvdSBjb2RlIG9uIGEgTHVuYXIgTGFrZSBtYWNoaW5lOgoKICh4ZV9leGVjX2NhcHR1cmU6
MjIyNykgQ1JJVElDQUw6IEV4cGVjdGVkIHZhbHVlOkd1QywgcmVjZWl2ZWQ6TWFudWFsCgpBbSBJ
IGRvaW5nIGFueXRoaW5nIHdyb25nPyBIZXJlIGlzIHRoZSBmdWxsIG91dHB1dDoKCiQgc3VkbyAu
L2J1aWxkL3Rlc3RzL3hlX2V4ZWNfY2FwdHVyZQpJR1QtVmVyc2lvbjogMS4yOS1nMjEwZjM1YjU0
ICh4ODZfNjQpIChMaW51eDogNi4xMi4wLXJjMi14ZSB4ODZfNjQpClVzaW5nIElHVF9TUkFORE9N
PTE3Mjk2NjAzNDQgZm9yIHJhbmRvbWlzYXRpb24KT3BlbmVkIGRldmljZTogL2Rldi9kcmkvY2Fy
ZDAKU3RhcnRpbmcgc3VidGVzdDogcmVzZXQKKHhlX2V4ZWNfY2FwdHVyZToyMjI3KSBDUklUSUNB
TDogVGVzdCBhc3NlcnRpb24gZmFpbHVyZSBmdW5jdGlvbiBjaGVja19pdGVtX3N0ciwgZmlsZSAu
Li90ZXN0cy9pbnRlbC94ZV9leGVjX2NhcHR1cmUuYzoyNzg6Cih4ZV9leGVjX2NhcHR1cmU6MjIy
NykgQ1JJVElDQUw6IEZhaWxlZCBhc3NlcnRpb246ICFzdHJjbXAob3V0cHV0LCB0YXJnZXQpCih4
ZV9leGVjX2NhcHR1cmU6MjIyNykgQ1JJVElDQUw6IEV4cGVjdGVkIHZhbHVlOkd1QywgcmVjZWl2
ZWQ6TWFudWFsClN0YWNrIHRyYWNlOgogICMwIC4uL2xpYi9pZ3RfY29yZS5jOjIwNTEgX19pZ3Rf
ZmFpbF9hc3NlcnQoKQogICMxIFt0ZXN0X2NhcmQrMHg3ZGNdCiAgIzIgLi4vdGVzdHMvaW50ZWwv
eGVfZXhlY19jYXB0dXJlLmM6MzQxIF9faWd0X3VuaXF1ZV9fX19yZWFsX21haW4zMzQoKQogICMz
IC4uL3Rlc3RzL2ludGVsL3hlX2V4ZWNfY2FwdHVyZS5jOjMzNCBtYWluKCkKICAjNCAuLi9zeXNk
ZXBzL25wdGwvbGliY19zdGFydF9jYWxsX21haW4uaDo1OCBfX2xpYmNfc3RhcnRfY2FsbF9tYWlu
KCkKICAjNSAuLi9jc3UvbGliYy1zdGFydC5jOjEyOCBfX2xpYmNfc3RhcnRfbWFpbkBAR0xJQkNf
Mi4zNCgpCiAgIzYgW19zdGFydCsweDI1XQpTdWJ0ZXN0IHJlc2V0IGZhaWxlZC4KKioqKiBERUJV
RyAqKioqCih4ZV9leGVjX2NhcHR1cmU6MjIyNykgaWd0X2RldmljZV9zY2FuLURFQlVHOiBGb3Vu
ZCAxIEdQVXMgZm9yIHZlbmRvcjogaW50ZWwKKHhlX2V4ZWNfY2FwdHVyZToyMjI3KSBERUJVRzog
VGVzdCByZXF1aXJlbWVudCBwYXNzZWQ6IHhlID4gMAooeGVfZXhlY19jYXB0dXJlOjIyMjcpIERF
QlVHOiBSdW5uaW5nIG9uIGVuZ2luZSBjbGFzczogMCBpbnN0YW5jZTogMAooeGVfZXhlY19jYXB0
dXJlOjIyMjcpIERFQlVHOiBEZXZjb3JlZHVtcCBmb3VuZDogL3N5cy9jbGFzcy9kcm0vY2FyZDAv
ZGV2aWNlL2RldmNvcmVkdW1wL2RhdGEKKHhlX2V4ZWNfY2FwdHVyZToyMjI3KSBERUJVRzogQ29t
cGFyZSBDYXB0dXJlX3NvdXJjZTogTWFudWFsIHZzIEd1QwooeGVfZXhlY19jYXB0dXJlOjIyMjcp
IENSSVRJQ0FMOiBUZXN0IGFzc2VydGlvbiBmYWlsdXJlIGZ1bmN0aW9uIGNoZWNrX2l0ZW1fc3Ry
LCBmaWxlIC4uL3Rlc3RzL2ludGVsL3hlX2V4ZWNfY2FwdHVyZS5jOjI3ODoKKHhlX2V4ZWNfY2Fw
dHVyZToyMjI3KSBDUklUSUNBTDogRmFpbGVkIGFzc2VydGlvbjogIXN0cmNtcChvdXRwdXQsIHRh
cmdldCkKKHhlX2V4ZWNfY2FwdHVyZToyMjI3KSBDUklUSUNBTDogRXhwZWN0ZWQgdmFsdWU6R3VD
LCByZWNlaXZlZDpNYW51YWwKKHhlX2V4ZWNfY2FwdHVyZToyMjI3KSBpZ3RfY29yZS1JTkZPOiBT
dGFjayB0cmFjZToKKHhlX2V4ZWNfY2FwdHVyZToyMjI3KSBpZ3RfY29yZS1JTkZPOiAgICMwIC4u
L2xpYi9pZ3RfY29yZS5jOjIwNTEgX19pZ3RfZmFpbF9hc3NlcnQoKQooeGVfZXhlY19jYXB0dXJl
OjIyMjcpIGlndF9jb3JlLUlORk86ICAgIzEgW3Rlc3RfY2FyZCsweDdkY10KKHhlX2V4ZWNfY2Fw
dHVyZToyMjI3KSBpZ3RfY29yZS1JTkZPOiAgICMyIC4uL3Rlc3RzL2ludGVsL3hlX2V4ZWNfY2Fw
dHVyZS5jOjM0MSBfX2lndF91bmlxdWVfX19fcmVhbF9tYWluMzM0KCkKKHhlX2V4ZWNfY2FwdHVy
ZToyMjI3KSBpZ3RfY29yZS1JTkZPOiAgICMzIC4uL3Rlc3RzL2ludGVsL3hlX2V4ZWNfY2FwdHVy
ZS5jOjMzNCBtYWluKCkKKHhlX2V4ZWNfY2FwdHVyZToyMjI3KSBpZ3RfY29yZS1JTkZPOiAgICM0
IC4uL3N5c2RlcHMvbnB0bC9saWJjX3N0YXJ0X2NhbGxfbWFpbi5oOjU4IF9fbGliY19zdGFydF9j
YWxsX21haW4oKQooeGVfZXhlY19jYXB0dXJlOjIyMjcpIGlndF9jb3JlLUlORk86ICAgIzUgLi4v
Y3N1L2xpYmMtc3RhcnQuYzoxMjggX19saWJjX3N0YXJ0X21haW5AQEdMSUJDXzIuMzQoKQooeGVf
ZXhlY19jYXB0dXJlOjIyMjcpIGlndF9jb3JlLUlORk86ICAgIzYgW19zdGFydCsweDI1XQoqKioq
ICBFTkQgICoqKioKU3VidGVzdCByZXNldDogRkFJTCAoNS45NjNzKQoKVGhhbmtzIQoKCk9uIDIy
LjEwLjIwMjQgMTg6MzMsIFpoYW5qdW4gRG9uZyB3cm90ZToKPiBUZXN0IHdpdGggR3VDIHJlc2V0
LCBjaGVjayBpZiBkZXZjb3JlZHVtcCByZWdpc3RlciBkdW1wIGlzIHdpdGhpbiB0aGUKPiByYW5n
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5j
b20+Cj4gQ2M6IFBldGVyIFNlbm5hIFRzY2h1ZGluIDxwZXRlci5zZW5uYUBpbnRlbC5jb20+Cj4g
Q2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4KPiBD
YzogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+Cj4gCj4g
Q2hhbmdlcyBmcm9tIHByaW9yIHJldnM6Cj4gIHY0Oi0gIFN1cHBvcnQgcnVucyBvbiBtdWx0aXBs
ZSBHUFUKPiAgICAgICAgTG9hZCBhbGwgZGV2Y29yZWR1bXAgY29udGVudCB0byBidWZmZXIKPiAg
ICAgICAgQWxsb2MgbGluZSBidWZmZXIgZHluYW1pYyB2cyBzdGF0aWMgZ2xvYmFsIG1lbW9yeQo+
ICAgICAgICBDaGFuZ2VkIHRvIGlndF9hc3NlcnRfZiB0byBwcm92aWRlIG1vcmUgaW5mbyBpZiBm
YWlsZWQKPiAgdjM6LSAgUmVtb3ZlIGNhbGwgdG8gYmFzaCBhbmQgYXdrCj4gICAgICAgIEFkZCBy
ZWd1bGFyIGV4cHJlc3MgcGFyc2UKPiAgICAgICAgRGV0ZWN0IGRldmNvcmVkdW1wIHRocm91Z2gg
Y2FyZCBpbmRleAo+ICAgICAgICBBZGQgZGV2Y29yZWR1bXAgcmVtb3ZhbCBjaGVjawo+ICB2Mjot
ICBGaXggQ0kuYnVpbGQgZXJyb3IKPiAgICAgICAgQWRkIG11bHRpcGxlIEdQVSBjYXJkIHN1cHBv
cnQKPiAKPiBaaGFuanVuIERvbmcgKDEpOgo+ICAgdGVzdHMvaW50ZWwveGVfZXhlY19jYXB0dXJl
OiBBZGQgeGVfZXhlY19jYXB0dXJlIHRlc3QKPiAKPiAgdGVzdHMvaW50ZWwveGVfZXhlY19jYXB0
dXJlLmMgfCAzNjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICB0ZXN0cy9t
ZXNvbi5idWlsZCAgICAgICAgICAgICB8ICAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzY2IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVsL3hlX2V4ZWNfY2Fw
dHVyZS5jCj4gCgpJbnRlbCBTZW1pY29uZHVjdG9yIEFHDQpSZWdpc3RlcmVkIE5vLiAwMjAuMzAu
OTEzLjc4Ni03DQpSZWdpc3RlcmVkIE9mZmljZTogRHVmb3Vyc3RyYXNzZSAxMDEgLCA4MDA4IFp1
cmljaCwgU3dpdHplcmxhbmQK

