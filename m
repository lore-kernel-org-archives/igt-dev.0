Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FC2CA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 17:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E0910EC1B;
	Fri,  5 Sep 2025 17:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIsuJADn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247C10EC1B
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757095028; x=1788631028;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ke3VWxCmIzubuNfxW5UwrdDEiWY/zsaZGzxiw2dNJKk=;
 b=NIsuJADnnjcV15iazeTbNp8jSGDGcob6BaOmJDLYLAJTtQh2sylv74Rc
 uFdYtYobkAIwEfX0zsckkPYJ5MAfHyFZLCb6Vk8nHuU95IxXedeDd/G7b
 lKtEKTVBpugDM3eha3EQiM2PO3PP8HCx53rT9kvRJpOrrjVcxRZtHfQNw
 spo3K5RaporlPILCHOF72AL3EA0Dd7a5i5K7NyiaTFh/N5BvnuQfWpD3h
 unBeZJQfUTXppcYd3gyWGDFF2rlD2+3kEjlH4JLjKJyXfU5Yv3ux1Ohxf
 rX5GTO4KZ/EJqV0/0w0JPW0+MsBahgKAKmCe+jbzKcG8YXfDf+WUtgtbQ w==;
X-CSE-ConnectionGUID: m1lgdyCrSS2r09JZAqfaEA==
X-CSE-MsgGUID: fvyLcM4ARvqxzlXdm/rdeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="77063071"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="77063071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 10:57:07 -0700
X-CSE-ConnectionGUID: aolF06gRSZ6BZfzoB5PVcQ==
X-CSE-MsgGUID: d6W5kUgJSS+NOG8JIYflbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="203149940"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 10:57:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 10:57:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 10:57:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.52)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 10:57:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJyRXl2SwPp6qX8FH50fC9ihgYnBEVfe5BpFaEe5g/U0BM+kbKrOZa0nvMsjZ0A/MEbQZdkz6wckVhFrILPTC8X+dFyAxCeMFs2qbreCC2AIeUU+LCjF+OZHjmpA4Mwv6PwVg6m/3pUR3bf3wJfQwVBdVgsfJ+XI3td//mxERuGMhSde4RhiLmKiCOxect6KcBNFo8DxumkDmT1ia2pgAwKUJvzhBSEdz0qt5H/+lfsD4Ure8N08GJzd+/Bff91EHgdvyvvNYe21mUnVtj/gJoOE832uJlFrlp9BBoNlsOXdqVZ20wotb31gZ2OP4MV75eapoOaWdjFBmPaIwtvDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx1kVMOFLieQzRFhCPsya8i1/EGmmSHZ6RYUBA8q8rM=;
 b=cHjR64glJTDuOt2CBCkdFQ1l24XIelhr5Demko0jp5W8Xu5PYFr8j3ah7AgGP7A2erChuw9JsZFMd0GOpjf9FjNkVa7Vd0qGPXN9+8z3L1IMFUFzLDMYfRjGlQtp2yVGJE0oajeB+sfiTEFB/L3ZmnaNCYZR5svJ8H67i7OSM/ertP4qkc2ephuTFlsVPXV8neXe7eP348Z282z4ytIqBAQu8Aixjh6VhGnjHBnkSgQJbqIQQe8o8brbw8MkHzvNbtowFtUeU34nM5S65rUNzv0IyjFosI4U+MxRAFx4qvZ0Wqzpw5ApEWbh+wsho9VhTUm/U4KxLibLpTZl/IEc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 17:57:04 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%5]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 17:57:04 +0000
