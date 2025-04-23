Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34158C369D5
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 03:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4A410E185;
	Wed, 23 Apr 2025 03:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gieyLg95";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353D810E185
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 03:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745380318; x=1776916318;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+J+Ij7uTItXLV5Pe9Nxc+ftxC687vAiqDUAt2/IFPGQ=;
 b=gieyLg95eYqTzCDwZ+Nqr/4DKeyGKx8Kjjap2XugEKxVdTa92cFl+ZrQ
 WUWTjoyG4pY9lHtvSJb3t0YdrBODUD0cUskJ6mqth23nnNT2NtfNk//92
 YBcBDhrjgPqv0+YHyVl/5p0jeNaP2X33kIT3xbPFSeSy9JERIk5hXIbVl
 kWyoBIrsY5N0K2KSZfm/BmHXsnVAuAhJERzyjLExH7LmGYDMiHRSTNlej
 snk+baSc5xREYViATmmoGvMmfZqcpW613N+gIbj7bJhWko1SprD8xXiFe
 3ligkTDF2FbTGJgMjURK1NWaIamOkQPbLpzr7un3fxXB9L5g0DA+0t2cc Q==;
X-CSE-ConnectionGUID: rQGtQvtKT9K0H59egt/Qqg==
X-CSE-MsgGUID: 64eVtH5rRJ25kcYsdqb1Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="34572617"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="34572617"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 20:51:58 -0700
X-CSE-ConnectionGUID: isxLRODXQRaNRyM7mKLZoA==
X-CSE-MsgGUID: xAWeG4jETJuVe9wxTaKcsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="132122676"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 20:51:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 20:51:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 20:51:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 20:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSV4KYPLQsW6etRyDfwvAB1BnfTMfBaksC4fQR2cm4uBPn0vGaESZ+Gj7bOcmzFAoZE8+2PX9W0rROov89j1Adr8OJDxzoTUtUXUrEpH+9aSsu7Kwyp06DCb7tLm5Yxf8qzoAB/C4M8hjTm/oAJag25zTYdNpBRgnrRDnb1PWoif+chWE4hrC//oq8CUhRCsccGQ6DNOXzeDULeuzlS+i2B0hRx1UROrwd78rxuYZlT328f0rbBeGS8BWnK9ovbUOB6LZ9PBLVQMTJvSYg9klAULh+0ABVNNe/qMr3+OjCIeNe7AwHSzDoda9p01ygIVETHS+PY/I+aNyWObuz9xrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hcuxsZcXNGXFNc9lGaS6Hgnqy0UtTESif/zyMFmatQ=;
 b=YhigVSnT0AJfrUqhceyQR+S8yoT3ZTPUIhj6cvZkOwNSbZ0R4f1SbIHvm/6iWsyzfYrUOJAU+MSVvEq0WFsKRvT5xc9KY1/+j90RUIdE/xs3qCdeJeRPfOpkMGSDr0+QCJEFYBIy1ybYkIctQP6q604rWfHobaCiZW7Yj0+emc+M1Xn77mRe9/PiX58nxnohFi2YhYjlnDtZH1cUm/xAkBW5KSlIl3aDv28HER8wl/gg1B53Yculba3wUrh8U37lgT+EBtu8SeTfFglMRYHb75AN3P9do/ZKNTweaZ4exKaJrWpBZ2UtVj6zLMM+46JQXqs3Cq4/OrsHHFImaKvmbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 03:51:13 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 03:51:13 +0000
