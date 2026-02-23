Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810B5E98DE7
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 06:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101F910E23B;
	Mon, 23 Feb 2026 06:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI5vHFGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60D610E23B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 06:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771826849; x=1803362849;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UELp1nh/N3iOjONCfgbt1tFkSCLUWz+HAnYqLQCM7Eo=;
 b=gI5vHFGTzTJtCj9OCuolmiIBhurz47Rv8OtEysfMW7826PIz0F1s4gu+
 52kPkxZnJSHUAbaAdrvMkq6HPN6MLJ+cl5Vp4JDHK9SBfwgP9i41Nuy0U
 0CjGW7jMXZ0KeCbyABxeJ+u8TDOyZ4w8yXxLemz/kq1gnHEVlnPuHE0T0
 Z23RTKm4lZIif0hkscmsPH+W1YTlYcII1pMmnyyJa2w8gfoCUOwJUlcXg
 YlcmzWgAm5a7fBR3SBzaaI/HWTOcwVZy1D9d8vqLix5GDx1T9tzc2cgWm
 BSYcORF6E0s7ZV00rtPVmvfbq3FKBx48WZsmFdiWwHvTacI9oA4OvF3+f A==;
X-CSE-ConnectionGUID: 00QVNH4gSU2ATFeqTy59zg==
X-CSE-MsgGUID: RvlksjhRQBabe5K0rUlJrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72795343"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72795343"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 22:07:03 -0800
X-CSE-ConnectionGUID: QbQm8UTQRnmVTkSti00pYw==
X-CSE-MsgGUID: s+BnZULCSMG47DgE4q9Q1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220456056"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 22:07:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 22:07:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 22:07:02 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 22:07:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXlazmPIetWarIxWZ9BWWdV1okyil8SpFLiiNH2qG1JU8MRU7dugDtu3yVUqyEQ9mc2QurQV/F/f4YjGqIkLepRL0jMxqriOufruYDsvqmj8WPzE+dVFEu7WQXui4kYGRJFRT7Hlou0gMHyae5ZvB8XGomOWJvj43JGb9bT9Y49ibns9LsPbUy3RaiYVjM5JVDcFPAQiPyYYNJfq4Q5l8Tnxn2489+4uMcPwD/4EqNLXSYNnWzdi+qNQDMrt0ac0lKgYYA1Y0/8UVj5c1OIJOBxoV/YPD4lKDe3wiVsiPwhBBdQHVSSsJu756/Xmusyea322HY5AItgl+9hnFvo9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqUyAqo9fPiXh6+JPIA9hWdyoK0Jx7+k4QdTlIgoH4I=;
 b=t30w4ICg+9jyDkdoYQFGZz9Lq9+mmNEhiHIkkJ4E1NCyanznGYFCjJoeT/aA8QwOZKEQnvlFpIHMucMoxctGo32tJDCo2EdQDNa2FJTPDbKNZXWEzGOt/RP8ut2yTO/sZA1mHAhRHiM4ytaBu0gI7Ype0njGMqEHJB00fJRz4Ig9ge9ZytaebOGR3E+A7ytIXxLdDzZzUmTi160ZNGVWlP2saZx7iBYcBXaiG6F6DASSmBaVUFTbe53WJ97joZRGqKU3DPIdOkhm8SwE+RgS+Uou3PWUcrVaQ8YOnEynjVQnxkpVnvwmtsMyD7EPayxQ4tcZYWXx4CEdlRN5kPL/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 06:06:55 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 06:06:54 +0000
