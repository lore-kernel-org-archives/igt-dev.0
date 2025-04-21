Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5F6C369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 09:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835BB10E06B;
	Mon, 21 Apr 2025 09:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EIH48/Ob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D037210E252
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745226906; x=1776762906;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8kZxjdkRDYqas+EOQKJV2bATLdQFYTFnpx5+dDaIKjY=;
 b=EIH48/Ob3Of75ruFyFMYJBbd2FXl21wcXeLgMX9XTX2T8FSNjjKfkIUz
 gDgkV5ohLbOzmg6QWxmDhVnribbU5c6R6ub09+e3LTX4IEHgvr0jPNT1Q
 GaFQESd6E0FnrsLYQlf7xIAxgwlx5I6CI0v97VMMjL8puFygtzrXYW0qI
 l9BgsnT41CPDKZh0jdeynNThQe8hx9IfvzylaK8ezV1YLEW6t+LmV3aje
 de22hq/qdj/5l/U1g3+4x/G82bFp/V3J5Q9+seB0WRMoZkX5+rgMCaq4g
 nZFjvgmHgURQG2AVUVBXHUMHZMq1j39wMQ5zpIdZl2fbsb6lRtcs5yId4 A==;
X-CSE-ConnectionGUID: mwd5Y7HzTfqmhgvEKoNrug==
X-CSE-MsgGUID: iGd5I9VMSnWnzmGfEH6kxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="57403751"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="57403751"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 02:15:05 -0700
X-CSE-ConnectionGUID: +AcH93bORY2q6SL8vieytg==
X-CSE-MsgGUID: xsWx96auTTyWYx4h/+YT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="154843619"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 02:15:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:15:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 02:15:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 02:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kev3kcjtxKGuNMhGjyO20+xDlTPrTFKC38yjowCyc0+Zl9ShXuusRjjny1tBf0dHAtyVrtRTAlRafnDB0apySPg3OohN4q57CLF0TPh6WTC97wxiPTNYpp0N9RRScjR2QZnsxX/b8ZjWeog8muQBQDNjwsfGwKHVp6+PNTwURrOsQ4akYzMYaIT94nRDPkV00D+2TGzfXpTmKtzhDwvG7F6yXdS8AoDmqoNhwrI5hyKYvjcRTL9C4h5UzzhYL8wmTiJ3aVayHYbW8uKuTUCyfdxg/oLyChGDqrAY8kH6LvSX8lpqqqNPd6CC/B5IV/xr2FeaMvI4t0JUvg1A/QI55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtOT54fNFLKRzHuOQIgbGXyvi420s4rZ8U23pf0TFK8=;
 b=g3DEFOwslnh61cCky06UAV7IbZEQBa/htXaT/+NARfwmNkKAruklXYksvjnAz+Xu60heZUjszwK4yqPk8SVfH98kCSpRECI0oGjD10PFT6Lfh4sYRBe/yIMTPm/sSzZy6hFYWx26TE6yd4iK/CCpQtnIvUF+msGsOyWXMWtlqz3KPCVIIyOIyxG+7Hh/miDWfh9F2qvvj2HIAstQc0tsx6niCifJv0kd+Yv/1Lb5TzE/x04a/ud6N2GJcIX4E9c2sd6DL0Cfsg8t/9llsm57s1UY1A/6NAB196Yi3AylVA0Rde64OfT3N97RWacjzsddCDlZImNu2Tbv7rQTo6pWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 09:14:43 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 09:14:43 +0000