Message-ID: <ae9ae443-f7d4-4760-ab39-b08dddcce944@intel.com>
Date: Fri, 5 Sep 2025 10:57:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Add test for
 xe_pxp_exec_queue_add
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250819005622.2970399-3-daniele.ceraolospurio@intel.com>
 <20250819005622.2970399-4-daniele.ceraolospurio@intel.com>
 <20250905104659.256rpwcy76j74tqo@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250905104659.256rpwcy76j74tqo@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0090.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::31) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN2PR11MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c47f67d-f3c7-43d5-7281-08ddeca59f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cExYTXJ4VFp5aVBxREsrSHQxT2JUaGNDdTBqWi9yUXl1U0xrOUd1NklxVTY3?=
 =?utf-8?B?ejJ6Tk9aTmpFdkE0dklpWUw5S3R0RXViRDNQOU1KUmhwL2NWUGFsUmNYdEc0?=
 =?utf-8?B?NEUrV2ZuMXZybzk0UEcrQ0lkblprVUFNRE5xVXEwa1FjUHVWWHZyTU5mdzU4?=
 =?utf-8?B?UnVYc1FLZ2wvU1U4QjdzelBaN05Tc1ZPWnFwd3cxcXlERnZyeHh1OUcxTlZ6?=
 =?utf-8?B?bmdHcWliOVdYNDFHY3Y5UGwrSnk3NTY0enBYUm9MYXEybkh1VmkvUnRWSW1p?=
 =?utf-8?B?eis0MUI2eENaTDVzVUJYamFBaUVaaXlsQ1cvWS9ReGlrMHVxUFZyQmJXT0Zj?=
 =?utf-8?B?cU5LdjRZeXR2TGZTVkJBYnZlY0hnb241T1JoQ1ZZM1Z6ci9UdHB3YWxzYzFN?=
 =?utf-8?B?ODI0UnJuVEk5NUZjRm1SOHpKN2pLbzFiMWxkM0RsQm16VjdGTWpsQzhtT1Jk?=
 =?utf-8?B?R3k0T0Nkd1JycjVDMDZHL1lob2o1amFBb3Y3WTg5cXBRVXoyc2UyT1BITTZz?=
 =?utf-8?B?T01EOXdYM1JRMUpyZ3RKVFhwL1FrQUhUVkZ4bi9iS0F3aDAvbmNiQXI2cTM3?=
 =?utf-8?B?ZmJPTGNYMXVEd1VncThXb3RyMDlMOXNaZVB4WjI4L3RxQ2tnVjQ4Z0xBU0FZ?=
 =?utf-8?B?Yjk4N3Y1dk5RWFkvY1NrbGhNbXhRNnZ0NFlmK0o0Z3EyL2dnK1VxT25BbmZR?=
 =?utf-8?B?Y3pVeDBsUUkvakVjRHFLdjJVc0FUSVBxc2IyNXJjRW5WSVJrbkFhOENGa0Vq?=
 =?utf-8?B?K3N4aDJ5SzhpUHFVaUU1bzhWMW5UOUNWZXVwcVdDRHdwbGpGV2ExNG42NXNX?=
 =?utf-8?B?Q0V5N1doalREWVlUUFFMcStVWERaenpPeStsZ2VMaUQxQzhNODFGZUVzdzIv?=
 =?utf-8?B?dld2c0I2UTlkOEY2NCtZNC9xMjVTTXFUS1FlR3BCTVJxWUVLdTBPVU9nZnVR?=
 =?utf-8?B?KzZ5TER0V0tpRkxFQis3LzVHMDhMbmFhcjYzV053UlFJb2JUZDEydFV4V2tv?=
 =?utf-8?B?VXRMM05vakpxZmpxZk50cWRWeFJLYU55S1c3SG9POUJKV3hHdmsvNUhFaWJr?=
 =?utf-8?B?WVdWUGZERnZ1T1Z2YWF2TW9vM3J4NmFhS1hxT0FaSXYwZU1qVkRQdUZsMTVX?=
 =?utf-8?B?R2hGaGxkYjlxSTFMTWZYQ3lCS09QbENPZ09POTRFbFQwc09xcGpFbEJySVFI?=
 =?utf-8?B?ZXZCd3VGY2VZcTNoMXYxd0VKWU1GNVlyVHFYQ2x0NGpzRVI2emtHV1RBUkhu?=
 =?utf-8?B?ZWZRcDZQdm9QMkVpNTZINzhJU1ZqMzE2RGhKRjdVV2kzUjZianloQi9xK1FD?=
 =?utf-8?B?MUVGZXpGbzlzM1pLTHczYi9INGhYU3dad3hMbDNtdW1pR1gzRndFbis1QTlW?=
 =?utf-8?B?ZzB2UTk0TndpcjRNMnp2czU2S2JEbmhaQmo5QzNCVDc3NlJWOTJWZXozbkVk?=
 =?utf-8?B?eDhFOTBCb1N1MFlybC93cWFPdzhyTnJ1TWl3NXhUK2lMeUJqZ0xlaWE0ZWFR?=
 =?utf-8?B?S2lHcHJaZDVoOVVVZlhlN2NkVHBwRkMzWG9NTWNvM05nVHg2WnVtSEJ6Zmhr?=
 =?utf-8?B?NTVaRENqaXlnZks3Wm1Welk0VWZ2eDZNbWdIb3VQQ0IxVitpWGdEZ2xpRHFH?=
 =?utf-8?B?VkNrQmwwaEI1N2t0L1FUdzBLQnNrcDg5cS9uWkcveHhZSHN4ZEdlSjJLVHVG?=
 =?utf-8?B?bjBJeitvVDZteWtHd3hMWkFJMTBzREs5NWdlVDJkTlRVaFNBWnJQaHd1d2Js?=
 =?utf-8?B?cGNKUGFrZUtMdmt2My9LRmlQZWlDdHVOS0xXbnFUb3BRcHdzTldjR2xUaEV2?=
 =?utf-8?Q?lEFTd2DHo+1TaAQ8pEAmCvsKrhMS9K4qLAuzo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1FNelpCN0tNTzRCcmhObFJBWmhsVVV4V1FrTUNsR1FleFR1ODFXWWhpRVpr?=
 =?utf-8?B?TnFWU085WkQzRS94Z0VJN2wxNjl2U2h3U0xUSmwxTGxqUWpHREt4a0g5dkMr?=
 =?utf-8?B?d3pBWFkzQVdpT0ZJRDJHVWhjVHlRM3RpUEpUdWdWMjRnME1TM2dRMTV5TXU4?=
 =?utf-8?B?bUkzQWpWbGgxNTUrTWhTZHdCRlpCdWZMNWNZN2RrYUlMQXYxUE5MTUJCRDNU?=
 =?utf-8?B?NUF6YjBXRlh0T3pHc1YwaGdjUExtTFR3U1d6MHVrbWxjcktNQncvTUhDYmFQ?=
 =?utf-8?B?dUc1SWJxbTBjalNzanJqZWtDNGtudTNTbUpJN2hhYWZiTXc2cFV5NzdWQjk3?=
 =?utf-8?B?aWJzSnc3N3NDRXp2NEUrWkZQanNiZzJidnFlam9GeEtCcFJxcHkxd2ZzNlhU?=
 =?utf-8?B?T1NadERmUEl4eXorU282cWNKUjRpZWgyU3VXNTEvUFhvdElkM2tzVTliUHRz?=
 =?utf-8?B?eU5Na2IxTUdDNDZJT21qSGtjUVpGbDZFSE9SVUllWFltNGhYRk1FaW9DV0lX?=
 =?utf-8?B?bEErcTJqZUxiUVVkNWQ1anJBb2dpRGNzLy9nQS9UeDdFcWFPbWR2bkJJZFlU?=
 =?utf-8?B?RVJxc3NUU2prU1BPb0lqZ3hRTEdieVUxeVI5OGdWOC9rUHBteFdTaWNjMlVy?=
 =?utf-8?B?aHJxaDUyWk9FUzg1K0R3RUpaTFd3emRLMzczMkNIakhxU29zNkV0VGhCcGwv?=
 =?utf-8?B?QllKRzR4dFJKWC8zZ09WNVA2KzlRZGlKMUxTaUtvSDI5UEJPZmJaRk4wSUlD?=
 =?utf-8?B?RWZlYms3TVNMOEFqNlg2N0ZqUTd3a3F2aUR0cmZncklpa3U5dWJQeGo1cS9H?=
 =?utf-8?B?T20wbGRLVGdSUFVNUjBOd2pWZm5QNGpLbVBXRnZXcmdnKzdqYnVwRWk0azhz?=
 =?utf-8?B?ZFllT3FxV1ZWQ0o2TG01aldVVzBWR0tiQnovVVN5WTdkZ1lXbVZ4SFU1S0xx?=
 =?utf-8?B?cjNsYTlhQlRFaDFlcFVwNzlCa2o1dXpHWkc5M0JDUHpvbG9GWXNDMWxzZDla?=
 =?utf-8?B?YkRSQWtsd3pQMTMzTW56VnJXc2FHWjRhZlVwZGxqcWptdFh3QkNCakh4cW5U?=
 =?utf-8?B?Y0U3UE5HaXo2TkdJZCtsSW5BYVoxYkJvU01HSzJxZHArZVNxaU1OY2FCNFZy?=
 =?utf-8?B?OGRDR1dYMHNGL04xb2pBMzNTUXpNYXZWTGtnc0dRditOTnpkNWI2VVZLN3Ux?=
 =?utf-8?B?Ri9OekpxTkNwdTllMHZiekxyMVBFZlhOd0tpZlRHZXR1Ym9nd0FFT0VrYy9N?=
 =?utf-8?B?UGNXTlN6NnFrVy8xY3VZUE55Y1drU1NkdXZ5VGRqa056MVZYeURQNDhDZ0pX?=
 =?utf-8?B?Ujh5dGtYMDQ0cHp3cm9GZEpCWXl1VmJJdjhmSm5UdWx4bUZ2UGFjY1VzMXNY?=
 =?utf-8?B?RmJtODhNVnViYXI5QzVtNEJSZzh3cjdxOGlmMEUxN1ZUMkZuQWJkd2R2YUw2?=
 =?utf-8?B?MzR2RENzZ3FjLzlCQXNWTGplUVF1WDJLT0NPbHZ2Y005TUhRTXAzdnhneW85?=
 =?utf-8?B?Z2pNY21lelBuQWY4STdUVUJYVGtEOTBDSy9RdlhXdVNqemp0RGhFK1YxSC91?=
 =?utf-8?B?cmFMaTJ1N3M1SUdERmhnU05JakJsTkFEUHkyVVRlZDFpTHloN2xXdXpPeHFm?=
 =?utf-8?B?ZmFJZEJBSkVHdWhEN1ZadTJzK2RmeDlUS3pKK2ZnUVg5ZnhsS2piKzVia1ZI?=
 =?utf-8?B?RStzYVhKSTFBR0tiZDJham42WEx4NkFaSXJwU2wwTEhzdEZvWWNYdnJNSXp0?=
 =?utf-8?B?TWJiemFrazVlclRrU3NUTXRnYm1xSTFnN0pPN0FOTXBiSTVmQ1cvbVZFM3BU?=
 =?utf-8?B?Ym1ha2tsM1dOTllKdWozMHNwRmpKTDBZUjQrcnUybmtuRzVzbVFkc0xiZEF3?=
 =?utf-8?B?RWpCU0REVkxOQ25xRCtxcXVTUDdWRDhUQjRSWUpybHNHRFR4MHFpOWdRRjFp?=
 =?utf-8?B?SkVDeTJPRjFKSnhrbVhZUGh1bEhTYW1QQ0x4RzNLVVNZRmJ4N2srZGtWZlhQ?=
 =?utf-8?B?bytoRWgxVEduK2p5WC9BTm1wSmYrR05kei9VY0NLcy9rdnhMVlBlWWlWN1Bk?=
 =?utf-8?B?eEpuSTBUVHZHZ09Sc2hXRHBLaCtwZDNxYTJBUGVhUXAvVVRaLzRMV2dKMjBT?=
 =?utf-8?B?bFlTYjlndThLbS9UemFlN3lJTVNxNVVUMjdJY2ZHclpJUFNSenV5ZnM1Unoz?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c47f67d-f3c7-43d5-7281-08ddeca59f35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 17:57:04.2978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GSpOLRkLHOyaDk2fpRxmojh1c8D1Sm6nppBn0hhJ3YgG/XnPOFxAFcxomPpdRpUYj0yUvCdblSDa2jB+wjNU2dT6aLOSBDFCBnD4qNfeBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
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



