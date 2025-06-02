Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2978CC5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 12:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C527E10E51F;
	Mon,  2 Jun 2025 12:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxywzvEU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E8A10E51F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748868880; x=1780404880;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9pgZFGMeuV7rwfeiLxAFG507BuF5gK6Kbqxb5iEdFPM=;
 b=KxywzvEUcnGw+7t6rqdKDJRVEVQRiKi7bnz97WdhNZ3gLC+5Qw0O4qkt
 FWJSohRHHnOmq4xL2mBCQ4ZfOU7WhSXqlAwwW0r44trpTtyfPYsYQ9DNm
 p5rNnesHw7g5BtDZLRpQXMB8vUHgorUKQFESgILw9EV/XxzfyA1j6iB8n
 ldkQ4TeAg129vkMU8K32YnjGbDUiTi4U5vS7+2wWi5tQbio0INS4YQsl4
 VYrFEsMeSnAY4hMqqHiLaH01J3wNKzaICEYMiQoTPNwLsEaP1QPwKuiHB
 sxPXeXSv0h626fsNCPaZx/ms4vjLK8xekvPStlFGvGOksae7L2juDjw/Q A==;
X-CSE-ConnectionGUID: N0XuJBkmSWGCPJqAluRyyg==
X-CSE-MsgGUID: JzoaH+PhTYmi3FXckvbNSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="38501809"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="38501809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 05:54:39 -0700
X-CSE-ConnectionGUID: FSKVLHlLTE+46zYy/4YDUA==
X-CSE-MsgGUID: EtMWzfBSTEOQ0iyZerPI2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="167698178"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 05:54:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 05:54:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 05:54:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.68)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 05:54:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wW1YHLEYFblQhT9CA6EUj8792M2UVkEHMlf6LdytmaMBgCgG0QRlfNJShoCnLckLi3T4QRgpZuDgRRxr1OZfZ2EGGvcPPCCiwgv3CgoTmcBFHISxCcjRH5asTQShY9VTWl8oMyZN/htpXfKADRJYBCJuSVOgSU6ClEriyXBG6X5c8BGxIegot2irzaNkOHhhCXHYFzmrl/O31lMfD16XMT9kTutlXsPmzJ6p6enzjwBJXaSvCCjlBADY1OuoGHbiOy+JRHviBX8kdfCEuOc/0/SswUTMVWtRyC447OYqUkcQ2xttofSbGJKKJp/coPK4xwo09dxaX9WknIrVb6fupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D5GjbusEbldyq0n9pA2ZoOCrt7TCiWDRfMlvj5BfyY=;
 b=bP27VKVguebVGY2+GVYewLk8GmOWbRfJtrM9po1X66HVojpYVcU2Hb359E3TXbUNTA6zP2GqpCVsNvQQCOOgr2zE93rZ2UjskkDU4yzdztw1gp55UaXsgEqP3omDIdwdg10QkDR1KITZN8UKFb8Y8ArS/XdGkdZPC+v5y+xGlLGoc82o1hUJAxzVp1P65YgCfiZavSRxdQtAveu7zDkp+vo08C5YoeNxzx0lwOTL5utr1qIDa9APkWUqj/nQpz/iYfei/m1LBhwHoIyc4eHzDAfObregKP7iZ7PqyAXbS80uq0AivvHtLOaZUo8zmSgE/MlDEeK9KCD9M/kUpES7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 SA1PR11MB6664.namprd11.prod.outlook.com (2603:10b6:806:258::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 12:54:07 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 12:54:07 +0000
Message-ID: <cc7d31ed-d17c-461a-b91d-ea137bd5bdc5@intel.com>
Date: Mon, 2 Jun 2025 15:54:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/gpu_cmds: expose num_threads_in_tg parameter for
 tests
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250526001304.2899977-1-jan.maslak@intel.com>
 <20250526001304.2899977-2-jan.maslak@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250526001304.2899977-2-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::12) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|SA1PR11MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ebb39c-7e3c-42a9-1078-08dda1d48f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHVrRWlIdnJHbTYzRjhNQkUyM01UVkRyeHNZZzNtN2N3L25pZEpmNUxFcjcr?=
 =?utf-8?B?VXBXelFVRHVUbllLaDBHYUJQSm00dXdkRjdsamUxYnhrL0tiYnk3aHR0TFMr?=
 =?utf-8?B?b3A3Z3pURVlSbmhaSEgvSy9zQ2dwMisrZlppUXVqL2RBOGRpcmo5dHNNdHlK?=
 =?utf-8?B?SXB2b3ZzRWV4WU5WM1B2MDhqbUc1YU9wc2hha3RGYW41QTJnRWUyTU5pb2Zo?=
 =?utf-8?B?T2xzSHhCT0FYQnFGcU43U1FONFYvSjY0WlRGdnRwQzVTRG5zZXBveUtDQmln?=
 =?utf-8?B?ZkRuQjJpSHpVNk9FMnBoNkxLWCszM3F0ZEVsRm9xeVhmMUcrMjVSYWVuLzNi?=
 =?utf-8?B?Zk9Pcm84S1g4V1NWb25KdUxNa3EwaFhidUVlWWJSSTNpSGVIWFE5QlhKMTdD?=
 =?utf-8?B?L04xMDM4NmQrTzlOS0tYbzkwdmwyb01UNW10NVhpZDdRa2p6dXpMSlFFTWlR?=
 =?utf-8?B?akUycFpmUnZ0TU80SXJLaW9EdUE3RWV0T0NuTFVwcjA2SzFIZHFzSHVmb0tu?=
 =?utf-8?B?dDlxRmdQcW9uMllNd2dyTS8xL2JDa2V4cThXd000QktOYysyU3VTb1FTaSsr?=
 =?utf-8?B?Z3hkejd1ZXdEZzhJVm9LZkZPZVlCNXduQVZiK2ZLeEwvUUYrUy9reHZwVkRH?=
 =?utf-8?B?c010d3V5KzB4T2dSOEZSK3FySFh3UkxBRmdmME03RlJrK0FnMVVpMi9WVVZw?=
 =?utf-8?B?Q0prMkc3bjN6VmF5NVZYbVF4Ymh0QVpsb3BBOWN3bGNZT0xYKzVJOWlCMzhR?=
 =?utf-8?B?ZERFVWVYTUJvb0IwTTBTMk5WZXVEMWFvZU9DWk1GbStlWHZLQkJjV2I1eGJ0?=
 =?utf-8?B?TlJuK0diWHNCc3ZSalN0YWxpUVVjSGU1elNZdEh6eUVML2FxdURzYW80ajFX?=
 =?utf-8?B?cW0wVStWQXpnd3h5ZFZYcUJBV0Nmc1d3QVVKbnBPem1vU0kwNnVIQ1hvZzdZ?=
 =?utf-8?B?ZlJaUkhzUWNTbGRFL1lJTHZjSG84RXZlZDU0QzIxcloyKzA1VDNYcFdUdmFw?=
 =?utf-8?B?RnVRbm14OWdzMkMvcnhRZ2RCNmRKd2dudVU2VUh5REtpcGh1dnRnQTNGTmJq?=
 =?utf-8?B?MmVCSTRIYVo3YktpTHE2bFBwajFpUVpjQWI4enI4bks3eDdWWmV3M3hEb2ZT?=
 =?utf-8?B?Yk4zSkN5S1p4S2F6ZUNvbVI3L0E4bWpHaXlnSnhmbUVheCt1L1g5UTVRZ2FE?=
 =?utf-8?B?RC9aNUdlL202TkxFZXB2VDQ4QWQ5Tm8vck9PUmlSd0JmSW1LSDREcDY4QjFj?=
 =?utf-8?B?bXJLS1JNeFpEUnBhTGhscy9PWCs3VitJZUlDNm1ob3h3NE56UEFSaDBYNGJz?=
 =?utf-8?B?ajA4MWp3a09ORXEvSHFVckZwa1dhbmpmczFCL0tUMHRsOG9MUmozYVNOaTUy?=
 =?utf-8?B?RVZuUXE1OHB3eURMK2lkcWs1YzRWVDltN1lMVUdtWVNrSXZ6bWtlL0JOTElZ?=
 =?utf-8?B?WWpKb2NsK2NZQzYyS255ejJvRUsrVFo0Q1VEOFhibCtZRjNVT3hDNFUzS3A4?=
 =?utf-8?B?VFczS0NkZUdQVTl0cmczL0JVRUFBUzV5cDV5OHMrZm01UklzRkdUVi9SWlAw?=
 =?utf-8?B?OWJNYVMwNlRoenpKRCttWWVhdHBnd2dTNGNpM1dMMkJrU24yd3g1QTFreElz?=
 =?utf-8?B?SzRjcDNHYlVBdHhIS2hremdiRGt3bUxTK1JVMWJVY3JDRnBqR1owaUgrcGkr?=
 =?utf-8?B?eSswUC9sT1RPbFdqcGw0VnFYMzgzWkt3K0ZDNll0UTdabTRURzRkZ0w2dHpr?=
 =?utf-8?B?Z2hFcngyOHNQS0lYRmxMcldjYnh3MlBNUkw0VFpVaXRXSlAzQTlQUHc1NUhT?=
 =?utf-8?B?UFRBMlZyMVpwNHZ4b1JJZnR6U3pXRDR2R3hSQkYvQis4ckJaSm1BMHRRbDVk?=
 =?utf-8?B?TUxXUGpJa2tudEV4bmVlaFdGeU9aZVpHNGhkLzJJREZYSlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUtBbE5HSldpeVIyb2NIS2JEYTZuNG5ZZkJlbFVXa0M4enRxUVgzMm8vWFFk?=
 =?utf-8?B?aVpjK1lITkxWSlB4bDZJT1FFSjRiZ09xMG9UeFVleHY3a0xmSE0yNTlTUTNJ?=
 =?utf-8?B?SXU1MkU0ekNlc05rOXVyU0JYaS9SdE9na1NGMnQrdmpJdUE4dHNEekFZVk81?=
 =?utf-8?B?ZXdOSWtrM3B6WEFtYlYvajY2d2gweDRSbk0xRDJlajZhQjZVWHc1cnc3TDZO?=
 =?utf-8?B?Q3BScFhiY2U2WGVXQzdvc2NMTzU2eWN3UzhuSG84aHBFcUJxTUlxbkYrcEtM?=
 =?utf-8?B?MXRiL0lYcnFnbTcrcHlBTktRZ3RVZnhzZldzRElhekFwYkJyMllBY0Y1QlRr?=
 =?utf-8?B?SWRwcU45bS9TakRuUVZnR1dsb3lPSmplVE1TeFJ1VWFXRStBSFV2YW5NUDBC?=
 =?utf-8?B?WFlYdzF1MWR1ZWxsNEFKNTEwQjNXZkJuakU4dzhuVG9XaDFsdG9yZjRkOWlm?=
 =?utf-8?B?RGM4Wjl1ZmtBd2syS3BsZmp0VzczS1MrUXFkbU5TUWRKWjVuTDRQYzlKcWFL?=
 =?utf-8?B?Zi9oandua1RSYytmQmxKN0ZyMHdtRzdvRGxUdmZuaEZwQmlWZkhUWmhHRkI1?=
 =?utf-8?B?bC9CZEVKSmp5T0lOSVIzb2FSNkxWV1puNWR4NGdOaW0rM2h6ei9vTnV2cXRr?=
 =?utf-8?B?MUw5NjA0SVYrSHMrQ0RjL1Y2OWN0eEVoSUVtNXM5YlQ1Zm9ydVB1cUlDRmlW?=
 =?utf-8?B?UStkNU1ESkdFK2RLTUM4QmlkclhGcmRuSXpqWGpBWG1aK2twa0NxZWYvQ3lv?=
 =?utf-8?B?VHVpOG9IdDl2M3pmUTk2ZHV1c0RjKzFoZnROamtNQzMxOGtsOGlFUGN5Ynov?=
 =?utf-8?B?QU15R2V4ZVY5NTJaRWFJOTNURzJ4TU5qS2ltRm1Sd1FzenlCb2xvTjZpbCtZ?=
 =?utf-8?B?cW96SW84Ti9HdW0wVUZkTXM3MFdzeGszNHlzOWRlRm4yQkFzVERWNlNzOXB4?=
 =?utf-8?B?L29jZlhvNTlBd1E5aHMwMzE4MTMzQkRqNTdyUmxmdytkamxwUkFUelpiL1FF?=
 =?utf-8?B?Q1FxYzQ4T0ZtNnN1dzY1ZVZlK2k3NnpPMWZUSmpBZ2FlVnpjbFVtZU9KbWxO?=
 =?utf-8?B?YnFMcmc4aUc4emlIeTM5NmNvSnl5VnMvZFVKMGNLNFJoVmFGdTBna3ZPTVdl?=
 =?utf-8?B?TDVRM3VkSTV5Q01HeU43MzZKc2hwdkZuSFJyT3g0S09YZmppb0Uwa1A1VjJW?=
 =?utf-8?B?L2hRR2gvajczRlpZaW1mQzFWazlTRE5HRDFnQVJ1aCtvRTg0UEVLVGR3MlNI?=
 =?utf-8?B?QVNWVXpWNWVXbGtJSnJDVHY2ZFZ6Q25oL2gwNnZCNlJCKzg0eU4rNkhSVkxK?=
 =?utf-8?B?cDZySTNMTEVzZGR3YStMdGd0ZlplelNoU1YzOHBUeTczc2FsNzJseHhNL3g0?=
 =?utf-8?B?NUx4K0NiT0RPYkJHZm8vYXkvTm9MOGNtSlZ5d2lLMmV3T2lqbnp3a2orLzJa?=
 =?utf-8?B?eU1ZMjVMZVN0QnV0bWEzMUdHYzlyNFlXOVBqZ0FHWitmWVRvaXR6QldHeStP?=
 =?utf-8?B?Q1BCQ0lnNFdaRXNCMzl2TE9pQW43K2dGY3lsT0p6TWl2TzJDR3g0a2xVTFRh?=
 =?utf-8?B?ditKbFdPNTY2cGlabGcwYUhNNlZXczRsR2JGRldqUWZsejlmcFczTnFmRVZx?=
 =?utf-8?B?SFMxQXNKQmFEbUs1NklhUm5naENNREpxSllyUnlBUUhocDRVUmhDNEJjcnUw?=
 =?utf-8?B?Z1YzL204Wjh2dERXUEt0blB0STVCbzRPaUFxQUE0Y3hodGViZ3RDQ3dSc2or?=
 =?utf-8?B?dFRlM0tBM2dlRDQwWFZXLzNKbjJDSVdxSFRYVGErQW1mcWJJTDdzWlltRlY4?=
 =?utf-8?B?WHlHdkFMdmo3eXloK3BtUEF4N0FLUDZxajVmMENJcXpPUmtscnIzWVlJN05M?=
 =?utf-8?B?RVhNTGozenpJaEt1di9xWGx1LzRHNDhROFJiVDNsZldNaDBRTUZ5TC8vTnM4?=
 =?utf-8?B?dUNBeFFUZkpRSXcyQ2dvYmtNczAzNmxrcUxzeTF0NmUyMjk1Wk8vZTVQZTJv?=
 =?utf-8?B?RXNTQ0pqY3RlZk1hbmtxZnhsL2JleFUwUHExR1JxV2gvMTVxTHIzWlVoNDM2?=
 =?utf-8?B?anJnMGVYWEZaTWlWYm9CYkN5SnU5MlpsY1NKS0ZQSXBkanNQWmZXZmx1ZUI3?=
 =?utf-8?B?L3JQc1VaUjVKSTFUYmpOK0hPdFFzSWpUbUd1eGllL2dLb08yblRmeWlvRFlw?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ebb39c-7e3c-42a9-1078-08dda1d48f93
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 12:54:07.2600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNkHS4CS4TTjbRR5E5Q+LhDC4I0xTJPljKSXfPiAKz2iGy7qFkp8IUGKgCJWRH/iiV4pQbVCxD9whXK+UD/Wr7jTcJKqh+3qD404jLMnXbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6664
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