Message-ID: <790a7587-c82a-4651-9af5-9538f1a9eac7@intel.com>
Date: Mon, 21 Apr 2025 14:44:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/kms_async_flips: Split subtest to
 handle linear buffers separately
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250416150348.2901159-1-santhosh.reddy.guddati@intel.com>
 <20250416150348.2901159-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250416150348.2901159-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::11) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e4fff2-a18a-4d71-3aeb-08dd80b4f3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEFGQ0R0SGxwK2lMVEdnSFFZUjNSdHlVY3ZzL1RjNlREdDYvdndBVnZUTEJB?=
 =?utf-8?B?bkJCRjBTSnJESU5jcHl5aElyZEV0VkMvR2ZJdU95Qms1ZVI4bCtkL2hEdWJQ?=
 =?utf-8?B?bWRvWGZCTHVpRkRVZm1TQmM1VzJRbTFPTktXbTBwZm1ZNTdlKzM4QnhtWlp4?=
 =?utf-8?B?eVE0SWpjTUJERXdnR1lDdDB6MlFOM05ZNVRqVEpWZ1RBdEwzVHlmRno3RUs3?=
 =?utf-8?B?TkZyenp3RXZOOGx6RGFPWUI1NUNkZzFHL3pqZ2hFS01VM2g1WGlDWWNJYVdR?=
 =?utf-8?B?dVJKU2YyMk5NazBmdDR4eW1xTXIvcno4RWlQVEthWU14eDFUazZOdkVTeDds?=
 =?utf-8?B?LzhFMjVJV2IxbENEUnFpVkFoUFp3MlZnbzR0QzZIMWpqWkJUY09YTVdFQkVj?=
 =?utf-8?B?ZXUwYzIrbWowQTlKa09Mc1U0MldsU09Jc1JzbUpiS1U4Y3kwY2pTNVZZVmJq?=
 =?utf-8?B?WnVsR1lDTDlVRzBDbXVCMk9uNS9QT0J4MVB5N0pvK2Uxa0RKcWVSbUR0clVE?=
 =?utf-8?B?MHYwOHh4RENvTENpanBZSWc2TlpaSEEvcy9kSnJrTForZFFqZytTMzc0MGt6?=
 =?utf-8?B?Z21mYVY0VnZyN3FyOVJPVXJhQjVvMUhtMmd3NUo2cC9vZEN0b2kwdEJFNlNs?=
 =?utf-8?B?eGhuc21KdFJ2Y2x3V3J1THEvRDAwSWprSEZGYk1YazZBZWEvMmpDNEtqNTd6?=
 =?utf-8?B?T2VOT3N2RkpqZGd1WTFHMm9vTEVLam9HZzczMzY5bWsrVzN6WHA2VUtSY3dP?=
 =?utf-8?B?TGx6Y3ROZVF5L0ZvRnRQWjhvUXZ4RXA3Q2dpWTNBY2xEempBLzZqYkcrNFZB?=
 =?utf-8?B?RFlHdWNXcHBTSURNOHNZWXVJSkJ1L05oR3kvWFBwbVgvaityVnZiMjI5eDVZ?=
 =?utf-8?B?Ylg1eHRjbUh3SE1rTHgrakVpU0dVZVdxdGpKb0MxV2xoSG9WQUY3WXZGNUV5?=
 =?utf-8?B?ek1UWU9SK1NiRXhZOE5WTkFGbzFZK25KdkthY2FlLzc3M0VjQS9VbW52RmZH?=
 =?utf-8?B?bXpGSVlUbGdEeVZjd0diRnBya0pQVWRtb2pSZEtNQWE0VDBSUk96UzUvK25F?=
 =?utf-8?B?OVREaXBoMTljRjZkYU1DQ2prVkdjcmtzSTZUUUh1cG5kc3FRWEpqeXZSOEZz?=
 =?utf-8?B?OUlGZW9rSWxITURpL2U0SVdyNzIzcGNhL0xVU0x2bDVySzdIS3JjWGRaZm9N?=
 =?utf-8?B?TEp1NCtRczRBQm5XNk9sbDZvMGltQlN0U3BBNTBkNUN2NFd1dHhuSThkRElJ?=
 =?utf-8?B?QUwzbWIxVjN6SlZscEl1UHdhMVk5V1RTUkhod3J1RFhKK0FuVlBHNU1xSEt5?=
 =?utf-8?B?Z05HNS80akt1ZzZFdjlOMllDdjlqWEE0aVgyODZWVnIrczQ5K3Z4TWlJZXMz?=
 =?utf-8?B?cDJXaTMxc0cvZzRRRFJaLy9ITXZPaTFIbjBlOVBoZEp0TnYwK0VXNEhvU0g0?=
 =?utf-8?B?SVQyRCtWTWdDNmVhRmM1U095R2pDRURDaWhldEl2RWZsR1k4QUFZMEF3bVRz?=
 =?utf-8?B?dUE0R0JONTFKeWUwQUFtOUo5dkFFOHhiVGRzTUcvYnpma0wwUFpjVktIRUpr?=
 =?utf-8?B?Q3pCb09XdTJvY20vOEtYQ3FRTXV3NUU1di9Rd016ZHRBbk9NMDBJREtwRWVl?=
 =?utf-8?B?cUpPQi9PaGhCWllvc1VYRkhwVGkvb1MySHFhSUNGU2NyQlFpTC8rS1AzcHZJ?=
 =?utf-8?B?MFNHUXZCek9sUUg2LzZyLzkvUGtwYXJraXBHQVluUlZ3bzdNNVhDL0VTckcy?=
 =?utf-8?B?NEU5V25Mc2VZaFFteEVWR3lPSVRkQTB0OVFIN0d4STN4VGlmcGl2WjZpRjN3?=
 =?utf-8?B?Ni9PQ0lPRlJCNWJuandVL1QzbWxoYWhiNnVUVXc3ZkxhZmxlLzMraHZqM3F3?=
 =?utf-8?B?Y0FtU0VMQURvOU8vVTBQS1E5Y1Y4cSsra3AzTlJjQithbHJVWEx3WVVEN214?=
 =?utf-8?Q?sL5zWHjpZJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkhlZjBjbTNIZ3c0dytTMDlMK2tINzRmY0RMM2htbjFGek5pS2RVNVR4NGly?=
 =?utf-8?B?TlBQa3E4K2Nqd0xXSmFRWmFSUlpwelZSTWF6K2JBWFcvdElFa2F0V3QvVFZN?=
 =?utf-8?B?V1o2emtFRGRKTVp3d2dEbml1M0dMKzlJazVXRVJxRnpUUjJLZDBpZTJ2a2FW?=
 =?utf-8?B?czNPeVhJWHNQOFZ0NE5Mem9PTENWbWVJdHkvOGFHMEdxT05qY3crTkVKSFlK?=
 =?utf-8?B?MThBRlQ0ZU95TGxsTEMxSTNqY1V3VXkzcEJrMHdweDd1UDA2aTV0N0p3NzVQ?=
 =?utf-8?B?ZWJ0c1daTVpieU1zT2VYRDQvMGdYZDVMUEN1NzFTTjgzUW93TVVGbFNNN2dR?=
 =?utf-8?B?NjVWRnROZzBwZWdaQ1YwTU9VbGxDMGJKYldRdkM2SFVQdmlFbGZ6WUVOTVJ1?=
 =?utf-8?B?elN2WFllaDk5SzlJMGEvekxOOG1DWW80RlFCd3JtTGFiS29IK1hQb0EyWmFE?=
 =?utf-8?B?bVM5b1hod0JUQ1FJbmw5RDJhOHo5ZzFyaG9rNHVBczFIQ3kyc1pkS2U3MGVY?=
 =?utf-8?B?MzNJTFBSQTFFbXBPd1pLMTFyWFVLRHZTOTdvckhrelZLbDA2SGgxWXhzSjYv?=
 =?utf-8?B?S3ROMi84bTA1a2RwQklLeSszeGdzVG41bFZJZW0zNUtRMWtMOFZuU3RaRVgw?=
 =?utf-8?B?aXgvd0wzcTNTa3pic2FldVNVQzNtMnI3YkFnKzBkeGtLUlR1TUpLc2UvTmV5?=
 =?utf-8?B?NXVUdWJ4QVV4bjAvM3psaE1aSkFWNGtsWW1xYVVXSTFwNjBEZmN5YUZvZUdq?=
 =?utf-8?B?MUd1QTRCRnlYSkI0ajlCa21OY3BkWDhKRTdCaWdZUXBUeHk1bTE5cGVLSTM4?=
 =?utf-8?B?Q0lQTTBFbDNtVDdKZHBudGVyR2gwam5ZNGUvQ1M5dmRVLzNYT3JWZEwwTGph?=
 =?utf-8?B?aXRreXBTNkJpYUp2UlhsYWp1b0VMckZ1SkxqTWVrNTFtOHRhM0hxZ1NGTlk1?=
 =?utf-8?B?di9jUk1PQVRuZkIyWmt3QmVqNDk4QUFIY0kzSnZPeG51ekcxRFBEYm5mOHV6?=
 =?utf-8?B?RGo5WXhZV0pOaEFlYWlveEZBYzhXcmk0Q1dwVjVYVnZ1NUlUcmNJcnVyWDBk?=
 =?utf-8?B?bnJBbHlwVkd6TExHMXNUWGUzWHFTRWRiVGxtcDJxMVprb2JFTm1OK0N2Yktq?=
 =?utf-8?B?V2FqZXlGQStwY0dnWmRhTTU3ajF2dWs2VDdtWjJack5pNUZaLzlweDRHbnp2?=
 =?utf-8?B?VVhPUHVUL2FtMnBqRk1OVmhEbm0yUlZSaTFORGhrU1NnSmg1VEtvMGJvdXdq?=
 =?utf-8?B?RzZQSDlzUitCSDBEa2VoS1pQQSttaVR5blRISGZaZ1hsd3E4VDg0b2ZIa0tx?=
 =?utf-8?B?cjNkTlJMNlo0RDJWMTRnOG1qTG1RbGhlNnlQNGNCRmtiRDlGbkhoTFM0MlJT?=
 =?utf-8?B?R1VwbVQ1dlJIRmJEN3VVYWhTR05td2pCbk1vdmM4MzhTaVM1ZzZxY09UVFR0?=
 =?utf-8?B?Z2ExdkFLZ25ZaHkrMjZVbUlGenU3cFRYb09TMEJFMjlBL0dBSHJMcmNRNUh3?=
 =?utf-8?B?MGlGSnhxNmtwSHdEdUtYR0tGMDFMVTBGbzdlK2RINjhUUjZyNDB4b2U2UDNP?=
 =?utf-8?B?SU0xSzhEakZVa2VnTEkxRUZwZ3IvRUhucFZhM0pLdWgvRVh1a0dCYVA3YzBy?=
 =?utf-8?B?LzZQL2dDV0pUU00zS3NuenR3Y0x2QWlqTjBWSStuYVc3T1ZDSVhjREt1TmJB?=
 =?utf-8?B?bmZSazRDNEtTc1RodXNJc01zSjEvTzZVNlF2Z2FXUDVtMi8zRGlXT2lqRGZ3?=
 =?utf-8?B?TWJoMDIzTzlacDRkd2hrSGFtS0RHUGx0ZWZibExiNm0zVTZFUU51SUVOd1Bn?=
 =?utf-8?B?bS83RjFkNmJKSmNqOWJXbldoS3h2aGlkUjJsSFBoYkNXbFQ3dFpyQ3JPUCt5?=
 =?utf-8?B?T015ZTRHWW1uc1U0RXpXRmZSWHEvQ2x4NHNwQVc1aFdkRFhFS2JFVzduaEcx?=
 =?utf-8?B?djlna0V3d3Y4TE1XbmZhOXV5TThlaWJmTlRQYy9nN3AzbW5VYXJKeVFLZ3ZG?=
 =?utf-8?B?M1JJcVhVbFpvSjBGc3VZK3ByRXdramRBb3gxWFZKME5KcjRTUWE1UEdhWHpQ?=
 =?utf-8?B?K1FvSnc1eVQ4elJoQkkrVG53dlhuaFk0aW05VjBQU3d5dmVtOUFSTTNaam5y?=
 =?utf-8?B?UXlDUjQ0T2ExSElGK1RlbHdDUnN0Z01uM004SWNrWFhJUjFuYzAxaVFCcHVW?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e4fff2-a18a-4d71-3aeb-08dd80b4f3a8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:14:43.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6c+eVrHwZmxvC2t9lgGfFqglAFVHZ+0/OUFeY8nNq4XAEhCCd1FuavtGMzDgecdw5WZFBtWQBycwiKb2ZbdwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

