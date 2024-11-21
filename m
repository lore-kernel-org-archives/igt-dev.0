Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C34D6ED11
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7680D10E3FB;
	Thu, 21 Nov 2024 12:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/gxHz+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6778489823
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732190852; x=1763726852;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YnHEUBlux88AepYhNhw3m3WocrcP5GRiSJbeAre13/Q=;
 b=I/gxHz+sLbgDwlzBRWwOWiAVnCKo/ywHx2A50KIuyUM1Vg4P5RBxLg5N
 v4l/YjKR/BYHU7/dBy+mZ2zMoHOVkaf0t4GiXC+LUaOE0/P8ICE3ZhMzs
 RvbBQnHFfWeP8tbPm432ixEcA13r7du614/2lPsmDEvP2gO+y1gQyIKC+
 O4JuPS2qXuDfVndiInhDPRu6hFs/rs0H9ZSdIuoRPxTfV7TE97uuJmEZq
 /cVzXL2iFh2FIUWcEFp0+eYsgJlqeFTPMVvXtmZdXAzXJtLItTWGt/dji
 KMJnoprlo1NgfgAWkagq59EUwNy6lTJLFf4vbqmqdBJZmllvRG1xdu6hy A==;
X-CSE-ConnectionGUID: I4SLx0qzS9uJ4GNXgNe+rQ==
X-CSE-MsgGUID: Ls9+OVXFQCeVzrVbEhUX2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32434084"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32434084"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:07:32 -0800
X-CSE-ConnectionGUID: jORNY5cWT4mYC+zzKLHbZg==
X-CSE-MsgGUID: OCO8Ji/1SDOpM2D2amHaDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90175284"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:07:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:07:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:07:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:07:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zn1XgZ3Vwh++W7IFPsUVHf/clONFhp5a9CXFHMsndolHso4EnCwMMs4O2PaYAU5lw0TWn0Fjjkfgjj/UXOdO4w1oZS/A2euzJ/g+6ufEOXcCEnhgead5nwL52peL1kI3msBF+jwOR9et5APzHLWEjbtrI5y4wYSqOJRDMsc+kxpSo3JSwH/g3/habBKXK6VBPa+EIDhm9yOr/guLFie8oXWy2DLwkPLg9I1nrt9TuqvQZy5PsZA/9NgL6xJnKw3fYN4ULVg47+JCbIoYk5Ga84qKTgtDEEsed0YeC0XRJAoPDEY7d9JbrqHvxq2b/3nEuhAO910GlhedRGbGcnP03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6Y/GHIquAaSNYmyLoxN6s9fUHhJqp6LUhsQNcfTpII=;
 b=erYa1iIo+W2wlXovoDFwOCNS4JEuyx/S/8FxPrZnmtU5Z9qYk3cVS9bcJhZhRQtkuzUbw3l/nbIFVXOVH7Gn/N0CKE3H63c5CQQLL98QI2xwPcG1jVqPbXXD0T7ZhOptQE1uyQcHjvzBsW0Iz+wMaH4rS65EZBHfXBqS90PIOWhb6WZgiM8qd5RCYoIazjUuiEdrxKJih3xVz3ZaeRjS/e8MQiG4e59hLxwizGYDLNJiY4IztrqBzv9VxXWeDKMFT7M4cL/+EE6osf9+jPf7JLi1rbG1yGybGRqyyzciwgrWxHvYycDgzzmxvMyDBQvWQdBdqubz5iYl9XR+F4JonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 12:07:27 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 12:07:27 +0000
