Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7348AD1039D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E819C10E565;
	Wed, 26 Nov 2025 10:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRIoed8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA9210E565
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764152920; x=1795688920;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=cwCfke1lKnpyOvWWu6gKOkumlLTEIgiNBuaHE7pXuYk=;
 b=nRIoed8uJZvB6RY21XkddJ+M76wa3aLp9DSl04jXHmJmekJqq0hMeNny
 h6Ur6wQ6dUpTZUlozSaPX/CgJjDX6Tc6tvLgy50VUp6VH2oMFnDwXgh+0
 7pJpUYv5MDkh3cQlk9FjiMGiBGPPcMRyA5xiQYu52BlObut64Ro8CusMq
 jcEo1lg7E5bwnnGrVWsF6AgykkC+eQ/KG1xeU0Kzi/RPq77QXGKN+5Dwz
 BIYaNRL2Vf+OJFoZupTaqqSvzXQME++E7CuuT1OQp3Bik/sSn0IX1H0lj
 ILjBmSMXQszoSxXWnmaTa3JJKv7BFmkGfFhMLwz+VEyHBLzDNEbGMb5+q Q==;
X-CSE-ConnectionGUID: pnwFY/CNRZu0TDqsg1+rSQ==
X-CSE-MsgGUID: IZMTtyokQjSQMaRpF9uIlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="91673464"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="91673464"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:39 -0800
X-CSE-ConnectionGUID: iZb88OJxTvuxyjgpXrDibg==
X-CSE-MsgGUID: y6iNnXAfQyKu5RGKb40ylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192695941"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:38 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 02:28:38 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rn8wCzA6HjnykF2IXUoMg2RX2lbPhxfxqGsoCOEGfns6OYXKjTsXJeo5vwmSxwuWsQkpejmeYiIeINlhcXF1gV9czrxBpR0rxFTwarLYV/MEOOPI7/akcXW/GI4cKtwzPcXpHI8gonnA2zv+fBYwrgjtEx3Wrh84w2ooZirGegEcTTOxk27mDrkBvBRxzkXHKeudW2yXPyNGJLgR4INzB2TV6+Uz9gVbjtiuHZNtxDtcUHeUAQENYzmUld59nu4tBeM/tWLPNyz+YLfG3aNmkL765dkNNBUMa1We8DAE7vIdioYJenY2zPHQbOtNrXGpkBHUSHwrFpPQYV0bwevrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/3DwjOa5zNfWDQqMivPXS2SOH4+wnW2JajfAVDZSVo=;
 b=VuigWrVfDRtAvBzW55jkAfP91wVhUrQjqrfqFHN8nnlZybeCpNPMgqPTBRJLrZKOEXqQlS1D1K4YJN8EYH6vm+b3F7KUJ4dE71chAdBHsOaGbkS8mdg/dXH9gEMW2rxJKI3gm0jz1N2YJK1reFRdYGdtSKb1uBAXFcQj6cmh20BIBbEKE/ZZ+UwbpKT4I5TMLEailZScldqDK+BtNi4EQMYlIX5UKnB5GCupL81mtw4jIsxC9MUky6wc1Zxt+y7Xq+YXjphS4+yAcB1uYFCI3Vz1n0fFgPtzfuNERYVIyRcDjs3H6YNmlyrKrJt1980LQ50KmJiVsknF1tpyU+ENNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 10:28:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 10:28:35 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/5] Redesign of the xe_debugfs test
