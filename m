Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09F8E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 13:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0D010E1A0;
	Fri, 13 Dec 2024 13:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5e/gTrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A90B10E1A0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734095421; x=1765631421;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2JQm1c7HPQXDmDksUAll9iBKf95ttZZwXOATZQE2sDE=;
 b=l5e/gTrnw//uoMToaM8w4yMERLds1x+DGAaUVeyb+dhIfcGnP3DAZz5/
 kiBxAQBXawfG58pp5Fse1wy87RoDfngQw5YSa6AWgrs+BEkbMB06qk67k
 6/Fv+mH9NPywcCuq3OKyqXZmvYbtcDjswh/qd3lHY5/1irmf3knUqAshc
 7zHhdNf89sodeUt3IdGvfjGI+shMnv+/wIg6BNUJ3EGuMcke+PWjn9sNZ
 wz3Ah8vyfTMh5uV1xXovvW4Ea+nQsl87WN71hEorW1mp9phT3NafXY5Dq
 1N9rLyg7P8p8n1nM9GEz3SVfpUgZTLqNfGih/7+sJ9xGxsh2O5RV6BTFt w==;
X-CSE-ConnectionGUID: nn/YcEgORvi1qjpcgczNdw==
X-CSE-MsgGUID: Y2X/2JEMRiucCz9SsLqFlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="52067049"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="52067049"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 05:10:20 -0800
X-CSE-ConnectionGUID: MS6xgjQMTFOp1hsZbTjMXA==
X-CSE-MsgGUID: 44S4ufiWTt6wdZmC89DY9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96764761"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 05:10:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 05:10:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 05:10:20 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 05:10:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUiPkFB5yeveWqULRIPKeg7h1fr+Su31xmYxNFNt1ZDvezp4MHmCLVXrbL1Zrp3MG8uRokpRDNLWMczB7KasMFXxM1Ua8GYLb5Oh03lkCUYor5dOGm5+gE013Nj5MnJA3gK9OQ2SvJ84Qd17q6I/unDLsihguG9zAVNeXhIAV0XlO+aE4vW55cneQHzmtpMbJSZ8C4LAzNl26qV0UznD2qNPwTViR43iOu2YZYKonuYXWi8m1IcqnvbvNUUw5jxyTiYKEu8aWEOYCh7uniiTgd/WuA1IWE8xA23h1FXYrffIdw9922hXCWQBYudH99liXyQNwjH9/n/FOfnp79P2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2InigLgfmxujcCiIKUa3EWLyzmN0zC3xAU1jheYmms=;
 b=BVjERkmRoeT55347yuDZMvj2qSICkTVBsCuXCrnid0CxK+DFN6aWE6xzP6sAWr2xfN42V8f+FunOpwRos7drO78+A0BKovKfO00r5ORI/cCdzNzO7MjoL3y+pIjFN51093D6XeiZmjfQtJhvUdTAtZnyBZHxHa6pyVG9+h6o+4dUEtCc/JolWIbRkz19WxHBtIrIz1Kh2htJY76218Hx5NHJLtH4j9IFGY/zMJRPqC46bl8yoxHlRFzrbTimpBIWMpcEDRNq143AG70A6wVPcv3Mqy8ypttQgXVnO5JVHLttxByFQbfO7ozJOJm358rdTFGb9YM3dqj4q6LQ3xDCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 13:10:18 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 13:10:18 +0000