Can you add a routine to check the maximum number of threads that can be 
used per thread group for each platform?
And the reset looks fine.

G.G.

On 5/26/25 3:13 AM, Jan Maslak wrote:
> Expose parameter num_threads_in_tg in (gen8|xehp)_fill_interface_descriptor
> functions, so that it can be set from the tests.
> Also update rest of the code to accommodate this change, passing in
> the default value - 1.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   lib/gpgpu_fill.c                  |  6 +++---
>   lib/gpgpu_shader.c                | 16 ++++++++++------
>   lib/gpgpu_shader.h                |  1 +
>   lib/gpu_cmds.c                    |  8 +++++---
>   lib/gpu_cmds.h                    |  4 +++-
>   lib/media_fill.c                  |  4 ++--
>   lib/media_spin.c                  |  4 ++--
>   tests/intel/xe_eudebug_online.c   |  2 +-
>   tests/intel/xe_exec_sip.c         |  2 +-
>   tests/intel/xe_exec_sip_eudebug.c |  2 +-
>   tests/intel/xe_exec_store.c       |  2 +-
>   11 files changed, 30 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
> index f83eee5f2..09408112c 100644
> --- a/lib/gpgpu_fill.c
> +++ b/lib/gpgpu_fill.c
> @@ -203,7 +203,7 @@ gen8_gpgpu_fillfunc(int i915,
>   	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
>   
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
> -				gen8_gpgpu_kernel, sizeof(gen8_gpgpu_kernel));
> +				gen8_gpgpu_kernel, sizeof(gen8_gpgpu_kernel), 1);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> @@ -254,7 +254,7 @@ __gen9_gpgpu_fillfunc(int i915,
>   
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
>   							      kernel,
> -							      kernel_size);
> +							      kernel_size, 1);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> @@ -350,7 +350,7 @@ void xehp_gpgpu_fillfunc(int i915,
>   
>   	kernel = __xehp_gpgpu_kernel(i915);
>   	xehp_fill_interface_descriptor(ibb, buf, kernel->instr,
> -				       kernel->size * 4, &idd);
> +				       kernel->size * 4, 1, &idd);
>   	gpgpu_shader_destroy(kernel);
>   
>   	intel_bb_ptr_set(ibb, 0);
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index a63af0d23..b83e645e3 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -99,6 +99,7 @@ static void
>   __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>   		      struct intel_buf *target,
>   		      unsigned int x_dim, unsigned int y_dim,
> +		      uint32_t num_threads_in_tg,
>   		      struct gpgpu_shader *shdr,
>   		      struct gpgpu_shader *sip,
>   		      uint64_t ring, bool explicit_engine)
> @@ -113,7 +114,8 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>   
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, target,
>   							      shdr->instr,
> -							      4 * shdr->size);
> +							      4 * shdr->size,
> +							      num_threads_in_tg);
>   	idd = intel_bb_ptr_get(ibb, interface_descriptor);
>   	idd->desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
>   
> @@ -162,6 +164,7 @@ static void
>   __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>   		      struct intel_buf *target,
>   		      unsigned int x_dim, unsigned int y_dim,
> +		      uint32_t num_threads_in_tg,
>   		      struct gpgpu_shader *shdr,
>   		      struct gpgpu_shader *sip,
>   		      uint64_t ring, bool explicit_engine)
> @@ -176,7 +179,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>   	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
>   
>   	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
> -				       4 * shdr->size, &idd);
> +				       4 * shdr->size, num_threads_in_tg, &idd);
>   	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
>   
>   	if (shdr->vrt != VRT_DISABLED)
> @@ -241,6 +244,7 @@ static void gpgpu_alloc_gpu_addr(struct intel_bb *ibb, struct intel_buf *target)
>   void gpgpu_shader_exec(struct intel_bb *ibb,
>   		       struct intel_buf *target,
>   		       unsigned int x_dim, unsigned int y_dim,
> +		       uint32_t num_threads_in_tg,
>   		       struct gpgpu_shader *shdr,
>   		       struct gpgpu_shader *sip,
>   		       uint64_t ring, bool explicit_engine)
> @@ -253,11 +257,11 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
>   		gpgpu_alloc_gpu_addr(ibb, target);
>   
>   	if (shdr->gen_ver >= 1250)
> -		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
> -				      ring, explicit_engine);
> +		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, num_threads_in_tg,
> +				      shdr, sip, ring, explicit_engine);
>   	else
> -		__xelp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
> -				      ring, explicit_engine);
> +		__xelp_gpgpu_execfunc(ibb, target, x_dim, y_dim, num_threads_in_tg,
> +				      shdr, sip, ring, explicit_engine);
>   }
>   
>   /**
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index ca996d574..411ad6292 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -60,6 +60,7 @@ void gpgpu_shader_dump(struct gpgpu_shader *shdr);
>   void gpgpu_shader_exec(struct intel_bb *ibb,
>   		       struct intel_buf *target,
>   		       unsigned int x_dim, unsigned int y_dim,
> +		       uint32_t num_threads_in_tg,
>   		       struct gpgpu_shader *shdr,
>   		       struct gpgpu_shader *sip,
>   		       uint64_t ring, bool explicit_engine);
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index a6a9247dc..5c6a6e632 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -424,7 +424,8 @@ uint32_t
>   gen8_fill_interface_descriptor(struct intel_bb *ibb,
>   			       struct intel_buf *buf,
>   			       const uint32_t kernel[][4],
> -			       size_t size)
> +			       size_t size,
> +			       uint32_t num_threads_in_tg)
>   {
>   	struct gen8_interface_descriptor_data *idd;
>   	uint32_t offset;
> @@ -451,7 +452,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
>   	idd->desc5.constant_urb_entry_read_offset = 0;
>   	idd->desc5.constant_urb_entry_read_length = 1; /* grf 1 */
>   
> -	idd->desc6.num_threads_in_tg = 1;
> +	idd->desc6.num_threads_in_tg = num_threads_in_tg;
>   
>   	intel_bb_ptr_add(ibb, sizeof(*idd));
>   
> @@ -912,6 +913,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   			       struct intel_buf *dst,
>   			       const uint32_t kernel[][4],
>   			       size_t size,
> +			       uint32_t num_threads_in_tg,
>   			       struct xehp_interface_descriptor_data *idd)
>   {
>   	uint32_t binding_table_offset, kernel_offset;
> @@ -931,7 +933,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   	idd->desc4.binding_table_entry_count = 0;
>   	idd->desc4.binding_table_pointer = (binding_table_offset >> 5);
>   
> -	idd->desc5.num_threads_in_tg = 1;
> +	idd->desc5.num_threads_in_tg = num_threads_in_tg;
>   }
>   
>   static uint32_t
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index 846d2122a..20e35f9bf 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -55,7 +55,8 @@ uint32_t
>   gen8_fill_interface_descriptor(struct intel_bb *ibb,
>   			       struct intel_buf *buf,
>   			       const uint32_t kernel[][4],
> -			       size_t size);
> +			       size_t size,
> +			       uint32_t num_threads_in_tg);
>   
>   uint32_t
>   gen11_fill_interface_descriptor(struct intel_bb *ibb,
> @@ -121,6 +122,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   			       struct intel_buf *dst,
>   			       const uint32_t kernel[][4],
>   			       size_t size,
> +			       uint32_t num_threads_in_tg,
>   			       struct xehp_interface_descriptor_data *idd);
>   
>   void
> diff --git a/lib/media_fill.c b/lib/media_fill.c
> index 88d83061a..a2f2e8666 100644
> --- a/lib/media_fill.c
> +++ b/lib/media_fill.c
> @@ -205,7 +205,7 @@ gen8_media_fillfunc(int i915,
>   	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
>   					gen8_media_kernel,
> -					sizeof(gen8_media_kernel));
> +					sizeof(gen8_media_kernel), 1);
>   	intel_bb_ptr_set(ibb, 0);
>   
>   	/* media pipeline */
> @@ -250,7 +250,7 @@ __gen9_media_fillfunc(int i915,
>   	curbe_buffer = gen7_fill_curbe_buffer_data(ibb, color);
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
>   							      kernel,
> -							      kernel_size);
> +							      kernel_size, 1);
>   	intel_bb_ptr_set(ibb, 0);
>   
>   	/* media pipeline */
> diff --git a/lib/media_spin.c b/lib/media_spin.c
> index d2345d153..2b81e99d1 100644
> --- a/lib/media_spin.c
> +++ b/lib/media_spin.c
> @@ -109,7 +109,7 @@ gen8_media_spinfunc(int i915, struct intel_buf *buf, uint32_t spins)
>   
>   	curbe_buffer = gen8_spin_curbe_buffer_data(ibb, spins);
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
> -					      spin_kernel, sizeof(spin_kernel));
> +					      spin_kernel, sizeof(spin_kernel), 1);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> @@ -149,7 +149,7 @@ gen9_media_spinfunc(int i915, struct intel_buf *buf, uint32_t spins)
>   
>   	curbe_buffer = gen8_spin_curbe_buffer_data(ibb, spins);
>   	interface_descriptor = gen8_fill_interface_descriptor(ibb, buf,
> -					      spin_kernel, sizeof(spin_kernel));
> +					      spin_kernel, sizeof(spin_kernel), 1);
>   
>   	intel_bb_ptr_set(ibb, 0);
>   
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 1f72e3e44..3d138bdc3 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1115,7 +1115,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	sip = get_sip(fd, c->flags);
>   
>   	igt_nsec_elapsed(&ts);
> -	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, sip, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, 1, shader, sip, 0, 0);
>   
>   	gpgpu_shader_destroy(sip);
>   	gpgpu_shader_destroy(shader);
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index 062b80a08..c5e431670 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -146,7 +146,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
>   	struct gpgpu_shader *sip = get_sip(fd, sip_type, height / 2);
>   	struct gpgpu_shader *shader = get_shader(fd, shader_type);
>   
> -	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, 1, threads, 1, shader, sip, 0, 0);
>   
>   	if (sip)
>   		gpgpu_shader_destroy(sip);
> diff --git a/tests/intel/xe_exec_sip_eudebug.c b/tests/intel/xe_exec_sip_eudebug.c
> index e5b8ba418..b723b0b58 100644
> --- a/tests/intel/xe_exec_sip_eudebug.c
> +++ b/tests/intel/xe_exec_sip_eudebug.c
> @@ -138,7 +138,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
>   	struct gpgpu_shader *sip = get_sip(fd, sip_type, shader_type, height / 2);
>   	struct gpgpu_shader *shader = get_shader(fd, shader_type);
>   
> -	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, 1, threads, 1, shader, sip, 0, 0);
>   
>   	if (sip)
>   		gpgpu_shader_destroy(sip);
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index bf22c3475..364169fdc 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -390,7 +390,7 @@ static void long_shader(int fd, struct drm_xe_engine_class_instance *hwe,
>   	gpgpu_shader__nop(shader);
>   	gpgpu_shader__eot(shader);
>   
> -	gpgpu_shader_exec(ibb, buf, walker_dim_x, walker_dim_y, shader, NULL, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, walker_dim_x, walker_dim_y, 1, shader, NULL, 0, 0);
>   	intel_bb_sync(ibb);
>   
>   	ptr = xe_bo_map(fd, ibb->handle, ibb->size);

