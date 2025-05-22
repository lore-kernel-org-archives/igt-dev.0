Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B429CC54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 12:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75E610EB29;
	Thu, 22 May 2025 12:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhW4egdn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699E410ECA5
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747915588; x=1779451588;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DDZDgxpYOY51O/3u3K1y+wCwZtbGWobcXNKS3Q80/+E=;
 b=GhW4egdnmsa47WdQfMC5hpsB/nCIrU1V1eDjfV0/0LuKW6O2Bjz2AtsK
 AmHfH69Lo1+ujgQJw2M7CMF8ytWdYiqE8HQB4OwLLU+6rI4fIYohzhls1
 g6l5R25tMgEmd51cio6z8WqDORS+0kWX1373TxJn3jkY8z3acml/BSJOc
 RBhBFw68Ep9NDkqIZidwFp2M/YxSCBbpu6KUtQcFm3TkDcJ0x2/trZozw
 V0pUnHWuvKEhqAwxAAyDWmqXSfA1zWekiubD2JDutmTM1qUTKhKKcORQF
 F2f/r7sKezAd24tfcx8VQjDP3xwW46akb1c4OEHU1oTzGo0rJLrgD2+mv Q==;
X-CSE-ConnectionGUID: Cy41ob6zR6C9YHNlVGZPsg==
X-CSE-MsgGUID: 6vX3bY++RC+Ft/SSinu4nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49814230"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49814230"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 05:06:28 -0700
X-CSE-ConnectionGUID: PhaiuMWtR56R1EUscyuMww==
X-CSE-MsgGUID: lIQn5kD4St6uh7msu+dFpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140441521"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 05:06:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 05:06:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 05:06:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 05:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZDzBG9QyaIUqd8A5D+OHD+Cxeku71wyIJPzUInFkY0HaZ7edQnwh6hkF792F8KCaLgspGBGXiyduydBspAqeRp2k5A64hIxOKPzmV3C61VlRPujJSrUyynSZmwsCMIufZxT614H5dGpKso2c7xL6C+ZvjCkBENX+XUIaBVc3bkfgHUO1/QJcqsi2iqk2Fj9o3IKnV7PuUoa6HQnepeEAOMWBzcF3QOiSqPRkcWYZW5xQqb5OtfKs/TMXun3q8wl3WHOE4ZXB5QbWjWYoRvumcF1miFicQlWxNQtYCR0JFgqh1BZA74L0hJVUScg4nK1PSD74VCXLUqWARcAwIznUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go3RsfnTMgdWh+0XeMpC3eT3JcWISAs87giBdKIXVQo=;
 b=ESvkv1OJ/V+QYvkFSA4fqeeoJbD3WEG8mDJ7qcXvQQ6qZvj+l25bsa2RmB/pJc0aBnz/yJ7mzmuW9jST9itY5anLJwvoUGZwRxSscudFIvJH4F/yfkoI5PdzCvyjFj4KaC6P7DC0+Oh0Aw9L4BEnCQ+B+q4ry9Kw5eI7fvIZop2pM4PYEpGY1z8HAx1aAd/n5VUTn5hnzXS9PoihksAcSbxxv5LODTfhKjrXs048JZXECjqnooIhjht9J8ZkjaSg0pcRv2OIlkQRa9jwmzPe9GImZAyXz+wbKLa6/8yPWnRpmmLLRDeVwZzutv5IbnRlZZApEO5BLGNOJp8g+mtlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 12:05:55 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 12:05:55 +0000
Date: Thu, 22 May 2025 14:05:51 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 10/15] tests/xe_copy_basic: replace size to rect
 which keeps objects geometry
