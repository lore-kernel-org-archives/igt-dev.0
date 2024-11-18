Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3CBD591A5
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 16:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B2A10E527;
	Mon, 18 Nov 2024 16:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eebPN1KO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C766E10E527
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 16:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731948748; x=1763484748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BJq0vsM4IzIsHHsJ4Y0PC0/dq4IvmaxA1TP9yj8w6KE=;
 b=eebPN1KOt4dmekfLbH9oTJQ1H/vV0jQbi1rUFWty5wHffk32L3P2gb52
 nj5op8vwy2JHedrT0h/jrm2+0yQysfp3lKLZbkYtPl1wFz9je8v3tlkcq
 2t4UzIvuhSqUZ7OgoZsks6FYtubef5eUZ8SMImB9TI7Hl2ZxCkBQ6almH
 MYVdBGC4GWrdTwlUG19fA7z6SWJL2HZrkPSOMj1e9mHKKoAEZc8+m+3ty
 84Wpg9lp235+lI8w0RBWApKc3MV6+2wigYWDUurbE2McA6en6MR6wLiZm
 NrTfzzVoeNPeS9yfjtmZVTxCTdeE+d3zWpjdde86hCnUNBgZB4VA6XvXv w==;
X-CSE-ConnectionGUID: xIrlX2ZdTcSiRHf0q5mapA==
X-CSE-MsgGUID: XJ4S6UljSF2s+V4JDBIG2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32014363"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32014363"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 08:52:25 -0800
X-CSE-ConnectionGUID: ++vxNe7XS32HlPitP3Vjrg==
X-CSE-MsgGUID: EUoBMQ72QTatTbcDoweX/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89674052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 08:52:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 08:52:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 08:52:24 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 08:52:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQ90QK4CK3EBdKhuhrW4NpBey4m0jFlAyPk1bGRhxvUtiJh9PbzXO4jQB22QoszMw9JMMwJJDdIc1HKbZDTG9Pq5Rfqvzifh79cpqOXpjR1C97qwlhyBX4rAYOYAcpKJnZc46sy9/m2ZD0bmOhgV6TPeI8yhVyNljTrrPo6/FtheNAmyyD4s5pHIFsGcQrL8Up03f1l8k2Fnjpos8xnPflczoiKRe8vFmaam5/HCeMBK3DDv0nPSDe+BPR/GwSMj/xxHGi8f4ydEPNFmTupmWi2MQPiKsenuiL0YeCf8k94gNpZdpn4aWGw2/f2K0LtaWUdFwRshE4brx7jdSjUomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZI6qXhNKIz1FPQ9HfZVLEKxmzNBse039586WBFfCpEI=;
 b=M4I1q4N5pbQNDup/WhLhqYYmKIKGSEXvFOIfvSAjsaBidHn2Jm3Pf1/QKnEQfb02sRZ5X2LXqzLEuYrFDycaZnaaW/V13vWyqe5PeHXQsJmX5wkim7aueutIBkvOGSlXiDMTvGY+YnfDkC4ruveYWgS0t8Ai2mH+ZW25vQMK2Lp44EC6H0UoXhL82suQVjdbC/0RCkSET16Hyiy2eueUE5ZdiKCD0KGPLl+UIA32Pzw22Bcbf427VBvgTGvd7iEJOR9Jo88DiQp8rQ9O3GGlIvMSzYjMHG5KPkZK6sCtnfXsVg/vEXMx/bx881lwVJEXdRdvGuX8SNlIdwkOV/h4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Mon, 18 Nov
 2024 16:52:22 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 16:52:22 +0000
