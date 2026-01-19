Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A595DCA5FFF
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 07:43:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB6710E158;
	Mon, 19 Jan 2026 07:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6Kh2PDQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6710E158
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768808592; x=1800344592;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O7tbUdIlz0HdDXKsvlkynj8bd4Rt5vmbD0YM1DHR244=;
 b=E6Kh2PDQczxyAr+yW+Hg/Dt62TzdgWMK4M0alwbkJGy5bOqQH5/DT9d2
 i/d4upE321YOFEFb69xxERx2U2NQz2I8QMlif+ZHIjyloLu82Ly+E1rPp
 lRr2pA+zmL66wJ7kKgDHK31zwiyo4+pZUVraPrtNURzbx3Z5BYXe0WMOz
 6mOD//qzlDkzT2vRv9JfpO52nweKKBxAhLhCz9ZUZE60V2jWRRRDfXfL2
 aNmMzGgHXeKawglB/6CndDqZIrUKib/1vKkv3wZml4UQPKQ+LVECmjZxj
 ooqWlx700EXhnIlEgC1B9iKaaJrem0dri7x+3zREaISbTXZaV2AL3kqkx Q==;
X-CSE-ConnectionGUID: agsaarj3ROOvYUbtWkTDAQ==
X-CSE-MsgGUID: ogNF2zijRs2Eppivat2Rgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="72605119"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="72605119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 23:43:12 -0800
X-CSE-ConnectionGUID: fgzJBGozSimPiANGbKnFBQ==
X-CSE-MsgGUID: ZV/l4Yu2T+OM2knNH9MYlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="206055158"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 23:43:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 23:43:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 23:43:11 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 23:43:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Favx5Y6OeoURFxq1Be9bASL3ClKcyup6/c/iT+RWxFU1K6OpY0soRMkpcqLoCoOQBNFLpAS4cQwgmuSq3GYP77sTXkVJLE+v8IzzuJJ8bAAA+uORTyr5fB8zGpfenyt6Y5Z19baEc6d6MMsbN9FuLFvvYCIMtX5nsYfp86FHu37uxpDHRT1mK/QUHf99e4wCpUC0FXQUABuphXSekcquUpOmCENf97C/uJ/vaUgb+ixS08Fi0DZ7uiLw2wBlHV/9fyrZf7hVqzJykjgS8c0lXV9m319Ew0vlmBJmAUb4+2gpvnJTXhfDmRvGWWE3ppvUwkRRWjzSehlQYem+Fmm5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSA53UXIumkwfZc0xur1na9JHVhcaHNxN2vY/e6hSP8=;
 b=BFzwtSIZJH1tEaDXnPC0t0PiCi+ruzpfuI2zQKle/wx0nJAa4uURh2LVpj9ZTKno1iLodIFDSY4RqtBMy4DeMaP7QvyUR2RQd8E3FwUMHbJpptev6F8tqH/8wZLonU0QT4X7X9HEqVEDriqlQiI7XYKwYBEOr/87MmAsIYoZRMHYWBWXgn/81Fl5ib5rxgXeeZnA+1bKUCKy127FsfjjV93jFqlwXuHSDHDVLdq9zVVttGJKmpK1MvpxJOM0gPZ3/1w8EfSC7hW1hUoWV7x3ccIwN6CaKIPcyID5LwhiOD5qisjbl9Y9FjK95ZJrGc6TPsSibB+55OjQwdWYwvy2Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ2PR11MB7428.namprd11.prod.outlook.com (2603:10b6:a03:4cf::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 07:43:04 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 07:43:03 +0000
Message-ID: <ddf04df0-945c-4af1-b03a-0408410f30eb@intel.com>
Date: Sun, 18 Jan 2026 23:43:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
To: Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ravi Kumar V
 <ravi.kumar.vodapalli@intel.com>
References: <20260112191732.672297-1-x.wang@intel.com>
 <20260112191732.672297-2-x.wang@intel.com>
 <viv6pwhicr6jjm5d4hoznn7w4h7ixamqdwalpx3eb3aoc5fgbr@2rrcrdhe7rsn>
 <20260116213358.GJ458797@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260116213358.GJ458797@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0186.namprd05.prod.outlook.com
 (2603:10b6:a03:330::11) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ2PR11MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: e848f879-f58a-4f2d-fc71-08de572e60c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|42112799006|1800799024|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHZTcnlNUUNhU0NQQzhZV2hIaVVmdVBIT1ZhQ0ZJVnN5M0Y5RlpFVmptdjFS?=
 =?utf-8?B?aVdmV2MwWHVidmZlWitsbHFYbjNpY2RSZ3pYU1RRUWYzMjEza005ejkvU2lU?=
 =?utf-8?B?S0VGa0J1d2kreklEenFuTGcrdTRqNzM2Q3hZR2NlODF1WHRLcUx6N1lSbGYy?=
 =?utf-8?B?aGlQb2VHSk1zRmpRUmMrS0lLNlc3SzBKTm5mWW5NNy8vYUo5WlBKbjdDSmUw?=
 =?utf-8?B?YktCa1RwRGxhMXBXaWxoVzBBNlVHMGM3T2RYVmUwYjRhZWtqUmtOYWxPQm85?=
 =?utf-8?B?akNCMHBlUFBDZDB0dWNxNjQrWFdkSzJrVHVPMGp2RC9HK05wOWNDTWt4Vk02?=
 =?utf-8?B?cFh2SWhEUTV4NGdJS0QwbWZuQWtYNWl5VmxHUTd6K1RsVnNuQ3E0TWNTQnRM?=
 =?utf-8?B?QkxuRlRySXVaYXZLRkR3Y21LMmVycGRGWkdTd01EdFN2M3p1SUVxdzhzVVF6?=
 =?utf-8?B?cy9mcUVoeEd6blVITDA4VUR3MWVZT0pBVGtxN0owUkJ2TU9SZmRoMlVQSzVL?=
 =?utf-8?B?bkNja0ZDc09kZ3pycjVKeGduNkcwekF3THdZayt3THUxM2hURFVDUFR0cStM?=
 =?utf-8?B?emxlWi8yZ2lUVE5Kb1hIYVVONnM1YWVhWURrZzEvYnowOWc5bDZyK0ZiTFVK?=
 =?utf-8?B?TGNKU2JxM3gxRjFJd0NHTlZqMUlrRDB3NDNieXRsKy8xcXNWNUhkN04zbmwv?=
 =?utf-8?B?cHdwQmpqOVdlQ1BvWXpHWFNFaXowUGJ2YnJ3ZXhyaHFwZWJlVlFhaUdDRlg4?=
 =?utf-8?B?dE5QaHo4aUpvQUhlcWl2QWcwNG1kWmNaTHpBUlo4RWhTbExVRmoxMUdYeHgw?=
 =?utf-8?B?S1RWVDMrZDJOanFzSVFzL3h6OTgzNnY1Mnh5czRIbkVGNkU0blVGcTc0UU04?=
 =?utf-8?B?b3RjT1FBWGR2OGxraXVXcm85aTB0VXhHbzdNYWlBd0lWbkt4amhmTDExdmVa?=
 =?utf-8?B?cGJvTStrcWJLMHhKK2dmRUdKUTdCSWZzOFROV3dERlJBQmFzSDg1cjFaaWtQ?=
 =?utf-8?B?ZnZ4OU81Z1BOMmV4QmpFaklDelNNNmJxekRHTzE4ZVpwbjRQWm4xNENBU0ti?=
 =?utf-8?B?MUtlZ1pVOWZoVkg1anVwTE1XRzVoT01KSVBQZ1Irak9QVW5sZ1Z4QyszMG0z?=
 =?utf-8?B?Z1EvQ0ZmeTlEOTdHME1Oemk4a2ZITkVLbkloU3Z6eENoQm9xT001QXNwemFK?=
 =?utf-8?B?Wm5hNm95T2llSDVVU2dWUGVldzZSVHJLcDh2SHRPbEtsdkRJTFJ0VDI2YjNy?=
 =?utf-8?B?TEVPTVZDbzVWaEl3RFFyWUYvUGZyVjdiNDNDYU1lS1VIcDZxUlg5VHozM3J1?=
 =?utf-8?B?WDFXRUVIZW5mSWgyY1U5cVRIYlM5WUJiQ3Nqa0ZJNldlUzZjbFZRN2E0Tkha?=
 =?utf-8?B?ZWd2N3NFVjVMQWxqWk12OTZEOGtSZFA5TlBUTjBNT2VnMjdHYVdURkN6angz?=
 =?utf-8?B?eHI5K1lTQ0VzMlJUTUxSTW1JRWRMZ1ZUN0tlOGYrUWZKL0dGVnkrWGR3SlpH?=
 =?utf-8?B?UWh3eUdZZnh2ZlZhSy9xMmt6Z2NPYjB0VXRlTGIrQS9kaHVrbEk1S05aTHNm?=
 =?utf-8?B?THNGc2lPemt2dnN0ajB0TDNJTG5XR0hDT2IwbXVYOEdWMTgxS3o1TE5oay8v?=
 =?utf-8?B?dkpuUGd5V1FlTTNSRFZwZkx1TjlZSnhUOWd5VkdNVkdzMUg0L0ljQlNiZDJJ?=
 =?utf-8?B?Wkd6YXlnZHJhZjJMSkdUaXVCcElGZ3FQTUpYOVQ5RlRVZHdJUTBHVFA2V3hV?=
 =?utf-8?B?bExoN1V5TVFnTU1weGswOWk3R2RkNzFrWXJkOG5Kdk56QVpwWGxIb3p4am4r?=
 =?utf-8?B?OTI3UE9BZzZnQ1JqYTZmaDFhejluOVI2YjZYSWVwOWJ3ZVpXRllLRElrMFk4?=
 =?utf-8?B?SjNjcTBIL1dvNmowN25pTFNuWEl1TkNHWURNdXRraXV1MTVJY3ZhNmlVMG1i?=
 =?utf-8?B?OGZkanZIYlpMaWlQOUY4akRydnB3UGpuU1I2eUVEQ1d2eWxHMnZmbnBpY1Qr?=
 =?utf-8?B?d3lBSkdZYmcvVGpXTzBYZk1ZODBNQU82ZlJSYWlScVErY244TWNmb1lGK21j?=
 =?utf-8?Q?lL7qUb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(42112799006)(1800799024)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aC9meVRHempQbit2Q1BkcEwvRkh3SnY2WFh4QmxiQks3bThvSlM1eVVCU3lL?=
 =?utf-8?B?bFhoMTdoNytIOCsvaXFrNFlKMUFzUittNGNzV0QvR3JEZ1JqQWJYSmVEWW5M?=
 =?utf-8?B?cHQ4YUl6N3RDTFI3WlQ1K3lFV3ZlS2pJbm5YK0ZyU1dRaWdQSXRBVm9qdUFu?=
 =?utf-8?B?NEQvb2MxOEJOa1dOdFRtL1U1NEpmK0RvdU5id2J6N1NSV01Rbk1BaGR6V1N4?=
 =?utf-8?B?RlhETi9aMWwrOXJZMVhGdjVrS2UyY2ZDQ1J6MFduODZqcmErQWpnWit1YWRw?=
 =?utf-8?B?bkZ5cHh4eTB6UGNXdks1KzlIM2psT3loZXZHR0VYMlNZeE5UMnI0Z1NnU1hV?=
 =?utf-8?B?QytDS2txVXQ5Y1Fla2lnWGRBeXM2VFZNNUpkQnJmaEV4cVJFaFpQbXVuY3dE?=
 =?utf-8?B?TVB4ZlJ6UGl4c1A4eHBMMTNNNkl3WVduTVRuZGF6ejNnV012dXBNNnpHbFZy?=
 =?utf-8?B?UmVCN2MwTWM3MTNUWTFaQkY3cXVPYXUyaEpTTXA3dXhmUVVjQUpMVVlJVmRV?=
 =?utf-8?B?T1dDdTM5NEQrZmNZVGhwbnYyYWx0UmxMVUtjQzBjZUlpQTZZbXNpK285dXBt?=
 =?utf-8?B?bG5vT0Q5THdFMnEvVlJBQVl0ZkRyTjJzYXdzZ2MzelA4cytkZkNYR2xYWU9q?=
 =?utf-8?B?T3VPanpwbDdQYUd5VUp0Y0ZnbkdvOEtnRmZLUDJ5R2lPOXJvNmpBN01EN2tE?=
 =?utf-8?B?cXVpam5xT3k2M01sdThKWENjNnl0L0NrQ0xwb1R6VGNBbWFpM0NkUU5TLzNR?=
 =?utf-8?B?WmJFM0E4bHhYOGJVZitvQ1lDRUc5VUdaTzJOekxUdDZVRmVLVDhEcXlhQUdh?=
 =?utf-8?B?eEVPWExCZ3Z0TGwwUlJrNk5KNUVMNGh0SGRqN3c2ZjhLa0VsUnpOUlJFbmdU?=
 =?utf-8?B?c2NkOStldk1VcUZMSUZCaE5uaXFreitza2p1MFNmY3NRYU1HUXV5eWxsMFYr?=
 =?utf-8?B?b3FXYnlzbk04MVgrOSt1NmNic21lUVp5R0prZ2RwdTdUL2dGaHluNzBlVzZk?=
 =?utf-8?B?Z3RIL3R2YTY4NWkrcDBXemtFMnp1ZTBxU2VsYTgvaVBOREdCWnM2dXMxSDFG?=
 =?utf-8?B?eHlRVFhFc0xSN1p1NC9DSFdva1VxankweWhsdktJZnowSjNzeUpTRUxlc0ls?=
 =?utf-8?B?cGZpdWFEZlFPQWdCbGgzK1paRHFibE5BWFV1Sy9pZ3E4YmhHNFpick9YMnhM?=
 =?utf-8?B?Q1NqQUtlczY0YXJ0R1kxYnZYTVJTK1N2MCtyREVuVlBsSnpJR3pjUTFlV1Yz?=
 =?utf-8?B?Vm9nTnZpR2hoTWRzaS9mOTNpMUlHT20wMHFmUGxzSHVNK3VsOUc1Rk9RMkFx?=
 =?utf-8?B?a0g2UmRndEFFZG1YTkJsaVBwTWxBOGh6dFl0L29CczI4RVFoS2Q0aW13Q3pI?=
 =?utf-8?B?VGdyYmpVZEhsZ1QwSjNTc1QyelVnSExFR1ZsSkhGMzlvSFh3bE1xcEJ2RVJV?=
 =?utf-8?B?SFJ0NmcwTlZ1azhpQklLK1p5N3EyL1M3S3N0TDMxaXZRTlA1MldwYWZOZWlJ?=
 =?utf-8?B?bUtLYi9tdER2L2JGODkrYmRqUWVJUGJPb1BSMStEb1U3VlhOYmIzSm9vYzM5?=
 =?utf-8?B?cmFEcXJKNmQyNVJvWGh6MUpkY3hUaHgyVE5uanFqSkJpcE00WVNHaHlnK1hU?=
 =?utf-8?B?N0Jwa0xNdHVRQmg3TXJjYlVNTHVmUkVkakxHMm1KVUR5RmxEU1hNTXBQVUk1?=
 =?utf-8?B?LzNoeERITjZTaDNoQzZSVXlBWElyZGxLQjFhdVhEVUp3WVVYamlSY2Q3RkVK?=
 =?utf-8?B?NUt0RE55cjAzWTg1b2xBWHNTQS8xcTlCcFc2ZGpVa2VlTTUzQzlmOVVxb2pG?=
 =?utf-8?B?T1ZPN1FpSkZ0SlpuQXkzaGs4dGZhL0JtVCtxMi80eGxsYkRyTjlPenFudGw2?=
 =?utf-8?B?RmxkM3BETUpQdUgvbndEdU5rL3djVlUxeGlRMmM3eFNrZUg5a1RWRVEzcW01?=
 =?utf-8?B?THdwZm95SHk0a1ppcFB1YllXam9VZ1ZqUnJTNFMxaWFqbjhxS1pneWRIRUsr?=
 =?utf-8?B?N1JOWWU4Z04yTHh6S2RPOGx4Y25iWThEY2orelcxSk5RMXRDU0p4ZWZ3ZTQ5?=
 =?utf-8?B?ZFprM3RmRng3d2VpVVN0OHJDaFhHRlREb0RWQjVpMWlObG5DSkFrMWdvQ1gy?=
 =?utf-8?B?ZXRuMW5hTzFxdllUQUNVWVVobjc1MGRZZWs4bkFVTEJVOW9QWkFHNExxRldZ?=
 =?utf-8?B?bWtUeHlUSDF4aEx0Zy9XQjRhS1FFQVgwOHJHd0x0UzVtUGswY0k0WFZUYWhR?=
 =?utf-8?B?eWVTMFBseVNjTERpM055SytWeGthUHNOa01XMm9sazRvRXNiM1lZWWR3NEs5?=
 =?utf-8?B?RzYwT3BybGtQQ3IvelNRZ0x4akV5Q1F6d3BvOUE2WUZqcDZUV093dnFzNTRj?=
 =?utf-8?Q?yf9RPiFoBQNECgror9NyV2c4fO6TUcol5xAcyvPU74OJ6?=
X-MS-Exchange-AntiSpam-MessageData-1: bR1ZKNPpXcaf5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e848f879-f58a-4f2d-fc71-08de572e60c0
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 07:43:03.8293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FO1oNWtrIDVOZ0mAbNRm6rySQT7lmkWC8hm3hJz+T1isCVGTF7x+QjBdkO0WvcfyGHf4XOW+za1QWBQSuJRp2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7428
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



On 1/16/2026 13:33, Matt Roper wrote:
> On Thu, Jan 15, 2026 at 09:00:53AM +0100, Zbigniew Kempczyński wrote:
>> On Mon, Jan 12, 2026 at 07:17:31PM +0000, Xin Wang wrote:
>>> This allows IGT to query the exact IP version for xe platforms.
>>>
>>> Key changes:
>>> - Add xe_device_ipver field to xe_device structure
>>> - set the graphics versions based on the GMD_ID
>>> - Cache device ipver in global map indexed by devid for efficient lookup
>>> - Implement xe_ipver_cache_lookup() to retrieve cached ipver by devid
>>> - Clean up cached device ipver when xe_device is released
>>>
>>> V2:
>>> - add new struct xe_device_ipver to hold the ipver info
>>> - separate cache map to eliminate collision (Roper, Matthew D)
>>> - changed function name to xe_ipver_cache_lookup() to avoid
>>>    confusion (Roper, Matthew D)
>>>
>>> V3:
>>> - optimize the coding style. (Summers, Stuart)
>>>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Signed-off-by: Xin Wang <x.wang@intel.com>
>>> Reviewed-by: Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
>>> ---
>>>   lib/intel_chipset.h |  6 +++++
>>>   lib/xe/xe_query.c   | 54 ++++++++++++++++++++++++++++++++++++++++++++-
>>>   lib/xe/xe_query.h   |  4 ++++
>>>   3 files changed, 63 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>>> index cc2225110..424811f7c 100644
>>> --- a/lib/intel_chipset.h
>>> +++ b/lib/intel_chipset.h
>>> @@ -100,6 +100,12 @@ struct intel_device_info {
>>>   	const char *codename;
>>>   };
>>>   
>>> +struct xe_device_ipver {
>>> +	uint32_t devid;
>>> +	uint16_t graphics_ver;
>>> +	uint16_t graphics_rel;
>>> +};
>>> +
>>>   const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
>>>   
>>>   const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
>>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>>> index 981d76948..823a29f2d 100644
>>> --- a/lib/xe/xe_query.c
>>> +++ b/lib/xe/xe_query.c
>>> @@ -210,6 +210,22 @@ static struct xe_device_cache {
>>>   	struct igt_map *map;
>>>   } cache;
>>>   
>>> +static struct xe_ipver_cache {
>>> +	pthread_mutex_t mutex;
>>> +	struct igt_map *map;
>>> +} xe_ipver;
>>> +
>>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
>>> +{
>>> +	struct xe_device_ipver *ipver;
>>> +
>>> +	pthread_mutex_lock(&xe_ipver.mutex);
>>> +	ipver = igt_map_search(xe_ipver.map, &devid);
>>> +	pthread_mutex_unlock(&xe_ipver.mutex);
>>> +
>>> +	return ipver;
>>> +}
>>> +
>> Please forgive me for sharing my thoughts only now.
>>
>> I wondered about this a bit and according to current code shape
>> I don't like this design - especially ip_ver cache in xe_query.
>> I mean I don't like to use external cache which might or might not
>> be filled at time of calling intel_get_device_info().
>>
>> At the moment I see following options:
>>
>> 1. Provide update function intel_device_info_update(devid, ver, rel)
>>     allowing to update rel field during xe_device_get(). This still
>>     keeps intel_device_info.c independent but rel field might be
>>     incorrect. BTW I would set it in static definition to -1 (max
>>     unsigned) to catch it is not set/updated properly during
>>     intel_get_device_info().
>>
>> 2. Add new function intel_get_device_info_by_fd() which will support
>>     passing fd instead devid and migrate code to use it. Most of our code
>>     uses fd to acquire device id before calling intel_get_device_info()
>>     [exception is igt_device_scan which uses pci devid directly]. This
>>     will break intel_device_info.c independency because we start calling
>>     driver functions, but maybe it is time to do this (GMD_ID).
>>
>>     Digression: It seems when INTEL_DEVID_OVERRIDE won't work properly
>>     but I wouldn't care about it for now.
>>
>> 3. Mix 1 and 2 but build hash map from intel_device_match[] in the
>>     constructor and update it during xe_device_get(). Pros of this
>>     is we could stop using 'static __thread' for caching last info.
> The problem is that "graphics version" and "media version" are not
> supposed to be a characteristic of a general device type anymore.  An
> individual device will have some version number, but another device of
> the same "type" with the same PCI ID can can potentially have a
> different IP version.  We've been lucky enough so far to still have
> unique PCI IDs for cases where the version numbers are different (at
> least for production parts), but this is not something that we're
> supposed to be relying on since the IP disaggregation happened around
> the MTL timeframe.  Personally I think that hacks that keep treating
> versions as something associated with a device type are just making the
> problem harder to untangle.
>
> For a proper solution, I think we really need to separate the concept of
> "traits associated with a type of device" (which is the stuff we have in
> the device info structure which can be accurately looked up by PCI ID)
> from "IP version associated with a specific device instance" (which on
> modern platforms can only be accurately looked up in the context of a
> specific device handle such as a FD).
>
> So aside from a few special cases, we want IGT to stop translating PCI
> IDs into version numbers and instead start translating fd's into version
> numbers.  The special case exceptions I can think of that don't really
> have a way to do fd-based lookups are:
>
>   * tools/tests that bypass the driver entirely (possibly running without
>     the driver loaded) and just use libpciaccess for direct BAR access.
>     Most of these either don't have version-based conditions or only have
>     version conditions matching against very old platforms (where a
>     PCIID-based lookup is "safe")
>
>   * the old i915-era error dump decoder tool just reads its information
>     (including PCI ID) from a dump file on disk.  The tool might be
>     executed on a completely different machine from where the dump was
>     originally captured.  I don't think this tool has been updated since
>     gen8 (everyone switched over to using the Mesa tool instead), and I
>     don't think it would function at all on any of our modern platforms.
>     So if this tool is still useful at all, it would only be on ancient
>     i915 platforms where a PCIID-based lookup is "safe."
>
>
> The solution I suggested during an earlier review of this series was:
>
>   * Create separate "version from PCI ID" APIs that can be used in the
>     few special cases listed above, and migrate those uses over.
>
>   * Change the signature of intel_gen / intel_graphics_ver to take an FD
>     rather than a PCI ID; when running on Xe this would do the lookup via
>     the query ioctl to get an accurate value.
>
>   * Update intel_gen / intel_graphics_ver:
>       - If running on i915, fall back to the device_info lookup that
>         we've always used.  That's safe for all i915 platforms except
>         MTL/ARL, and we were lucky enough that they never created any
>         production MTL/ARL platforms where a single PCI ID had different
>         possible versions, so it winds up being safe there too.
>
>      - If running on Xe, use the query ioctl to obtain the version
>        number.  This will return the proper value for all platforms
>        officially supported by Xe (i.e., Xe2 and later).  It will return
>        0 on pre-MTL platforms (which aren't officially supported), but in
>        that case IGT can fall back to the i915 approach above.
>
> I did a mockup of the first two parts several months ago:
>
>    https://github.com/mattrope/intel-gpu-tools/commits/forupstream/version_query/
>
> Since the function interface is changing, it's a lot of churn, but most
> of it can be auto-converted quickly via Coccinelle.
>
>
> Matt

I created 2 series:

fd-based API:
https://patchwork.freedesktop.org/series/160271/

inject the graphics ver from xe_device_get(), keep the API unchanged
https://patchwork.freedesktop.org/series/160239/

>> --
>> Zbigniew
>>
>>>   static struct xe_device *find_in_cache_unlocked(int fd)
>>>   {
>>>   	return igt_map_search(cache.map, &fd);
>>> @@ -270,6 +286,24 @@ struct xe_device *xe_device_get(int fd)
>>>   	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>>>   		xe_dev->gt_mask |= (1ull << xe_dev->gt_list->gt_list[gt].gt_id);
>>>   
>>> +	/*
>>> +	 * Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
>>> +	 * We should use the hardcoded value for the non-GMD_ID platforms (ip_ver_major == 0)
>>> +	 */
>>> +	xe_dev->ipver.devid = 0;
>>> +	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++) {
>>> +		if (xe_dev->gt_list->gt_list[gt].type == DRM_XE_QUERY_GT_TYPE_MAIN &&
>>> +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
>>> +			igt_debug("Setting graphics_ver to %u and graphics_rel to %u\n",
>>> +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
>>> +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
>>> +			xe_dev->ipver.graphics_ver = xe_dev->gt_list->gt_list[gt].ip_ver_major;
>>> +			xe_dev->ipver.graphics_rel = xe_dev->gt_list->gt_list[gt].ip_ver_minor;
>>> +			xe_dev->ipver.devid = xe_dev->dev_id;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>>   	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
>>>   	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
>>>   		xe_dev->tile_mask |= (1ull << xe_dev->gt_list->gt_list[gt].tile_id);
>>> @@ -304,6 +338,11 @@ struct xe_device *xe_device_get(int fd)
>>>   	prev = find_in_cache_unlocked(fd);
>>>   	if (!prev) {
>>>   		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
>>> +		if (xe_dev->ipver.devid) {
>>> +			pthread_mutex_lock(&xe_ipver.mutex);
>>> +			igt_map_insert(xe_ipver.map, &xe_dev->ipver.devid, &xe_dev->ipver);
>>> +			pthread_mutex_unlock(&xe_ipver.mutex);
>>> +		}
>>>   	} else {
>>>   		xe_device_free(xe_dev);
>>>   		xe_dev = prev;
>>> @@ -315,7 +354,15 @@ struct xe_device *xe_device_get(int fd)
>>>   
>>>   static void delete_in_cache(struct igt_map_entry *entry)
>>>   {
>>> -	xe_device_free((struct xe_device *)entry->data);
>>> +	struct xe_device *xe_dev = (struct xe_device *)entry->data;
>>> +
>>> +	if (xe_dev->ipver.devid) {
>>> +		pthread_mutex_lock(&xe_ipver.mutex);
>>> +		igt_map_remove(xe_ipver.map, &xe_dev->ipver.devid, NULL);
>>> +		pthread_mutex_unlock(&xe_ipver.mutex);
>>> +	}
>>> +
>>> +	xe_device_free(xe_dev);
>>>   }
>>>   
>>>   /**
>>> @@ -365,13 +412,18 @@ static void xe_device_destroy_cache(void)
>>>   	pthread_mutex_lock(&cache.cache_mutex);
>>>   	igt_map_destroy(cache.map, delete_in_cache);
>>>   	pthread_mutex_unlock(&cache.cache_mutex);
>>> +	pthread_mutex_lock(&xe_ipver.mutex);
>>> +	igt_map_destroy(xe_ipver.map, NULL);
>>> +	pthread_mutex_unlock(&xe_ipver.mutex);
>>>   }
>>>   
>>>   static void xe_device_cache_init(void)
>>>   {
>>>   	pthread_mutex_init(&cache.cache_mutex, NULL);
>>> +	pthread_mutex_init(&xe_ipver.mutex, NULL);
>>>   	xe_device_destroy_cache();
>>>   	cache.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
>>> +	xe_ipver.map = igt_map_create(igt_map_hash_32, igt_map_equal_32);
>>>   }
>>>   
>>>   #define xe_dev_FN(_NAME, _FIELD, _TYPE) \
>>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>>> index d7a9f95f9..19690cff3 100644
>>> --- a/lib/xe/xe_query.h
>>> +++ b/lib/xe/xe_query.h
>>> @@ -74,6 +74,9 @@ struct xe_device {
>>>   
>>>   	/** @dev_id: Device id of xe device */
>>>   	uint16_t dev_id;
>>> +
>>> +	/** @ipver: Device ip version */
>>> +	struct xe_device_ipver ipver;
>>>   };
>>>   
>>>   #define xe_for_each_engine(__fd, __hwe) \
>>> @@ -181,6 +184,7 @@ static inline void *xe_query_device(int fd, uint32_t type, uint32_t *size)
>>>   }
>>>   
>>>   struct xe_device *xe_device_get(int fd);
>>> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid);
>>>   void xe_device_put(int fd);
>>>   
>>>   int xe_query_eu_count(int fd, int gt);
>>> -- 
>>> 2.43.0
>>>