Message-ID: <aC8THxeHA6Zurcxe@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-11-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-11-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0224.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5bcc18-6e7d-4605-a743-08dd99290158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3drZ1VLTXVscmhNcGt2N2hmZ1QwblNUUGkzUjFibG9rczdJcm9GcTJhcHlr?=
 =?utf-8?B?LzRNUk1tV0k5MnJHSVN4Ym1mK0d4eVA1RjNHdlFDb0pMdS9rSXpMdU5FT0c3?=
 =?utf-8?B?K2MxVDhlaTc3R3NMUWRVZmhuOW9VaGVaeUZUdEo0cTNiSUk4MGxSRVB1bzBG?=
 =?utf-8?B?OUJzOFNzY2NGM0pxZlVKN2FLb3JLODNLMStZLzNNMVNkVzVKU2dVcmQzWWRu?=
 =?utf-8?B?NWZSNTNtVjVQQjdDd0pJUkRYNXUwQWZsZG5rSDh0WHp4RU1ySC9XWSt2eTZZ?=
 =?utf-8?B?N1RyaVlTQUswMXRHRkpFNWFxVXhjeHlQQmZWMDlqcVZaTUx3YjlELzBEVVBz?=
 =?utf-8?B?ZlJtdXZjV1JzV21BTHlnNFVIVWlzQ1dnY0wxOEw1MVY4UThCN3lLRC9ZUk54?=
 =?utf-8?B?TUgrKzVPNVJZanpjNTlGV05rR0E5V2FkSkZsdnlIYnAvYTFDb2FWSGcwRElQ?=
 =?utf-8?B?Z015cm0wZjM3UFpicHNFcmVJQ1NnbStvV3V4RFlnNzF6VmZodWk0L0orRzd1?=
 =?utf-8?B?SnltWnk2OW41djJpYkRpZ0ozTU1kNUQxN3RYSlkyYzcwQjR1Y3c0WWROaTRN?=
 =?utf-8?B?K2xGdTNTWUFEL00xM0dqT0VQS0tmeHFDTWVjNUlObk5paFRTSkhhTVJ5SkNR?=
 =?utf-8?B?Y1FXaUN1TVF0R0ZwU3ZLdjRLdjN0b0lwYXRVcXhIZTI3VUYxNEZ2VE8xeFhR?=
 =?utf-8?B?bkNDeGdia2dHOXY5UEI5K2dCa01kMmlveUlYZlI1MU1xeGVLUUZ4TkZLL0h2?=
 =?utf-8?B?cDRTdmd1aHJSa0M3SEZDWUUzZ2RnMVlKa0VsUG1Ea3FrRFN4RS9lWFZjY1Na?=
 =?utf-8?B?OGc2dlpOcDNGTkcrYkhKTGR1eTdPdVZGdVVSdDMrNFg1K0s3Tlo2bmZReVhs?=
 =?utf-8?B?SlBYb0pyMmVlVlIwVmxndHkzZmxoeTh3anhmdG94Z1dsNlVqUzlRT2NEZTly?=
 =?utf-8?B?ckJZK1gwd2ZFZHVmeFpZSE9PVUhKOGtuU2xIaEF2WktMNElYSFBacmEzSjF0?=
 =?utf-8?B?cmJnVVp4SFcySmlnbFIweVppKzBVZnRHQ09SZWJvV0x6eHFjU2U5UmRGM0F5?=
 =?utf-8?B?L3U3WXk1OG9BMVF2QWRhcUVMRHFhME50VUNEWkJFYUhWblluaUM2dDJKSnhN?=
 =?utf-8?B?c1dFN0kvRmIwTjBiM1p5ZjFkVFpmb3VwWG9QN2tRSnVvNWZRNzNYcTNxN3RZ?=
 =?utf-8?B?WnNHN3JidWZRUFJkVS9XR210YU5xZURqMG5FV0d2bkd2dCtBV1diVVdwdHRx?=
 =?utf-8?B?OElSWm1RdXhmdG9CTjQwd3Fnc1VzeXNQbnZPMXp6Wko1azZ5OFNTZ1ExK0U3?=
 =?utf-8?B?UWp4OXlrRHFxZHgwSUQ1K0VHMWkzOStOYys3SVozMmxhWlE4MmVQZjlMK0Y5?=
 =?utf-8?B?N3NsdUllZENlMjVGUVRsWHAxK1VIOWJxMUVvNDV0d2dvZkVycWJ2ZVVMNG03?=
 =?utf-8?B?aFM2MnN1UEpqZ1FQelNXOU9SSTM1aUR6VVhiRXBJdkVjY3NkNzhPZG5wbXQz?=
 =?utf-8?B?TFNmWVA1VFZQa25pblo5SmFmQkdWbUZhMHpuWkJZMzErRmFlV2FXSVpLS3Rj?=
 =?utf-8?B?eUNORG5qUURHby9NK0JRL0xPc1RtWEpLZE00UGIxK2RIZmtrVmZ3SWlFbHdC?=
 =?utf-8?B?K1ltWGtXSjZRTzJjRmNPaDMrc1RBUWpKVHYvQzFxcE9XVUFnTlU2NWZEMllB?=
 =?utf-8?B?dC9oaVJMQ3RmcTI1emk1NXZJUU9JL0kyY2JpeDlVMDBmdHhnd3pEbDJKcVhx?=
 =?utf-8?B?M0dPQ2YrWFdReVZaMlgyWDVubkw3RU5PeElwaDdEdXl1Zy9GVTQvUDdSdjQz?=
 =?utf-8?B?S3c5ZnUrVzB5a2laUk5XaUtUdmRhVTRtRlE5NGhSWHVkclY2OUxJa2VLUU11?=
 =?utf-8?B?MEdwc2VmVHN1RWZEaE1ZSDdndWNEVlZoTTFLdzVXYjZNdWt5cHBwR0ppUEUw?=
 =?utf-8?Q?b5yNNuuDUTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVJ1K0NqYWVLbHFQT1Q4SU1WQWZrNUpOVW05R1RyT0lqaEt5UUJNSG9TVUlU?=
 =?utf-8?B?N21VN2NtY0tMK2Z6c1VEa1NwUmZGSmdVVVpBc3h1SHovRUx3ZnJ0OHdVRUEy?=
 =?utf-8?B?c3dWRHdFVnV0U3ZSOXRzTVJQcTFNL1FBd3c2YWJoMU5rSHRwMUFaUExPS3VX?=
 =?utf-8?B?aDZvL3dQTWxYN0t0RmZLd25HSkFnSHA1ZzNyU2U0bExQRldid1FzTE1OcVEz?=
 =?utf-8?B?MGpxdE8wYk1sR1lBRXJZVUNXdzRaUmwzRTRqOUhualA4RmpmMDlXUUtpVDcz?=
 =?utf-8?B?NEpvTFpkY1JWYjlHSGUwbWMyR212VlpzRkxwbW1mNC9oZERtWGN0ajZUUXhR?=
 =?utf-8?B?c29KTVBCTTRKRVhBQytDMkFrN3MyMUN1R2J1S3N1WEZhN2tpV0xYT0tidjVh?=
 =?utf-8?B?RGlqTnVtczl1amEybTlmYUlNUnFQeWd3Snd6am84U3pMWERHOGJWU2ZFRU5Y?=
 =?utf-8?B?YUdmRk94VUFXZzRLMWxBeVI2SE5YR1IvalNaYW41ME50YlpRcWF0d0VSTnZi?=
 =?utf-8?B?TGh1TkU5NE9saHVBUGd5V0NYbWtWa2hUSUVMdy9sWXRVWE1PaXhlU1grSTNI?=
 =?utf-8?B?eW5ZZHRDcklDdzlLSk9YMSs5ZXJ4dEg0Q25pdUtmUlFUVFAvWWkvamcxaEZ6?=
 =?utf-8?B?NVBSMVkzMU9PTHdNTUhzQ0V2aVhDc2oyWjlGRGc1azE0T0tyVDM2TWV0WUZm?=
 =?utf-8?B?MnQzYXdUdVhEWlVTZm9iYlF1MytnNDF4L3J6em05TkdiZ25JdDlZc243NEpN?=
 =?utf-8?B?a0NuQzBWcTdnYitjUnk4ZlJjNXZFUGFBVkxmR0s1YXlsRWE0RUZLaFl0R0VU?=
 =?utf-8?B?Z296dUdiamhhRFVzTEk5NXZDek4rdzA3MHlSVGZxMDBOd21Ybml3SWJhb3Z3?=
 =?utf-8?B?L2s5QXBoMjFEUTYzckRjNnJEa0VzZjZuZzNLRTFJYXhmOFJSakQrSEQ4c0ht?=
 =?utf-8?B?aVVnN3orQVZ6c1pWY040L1ZVUFZYb3VnOVNTRHFPL3JhTlphN1Y1WW9zMkJs?=
 =?utf-8?B?cXJKMGpLVThxRFNwSGs2M0cyYmo0WDJRNXBpN0pRTE5pQUJoVGk5MWlGcklj?=
 =?utf-8?B?L3pkeWswdVhuTmx2dDBvUjR0T2hpSm9JK0NqNmRFVndkcWVYZ3dZemYwUnVs?=
 =?utf-8?B?OEZZd0R1NVlvdEtieXBQM0lUWkRiaXN0S2svME9Ed1R2RFdLb0krbHJIc1VG?=
 =?utf-8?B?WWRnc00vVW9Panl4VU9Db0J2cGxkV2JnWkhweUluelAzbFhzZkJmdkxZaXJl?=
 =?utf-8?B?TUI1RUdVeWNOaW96ZWNLR0k2Tk5aR2NQbUdyYm9HV01xSW01cUxaK2FuZ01y?=
 =?utf-8?B?ejY1UnM5T2hxN1laVGlwU0F2SFBpb1lIMHVhYkMzN3IybExqejdOYm4zTmxN?=
 =?utf-8?B?UUQ4WGxEMzRRQ2hkaE1va0M1Nm1hRjFScEM4bzQ0UEl5TG1aREFLS2hQaXNw?=
 =?utf-8?B?TUdHanlGcDdaekpLTVFHR0V0amlhSVd5dURKSVVMWjUvSUNMN2pva3Bic2FX?=
 =?utf-8?B?Smx0U0ZEVGRJQXlKRVNnV1FucmVoVkNmQS9Qa251MldzZDgrd0RtbFFJZUpy?=
 =?utf-8?B?akFNRnRqZG1Gb0czWlNtcFlMemMvdHYzSVFEdlJaSmdPZ3BqaTZjcXpyWE03?=
 =?utf-8?B?SUFzZTNFMFZXVE5JZWpmQkI4OUdXNzBTWitRMVFyRmpoNlVPK3hNYm16bmZU?=
 =?utf-8?B?Y1E1c0d4ZXBpNit3djVnQXZkTjBUNDRKWmYyV1NVZi9IaWd0Wks0NHVSTW1a?=
 =?utf-8?B?REZXdXVCWUZvNjhpVThqaEkwSDI2Yk9tTHhmeE90RE5BSzZEaEVESGQzOS9l?=
 =?utf-8?B?L29nbnJLQWtaUXRoMkk2MWw3T2lFdUR4S2xydWRTTkU0elpTUnNKMWpKTmpa?=
 =?utf-8?B?eGlZNHhMTUU3WEZQT0hXTnk2SmlXUzgvN0VyeEppek5jRE5XUzh4V0JPSGsz?=
 =?utf-8?B?am1lc3pkTStKZ3I4Tmh2Vmg3eXpLTi92cWdQaGJ1MTYrLzJyeW1OeldwZGpH?=
 =?utf-8?B?YkVCMHpZWmpxeGxqL2o3MU43Q2QxQnNGbzNjWVZScHdWY2hUdDlWcERUY0Z1?=
 =?utf-8?B?WVFEWUdLb0Y2YitPRS9oTkE1TGliYWpjSjFiNGt6UW1TUVMzeWRQYWNsZTRp?=
 =?utf-8?B?ME00VkVxcTZCZlQ2TlNJQTZsVFBZRklvZ2p3SlU0WWxFT0xhNFBTcnBwQkhT?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5bcc18-6e7d-4605-a743-08dd99290158
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:05:55.3837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqgY971E33qmp0vxu/v+ZdBVkMkFHiJMz4tZ7w/yGjHfk7Pd4MjyDMW4Cs0SgyJ86MGaGhka19m9BqQbi77P3XDX/CSQJrfTuCyrR/vkyF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
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

