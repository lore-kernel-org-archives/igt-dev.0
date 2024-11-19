Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B71D44161
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 14:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0915E10E2A1;
	Tue, 19 Nov 2024 14:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUrL3T+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411A310E2A1
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732026697; x=1763562697;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=coas+n03884t/cK4rE1R/1JxOXOAe85QIJE7uUqouHI=;
 b=GUrL3T+5n5aytS2xmMfFej8+44db7LwYa9sZs3Nt0sRZh3DKNyAhZPG+
 a7tt+wdlBKZKglvU1RzFNx1V7+9OigXso+E2u/7oIophjQV2jGdWP9Rsj
 +20dT1ptBAw2b6cVNK6YFHphvHzECMZYKlSJxuHcAmUQRfDtoLcRiE7U9
 uZ1YkP9VNd5jI2bL03mxXFYnkNo07s365lbLF3hNEd31nHW+2b5ohdyba
 Pda1oLIurb+0abkmuWfZoKW3h8N0PURQMKDA3KUIiCa3N/VBLCCrchT8d
 ZVcOPbZd2/ylLC1yQlhEerzOkj3cdJiXIhvPfO4CZ4iYlcAxHMGSs/jPT A==;
X-CSE-ConnectionGUID: 4uqWxYJ4Sx2y3Qgrs0oiRA==
X-CSE-MsgGUID: gmLM6rPsSXeVcObvIgbQlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31884995"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31884995"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 06:31:37 -0800
X-CSE-ConnectionGUID: WORFrMKFSxCKj6ubNz4cVw==
X-CSE-MsgGUID: +tqv8G0WRxu24WtOSpe9uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89731397"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 06:31:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 06:31:36 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 06:31:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 06:31:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKuHvoZnM6nDj3K9xEwM7615NPp8Lbu1mSROZ/e0aHMzuOE/Emv5ZMpLHaahr3+rB4qcwVUUmixWnJe6ImTA8KNPpj8c7S0oG8AnNTQp6qGsgrk66BZfprKSBNZuXH4EtBviwu2RK6mMVuzhugTLlr7uEpOHiHLZF7sLW40qXuvc2Up81/mgkP3cpjJ0oP4iZjJvS9V54vDIqh42Foe4/j6MjkmMw+X09puj+hhvOGLJEYwcsDGGbfwuxoCBHh00L1DtQIX5J+QwtS4UneUNg3Br9fSz5PLxV2NHl+fiHmwqtE96NSN5ENr7O3AkUpxuosvZ8OJSqv8LQsCO+VjOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWZqapq/bqEQn3q6dx14L/FYTw/+dGUkc/Xr0WjU95k=;
 b=YwkuVapqD/5ndEi28gBuj7FQvVAC7cLevk526tId+WpQF2RsLrSJfQerV0BFAo9CnwJm3AFbCu2/gqx//Udozj1rsGpp+2ZiWs+APhtxVAfRZuHKI6DXzgomF3BFrqJIIbd2Kj7+mBgmZVX4hobK02cJoZSUo/c4MS+Ro+HbkCbwupFuLT5IyJ7Yn9HjoJS6Ce+2/r0qH3eqB8wiCD+7luyYU157R9ngQuTZX9/51Fjc53Uogh98p+9KPwPiAFvB4d5OCZnndhkJ0gPr6J8h4/j+wmZ8N/esK3KxJLaXM92zOqXUzUiL1wfhTk1KtVtwTKsnsP0LaQnND4CjQ548qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 14:31:33 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8182.013; Tue, 19 Nov 2024
 14:31:33 +0000
Message-ID: <b712815e-a709-4506-9a6c-9c267ad5367c@intel.com>
Date: Tue, 19 Nov 2024 09:31:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_fault_injection: Ignore expected errors
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241107195959.98509-1-jonathan.cavitt@intel.com>
 <20241108155824.deuiikqqcvog32ms@kamilkon-desk.igk.intel.com>
 <df0baea0-7dd3-414c-81fc-c163a5efe6bb@intel.com>
 <20241115140243.sp72xvmr5nnpkwtc@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241115140243.sp72xvmr5nnpkwtc@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CH0PR11MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: 799b05ad-1fd1-4144-0654-08dd08a6dd64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1VIZlhReXZoSC93c3hCMHNTVDc0V3h0WGJVSitCVWt2K0NSWjVpTzlaN29w?=
 =?utf-8?B?cHFSaXk1UkhsaTk1M1BhMkw1SllmMU13cW5mQWJncjA4ODFPdzZLQm9sTnhz?=
 =?utf-8?B?dGo3LzhGZkh0ejdya0tzeUZYcE5GSGRRcC9iaVZEbzY5UkZBTjJMQzJodktV?=
 =?utf-8?B?aU5ib3NpTFliWVRqSnppUXlYTzZvSWFNd3lEWkFnZnYxQmpJT3JtVkxnMU5p?=
 =?utf-8?B?ZjN3d3V4MUZ0Y0FrQ1NtckV2cmZNZUs1WHdaRWEwamh1U3luSDNwWk4xSCtv?=
 =?utf-8?B?Z3hiK3h6UjlQUkdGK2VVMHE1NFFGd04rM0ExQzdDNXR3K05nUkU3eU5BZTN3?=
 =?utf-8?B?ZVdvOFVzTE1OWnEvbkoxRHRKbHlMUXlDcDluRWZaa3ZRejBjRU9aZmlLWVRE?=
 =?utf-8?B?OUpQT2ljU1VHdVZMVFdsamJVT2hub0NDWkh0RGZiQzFrcjRzK2I3S0NUcFVU?=
 =?utf-8?B?N1RGS2h2WElGL1Z4YWRTNzdYZHVwYkxURmx5Mm14V1N3N2sySGhVMGtPTUdj?=
 =?utf-8?B?QWpMR09BWWM2M3dMYnYyT1dWU0xyamY0WFdkaWJSdHJZWjl4MFNjYXk5eC96?=
 =?utf-8?B?TnJwK0NCZnhWS3hka3JQUVcwWThGbElCaTJ0VFJwSFZiTU5tQi9ld28vR1hx?=
 =?utf-8?B?b3ozODFuTUZUVjRhRHFEa2Z4Z2ZoaG5LWm1CMVBKdmpLN29tY2hEZlVpK2g4?=
 =?utf-8?B?WE50UXBDQkcrRlgraERiZ2tSM3dFOTArZVV2VWp3czU1SWl5WjFPNUJEMExL?=
 =?utf-8?B?UjRVbjRZYkpPdGNJUnVncXVDNG9LQlExZjJIWmtFTEtQUm5renY5dGtGSXlS?=
 =?utf-8?B?NklzVmJ2U2RUbkJ6aGRxSXRpVEJFdW9Hb0tKejVVZW9YYmkvMXd5Zk1kZGp6?=
 =?utf-8?B?K01neFFzN2dFeUwrcXB6SlBhQ042b2Z2UUt6L2NtZWJjdk1uRCtqUDZsUjlX?=
 =?utf-8?B?UHJidkk5RGhWWUZ1dlBoNGhLV01wRWN2MmlaVy8xc2wxQ0ZmTkhNS29NTFJI?=
 =?utf-8?B?L3c5elRCVUlxTmlMSklXbmVXamZlTWV6WlhFcFFUdjZrdnVKSWQ4eTE3TGFm?=
 =?utf-8?B?eUpZRlJrUGRYeENtYjhZeCsvRXluMlQ3a1c1NE1aK3dPZ1FvYldpbjVjTmFD?=
 =?utf-8?B?Q0FTR2dGZTJvandZQVBxWjg5QW1mV2JRb1hZWm5QVmFPK1ErWGp5ZHlySlJ6?=
 =?utf-8?B?OU11cTdUcWRYYkt0VXBabU16RnlSaTEwMmJ1cFJSd1ZFZ0g0b0RIK2xERi9Y?=
 =?utf-8?B?d3pmVU1jUDZvbHQ5WjlVNHpqMkRacUd1L2daU20zd3Vha01OMjYxVGF4RzZK?=
 =?utf-8?B?cWVOeTRENzNpTW54VW9PeFVES0Vnc1pkNGtQemM0dlRKS2tTb3RrK0Q1VkQ4?=
 =?utf-8?B?YjhMbldvQS93MjMyTEh0S0NXaTRKMzAzQlQ0VUZlY21uZDNURy9sWDU0Q2cv?=
 =?utf-8?B?UWNiV1JjZHVHNnpsdmNGYVQxWWhYeUNjY2lyZk5aOUVSTjcrcWlkTFRYRDZn?=
 =?utf-8?B?UG42am5tTGZndG9WOVJBWjNUWVpVcEJaV0JSV3haaDg5U0x4SHEzQXIvSFJw?=
 =?utf-8?B?bVphSkV0amQveU1QdDhQZ25hVFZSa3lmM0UzSnVLbHBUV2Y4R3MzZWlFOXJS?=
 =?utf-8?B?K3JRcysxR1dZRm9kcU11bFlvekErT0taT2c2MXZ5RWNCc1BrM1hZNWljY2VH?=
 =?utf-8?Q?v02C9pMZMmqKg5l/Vmvy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnlQS3RGSUY4ZnJUaXJwZStKY2tRenFsdzRJUG9aNWRoOVRZK0R6dXdlSFk5?=
 =?utf-8?B?MWdLT3hjTkRDWWx2c2xQeWJ2bnlZS2Q2cWNhbEsybThrczJmTXZIblMydFVT?=
 =?utf-8?B?QkdIWFpqSWd0U1VBaERDVU9SV082bGpNcGVkeTk2MEtzWGhzL2haTzdJK1R1?=
 =?utf-8?B?NmI2RnBqWkxDQkxRNS9HR1BUd1hQcEY1NjZhU3FhUWNNU3drOXNLdFNqYWtL?=
 =?utf-8?B?TUtHNXp5QW8wV0FoRkxYSHJFYXVybGhOUDZGaHByN3Y2ZFpyaXNJK3BhNEtU?=
 =?utf-8?B?K01iSVpxLy9DWjVlYXF2QkVxTVNPNVJlTWg4VGtaMlFRdm1iUWIzZjVWdm56?=
 =?utf-8?B?VC8welgyYlpyZFJuaU1ibk9CRVNpU1JZOXk1ZUhuSHBVWHl1MXo3OHBBMWhC?=
 =?utf-8?B?eDh5bG85cE9udHZiT213ckxBRGdkOW5ZL21teFFPeUQ5dUlFQ1lqVEpjV3R1?=
 =?utf-8?B?OGpCcHFmQkhPU01yQnA1bzM3eXNDWC9RZ3h1Z2dQZGdsTU5lQXlkS3VTRDVu?=
 =?utf-8?B?RHhMbUxicFhwN1FLbERGWDZsRGtBdW1nam1wdW5oM2ErY05ITytZak9XT1RF?=
 =?utf-8?B?ejNMSG1DVDQzQmxtMndvSWxiUEd0bjIrS3VRVldabzR2Mys0YjYzTExCYUNX?=
 =?utf-8?B?N0lQT1dKeUtKbUQvRFg5cUJ3Y01FeTlHdlFpcWVTMHR6a0ZlTXM2NXhCZ2s3?=
 =?utf-8?B?T29wWlNwMWRtMDVud0RwM3c5SGJkWitydlFlUnBsdXI0MEFhaGZPNy9lOXAr?=
 =?utf-8?B?dXFSdDdlN3MyZ0syQUsvR0Y1NWhuV0VUb0VuSklwOXRENlVoM0k0UkpHK25y?=
 =?utf-8?B?bnFVZUdiUncwd0tLWEZpTEQ3NmwvRzhDYVBWS3J6VEl6YjhuSFhIb3dsREd4?=
 =?utf-8?B?bnJYVkd4ZlAwRm9lMXR1dGROWHIveU1MVTh2SXltREEyeHowVVFIeGVpVEIy?=
 =?utf-8?B?SzVFdHduNzVJUmlPOG8zcVVUci9NQ3Z1MEdOUWplZ0tSYnB5RGUzNEhOcDNK?=
 =?utf-8?B?aTF6TWlpa1ZJSWpPNEpKVzBVUUl3QXBTamhBVTNyMzNwK0RyWElOdUk2WE1o?=
 =?utf-8?B?SEU0ME53dU5URVpwTUVoUXd0NDBQUHI4MmVncnZqOVBZWDJRU2ltS1pnSU1k?=
 =?utf-8?B?a2o2MTYxMzE4dFhmWXd3S205L2ZGWEpiT0VCeHlsdnhnbzQ2VlNvcjhKVXl6?=
 =?utf-8?B?M3ZKQTJUUnp4S2lCdFFITUJOd3laT1hJdnU5ei9OdFNBd2tQUmV2WlVDSWtr?=
 =?utf-8?B?TEg2a1J1VUFDeW1QR0R0blkvaEQwZFlDYmZzMFUveFkvSDVNTDZHT0hUSTBF?=
 =?utf-8?B?Q3g3dVErV3lvMWlmUjJkdGVMeXpwY1BrU1dZMDdhckJ4SGdTQ05Lc3p4L0dG?=
 =?utf-8?B?Q3lObU96OFh0YTA3Z05XUXgrMGpXQnExaFI3Rm9DMWZNdWRmOVAxenJvOEsy?=
 =?utf-8?B?RUdTRDhPa2ZzcjJBK1N0QjN6TGpFTDJmcDVZSGxyanV6a2o3OS9EVSttWE5y?=
 =?utf-8?B?YzR4L2tNUGd5VDZ2MWY1bE0xbGtwdmxlTWpIQk1td2ZZQ094NXd0YzhkY0NZ?=
 =?utf-8?B?aGhPOUNPcmhKa1hDYmNsVmRlb01zaTRvMHVRQUs3cWwwZ2lqeTBaNnFMaDNj?=
 =?utf-8?B?aEswVHg1MnVnZy8yOTBnNG5hWmFPODVKejZtb09Wbi90OVpHQlNYR3RFY2tl?=
 =?utf-8?B?WUNvU1RRRkhTbGdISWo3UlRXS2k4K1Z4OTZ5dnc4amxFNFB0c2J5cS9vMElM?=
 =?utf-8?B?SzJDcjNSZHpoS0NISVl6Y2Q0VzNQVm90UjVQL3dHNmZXZnlvcHJmMzdXUDQ4?=
 =?utf-8?B?Y1NKa1poUWF1RGxzdGtBeTNab01OeHVvczBGNlBQcjVPc0p2UlJNbFlOMkcr?=
 =?utf-8?B?YmJGSHR2TzNpVGQ3NlI5R2VLMGR0M0RnVTRGa3QvdGZVbStpdU5kNDBxMjl4?=
 =?utf-8?B?WVdNMmpsQ2hmWUNYaVpKNXdaYW5oaDVIRTdheUtVZThnM3hwWjEyelVOcjc5?=
 =?utf-8?B?RFJ1L3pyeXNvZk14RkZHZlVwSGFNZVZnRHRneVh0a3dFUlZwd0ExSE5HOUdY?=
 =?utf-8?B?a0RjMk5MZ2NOTlAweDJ4RytTS2taOGtOblhyZ29taTRRTVhlWEM5bGdBQTQv?=
 =?utf-8?Q?akZbuncvefYeMq77M1LxuQJUg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 799b05ad-1fd1-4144-0654-08dd08a6dd64
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 14:31:33.0946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UNTQ5ycm38UNIKZwxnYNrtpaVgtB7LA8VqaUZn15YMAdn+IYfQIbWmy5nahV/LDFjOuXMwCyqIizpxzhJYnHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
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



On 2024-11-15 9:02 a.m., Kamil Konieczny wrote:
> Hi Dong,,
> On 2024-11-12 at 12:58:55 -0500, Dong, Zhanjun wrote:
>>
>>
>> On 2024-11-08 10:58 a.m., Kamil Konieczny wrote:
>>> Hi Jonathan,
>>> On 2024-11-07 at 19:59:59 +0000, Jonathan Cavitt wrote:
>>>> The following errors can be observed when running the xe_fault_injection
>>>> subtests:
>>>>
>>>> [drm] *ERROR* GT0: GuC init failed with -ENOMEM
>>>> [drm] *ERROR* GT0: Failed to initialize uC (-ENOMEM)
>>>> probe with driver xe failed with error -12
>>>>
>>>> Add these messages to the dmesg ignore regex to the applicable tests
>>>> (specifically, all tests for the last error, and all tests that target
>>>> GuC subsystems for the first two errors).
>>>>
>>>> v2:
>>>> - Fix and merge regex (Kamil)
>>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
>>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> CC: Francois Dugast <francois.dugast@intel.com>
>>>> CC: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> CC: Matthew Brost <matthew.brost@intel.com>
>>>> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> ---
>>>>    tests/intel/xe_fault_injection.c | 25 +++++++++++++++++++++++++
>>>>    1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>>>> index d1c8b25307..8b181808ed 100644
>>>> --- a/tests/intel/xe_fault_injection.c
>>>> +++ b/tests/intel/xe_fault_injection.c
>>>> @@ -30,6 +30,30 @@ enum injection_list_action {
>>>>    	INJECTION_LIST_REMOVE,
>>>>    };
>>>> +static bool function_is_part_of_guc(char function_name[])
>>>> +{
>>>> +	return strstr(function_name, "_guc_") != NULL ||
>>>> +	       strstr(function_name, "_uc_") != NULL ||
>>>> +	       strstr(function_name, "_wopcm_") != NULL;
>>>> +}
>>>> +
>>>> +static void ignore_faults_in_dmesg(char function_name[])
>>>> +{
>>>> +	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
>>>> +	char regex[1024] = "probe with driver xe failed with error -12";
>>>> +
>>>> +	/*
>>>> +	 * If GuC module fault is injected, GuC is expected to fail,
>>>> +	 * so also ignore GuC init failures in igt_runner.
>>>> +	 */
>>>> +	if (function_is_part_of_guc(function_name)) {
>>>> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>>>> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
>> I see "." matches left parenthesis, why don't have another "." match for
>> right parenthesis? I mean it looks strange when compare regex string:
>>     "GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM"
>> vs
>>                "GT0: Failed to initialize uC (-ENOMEM)"
> 
> Because using '(' in regex is tricky, also if we ignore last char
> we could as well improve regex and just do not require it.
I see, my first impression is a missing character, as long as not the 
case, I'm OK.

Regards,
Zhanjun Dong

> 
> Regards,
> Kamil
> 
>>
>> Regards,
>> Zhanjun Dong
>>>
>>> This could be one call to strcat, but it is not a blocker.
>>>
>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>
>>>> +	}
>>>> +
>>>> +	igt_emit_ignore_dmesg_regex(regex);
>>>> +}
>>>> +
>>>>    /*
>>>>     * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
>>>>     */
>>>> @@ -175,6 +199,7 @@ igt_main
>>>>    			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
>>>>    				strcpy(function_name, line);
>>>>    				function_name[pmatch[1].rm_eo - 1] = '\0';
>>>> +				ignore_faults_in_dmesg(function_name);
>>>>    				igt_dynamic_f("function-%s", function_name)
>>>>    					inject_fault_try_bind(fd, pci_slot, function_name);
>>>>    			}
>>>> -- 
>>>> 2.43.0
>>>>
>>

