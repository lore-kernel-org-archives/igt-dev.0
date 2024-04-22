Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD276C07E8E
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 12:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F14112A78;
	Mon, 22 Apr 2024 12:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duqzF6u/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8582112A76
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713789411; x=1745325411;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=v0g+ZtiUUcoxVFKQ5Ij6spG+oNPD0B2OAO98LFd6xQs=;
 b=duqzF6u/pBb3aXBQJy8oDzcLdLLoxiWH47IOBTX7z8vy5gDimvid1aod
 O00KEyMOQozL/gNp49O87JT5t1uP/6cIZzZgBpnLFzyGRWoybPsyfrpCT
 sH6mz3gOIZNWAWeDYl0+Rt1eBKVs0ZsKMwtQWkv63fnlvziwHaxIGygj2
 iRo9xnIk1qjFJq3SRVxYSFl8hxL0Yu1PJiyGrtLLyFCbnHjI0OkMpjn5F
 I+ZQFza95/baQEX3mIqDq9z2/pFhJmR6qDrJOr57maPr/GGBWfLQ8JnMp
 ctnnUmcu8JIgcSVe5vZ4iMPkx0gHxRBU2ZPds+YMr+Qoq6yJbNrL79iZI A==;
X-CSE-ConnectionGUID: DLDenk5QS0yZq3SqakaNPw==
X-CSE-MsgGUID: WxavwavlSQWAjhliLNV71Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20462983"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20462983"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 05:36:50 -0700
X-CSE-ConnectionGUID: Kijo07noStW1STkrcMq7WA==
X-CSE-MsgGUID: h2CRJ54ZR1qIEuSGJihJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24512645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 05:36:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 05:36:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 05:36:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 05:36:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 05:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPmn3CVowuNMCIS0Z8NigyyX0XMQqFlyV5QY2YtKFjcNuy23C4CIrqfshBwAyEgvFHccHbqVwJquee2XMa10Qo/UfHH65Grzw5dvnYXKa5Ud+09GBHfFynYno6dvvjgO8lJk5nY24rnXEWQgn/ixXDz7ivkW5LQ29MoiIV2kW+FQWNHYzTqAtR6+N9hYzf/REZN9/CqRHoEOmey3p4ecRjwzpNVXsO5XvHAeyWK833KfCqJxmGSy0KAC67mVv9Ai2GlyHnj8Pl4gKhAd1S01CVY+IEb13kKTL0jKPA1++5G8LVvpgXPwI9g1T1tp9YRDySrLCIqEqzCshQRrLZaxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiSHRGagibNUD8cbBlbDkOKPnLrpd6Mosz9xnHflVys=;
 b=I62in4Gas8GYDgF26BvFcBk5CaVByJ4ccu4jZujFhhgWiBxKWUbvjwI8tv90jpJzsuPurR2jzXOUKzYZXVKVpwdtVfDVd1Et/zZMDeoLy9gqVDQIxLWcHknKklC0mFEV39mmhjb8Hw8j5X8xnxUK4NImD/BEkDXWJ/caotQx5fKAoa6uESl3Pr5/Mpsnfn+XDzOnu4JaQeVvISPVbWWfXDRBdwJDuhkd3CLYB8IcEaHJ6BmC6alRiAeUx8gkC79besE1NB9rM2s5CVUtOhsiDBdguW0Naa74jCGTEzfSvJ2OHiGANiEJGuUHdI+EiLXACPbGMao5T8u8M1InA6o0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.39; Mon, 22 Apr 2024 12:36:42 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 12:36:42 +0000
Message-ID: <23e3a2a4-315d-492e-99fd-6c158cf64853@intel.com>
Date: Mon, 22 Apr 2024 18:06:24 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests/intel/?=
 =?UTF-8?Q?kms=5Ffbt=3A_Use_Linear_modifier_as_default_=28rev4=29?=
To: <igt-dev@lists.freedesktop.org>, <lgci.bug.filing@intel.com>,
 <tejasreex.illipilli@intel.com>
