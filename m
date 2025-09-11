Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0B5CAC58D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 09:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A82410EA57;
	Thu, 11 Sep 2025 09:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZV8L/mv7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A3810EA57
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 09:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757581948; x=1789117948;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rYCNXd8mFDRWAK9c9SxV2xtuxzVE1MXmCRuWc5INCpI=;
 b=ZV8L/mv7C1X5UoZk9S87aWQhN9kc+Zz5DAhUK7ev+CFjkzBCverPNgPN
 DKr580bfuEPBEjwC7z1j+Qz/lURR9er48x1h/YPeBEaRo+pQDWmHNQZ7h
 0U5hcMQKJmVpW84z4YvRwTMHsA2S5jrMN0p7jztNYYoo5JF5D1gunoCLX
 K4a4hQ6V0nlR+V2xvOrPb+c7dr+p8rv7YZpnNEdH81MlUiSwI1VcgwWLY
 9sG9jqgb7E8tjtMMQQ8gJ8s/IgzeDAG97SdVj9txSzn2qwzH+S0Q0LKFk
 KfYl1lVFs8IofsdwdLoocpzMJ0TTDyTbd6IMgRkA93KidQJcovch2GLNA g==;
X-CSE-ConnectionGUID: feA746YJT6evYexbIQYxbg==
X-CSE-MsgGUID: g9qvXrY9RYuvsnLh3YewKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47479754"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="47479754"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:12:28 -0700
X-CSE-ConnectionGUID: hOX+1Wp9T7CS3CJ+Iz9BMA==
X-CSE-MsgGUID: XAC8K9F2RcCJvLNmk5N+sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="173208992"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:12:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:12:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 02:12:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.79) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnBVteJr/A1Wco4TOOUPXdzz26FAxkbaLLuVqa8ivhAvdx4PipTr+H92I33OETsac2PxjNUZjbTPPDRjaRYB3dx7mlsRJgKbvaVinoqjXhOHiOMYeCWCPyLPQwUw4GLX5YWd81CuYnPFpuRKmKeeuhIMezyltweR1aQmH5VezjoRk7hbqoMfHwDjeTt/Vn64Cg+/iEDIvwtsI/n8d7ix2nQYihkScyMOv3dEFuvE3S3ATyK8kv36KpnYIu1pycj9rHcUujUQ5gcR4GSCvS9HxmCp9GzOyEMuCIAhtbvlV/g/4kcJAalyV1kdHOo30hpBCT+sHqrIhTr7xHFCgy1e3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFGZ2o6hQ+JQT+w1fHaiGDh/4U6B12wZToWW6BgC6aE=;
 b=WL0fTv4Tjog7xUqeV/7UhhZA+73Au9pfpW9SJOQc8N8XzWDMXoxzzQNsi8QYp/Bui6OWdaQn5V0GrQpHFU4w7h98aT/KELnwpyhb5WJ65Zw8821cvq4w9clBjmIRLLryf9s/XZO2/2r538t4g3IVmwluvr2CcJgnmAFlFvk1uwUP5Fy5XnHdy9e64oTo/d7SZEdooPdPKRodd7+ftujc+NgqrPpow7WQNaDdOfga0Q1mYc3FIuDcqzgFmg0Bx8W1zvqwi5zWbl4dYIYkhHc4hlyQq5dFyIIERhF3J/fqwZgsmt8bIu2XvAHMSKT0X/SsHlNtooSaunYbQ+fwl/uD9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9039.namprd11.prod.outlook.com (2603:10b6:208:570::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Thu, 11 Sep 2025 09:12:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:12:24 +0000
Message-ID: <e42dcdfc-105d-42e7-9367-ba5cdb49686f@intel.com>
Date: Thu, 11 Sep 2025 14:42:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v4,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>
References: <20250910192031.1908588-5-sk.anirban@intel.com>
 <20250910192031.1908588-7-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250910192031.1908588-7-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9039:EE_
X-MS-Office365-Filtering-Correlation-Id: b77cf6ba-7c3b-4aad-3b2a-08ddf1135219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emIrdHFDRnJsV1FDcWFLMmcrZS95T1dBcEY2WmhXb0tXWXdYZzI1SSs4MURF?=
 =?utf-8?B?WlRlMDRSZmZvS1Nyd20wdnNRblQ4anRZRlRmaDUwZmkxTDR4bGZsMHhGK2lJ?=
 =?utf-8?B?UnVkeDlOdWJxQnNENURpNWY4MVpPWDMyWVdzUkI2am5jQk5GSkF5YU5zRmlu?=
 =?utf-8?B?YW9LdUlxMnY3ZzU2SmU1c3hOS2oxM2xhV3lNUGxsS0w4L0d4Y2RDRUhGeVRq?=
 =?utf-8?B?Y2FyaHk4eGRqblFObkxocUxQSWFDck42K0JWcFR5aFBEanhWVDJPdHN4aER5?=
 =?utf-8?B?V2ZhY1k3YkZUMDBTOER1ODlDdDN3NUdHeTI2dzVabG9VSVdFczRTTVdkQ0dw?=
 =?utf-8?B?bEpNei95VDVzN2plK2NEQVZXa0FRMjVsTk00RmtMSEZQZzNjc09MVVJjMnEw?=
 =?utf-8?B?MGpHM0VPbmltTXgyQjAwYzcreDZOMkNFay95ZmFVTHVCWnNQZUk4cjlHcUhV?=
 =?utf-8?B?clJHVGhFc21YSHprbEloRU9vc3lJNUhCNld3STVrQzdFaW85d01VbjhPUjM1?=
 =?utf-8?B?U1YrcXRaL0p0RXE5RzlDazhqMVczVC9zNWRmTjlEazFBMkIrdW16ZDJCT1RZ?=
 =?utf-8?B?RkV2N1o5TUZYTXo4L3dIOG1hc2JmOTNxa3k2N3JEbG54T1Jqdlp0RTVKeTB2?=
 =?utf-8?B?L0tGcjFoV0toekJmKzh0dzFTWEhqM0hzUkV6cHBVWkc3bW9BUUhiRW5RL0d1?=
 =?utf-8?B?a2NFdWhacjlXZjRMMlBMbjBPR0JzY1RTR3BjN25qSFQ3cEYyY3dFa0pSL3Yv?=
 =?utf-8?B?V0FPenhEeU5XNGJRd2JoMHBPb1ROSWsvY1NRcFBCWXpGUzJHM21ZaXZYQ204?=
 =?utf-8?B?VStPWk9qMWpNQVVoalZSNUJVaTZ5THpiYVBPNVdRTitQaUtoQnU0N2JjN2I4?=
 =?utf-8?B?bjlLZkV5SlBUbm0wY0JEN0VaSHVSWXdvY1ZROHhSNlczREN4czJheWJGWFVn?=
 =?utf-8?B?N0RxVzg4ZTJaN3ExQ0NmUGEzajN5U1pDTURLekRnQ3Z3WEQvMk44T3R1SlpF?=
 =?utf-8?B?M0tQeHRBcDZNcUVlcnVlS2ErK29ZNllwODZVRjdkTTZYQU1TZkpLdk9XRlVK?=
 =?utf-8?B?cVRJbm9RUEZNSkdiejNmUTJ1Wm9KZW1wTU8wTkZKOXc3cGNXT29oN2dwaHNQ?=
 =?utf-8?B?Y25EQWlld2ZXS1VuQTdkN0k1ZGRvSXAreVJTeWdsTjlDZlV2a2xicFgweWNK?=
 =?utf-8?B?OUxteENIcExrelpkRWhEU21YZ2g5NDhlbHJiRGN5ZmlpL1NQTWRGcjE5QXh4?=
 =?utf-8?B?VWw1ME9kMGR6b0dRUDlHbEZ6ZDFHVVFHQVF2Zkdsajl0enhkVDNFekFXd0p3?=
 =?utf-8?B?ZGMxaUlsRnh0MEFtcTNtbnFidldncFJVaUFlTTUya2I1N3B3WC9sYlcyOEZJ?=
 =?utf-8?B?N1UwWUNnZ0dNK0lxWnR5aXNDWEsySWRncHJhYzExMWRFVldTYitaWFhZc1F4?=
 =?utf-8?B?TlF0UWg4czYrNjZpNGVmWi9tMzErMzV6VWNEdU9UdTRiVkNGd0NmTnIraTNW?=
 =?utf-8?B?M2R0ZXV1Mi9iZ3pIaGozdkFEN01KOGR5Nk01bXVaekszQ2FjVW5KRVRRT1ZV?=
 =?utf-8?B?bzhQYUk0dEFhalZZOW95c2pRSlJMSHRmZkpMTUFUT0U4Nkp5NmVUUFdFOCs3?=
 =?utf-8?B?djI2K2tCNFVHTjZ3VzlHU3VkempqUlJCQ1RxdzBnSkdsbUlBaWxIZ1BUVytJ?=
 =?utf-8?B?eHlHcGQ5aHdzaHpzckhGeFgzdUg0eXM2dHFqZ2pFTk44b2FXekFacmtoK2hL?=
 =?utf-8?B?TzNzZWtOdzVYN2R1cU1IeC8zQktmM3MxcWVQUktnS01zVTVFQ1dDR3VCTlVS?=
 =?utf-8?Q?p9WYRTvInBwSCdRIVe5X4KTAAtD5cpHhPKZJA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djJmL0gzTEU2ZzhtbDQyY0NSaGJKVVc0cXlCbGhidmdZZENreWdoKzhUOExL?=
 =?utf-8?B?ZG1wME5SakNpVm5wUUtqNUlxclZUK1hUR3VCZmttZmFEMTlZazlkU2MyVFBu?=
 =?utf-8?B?Y1EzU2kxNWRqTUhjM2p4T0VYK1hZell2QmZ6MUExRHlCUUdhSUFtbkh1d210?=
 =?utf-8?B?M2ducWdQUkpXUGdWWFExK3ZyNktNS2J4M3lWRHloN2wvYlQ1RG9mZVJ2b2Nz?=
 =?utf-8?B?R0JLazVGdHBVbk1vYTRSZTVIOUpUdHFGQUx3cjJTVXgwaWY4MndCUTR6bU81?=
 =?utf-8?B?YkxJMzV1a0dXdHVadW9uQzJWYm40QUc1eTRPd3RVbXVoR29QbURuYS85Snpw?=
 =?utf-8?B?d3Nxc3BhVmkxUVhDcHc3NTNCd3JpSStIakFsU0JQWWJsR3E0bU9KWmtKSjE2?=
 =?utf-8?B?UXhzZkZMZTJlQWRRUEkySVd2SEZEQ29Rbm1zT2tYaTJIaDRaYkUrOGR5RFlL?=
 =?utf-8?B?cUhISEYzNU1kV0c5bE9QMkVYK3FtSjkzQlczRFBJUFhXSy9oUjAvd2dZRHYz?=
 =?utf-8?B?VldqYStYckp0YVdadllHL2E2cmFDWHIzMHVwbkRIbFVSYmNmdW1QbHdZd0Qy?=
 =?utf-8?B?NGhRdGdrUjk4dW9LZnFwSXd2WWRpTzhvV1NZMTR1ODNhSmcwY3M1cDN1K09I?=
 =?utf-8?B?czZZNWpJdFoyK2piNFJQclkvbzBFREZYZEhnY0p5dzM4L1ozRk93SURKL3hl?=
 =?utf-8?B?OStuRjJpVkRmREtmNEh1SjY2WXBQWCtKdUlqK2xZMXJOVWtGcENhTk90K2Ir?=
 =?utf-8?B?VVdiTms5NmI2b3c0NndaOWozemlCMFZjeVV5enpsUmk0SElCc3Z5dmhBajdy?=
 =?utf-8?B?d2VveTUyeTM3aXVjNVV3MHhjQnB3T2x2UWgwaXZoUDFqQlZIWmJ2ZnhYSDZj?=
 =?utf-8?B?VmlNOXhsKzhFZzRQV05KVFgzU1p5WnBIRU1kbGJrc3BJQ1p2cnNqaXowcmdX?=
 =?utf-8?B?N3ltV2Y3UzhiVjBpcDhLQWYwbEpJR1hmdys4cGlxOGY1RldRNE9qbkN6TmxB?=
 =?utf-8?B?Qmptb2xYQ0JuVzQ5aGJLelFGNW4xWmNHeGVJY3cxTW1PK0tld3I1RDJ1N05K?=
 =?utf-8?B?SnFiek92YTdBNVdVcWJqSzFiVDBseDhhRElORHVadWF1cFlCU2VBam16bnRN?=
 =?utf-8?B?SDVyUFp0dnBjdzkyTVY0OGNGbUhXbVFNUXpSM3RRTUt3WnQraU5BZTNCTmNl?=
 =?utf-8?B?eVZoMzNBZzFkbnNZS0NyZ3JzbFA2a0NpampHQmZFcjAweEFjRnJ1SG8wQnNJ?=
 =?utf-8?B?d3k5ODBYMk5hd0dWOVRmc1hKeWdwNjNNL0RQdGE4YnBxbGhqTlBmcmo2akdD?=
 =?utf-8?B?dTF2RXpvTEMvNkJjOG1MZUZSSzN2M3BBKytyTWc5OVRSU2ljcmZhcWxmY2tR?=
 =?utf-8?B?b1BKaXRVTUxqUEZIbENwTm5mQTZRV09oK1piQjJhSzJLZU1xNk5wNThwVW9O?=
 =?utf-8?B?eVprZERlaXVsamVPU0RkN3YvdldiekJkZnNLdTl3bUFGd2RFWmd2S2RFd2hl?=
 =?utf-8?B?b3hPSzh5SkhKTGxLZGcwYUZYYnJHeUZaM25WMkg2M09GRWFTbVJqbjlwRk1F?=
 =?utf-8?B?bUUzV3lSdUZ1S0sveDk3UjF3TUZydHVSUUlOL0I3Mm5XeFA2TitzR2hUdElB?=
 =?utf-8?B?WVpZb3FVQjJ4b0c0R0RIU1FSYlZ0MVJJaGJJaE5Bc05rMzhkdGVZQXd3RkNG?=
 =?utf-8?B?NXlGRUpMR1FpcWJOamloKzJCUDlkSVZHNElKYkM2RXZLZHRyLytiVWNNNDNM?=
 =?utf-8?B?aVU3TkswWTNzVmduQUFNZkZOenVKUExXelpTRkJRTFlyUzM5MDVFQXdYOC9i?=
 =?utf-8?B?ek1GNU1HUnFYZU1tZ2czbW9zYVg3d0FKODhmUHpRdXJ4L3J4aUJjTmZiMlMz?=
 =?utf-8?B?NUIxalhLQ1p4RFM5RHU3QjNVcHhKTkx2OHl5cEVvSUJLS3lNakR2cjVDMjli?=
 =?utf-8?B?UW8zQURjakFwMWxnNUtSaHZ3YlhXYUtvNVpMWm1Rem1qRUFSdE1wWnBxdlYr?=
 =?utf-8?B?TTZDMGluR3RCeXpEY1FlYWpFMVJMdmJsc3VDcFdEVzZ5QjR0aURMdEdQTVcv?=
 =?utf-8?B?QWc2SUhrd25nYlhkUXFZOWpoRVFFZng0NWRzYzkvblJwVGk2Z3ZhYXJoNFRL?=
 =?utf-8?Q?8IFH/JXiK8Kq6FAaqW4TcLuJV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b77cf6ba-7c3b-4aad-3b2a-08ddf1135219
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 09:12:24.4193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxemCt/F1FX+n+9yT/ckrfT56W8FzTNJqKFYZwRUGaK066JrOZTPKLpWHcSdlKPx3QIpcyvd6yu1lnRT0CIODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9039
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

Hi Anirban

On 9/11/2025 12:50 AM, Sk Anirban wrote:
> Inject a CSC error through uevent to cause the Xe device to enter a wedged
> state. To return the device to a normal state, reload the driver, as
> the wedged state can only be resolved by rebinding/reprobing the driver.
> 
> Check survivability mode to validate that CSC error injection correctly
> triggers the survivability state transition.
> 
> v3: Update commit message (Riana)
>      Modify the uevents interrupt handling (Riana)
> v4: Move test to xe_survivability (Riana)
> 
> Related kernel patch series:
> https://patchwork.freedesktop.org/series/149756/

Remove this. Kernel patch is merged

> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 123 +++++++++++++++++++++++++++++++--
>   1 file changed, 119 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 6fb13b391..0fbdcfdcf 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -4,6 +4,7 @@
>    */
>   #include <dirent.h>
>   #include <fcntl.h>
> +#include <libudev.h>
>   #include <limits.h>
>   
>   #include "igt.h"
> @@ -12,7 +13,11 @@
>   #include "igt_fs.h"
>   #include "igt_kmod.h"
>   #include "igt_sysfs.h"
> +#include "intel_allocator.h"
> +#include "xe/xe_gt.h"
> +#include "xe/xe_ioctl.h"
>   #include "xe/xe_query.h"
> +#include "xe/xe_spin.h"
>   
>   /**
>    * TEST: Comprehensive run-time survivability mode testing
> @@ -22,10 +27,69 @@
>    * Functionality: survivability mode
>    * Description: validate runtime survivability mode functionality
>    * Test category: functionality test
> + *
> + * SUBTEST: i2c-functionality
> + * Description: Validate i2c adapter functionality in survivability mode
> + *
> + * SUBTEST: runtime-survivability
> + * Description: Force Xe device wedged after injecting a failure in CSC
> + * to test runtime survivability mode
>    */
>   
>   static char bus_addr[NAME_MAX];
>   
> +static void ignore_wedged_in_dmesg(void)
> +{
> +	/* this is needed for igt_runner so it will ignore it */
> +	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> +				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> +				    "|GT[0-9A-Fa-f]*: Failed to submit"
> +				    "|Modules linked in:"
> +				    "|__pfx___drm_");
> +}
> +
> +static int check_survivability_and_uevents(int fd, struct udev_monitor *mon)
> +{
> +	struct udev_device *device;
> +	struct pci_device *pci_dev;
> +	char path[PATH_MAX];
> +	const char *dev_path;
> +	const char *wedged;
> +	int dirfd;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +	dirfd = open(path, O_RDONLY);

This is used by both tests. Make it a separate function

> +
> +	if (mon) {
> +		device = udev_monitor_receive_device(mon);
> +		dev_path = udev_device_get_property_value(device, "DEVPATH");
> +		wedged = udev_device_get_property_value(device, "WEDGED");
> +		igt_cleanup_uevents(mon);
> +
> +	igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
> +		     "Expected WEDGED property to be 'vendor-specific', got '%s'",
> +		     wedged);

indentation

> +
> +	igt_assert_f(dev_path && strstr(dev_path, bus_addr),
> +		     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +		     bus_addr, dev_path);
> +	}
> +
> +	return dirfd;
> +}
> +
> +static void force_wedged_csc_error(int fd)
> +{
> +	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
> +	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +
> +	xe_force_gt_reset_sync(fd, 0);
> +	sleep(1);
> +}
> +
>   static int find_i2c_adapter(struct pci_device *pci_xe)
>   {
>   	char device_path[PATH_MAX];
> @@ -70,10 +134,6 @@ static void set_survivability_mode(int configfs_device_fd, bool value)
>   	igt_kmod_bind("xe", bus_addr);
>   }
>   
> -/**
> - * SUBTEST: i2c-functionality
> - * Description: Validate i2c adapter functionality in survivability mode
> - */