Hi Santhosh,

On 4/16/2025 8:33 PM, Santhosh Reddy Guddati wrote:
> As linear buffers are considered corner cases, split the existing subtests
> run_with_modifiers to handle as a separate subtest.
>
> V2:
> Rename existing subtest to tiled modifier and make the tiled subtest
> intel specific, fix linear modifier subtest to avoid skip on non intel
> platforms (Karthik).
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 53 ++++++++++++++++++++++++++++++++++-------
>   1 file changed, 45 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 031417ed8..a3defe604 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -45,7 +45,7 @@
>    * Description: Verify the async flip functionality and the fps during async flips
>    *              Alternate between sync and async flips
>    *
> - * SUBTEST: async-flip-with-page-flip-events
> + * SUBTEST: async-flip-with-page-flip-events-tiled
>    * Description: Verify the async flip functionality and the fps during async flips
>    *              Wait for page flip events in between successive asynchronous flips
>    *
> @@ -66,7 +66,7 @@
>    * SUBTEST: alternate-sync-async-flip-atomic
>    * Description: Verify the async flip functionality and the fps during async flips using atomic path
>    *
> - * SUBTEST: async-flip-with-page-flip-events-atomic
> + * SUBTEST: async-flip-with-page-flip-events-tiled-atomic
>    * Description: Wait for page flip events in between successive asynchronous flips using atomic path
>    *
>    * SUBTEST: test-time-stamp-atomic
> @@ -88,6 +88,14 @@
>    *
>    * SUBTEST: overlay-atomic
>    * Description: Verify overlay planes with async flips in atomic API
> + *
> + * SUBTEST: async-flip-with-page-flip-events-linear
> + * Description: Verify the async flip functionality and the fps during async flips
> + *		with linear modifier
> + *
> + * SUBTEST: async-flip-with-page-flip-events-linear-atomic
> + * Description: Verify the async flip functionality and the fps during async flips
> + *		with linear modifier in Atomic API
>    */
>   
>   #define CURSOR_POS 128
> @@ -128,6 +136,7 @@ typedef struct {
>   	struct buf_ops *bops;
>   	bool atomic_path;
>   	bool overlay_path;
> +	bool linear_modifier;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -266,6 +275,7 @@ static void test_init_ops(data_t *data)
>   	data->alternate_sync_async = false;
>   	data->atomic_path = false;
>   	data->overlay_path = false;
> +	data->linear_modifier = false;
>   }
>   
>   static void test_init_fbs(data_t *data)
> @@ -792,15 +802,23 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   		test_init(data);
>   
>   		for (int i = 0; i < data->plane->format_mod_count; i++) {
> +			uint64_t modifier = data->plane->modifiers[i];
> +
>   			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
>   				continue;
>   
> +			if (data->linear_modifier && modifier != DRM_FORMAT_MOD_LINEAR)
> +				continue;
> +
> +			if (!data->linear_modifier && modifier == DRM_FORMAT_MOD_LINEAR)
> +				continue;
> +
>   			data->allow_fail = true;
> -			data->modifier = data->plane->modifiers[i];
> +			data->modifier = modifier;
>   
>   			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>   				      data->output->name,
> -				      igt_fb_modifier_name(data->modifier)) {
> +				      igt_fb_modifier_name(modifier)) {
>   				      /*
>   				       * FIXME: joiner+async flip is busted currently in KMD.
>   				       * Remove this check once the issues are fixed in KMD.
> @@ -844,19 +862,38 @@ igt_main
>   			require_monotonic_timestamp(data.drm_fd);
>   
>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
> -		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-tiled") {
> +			test_init_ops(&data);
> +			igt_require(is_intel_device(data.drm_fd));
> +			run_test_with_modifiers(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Wait for page flip events in between successive "
> +			     "asynchronous flips using atomic path");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-tiled-atomic") {
> +			test_init_ops(&data);
> +			data.atomic_path = true;
> +			igt_require(is_intel_device(data.drm_fd));
> +			run_test_with_modifiers(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Wait for page flip events in between successive asynchronous "
> +			     "flips with linear modifiers");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
>   			test_init_ops(&data);
> +			data.linear_modifier = true;
>   			if (is_intel_device(data.drm_fd))
>   				run_test_with_modifiers(&data, test_async_flip);
>   			else
>   				run_test(&data, test_async_flip);

With this current change in test design, we could just use the run_test 
function itself for linear. This would eliminate the looping for 
non-linear modifiers which we're anyway skipping eventually. Also, 
inside run_test_with_modifiers we can reduce the checks as we would then 
be using that function exclusively for tiled modifiers only.

In run_test we would just need this one change.

data->modifier = data.linear_modifier? DRM_FORMAT_MOD_LINEAR: 
default_modifier(data);

Thanks,
Karthik.B.S
>   		}
>   
> -		igt_describe("Wait for page flip events in between successive "
> -			     "asynchronous flips using atomic path");
> -		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
> +		igt_describe("Wait for page flip events in between successive asynchronous "
> +			     "flips using atomic path with linear modifiers");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear-atomic") {
>   			test_init_ops(&data);
>   			data.atomic_path = true;
> +			data.linear_modifier = true;
>   			if (is_intel_device(data.drm_fd))
>   				run_test_with_modifiers(&data, test_async_flip);
>   			else