References: <20230911074026.1944119-1-bhanuprakash.modem@intel.com>
 <171378785187.1571015.13351727635040024749@8e613ede5ea5>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <171378785187.1571015.13351727635040024749@8e613ede5ea5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::25) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS7PR11MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c92f9c-3dec-40a8-c072-08dc62c8dd08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlZEUXZjTnUvQUlsdWtkTVBmYkh5TGhpRUlFa2VKUU56NnVHVXdrMjNFK2oy?=
 =?utf-8?B?ZkZxOWpsQ21wcldWK0RGN3ltZGt1T0s3c3hRUzltUlA3dExLdEFyR0t4VUQ2?=
 =?utf-8?B?WGEvcEpOUDVxRWVZeG5BQ2F0bnlyM1NxRS9LK1ZXeEVURXRDUnJ6VmhHN21O?=
 =?utf-8?B?eWNqNXl6T2ZZcVBrd0R5NEprbldyZTFjM0g1K0RrdlBubkpCaUxPV1BKanFE?=
 =?utf-8?B?U1lCak5aR0xxL0I3V1F3Wmd1Smp0azhrNXc4K05OdTNMaytPRUZCSTYzc3ZW?=
 =?utf-8?B?Nk5tR3N2MTQ3OUxzZEhzYk0yYlU1T3JLU2JDZ0JOZU5kK1RyUTMrN1RncW40?=
 =?utf-8?B?VElJMk5HRUxEKzVVNlV4Y0RtWThFUVhhS21WNVNKZ1RKSU5FcHlqOXhMVGJw?=
 =?utf-8?B?TVNDTWttcW5TR1lYZjZabWxaZ2JmcEh6M0RtbDNteWdidmJVUTV3ZHhib2lL?=
 =?utf-8?B?RXJabEdFMTB3d1V4UXRBUFZtM0I1S0M0OXp2ZThQNTJVakI2Y29VKzBya0RB?=
 =?utf-8?B?TU9YeEIwbXIrTERUWFdmR3dLN0x5bjc3cms2UTkyejhxTk4weXVVWUxJbklu?=
 =?utf-8?B?SmNJaGRJZ21XOXlWZFp6SmpQcXY0aUhsa0hqcmJQWWNkdHlPTlNoTVlLbkJS?=
 =?utf-8?B?NjN5M0hHak1zTzFaTytKOFJVampDN2czTGVIZTBhZkxqTkVxaHBqOHArUkow?=
 =?utf-8?B?WjlNZDdNR0xWMEtsVHhpVTE0aGlqNThsV0xHWjVDdjltNk5BRUJzaFhXWFVO?=
 =?utf-8?B?Rk5ZK0lNdkRNcDlVbVlHWTQ4Uk5lZGNNL1REWXBEenRXdG5YZkNzMnlrbnlF?=
 =?utf-8?B?ZDNUbkZxRElsWlVaL1RrM1JQUk1VTmZHMGU0Zk1EYm1naGE5OElGMkZ6VW10?=
 =?utf-8?B?SnMzRmROajBFQldlNjM0eG96WXJvaWUrMzl0MitteDNsN2l5VVFQbm5vNllh?=
 =?utf-8?B?L0FHSlNOTXBwdDBwaXZrbkpQSGF4dDJ4KzZNdlVVNEpET3lkNjB4bXhJY05q?=
 =?utf-8?B?K2F2L2V3SXg5TGI5VGtZNlcxTUFUVEs3a2hqd29GelJxMm1SdDczV3BQTjhz?=
 =?utf-8?B?K1AxLzRUbFNWajNFUjkybnNmU1ZlOWZLNU5MUmtHYlZNbEVCMGVRMlNEVkt3?=
 =?utf-8?B?MXM2dzl0TFpjbXJFenlrUGptTm1hKzNoQjN4VHd0RmhhbEdsK3BmY1F2ak1s?=
 =?utf-8?B?UmUvZlV2SUx0Z0o3Z2VGT2tjdWJCeElrSDRsT1RGTGV1ZHladG1VQ1FWcFpi?=
 =?utf-8?B?RUJSdUR6eUJKekhGdXRXSmloTFVhTFRLY2NId1BzSnlBei9LdGNzRGIrYVZ0?=
 =?utf-8?B?alVlOXVlNTZnRVJmL1JkRUFGSlBPYjhZSy9vVjQ1dmNtTWlrNmJleUxiVmhh?=
 =?utf-8?B?YjJSUlROMWloeW91WnJyQks0ZndEaDZEQ1paQlZkMWlqTXhhZWF4Z0pNemx4?=
 =?utf-8?B?Vk5IMVlEb3dHSXJ5dFpveFJUTmoyeU45UUpIcndLbmp0b1JDNVMycURZaWFt?=
 =?utf-8?B?d00rUGpLc0JaWEtab25nYmV6ZEZPa05MaGMraU5PN1U5cnNSS2FFQVpvSTdt?=
 =?utf-8?B?Z3F0amlFR2dlVFlFOE5pNVgzZ3J0eHBvdDFWWUdaQ0pIaS9YVXFEc0EyYjNI?=
 =?utf-8?Q?cg3zKwf+Wuuwa0/fdOB7Ct94T8s3TC+l/MV6MTVeOLDE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UERDL3hzVXJwaW1jbCt4V3k2emc4ZXFUenZEMkdtSUFXMDFWSU5nZnhyYzk2?=
 =?utf-8?B?aGdpSEZFS1h0Y2RxbzgvYnRJTVppODJZSzlLYVVFUk1ROHVCcGwyVWdxMnZa?=
 =?utf-8?B?MFE1dzNEL3ZVdWdLRVhLNlQycDRpZHY3R2luRUtEZEU2UXR4YnpVelRDbXJi?=
 =?utf-8?B?RjRnd2h2WWJKdTVWczJ3MUd2VmJsSktxekh3MnJVQ2lqMGlaSmpOSWFNak5w?=
 =?utf-8?B?K0RaUXYzWHM4S3A3ZFg0bXd6eFNvT2d4OGZXd0p3cnN3dkNZVm1DRGZHZ0Zr?=
 =?utf-8?B?T0VNaXZnOVBSRk5KQlkxSGlFT2xUT0VPNGNPZXBhNVN0MURMLytDSlNDZVVo?=
 =?utf-8?B?c3ptcitLQlI1endMYlBuK0xJOFFIeUhKSHV5TWFqVmRUS2hkVmowTi9iQzh2?=
 =?utf-8?B?cU90YlF3dE1GT1NnUXZvTnJJTU10ZnF0M29tM0Vkb1RCSk1pR1ZOWE9veFVG?=
 =?utf-8?B?OXFqUHlWczk5MTRkb0VBbDAxaU54VGZEeldtUVZQU1lmZ3h4UURyWFJsM3NG?=
 =?utf-8?B?T3hpemtrK0lSNEhBM3ZkZGdpcFQ2ZU9vQ1kyM0R4OGJGeFV2Sm4waUNTcGVu?=
 =?utf-8?B?TzlEejg0TzJGbDR4QU1kUXd1aFpxMkJHeHh1WjM3cm5XWnJjRVZmeGhHcVVR?=
 =?utf-8?B?Qi92UlI1ekQ4MVdkRUJHRVdRZzI0d3MvTkQ2U1NNM1c0bHFFblc3enNMTEc5?=
 =?utf-8?B?M1dyVGhTeXR6cTFweHVmMU1VMkZsM29MRCtHR09wNU1YaVY4RVhrWFp3TnZT?=
 =?utf-8?B?bm0yZ3dETXRQNFFwZG5KUjNLa2hLb0dCaDBkV3h0ajZWK0VOSUhqTDZhaDBZ?=
 =?utf-8?B?UTQvSVY2a2EvdzJRYkhkcnhlQW5EaDZJSkdKTVhvamJDcG92MTdBZ2NUYXNp?=
 =?utf-8?B?ZFNackNMb2xrREs0Y1h3YUZtUTgrZjdnRW9uUmhjdEEyWGFxZ0ZOc25KYm1K?=
 =?utf-8?B?amNwL3ZqRGJ0ZUdPdGN6N0tEN2tUa29JdDYxVlRMRG1SNGdUZlpYTE52dmNG?=
 =?utf-8?B?b2owQ0hpbkRTR3VjSjJrS0l1RExLSWxvc0VNSlh2c3ltaUlhSDJGdXl6SUNh?=
 =?utf-8?B?b05QKy9KSktMcklzc1Rrb1A3MUpJRFBWamxUQldHMk5aUi9ZY0hXdGE5OEZV?=
 =?utf-8?B?V1Y1UCtkK2VQUHNlY2l0UlFuSDFsWXZKK3lwaXhFWXZkbjEwZGRISVI2YVRX?=
 =?utf-8?B?OXJPb1FKWGQ3WVRHZ1VTZURNa0dpMHh0VXN0anhYQzYrZFBrc2YvV1dFWXAw?=
 =?utf-8?B?UURBU21kWU50MG4wSXp3RXhlSFVxcFNYNGlYUStxVzF1cWJIOHZ3eFM1WTlJ?=
 =?utf-8?B?VGx1UCtpbGZxM1JlM2tsSTkzS3cxaWpWdWxvb1BkRjIxdngrdlhsaFN2SUZS?=
 =?utf-8?B?OHcraFI1dXJHNWlTK29ubGV5OEM3TFJMVFZUL1JVakZmMjhQeW1nd2NiUXI0?=
 =?utf-8?B?UkRIRm1teWNMdWZCNlQzQ2FjSFR4eTFtUlJPcEhvcWdkcThjNmtlcEF4dDRT?=
 =?utf-8?B?ZytKTThnZDUvVnM5cVEreTd3NWJpdUZxYUI3b0FrRFYraExxUHJpRWNBangx?=
 =?utf-8?B?MTEvaWNiNytXSDE1OGhGYUpubjhlN0loemZHTnp2bkRxazFNTlFDZkpSekNO?=
 =?utf-8?B?OFIvdTMwalRSZy9xdnJScEZKN3ljUFozaDN6b3lIMkpUcjVWeFZWc3kzTDVq?=
 =?utf-8?B?aDg3TFBDb2h2dWJ6MVZ1cTl3M01zWkZMNDBVS2NhNHRjNU96QUF6Rno0Z0VN?=
 =?utf-8?B?UExKdkp1OTJoK1UycENoKzJGamNrb283SjdZUytOS2Z0Smkwb0o1V2xzNExj?=
 =?utf-8?B?MGlVNUJPdFpnempHR2xBbFpCZ3RuakFlQUJJNTVWb0tnWGVEN2F4TnlhdWgz?=
 =?utf-8?B?a21TWFdDWW1OekZHbFhndGhkYXlwZ3YydWN4dEQ0S21xSEZUNElwOUt3Q21V?=
 =?utf-8?B?NzczVG5GZ05HRFVVTVg2UzRWK3pnZjRaMEJzTC9MZDEwQjhpaE81VVp2djNp?=
 =?utf-8?B?UmY3bldGZ04wbnJTeXhVUnJSeW9yTVZVNEpFRG9FR3VJMi9UZXhmLzBYYXJm?=
 =?utf-8?B?Y1d6OXFYZmN6ak9WclBMSzdxYWtLWlNmdkZrMTRDd2tNMTAvQUUwZDhRVHZt?=
 =?utf-8?B?RWNXYWhFT0hqbGg0bHFuUWpYS0JzQXJjWlg5d2NoaVJGelNDNHZxWXI1MFJw?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c92f9c-3dec-40a8-c072-08dc62c8dd08
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 12:36:42.2623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdQ/koOCGBv4WxyofLD2DMbvtkfXxBxlWee2btlbbLw1jt1V69+jYM1fO+u378Oq+6Xupghyn+OW2E/MjKNutU8beCDFhLjxZhUAwhIcvtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
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