Message-ID: <100574ec-a137-44f9-a4db-7a7e32bbc4fd@intel.com>
Date: Mon, 23 Feb 2026 11:36:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 5/8] tests/intel/xe_madvise: Add
 dontneed-before-exec subtest
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-6-arvind.yadav@intel.com>
 <BL1PR11MB552517BD58B9CA1E7FC9556D8477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <BL1PR11MB552517BD58B9CA1E7FC9556D8477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|IA1PR11MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: eedb1725-c620-42e1-f57a-08de72a1bead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGxab3c4VEhQMTgzU2UxOFRTSHR2UUV6VUFzV3pkb0toRW9VVEZRdHp4Y29P?=
 =?utf-8?B?Z0IveXNTNC8yOTRVRkJSVnIxT1ZENTlkMWJXS1FOc0tab0dHVm52cDZOc2Qz?=
 =?utf-8?B?TDJkVkttYmpmREpQc0F5VHo0MUh0bkFCQjJRMUVvbm1FWHdGbTJjL2JZTUdZ?=
 =?utf-8?B?SmtBdytYamt2d2FNbUxialYzNW5hVys1YzUrUE5jVG9UeldiblB1TDdhbzBo?=
 =?utf-8?B?S0ZMRGwrc3hlQ1o2NVBFUm90MWtUSXJtMFpyMDlaVzJCTFRhUjdIbENpMlFr?=
 =?utf-8?B?TWViRXNzbDNRUzlwNGt4akJwVWFCRXJUOUh3VWZOTzV3eGIvdHdaZGRDaEF4?=
 =?utf-8?B?MDM4VG1oQU5UL3VQSGlQL1NrcGtZTTJXc3Fqb1o4OXk0UzJIZVJjaVlxbGJl?=
 =?utf-8?B?TEU2bnlCcW9NN2s5S1dxcitSdFVYR1h2REJFVEtSdlpscER6SUo0NVpWVW0v?=
 =?utf-8?B?MFNQZ2hIOU9lSkozbkcySHFURGJtQXNqckhjYjlLNVF2Vy9PVnFJTldLM1Ni?=
 =?utf-8?B?ZWhDMmU4Nm1xV0Q4KzBJK0hWbVRxVXY0OEk3OFRLa1BJcjl0NVR4cHpDSCtn?=
 =?utf-8?B?Tk9xLzFKV2Y4QmNTOTBscEVGSk9Ea3p3aDZQckZkWDFMZ1AyTjJlbGNsRE1Z?=
 =?utf-8?B?WUZtakVUSVNoMU9iZVJHNGc5Zk5CUno1KzRzZ2dRQ1c5NmhFaU81Sjg2N3Fp?=
 =?utf-8?B?ckdmN0ZxZ0NNdGFqNFJDaFJ4ZlErVVBMQ0xNd2JjODBuaS9ZK3B5Q3REaGpR?=
 =?utf-8?B?K2FnMVdqOTUzbituKzV6SkE2U1psaHdkZDdxVVZySWovMUgybkhQMFQ1Vzl2?=
 =?utf-8?B?UGJyS0p5NnBtT3ZOUnJmcytwYTIrZFVDbUtUZFhIYTRBZDVPcFd6YVNGU1o2?=
 =?utf-8?B?UmpUTzRTSGc4ZTdGeVdZN0NwMWNnRzJxVE9uM3hPVmMyKzNXVmRVR25uRjBp?=
 =?utf-8?B?NXUwckJHamNZL1hRTmdTaWl2Z3ZJSkUranF0OTNBRVgwMWwzRGZ3c2VVRzQy?=
 =?utf-8?B?ak9TMFJXMHA2cmFFazRKQmkwZmtZYUlEQjdIc010K25EdURwYjVEeExmNWE5?=
 =?utf-8?B?aG5rQ0dVaGlRa3FYcktHL3p0cFlVZDBBRlQrbDdiaU1yT1BQSXMybWhNdzc2?=
 =?utf-8?B?S1dMOFRFeFA5aGN6SWpsOFBLQWVvQnpaS1FKbmZpRFdpYlQwSVp4VnRQNTgz?=
 =?utf-8?B?V0kwQjhPM1IzaGtjMi8xWk5HbzFLMS9Tdk84WVN4anhGQVJzMEp5K1ZNS2RD?=
 =?utf-8?B?dlNSNkEwK0pMSDZrWkhWd3pHeEk0ZTVvNEFmWEkwaTJzd0doc2pNTEZUTjc2?=
 =?utf-8?B?RE1MTFVRWklJZXNVTHVsdllKczM3Vm5iZ0NTMWNlR2hOTGc4bkhIem0zMm44?=
 =?utf-8?B?SmFVRXNiQzJIZkdYZktHZzVueGRlcjNtUEV4VzZPMFExTTFHMGZUYlR3UERQ?=
 =?utf-8?B?RnZhTzZjb0FleGFybERmajhwRHNaUzQ2UnBwZzk0eXBVYVR0bjJ5TG11eTB4?=
 =?utf-8?B?Y0dGREpNUHg5VVBSUyt5U3pxRStuRG16MXlsYk1ha3o5aS9JbDJaNmlRVEhn?=
 =?utf-8?B?R1hKby9xZ3hWZnBGNys4Qlc1Mi9nZk5lKytkU1hlbmNxd1NKMyt0WGdhS2hJ?=
 =?utf-8?B?eGpDSklWWjRmTU1LVUFJWTdEVW1LbkhFbnh2Q0dPL3MrM1BGZ0xjRk5FN0FO?=
 =?utf-8?B?dExKNXora2FKUjdtdDV6Vm1Jd2x6OHplYjhLbHozM1d1RWtvREV3UlVWQVZV?=
 =?utf-8?B?ZVR0RTg3U0R6eW90MG9KdVdOdnpXeVRtWkUrenVZQlhTZkRCbDNTT2xyTit5?=
 =?utf-8?B?dHhweDBVQndWRXlObDdMcUlKYWRhbmNwc0hYdzVhWGV6QXZET3ZnQWJsa2Jt?=
 =?utf-8?B?d3kvNFpGU1BTTVRhVFBaenlRbmh2UHNvSk1NNUZsN0lDMHRtNksxOXZyR0Jr?=
 =?utf-8?B?dEE0M1pobXJ2OVJmc1E1NFhmRWsvL1dtNXhQZWE2OHVqMTVoRXdjWTE1NVE5?=
 =?utf-8?B?alJNNDBKOW9iMjJ0ZlBLSEN2RkcrbFE1Q25wa2gwSGFhN0lZc3J6V0dhalpL?=
 =?utf-8?B?U1hCa3pIVVlkaXdnTFZjQW1pNkVZQUFlS1EwVldpUnBUcnk0Tk5kZmRkRElT?=
 =?utf-8?Q?tzuY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3BGM2xPY1QrY0pnS2pweDh0N2ZxN0QwaDA2YjZvN212dnptcnpNK2dGY3Rv?=
 =?utf-8?B?QlRjK1BvdFlHVjZIWHYrOHBnUmpVaG5MYkJscnJYUEJjUkRzczNLaml4RVZs?=
 =?utf-8?B?eHdNakZxLzZSa0pvMk5ka0VIQkcydWpFNy96OGpXMzlCb0xDcHo5aDJwamQz?=
 =?utf-8?B?YncxSnZON2tyZkMvbGp2eEtpYlZ4aWVpQ0xHZDRZMUdBRStXeE1kK2NoQVpG?=
 =?utf-8?B?a2lwUmY4LzZxRGx1TUh1Zm14WTRPTzhKYllCbW5sZXk3UlVLbWRYQStTZURj?=
 =?utf-8?B?UFM0NjluV0tIekdTR2UxcFBYcUM5bFBDSXBMS1JzK2locDNZcGpTY2NpN3Js?=
 =?utf-8?B?OFlXV2V4NzlYWDNIMkdtMzBkK0x0a1hQU0haRXBUMlVMLzluQ0JCNVlhLzJP?=
 =?utf-8?B?akFxL2s3ZlRwK3R5NEpKUnQydU5kRzBVVWlBNlcwY2N2U1FPU3hqVHdRZUto?=
 =?utf-8?B?NWY5NjJRd1VZU1Y3L2JHL3NwUndPSTBXOVBVb1R5T1ZnRitQQnhya1R1cXda?=
 =?utf-8?B?WXlPY2ozdTRyZGpZYUp5RHV4V21sdjQvSVNobVlCazA0RFAwdHhCb1lqamVZ?=
 =?utf-8?B?T09uZFY5ODhTb2ZKQXc0d0JrZGtWVmpGV3VGeFRKZnFiNkJuYk15TnNtanpI?=
 =?utf-8?B?d1VmV0pNSmNlNEo4YkF1OXc3UllqelIvWXFobkNoQWdDazVVVjBUTnk5b1Q0?=
 =?utf-8?B?Y2JFNnhSWXpkaSszQjhCc1hQamZIcWt2SE13SnN5bFY2UUZvSWloRzFkMHBu?=
 =?utf-8?B?WDFiVzBWMHhMWFNYSzJhSFVyeWszM1FMTi9VQ3lRNHM2cmNIeVNBVHVQQndh?=
 =?utf-8?B?VUl0LzMwZjZPWTlESHc3UVpVdWxtS1hkTlJYVzM1RE9QaUtKY2lXT2xuY3lU?=
 =?utf-8?B?b09Kc0p5VzZxQS9JemRodFB4SFJpb1BKeStJUFZubUpZZTNSMXZvdVdmajhP?=
 =?utf-8?B?WGNRcktKSzdoU3dleDVJSHYyVzlPdWJUSER1Z1krcGdRTlM3NlUyVzdZVWtQ?=
 =?utf-8?B?RkhUZ2txQjU2cjd4azc1SGJBLzhVSEprRGZHT3YzT25ZQThBbjF2bTE4c2lR?=
 =?utf-8?B?YVM2R2lQbjRIeEVvTE5kcHFoSTVSTzErbjRGallKRlJNRjRjSXRsQlRmUldW?=
 =?utf-8?B?RUxNWXM0TE15RjMrZWFCM3lRTGdxNkE2UFY4MERTQWFSRUVoY0IvV2pKdWZv?=
 =?utf-8?B?R0U3eHN4dE5xcHVCZzkydjJKbmgwWVpEcXRESXQ1bEFaNHNxUmhFTng2cTBV?=
 =?utf-8?B?akcvNEFRcjdBWkIvQTI5c1RQcCt4NCtLMldtQXpYUXJISWZ0UU1RNERwbUpN?=
 =?utf-8?B?b1d3Q05pRkdVWTh6S3prUUxqSWJWVUhCUUNxZWpuUVQzemRvRGNpeU5vYkh6?=
 =?utf-8?B?RjVDcnZMTzdNWmdkVHBPaWx6T0dsMmtHTkxJQysrL2V6OE1DbmJCUmdVMko5?=
 =?utf-8?B?MkQ5TlR5em5zUm1LQlJodGtxYkZzNEo0cjNCcG9JTm9vY1FlQUZERURaZkdm?=
 =?utf-8?B?aTVobWJwRHpvck9TVVpjdlpKMzZOSXlXS1FyRi82Q2htdzRYNEl6d0tTNTRR?=
 =?utf-8?B?NlpDeGVUV2o0V1p0Q0h1Z3YzRUFFNURGTzM2bFFjOTlnaGtVcVdwRDhzdjBG?=
 =?utf-8?B?eThpc1pZRW55MkxOMWtOU2ErbHpXcHlFWXBNbm1vSlNsZC9FRzV2emFGUUdC?=
 =?utf-8?B?Qmg4QStEcTZ3dE8valRhNUFFeVVMbjdLd1N1MTNQVEVGUnYvcEdDZndmdFRR?=
 =?utf-8?B?WFdwdngybWZFYWhaM0tLTDZ1eDROVE8wOExqQjhZSnZuYWVjcGlaSnppWlZG?=
 =?utf-8?B?U1NzRnp0NWx2SGsweXBKbW9NajM4dVVOcGJBM1NDYW50Slp6S0hiQVJyMyt1?=
 =?utf-8?B?a1BLaFA5a1BSQ25kTW5aa0h6Zk9ncE1McTFva3E5MnRTbEQ4aE9lanRVVUx2?=
 =?utf-8?B?czAwME9MWldpUnVCYTUxR3dvelZDUGU5YnRpOTVVc1RSUXl0Vi85cEl6ZytQ?=
 =?utf-8?B?LytSKzFHYm1aY2p0SExUVC9TMHdUY0NTQ3VZbCtGc0dYK2JKdFlZa1BYVXox?=
 =?utf-8?B?d0kxYVJja0tSdnJ3cFBSLzg5d2VxaXJXL3JJQ3F6L2V3cFd2L2hDYW5sT3Rz?=
 =?utf-8?B?dVFZQmJyNHV6emZ2SnE5VEh1anErMU9PZWJpYVN1andlMTQxbHhmdUVNMVpo?=
 =?utf-8?B?RFFXSTVlY3pUZW1HcW00YXJzL2FZdVZoTnZUZ0lwb0o2VTA4WGFTRmJTTTQ3?=
 =?utf-8?B?bk5jVkNrOThwTHlLQTVjZWo0RzhxaWVvRldPMm5sWnZlNExwYi9ERllMdzVW?=
 =?utf-8?B?cjlSNVNDRjJiZDdtYnRya3RJV01Kc0JabFVzM1VpbkxVb1czeG8xMkZHU0dR?=
 =?utf-8?Q?txqAjbJ/ky9DoXVA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eedb1725-c620-42e1-f57a-08de72a1bead
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 06:06:54.8680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikUjKuyKAoTx7uTYTz3aTkAfudMCg0vF8CVwUJ7PgiTQ3S+KoGn9Uz9+yrG+MKOfEd5eyi+qoEeQgp3VOqkPgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6195
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


