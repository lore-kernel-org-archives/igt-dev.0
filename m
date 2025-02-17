Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410DEC021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9E110E399;
	Mon, 17 Feb 2025 08:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTUpXRY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4D710E399
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739781424; x=1771317424;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dMxZa61RLJYeV55QypYy4tdpU8YLLpmlk6cyYyd207M=;
 b=GTUpXRY4Q4WW4X1FJ+Z8L4JHb9XZ9CCjrj7T5XY5JWkuupqbHgN589ir
 FXGES2VMePA5+IM4SjtVr50S9zmlF3q7TqkRYdxYlJ3Ats8LBHFFtc7kk
 xhR/KKM+byTCMGWZxTEroSjwqVkT7w1AtY+sZ6hHHKtROxD7JlB3oDpxC
 FewC3zbWtGIc8l11JzfwjpxSYsQZsx+GTLSc5D53p+zg4q1ClO2XRswSm
 YqFSRmmJ5A7daJEQi+YOMZTdGLyYrc4h/oITjZzDUBWlmJNkJMh994PAk
 CFyRb4yzRVJ5EQgnh3iVFss6C+OUvRJJpMNxV1Ov9wcySNmZgIzT6++WG g==;
X-CSE-ConnectionGUID: 3vzEsmMWRb6ysJTTZz+soA==
X-CSE-MsgGUID: 4pBLbwWtQH2M1KrqHnWZ1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51100840"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="51100840"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:37:03 -0800
X-CSE-ConnectionGUID: YT7PACjRSKq8qKDrFPBthg==
X-CSE-MsgGUID: JNrs7t/oTEK05cMNcWx9FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151233646"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:37:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 00:37:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 00:37:02 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 00:36:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDlCxZdDuVhjBAtoOn2imAYuIghI8qA1hxEh08Tm231vV2039f7tfbL9SU44l8XhqnvdwuiSYXlps+SZzqmaIoWhmNqD0FgF7ClO70LeAmV9hLYgNJTVIi6rTb4DFNWDzwVFIfPi8JYndYkObkeJcJl9MekeYDCtib0wWqVghanDDlJCfWpaqK6DftetyFdF3Gmo6JTgDBIS//921TE22Z8ieR1Gt+wkQeV0n5vBPO2330QBRBNroWmt2jxlJFisMrZSvCaNmaUwW6vA9+bkelCmhkT23UP+3P1BDy9It8biJksLfExc+uCPuEwLW1Gzuk8SWJRRPfLwbq9V6whqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8s7KOxZHGmczNNIj2/y5MYW7ab7uxPqxb9QBAaWG9M=;
 b=xofNp4jA2jKwMPbTL5BO4iNt0DtFaaeqPXUlwcodU5N7sMwvLFU8idsC9r1kZGSUutKOTs16GQm9s/z7C0KYOCzRxmUmO4YxyuUCfnOmIpAfbwzabQ6I5uw6i0dQDWbIo6a82yRstXuXMtFNAuOlQejLeqsESPuf7AbQ0p3aJCp/dRO5nyliJ5xfHQFlz4exL1dRr95JjCLCrEm5yi03SOZSOBD/ppoRhNm8CLMRnxJCQ32yPwdMsgh4uVXHd7qLUWXR0+uxh6JG2fMvqgdM+7QVLjJ/TKXkMd58jdKnkalzC17cpEfbJG1J4cgjaaDgMWXNkgsff6Jo0sK5Lh5ccA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.19; Mon, 17 Feb 2025 08:36:44 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 08:36:44 +0000
Message-ID: <9850f772-603a-4732-8b4e-c9aec263c9f7@intel.com>
Date: Mon, 17 Feb 2025 14:06:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/kms_cdclk: Use igt_get_max_cdclk()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
 <20250213110814.351186-6-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250213110814.351186-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0163.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::33) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce52f32-1794-45f2-48bf-08dd4f2e35b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVVUWEFpcFdEUEN0OEg4QmcwUDhsNm1yanhvbmlVS0VEY0VtUWhZWFN5dVVF?=
 =?utf-8?B?QXVoVjdIRGJmWXhyYlQyUXhQWTFvZzlCSXJNME1LSmJsZlo1eC9EcTZhUDho?=
 =?utf-8?B?dXRQaFZzVFhpWGdJY1pYTVRhSytLVmJiZTBPQ3M4MkJPb0dQenk0SEE0c3dk?=
 =?utf-8?B?bHNFeVFhbXJxQXpIck9EMWRVUjIxWEgrQmtGQU1UTlBpY1ZLQ2h5R01hdmJr?=
 =?utf-8?B?SjhCKzgxOEk1Tk95VzBwSk9lNVdRTndrL0IvNUJGSlg2M0xtMDdzL0hzanhj?=
 =?utf-8?B?emxXVVR1U1NJaGwyai9LQ0FwOHFub3ZwUlgzVmZTbGpISzBkWVA5OGgzd0F3?=
 =?utf-8?B?SGM1bkVyd2pSUStKTFF6cm1NSVBSTytsSDFld3VWcGIyRS8xL0ZDTllDZUxk?=
 =?utf-8?B?TjFJS0ZIcWwyZ0FSTmdteVdSUGVEbW4yUDRnRjc5SXRrZUZ1eVJiY2kvWDkz?=
 =?utf-8?B?RC9GZU1FeEVlWFBYMEdUT2VxSGxpNUpmZ1A4TURZSmN0VVpRd00zZDZubEtu?=
 =?utf-8?B?YkptMkZCTmNOd3ZRUUVPaEZSclRrMFpmZUVOYlR1RmhITkdiNHJWSUE1Y1JJ?=
 =?utf-8?B?cDJCT2lnTUhmM2tLYkhZREswVDlpYUdTKzVvVFgyVG1aR1ZsNy9pSkRLazhj?=
 =?utf-8?B?UTlsNVh1Z0pFQkNkYXozR2xPYktCV3k3b2czZm9sR1JPZ05tcnRrc3Z4MUNU?=
 =?utf-8?B?a0NZb2V3dWhSS1lDL0U2Z1ZnRVh6QWpSN21qRlZ4M2ozVWNXVWtJdW56aENZ?=
 =?utf-8?B?ZHFHcldoM3FpN1p5cTA1M3U2R3QrTzN5d015cjhQT0RjbzcxYjdJL2tpbWda?=
 =?utf-8?B?YzllY21rUFJkWGRLMGhaeGZtbk5LMDAzeHhEOEhZK2VOd3FFK1R5NmQrNEhJ?=
 =?utf-8?B?b05Dc1hGMncyNFNxOXBvcEpCdGt5am1kVHJGSmgzWWxWSk9MZjNNNHl6bUpq?=
 =?utf-8?B?OEo5dmgrWGJLVWE2cXIvSk16WXB3YXhGalEyTmRJY3AwQkw1SnBJRFY5TWRQ?=
 =?utf-8?B?TWdNN2QzU3hMTUFyTnF6U1dlUjc2b1krNnhRS0s0TjBlQUoxQ2daNWdERDQ4?=
 =?utf-8?B?VC9PWE1qVVhzd2I0N3VKUVQrZGNXMlJ3MDBMZDRUVmYzUkhFalRHODVxUDVK?=
 =?utf-8?B?aFhBVWFTNFhjSi81OU9qLzU1TVlHOWo3blhEVldETW9DVFM3aTU1dUZHZ3V4?=
 =?utf-8?B?TnIveW01alE1ZEZybU5oU3Y1STRadDF5b2EvWWFyZStxeUVXWlR6aUI2Q2Jt?=
 =?utf-8?B?L205dFR0MW9yOGZ0OGg0UWNzSDk4L0htRmFqNkplbElxWitYMlVvelovWkNN?=
 =?utf-8?B?K0J3aDA4RUZyV05YVExLNnlxK1VXcG81c0s0T2JOUEtVOU9SV1FLMVFYbDZG?=
 =?utf-8?B?S1NodkltR1ZodnZRb3c0T3ZpR2N3d29DQ1NLUjhuYzRLMzI1QVZjQ3ZRRGN3?=
 =?utf-8?B?QldOZmlwRWNDRmlPMDU0TUJUUW1qSUNrMjhuY0hyRWJlbzFzN1hPWEpNWHJY?=
 =?utf-8?B?aUorWUQ2ZE95eTBLRzZuWDdBUlZBN2x2Ty9MRXcxZG9mN244YW9iOXVleGtP?=
 =?utf-8?B?R0txYW0xWWpkTzN2WTBqSEJGelhycGRQVWlLbjAyTm1ybVUyVTBhUFRNdFJr?=
 =?utf-8?B?blg2UDM3aEoySmVHc0J0OXFNeitOd3VmR1ZpempNRDdIVi9yT09Cb24xME5o?=
 =?utf-8?B?a1JFbjlGRHA4cFRpdExtQ2xjWmZLbHE5dW1HSC9laElaMzhJYmozNWoyVVVK?=
 =?utf-8?B?Ymd6cXNQUElNSWZPall2TDVIQ25xR29mTmM1NHhBN1diSGRTM3BHTlZyOWh1?=
 =?utf-8?B?R1ZqREp0YkNCYmJJTnZZenVUcVROQ2svMjZNTkM4akVhZXdsWTBObTNVWDdu?=
 =?utf-8?Q?cxi6mz7GS5ut1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1ZCMXJaMThwaWNMcWxib2xGYkdkVWk1WkVSeC9pbWdQZ3QvdTFzVEl4MFU3?=
 =?utf-8?B?aWZ6TXNRdjVtSFpiSmVtZG41M0RxemV4L29oRUZTV3IzMzR3SU5GRGh4a3d6?=
 =?utf-8?B?SUt5amlkZDkyVDUyQW9iQkxzNTRvRVFaaGtISEMvSTh1ZHRjZ09MWVloOUxR?=
 =?utf-8?B?WUxhR3Jpd2h6aSsxeTZOQlpPNGpQL2xSN2w4c25NNWdkTE1nS1NhbmdZTUlI?=
 =?utf-8?B?am44YXQ4cVNoMGZyTUNZYXIvQ2tHRGt5TnRLN2ZZTCtySkNXWmRPeHlOYVov?=
 =?utf-8?B?ZzRRN1FFSHFYd0FHSWdpWm94MFNFdGcyNWpjSlVQVnVVSVIza25KNC8wZlNP?=
 =?utf-8?B?QkxWakYxa3laSllqY1lRMXpQQlAwb1VBaHY5RGFycDR0Vnh0RG9wVzQ4OWpV?=
 =?utf-8?B?a1dpS083NE9VVUxRdmVDS3ZVQmR6WG1TUEtzU2U4MXg0ajNURTYvMUJQamhT?=
 =?utf-8?B?SkFqcWZkSkgvam45MENRQUZpZG9kRXVLVGY0R3Q1UlBtRU9FUk5KTmU1UUQw?=
 =?utf-8?B?SWZoSGx0ejVXV3pmdzR4TVpLbEJlRnJBaWdFdW03Yk5hb0JueTFDQjFpVHQ1?=
 =?utf-8?B?VHA2L3BOOG9JeEw3WmZuVHhXOGw2d3I1M1Q3QjhYODc2U2FJYVpUdFJSMVZn?=
 =?utf-8?B?bE1zUnBjZkRqYWM4UmpKWXlGMXNHNHdEbUtkNG5uOXo3bGUyaGtDWHhmZTJU?=
 =?utf-8?B?SWRUY0FsV0hLcVJ3WDVaSG4xM2taUE1YUlluS1I5b2MzMFp5MlpYWmFGVUox?=
 =?utf-8?B?TlplcWNRUmlxbjFNSWRPYmNWVUUyeUtFUEo1R2N2RndHVGNaRW5aK2FwaEdT?=
 =?utf-8?B?Y1l1bVI0cVdrR3IvcmtMU0tFZm1wbDZGWTltSkZSSFdETXFqZnlYUjF4REZD?=
 =?utf-8?B?cWhtcW1WMmZ5K2ZlRVNQYU9JYkNKakZwMUw0M0xYWnZpY1BmdDVNTzRUSFNj?=
 =?utf-8?B?aHludTFmeFF6UlgyUytoT1ZlQnlvSXpjWDhDRmg1RmVGNEhubis3V0tBdHFq?=
 =?utf-8?B?NkRmRTBhYXRkNEx0eDlqU3BuRnZudWpORXJvbjJINSs1SGc2ZXE5Y1ZTQUc2?=
 =?utf-8?B?bU9YVjN0T0NMRFhac2xRUGR1azJVTGs3VkNmL2NLNFN6TjVlTUZGVXk2emRO?=
 =?utf-8?B?anpieEZVMzVqTERQMW53RUZGaDlUay9mRDBqeWViSTFHMEFlNEc3SWpSUGJ4?=
 =?utf-8?B?bzFBVlpIOW4xejgxamNXdzA5MjI5cDFtM3A1SGFsRjgxd3JQZG5rSTdXY3Fu?=
 =?utf-8?B?dnhSc2NhRS9MWUNubEZLK1BOVDlVMWNUaThEdTg4aUNkWkpmUExVMExFbWsz?=
 =?utf-8?B?K1pmeGhoc1Y3MTJLSWNMd3hNTGFSeGNOVDVXK3ovdGRkaHpVbDVCNlNYTXE0?=
 =?utf-8?B?bm1EVHZEelB6Z0M3MEJXeHJKcWNCUkdrQXVlUGtkbHJEOXBTSkF0eFdBQVlI?=
 =?utf-8?B?T2l2NFJodE83Y2dHUTcya2owcnRNbFkvOGczUEJzZnlMRml6Q0ROWS9rNUcy?=
 =?utf-8?B?eHFUVWtVc0JueXZWRzdabm93UlBmSFFiWktIWkFsZXNDaXBhaVgxMWdjbktK?=
 =?utf-8?B?QW42dVUvNTBuQ1N1RnJBZnZHclpuc1JMVUdKZFJ6ckFUU2h0a3BzdmdiY0Fh?=
 =?utf-8?B?dG9BVkJydTRzMTRnTVhpUFp4aVZ1TmFRbFNjUVN4OFJ2eWlybHMvcW91NVZ3?=
 =?utf-8?B?UUViTWp0VXhkRGtjQXN0V09FUm5YVnl4UUVNSXZxZzhaNnBZZU5makFkNVJF?=
 =?utf-8?B?aXlERHp0UENvL3orazh6TkVkVW9IUW8xS1dKSDdWSlBOTXFzWGRuUno3dTc0?=
 =?utf-8?B?S1BZK0tkUG5UTCt0NXJjbkV4RkxRTGcyTDU5bHhZU2FJVGJzWjdvUWdoN2J6?=
 =?utf-8?B?S3dHMVpCRjN4b2JMVS8vRyt1THRUb0ZJZW1kbyt3TUprZ3dTL0lNRzBvd2Zs?=
 =?utf-8?B?c2tjbEc0djJ5ZVJaZVhHS2hLUm90bHc4OStLelJyWjlWeTM3NUkyZ1pFRUwx?=
 =?utf-8?B?NERXaTFzM08vUHhUMkFhMzM1RFpaRDdhVFVzTmcrM0RENjF5UEQwQjZJR1Y1?=
 =?utf-8?B?TlBGbHg1UHRoM0ZkaS9PZlBVZy9hdFN0VXg2L05MTzJwckl2UnByc1VPM09U?=
 =?utf-8?B?UEhKR3lrY0ZoTmxjT2ltcno4c1pId3NGUzRMK3U1Uy9CVVVDbGJFNXVCR3FM?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce52f32-1794-45f2-48bf-08dd4f2e35b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:36:44.5471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCZasP3g5Zaqh8IYtyAiNUd9M25MZQwWIuyiGAfcTOefLeohH/rJ4aT7quX+Xxy1nnn4DFrAB6WDzLs+K4R+2h+dsVGHSaAB7Ho7Kw188V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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