Message-ID: <a74b3f67-a2cd-4e61-b170-4e2b9b70dd7c@intel.com>
Date: Fri, 13 Dec 2024 18:40:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] runner/settings: Add function to set IMGDIR
 environment variable
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Naladala Ramanaidu
 <ramanaidu.naladala@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
 <20241119075259.3048734-4-ramanaidu.naladala@intel.com>
 <20241211091447.js7h3rukaido7utt@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241211091447.js7h3rukaido7utt@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SJ0PR11MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: 2050670d-80aa-420a-20ca-08dd1b777cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzBpSjFPc25hdHJDM0hLejBTVGl3bE80VldORjZuNURBQXdINWJtOXFGQjFk?=
 =?utf-8?B?KzJIUUw2MnAraEdsNUlUWDVORDY4emxTUHc4VWJYSTlSZ2g4b1FIcTJiaXh0?=
 =?utf-8?B?SUdNTzBETnprN3dYYStiM0tKQm9sWXoyVTVBazlTNFBha2thejFreHlVMUow?=
 =?utf-8?B?VkRLWFdURWhISnkyblY5bWNaY2RlaTNPWWlLaUJ1YjAzWDlkbUNPdHlCVm0r?=
 =?utf-8?B?bnBhaUVBbUVhTU5UdVlFalVnQzdHT054ajBLUXp2bGppRVZsaktHc09BaDNk?=
 =?utf-8?B?UUVTWThoRDc2akJSc0hSU2hDNU5aZ0ZPZ1FCZ3hiaDFhOUNDSHFmRklGQnI4?=
 =?utf-8?B?bVp3VEYrekxZbU4zNkxnbVZJaS9pSXRmVDFWWVVKUys3R2Fjang1L09selJ2?=
 =?utf-8?B?aFp3b0VSdEU0WlY2cjVZaVZMZmtZMUE2YnJTOWZadEhVbXpEc2lHQytmT1RB?=
 =?utf-8?B?eG1KNHVhY0dMeGdEZnphUWRJdlFBa3E5L01rVFlNaERZM2x1bWwrV0tLOUVN?=
 =?utf-8?B?QkJqMFBuNWc5eS85OTlrck1mVXd3YlJzV3NXRzdDYUpUVFhqNEZpNko2UVFL?=
 =?utf-8?B?aEhtcWxJK0FlSnlDbzRmQjVEQXlrK1NPb1FRQndvYmJhTjZ6bERqancxdHUv?=
 =?utf-8?B?QUUvbDZvSCtvaU52Uk0wUzJYS3Buc2VDRFBZQlZETjZZWU9RTXE4c1Irbkx1?=
 =?utf-8?B?bHVZZWh5UTJHcDhmVFI1cnhiajdzVlZxV0pXdHp0NFRlTERNamZZN1p4MGlr?=
 =?utf-8?B?SEladWVaZ2tFOENHSWtsR0VwVXFGYjQybzF5SHlFUDhhQXNhT3JIQmt5djFB?=
 =?utf-8?B?MFN4dXlrVEZkVlUvWlpEUTRuVUtyUEZrblpBeHgwbWtGOXB4b0hsenFRSzNR?=
 =?utf-8?B?QXZobWtLYWZtcktoSWIvdi9xOGhLcksraCs0RGhEc1NmclBEdENvYjFwMmJr?=
 =?utf-8?B?djNFSGtzdWJSd0N4OGN1S3pYOGE5amtWd09xWS8xSEUwWXZwRW9Zd2x2Zjdy?=
 =?utf-8?B?RmN0TW5xelloOWF0dlVRb1ZCREJKemVzblVHU2FhYTZTaHIxeWY1V2s4c2dG?=
 =?utf-8?B?SFpId3R4QnFRTXI4VDZWRWhsQUU4UnQ2b1lITHB3NXUwV2w2eEhHN3NyYWNi?=
 =?utf-8?B?VHVvSG1OYVA4bisyVHdRVjhiWkh2OS9iTUJPRGFYbXBUZVRZTTQxQmorcTh6?=
 =?utf-8?B?bnd1VnNoWE9yRDEvMjZPbVowT0lWZTZDcUxnUFBsd00xRi9BOUZ1Q3VPcWZY?=
 =?utf-8?B?eTRiWW9EUitPRTE3UC9CWjVNeUMrUFJ5cGNpYXBDL3ZlNU0wc3djTGFuM1hn?=
 =?utf-8?B?N3diWVlJUWxuRkdLc3VGdlUwd3RDd2JUeHBHTzA5TDdRL2VMQVppTk1sVHhO?=
 =?utf-8?B?VitWcUpHcFdhbDh3QWZ5MUI2TE8wQkpDSXNUZDA3enhrOGc4WmIyMDJpOTNT?=
 =?utf-8?B?RDdqLzA5a1VYVEVlbVRla2J5M2hCY29XazZiVlcrSVZKYXFMRXZnMUpZdVBj?=
 =?utf-8?B?bUlqb1VvTkpvRjdDN3JJVGdLZDVBbHhSZU5ibjYyaTRpRGJZUlA3OWxxOGMw?=
 =?utf-8?B?SzYyVmNBSGR3c0o4dTNtRTFBZVBvRlRtVEsrN1NhZEtxNUs1MlAxajNDbjRR?=
 =?utf-8?B?QkQwYW9SUGlOLzM3S1RYTzZwcG8vVGszUlNWV3JrTE02YWd4aW9Xc28rMFl0?=
 =?utf-8?B?c3JnSUR4eGVXdUNRaXJMaDRQMEhnSGtzV0RzVSt5cEFXRWJtaUN6OGFROG5R?=
 =?utf-8?B?ZmIwblpPSHdqYlNrSkN0UWo4RXQyeEVvZkk4eGpsNGxMOXlMREJsUEVDTWlD?=
 =?utf-8?B?WkZjZS9BL2l0empEZWhUdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk1zUjRkUVd3QUc5dit5RDJweGJNbnd2WVV3Y1F4cmQyUm9hcy9WaG5QTmh1?=
 =?utf-8?B?a0R3dS9OSUx2cjN5ZHlVY0w0SUhLcE0rdE85V1ZhNHVZbU0rNDZUTmNYTHZZ?=
 =?utf-8?B?MzZYMVFLSC9xWHkyam1ud2IveExNczdRb0RxdEZ1UXRlRE0xd09YWXhPcWkr?=
 =?utf-8?B?azdxa1kyMktIb1gvbFFoRlhTOE4ydHA3VEJzU2RFMWtYKzdkM21KbW5UMm4v?=
 =?utf-8?B?alVmVDVHVVhISUVNdHRIQmNDaVd5RWlOelVkWldRSjFmLzVTNS9leFMzcmNI?=
 =?utf-8?B?WkcwR2lDL2IvUkVGRnlWbGdZUFBYUytZUVA0Rmd3T2pwWmh3OThtNDhqalRX?=
 =?utf-8?B?Sk5IelNTRkh4TkU0MVRzQkhTam5wSUcvaGttbmJFaVR6WlQvMzY3ZnNFWk5t?=
 =?utf-8?B?clNEb2hVRHB6OWlxeHE0aUNYOElZOFdyc2d5UkR6OVFIbEhkN25DeXpZOG0r?=
 =?utf-8?B?djJXQ0RDTXFnak5qeGxsZVhnYUV1dlNIZ01JenkwajFwQXdxMjU1WnU3dlhY?=
 =?utf-8?B?eTRxTXpzVHVMWGpmcVN2cEdxNlBnbEVlZ1o5Mzg5TkE3WEg2UG15VnpjR0Jw?=
 =?utf-8?B?QmJ1bS9NS2FpRERiRUY1ODdiUkdEMFJXdmhoZ3pxYU9NZ2kxODZHbzlZdU5l?=
 =?utf-8?B?Y3NGcWlXUlVkV1ZHMkxpRzZMdGtTaFRTMElvQ2R4dE1lSTN6Y1puSCs0eDVj?=
 =?utf-8?B?Tm94bU1hWE5mUGVXK1AyWDRQaGJXRkwzRkhTKzZTUElNWS92YUdrN0tUT2VE?=
 =?utf-8?B?NHZ0MGRUc1VIdnhtRDAwUmZTZXNGcUwxNDRYV0tlTUJOVjJ6bFJES0hBMlBM?=
 =?utf-8?B?dGptL0hYQmN0dll2NDgydjRZYy9aa0dzcll0QXNLTXh3S1RNYWFsS0lCMjli?=
 =?utf-8?B?SFhuSVoyemFxMHhwWUUxeG81Y3pJTkcrRVFscE9NQ2ZtZjNUR0hITElNeGxi?=
 =?utf-8?B?WEY3Q0NCUFlZdlVSUWM4TllRUFc1Nkt0ZUEwTVJJMG03SWhLOTdJci9xV0Vz?=
 =?utf-8?B?L3dpdjhRYkdWZks0am9pSVhWWVllcFlWa0Y5ZFNlcFBLd2FxSVpXbEVLd0pj?=
 =?utf-8?B?OVpGNHEveDBscXIza1JRMElyRUJsa0l1YUtYcWtFS2ZPWnczTUJRdHR2NCs4?=
 =?utf-8?B?NEdUdTZ2MmU0NklUa1JiT1FEakNBWklDUFNRRDh4V1NQdFlINXFwbjc4eDVk?=
 =?utf-8?B?Zk80WUE0eXMyMnBOYjJ1T0dxYW8vemFiTWxyS2xiZ3VSSXJDUlBZWmtDSEVX?=
 =?utf-8?B?V21TS0J6RjlDWkQxNG0xSy9yRklKL2NGYTlxOVpjL1JtZ2dNUXhheVBKVHh4?=
 =?utf-8?B?MjQvMFBXVXNFbUVvZFAyY3p0NzliY2ZIWWU5Nko3bmdjK08xcXlSUFBTNmVj?=
 =?utf-8?B?NWJ5THV6WTlISWdjV3JyWkp3YmpGMndwMTJ1WHppRk0rSHVxRW9ScmtOVVRS?=
 =?utf-8?B?WW5LVDRaVzU0Q2NKd3RZeG9wVU1UNzVFUk9aQi9CRmFjWmczM3lkU2Zkbkh4?=
 =?utf-8?B?QjhqWHR6alY0alhKVGJ4Rkt2NUNSK1hhR1FBQm9LUHBDZG9wdlBTbG1ZQXRV?=
 =?utf-8?B?V0YxSEx6Yzl3YXVWUkt3NlQzT0xXQnA2VjdpZWxLUk10cmdNR2JXM21vcW9X?=
 =?utf-8?B?ZGczNGRXQ0lUQ0FuMm9NSXJJTGRKZENkNUVqMDJnWFFVTmJCMUcrT3U1bGpU?=
 =?utf-8?B?bjY3cHcwcUVCaStpcDROK29ZRWp5V3dtbEhJdmxtMG5kVlhpTy90WE5BRW9W?=
 =?utf-8?B?K2lnanZIdHZVRDdXYXM0aXArT21kMDhPSWd6Q2t0R0R0cFdvZGJNaGpNcFNH?=
 =?utf-8?B?ZWh2dGljZjEyUG51bDBCaEE0V3ZsQUE0THFtT2picUs2R1MrVm96STFoUGlT?=
 =?utf-8?B?cEVTSURXZDFGMzBmVDE0OTlKeWxrdTFqQit1ODRhRmJ1Rm92S1RVZUdEekxl?=
 =?utf-8?B?ZG5uZW1XQ2hQWXZCVU9DdXFqQkVsRzhWRzRVWG54VHBGWHI1QVFTMW5va3dm?=
 =?utf-8?B?czZyQU5YZVZtYU54VVRQZFNCSWxrSVVtNkFWclJCQUdyU1c4L0hPWEFFbjNJ?=
 =?utf-8?B?eGxMSStudHo5NnpTUkU1NElrck5vcDJiTHFaRGZtWWd0Rk50RXYxL0MvWHBw?=
 =?utf-8?B?eU90MGU4UFFrSnV2T2JRZisyZTNpTVpCZ1ZVVk0wYUU4cXFiUGR5bm9oWllz?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2050670d-80aa-420a-20ca-08dd1b777cfd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 13:10:17.3277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXhjgJq34aZqXMG+MRm4+raA7pYZqs2/MzUTbBvhErpWW9lrR2b+7oACl2H87tqbhEE8N/KOgKWNr9h8JuQfyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
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