On 2/23/2026 10:40 AM, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 5/8] tests/intel/xe_madvise: Add dontneed-before-
>> exec subtest
>>
>> This test validates GPU execution behavior when a data BO is purged before
>> submission. The test creates a batch that writes to a data BO, purges the data
>> BO (while keeping the batch BO valid to avoid GPU reset), then submits for
>> execution. With VM_CREATE_FLAG_SCRATCH_PAGE, the GPU write may
>> succeed by landing on scratch memory instead of the purged BO,
>> demonstrating graceful handling of purged memory during GPU operations.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 140
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 140 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>> 5c6a24553..42cf1b3e5 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -19,7 +19,11 @@
>>
>>   /* Purgeable test constants */
>>   #define PURGEABLE_ADDR		0x1a0000
>> +#define PURGEABLE_BATCH_ADDR	0x3c0000
>>   #define PURGEABLE_BO_SIZE	4096
>> +#define PURGEABLE_FENCE_VAL	0xbeef
>> +#define PURGEABLE_TEST_PATTERN	0xc0ffee
>> +#define PURGEABLE_DEAD_PATTERN	0xdead
>>
>>   /**
>>    * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim @@
>> -144,6 +148,62 @@ static void purgeable_setup_simple_bo(int fd, uint32_t
>> *vm, uint32_t *bo,
>>   	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);  }
>>
>> +/**
>> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs
>> +for GPU exec
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bind_engine: Output bind engine handle
>> + * @batch_bo: Output batch BO handle
>> + * @data_bo: Output data BO handle
>> + * @batch: Output batch buffer pointer
>> + * @data: Output data buffer pointer
>> + * @batch_addr: Batch virtual address
>> + * @data_addr: Data virtual address
>> + * @batch_size: Batch buffer size
>> + * @data_size: Data buffer size
>> + *
>> + * Helper to create VM, bind engine, batch and data BOs, and bind them.
>> + */
>> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
>> +					   uint32_t *bind_engine,
>> +					   uint32_t *batch_bo,
>> +					   uint32_t *data_bo,
>> +					   uint32_t **batch,
>> +					   uint32_t **data,
>> +					   uint64_t batch_addr,
>> +					   uint64_t data_addr,
>> +					   size_t batch_size,
>> +					   size_t data_size)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = PURGEABLE_FENCE_VAL,
>> +	};
>> +	uint64_t vm_sync = 0;
>> +
>> +	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
>> 0);
>> +	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
>> +
>> +	/* Create and bind batch BO */
>> +	*batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd,
>> 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*batch = xe_bo_map(fd, *batch_bo, batch_size);
>> +
>> +	sync.addr = to_user_pointer(&vm_sync);
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr,
>> batch_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Create and bind data BO */
>> +	*data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 0),
>> +
>> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*data = xe_bo_map(fd, *data_bo, data_size);
>> +
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr,
>> data_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC); }
>> +
>>   /**
>>    * SUBTEST: dontneed-before-mmap
>>    * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
>> SIGBUS on access @@ -244,6 +304,80 @@ static void
>> test_dontneed_after_mmap(int fd, struct drm_xe_engine_class_instance
>>   	xe_vm_destroy(fd, vm);
>>   }
>>
>> +/**
>> + * SUBTEST: dontneed-before-exec
>> + * Description: Mark BO as DONTNEED before GPU exec, verify GPU
>> +behavior with SCRATCH_PAGE
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_exec(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = PURGEABLE_ADDR;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[1] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo,
>> +				       &bo, &batch, &data, batch_addr,
>> +				       data_addr, batch_size, data_size);
>> +
>> +	/* Prepare batch */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = PURGEABLE_DEAD_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	/* Phase 1: Purge data BO, batch BO still valid */
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>> +data_size));
Resource cleanup?
>> +
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	vm_sync = 0;
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +
>> +	/*
>> +	 * VM has SCRATCH_PAGE — exec may succeed with the GPU write
>> +	 * landing on scratch instead of the purged data BO.
>> +	 */
>> +	ret = __xe_exec(fd, &exec);
>> +	if (ret == 0) {
>> +		int64_t timeout = NSEC_PER_SEC;
>> +
>> +		__xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL,
>> +				 exec_queue, &timeout);
>> +	}
>> +
>> +	/*
>> +	 * Don't purge the batch BO — GPU would fetch zeroed scratch
>> +	 * instructions and trigger an engine reset.
>> +	 */
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>>   int igt_main()
>>   {
>>   	struct drm_xe_engine_class_instance *hwe; @@ -266,6 +400,12 @@
>> int igt_main()
>>   			break;
>>   		}
>>
>> +	igt_subtest("dontneed-before-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_exec(fd, hwe);
>> +			break;
>> +		}
>> +
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>> --
>> 2.43.0
