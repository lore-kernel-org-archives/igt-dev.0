Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AFCE8382E
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 19:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373FD10E03C;
	Mon, 16 Feb 2026 19:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkKb8gKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC4C10E03C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 19:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771271961; x=1802807961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bOj4cmQhZvhMkO3v/v3Cr+raGrecL0wkT1FlFdC+nUU=;
 b=XkKb8gKfBekyBlMkectutURaXQrcNTKk3doVrMvfsjkDlpX0+9aR/jF2
 dJgha/U3Rq+Y6Lph/E8DKhBMxOtYcfyNveEjq614x78u/bGC0yqxnKQ+V
 Jd6WMjXZ4+fKfZmtZVCL23oKi+on8bIImBw/b3E46gWO9DxCT+PqufWUw
 R8dGbyTHOOuiiiEZLVYJMQpo152yqoYnbEdAMps6D0fXAGRghfxAXazon
 56q0msa0Y8feXOSKebq5Dzb+J/oVa7pc5rb5Wof+lFPVhcaYDHrhEdhd9
 VnybtOFHcLDudgB56BIiJp9qgo8eWP/WJ6IoyZTYQyzG3PlprLb7gtbPz A==;
X-CSE-ConnectionGUID: Rl+anDf/SSaVjYNGEzvu+w==
X-CSE-MsgGUID: vy3VQvPkTd6YXawvU4+JGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="71550111"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="71550111"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 11:59:21 -0800
X-CSE-ConnectionGUID: XaoZefjXTsqHFm/MAlJGcw==
X-CSE-MsgGUID: QLvQTj9vTRuhkCcwFtHQEA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 11:59:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 11:59:20 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 11:59:20 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 11:59:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebyi2rKOUjcSinRFBR54maEeCnoij1tMGx+Qbipv++p0UUDeGQUGHAfRdjfapnzMWMimDVXRD1pF3hBlgpNCmpAedUMZ316B2tiM1VbHzi48S2HURxNbV9mOg5Z3PHbO+2BpXCheZx8R8YLpAfPiDmDUhnUzRwmeykROom1M9VrHReDJOa3KmtgYx95zFpXQmjk6DujNzdzqW1n0zVGG3WzOx1Q+tsHg93CiTeIpCDtzJULX/YDjyNXPxeN8mnNmCTbjV7UM03aFQzbZIJ703lQMpDoSl4TkTV34WW+XT6gaMBTL6eS28cgBsLPKQTg493tw1Dk7ZMIlSTQH362UfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/hAXF3UlJ0n5YCEt8yu0Hrg090NNwyAb28Oj3SKHiw=;
 b=EuuVvDHnsWIzL/vy3VhG2QE2wK4LD9bB/9OsW30UcmE2oOKGIwgEGTbSrBfoMxrFodV/Iih0LH/Znes+pLSsNBt24Lp0WJjyaL4NkM0SnhwcGZYLe9O42dGUtwOrmeahOrPLXoeRgk3iyctCUid2m1x0QSFSPuhlQWgTYGCMmSA1ulqTrwQmDvEaW1fxFzURQYaKdurxtvQxqNr0eHdHO4ObbxfTkuCUAeZl578bjox/aHO83xWmZWx1mFWK7BqRUb0yw25YxTwhi60L1QprjpWUmyaTy1XrZeQbwHI894a3t6z8oi6lxjs8f2CiyKbg6oM9iUBaM339DxEEWtBvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by LV2PR11MB6072.namprd11.prod.outlook.com (2603:10b6:408:176::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 19:59:16 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 19:59:16 +0000
Message-ID: <294245f1-b410-4374-a90e-bde2303be29e@intel.com>
Date: Tue, 17 Feb 2026 01:29:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_fb: add YUV|YVU-410|411|444 formats
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Renjun Wang <renjunw0@foxmail.com>, Juha-Pekka Heikkila
 <juha-pekka.heikkila@intel.com>, Karthik B S <karthik.b.s@intel.com>
References: <20260216181610.129209-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260216181610.129209-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|LV2PR11MB6072:EE_
X-MS-Office365-Filtering-Correlation-Id: a7334218-171b-4625-8717-08de6d95dcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3VMdC8yVFMrTEZYNlNSUFJxMXJicXdtNGc3OStlaXN6L21DSVNYU292NFQ1?=
 =?utf-8?B?NERBai83YmRwMU96V0ZYL1JjQzQ2eVZpcmR5ajlRNmJaQ0xEdDVWdlpvQnBE?=
 =?utf-8?B?M2VsQzE2OTFZUFlmMnR0cC9PNmR3c090ZU1CZytaQkZjZFpSanNFUFFBUHE1?=
 =?utf-8?B?VnJ4WWVQTEx5bFN5TThsN09XOExNVURtNGZZMU8ycnYvZXRUeW0xZUdaVW1W?=
 =?utf-8?B?L0Fvci8zSzA5L0pvMHB3V1NqZ2VodGdSVTJWdUNydFAvK1M4VFRKSHpEdXRk?=
 =?utf-8?B?dlNiYUxBVXJCcXhyVVhwSkJVQ2IxeCtXdVNkVUNiWHhCdms4ZmNOTFFqeEFh?=
 =?utf-8?B?aitjNTZKeUIyaDF3WWFueFNzaW95NVc0ZFZlbXVzVTY0Z0xxSzF3ZEZDbC9V?=
 =?utf-8?B?YUNZWDdhSDFkQ21ZSVBqSFRzZ3loZCs0WGJlSFpCLzYrQWw2emRDN0g4ODhR?=
 =?utf-8?B?aUlid1pCRXBPaC96OW9IZWI2UHYwTk1pWkQwd1lvQW5DRE42VHkwM1VYZEFF?=
 =?utf-8?B?OXN1bVlRMndseTlxbGRkUkRFMDA3b0tkOEYwM1hpSmJEZFk5Q2VWbVN4clN3?=
 =?utf-8?B?S21BK1RaYjVRb0ZzRU9ONnVpVWVxM2JFM1EzWUpVb2NiWm1BcVJUM0wySGhG?=
 =?utf-8?B?cXE3U2xTMWZPdkx2K1U2SlMrSXVKWFNBUTgwem5WVHg3aysrbCtYaTJmR1R5?=
 =?utf-8?B?QzVtZ3pQMzdNKzlTT0FGRXF4azg1S0dtNUdtWU1VdzN2eHFBUlAwTnh6NERy?=
 =?utf-8?B?NjFEYTVrVG9LYUFtRVgxTFdOUjJ3REE0bnFVeDJFMnFNeURqS2JpWHBvWTk0?=
 =?utf-8?B?b0paSk9jdjFzR1JUY2xucUtKb1B0WWI3Y2t1aGRhQ3lFeFhZVERxclMwSmtB?=
 =?utf-8?B?S3pBMnFMSjl5TUtLN2NBODBLZTFHMEVGU3ZGeWh0dDhRTk93czB1Zjl1RFV4?=
 =?utf-8?B?NEllMEwzS1NSZm9FL1U2dWxId0lldU91MkwrY1k4elVsb2F3SzhUWGpyNEUz?=
 =?utf-8?B?V3lyL0RNcW5zZkFQQXlnN2xVUDRvdFFvT0V5ODF2TEMvQXNKOXVhaVJTbE9T?=
 =?utf-8?B?eWFpL3ZmUzRUU0t6WitJTWt5LzI3MTQ0RDR0bU40YXRyd2QrbkphV1ZWS2tK?=
 =?utf-8?B?bGhEcXRaRzgzQjZyTnBOaXkwRElneERyYTVBQytBODQxTjVZVWoxVlloc2dE?=
 =?utf-8?B?eXhHNGYwUnlLUmY0NmUwQ0Zyd1ZmVVJCamNlQ1FJa0JUVXRIUUl6VGJLZTBi?=
 =?utf-8?B?QWlhdEZYY3d3YkFyV09ydUJ6em91ZjV0ZUhCYk9mVTIvaUlMUituaUthVkRh?=
 =?utf-8?B?V3oxWW96TFVEdWtrUkNRY3VNQ3FCZFZGMHV6WFQ2MW4vYy9ONFEwelFDS090?=
 =?utf-8?B?M2daUHJqb00yb2tVTTNmM20zT21FQWF3ck1GaERaaXZmYTFCLzNLalFrTU8z?=
 =?utf-8?B?cGxoVlJIWjIvN1NBRVFKWVQ0blJTd2FPVGFremlpOHhQaDAxSHliNzV2WHRT?=
 =?utf-8?B?TDN5U3ovZnIrRWpqNGdSdlU2bmRncFdOcTZZYlZ6QWFSZW51SDFBRlErMGsz?=
 =?utf-8?B?RUdjMHJrT2Z0ek1Sdm5DUGRON0FkbkhpdVFPWGprWjBQbHExMmVrY0kvZHhm?=
 =?utf-8?B?WTJrYjVEQkZOSmtkN1R5UXJCWWRwZHJCUXJZNVdtN0dXcC9hTXg0ckFBMVFN?=
 =?utf-8?B?WG0yZXNKOXhObmxLZFk0bW04VU5TbEcwR3c0bGpUM3dlazV0NzZiZDRUR0F1?=
 =?utf-8?B?dTNEd2wrNnRjVU5TZldodHp4Q3BJTFloZFJqdDcxaWdabmk0d2J6VG5ER04x?=
 =?utf-8?B?Tm1QaENXTVhYQUhzY1p2azcwMGFvcDA4Y1VyZ01MVFZRUjJ6eUtLeHM1RkM1?=
 =?utf-8?B?RUxGRXU4ejcvNG5SVS92M0FYNGpzQ3QxNkpSWGdnRy9ORE5nNlc1RWN0SVdP?=
 =?utf-8?B?UXVqWVR6T3F2a2RQcXBRNVlKMm05MldGYWU5WC9neDhiVTQvUy9uU0xZWDVM?=
 =?utf-8?B?TVdoWnlTNzd6RUlxZll3aGRSMFcwNVo5aEhBM3dvNlEvVmpCS3MrYnNZMmY3?=
 =?utf-8?B?c0xMaFArYUxQQlY3bm9YMlBvVUNXR2gwNWNWaTR6UzZTQ0NJU1FLRUFFWUlI?=
 =?utf-8?Q?aCVA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjhxeWxMZzJ3cUY4RktjY295Ymx3MkdzRFQzR0E0dDFqb0U0bXZ5MDZobGcw?=
 =?utf-8?B?MlpkeTQrTWtqTkNTazNGbWFPRXhUUTMvcThhaG5RdFlVNEl3Q0lXcXVKeFVP?=
 =?utf-8?B?NGdQV3V4c1BxdGVvQ1NrN3Z1TksrWVoxdFA3UHppZWZza3dlamZIb2RZWldW?=
 =?utf-8?B?d2FyZjY2TjNLSkNDeDQvZnVacTBOMHg4akRaaWw3RkFHeGxFNW1McG9scVNo?=
 =?utf-8?B?Y2p6eUYxazdBSFNQWWFUTk1mMUwwb3c4QXNpNEJwdWlqRkwyZ0dOc2puV3Nz?=
 =?utf-8?B?NG5LRHVaeTJPejNJM0diaWdWRGZIUFVaR0NnM1pHbitnMWxWSU5vVXIyUGpT?=
 =?utf-8?B?UldrUGJTT09vdmpzdWNldDdzRUt1WTA0bkY3azA0OGVtMTBWaGRBT0pUUkhl?=
 =?utf-8?B?UHFMWDQ4YUhpUDI3d3JQNnc0WHdjbUZ2U3lvTjFKVmVYN0xxN2EzclRScGVm?=
 =?utf-8?B?clAzSVFzaW51VlZGTDdIRWFkLzg3OFY2UWc0blcxTS84R0NVc1QxdnpscHo5?=
 =?utf-8?B?bjFVdkJqWWxCOGVMeFNxdHB3eVZhVklxMmRBR0kyWFBVV3MyYVUzV0w1Y0Vh?=
 =?utf-8?B?SnFBdnlNU2pSL3ZKeWZtWXZrVW1GakY5b09nVks0M015a3ZDcG5pVDZmaEg4?=
 =?utf-8?B?U0V2bC9mN1h6NFlsNlFaQ09IK0tjQjZxR3NZWHk1bklBUkJwK0dFUnI1cmJw?=
 =?utf-8?B?bWRWczZpU0d1YkpEbm9FQXQwbmdBUHhVdXczdjFDRllsMDFqeS9xemM0WkYy?=
 =?utf-8?B?NnlNZHo5VkJFY3VwS0l3eDZET2VFVW9UdHNmTnEyTGZHUFU3NjVkVkNWSXFM?=
 =?utf-8?B?aFBKNHloTGVPL0hqbnZZWGVpWG9lMGY5Z1NGMHpVZS9LdG02Rm1hNldBTU1i?=
 =?utf-8?B?ajBnZ056cWR1bkNmTkNDcHhzeGNRS1k0YjEyb0kzSS9nTzc2RmtJMUY4WDdv?=
 =?utf-8?B?L01ab3ZkQnROR2JMcU5KQ1JHVGtMNGpqTi9YOWplT29QcmZZaGsyQUxEVDJ1?=
 =?utf-8?B?K1oyQVR4WUNoeHRlbk8xUDJhTytVTi9GQ2IzTEZ2c2VjNk5zOTIrMjNybjUw?=
 =?utf-8?B?Q0F3NGtpczliNWc3cHZYUW40d21ERStDWmd1ODQzdjNzbEVicnRQM1NGYms4?=
 =?utf-8?B?eEgxODJTb3hZUHY1L3VnOTlJa3dEVEFCT3l2Y3pmK3c2aW5aeGV6dkh4Z2VQ?=
 =?utf-8?B?eGl2ZFk4bHp2WFhlUWkvazBBUnlmU3VhQkZrdTJ1ZllUbnQrd1A5ajZGSHAy?=
 =?utf-8?B?c0wvdExKUG9Lc3FuSTVYRVRjQWpHeDU0aUMxWm9weC9PNVE2ZHQzSm84cHRU?=
 =?utf-8?B?enZDdnIrUXduWDNqQTNYamErMk9NNkZJMVJzRWNDM0p4NWVjUHRpaGIwUjAv?=
 =?utf-8?B?bXdRVzJuT0lWeHgwNko1NXRwd0p6WU02ZmgvM3BYWlJLUGI5WFVKdVNtQldk?=
 =?utf-8?B?U0hYY0hUQndJc1Z4czRpWVhnbE5hUEhLT0x6ZlZGQytGNGk3L2Y0L3ZTSHZZ?=
 =?utf-8?B?aVN1UmpXd0pIRlk4SzRVZ0dqaG1zaG5xRlRWRm9Wa1RHV3lXa0lWejhENzNX?=
 =?utf-8?B?OXZpTjFGSFNFZUdqd0o5ekVLMlUxR29wMDc3Ti9VVTg2MXVWTVBEczE0YXFM?=
 =?utf-8?B?Z0EvcldRV1pVVTJLRGVHQXcralU0U256M1FBUHRoSWZsUzFjMzAwVFA4Tkpk?=
 =?utf-8?B?Q3BNRnNFUGtOdi84YTYxZjVGdUV0ZnBLNHdlUDFjdHVMRXphczVoUzlNaURO?=
 =?utf-8?B?TWNhWXdUL09aTDVmdk5WbXJGZGNReEh1a1JNNDhXSGdRMFMxQ3JaQlhkUW9o?=
 =?utf-8?B?cFZJV1RVbzZDR09zdlNEa3I5K1VMTjA5ZVF6TU1INy8zM1g2STNSajg3bTc1?=
 =?utf-8?B?OGFXcnpPR1lqdWNPd1B5bDBqNGhCNVIzTUhHN2dnNGpBSWNQZVc3V3ZwRGN5?=
 =?utf-8?B?TTF0R25uWjg4ejcxTjQ2VzR3aTZDZUJiOEF5NzJaa3NGRGhZZndYWU9sQmY5?=
 =?utf-8?B?S1RrTzRVbnVSUEx1NVdNYTBWQks5UEFDUnNxc3pTSWEwNlhSTkdOdU9WRXd3?=
 =?utf-8?B?MlJmYjBZK0JwWUtVOUFtTzZncXk0R1pMdVdYbklWRFN6R01jVzkvOERFWnJo?=
 =?utf-8?B?dklSUXcrb09lS1RTT01UVDd6MlRydVBteHJvWUkzcDhGQ0VxcFdWTmZ4bE5t?=
 =?utf-8?B?REl5YVpvdFJHdk0vS3dJRXI0bXVkVDNVYVl6Q2p4WmlSM2pCWUdMenBJVXVX?=
 =?utf-8?B?RFZpckg1alBEUHBMeHBHZlhDR3hwSGVoaWhockY0ZUJvOWViVXlsRmcyRjJ4?=
 =?utf-8?B?Nkd0OWh0UVNjazFYT3RJdWl6bnVNQTlxRXVNYTRLdi9lS1hjYzdLQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7334218-171b-4625-8717-08de6d95dcb2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 19:59:16.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtnoxwc7SUL3To+/M87HDGQmn/7QA07CKxE/eW9eao2VKA6GbhS4X1JED3MTszeK3OyIXu/B/9QRAJXQFq08BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6072
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

Hi Kamil/Renjun

Overall patch LGTM. Can you add these formats to igt_reduce_format()?

These formats are not supported by i915/xe driver; so can't be validated 
on intel h/w.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 16-02-2026 11:46 pm, Kamil Konieczny wrote:
> From: Renjun Wang <renjunw0@foxmail.com>
>
> Add support for additional YUV and YVU format variants in
> framebuffer and color encoding handling. Extend format
> descriptors, color encoding configuration, YUV|YVU buffer
> clearing, parameter calculation, and format conversions to
> support 4:1:0, 4:1:1, and 4:4:4 chroma subsampling formats.
>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> Reformatted subject, added Cc [Kamil]
>
>   lib/igt_color_encoding.c |  6 ++++
>   lib/igt_fb.c             | 72 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+)
>
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index a7bd2b22f..da56b2b10 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -140,10 +140,16 @@ static const struct color_encoding_format {
>   	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_NV21, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_NV61, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUV410, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUV411, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_YUV420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_YUV422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YUV444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVU410, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVU411, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_YVU420, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_YVU422, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> +	{ DRM_FORMAT_YVU444, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_YUYV, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_YVYU, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>   	{ DRM_FORMAT_UYVY, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index d59fe133b..fa9220953 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -282,6 +282,16 @@ static const struct format_desc_struct {
>   	  .num_planes = 1, .plane_bpp = { 16, },
>   	  .hsub = 2, .vsub = 1,
>   	},
> +	{ .name = "YU10", .depth = -1, .drm_id = DRM_FORMAT_YUV410,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 4, .vsub = 4,
> +	},
> +	{ .name = "YU11", .depth = -1, .drm_id = DRM_FORMAT_YUV411,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 4, .vsub = 1,
> +	},
>   	{ .name = "YU12", .depth = -1, .drm_id = DRM_FORMAT_YUV420,
>   	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
>   	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> @@ -292,6 +302,21 @@ static const struct format_desc_struct {
>   	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
>   	  .hsub = 2, .vsub = 1,
>   	},
> +	{ .name = "YU24", .depth = -1, .drm_id = DRM_FORMAT_YUV444,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 1, .vsub = 1,
> +	},
> +	{ .name = "YV10", .depth = -1, .drm_id = DRM_FORMAT_YVU410,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 4, .vsub = 4,
> +	},
> +	{ .name = "YV11", .depth = -1, .drm_id = DRM_FORMAT_YVU411,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 4, .vsub = 1,
> +	},
>   	{ .name = "YV12", .depth = -1, .drm_id = DRM_FORMAT_YVU420,
>   	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
>   	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> @@ -302,6 +327,11 @@ static const struct format_desc_struct {
>   	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
>   	  .hsub = 2, .vsub = 1,
>   	},
> +	{ .name = "YV24", .depth = -1, .drm_id = DRM_FORMAT_YVU444,
> +	  .cairo_id = CAIRO_FORMAT_RGB24, .convert = true,
> +	  .num_planes = 3, .plane_bpp = { 8, 8, 8, },
> +	  .hsub = 1, .vsub = 1,
> +	},
>   	{ .name = "Y410", .depth = -1, .drm_id = DRM_FORMAT_Y410,
>   	  .cairo_id = CAIRO_FORMAT_RGBA128F, .convert = true,
>   	  .num_planes = 1, .plane_bpp = { 32, },
> @@ -1164,10 +1194,16 @@ static void clear_yuv_buffer(struct igt_fb *fb)
>   			 full_range ? 0x800000008000ULL : 0x800010008000ULL,
>   			 plane_size[0] / sizeof(uint64_t));
>   		break;
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>   	case DRM_FORMAT_YUV420:
>   	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>   	case DRM_FORMAT_YVU420:
>   	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>   		igt_assert(ARRAY_SIZE(plane_size) == 3);
>   		memset(ptr + fb->offsets[0],
>   		       full_range ? 0x00 : 0x10,
> @@ -3675,10 +3711,16 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   		params->uv_inc = 2;
>   		break;
>   
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>   	case DRM_FORMAT_YUV420:
>   	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>   	case DRM_FORMAT_YVU420:
>   	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>   		params->ay_inc = 1;
>   		params->uv_inc = 1;
>   		break;
> @@ -3709,10 +3751,16 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   	case DRM_FORMAT_NV16:
>   	case DRM_FORMAT_NV21:
>   	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>   	case DRM_FORMAT_YUV420:
>   	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>   	case DRM_FORMAT_YVU420:
>   	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>   	case DRM_FORMAT_P010:
>   	case DRM_FORMAT_P012:
>   	case DRM_FORMAT_P016:
> @@ -3752,15 +3800,21 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
>   		params->v_offset = fb->offsets[1];
>   		break;
>   
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>   	case DRM_FORMAT_YUV420:
>   	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>   		params->y_offset = fb->offsets[0];
>   		params->u_offset = fb->offsets[1];
>   		params->v_offset = fb->offsets[2];
>   		break;
>   
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>   	case DRM_FORMAT_YVU420:
>   	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>   		params->y_offset = fb->offsets[0];
>   		params->u_offset = fb->offsets[2];
>   		params->v_offset = fb->offsets[1];
> @@ -4497,11 +4551,17 @@ static void fb_convert(struct fb_convert *cvt)
>   		case DRM_FORMAT_NV61:
>   		case DRM_FORMAT_UYVY:
>   		case DRM_FORMAT_VYUY:
> +		case DRM_FORMAT_YUV410:
> +		case DRM_FORMAT_YUV411:
>   		case DRM_FORMAT_YUV420:
>   		case DRM_FORMAT_YUV422:
> +		case DRM_FORMAT_YUV444:
>   		case DRM_FORMAT_YUYV:
> +		case DRM_FORMAT_YVU410:
> +		case DRM_FORMAT_YVU411:
>   		case DRM_FORMAT_YVU420:
>   		case DRM_FORMAT_YVU422:
> +		case DRM_FORMAT_YVU444:
>   		case DRM_FORMAT_YVYU:
>   			convert_yuv_to_rgb24(cvt);
>   			return;
> @@ -4515,11 +4575,17 @@ static void fb_convert(struct fb_convert *cvt)
>   		case DRM_FORMAT_NV61:
>   		case DRM_FORMAT_UYVY:
>   		case DRM_FORMAT_VYUY:
> +		case DRM_FORMAT_YUV410:
> +		case DRM_FORMAT_YUV411:
>   		case DRM_FORMAT_YUV420:
>   		case DRM_FORMAT_YUV422:
> +		case DRM_FORMAT_YUV444:
>   		case DRM_FORMAT_YUYV:
> +		case DRM_FORMAT_YVU410:
> +		case DRM_FORMAT_YVU411:
>   		case DRM_FORMAT_YVU420:
>   		case DRM_FORMAT_YVU422:
> +		case DRM_FORMAT_YVU444:
>   		case DRM_FORMAT_YVYU:
>   			convert_rgb24_to_yuv(cvt);
>   			return;
> @@ -5095,9 +5161,15 @@ bool igt_format_is_yuv(uint32_t drm_format)
>   	case DRM_FORMAT_NV21:
>   	case DRM_FORMAT_NV61:
>   	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YUV410:
> +	case DRM_FORMAT_YUV411:
>   	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV444:
>   	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_YVU410:
> +	case DRM_FORMAT_YVU411:
>   	case DRM_FORMAT_YVU422:
> +	case DRM_FORMAT_YVU444:
>   	case DRM_FORMAT_P010:
>   	case DRM_FORMAT_P012:
>   	case DRM_FORMAT_P016:
