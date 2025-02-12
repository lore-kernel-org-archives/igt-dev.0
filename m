Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEDFC021A1
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 10:51:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7F910E84D;
	Wed, 12 Feb 2025 10:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gh2LwVXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E9A10E84D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 10:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739357481; x=1770893481;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=slqHoqnUajyiWeSgRYTs6PXySYWclJ1Uw2CZtEi1ik0=;
 b=Gh2LwVXGv5hr35GoI2vcQw/FFfCf/srMrhKyx5lUE+V5j10KjTa3r50P
 lTW8PV9Syvcp7f5sE9PfsxE2KsW/+eazw6vFM8YT55WyYUx2qYz/bxx9U
 lvVLTdiQ8PgwcoImnLPQExJMgdPRcVGaDhLrR5TmKCio285qHD6uZB4g5
 jdG9AkKBvyJF95bDSmwd1ndMAX+1v61f2ekkprpw4hof6RwJ3JhRDgVLi
 6ehxZJKj09Qai5bGeK4IjObJa8+moaLOB5mSxLivn++5ZYj2av6c+Bsog
 ncaq87LEDSBAq27rxBxB/0yi7bTUlSqQyWocNRYKFTqEaB3c5Ow6ZHsIj g==;
X-CSE-ConnectionGUID: rzs1RZkET+S7i5869mq2zA==
X-CSE-MsgGUID: eHhQqruzQgyr3uiAWz1L/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43663153"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="43663153"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 02:51:21 -0800
X-CSE-ConnectionGUID: GgL52EBWTRS3BtxVsFM2Kg==
X-CSE-MsgGUID: tN+ltJY0RpSQvnjziCpW6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117968219"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 02:51:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 02:51:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 02:51:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 02:51:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3sN+l9LiTbFnUHXo2JBtOjP1U06R9pEfeoVHMa8bBilpfoEOEfZcU84zfpAY1lXUwc6cUW0Sq4WygrwNaKLeBKbqUL7uHkRBubUTK9Sv9xc8mg/abhS3uWhfVUJAhc0fswG29PVpM6ocqmFyWer7vIWooinZ5Kvu3dZ6ewQNV223D7yyMFd4w8BOCOBUFpL1sBud63iGBB4dqTmF2yA0jls8aj0ef5j635zEuWH1RRskQIrGnAxTFDXxqFySRo+UdqyUiPIvt04hiAPsX01MehwgpKPaqjIMsFQra6WfusMHV9Duhwi5ZMQq+T6Sv7UMt01AYk1e/Sb7bXBj3pakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kErQRJUlpyJmsgILyh40ofico2QVw+NT181RxhlPlmU=;
 b=jjl7WKeCBDenuypZcJF4sEYjCP+OBh/p9RVUS240PeL4NygtMphjx2u0RN4c399wBOGCi6rxeuTeQybXwfjcG6zod8FT1bF7OCsmqI1RBGLBfEp4Ef5I0kjgXEuZPFMRfW4NuFTriepMg1IKz+zGaUxMvSWjV3pueAvG8jGzwew+aXou2Z398Lj1H7rJDEtFUTb54PFuWjIWmfatBUQqcLYtXSHHdOnCZpQH9m2bWA8wgDeoWJiyWNZBq9HhL4o2lh+N5EuOSDKJsSReQ6nAQzCMhbBIWxU1D8DrR5XAP1P3tGP9PmKlSWoFxQwmE6LqsKxZi8STyPytwH4+02U12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 10:50:50 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 10:50:50 +0000
Message-ID: <ba867e47-6f54-4c6e-8ea9-20dce5f58a89@intel.com>
Date: Wed, 12 Feb 2025 16:20:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/kms_joiner: Add a new test to
 validate non-joiner mode
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250212073604.1580120-1-jeevan.b@intel.com>
 <20250212073604.1580120-4-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250212073604.1580120-4-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::26) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: e1c5fb91-d408-40ab-02f3-08dd4b531d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVdpQmtYMmFTTDVvWHF6ZkFET010WFpYek5jb25ybFRsQ1p6SVdyckRSeU1W?=
 =?utf-8?B?M0xZM1l1amZ5SkVuYi9kRTZNZC9KWTVrdm0xSXBwRlp4dmROemQwNTVVN2FY?=
 =?utf-8?B?UVIyNUJxZWYxQnJGU3RaVFZreVA3ZDAvaEFxZ2FZR2c5R2RSejRGNCswK0M3?=
 =?utf-8?B?MUtCdEdkajdzOWVWODlBdlRqVkRYVUlMeitleFVvU2UwUUZieUR3ZWtFTDAv?=
 =?utf-8?B?cit4V2hxZTVZenpDR2tyWWVxS0gvSkZsdmdYcGNzT25VUXBGYTBIN1V5U28x?=
 =?utf-8?B?SVg5eTFRb3huMmtPUWRNM2dzcUl4bEUzdzJURHltSlR5MitRMUR0MnQxYjJX?=
 =?utf-8?B?MUlHcDlxNHpNUit2cGVJTjlZcFQ1TnFPY0J6ZGZCUytwNnFpZkt2UlJPVHg1?=
 =?utf-8?B?YmszNjlLckVvVTRYWlU3bHpOS1daVmNSVUtVbC9NMFNnSDdGeXhTY3FDWEpt?=
 =?utf-8?B?NXRVKy83Umx2ekVZcDVSNlZoNVk3aTVZVDNiM0ZjanpCc0J6N0hOSUlXUjJ6?=
 =?utf-8?B?aWVhL3lHMk9kcndwdHhraENvK3JVeEZKVGFQRnFYT21lWEJXdkJIQjJOU1lD?=
 =?utf-8?B?bE1CV25NQjdrZjY5SHh2UktDdktGalpnUFhqUFQzV1FCOTNMOEZTbHZndkRS?=
 =?utf-8?B?cmp3aXRhWnBxSEh6eHNDRktZcHBSM1d1cDJiWHZOVUxBKzQ0YStyUmRFODdW?=
 =?utf-8?B?NnpkdGY4SVdSNlBuRFVXbG9CK0VDYXpCdDJETVhKWFE4eUxPRkozL2E5cWRy?=
 =?utf-8?B?R0E3alFvVnVzZU0vZm95MlRPZndBK1orelh2UkVXSVhTNXpzRkdHYjAyNEZW?=
 =?utf-8?B?NWw1UDIxUUlFZmNYSTc0cjZGNEtzK0tJSEwvbDRwUlZ2SU1mZHlnTytPQ2xB?=
 =?utf-8?B?VlhIZG9rTy9kbkdiUzFBeUVVQ0Z3WHJsLzBVd2QzWjVaZWxuNWFicUU0SXZK?=
 =?utf-8?B?YkxXaDFjSzhYZW95bWplSWp2Wm9YN1RrK1R6RXZTbXlpbDYzUnBXL0V1UUlm?=
 =?utf-8?B?U215MjFYbW13SlVzUDNQWHZSQ3ZEOFNJZUt2eEtiOUxEbHhka2ZCZy9XM1pa?=
 =?utf-8?B?aEJXNmRyYndCOWF5T3FDZnRubzlSekZRYTI2b0RENFk3WVhvRDc0azNDSVBX?=
 =?utf-8?B?TUhnMFQvUzdjRW1CTXZIa3F5NGtzcDl4SFoxU25CS3NqS3pxYjdBVWsvYW5K?=
 =?utf-8?B?cG5GNFJoYTd6bkVwN2VPbGxkcWJnMk1jVDlyT2ZuZXErdHNmNStxRmptT2U2?=
 =?utf-8?B?WXcvQ3RvL3Z4WngveTRHMWZMa1plZW4rNStJM0lHeWJBdWJBQTMrYVBSa2Ja?=
 =?utf-8?B?bTh3NitlTDVTRnhURkdnb1NSd3BJZ24wTVlTTzUwenRDamxKR1htQ29ESjg5?=
 =?utf-8?B?eUY0V1U3OXc3Z3NRV0xFUHV4K2VqSXIzQ3JnOEZHZ0hQNzBzWm5YRXY0UHpj?=
 =?utf-8?B?am5GVmZiRlRPVlBRWDFMOUZQS3Z1UGcxZWdyWnRKOU5JdEV3aCtDdExoTnhl?=
 =?utf-8?B?T1oxNThPMGpvWUFSUWxoOGhGVkpuRXNwMVNYQmNYb3FXc3kweEltKzkrbHkx?=
 =?utf-8?B?MjUwZ3JqbzJsY0IzRWt4NWFBTTk1NHUwdk5YUTZkQy91a2tFUEh4bWZKTnAr?=
 =?utf-8?B?UVNob290MkRrLzdFV3NYMlhzbm1iRDQraGo0VWpPNWxMVElJUVZHZzRpV2lF?=
 =?utf-8?B?K0lTc1FzTEZPQXN1dkpKWklRRFNKZFlKdzkwdWNVNlI2MVExcHNEeGE3ZG1q?=
 =?utf-8?B?cVRNTEw1TlJjdzdDNVk2b3FGNTNZbkU5Wi94eGo5SmQrcS81RURKRDFBYXFJ?=
 =?utf-8?B?dllDUXlrbXlqOHFETmZkVjJ5VXoxWk1DM0dPK2E0UW1VUlB5L2pncW1aTElE?=
 =?utf-8?Q?7Ds0Ps9uHjgxZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdDRERLaGNzL1FRR1RxQ0IrdkZLckxuVmZkUFZPQTkydVhrRDJmZExjY1dk?=
 =?utf-8?B?cFdzcFFTMW81UWxOWmdYanNmYzhoemR3c2tidDB1MTdDYlJSdWhpTlFyNHNL?=
 =?utf-8?B?OHFlaGdTZ1F3WW5QeWFzZzF3c0xUbUNPK3VaVXlhcEY3UUFRU2NTcUNaQnpJ?=
 =?utf-8?B?Vm11Q0xwbzhNU08xOXpDUEVIN1ZXTThTMVFzd2F1UzZMQzc0NEljU2xXd005?=
 =?utf-8?B?WHNmbFRVakxPTUw0U3VkeGxhSWRCMDFid1RTaEs4K1V0UkFldzZjSlJrN1lo?=
 =?utf-8?B?TmhkVkVvb2RjT2s3VkYwWUZSOXR5V0lXeldqV1pBWCs2YWt0UUVQMVVGQU4x?=
 =?utf-8?B?MjRwR2ZxTEN3dUZHRkJzSWxtRmxIZzB6dVU1bmZoVVFoYmw3QStlT3BkaFBR?=
 =?utf-8?B?UkxXSEVLNXhrdXo0MU5QY1d2eFRQMzc0REdVRUp3RDlucTFOYXVrM0xPSWdP?=
 =?utf-8?B?ZkpzbC9xbmVqRXpVaVpYYTdPb1p6c0NmWm1JMWRJVFEwN3l2cTNTcjJDelNl?=
 =?utf-8?B?Q3c2RFkyU0hoaStQNVlBemRtb2ZUclhKNGVkOTd0V1pGNWNjM1d5b3dkYmNk?=
 =?utf-8?B?d2dWSllRQmZ5UG90NGR2MHgweFZKY2tVdXBTZGhLVVhHa3o0clRiL1praGFG?=
 =?utf-8?B?NUs3OWNIenpnVmNVMjFrdTNtVXhOZjBqT1Qzb1VQREZDOEIzS3BDcUdGSG5a?=
 =?utf-8?B?RkNoblcxSjh4M2hsajUwbHZ1d3h6NHNOeCtmK2E4Sm4xenVlSUczdDMxdysx?=
 =?utf-8?B?REhpa3N1YkN0TW1aS3RoTjRZNjdVRC9oWGowYlBXYWRIa1FidnVQVUZURUZC?=
 =?utf-8?B?bVRkcGI0VlZVVHpKZUFlbkJSRDd3SERlQVpZNlEyZUxXV3h2Y1FMOTFMWm5s?=
 =?utf-8?B?OWV4cGpBVTgvYWVZbkRIYnNSKy9TaUZsUDJGMUN3OWQ3b295b0Rybk5TVitZ?=
 =?utf-8?B?TXZpNVZhNmRHU2JySEM5MUlLWXJjMGRkSUJKY3E0Q2FjaUpRL1NYWWo0eWE2?=
 =?utf-8?B?S2RmZUdnRlNmM1hwWjdRM2FuSmd1OTBraWVLdFhSSVErRFlCUjlIeklZTnY0?=
 =?utf-8?B?SDczaS9LR3B6Q2o4eFR4YUdhWlpqajRBOEtrbFRlRWdGK0tPeDB6b3kwRGVr?=
 =?utf-8?B?MnFzNjRmd3NyYzZzZlNUMTg1bkdZVHZoVVBudmo0WHBSQ3BiVUFGaCs5bjFz?=
 =?utf-8?B?V3lYbmhsVlpiSWxpU2dqWTQvMDVrMm1IbG5pRlJDbDRXM1JCdVFBc3Nhc1lo?=
 =?utf-8?B?Zkg2Q2FQL3p6dnByZWNIQUY3WFN3czJ6LzlNNk0wS3MwUGkvb25rSm5qS1F1?=
 =?utf-8?B?bkFoZ1pqOWRrdzhjU3kvRDdFOEdybDJvcmRhQkQzRVBrbDRmMkFIMU9sVVFW?=
 =?utf-8?B?dXdQRGtQSHUvNlZaMy9xTHc1VHE2QmdBMld6aUl5bU9wNGVrL2dQd3FpUER0?=
 =?utf-8?B?M0dUcHBNbzloNHNRVkhpNzVycTBlYTJibWZtMVZsZ2Y4aGhtWUlBWnlNbXh6?=
 =?utf-8?B?UEZEVjI5Yk1IZXY0QVdSL3dQSU9pN0o2aGJEMFJOVy9jdk84dW9iV241LzRm?=
 =?utf-8?B?MG9Fa1FMQ0QzNXNOaldjbnd5L25SMnV5bXpIbXZJQnhGQWNaRFk4aElTSWJh?=
 =?utf-8?B?VVlEcFFQVXp2WFlMdklnWkVPOTVwR0ZpS0taZXVNNTJpdVB0aFlGMTNteGoy?=
 =?utf-8?B?cy9CZnpaNW1hYWE4RVMzclBQOE9nSkE1cFVSbWVHR3QwOXg0VndHVWIrUi8r?=
 =?utf-8?B?MWdTdEJLNVovWWs1WnJkRnZobUlQWElwbE84Z1NXTXoyZjNaOXdtWUFrNElF?=
 =?utf-8?B?bVdrc3NuaVovMEU3UCt3M3JjRjZacUNWV3dwUlMzV0hxeEFaMWFaV3FPZjJZ?=
 =?utf-8?B?bGRUaTEzT05lSVl6ZXBtYW12d0NYVURDNlNFWHE5dTN0V1pDMVcrY2FRMTNz?=
 =?utf-8?B?VnhIbmJPYXIxZDMwZkRJNHJJNzR0NFFXM1Z0dlZsYjMwK2pSK0J0TXNqbDh3?=
 =?utf-8?B?Q09rRXdEODZUbWRTU29heEcwak9wOXJtMlJzdUF0TXRITklQV1kvNWJuYmx6?=
 =?utf-8?B?RHF6OVZMV3JiaEJucFJtTzhNdW1kNmV0eTdVL0x4N0pKVjlIczZZSndLa3lK?=
 =?utf-8?Q?2m74VYhKUCtpHX2RBN2XiQG3i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c5fb91-d408-40ab-02f3-08dd4b531d4c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 10:50:50.5812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ROGn2AEkZuEHse6iu3E9WMtjuuRlPlTmAWIxzxMfhq9xLVWHWP31eJmdwxJgzEOzIfvdh/0NZo5CdLBUBUzew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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