Message-ID: <e60db2f7-bb97-4e35-868e-8cc0d52689df@intel.com>
Date: Thu, 21 Nov 2024 14:06:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_eudebug_online: Add read/write
 pagefault online tests
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
 <c110ebfc-9b3c-4d40-9231-fb8157638e16@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <c110ebfc-9b3c-4d40-9231-fb8157638e16@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0024.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::11) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2abb64-4585-404d-f275-08dd0a251109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGpVU290SDRaa0U5Z1pKclppSmF0bm1uY204MmNqZUFqSTc0NGUzWDV6NDBQ?=
 =?utf-8?B?a3IzRS9xelpMVzRaandxS1l1WW4zZDdrOUJDR3h1QURGM1BwekFqejUwYTM1?=
 =?utf-8?B?MDNsNVhOTmpCUEYwNHBlUWNwTmpQWjJldFh5VGhocXFxWEVHdjZpRG0rbmk5?=
 =?utf-8?B?S1dWdzVpZnh3RVFGbHBFWGpORzh5UGRwVGtMblJGRUxKTm8vNkZ5cXFORHVI?=
 =?utf-8?B?dER5TzFyZGFGdGo0Skk0QTgzUXNNd2tOWWtlcFl3NEw2SHVSaFJZWVlUTjJu?=
 =?utf-8?B?YUpGTHRwaG1kL2FlYjRhM0Q1Q2hRZ1UycDRoWkwveE1HOTRWb01ERFVpekN2?=
 =?utf-8?B?VlRibndKMkdoSkQ5N1BmaE04bkFwVUJYVmNTcjMwUUs2NnkvZjNDK2RwcjUr?=
 =?utf-8?B?c1NZL3lsUFhRQlJxa2t4NTdsWDN1dHF5V2txSHhRT3MvYzB6MW9uQ0VlZ3kw?=
 =?utf-8?B?RUx4VkxqcUNNdDcxOTVZcEVhbEtTWTdPL0dLS09zcVFTZlFVdEVxL0dRZW91?=
 =?utf-8?B?ZmpkNHdJT0xtQjFNNzBYQ1MzTXR1SktPcnRDcW1qS0pqRW44YWYwNlk3KzFz?=
 =?utf-8?B?Rlk4K2h0a0FocFc1NEgwLy9UN0FKVkxyZE9KU3RoOUl5Sy9EVXZqQWNLMUdz?=
 =?utf-8?B?dXZjeE1hSzlueEN5RUNDTWpBOGxrbTdkeUtleDZRSWQwejlsOTh6eWhVanBq?=
 =?utf-8?B?emYyQTY3VVJYbVdseVNRbnlxRHArNGNzU2pGejZLSG9sekx6YzhXYUlLeDhV?=
 =?utf-8?B?YWJEZElkK3AwVUE3anJxUG5OTnVjSTVnS0RRVkJpOXo3a1pUMUwvSWdLcWJu?=
 =?utf-8?B?aWZiekRyQ2Y3V3kzbkdpVTdOMlJBc2hsaytNTHZyY3FGaTdmdFRvRkQ1SHky?=
 =?utf-8?B?ZEgxNjI3RHR2ekJTS3NsdkplZkhseTJlWm50K205VitLZ3JlQkxSNk1SWVAz?=
 =?utf-8?B?RlZPYTIxeVhDWTBBbFpBZW5keGt6QU1kMTVXVWVDNHlEUDZsRU5WMUF2Unlo?=
 =?utf-8?B?eWFua2FRVWdqQzhxb1pUZTJYZis2eHRyU1BJbURPLzhVaG0raGtYZDJTcjU4?=
 =?utf-8?B?Tzkxc2w3RHhuU3ZFN3FZUTRWcVU1WnVWUi9HNzU1ZCtBMWdjRHlzRU9PNW5U?=
 =?utf-8?B?bHViUC9qdzZlZ1lUNnNFaWhsYW80NGdWTWpjYnVhRjd2YnhhVkJYQkdtUjBZ?=
 =?utf-8?B?TmpZUEEwWGUxT0JIVUdPeEhUS1lqVnBtdUtjMjZDL3RUS2NQc2ZKcy8vTGkv?=
 =?utf-8?B?SlJtY3Y1V0lXSnJuYVpHU1QyNExFVkd6SCtFWGRDUEdoSUhJSUtXL00rYS9Q?=
 =?utf-8?B?M3JkM08wUkVYY0c1NCtpTTJHZGV2YnkwZlU5bWc1azZXaHJCK0Q3WU9FMmZm?=
 =?utf-8?B?NkhPdGNVM0dJOENRVnVTYWU3dU13RGoxUndwcXRCMVpRVGNKZVhTRHh5eS9G?=
 =?utf-8?B?c0dWdFZ5MFZ6allGWVlLL1BCeCtENzVvK0NwS0lEb08xbUFUb3BNZXVqd2RM?=
 =?utf-8?B?RlJQQVhCMHNrTngrTDJXT3o3MW82R2JsYVhCVUlPSTliZ2JPM0s4UXlPRzNG?=
 =?utf-8?B?RVl2Y0JFNzJxYVBRd2VXSjB3NXBYRWxrREZwMUQ2cWRhVmUyajcybmZSb2xX?=
 =?utf-8?B?eG5VUTlTNWZkc0JQZlE5c3NycERBRjBRRTJFNVhWVEs0d0Z4cTJOd0E0QjJn?=
 =?utf-8?B?blVCSGFkSGg1QjZmNTNQRTlKWFNSVWhqNDdEaWpUeHhETk9jZlFybTlSNzNi?=
 =?utf-8?Q?XiU6augIl4mi/Z0I3k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFVqVG5aRHB5SVErUkg3cjBrajNld1hpcXpLQ0hUcmVIL2g0N3VUTGhFRVFK?=
 =?utf-8?B?M1NjVkJ5KytpT2NKM282ZXhtUE1CYWREZWRTV283VnFqSlhDL2tsNUxkSUlC?=
 =?utf-8?B?dGt6SGdlKzViOHZoVk9EZGk5YUh1d0FRcUF6WlJaWUtVNHcyQ2NjYTlhSG1R?=
 =?utf-8?B?SnVsd3B6cVlXZDB6UUZMYkY1dU85T2FDSnltSTVSdVRQVEMyY2lGaEk5eTdY?=
 =?utf-8?B?Q1dYeVk0c1htR2R1OEFVUEpxbGt6U2pGZTQ1SUlLUDBqU0hGbFh4c2hUbDFp?=
 =?utf-8?B?ZUxoODZWaDVwNFE3NXRHYjFoVDNwNExOcEIwMHVKTFN6eks4c0U3ODh1N1kw?=
 =?utf-8?B?eW1oM0c1NjVIdGZic2RpOGlONXFCRmpKZzhJY3d3bXR1OENRdmhTNWJQTDFJ?=
 =?utf-8?B?SktDOGU0V0tISEJwVHhDVzIyK3ZoaHNKSjVIR1VPdzJzQ043R1lUWW9TTGhh?=
 =?utf-8?B?ZmlWUnEvVjVza0NwNTNlUWs3MHlNZFVmSVZtellsei80MjdJV3pRcWxYVFhz?=
 =?utf-8?B?R3VpTHM3UTJsNWM2NEY1T0NaMEE0amF2NnVwOWhMaHFza1ZXNE8rTTJSWHl4?=
 =?utf-8?B?a05NTkpBR3pRUlpQZDhEdElmNGNIUUdBNjBrU1cvWVNFLzRCUTMybjZMdGdZ?=
 =?utf-8?B?b3lmamdKQUlPMjJjL0pZNytDQ3FSZnhucjQyTHhtV1BqcHFKTkpNSUpITFVW?=
 =?utf-8?B?QU04eVhuVEtnencxcEdGbGlSNitSQVdicWFhdVBib3ZvajRYTDZRaXZYb3Jy?=
 =?utf-8?B?ZlF3anEvQVlpR2c3Y1llVnNtZnRLNE5VQmFybW9JeDVlNTlMQmw4NHlqQlhJ?=
 =?utf-8?B?b3NnUStFZFR2ZGtUM0xmd0pTY0dpdXZHVTdud2ZQUFhxKzZyMlFqbkVWUkl2?=
 =?utf-8?B?WEZEUndjRUpyalN5UUNNOHFNYThmRUtuVUE2Sm56UmF6T0hiZEhKTERvSUo1?=
 =?utf-8?B?RGgzV2IyVUpYZktKKzhaUDFiWndUMUxPcFliWEc2Y0VHRjM2cGRISU1tL3hh?=
 =?utf-8?B?MUEwWGNTNTFMVitjZ2hCWUhoSVFIdDNScmVxNlRneW43SWhad2dOaTQ0Tjhn?=
 =?utf-8?B?OXUyeWlCdHNZV1pnbTdUaUJIQ0o3MytsR0VDbm5KV3N1c1k0QUI2MElEb2p0?=
 =?utf-8?B?TGpUK1ZtYU9GSzlnemJleUpnYjdBdkhRb0Z4R2czRGxTaGRNay9xaEFBTE8x?=
 =?utf-8?B?SENCQ1NZVk9QeGQ1NVJ2S3M0Q2U1cElQSmF5dWZqdEpKdXBqaGpRRm5MRWdZ?=
 =?utf-8?B?eDJqTnlRdG9ubWZKa3ZzMCtoVExGWDNHRmN4QWlJUjFCWHlOZnpvZEpXbmcx?=
 =?utf-8?B?V1ZmVG1lMmNwS3IvZDdBRlFjWlk4RW1FeWlvNVpmcGhETWhtOHRZUWJNbm1Z?=
 =?utf-8?B?cUlqMXZxdzZKcS9DT1BzeENmTlRyaUNMQnovTGhPd0diMFZqbThQSXJPTks1?=
 =?utf-8?B?aWpYanRFeVU0V0w1WGRZaWVLVE1QVWtnOXI3SFFLV2lLY2tURlArQ2kyZ0dC?=
 =?utf-8?B?SCtuYjlsVEd2aGpWMUI3S21ES0VLSTVzTVFmRURzZnM1cUFlcXo1OE5qN1ZV?=
 =?utf-8?B?Vi8xaUhNT001M1JZcXY2OG80RS9rcURqNGgvaE45S29uZHcrdXN5Q29UV0Vn?=
 =?utf-8?B?b2dOU3I0K0hRaEE4Zkd2RzhyWGk5eWV1YjZjMitHMTYyYUhrL3hIMmExSVN4?=
 =?utf-8?B?VWN0QnFHNm00Vm5zRmRmRHEvRVhjeERsdUlvSzhxMDdNb3dmRHI3b0RhZ3h4?=
 =?utf-8?B?NFRPekdETDlERTJ0RjkyeGsvR3FTRllMeTc0LzZpZ3cyRk5HbHE2dkpETEd0?=
 =?utf-8?B?UDNiczZQUXRoQU0zUGFzUlEwZkoxRWpuaWUzd0ZCc1RwbS91TnhlZjNsQnhP?=
 =?utf-8?B?VmVCT1RGcUp1Qjd0WFBIK01xc21iejV3blNDQmJYc1pEajZHYzNPcldTWFlZ?=
 =?utf-8?B?Qlc4OW5MWnV5TXc4Nndmak9uYkZSOExFc1BsY1I5U3lmMkhjcTJmUmpMa2VI?=
 =?utf-8?B?ZkY3T3RaMHI3ODFSOWhhN3UvRUh6N0xiOEp0N2xwTTVvdjVMcDhWM0wxcFBM?=
 =?utf-8?B?cU9ZeFVDZXVWU2NzRlp5VFRLS0FGYWdHSUlBTXUzZlZWcTloT056aE84OS9E?=
 =?utf-8?B?VnpzWkNzcHc1TlZXSm9ybDNjMnY5aW05L0RqK09DbFhoMzV5UnpWVzNSRzVL?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2abb64-4585-404d-f275-08dd0a251109
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 12:07:27.3865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lMNTW+sQNVtYkGs9XFnKb3LxaKkDr+ot8Jao3KQw0qXjpeeJ2ydMkwqaEFltX3UHhFbhL/bVl8keQdlNAcfc8C1o7789IMTgI+e04lesLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
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