why in this patch?

>   static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
>   {
>   	int i2c_adapter_before = 1, i2c_adapter_after;
> @@ -122,10 +182,34 @@ static void set_bus_addr(int fd)
>   		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>   }
>   
> +static void test_spinner_after_recovery(int fd)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +	unsigned int exec_queue;
> +	igt_spin_t *spin;
> +	uint64_t ahnd;
> +	uint32_t vm;
> +
> +	xe_for_each_engine(fd, hwe) {
> +		vm = xe_vm_create(fd, 0, 0);
> +		exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
> +		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +
> +		spin = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm);
> +
> +		igt_spin_free(fd, spin);
> +		xe_exec_queue_destroy(fd, exec_queue);
> +		xe_vm_destroy(fd, vm);
> +
> +		put_ahnd(ahnd);
> +	}

you can just do a basic spin instead of all engines

static void spin_basic(int fd)
{
         uint64_t ahnd;
         igt_spin_t *spin;

         ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
         spin = igt_spin_new(fd, .ahnd = ahnd);

         igt_spin_free(fd, spin);
         put_ahnd(ahnd);
}

> +}
> +
>   igt_main
>   {
>   	int fd, configfs_fd, configfs_device_fd;
>   	struct pci_device *pci_xe;
> +	char pci_slot[NAME_MAX];
>   
>   	igt_fixture {
>   		fd = drm_open_driver(DRIVER_XE);
> @@ -134,6 +218,7 @@ igt_main
>   		configfs_fd = igt_configfs_open("xe");
>   		igt_require(configfs_fd != -1);
>   		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		igt_device_get_pci_slot_name(fd, pci_slot);
>   		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
>   	}
>   
> @@ -143,10 +228,40 @@ igt_main
>   		test_i2c_functionality(configfs_device_fd, pci_xe);
>   	}
>   
> +	igt_subtest("runtime-survivability") {
> +		struct udev_monitor *mon;
> +
> +		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
> +					       O_RDWR));
> +
> +		igt_assert_f(check_survivability_and_uevents(fd, NULL) < 0,
> +			     "survivability_mode sysfs available");
> +		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
> +
> +		ignore_wedged_in_dmesg();
> +		mon = igt_watch_uevents();
> +		force_wedged_csc_error(fd);
> +
> +		igt_assert_f(check_survivability_and_uevents(fd, mon) >= 0,
> +			     "survivability_mode sysfs not available");
> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +		test_spinner_after_recovery(fd);
> +	}
> +
>   	igt_fixture {
> +		if (igt_debugfs_exists(fd, "inject_csc_hw_error/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
> +			igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +		}
> +
>   		igt_fs_remove_dir(configfs_fd, bus_addr);
>   		close(configfs_device_fd);
>   		close(configfs_fd);
>   		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
>   	}
>   }