On 2/13/2025 4:38 PM, Swati Sharma wrote:
> Replace hardcoded max cdclk freq with one computed from debugfs.
> in igt_get_max_cdclk(). Also, add same condition for
> all_outputs subtest.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/intel/kms_cdclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index eeb1ecd69..3596fd30c 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -53,7 +53,6 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
>   #define HDISPLAY_4K	3840
>   #define VDISPLAY_4K	2160
>   #define VREFRESH	60
> -#define MAX_CDCLK_4K	307200
>   
>   /* Test flags */
>   enum {
> @@ -250,7 +249,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
>   
>   	/* cdclk should bump */
> -	if (cdclk_new != MAX_CDCLK_4K)
> +	if (cdclk_new != igt_get_max_cdclk(debugfs_fd))
>   		igt_assert_lt(cdclk_ref, cdclk_new);
>   
>   	/* cleanup */
> @@ -341,7 +340,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
>   
>   	/* cdclk should bump */
> -	igt_assert_lt(cdclk_ref, cdclk_new);
> +	if (cdclk_new != igt_get_max_cdclk(debugfs_fd))
> +		igt_assert_lt(cdclk_ref, cdclk_new);
>   
>   	do_cleanup_display(display);
>   	igt_remove_fb(data->drm_fd, &fb);