Date: Wed, 26 Nov 2025 11:28:22 +0100
Message-ID: <20251126102827.47844-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f4752a-2401-455a-0fb3-08de2cd68e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWRCLzVjL2JMdW1sQ3JyalZMbTliajlReXdCTmZXQVRhTHVNUTZ0UElUNGEr?=
 =?utf-8?B?YlQ5a0QydlV2QXFwTlJVVTBuOHE5WnFQUjNSREx6cm1BUW5VOEZYbGRDdEVE?=
 =?utf-8?B?cTNtZllyeHp4UExabFllS3VULzVwRHIwbkVYc0RONGt0V3dOdUNZMmIrT1Mw?=
 =?utf-8?B?VW1ES1l6Q29Id2hTWGhtV0dxdmUvMFNaMmRzazhFTnVac0RxVjJKbFhzdnNC?=
 =?utf-8?B?eHhSZjBHcmJIQXZIWVRMQVF5RXU2VE05cWlSVHRId3NwMmswSnIxVVVaRjhJ?=
 =?utf-8?B?bkxPN3BKL082eWtJR1B2dEdMMEpBdlBCMXVGVTAzY2lmOXVVa0tmVEtvWDUx?=
 =?utf-8?B?UTBtZHFnTTJZU2d4Wk9oc0ZXdG1hN1ZUSjJSLy9kM2FBMmJyOUhic3E3SWNO?=
 =?utf-8?B?MlVjdlBibWU5c1ZxMmNkcGhWTlErVUFkN0RHT2pJMGp5dHFWdThYQmcwa21Q?=
 =?utf-8?B?NWNMQ3R3WjRiNmRsc3NzTlNMWDdURXJ5MXNWZ1JDaG1tWDlwcnlYckhLanZM?=
 =?utf-8?B?eWtLV3RiV1dpcEtad2wwWHhUNGkyTmR2cFlqZEZXV1gyK3VWUElPTElBZ2pD?=
 =?utf-8?B?TVJTZVMwV3daVlUzV1VYT1czUy9JdlJ5L1d1LzR6NzE3VVZGTkQwdnRnUjdG?=
 =?utf-8?B?a3dBMk9JMmlxTFhvYm9qV0RPMHNBckxIWk45RXAzSUt1aFdmVWZuQk02OTEy?=
 =?utf-8?B?RkhseDBka3FHbkZHZWVLYWY5ZDliYk11WThucEJRR0QrNVZlSllHZ0xuT0pl?=
 =?utf-8?B?VWVlRWlXUzNmRTlLdmR1VW1pQTY0Qi9OZTJlcmhZL1p6bytTTzdyV0pUem9Q?=
 =?utf-8?B?b0dFbm9zZlNNZm1LRVArNzRRV09XazVUamZLNEd2aHU5aHZyZnpoOUcwdTI5?=
 =?utf-8?B?Q05pQUtjamVsKzVsTEVHY29sZ3VJbFZCT1p0RzEwZFFVR0pTdkpGMVRIZ2xs?=
 =?utf-8?B?eE5VSWJMUElXbEl2R21YNU44ZGtkc0tiU2xxLys0cE1mdlh2cUpEcWxwVDhW?=
 =?utf-8?B?WmM0THlMUDFjRWZKWUxMUThsM01xYzkyem5TQ1lMWHc4K0FYNlNiSEpxMm9T?=
 =?utf-8?B?RnRoa243eFJqTHFwSUhIR0tVS3dHY1lIRGxXTE4vNmlNV05jclVyZXM4L2JZ?=
 =?utf-8?B?REpTbGVMQmtCM2pwRnNEaEhET3ZrNnF4RklQSEZIczBMOTMzRkliNFBZc2lJ?=
 =?utf-8?B?TnpqaW1zcThvRWV2TS9RcjdJWHBheFRuMm9kRzV2eW5ROGlacktUUjJVbUN1?=
 =?utf-8?B?VU5DNkZJWTliQTlJc0VkTzIzWDk2VWpUc2dtOWRLNVZVaUdnS056MFpVYVox?=
 =?utf-8?B?R01Rb05mUkJCMjM1cXZTSHA2a2t4VXl1QzJLb0E5T2kvS2Z0NnJtSFcxcHpS?=
 =?utf-8?B?RzFTajZVVlYzdkdEQjJVWTl0cE5TLzBrQWNsR3lucGY1aFpEc3h1ZlFiRVZ4?=
 =?utf-8?B?UEM5UzIzRXdJQW1DN1JuZm9aT1czUVVvMmNKVmlzcmNwbmZPcUIvbTZYdFhN?=
 =?utf-8?B?cmRrZGFFOVZKTE5HcCtmOGRIUE03U01LSG1yQTVsVmhvbUxDZ2w0NGxkcXM3?=
 =?utf-8?B?VkJ1MFBSQ0ZjMWRHOGhua3IyZU1IaGJDdEVvRmViSmticGgxLzlIeWpXK3Mv?=
 =?utf-8?B?MFRWaXVTVkxOZC9BOUd0QXo4b1NScHFlWnBHWXFvU3JpRDBzSk1PZFhacWl1?=
 =?utf-8?B?TGdpVmxHeXhmMWVOZkkrMGJMRkVydjVWUlIvMWtVa2tCa0tOTXZpNGt4Q3ZZ?=
 =?utf-8?B?VXVjQWVMT2gzWjRvRTc4NGlLRnRhcHNkRVRKc29pdk9XTFIwMm9WMGhDZmFn?=
 =?utf-8?B?ZnMySjg4RkR5V1doakUrSTVRQllCL08rNVNCSFZvZ0c2dVArTUQxMlFGeFVv?=
 =?utf-8?B?djZFeDlsSHZqTjh5MWhZMzNSOXdTWGRxd1ZWQmxmbm5mZVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9MNmw1WUlVVkl4K2hqblFkaHlPeks2NzNQQ3RQV09ZNDRvZmdUK2gwWm1O?=
 =?utf-8?B?UWFMd1FEdnFDZ1pVaTI2VDZGc2lyeGNSSXpuWmdXbE1BWVBPb3N1aWgwZ1JD?=
 =?utf-8?B?Q210UnJPa2pmempXV0dCOUtERUJKVk9CQmlvK2h5cEh0RTI4NkJxdVdIbkgr?=
 =?utf-8?B?NWNhRGViMVVKZzB5Y0tPWit6czBCN1ZzbW5rTzdVbGFZV1hxOUpTc2pyenUz?=
 =?utf-8?B?MGtUbldTallCb0FYam9GcDdLTy9lQWVDWVczbUtXSVlsNmYxNm1qd3JDTStp?=
 =?utf-8?B?NGV3K3Q2azZJTzc0M2VHNnpYT3FidDJVNVVLQjQ3a3NzUEZ1T2R3a2U0QitL?=
 =?utf-8?B?R3BtbUoybWhyQ0J6L2lTVTcrak5XQmtjbjI4WENTeWRuTm9LanR5QkpLS2pH?=
 =?utf-8?B?Vlh2T0o3YnI0d1RwQWdndS9SeUFnZnZRdGpoK2UzYmIwRkpkUWVxclFQQm9q?=
 =?utf-8?B?aEt5Q3YrRG52SUszck1jbWIwckJtVG5tRUJsT01LZ043WitDOWhCREtlTTJU?=
 =?utf-8?B?OVNjV2trbWpuVnJxTTQ3aDhtY0djc1p0MWdpcW5mQmcxQlRtYWtaVzY3RURM?=
 =?utf-8?B?TlZpc0NrNUFOUGFVeDM3S01zZDJSa2ZwSVN2ejBFbng0RnA3TU42ckN0ZXpP?=
 =?utf-8?B?amxFdWFpT3hZQ2VtQ25ZUlNsOFU3dFU0VFRQRkVqcmRxaVU3K3lzZkgvM3BE?=
 =?utf-8?B?RnlTamMvbFNHdEQrclpsN3JDeDNwRHF1ZWZON3A1Sm10dFlBdzhjNFJIVFkx?=
 =?utf-8?B?cWFwSlNaNFVGYVdpNTV5aFk0WGNVTUtIbnR2TU5iMk52NFMxUEMwamxHN1ky?=
 =?utf-8?B?VEZGWFZJSTFJaTgzeTBSY3hBeGJBbjlYNXFtMjkvbmJTTlQ3M2JHRWVJSktD?=
 =?utf-8?B?T2JuRW5aYWE0ZkZiSWZaVUxiWUU3YUpYaiswdXNUS1BYbW9wNXk5MlA2b0Nq?=
 =?utf-8?B?Vks3T2tWVU5tM1FnTFRtOWZCeEJVUWIvUjgvM3YrYWtSYTdNTzVJaUd4RFRu?=
 =?utf-8?B?dkMzb0RmU081YzN1akMvMjk5MFJtQ0d2MWc2bEMvQVc4THErQ0E1UkZjQkZF?=
 =?utf-8?B?Z2czUGZKcEF6cW1FaEw5ODNwVDRzSHY0SEVmMyt3SjVhenNIWFQwb2k1RGln?=
 =?utf-8?B?QjQ3eEVUaEpKNVp1NHA3ckxVMGR1VHo2NG1RS3ZUb0tYQ3FLZDFLZ25icnpx?=
 =?utf-8?B?Rm9yWGR6Z01CVnc2cHNyNG1xUlZodTlQQlI1VTFoNndmSWpRS2xJNjlkLzQ0?=
 =?utf-8?B?OVdvUkM0M1RWSFNjZEhrZHZaZXpRTFE0TE1YUDNCdmM2RVBVVDk2VHFhNXU0?=
 =?utf-8?B?cXF1Mkd2Q0NZblR2cGZhMFE2a2pwNlhybXdGSGNMZ3N4bHFqb1M5V0VPZnly?=
 =?utf-8?B?MGkyWXNzUDEzRS9lZk1kS1YycnBTQnVIQSs4TWRhdEFBdkhnUHVkYS90eVZL?=
 =?utf-8?B?dFVXZmhZcXhGeE1yY3dUSUlLS0tzRFptL0YvTk5mNHRlUC9tNFlLbG9RK204?=
 =?utf-8?B?by9GcVIyd3lhMzQyUy9UQ0lTNThhR1ZoVm1xYnhvVm8zTFlCcTVlbHR5cVlz?=
 =?utf-8?B?Y3FlZldOQm84R0VURTRITkVnTEM4L0Z5Vlk5MkFCaENYOVBXaHU1bU5NTnBH?=
 =?utf-8?B?K1dnVmsvVU9yZyswczdMRmx1NlQ1TVViQjVyT2YrWU1NVzFPNld2MzdNRG5W?=
 =?utf-8?B?K3d4b0JQRTZmS1k2Unp0d3JWWmx3VDVUeTZaeGZyb3J0QXJHelU0ZFF4RlBn?=
 =?utf-8?B?a21tdGRGQTJvS01KTnRmVzAyb1VyMDQ3RFpTeXZuWTZ0MG5jL1NmOHZqSXNl?=
 =?utf-8?B?SzFlYzZuNlNXNk9xeWNxNUszL2xnTWVKeWJQNDczdjRFeFlIdCswVVNwKytp?=
 =?utf-8?B?STByVUs5Vk9NTVZ1TjY2UWxVVk4vYWg2TkJOL0tyTmkxRzFxVnN0VzRnT1ds?=
 =?utf-8?B?dDRvMXVqRW9QUmdPSUxxakk5LzA1R2pNTG01SHFCbWlvSENjOHZEclFlTXZq?=
 =?utf-8?B?aCtYN2NhYTBUZHhwMmJQRXZHODVRZ0dhaEE2V3kyc3NrMkhUbTc4THNHZmNC?=
 =?utf-8?B?RmQ4czZrYlZRSDRyTHo1SS9HYTEwNUZWZzBldDVQNEVFQ2VHQVlzT3I3b2dP?=
 =?utf-8?B?Q1VJT004RU9sK0pTc2UrbVFTUG9CeWNCSHVzQmlOSVhMWlB3TWVhS3BpY3h0?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f4752a-2401-455a-0fb3-08de2cd68e29
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:28:35.4867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FoSg7/1uf2p5RaBukHg4cceMTQRw+mzbgEBIBSgtnViFGyRcCmL7Ey5aH1f+3rNPzQ2JrnMenIlAGkEvTfG97YrEiLp9JjHsKJ+4Tizn2j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