Hi,

Please mention 'max-non-joiner mode' in subtest.

With this update,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

On 2/12/2025 1:06 PM, Jeevan B wrote:
> We need to ensure that the system does not enable a joiner for modes
> that do not require it. This test runs on all pipes and validates
> that the highest available resolution and refresh rate within the
> max dot clock limit is selected. The test then forces a modeset and
> flip on the given pipe and checks the status using the joiner check.
> If the joiner is mistakenly enabled for a non-joiner mode, the test
> should fail.
>
> v2: Fix nonjoiner_mode_found to find the required case.
>      Remove clk sort and minor fixes.
> v3: Rename nonjoiner to non_joiner and minor modifications.
> v4: Add joiner check.
> v5: Rename test name and function name, Update test description,
>      update non_joiner_mode_found logic.
> v6: Update commit message and rename test, function name.
> v7: Fix mode selection, loop through all pipes instead on
>      pipe - 1, update igt description and add igt info to display
>      the selected mode.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_joiner.c | 65 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 086cfeb71..062a0e49d 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -74,6 +74,10 @@
>    *
>    * SUBTEST: switch-modeset-ultra-joiner-big-joiner
>    * Description: Verify switching between ultra joiner and big joiner modeset.
> + *
> + * SUBTEST: basic-max-non-joiner
> + * Description: Validate basic max non-joiner modeset by selecting the max mode
> + *		supported on single pipe.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -85,6 +89,7 @@ typedef struct {
>   	int ultra_joiner_output_count;
>   	int non_big_joiner_output_count;
>   	int non_ultra_joiner_output_count;
> +	int non_joiner_output_count;
>   	int mixed_output_count;
>   	int output_count;
>   	int n_pipes;
> @@ -94,6 +99,7 @@ typedef struct {
>   	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *mixed_output[IGT_MAX_PIPES];
> +	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   	igt_display_t display;
>   } data_t;
> @@ -491,6 +497,48 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
>   	}
>   }
>   
> +static void test_basic_max_non_joiner(data_t *data)
> +{
> +	int count;
> +	enum pipe pipe;
> +	igt_output_t **outputs, *output;
> +	igt_fb_t fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo mode;
> +
> +	count = data->non_joiner_output_count;
> +	outputs = data->non_joiner_output;
> +	igt_display_reset(&data->display);
> +
> +	for (int i = 0; i < count; i++) {
> +		output = outputs[i];
> +
> +		for (pipe = 0; pipe < data->n_pipes; pipe++) {
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +				igt_output_set_pipe(output, pipe);
> +				igt_require(max_non_joiner_mode_found(data->drm_fd,
> +								      output->config.connector,
> +								      max_dotclock, &mode));
> +				igt_output_override_mode(output, &mode);
> +				igt_info("Appplying mode = %dx%d@%d\n", mode.hdisplay,
> +					 mode.vdisplay, mode.vrefresh);
> +				primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +				igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +						      DRM_FORMAT_XRGB8888,
> +						      DRM_FORMAT_MOD_LINEAR, &fb);
> +				igt_plane_set_fb(primary, &fb);
> +				igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +				igt_assert_f(!igt_is_joiner_enabled_for_pipe(data->drm_fd, pipe),
> +					     "Joiner enabled on pipe %c", 'A' + pipe);
> +
> +				igt_display_reset(&data->display);
> +				igt_plane_set_fb(primary, NULL);
> +				igt_remove_fb(data->drm_fd, &fb);
> +			}
> +		}
> +	}
> +}
> +
>   igt_main
>   {
>   	bool ultra_joiner_supported, is_dgfx;
> @@ -505,6 +553,7 @@ igt_main
>   		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
>   		data.non_ultra_joiner_output_count = 0;
> +		data.non_joiner_output_count = 0;
>   		data.mixed_output_count = 0;
>   		data.output_count = 0;
>   		j = 0;
> @@ -523,6 +572,7 @@ igt_main
>   
>   		for_each_connected_output(&data.display, output) {
>   			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
> +			bool non_joiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
>   
>   			/*
> @@ -533,6 +583,8 @@ igt_main
>   			 */
>   			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			non_joiner_found = max_non_joiner_mode_found(data.drm_fd, connector,
> +								     max_dotclock, &mode);
>   
>   			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
>   				force_joiner_supported = true;
> @@ -548,6 +600,9 @@ igt_main
>   			else if (force_joiner_supported)
>   				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
>   
> +			if (non_joiner_found)
> +				data.non_joiner_output[data.non_joiner_output_count++] = output;
> +
>   			data.output_count++;
>   		}
>   		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> @@ -713,6 +768,16 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify the basic modeset on the maximum non-joiner mode across "
> +		     "all pipes");
> +	igt_subtest_with_dynamic("basic-max-non-joiner") {
> +		igt_require_f(data.n_pipes >= 1,
> +			      "At least one pipe is required.\n");
> +		igt_require_f(data.non_joiner_output_count  > 0,
> +			      "No suitable non-joiner mode found\n");
> +			test_basic_max_non_joiner(&data);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