On 11/19/24 10:10 AM, Hajda, Andrzej wrote:
> 
> W dniu 15.11.2024 o 15:11, Gwan-gyeong Mun pisze:
>> Add read and write pagefault tests to xe_eudebug_online that checks if a
>> pagefault event is submitted by the KMD debugger when a pagefault occurs.
>>
>> Test that read (load instruction) and write(store instruction) attempt to
>> load or store access to unallocated memory, causing a pagefault.
>> Examine the address causing the page fault and the number of eu threads
>> causing the pagefault.
>>
>> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   tests/intel/xe_eudebug_online.c | 219 +++++++++++++++++++++++++++++++-
>>   1 file changed, 215 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/ 
>> xe_eudebug_online.c
>> index 0ef0d8093..eae0eb520 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -36,6 +36,8 @@
>>   #define BB_IN_VRAM            (1 << 11)
>>   #define TARGET_IN_SRAM            (1 << 12)
>>   #define TARGET_IN_VRAM            (1 << 13)
>> +#define SHADER_PAGEFAULT_READ        (1 << 14)
>> +#define SHADER_PAGEFAULT_WRITE        (1 << 15)
>>   #define TRIGGER_UFENCE_SET_BREAKPOINT    (1 << 24)
>>   #define TRIGGER_RESUME_SINGLE_WALK    (1 << 25)
>>   #define TRIGGER_RESUME_PARALLEL_WALK    (1 << 26)
>> @@ -45,6 +47,7 @@
>>   #define TRIGGER_RESUME_DSS        (1 << 30)
>>   #define TRIGGER_RESUME_ONE        (1 << 31)
>> +#define SHADER_PAGEFAULT    (SHADER_PAGEFAULT_READ | 
>> SHADER_PAGEFAULT_WRITE)
>>   #define BB_REGION_BITMASK    (BB_IN_SRAM | BB_IN_VRAM)
>>   #define TARGET_REGION_BITMASK    (TARGET_IN_SRAM | TARGET_IN_VRAM)
>> @@ -61,6 +64,8 @@
>>   #define CACHING_VALUE(n)    (CACHING_INIT_VALUE + (n))
>>   #define SHADER_CANARY 0x01010101
>> +#define BAD_CANARY 0xf1f1f1f
>> +#define BAD_OFFSET (0x12345678ull << 12)
>>   #define WALKER_X_DIM        4
>>   #define WALKER_ALIGNMENT    16
>> @@ -123,6 +128,9 @@ static int get_number_of_threads(uint64_t flags)
>>       if (flags & SHADER_MIN_THREADS)
>>           return 16;
>> +    if (flags & SHADER_PAGEFAULT)
>> +        return 16;
>> +
>>       if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
>>                TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | 
>> SHADER_CACHING_VRAM))
>>           return 32;
>> @@ -179,6 +187,16 @@ static struct gpgpu_shader *get_shader(int fd, 
>> const unsigned int flags)
>>               gpgpu_shader__common_target_write_u32(shader, s_dim.y + 
>> i, CACHING_VALUE(i));
>>           gpgpu_shader__nop(shader);
>>           gpgpu_shader__breakpoint(shader);
>> +    } else if (flags & SHADER_PAGEFAULT) {
>> +        if (flags & SHADER_PAGEFAULT_READ)
>> +            gpgpu_shader__read_page_fault(shader, BAD_OFFSET);
> 
> 
> The name of the functions seems incorrect, it is bad offset which makes 
> page_fault.
> 
> So at least  gpgpu_shader__read_offset, maybe gpgpu_shader__test_read ???
> 
I will update the shader naming as gpgpu_shader__write_a64_dword() and 
gpgpu_shader__read_a64_dword()
> 
>> +        else if (flags & SHADER_PAGEFAULT_WRITE)
> 
> No need of "if (...)" - it suggests there should be another 'else' which 
> is not true.
> 
next version will fix it.
> 
>> +            gpgpu_shader__write_offset(shader, BAD_OFFSET, BAD_CANARY);
>> +
>> +        gpgpu_shader__label(shader, 0);
>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>> +        gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>>       }
>>       gpgpu_shader__eot(shader);
>> @@ -217,6 +235,17 @@ static int count_set_bits(void *ptr, size_t size)
>>       return count;
>>   }
>> +static int
>> +eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, 
>> uint32_t size)
>> +{
>> +    int count = 0;
>> +
>> +    for (int i = 0; i < size / 4 ; i++)
>> +        count += igt_hweight(a[i] ^ b[i]);
>> +
>> +    return count;
>> +}
>> +
>>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, 
>> uint32_t value)
>>   {
>>       int count = 0;
>> @@ -636,7 +665,7 @@ static void eu_attention_resume_trigger(struct 
>> xe_eudebug_debugger *d,
>>           }
>>       }
>> -    if (d->flags & SHADER_LOOP) {
>> +    if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
>>           uint32_t threads = get_number_of_threads(d->flags);
>>           uint32_t val = STEERING_END_LOOP;
>> @@ -746,6 +775,43 @@ static void 
>> eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>>               data->single_step_bitmask[i] &= ~att->bitmask[i];
>>   }
>> +static void eu_attention_resume_pagefault_trigger(struct 
>> xe_eudebug_debugger *d,
>> +                          struct drm_xe_eudebug_event *e)
>> +{
>> +    struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
> 
> 
> att = igt_container_of(e, att, base);
> 
>> +    struct online_debug_data *data = d->ptr;
>> +    uint32_t bitmask_size = att->bitmask_size;
>> +    uint8_t *bitmask;
> 
> In safe world could be:
> 
> uint8_t bitmask[att->bitmask_size];
> your approach seems safer, however.
> 
>> +
>> +    if (data->last_eu_control_seqno > att->base.seqno)
>> +        return;
>> +
>> +    bitmask = calloc(1, att->bitmask_size);
> igt_assert(bitmask);
>> +
>> +    eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
>> +               att->lrc_handle, bitmask, &bitmask_size);
>> +    igt_assert(bitmask_size == att->bitmask_size);
>> +
>> +    pthread_mutex_lock(&data->mutex);
>> +
>> +    if (d->flags & SHADER_PAGEFAULT) {
>> +        uint32_t threads = get_number_of_threads(d->flags);
>> +        uint32_t val = STEERING_END_LOOP;
>> +
>> +        igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
>> +                     data->target_offset + steering_offset(threads)),
>> +                  sizeof(uint32_t));
>> +        fsync(data->vm_fd);
>> +    }
>> +    pthread_mutex_unlock(&data->mutex);
>> +
>> +    data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, 
>> att->client_handle,
>> +                            att->exec_queue_handle, att->lrc_handle,
>> +                            bitmask, att->bitmask_size);
>> +
>> +    free(bitmask);
>> +}
>> +
>>   static void open_trigger(struct xe_eudebug_debugger *d,
>>                struct drm_xe_eudebug_event *e)
>>   {
>> @@ -1015,7 +1081,7 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>       struct intel_bb *ibb;
>>       struct intel_buf *buf;
>>       uint32_t *ptr;
>> -    int fd;
>> +    int fd, vm_flags;
>>       metadata[0] = calloc(2, sizeof(*metadata));
>>       metadata[1] = calloc(2, sizeof(*metadata));
>> @@ -1025,7 +1091,7 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>       fd = xe_eudebug_client_open_driver(c);
>>       /* Additional memory for steering control */
>> -    if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
>> +    if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c- 
>> >flags & SHADER_PAGEFAULT)
>>           s_dim.y++;
>>       /* Additional memory for caching check */
>>       if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & 
>> SHADER_CACHING_VRAM))
>> @@ -1045,7 +1111,11 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>                                  DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
>>                                  2 * sizeof(*metadata), metadata[1]);
>> -    create.vm_id = xe_eudebug_client_vm_create(c, fd, 
>> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +    vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>> +    vm_flags |= c->flags & SHADER_PAGEFAULT ? 
>> DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
>> +
>> +    create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
>> +
>>       xe_eudebug_client_exec_queue_create(c, fd, &create);
>>       ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, 
>> create.vm_id, bb_offset, bb_size,
>> @@ -1245,11 +1315,14 @@ match_attention_with_exec_queue(struct 
>> xe_eudebug_event_log *log,
>>   static void online_session_check(struct xe_eudebug_session *s, int 
>> flags)
>>   {
>>       struct drm_xe_eudebug_event_eu_attention *ea = NULL;
>> +    struct drm_xe_eudebug_event_pagefault *pf = NULL;
>>       struct drm_xe_eudebug_event *event = NULL;
>>       struct online_debug_data *data = s->client->ptr;
>>       bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
>>       int sum = 0;
>>       int bitmask_size;
>> +    int pagefault_threads = 0;
>> +    uint32_t *ptr = NULL;
> ptr can be defined in else clause.
>>       xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>>                         XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
>> @@ -1265,6 +1338,16 @@ static void online_session_check(struct 
>> xe_eudebug_session *s, int flags)
>>               igt_assert_eq(ea->bitmask_size, bitmask_size);
>>               sum += count_set_bits(ea->bitmask, bitmask_size);
>>               igt_assert(match_attention_with_exec_queue(s->debugger- 
>> >log, ea));
>> +        } else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
>> +            uint32_t after_offset = bitmask_size / sizeof(uint32_t);
>> +            uint32_t resolved_offset = bitmask_size / 
>> sizeof(uint32_t) * 2;
>> +
>> +            pf = (struct drm_xe_eudebug_event_pagefault *)event;
>> +            ptr = (uint32_t *) pf->bitmask;
>> +            igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
>> +            pagefault_threads += eu_attentions_xor_count(ptr + 
>> after_offset,
>> +                                     ptr + resolved_offset,
>> +                                     bitmask_size);
>>           }
>>       }
>> @@ -1279,6 +1362,9 @@ static void online_session_check(struct 
>> xe_eudebug_session *s, int flags)
>>           igt_assert(sum > 0);
>>       else
>>           igt_assert(sum == 0);
>> +
>> +    if (flags & SHADER_PAGEFAULT)
>> +        igt_assert(pagefault_threads > 0);
>>   }
>>   static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
>> @@ -1302,6 +1388,55 @@ static void ufence_ack_set_bp_trigger(struct 
>> xe_eudebug_debugger *d,
>>       }
>>   }
>> +static void pagefault_trigger(struct xe_eudebug_debugger *d,
>> +                  struct drm_xe_eudebug_event *e)
>> +{
>> +    struct drm_xe_eudebug_event_pagefault *pf = (void *) e;
>> +    int before_threads, after_threads, resolved_threads, 
>> pagefault_threads;
>> +    uint32_t attn_size = pf->bitmask_size / 3;
>> +    uint32_t *ptr = (uint32_t *) pf->bitmask;
>> +    uint32_t offset, before_offset = 0;
>> +    uint32_t after_offset = attn_size / sizeof(uint32_t);
>> +    uint32_t resolved_offset = attn_size / sizeof(uint32_t) * 2;
>> +
>> +    before_threads = count_set_bits(ptr + before_offset, attn_size);
>> +    after_threads = count_set_bits(ptr + after_offset, attn_size);
>> +    resolved_threads = count_set_bits(ptr + resolved_offset, attn_size);
>> +
>> +    pagefault_threads = eu_attentions_xor_count(ptr + after_offset,
>> +                            ptr + resolved_offset,
>> +                            attn_size);
>> +
>> +    igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
>> +          "resolved=%d, pagefault=%d] "
>> +          "client[%llu], exec_queue[%llu], lrc[%llu], 
>> bitmask_size[%d], "
>> +          "pagefault_address[0x%llx]\n",
>> +          pf->base.seqno, before_threads, after_threads, 
>> resolved_threads,
>> +          pagefault_threads, pf->client_handle, pf->exec_queue_handle,
>> +          pf->lrc_handle, pf->bitmask_size,
>> +          pf->pagefault_address);
>> +
>> +    for (int idx = 0; idx < 3; idx++) {
>> +        if (idx == 0) {
>> +            igt_debug("=== Attentions before ===\n");
>> +            offset = before_offset;
>> +        } else if (idx == 1) {
>> +            igt_debug("=== Attentions after ===\n");
>> +            offset = after_offset;
>> +        } else {
>> +            igt_debug("=== Attentions resolved ===\n");
>> +            offset = resolved_offset;
>> +        }
>> +
>> +        for (uint32_t i = 0; i < attn_size / sizeof(uint32_t); i += 2)
>> +            igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
>> +                  ptr[offset + i], ptr[offset + i + 1]);
>> +    }
> 
> I have impression we can put most of it into arrays, and drop *_offset, 
> kind of:
> 
> int attn_size_32 = attn_size / sizeof(uint32_t);
> 
> uint32_t *ptrs[3] = {ptr, ptr + attn_size_32, ptr + 2 * attn_size_32];
> int threads[3];
> const char * const name[3] = { "before", "after", "resolved" };
> 
> for (int idx = 0; idx < 3; idx++)
>      threads[i] = count_set_bits(ptr[i], attn_size);
> 
> ...
> for (int idx = 0; idx < 3; idx++) {
>      igt_debug("=== Attentions %s ===\n", name[idx]);
>      for (...)
>          igt_debug(..., ptr[idx][i]...);
> }
> 
thanks for guiding readable / clean code style.
I'll follow on next version.