Message-ID: <f946b1fe-e572-4aad-885c-7b7ce0cdcec7@intel.com>
Date: Mon, 18 Nov 2024 17:52:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] eudebug: Add eudebug pagefault event
 declarations
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-4-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241115141132.866838-4-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0063.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::14) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SA2PR11MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9723b6-1ddd-4e8b-7964-08dd07f15ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3pLWW53bTljRW1qWllBTlFid1I4Z2w1QkYvdFpMb1p6dUtua1FmVXBRNTJY?=
 =?utf-8?B?bGJvd2htcnpxTXhUUEtUSjZQeXQ3SzBxSVdxL01XVXpVNTBwMnB0Nzd5azJa?=
 =?utf-8?B?QkY5M3N6L0xpMkY1UFBjT3pNVVR4R0dMTzhGSEl5eVpNN0VoTWc1ekNGRTFQ?=
 =?utf-8?B?dUhCU3J4OXBQOGtjTUIvS3UvYmtxZDlFc0pRREw0TDVRYkI0eUxXMDdMbHBH?=
 =?utf-8?B?djdjRGRIeStESW93OVZxQkxIUnhlaitHZ3crSjBNWTlWV1ZsbXU4U2paWXRx?=
 =?utf-8?B?OTBXdCtneFZ2TVl5ZWZBMXFHSGlXQmlxVTlHNzJYTVczKy9lVk4wdnNBbENM?=
 =?utf-8?B?MS95WXNyRzhRQjRqUDlOcGxDdkt1SFFCQjNPWnI2ZVFUa1d3SmYwQmdKNEJu?=
 =?utf-8?B?YW5OQUxCSW1SM1g0bHVFOTlPeXRwaVR3Sk9YRXMxSCtTRGNzY2JxTDhBSUJE?=
 =?utf-8?B?dVl2Tzd4VXFHSmZ5ZDFNYUszdnhaZWtKbCtTTTdnY0ZqdEhVOUxxNFBBV21Y?=
 =?utf-8?B?WS8wRnA4RDFxNkFWK2h4dks1S1lwVlBYSmgxdlBqcUV2NzB1K3NDdUdHcnFy?=
 =?utf-8?B?eFpMNzlRSUdBZjdFWW9jOHAwa0VnMmxPVVNmclpZdWx2RUxxbDBSbDVPVkYw?=
 =?utf-8?B?c1dNOTJuaE9jMzBMU0grQitDdU96cEFFdSsrUndMTGUyK3VRdDJ4V3pDdG5s?=
 =?utf-8?B?a05rOWlMMS8rU2p6R2hhbUhPelpFa050ZG1zRy9LczZ1T1pRZ3d5bkxQRldk?=
 =?utf-8?B?K2h3L1lWcVF4a3VEWkNVRVhLdFdKVDV0WFd0RHdUVHBwVCt1NDZVOTBNQ2xN?=
 =?utf-8?B?VG1pSThOM1ZIL09NSVZYRjR4all4MEoyNUovSVZBa1NsckhSenkyRkhBZWRm?=
 =?utf-8?B?ZmRrUXhBQlBvMkpHdXgrYkVtQzdSSmVhOHRXTUQwQlgyKzZaSTdkY2ZLMWtH?=
 =?utf-8?B?NEJzUXZwdnBoSS9aTXlOQWVObVNNUFJaMVVrK29zZXVJdVlVT2tCUkwrY1Jh?=
 =?utf-8?B?ZGZ3TWF6cC9nWGp4MGNQOEM3SEczc3ZCTTZMS3l3U0VTQmNVajZPcDYySkY2?=
 =?utf-8?B?YjgrVE9namNaS3dkeEtDdXY4Y1VGbk4wTGVidnNyZ1ltQ3BrM1NjVXBncHQr?=
 =?utf-8?B?K3hOTkhEOC9MdXd3NUdSUE4vWHN3TklrQmQ5Z3pjOXZlRmFtMi9DbTFjeXU5?=
 =?utf-8?B?azVSUTVTWFNSTC9nK3laN2NHOFd6ZnBtWnBoMjUyUFJvK2g0Q3B6YTR0dnZx?=
 =?utf-8?B?cnVpZXZhbGJpdG9rRVgzS1lnRWZWZURVNStWdEN2SHFaUzN2clhPT0Y2ckM2?=
 =?utf-8?B?d1ByZUVZQTNtSDRTeitkSWpURW5jYlJxb3puZXNQaE1YWUt6UlNlMmdZL0JH?=
 =?utf-8?B?MzJxek5Sd1JPSWZRYjRzOWNidEdyYnh0MmpNVWlCUDR0aFdLdk81bERTVStO?=
 =?utf-8?B?dmpiUDZWZTVWc2dxM09TQ0F4b3FwMWNETVUrNjlQSXM4eTR3RThSdkVhMlcv?=
 =?utf-8?B?ell2U29BS2gwMUZOTUZEclAxeDlGYndLMGhvSGVsM2NXZkZrN3pjRnc2VFpy?=
 =?utf-8?B?cTZOd1RCemd2Rng5NmhsWks2dmFjWDdsaERPbWk4K0M4Z25kMWxsN3J6MVpj?=
 =?utf-8?B?NXVBRkQzbDA0eDZxMVV4RE1EVW83Z3pBZUEzTncvMEJkcXJEemVka1ltWHEr?=
 =?utf-8?B?ZHZOWWt6bDJKMUU5TjhSWktRSVdKdEYvRTFkSHJZMzRxbGduVDRrU2ZKbUw0?=
 =?utf-8?Q?glp7zDESpuur9dm3YHpf9aS4KDysmwbB9APY8Kq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VDT0s2SUZRS1Flei82azVNVWVVZXl3MVIxMGkxc3BNYU1KNENva3ZBcXNQ?=
 =?utf-8?B?NlFwL3VCTExHeVFVZFA3TTFMSU1KSldZLzRYNWtWTzVCTG5Lb2ttdGRPRmpQ?=
 =?utf-8?B?c1hVdHp0emtKOFlwdHhzU0xtd1pDbmROZHEwMmszY0V0MUxLU3F4VGY3cFRt?=
 =?utf-8?B?ZEJMWXAxeVVSOU1yUGYySzlreGd0UEJtOTFsZW81ZWN4TG5UN0NWYXdMd2lo?=
 =?utf-8?B?cnRtOE81NzdYTDEyUEYyNnJya2FSZi9DaE9hWkxkUThieGY1dWdyQ05qSGdB?=
 =?utf-8?B?WjBDYXVVN3RhajdxUnYxUkZYNGRDNVRvSFJaejFnQmU4U0wxdEZlVDI4MVNs?=
 =?utf-8?B?YjRHd0V2YytkVERhOHVJSlZCY25wdXdWRFc3cFI4TnpuZHgvVlpZZEZZczll?=
 =?utf-8?B?dGwrNHdmNk9jS3o0OSs0MWlqd3pybDVac0h2eWcyVjN5OGI1SnRUZkVGaTZX?=
 =?utf-8?B?SjJ2TVdvSmVFSzZVcWtJNnJHUDRDb0d6YThldVNURjR1REFNcWhDRFVRMGlU?=
 =?utf-8?B?RncrRVVHZkd6dEc4Z1Uzck43QUFGL3AvbUxuMWwrQW1PUkloN3RIeVdGaUZ2?=
 =?utf-8?B?YWkyTHVERlllb3h5RjI1djlSRmw4T1ZuSjF2R0xRWWlWYW1ocEdLMlFKaUdR?=
 =?utf-8?B?NWpXOWNSNnpMKzJqUGJtdmdEOHZoN3NQWFI1SmZORXVVTUZYbFovWGtRdnNu?=
 =?utf-8?B?NjA5NGpERnFwQ2R1bTNKYzI1dkFvWlNnTFYzQlhvZjFKNDV6bkw0NmRXWmNE?=
 =?utf-8?B?K3IxTStnY2NnTHFjSUFJTHVSZVdqalNYWElOcXZiczFCSXVXYStwcnRPTk1o?=
 =?utf-8?B?bkxuWjFFUTJmL1luUlFsNUpVdzdmTTRjZk9jNmlEM0FJOXlTVXg2aGxzSTUy?=
 =?utf-8?B?aFNpai9MUldFRmgrKzlSTVNoMnZIb01YRmh4OFJRK09BUksvRWFVeXBtNGNP?=
 =?utf-8?B?RmE4OUxDeTh2ZHZlandNS21XVzBkZ2Nicjg3RUtUd3Rvc0RkaWdBS1hGbnZa?=
 =?utf-8?B?VTcyODhHVXVQbnJpejN2d1ZkRlprWVBUWnVMSlladDZKNXQwcmZ6ck51K1gz?=
 =?utf-8?B?MGRyd242WENrY29PRE83NmswK0FHN3hPdEliWFV5NWxIanVxMTUxRlBleGZn?=
 =?utf-8?B?blFNNU0xN1I3ckdESHp4eC90VE1aeGdXd3gxQTBHcjltTldIclAxdS8xeklx?=
 =?utf-8?B?YlZ5WEZKcUZUaVg2aVF3UEFUdXRGUWIyOHg3NS9jcWRmNjk2dEZZSE9pS1JW?=
 =?utf-8?B?TlhWVjEyQW9WS1FKOGhqVHZmNVFscXN2WkVvUDh6a3FFd1pXUTAzVEw0Y1pS?=
 =?utf-8?B?bFF2ZTViaktVS25OVkdDc0t0OE5tZnAvTGxoOEUvVXZoNkI4ZnhXb0w0Z3FB?=
 =?utf-8?B?eUMxZW1jTWdwRkh3bUo0eGlmQVhMcXBHOUkxazc5T002TmdqVGtaR3Ryb0dz?=
 =?utf-8?B?Z2F5UjJBNGFOQWEzc0djdFdVOFc1ZzV6SmpSSXNGQUI4ZytkRE4wWTZCZkJF?=
 =?utf-8?B?TE80UFl6VnpydWFYdHdXdnR2dDlJKzNiSCsxVklkcGs5U3puYjJsQmVVRDRq?=
 =?utf-8?B?Ry9XNFA3UUlwWEFjcVRyZ3RQWnNwQS9uMTUzamJ6b3A5RE1VQ1ByVXJXdldU?=
 =?utf-8?B?WEVuUzljUG1RRTZiVkZnTTRsTnlqSGZYTlNmNWQ1bVFEOERnbEpja0k2S3VI?=
 =?utf-8?B?VUIvbFJlNVRwNGdVeFNaQy9lTXlMUDI3VWt6cHlLeFB6OHNyZVFjcEtUNERv?=
 =?utf-8?B?bmZlRnE4dHUyb20zNHZiMy9YS24vWTBQaUdhZ0RPUDkzc0huWHZpaGh0N1Y2?=
 =?utf-8?B?REovZEZpaDBRZW92UE1oY0IwTzFKZU9zcHhINERhK1FIVWo1eExzTmkvWmdl?=
 =?utf-8?B?UjZKTkkxNWRJWFlRSEdoVmdHWkNRY2xtMW5JNHIxZEt1SmYrUGZXbUJJL2o3?=
 =?utf-8?B?VmFsaG82YVkyaTJ2clpaMkl2UXN5MkNnbUFKWFZicEtXS2doVkVJVGlTeW9B?=
 =?utf-8?B?bStpeUtnMkZCV0l6MTVPRmZkaDJvUFJPWENBYk8zcjBzbVFVK2hXUUpzU3Q0?=
 =?utf-8?B?U1dRMW1ZNEpyZ1owczFFbVR4RHRLOFBpc2pHdGZnOFRFcTgvVjRVSGlRTW1Q?=
 =?utf-8?B?VTNuWVBsQncyaHpaOU1wbnp3c2VCdVArRnducXpoZWFocFlCeDNlZm9KL3p2?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9723b6-1ddd-4e8b-7964-08dd07f15ee9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 16:52:22.0541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqiG0moKdHYJRPZVXvv+HbH9rJ+CiN0RqK1BQGV0FWWVWCCDKmC5QN2yU6DQ5fthEBIEyH4ZAOwP9O6yy62u2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
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