Hi Bug filing team,

Below issue is not related to this patch, please help to re-report.

- Bhanu

On 22-04-2024 05:40 pm, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/kms_fbt: Use Linear modifier as default (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/123520/ 
> <https://patchwork.freedesktop.org/series/123520/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7815 -> IGTPW_11048
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11048 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11048, please notify your bug team 
> ("I915-ci-infra@lists.freedesktop.org") to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/index.html
> 
> 
>     Participating hosts (30 -> 33)
> 
> Additional (5): fi-bsw-n3050 fi-glk-j4005 fi-elk-e7500 bat-dg2-11 
> bat-mtlp-6
> Missing (2): fi-cfl-8109u bat-jsl-1
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_11048:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_selftest@live@active:
>       o fi-kbl-x1275: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7815/fi-kbl-x1275/igt@i915_selftest@live@active.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-kbl-x1275/igt@i915_selftest@live@active.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11048 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/intel/issues/9318>)
>   *
> 
>     igt@fbdev@info:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@fbdev@info.html> (i915#1849 <https://gitlab.freedesktop.org/drm/intel/issues/1849> / i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
>   *
> 
>     igt@fbdev@write:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@fbdev@write.html> (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>) +3 other tests skip
>   *
> 
>     igt@gem_huc_copy@huc-copy:
> 
>       o fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/intel/issues/2190>)
>   *
> 
>     igt@gem_lmem_swapping@basic:
> 
>       o fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-glk-j4005/igt@gem_lmem_swapping@basic.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o fi-bsw-n3050: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html> +19 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_mmap@basic:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@gem_mmap@basic.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>   *
> 
>     igt@gem_tiled_blits@basic:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@gem_tiled_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_tiled_fence_blits@basic:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_tiled_pread_basic:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@gem_tiled_pread_basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 other test skip
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@gem_tiled_pread_basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +1 other test skip
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>)
>   *
> 
>     igt@i915_selftest@live@execlists:
> 
>       o fi-bsw-nick: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7815/fi-bsw-nick/igt@i915_selftest@live@execlists.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-bsw-nick/igt@i915_selftest@live@execlists.html> (i915#10594 <https://gitlab.freedesktop.org/drm/intel/issues/10594>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>) +8 other tests skip
>   *
> 
>     igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +7 other tests skip
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>)
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/intel/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o fi-glk-j4005: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> +10 other tests skip
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html> (i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>) +17 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>   *
> 
>     igt@kms_flip@basic-flip-vs-dpms:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_flip@basic-flip-vs-dpms.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>) +3 other tests skip
>   *
> 
>     igt@kms_force_connector_basic@force-load-detect:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html>
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/intel/issues/5274> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>)
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_frontbuffer_tracking@basic.html> (i915#4342 <https://gitlab.freedesktop.org/drm/intel/issues/4342> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>)
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>)
>   *
> 
>     igt@kms_pm_rpm@basic-pci-d3-state:
> 
>       o fi-elk-e7500: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html> +23 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_psr@psr-cursor-plane-move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/intel/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/intel/issues/9732> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>) +3 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-plane-onoff:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/intel/issues/9732>) +3 other tests skip
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@kms_setmode@basic-clone-single-crtc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8809 <https://gitlab.freedesktop.org/drm/intel/issues/8809> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>)
>   *
> 
>     igt@prime_vgem@basic-fence-flip:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@prime_vgem@basic-fence-flip.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#9792 <https://gitlab.freedesktop.org/drm/intel/issues/9792>)
>   *
> 
>     igt@prime_vgem@basic-fence-mmap:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@prime_vgem@basic-fence-mmap.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o bat-dg2-11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-dg2-11/igt@prime_vgem@basic-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +2 other tests skip
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@prime_vgem@basic-read.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +1 other test skip
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o bat-mtlp-6: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/bat-mtlp-6/igt@prime_vgem@basic-write.html> (i915#10216 <https://gitlab.freedesktop.org/drm/intel/issues/10216> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
> 
> 
>         Possible fixes
> 
>   * igt@i915_selftest@live@hugepages:
>       o fi-apl-guc: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7815/fi-apl-guc/igt@i915_selftest@live@hugepages.html> (i915#10461 <https://gitlab.freedesktop.org/drm/intel/issues/10461>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-apl-guc/igt@i915_selftest@live@hugepages.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@i915_module_load@load:
> 
>       o fi-kbl-7567u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7815/fi-kbl-7567u/igt@i915_module_load@load.html> (i915#10875 <https://gitlab.freedesktop.org/drm/intel/issues/10875> / i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> / i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982> / i915#8585 <https://gitlab.freedesktop.org/drm/intel/issues/8585>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-kbl-7567u/igt@i915_module_load@load.html> (i915#10875 <https://gitlab.freedesktop.org/drm/intel/issues/10875> / i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> / i915#8585 <https://gitlab.freedesktop.org/drm/intel/issues/8585>)
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
> 
>       o fi-kbl-7567u: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7815/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> / i915#1982 <https://gitlab.freedesktop.org/drm/intel/issues/1982> / i915#8585 <https://gitlab.freedesktop.org/drm/intel/issues/8585>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11048/fi-kbl-7567u/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180> / i915#8585 <https://gitlab.freedesktop.org/drm/intel/issues/8585>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7815 -> IGTPW_11048
> 
> CI-20190529: 20190529
> CI_DRM_14624: ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11048: a8472258c6b284b42e9addab57e9e5c70a231a02 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