On 9/5/2025 3:46 AM, Kamil Konieczny wrote:
> Hi Daniele,
> On 2025-08-18 at 17:56:24 -0700, Daniele Ceraolo Spurio wrote:
>> This test will make sure that the error path in the exec_queue creation
>> code works correctly if there is a PXP error.
>>
>> Since this is the first queue creation case that requires an extension,
>> the code has been updated to add support for that
>>
>> This patch requires the matching kernel code [1] to be merged first.
>>
>> [1] https://patchwork.freedesktop.org/series/153095/
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Please reply to CI.Xe.Full fail on LNL, I guess it was caused
> by kernel patch from [1] not merged yet?

Yes. I plan to re-trigger CI once the kernel side is merged. We 
shouldn't merge the IGT side until the kernel side is done.

Thanks,
Daniele

> Regards,
> Kamil
>
>> ---
>>   tests/intel/xe_fault_injection.c | 29 ++++++++++++++++++++++++-----
>>   1 file changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>> index 00d045cd8..778148766 100644
>> --- a/tests/intel/xe_fault_injection.c
>> +++ b/tests/intel/xe_fault_injection.c
>> @@ -339,25 +339,43 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
>>    * @xe_hw_engine_group_add_exec_queue:    xe_hw_engine_group_add_exec_queue
>>    * @xe_vm_add_compute_exec_queue:         xe_vm_add_compute_exec_queue
>>    * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
>> + * @xe_pxp_exec_queue_add:                xe_pxp_exec_queue_add
>>    */
>> +
>> +#define EXEC_QUEUE_LR	BIT(0)
>> +#define EXEC_QUEUE_PXP	BIT(1)
>>   static void
>>   exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
>>   		       const char pci_slot[], const char function_name[],
>>   		       unsigned int flags)
>>   {
>>   	uint32_t exec_queue_id;
>> -	uint32_t vm = xe_vm_create(fd, flags, 0);
>> +	struct drm_xe_ext_set_property ext = { 0 };
>> +	uint64_t ext_ptr = 0;
>> +	uint32_t vm;
>> +
>> +	if (flags & EXEC_QUEUE_PXP) {
>> +		igt_require(xe_wait_for_pxp_init(fd) == 0);
>> +
>> +		ext.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +		ext.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
>> +		ext.value = DRM_XE_PXP_TYPE_HWDRM;
>> +		ext_ptr = to_user_pointer(&ext);
>> +	}
>> +
>> +	vm = xe_vm_create(fd, flags & EXEC_QUEUE_LR ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>> +
>>   	/* sanity check */
>> -	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
>> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id), 0);
>>   	xe_exec_queue_destroy(fd, exec_queue_id);
>>   
>>   	ignore_dmesg_errors_from_dut(pci_slot);
>>   	injection_list_add(function_name);
>>   	set_retval(function_name, INJECT_ERRNO);
>> -	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
>> +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id) != 0);
>>   	injection_list_remove(function_name);
>>   
>> -	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
>> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id), 0);
>>   	xe_exec_queue_destroy(fd, exec_queue_id);
>>   }
>>   
>> @@ -585,7 +603,8 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>>   	const struct section exec_queue_create_fail_functions[] = {
>>   		{ "xe_exec_queue_create", 0 },
>>   		{ "xe_hw_engine_group_add_exec_queue", 0 },
>> -		{ "xe_vm_add_compute_exec_queue", DRM_XE_VM_CREATE_FLAG_LR_MODE },
>> +		{ "xe_vm_add_compute_exec_queue", EXEC_QUEUE_LR },
>> +		{ "xe_pxp_exec_queue_add", EXEC_QUEUE_PXP },
>>   		{ }
>>   	};
>>   
>> -- 
>> 2.43.0
>>