G.G.
> 
> Regards
> Andrzej
> 
>> +
>> +    igt_assert(pagefault_threads > 0);
>> +    igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
>> +}
>> +
>>   /**
>>    * SUBTEST: basic-breakpoint
>>    * Description:
>> @@ -1383,6 +1518,77 @@ static void test_set_breakpoint_online(int fd, 
>> struct drm_xe_engine_class_instan
>>       online_debug_data_destroy(data);
>>   }
>> +/**
>> + * SUBTEST: pagefault-read
>> + * Description:
>> + *     Check whether KMD sends pagefault event for workload in debug 
>> mode that
>> + *     triggers a read pagefault.
>> + *
>> + * SUBTEST: pagefault-write
>> + * Description:
>> + *     Check whether KMD sends pagefault event for workload in debug 
>> mode that
>> + *     triggers a write pagefault.
>> + */
>> +static void test_pagefault_online(int fd, struct 
>> drm_xe_engine_class_instance *hwe,
>> +                  int flags)
>> +{
>> +    struct xe_eudebug_session *s;
>> +    struct online_debug_data *data;
>> +    uint32_t val;
>> +
>> +    data = online_debug_data_create(hwe);
>> +    s = xe_eudebug_session_create(fd, run_online_client, flags, data);
>> +
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_OPEN,
>> +                    open_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
>> +                    exec_queue_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>> +                    eu_attention_debug_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>> +                    eu_attention_resume_pagefault_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_METADATA,
>> +                    create_metadata_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
>> +                    ufence_ack_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
>> +                    pagefault_trigger);
>> +
>> +    igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 
>> 0);
>> +    xe_eudebug_debugger_start_worker(s->debugger);
>> +    xe_eudebug_client_start(s->client);
>> +
>> +    /* wait for workload to start */
>> +    igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
>> +        /* collect needed data from triggers */
>> +        if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data- 
>> >target_size) == 0)
>> +            continue;
>> +
>> +        if (pread(data->vm_fd, &val, sizeof(val), data- 
>> >target_offset) == sizeof(val))
>> +            if (val != 0)
>> +                break;
>> +    }
>> +
>> +    pthread_mutex_lock(&data->mutex);
>> +    igt_assert(data->client_handle != -1);
>> +    igt_assert(data->exec_queue_handle != -1);
>> +
>> +    pthread_mutex_unlock(&data->mutex);
>> +
>> +    xe_eudebug_client_wait_done(s->client);
>> +
>> +    xe_eudebug_debugger_stop_worker(s->debugger, 1);
>> +
>> +    xe_eudebug_event_log_print(s->debugger->log, true);
>> +    xe_eudebug_event_log_print(s->client->log, true);
>> +
>> +    online_session_check(s, s->flags);
>> +
>> +    xe_eudebug_session_destroy(s);
>> +    online_debug_data_destroy(data);
>> +}
>> +
>>   /**
>>    * SUBTEST: preempt-breakpoint
>>    * Description:
>> @@ -2344,6 +2550,11 @@ igt_main
>>       igt_subtest("breakpoint-many-sessions-tiles")
>>           test_many_sessions_on_tiles(fd, true);
>> +    test_gt_render_or_compute("pagefault-read", fd, hwe)
>> +        test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
>> +    test_gt_render_or_compute("pagefault-write", fd, hwe)
>> +        test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
>> +
>>       igt_fixture {
>>           xe_eudebug_enable(fd, was_enabled);