On Tue, May 13, 2025 at 08:58:05PM +0200, Zbigniew Kempczyński wrote:
> Testing byte/page + linear/matrix mem-copy requires passing different
> pitch/width/height so replace simple size to geometry.
> 
> Change mem-copy and mem-set to use rect instead of size for
> copying bytes.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_copy_basic.c | 44 +++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index f252d29fd4..7bec248b06 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -19,6 +19,13 @@
>  
>  #define MEM_FILL 0x8b
>  
> +struct rect {
> +	uint32_t pitch;
> +	uint32_t width;
> +	uint32_t height;
> +	enum blt_memop_mode mode;
> +};
> +
>  /**
>   * TEST: Test to validate copy commands on xe
>   * Category: Core
> @@ -42,7 +49,9 @@
>   */
>  static void
>  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
> -	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
> +	 enum blt_memop_type type, enum blt_memop_mode mode,
> +	 uint32_t size, uint32_t pitch,
> +	 uint32_t width, uint32_t height, uint32_t region)
>  {
>  	struct blt_mem_copy_data mem = {};
>  	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
> @@ -125,13 +134,15 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	munmap(mem.dst.ptr, size);
>  }
>  
> -static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t region)
> +static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t region)
>  {
>  	struct drm_xe_engine_class_instance inst = {
>  		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>  	};
> -	uint32_t src_handle, dst_handle, vm, exec_queue, src_size, dst_size;
> -	uint32_t bo_size = ALIGN(size, xe_get_default_alignment(fd));
> +	uint32_t src_handle, dst_handle, vm, exec_queue;
> +	uint32_t pitch = rect->pitch ?: rect->width;
> +	uint32_t blocksize = rect->mode ? pitch << 8 : pitch;

Is this assuming enum values for MODE_BYTE and MODE_PAGE? Better use
explicit comparison with: rect->mode == MODE_PAGE ?

> +	uint32_t bo_size = ALIGN(blocksize * rect->height, xe_get_default_alignment(fd));
>  	intel_ctx_t *ctx;
>  
>  	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
> @@ -140,13 +151,11 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
>  	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
>  	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
>  
> -	src_size = bo_size;
> -	dst_size = bo_size;
> -
>  	if (cmd == MEM_COPY)
> -		mem_copy(fd, src_handle, dst_handle, ctx, src_size, size, 1, region);
> +		mem_copy(fd, src_handle, dst_handle, ctx, TYPE_LINEAR, rect->mode,
> +			 bo_size, pitch, rect->width, rect->height, region);
>  	else if (cmd == MEM_SET)
> -		mem_set(fd, dst_handle, ctx, dst_size, size, 1, MEM_FILL, region);
> +		mem_set(fd, dst_handle, ctx, bo_size, rect->width, 1, MEM_FILL, region);
>  
>  	gem_close(fd, src_handle);
>  	gem_close(fd, dst_handle);
> @@ -160,7 +169,10 @@ igt_main
>  	int fd;
>  	struct igt_collection *set, *regions;
>  	uint32_t region;
> -	uint64_t size[] = {0xFD, 0x369, 0x3FFF, 0xFFFE};
> +	struct rect linear[] = { { 0, 0xfd, 1 },
> +				 { 0, 0x369, 0x1 },

Any reason for using 0x1 here, unlike for others? What about the mode?

> +				 { 0, 0x3fff, 1 },
> +				 { 0, 0xfffe, 1 } };
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -170,22 +182,22 @@ igt_main
>  					       DRM_XE_MEM_REGION_CLASS_VRAM);
>  	}
>  
> -	for (int i = 0; i < ARRAY_SIZE(size); i++) {
> -		igt_subtest_f("mem-copy-linear-0x%"PRIx64"", size[i]) {
> +	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
> +		igt_subtest_f("mem-copy-linear-0x%x", linear[i].width) {
>  			igt_require(blt_has_mem_copy(fd));
>  			for_each_variation_r(regions, 1, set) {
>  				region = igt_collection_get_value(regions, 0);
> -				copy_test(fd, size[i], MEM_COPY, region);
> +				copy_test(fd, &linear[i], MEM_COPY, region);
>  			}
>  		}
>  	}
>  
> -	for (int i = 0; i < ARRAY_SIZE(size); i++) {
> -		igt_subtest_f("mem-set-linear-0x%"PRIx64"", size[i]) {
> +	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
> +		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
>  			igt_require(blt_has_mem_set(fd));
>  			for_each_variation_r(regions, 1, set) {
>  				region = igt_collection_get_value(regions, 0);
> -				copy_test(fd, size[i], MEM_SET, region);
> +				copy_test(fd, &linear[i], MEM_SET, region);
>  			}
>  		}
>  	}
> -- 
> 2.43.0
> 
