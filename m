Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E079D43369
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 14:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D1F10E310;
	Thu,  7 Nov 2024 14:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YABoLTnp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC4310E08B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730990755; x=1762526755;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6mHRMfRxFwQB+GYfjD8/TzHYE43Tm+iGxd9yhG1+u14=;
 b=YABoLTnpCqUBrTF45hXHsCXXbNzZOP5JRhu8LpExv8+VUUdgaZWJ1TbX
 g2KO9RZ+jfvutS1cvY+GgITX+mfBHJ79g1X2vCDH8ddnr8UppZP07yQyX
 O/YmUG6UtM4uoITWf874yRFLqvSYUuYKR23TbHWP1p7Mf1Rm7tVPgq5g+
 AuIoPCcCLrnbJOADOs+5uQ4ot2v4Eva+OuhTefH9OhmdHQcGLIqRuXVgz
 CiIr/s6djwwLyYH5mQ7Qu9ow8eEbFqiqPvy7NqKJdUzGkTHVo60dRyYOT
 kB27A12S0pYSoJX9kfS/kuXqyZC52g2SKn38nEkUpNj0EeU+1zW0rn2Up g==;
X-CSE-ConnectionGUID: 2o9g5OerSp6+3KBImfPu4g==
X-CSE-MsgGUID: EDakUIREROm5fKdvvaRVLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30238163"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="30238163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:45:55 -0800
X-CSE-ConnectionGUID: agRUl0tgT6m2ByR4amnhaw==
X-CSE-MsgGUID: abWABW0QSXOUCJNjqkmjlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="89631824"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 06:45:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 06:45:56 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 06:45:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 06:45:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbW57pRsPVZZYcUbjDdoJEAx2nQgdbVfwJbNG7wPY2MnEo0ARIGJphtGdROCJs9BBTMcNGG04LGvXxevv5lmooxlZR3FNme3HCUs8mc/yTGM3VverWxyIXvJJonwc9Q7ecN+UU2VCV96OnXvfpKeAuuYLQo5v2qJXlRy2tAlRh6hffjA89xKv7fiNXTh2t0sgGsHMwYkHH7Vf6T5BrGNOcYVU6DLmsmtqbXz98PY3YbMUHPeWzwMsgIRDZ+F1O2nal6FUCL74Pmy0v0MONkxPFM02WnoKqSGG3eof7/nCjUQm4BKRY6KdOb2R7IrPoQyclmDcUAQ2ulYyIYijm7YAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRlvOdFUc0PEa3n63c12226q+6mxoGobZH8imUhpTwk=;
 b=e9U0kTMEcsIaWsxYuWkuAi59nnXerlMniGPPZkQhVd6Hth9nD0/pavjIGgm8YcjCOPd2f+KtubaU+lWdA5Z4GhxfiUYrY1fxdYylCX53DKmlw9vZv1Bv56jFx3dH3RFO/olNEzRECQy/1pjCL1FDnwprwORdXHp7tOe0i2SaXUSd/WSc3TKBFPZ6FNsQarcD5YqRRbhu72ELQOE6HKPUSEGVQxIAQJyp0DbVxdZ0ZmD76uZZtUvjlD3PRDKy9VvQaOTqBKjn2BU9s2tFVgSa/a6Z1bQrc5N7p1nxknJDiQ5jIhNmIymGG0WkJIyxobuMRK/Am0YXKZJ2SzbzNW8Pag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CYYPR11MB8359.namprd11.prod.outlook.com (2603:10b6:930:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 14:45:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 14:45:50 +0000
Date: Thu, 7 Nov 2024 08:45:47 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: Pravalika Gurram <pravalika.gurram@intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/xe_spin_batch: Add spin-timestamp-check
Message-ID: <ljanmbkdercqby6667m4p7tzlfnlcsv7t5gxenaaoogz2enot7@ljjl3kg4f6g7>
References: <20241105092805.317286-1-pravalika.gurram@intel.com>
 <mqo3bj2b6fw6eb26pj5ojighk4fp67nzqanzuics7hjknekqfx@7utg2ppxwhqb>
 <20241107073545.x7icsu7zl5qwkw5j@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107073545.x7icsu7zl5qwkw5j@zkempczy-mobl2>
X-ClientProxiedBy: MW4PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:303:8c::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CYYPR11MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: c5fbf9dd-0b31-425f-c234-08dcff3adf7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mmw5dXdLTzhhdFVSanlITlZCRDBkRm5vUTE5K2hIc3ZidXBwb2xBbzNTczNJ?=
 =?utf-8?B?TWhEVkhmYmdTK0NpaWlDeVRUQ2VTVWVBQ2x6eS9lNzNBVDNyc1l0NCtDU2lU?=
 =?utf-8?B?eXdPaThIWEdrU1VNcjZrcmFiS3hUMkU2MzJPL1l0WnlGM0x4RktWRU9UQW9I?=
 =?utf-8?B?L2NKLzNPOWpjK2xrWXJ5WnJqdC8zZkpVTkZkdGR3R1RFMmI4NkJONllIZjA0?=
 =?utf-8?B?bWlGT1JicXd5R0hBb0lXeTVNOHowN2NPb0RjUG5idHBBbkFRV3NOcVkrd0FS?=
 =?utf-8?B?VFRtYURlV2Q2SkE5eUZvWDcyTG9PUTM1K0Nxem5VdFRHV2lYQ210MjJLcW9v?=
 =?utf-8?B?ZEVzamlEYk1iZmp5dTNPWW9CeE8zOVJjV1gwN0lUM3ByYzNMVE9vTlpHNGc5?=
 =?utf-8?B?R2N1M0kzdDBsR2luT0FIZ3FHcHBPRVlxZWhna1JPK0xZVklSaGR1Rm81T1Ur?=
 =?utf-8?B?M0t1ako2bEd5RnV5Z2ZQNGwvTk0yT3hLSGRyYnp5b2wwUUs5dGJMdnhENWtH?=
 =?utf-8?B?VzlRMDdjU25SODk1SEdYM1RvU3E0UittR0p4UUZ6d0RWU29QL3F1NVM3QUpU?=
 =?utf-8?B?akF0WEVqN2pxcDZvWlljb2ZJaDVyeVB3SU94bWYrdENxY2NuREIrS3lnTEJ2?=
 =?utf-8?B?RTkzQjI3QTlPOGZwUlFoSUszU2dXRy9rYStsTFZObHNKYkFrL1JHb2pFeTE2?=
 =?utf-8?B?dnNqRWFueXFnNXZsZEtxUjkxVm9UVHc0R3pNOGVXVHhkT05YRUFPQ1E1RkhY?=
 =?utf-8?B?TnpacjU4MW5RNmNvMndteEhRdXpIQzFxYmw4aDFNRm1mQ3FDZ2xHRUw5SXFu?=
 =?utf-8?B?K25rRTAwRk9DQUNIaVg1Z2h5VUlKT1JMcmgwWUx6WGhTZnRQcXp4aWNnVlRN?=
 =?utf-8?B?T1Fhbm5FUldSN29Vak5HbUxwalVQejhJVzZqOVlNdHMrb3l5dHhZMksxQzJq?=
 =?utf-8?B?RmJpYnBNcVMwWWpST2I5S3p6a0pMaFRrb1ZGUElpR1h0WmpSSEdNakhMMk14?=
 =?utf-8?B?MDI0eDY0RkV5c1VlV1BLT0YyTmxQdmp3WXN1ZForWWJIQ3pjNWRsRWFXSllp?=
 =?utf-8?B?eHVlRVN6Ynk1bjNneFF2Z01XSVFyV3dCekFUdHdTN1ZxS2dsTUdISHdLWkkx?=
 =?utf-8?B?SkRXbnVKY1RDdDcrdUFhUjY0T29mYy94c3p5c2trSWJYVTBHVkZnYVFDMkVy?=
 =?utf-8?B?WWxxNXJqRWdRUmxONm5wME1aYzVWZk84QTdCU3hBTzFzTzFpTkcrRjl3NDM2?=
 =?utf-8?B?TUVURWFzZVYyQVQ3dk9jMFhUQ0ZvVGF6SnE4WWhsZUFMbWVqTHZHY1JnYkNP?=
 =?utf-8?B?V3NHYVc1alRDb1JZT3oxR2FhamtZdEJiUXVER3dHY0N4YjVKS1NxL0Q0dERv?=
 =?utf-8?B?a2JWWHVMeHk2Sm1KSElYYXc4dUZxanhsa1RFNStnMjQ4bURsM2VQZDQzakhU?=
 =?utf-8?B?OXprQWFFT1IrQlI1bmRseVdveDFVUXFGa2htY0wxeHFYTTY0VnlWTkZQY2lZ?=
 =?utf-8?B?elJXZkhqdll5VEJzUnp1ekJPR0t6ZTUxc0Q4d1piN212T01BOXpNVTd6eXNF?=
 =?utf-8?B?QTFzQThVbVNSeEFkVnJpLzlLRmViWXlTYjc3aENaNUNxQ0Nscm5zNC9OTlEv?=
 =?utf-8?B?ZjRUbXJLdzVhYUNSOXNHTTBNVU0zbkRUNi8rSXN5cGVuME1oY2wzaE1RQjdM?=
 =?utf-8?B?MVhYTXRSNG5yVGFpOWVLRnJRcU5oeXVWSFZpZHk4TVc4bWdBVUtTSGNQOWdo?=
 =?utf-8?Q?QcKZUH9oY4O4/SDdq2cpapOOrEhuA5YRxDVXMZl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmFuSVVDV1JoZ1lCUUVOLzJCallmNmlhdTgwa2F1MDY2WTRjZTJXNlUzZ1pX?=
 =?utf-8?B?KzIveHlnallacDFaQmlGRTZJRDNna0RTeVgzb0FOdk1PMk92Zk1hbjk4a2My?=
 =?utf-8?B?N3AxZVFqZklzUUZBeHJDQXFvRXdBeTdLbFpXR3h1RlRwQmlDaFJhQlhuUXlK?=
 =?utf-8?B?NVBiUXNsdGlHNXk0RllXdkVxakpJZmU4UmpEblNKWHZ6bVo0bkpXM3ZZK3ZZ?=
 =?utf-8?B?dHVERWJnOXM1UzlrVGh2T0EzUEZaNXVVSy9QaDZTeUp1VHZIWWVDLzYwMU5D?=
 =?utf-8?B?ekRiY0dqYnIvNE1vV05ocVZwZUNYWEh5bWZPNnN0aUllUCtjTDJrMXFLVG9h?=
 =?utf-8?B?NDZpNHd3OFVoUE9oSDZNRFZQcFpBeDlWSkI1ZEZYcGR6YW52OTFHMTZXanQ4?=
 =?utf-8?B?NmZCYklsSmtPZ2JueDlDNFJxaEZ0Zi9EZ3JtM0Y5Ukc1VjFvelZyaFJpR09w?=
 =?utf-8?B?M2pxTVdNbW53WXoybnMvWFIyWmhOZnZUVlZiVURlbUxVemd6TEdpaXk2TlZx?=
 =?utf-8?B?T1NnaFlGV1R1MUJ2bitybXJRNEJqVlY0Qk15RnM5SldJUEZwcm1Fb0QvSU1i?=
 =?utf-8?B?TGh0ZHB5dlhYUnp5dUcyS09XdGRvMVE5SkVUd2wvdyt3QkJzSU1GeCtsWXVU?=
 =?utf-8?B?V2tLZGRNeW5yRDhHdkRCVVh5QmY4dzJWRy9EYnBoWVpOUlFWa3BFbThTcEJu?=
 =?utf-8?B?QVd5YkgvMlFPZHN0Z3Q0R2JVeEsyQmx3ZmJyK1VZVUR2c2dkUFk5NVhzdEl3?=
 =?utf-8?B?K2p1KzREd3JYeklDSlhBY0ZrTmMvaS8xUHFpaGFrZEUvbFQ2VGhBa3BIcTRU?=
 =?utf-8?B?cC9yc09zeXRDemhqZ2dFWFpZV2xLVWRGNW9TYWp5ZmJUdmpzUmgxNXh2Sjda?=
 =?utf-8?B?SkZPNXd5UWJlSjhKeHdZMU92WndEblMydFF0bCtsb1JYUmt4czhVSm1qa1Rs?=
 =?utf-8?B?T1BHdHFMbGpTZTdmMWNXd0FkOVdMNXVnczM1MlJ1T0NUdEc4b0tWcG05c2Zu?=
 =?utf-8?B?SDdYVU9YSzlWOHFHUmpZT0htcDhZeUV5TnhndGtSak5BVEtwNkJqUFFBVVpG?=
 =?utf-8?B?YzJyTXFvbkZ4ckxDd1JnallZWjB5Wk5JMVlZc0hHdzlWNXZKVzVTMG1jKzdS?=
 =?utf-8?B?Mk9qQmNFVUZreElVa0lNRW9UL2NrYlo4SVVqbHU5Y1ptU3p1d3p4ZXhqT0hw?=
 =?utf-8?B?ZzZXZ0ZtZWVnR2tRMzZnZDEvaHI1OXpUVkhIWHdmY3BrSWxvYmt0Y2c2bGJy?=
 =?utf-8?B?SlE0MmkyTXFwNGR0SmhDOHppWHJPQWw3TW16aW03WVBnQWtBc0FHOXh5T0ND?=
 =?utf-8?B?U2ExR0Vsa1pIc0xQWWlwMFF6enFqSHBnbzIxVHpnZkozeVFDT21GbW9BVnUy?=
 =?utf-8?B?eDc2ZFhKRllCRldVZG0xYkxDTzh5cGwzclQ4Y21SWEJ4YlZDQlVEb2ZjWmRy?=
 =?utf-8?B?dS9jeS9nU3ZjTnNZNmtuaEI5UlZjMDUxSnNGVEVTTkgwQWhYc2NhWFJpT1dZ?=
 =?utf-8?B?S1FYRjRCYjhaeUFndmY1M3NITWlTRU1iZkRxdTZqQW5KalFFWSsvTUNkYm1r?=
 =?utf-8?B?YUYreUVabER3TkUyUGowZUZ2ZkhGMmRzWlEwbVhXTEE5aTBJVDQ5K2owOHJV?=
 =?utf-8?B?YmtPQ0duKzI2amZEVnNIU3pyMFJQUVp1NEhYWElLWFUzQ3hHaHp5bWxHR051?=
 =?utf-8?B?TDBOd29pRTdaa1RBSElUQktwUjB5Q2dqeTU5ODNsd2ZzYms4ZXBYdUhzRFNI?=
 =?utf-8?B?UTlWOVUwNGdNZHlBV0taMUduSE1YMTFoZEJmNkp1T3B1R054ZGxVdG4rdW5l?=
 =?utf-8?B?a1FHcU9Va1JUQjRuODRURzZXdkp2S2JpbUV3RUswdEpsRUpraW5BNUFzU2F0?=
 =?utf-8?B?UHo0TUhYbllCTFV1RHg3LzdHV2F0V2ZVUzFqQ2g4aHAzQ0NoNC9tU0RFdzFl?=
 =?utf-8?B?VGRoZDduYlJzbi9rTXhYeFgxNCtkWTgyeHUzMi9uOTlYSVdMRVN4cmVDaEhN?=
 =?utf-8?B?VWxtZ1ovMEtMYUdWWmlXa2pxdGR1b09FQjFMc3dZbUlNV015YmhsaW5vYjh3?=
 =?utf-8?B?dGZEOWo4WFV3cXVDMGtNU1hFNm0yMk9QcTMxTmRxTzk2TFRPYW5qV1U1SmZJ?=
 =?utf-8?B?MzVBTzFWY0VNS3VZa1pBUU05TkI0dlV1THV1dlNoaXlCQzN6a2VaSHM4RENp?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fbf9dd-0b31-425f-c234-08dcff3adf7f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:45:50.4475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0vBTSDkNLOwQGD4GC10aXqoxa86KPvI7yFMMNF5wBz1W/9GZvHUK57InygJnbky4c2S7pIZSnjp7/um51f93aBGJxKp3JnKeYS1b+Zr7OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8359
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

On Thu, Nov 07, 2024 at 08:35:45AM +0100, Zbigniew Kempczyński wrote:
>On Wed, Nov 06, 2024 at 11:08:20AM -0600, Lucas De Marchi wrote:
>
><cut>
>> > +/**
>> > + * SUBTEST: spin-timestamp-check
>> > + * Description: Intiate gt reset then check the timestamp register for each engine.
>> > + * Test category: functionality test
>> > + */
>> > +static void xe_spin_timestamp_check(int fd, struct drm_xe_engine_class_instance *eci)
>> > +{
>> > +
>> > +	exec_store(fd, eci, false);
>>
>> what is the first exec for?
>
>That's sanity check exec submission is working fine before we submit job
>which will hang it. If you think it is not necessary it might be dropped.
>I'm not sure if is possible situation so that check might point if test
>prerequisites are not met (and on CI we just die on exec). But then I
>think fence error code should be checked as well.

a debug message before it would be great so we know when it failed (as a
prereq or as the real execution). Or at the least a comment on top.

Lucas De Marchi