Hi Ramanaidu,

On 11-12-2024 02:44 pm, Kamil Konieczny wrote:
> Hi Naladala,
> On 2024-11-19 at 13:22:57 +0530, Naladala Ramanaidu wrote:
>> Introduced set_imgdir() function in settings.c to set the IMGDIR
> imho better name is IGT_DATA or IGT_IMAGES, also you do not
> need to write about which file you changed, it is already in patch
> itself.
>
> Swati, do you have suggestions here for this env var?
Agree with Kamil, IGT_DATA might be better choice for environment variable
which is inline with other env var too like 
IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION,
IGT_HOOK*, etc.
>> environment variable. The function uses absolute_path() to convert
>> the relative path "../share/igt-gpu-tools" to an absolute path.
>> Added the declaration of set_imgdir() in settings.h with a brief
>> description.
> Drop this "C to description", it is in patch.
>
>> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
>> ---
>>   runner/runner.c   |  2 ++
>>   runner/settings.c | 13 +++++++++++++
>>   runner/settings.h |  8 ++++++++
>>   3 files changed, 23 insertions(+)
>>
>> diff --git a/runner/runner.c b/runner/runner.c
>> index 4855ad641..a52834197 100644
>> --- a/runner/runner.c
>> +++ b/runner/runner.c
>> @@ -49,6 +49,8 @@ int main(int argc, char **argv)
>>   		exitcode = 1;
>>   	}
>>   
>> +	unsetenv("IMGDIR");
> imho you should have a flag and do not unset this
> if user sets this before runner starts, e.g. honor
> user environment.
>
>> +
> Remove this empty line.
>
>>   	printf("Done.\n");
> Why this print is here?
>
> While at this, could you add newline here?
>
>>   	return exitcode;
>>   }
>> diff --git a/runner/settings.c b/runner/settings.c
>> index dd4b08dd7..d42f3a68a 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -587,6 +587,15 @@ char *absolute_path(const char *path)
>>   	return result;
>>   }
>>   
>> +int set_imgdir(void)
>> +{
>> +	const char *path = "../share/igt-gpu-tools";
>> +	char *abpath;
>> +
>> +	abpath = absolute_path(path);
>> +	return setenv("IMGDIR", abpath, 1);
> Repeated string here shows we need a global const char for it.
>
>> +}
>> +
>>   static char *bin_path(char *fname)
>>   {
>>   	char *path, *p;
>> @@ -863,6 +872,10 @@ bool parse_options(int argc, char **argv,
>>   		settings->test_root = absolute_path(env_test_root);
>>   	}
>>   
>> +	if (set_imgdir() != 0) {
>> +		usage(stderr, "img dir not set");
>> +	}
>> +
>>   	if (!settings->test_root) {
>>   		usage(stderr, "Test root not set");
>>   		goto error;
>> diff --git a/runner/settings.h b/runner/settings.h
>> index 6246d0c3d..a7abe19fd 100644
>> --- a/runner/settings.h
>> +++ b/runner/settings.h
>> @@ -150,4 +150,12 @@ bool serialize_settings(struct settings *settings);
>>   bool read_settings_from_file(struct settings *settings, FILE* f);
>>   bool read_settings_from_dir(struct settings *settings, int dirfd);
>>   
>> +/**
>> + * set_imgdir:
>> + *
>> + * The function will set the environment variable.
>> + *
>> + */
> Description is needed in C source, not in header.
>
> Regards,
> Kamil
>
>> +int set_imgdir(void);
>> +
>>   #endif
>> -- 
>> 2.43.0
>>