W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> Update the xe_eudebug drm to include pagefault events.
> 
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   include/drm-uapi-experimental/xe_drm_eudebug.h | 13 +++++++++++++

I am lost between prelim/eudebug/experimental header placements. So just 
out of curiosity what is the role of drm-uapi-experimental comparing to 
prelim or just drm-uapi?


>   lib/xe/xe_eudebug.c                            | 11 +++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
> index f50051e9a..ed2e728c2 100644
> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> @@ -154,6 +154,7 @@ struct drm_xe_eudebug_event {
>   #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	9
>   #define DRM_XE_EUDEBUG_EVENT_METADATA		10
>   #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 11
> +#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		12
>   
>   	__u16 flags;
>   #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
> @@ -352,6 +353,18 @@ struct drm_xe_eudebug_event_vm_bind_op_metadata {
>   	__u64 metadata_cookie;
>   };
>   
> +struct drm_xe_eudebug_event_pagefault {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 exec_queue_handle;
> +	__u64 lrc_handle;
> +	__u32 flags;
> +	__u32 bitmask_size;
> +	__u64 pagefault_address;
> +	__u8 bitmask[];
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index c5814421b..de01e6b49 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -91,6 +91,8 @@ static const char *type_to_str(unsigned int type)
>   		return "metadata";
>   	case DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA:
>   		return "vm_bind_op_metadata";
> +	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT:
> +		return "pagefault";
>   	}
>   
>   	return "UNKNOWN";
> @@ -222,6 +224,15 @@ static const char *event_members_to_str(struct drm_xe_eudebug_event *e, char *bu
>   			op->vm_bind_op_ref_seqno, op->metadata_handle, op->metadata_cookie);
>   		break;
>   	}
> +	case DRM_XE_EUDEBUG_EVENT_PAGEFAULT: {
> +		struct drm_xe_eudebug_event_pagefault *pf = (void *)e;

maybe better: pf = container_of(e, pf, base);

Beside this:

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Regards
Andrzej

> +
> +		sprintf(buf, "client_handle=%llu, exec_queue_handle=%llu, "
> +			"lrc_handle=%llu, bitmask_size=%d, pagefault_address=0x%llx",
> +			pf->client_handle, pf->exec_queue_handle, pf->lrc_handle,
> +			pf->bitmask_size, pf->pagefault_address);
> +		break;
> +	}
>   	default:
>   		strcpy(buf, "<...>");
>   	}