Message-ID: <ff25b6b4-4a8d-4fd9-b288-c57d3fea79ec@intel.com>
Date: Wed, 23 Apr 2025 09:21:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 10/10]
 tests/chamelium/kms_chamelium_sharpness_filter: Add basic test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250414111657.794484-1-swati2.sharma@intel.com>
 <20250414111657.794484-11-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250414111657.794484-11-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 338382cb-59be-47ae-a6dc-08dd821a1774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUZZM0xxK0hNYklrMG9nVEozTkZtMHB4dHlkbjd5Z1JTVTEwQ1RTcU9aRVJH?=
 =?utf-8?B?QmswbUgwbGdxbS9jKzU1cFFyb0xNWXRlWFh5L1lmWmFTdytkN05HdkJvZFps?=
 =?utf-8?B?VWlIWVU1SU5NOTVvNjM3UVZDZWlVMm8vejE0bzlOSUgyTzYrQ3VKTGwrT2hK?=
 =?utf-8?B?WWgwbEZuc3RvMXQzRVR4L1M2TjRLN2V0Vzg1a2N3QkR5RkpQcGxRMTUrNWxO?=
 =?utf-8?B?UlJUWC9NN1hhQWl2TnhLNGRiQmFYOC93U0FDTHl3Nk13amE0cDFNbTkwU2dX?=
 =?utf-8?B?Tnhpd0RzT3owV1ZaNU8rTS93eHM4L25MWUJDU1Vra0ZvUWhmNHpIK2VCKzBi?=
 =?utf-8?B?QnBZQ1pScXhERWVmb3lqYlVUejdDSlgwYmdEdGRKTUVmck5oRndGNm56VGF1?=
 =?utf-8?B?QzlDOG5mblgyM1lBNlhzcURsQmdkck9sV1puTWM1MENaUzAwOUV2Ym9mcEJN?=
 =?utf-8?B?UjVNOUVkeDcvbHV3WG1WY1lsZ3ZDdlFsV0NLOUowaHpUMG9ZWUJxM0pkd3BN?=
 =?utf-8?B?NzNHb0ZtR2xxc1lmNVRrTEFZeGJidUw1YVllKzFOTHZlL1dXeTFSaWR5L3g2?=
 =?utf-8?B?UzEvd21oSmduK0tEbWhQa0dxQzdPUGtMQXhQbGdtbktnNzRYZmdBNUJ5VlNj?=
 =?utf-8?B?MnhDUUJzZjdJSi9xVzZvUmNmM0RiUkJrTGRzaVJjV3cxcDI3Y1J6VFo2WlAy?=
 =?utf-8?B?OVQydzQxU2VjK0MvUGpCaW4yQTBnK09POHRhZ2s5d1RVY2JpaUFpdnh4Uk9L?=
 =?utf-8?B?MmF4L1pFMU95cUFMTkdzSjVOYS9Lb3lPeG1iaEtQUG1BZ3lwQ2YvNlc2bUQ3?=
 =?utf-8?B?SVRXRnV6eWdUZW1JVXBwY0tUTXppQzZyZE5LTVdhbmZ5UTdnVGV2SHRUcDBF?=
 =?utf-8?B?OVJQcENYZU5yM0cwakhhWFNuSHBVNXFRQ2tiQjdYQWhXZ0dmZ3hmRm1IUzlO?=
 =?utf-8?B?M1RtbXNmMmd1NExnNGM0NktSR3lzTHhUZnN1Qk1OOGYydEYybFlMQVFXNk5l?=
 =?utf-8?B?RmsvcHhjWnAzTGl3cWl0NGpsVkg1YkQwNzQ2cmN2MFNySnlHek9qQ3ZFcCtS?=
 =?utf-8?B?OGoxVERWTlpyS0U0Q01BNDVFakkwV2ZqVzhKd0xEYkREY1dBdGF5L0U3NVpC?=
 =?utf-8?B?M0praTE0T3NQZjhEY0lJNWN2S01kbXQ0SFFScVFha0RNTkdLbW0yeU4xRUg1?=
 =?utf-8?B?TWZvdlNzTUpidnNVMi93ZTQyUjZEZGM5ekVORk8zdVMySlF5UTk3MU1sRHhL?=
 =?utf-8?B?WU9DMHZ2RUFtd3FMSmsxUDQrckNHT0hXYWd1bkJ2V3ViMU45MXIvQzJ1SkFw?=
 =?utf-8?B?aUVmZXk3RHY2d1BkaTRwTEwxSzVpOFVVdHJiV0NlektQM2ZGaitJVElobThy?=
 =?utf-8?B?NGxCVkZNenphZ0FuQVJPdXpCRWx5SDA1OHJtQzg2d3p4Zk14SVM4eXpsYWNJ?=
 =?utf-8?B?RmZuM01QMmY5TUdiNG9YUWNWbVRSV0pIYWltbVNmUjZDNGRzR2VLbWNKWnFj?=
 =?utf-8?B?eFNOVWwrRmNhWmUweHFsQlJQZSs2YXZBd202bmtGakFoS29sYUI4NzNjYldw?=
 =?utf-8?B?Ykhhbmt0NndKSDNiYXV4cm5FRGhYb0IzMS9WQ1NiQ3BhdmdDaC8rS2tUckNi?=
 =?utf-8?B?cjFxOTVyVmF0QlZTMVJSeVlqcEpGNFY5Zy9wQXdTY1VMdTlRNWs0WTZ5TnJr?=
 =?utf-8?B?Z2hnK0RyUWNUVzlJZHhrT004a1FHWjJzQXFxNTBPZjJPMjFlNHc5U1Q0QWxx?=
 =?utf-8?B?Z3ZYaEVPZXNFZG5MalpGbUx2M2FlQnRZbG85cVgvT0s2QitPR3JwSGQ4Q1Vz?=
 =?utf-8?B?R2xrNTFoZVk1KzV1MzAxZFJWUWJoZCtaKytIUUgxWVF6cU1lNzk5WE9kck4z?=
 =?utf-8?B?MjEwWTdGUzB6WGdsMlYrc3FMaDhVMGxONjkvZDFYbDVsRkxBclduandnMmdH?=
 =?utf-8?Q?v7/uOmJk8eU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdoWUhqYlpUamJZV21hbWFGRHJYMmNZa0FoUVlJcDdIaTJIV1lVdmNuaDNN?=
 =?utf-8?B?NkhBSkZpTmlLYS9TYklPaGRHZUtRajZUck9CbXptUzhEdG1YTTdYN1VFRVpn?=
 =?utf-8?B?TW94NHVyd3lSUGxERXdRMDAraXVaZVpVYVRTMTkxdGtYR2hTeTZuRjBRNDNJ?=
 =?utf-8?B?NnpBOTdXTW54dmViWXV4V1VnVHQ1QzJZYmFCUHlRc1hVVWM2V0lCL1RYNEx5?=
 =?utf-8?B?SmFDVUtWUFhETVRYdmoxRHpDT3FVVTBnekZPY2tZbG5TMFV1Z1J4YUFXZkxU?=
 =?utf-8?B?cnRiWnhhd3pPVXVyYWRhT3cwYkU3K1lxN3hFOW9td0FRbFBPU2Y5cHYrTUMx?=
 =?utf-8?B?dm1pNEo3S3prejR5blM5eDE2L1lPSExhajJJbCtmNklXNSsxZVJDL21PQnlH?=
 =?utf-8?B?eWpUOVNzYVBXdGEzNHpZLzRYb25uMC9JZjlmbkpGS1hUakJHTTByWUZSQlRM?=
 =?utf-8?B?ZTIxd0ZNZVVaTDV3ZWwrZW12YXJhZUI2ZDc4cmtWTjQxT3hLRUlIZDVZTytM?=
 =?utf-8?B?NkFyRnp2elNmcE9IVE1Ocis0N2ROU2ZhdnViRE1xWTZIU1o1eEQ5TTdaM0My?=
 =?utf-8?B?ZCswb0lxNlVTcm5vaTBQbERGanpRdzRPZ3Bsb0hyNXN6ZnZwMWYzb1k5SmZ2?=
 =?utf-8?B?VlRLNm5YREpkZndsMFdTVUxHbWZ1bHBCejUrVEJyQ0Fnb3NhbG5XNE55SDIz?=
 =?utf-8?B?bkcvamk1c1FmRFVyc1A0T2VMQWpnRG16RGdPWWlyWDdWSWdwVk1mVHJ5RGo5?=
 =?utf-8?B?WkV4V3hMS1BjcGRZSXAzTE0wNjUrYXlyMExmYmg5Y2tRUlJqc2luaHp1WDFk?=
 =?utf-8?B?Mlh2MVV6eFVWbGp1YmViaFJXMHg3Q3lmUmRXR2doNk84YXNHWWZQdy9ESzJt?=
 =?utf-8?B?enBXL2tVVWo1L1VkdnV5U0pPbEcxaElLUTh3MGg3d1hjZjFoM0V1dmxRRFpm?=
 =?utf-8?B?RmJtQmd1dE5LdVB3TldjMjY2NEVyTitUS01FbEdicVNIQ1d2N3RlUmE5TVg0?=
 =?utf-8?B?dmlKS3VFVkxHbThXRWY5enorb2NuSVJwRFNmYncvWENQSWFjUDdIaGlHa2wv?=
 =?utf-8?B?SkU3V2VQcll6R1ZXSUFyWXdvOTUzUXdxZVBXS3ZEaTFRbW8vQlpLZTFTVTd2?=
 =?utf-8?B?QUt6bytnR3ZHQUc5YWtDQ1c2RnZ3bHNDRFRBQ1VuZUlJRDNEV09QRllwVTlD?=
 =?utf-8?B?RkRFbk13Wkw0bFBoN2VwRk9xVkNtdFpGcXJCT2RlZ3VGZi9GejdwdEs4STlY?=
 =?utf-8?B?TGNyZmxhNDFROW5tUkxZRU9Pa0VTaUNnVkl6QzJ2RHV3bmV3VU4wbHRIKzZa?=
 =?utf-8?B?WTV2aVowRGZ1NFY2RFNjaTVVT21LU1AzSEx3S2dxcXJPSmE0S1kyMEpKUk94?=
 =?utf-8?B?aGZwMCtIUjJDcHlTUVVvak1sNzQ4a0p5akt5cUNUZHI5bFk0V3ZPeUk5dzVq?=
 =?utf-8?B?UlNabGxTZEhwb25Rb1FKdVpEL25abndxNG1EM1JCRTVIbllrS0tQbzVFMmti?=
 =?utf-8?B?a1hUVGc3T1FkVzkrWWRqQXpzNE8yTEVXNS9jRHZmLy9jRWRXTW5KUjdTZ0dt?=
 =?utf-8?B?Rk5wRkZNWUp1UVpDYkYyZVNyeGVCVmc5UnRYT0xWQlNKbnRvaFRQUUl3RnRN?=
 =?utf-8?B?bitaQ2FuK0x3S1ptZEZmTEtGTE9PbDFOZm1Zalo1REw0aHk3bXducUl6alh6?=
 =?utf-8?B?WHExL0FnbUt4V3pZQVF3czZCWlRjLzNWc0IxcmY1WjViMm40NGtNaXNjN0Nq?=
 =?utf-8?B?MGtaN1Y2aUFLNk5CL28xMmhGM1ZMMVhFVC90akt6Y3Q4TXlrczg5aldLZGEw?=
 =?utf-8?B?SFpIWFlZUVFUVjRFSWJlUnhLKzRhT080YTBXU05tQm40ckNpOW5Vc1JUZkw0?=
 =?utf-8?B?U2YvVlZXanhUc0JTc2YwUU56MUh2WWdvdW93dVdDRXp0ZDd1VkxiQVFBNDZp?=
 =?utf-8?B?aVVRdmE5K2dSSmN0cDRiOVNvejV5T1cyaTJnYXRuSDZpdDRvUk42all6UWQz?=
 =?utf-8?B?dkd0aC9tQVRDZGxWZVJISDA1N0FKaEdWc3QrMzZsOW8wWUNUaW5MSEt4Z1A4?=
 =?utf-8?B?ekg0OWl5YTNHbHVVRFAwZjRqaUhaRGpXRmVjUUFpeDFtcjJ3SVFFQnpKNjdB?=
 =?utf-8?B?MU8xdlEvVVdDMXhYbEhpTVJpK3NwYUF1bjFFbkFOenpKODQ2dDlYVlhtOXJa?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 338382cb-59be-47ae-a6dc-08dd821a1774
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 03:51:13.4411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7KWnFS71QSvWmNmMAzXNEj2rSs9ab8ZOuJwd+FDXfTxTcuec+GJ+FUIqas6XBgNxAPobrCquYImrR4rbkMWv3bE1jRLbTrZcVUoJuwq6TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
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