As part of the work on patch [1], it became necessary to update the
xe_debugfs test to account for the new debugfs structure. However,
while reviewing the test, I concluded that a broader redesign would make
the test easier to maintain, extend, and adapt to future debugfs changes.

As part of this redesign, I propose replacing the old subtests with a new,
clearer layout. Instead of the previous subtests:
xe-base — validate debugfs root directory and check the contents of the info file
xe-forcewake — check the forcewake node
the new subtests would be:
root-dir — validate the debugfs root directory
tile-dir — validate the debugfs directory for each tile
info-read — validate the contents of the info file

The new subtests rely on a table-driven approach: all expected debugfs
nodes are defined in an array. This allows both conditional tests
(e.g., testing vram_mm only when VRAM is available) and dynamically
generated nodes (e.g., gt%u based on gt_mask, or tile%u based on
tile_mask).

[1]: https://patchwork.freedesktop.org/series/157089

v2 -> v3:
- remove the patch that moves vram_mm to tile level from this series -
  it will be send it separately later to avoid irrelevant failures in
  CI at this moment
- update xe-fast-feedback.testlist to take in to account new subtests
  names
- fix assert in "Add debugfs helpers to open tile directory"

Piotr Piórkowski (5):
  lib/igt_dir: Allow scanning only the current directory
  lib/debugfs: Add debugfs helpers to open tile directory
  tests/intel/debugfs: Rewrite tests to use array-based required debugfs
    file lists
  tests/intel/debugfs: Add tile-dir subtest for per-tile debugfs
    validation
  tests/intel-ci/xe-fast-feedback: Rename xe_debugfs subtests

 lib/igt_debugfs.c                        |  31 ++
 lib/igt_debugfs.h                        |   1 +
 lib/igt_dir.c                            |   1 -
 tests/intel-ci/xe-fast-feedback.testlist |   5 +-
 tests/intel/xe_debugfs.c                 | 414 +++++++++++++++++------
 5 files changed, 348 insertions(+), 104 deletions(-)

-- 
2.34.1