On 4/14/2025 4:46 PM, Swati Sharma wrote:
> This test validates the content adaptive sharpness filter functionality
> by toggling the sharpness property on the CRTC and capturing frames
> using Chamelium. It ensures that the filter visually alters the output as
> expected.
>
> Test steps:
>      1. Display a test image with no sharpness filter.
>      2. Capture output (Frame 0).
>      3. Enable sharpness filter at mid strength.
>      4. Capture output (Frame 1).
>      5. Disable the filter again.
>      6. Capture output (Frame 2).
>      7. Re-enable filter with same strength.
>      8. Capture output (Frame 3).
>      9. Compare frame pairs:
> 	- Frame 0 vs Frame 1 → should differ
> 	- Frame 1 vs Frame 2 → should differ
> 	- Frame 0 vs Frame 2 → should match
> 	- Frame 1 vs Frame 3 → should match
>
> v2: -removed MIN/MAX_FILTER_STRENGTH (Ankit)
>      -fixed alignment (Ankit)
>      -removed commit with fb_ref (Ankit)
>      -set data->pipe_id (Ankit)
>      -removed disable_filter_strength_on_pipe()
>      -fixed CRASH
>      -fixed assert condition
> v3: -minor fixes
> v4: -modified test (Ankit)
>      -change in seq (Ankit)
> v5: -changed igt_assert() and return type of test_t()
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   .../kms_chamelium_sharpness_filter.c          | 282 ++++++++++++++++++
>   tests/meson.build                             |   2 +
>   2 files changed, 284 insertions(+)
>   create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
>
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
> new file mode 100644
> index 000000000..2ac05717a
> --- /dev/null
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms chamelium sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter using Chamelium
> + * Driver requirement: xe
> + * Mega feature: General Display Features
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +/**
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter using Chamelium");
> +
> +#define MID_FILTER_STRENGTH		128
> +#define MAX_FRAMES			4
> +
> +typedef struct {
> +	int drm_fd;
> +	enum pipe pipe_id;
> +	struct igt_fb fb;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	struct chamelium *chamelium;
> +	struct chamelium_port **ports;
> +	int port_count;
> +} data_t;
> +
> +static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
> +{
> +	bool ret = true;
> +
> +	igt_output_set_pipe(data->output, pipe);
> +	if (!intel_pipe_output_combo_valid(&data->display))
> +		ret = false;
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +
> +	return ret;
> +}
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static void reset_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH, 0);
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void destroy_frame_dumps(struct chamelium_frame_dump *frames[], int count)
> +{
> +	for (int i = 0; i < count; i++) {
> +		if (frames[i]) {
> +			chamelium_destroy_frame_dump(frames[i]);
> +			frames[i] = NULL;
> +		}
> +	}
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_override_mode(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void test_t(data_t *data, igt_plane_t *primary,
> +		   struct chamelium_port *port)
> +{
> +	struct chamelium_frame_dump *frame[4];
> +	drmModeModeInfo *mode;
> +	int height, width;
> +	bool ret[4], ret_ok = false;

Can we have `eq` or `match` instead of ret?

> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	mode = igt_output_get_mode(data->output);
> +	height = mode->hdisplay;
> +	width = mode->vdisplay;
> +
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
> +
> +	igt_plane_set_fb(data->primary, &data->fb);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame[0] =
> +		chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	set_filter_strength_on_pipe(data);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame[1] =
> +		chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	reset_filter_strength_on_pipe(data);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame[2] =
> +		chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	set_filter_strength_on_pipe(data);
> +	igt_display_commit_atomic(&data->display, 0, NULL);
> +
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame[3] =
> +		chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret[0] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
> +						       frame[0], frame[1]);
> +
> +	ret[1] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
> +						       frame[1], frame[2]);
> +
> +	ret[2] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
> +						       frame[0], frame[2]);
> +
> +	ret[3] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
> +						       frame[1], frame[3]);
> +
> +	ret_ok = (ret[0] == 0) && (ret[1] == 0) && (ret[2] == 1) && (ret[3] == 1);

IMO, compare with true and false will be more intuitive.

match_ok = (match[0] == false) && (match[1] == false) and so on..

In any case, patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> +
> +	destroy_frame_dumps(frame, MAX_FRAMES);
> +	cleanup(data);
> +
> +	igt_assert_f(ret_ok, "Sharpness filter test failed:\n"
> +	             "Expected: Frame[0]==Frame[1]: 0, Frame[1]==Frame[2]: 0, Frame[0]==Frame[2]: 1, Frame[1]==Frame[3]: 1\n"
> +		     "Observed: Frame[0]==Frame[1]: %d, Frame[1]==Frame[2]: %d, Frame[0]==Frame[2]: %d, Frame[1]==Frame[3]: %d\n", ret[0], ret[1], ret[2], ret[3]);
> +}
> +
> +static int test_setup(data_t *data, enum pipe p)
> +{
> +	igt_pipe_t *pipe;
> +	int i = 0;
> +
> +	igt_display_reset(&data->display);
> +
> +	pipe = &data->display.pipes[p];
> +	igt_require(pipe->n_planes >= 0);
> +
> +	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(data->primary);
> +
> +	/*
> +	 * Prefer to run this test on HDMI connector if its connected, since on DP we
> +	 * sometimes face DP FSM issue
> +	 */
> +        for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +		data->pipe_id = p;
> +		for (i = 0; i < data->port_count; i++) {
> +			if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +			     data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +			     strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
> +				return i;
> +		}
> +	}
> +
> +	for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +		data->pipe_id = p;
> +		for (i = 0; i < data->port_count; i++) {
> +			if (strcmp(data->output->name,
> +				   chamelium_port_get_name(data->ports[i])) == 0)
> +				return i;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum pipe p)
> +{
> +	int port_idx = test_setup(data, p);
> +
> +	igt_require(port_idx >= 0);
> +	igt_require(igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_SHARPNESS_STRENGTH));
> +
> +	if (!pipe_output_combo_valid(data, p))
> +		return;
> +
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
> +		(test_t(data, data->primary, data->ports[port_idx]));
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	enum pipe pipe;
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +		for_each_pipe(display, pipe) {
> +			data->filter_strength = MID_FILTER_STRENGTH;
> +			test_sharpness_filter(data, pipe);
> +		}
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_XE);
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_chamelium_allow_fsm_handling = false;
> +
> +		/* we need to initalize chamelium after igt_display_require */
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
> +		igt_require(data.chamelium);
> +
> +		data.ports = chamelium_get_ports(data.chamelium,
> +						 &data.port_count);
> +
> +		if (!data.port_count)
> +			igt_skip("No ports connected\n");
> +		/*
> +		 * We don't cause any harm by plugging
> +		 * discovered ports, just incase they are not plugged
> +		 * we currently skip in test_setup
> +		 */
> +		for(int i = 0; i < data.port_count; i++)
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	run_sharpness_filter_test(&data);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index bef4d302c..24a9a1f28 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -348,6 +348,7 @@ chamelium_progs = [
>   	'kms_chamelium_edid',
>   	'kms_chamelium_frames',
>   	'kms_chamelium_hpd',
> +	'kms_chamelium_sharpness_filter',
>   ]
>   
>   test_deps = [ igt_deps ]
> @@ -373,6 +374,7 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dp_linktrain_fallback': [
>              join_paths ('intel', 'kms_mst_helper.c'),
>              join_paths ('intel', 'kms_dsc_helper.c') ],
