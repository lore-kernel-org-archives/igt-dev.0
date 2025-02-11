Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F5DC021A4
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 09:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBED710E453;
	Tue, 11 Feb 2025 09:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KX2MdCV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF2C10E453
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739267638; x=1770803638;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gPKkO18ekH0Nqwwnw+LTP/VBpPtN/aq3osRtnf/c4rM=;
 b=KX2MdCV9bSK93mKLH2gMZhdcXEqdabjctIuVlSsbWFhSF9rSSTS5nBdf
 tetIRWVaX1hzUpKZ8zqGlfcDmJhx/PeVApGAgvn2DHNXXEHBLsmA3vSp9
 DM47XcXHhMDyYfVGd+f+s2dZe9XyoJton/2m/6uMqPUeuIaitkyY27pRy
 jYlbcjhlGWjv3j1TY31KV0AJPwR3i7IPO5nnwkLyC1z6E2n/nGviqWe/J
 HP5MYByCK9xclb4Jwe/BVIdXjwPRTZjty8O3PuNYCmR3uPsp6+angTujn
 j2Wy7omIlryClXqVlrdb1f3stoiSt1z5tFvQBka43TQ5mx5iv3aM+Jay/ g==;
X-CSE-ConnectionGUID: Dh4VUiQdRy+jg3UrlAJSZA==
X-CSE-MsgGUID: wIAYgDLMTQWaqdZdjDpZPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39898246"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="39898246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:53:58 -0800
X-CSE-ConnectionGUID: MaZHii+lTpm5RmDJD1Yumg==
X-CSE-MsgGUID: su1DbGltTbaM5WduHujMtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112928958"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 01:53:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 01:53:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 01:53:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 01:53:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZs/AKN3cyUrFOtSfGlPEHaMiSSFi1OiqPlJjRGI8G2aHFU+M8TMWH+yYGzZ75PEVz+I4978kwAnEoJ0SU6pDx6uHTIJxbgdiB6ripCgashAsew59zK2qEA1QQIihcW7b+Iy0SO9acYtHOEXfUAcSL2R10J18kDVTyOeaSj90iNW8hO7B39eZZY5Iigp5jM90qBPe7UOMRdMA7slnb9v4MFKPs8g24G8dErEZooXAoWCGgbI1cT/73tqkKB6fewFsxst8cja78oykkZ61/5R1M7jzLuSzZ6BJci34cJrM+PUW9OU/HG4BKquy+BFSUxpGjmQ55V+EhqYnSrvhvHyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1KtPn2N5s4M+tWhiIt5hFgjbPED5ESPIzR0rufBjQM=;
 b=rJWUGDpEI6ypydxPhw1Q5K9xQfM51yRDZ7LEXkLUjJPfiDc5hOS0v2L4aVpT6skMY64Hy2eOge9b4eTIevcGFVRJwQW8pq1py4sbIL7h4dSANDgcnihbGl1n68oKlkl+nnvGpLORXJiAibK9z6E066QVqJ1C+TG4/eYZ3oUFiWuvvXK8PpD7J0VQH8G/SfMG/gdsmIDweumkQn8bmeYqG7JcLbAGk0T6ExzmbgKrWXIjXe8/qsPzbp6wL7D0bfLqu183B7stfBw+QBGXH9psuN9yoQ1ZWXmM1nvP1wLlz/rQKM9hyBbluui6gbZfbvrUcaHZ2m4LViHZLfnbYjDt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH0PR11MB7470.namprd11.prod.outlook.com (2603:10b6:510:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 09:53:54 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 09:53:54 +0000
Message-ID: <2fcee960-d780-4466-abfd-ffb1ac06c71b@intel.com>
Date: Tue, 11 Feb 2025 15:23:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,3/5] lib/igt_kms: add function to set link params
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250203081241.659139-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250203081241.659139-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|PH0PR11MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: f33b6b92-ecc0-4bc6-6eaa-08dd4a81feb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUVPTGdkNUpBVVBaNmY2b2FBY3pvYU5QVXBoWkgrYTZCZ1lnUSt6RTlHUkRj?=
 =?utf-8?B?ZWJDeERZbXBIc3ZUckhwMUxQb3AzRk94S2JzZldzTzEzKzliUExhdEt6ckZT?=
 =?utf-8?B?VHlXbTJFeDdqVW1SUE1Ua0o3QlRCQUJCWVFBMklnL3pMOHY5dlNUVXkxY2Vo?=
 =?utf-8?B?dHF4MWlIT3E0R2JyWUlsSFZVS05WdjNNOWhweklzeERDQWY4Q3FRQnlSTWJu?=
 =?utf-8?B?SFBacWJ0amZsUENQOEQvMkpoUUZNQ2MvS1lwdUFxdmlEdGhOd2M1d09KZ3lt?=
 =?utf-8?B?MTZZS1Azb2wxeE9TdHBYd3ZJOHlDYzVjYmMwZUJuRmd5OWtHSC9qbjhiSnl5?=
 =?utf-8?B?WFdyb092a0plVFZiSjFUUUFTYjhib3M0TUZ3eUlSOG9xaE5Vd1hNUlRyQytR?=
 =?utf-8?B?enZHMkpyaUNsVTdTTG5MNzZwbkFqZkxhTWZkeUlUVTdyNE4xVDBzTjBoYjZP?=
 =?utf-8?B?U3E3QnIxZ2ZFdGlGb0Q2TjdZVGdSRHltYndRMXhtYkx4UXhhODhjeklvdDdv?=
 =?utf-8?B?b3BBWGtoQityWnBSUHF4WnpkSXBuTlloUFRYOHU3OUdadFpnemZEZ0xUVjU2?=
 =?utf-8?B?U0NuWGEyc25LZTU2SE94NlU1MzhocHhvOFNvMWdwSjU2UktqQzUyellQcmRk?=
 =?utf-8?B?alluWjJoYWFSd29CUWtJRlhhSk9jaVh6ME1vK05sTk5JMGIzR2kyY2hqaVJO?=
 =?utf-8?B?T1FSVnlVeEVMODBBaEVnQVRnYW91RzRpLy9Fck15RHVzNHAwWEpYV2pCSktT?=
 =?utf-8?B?R0l6YXh3N1VZdndrTS9QYUgxa29wdmQ0QWlwOWtZOW96dGhCNGVMUTlzZGR3?=
 =?utf-8?B?bzFnZjBHMjNVdXB2SE1ZS29CU3p1T3QxZ1ljb0V6UlE0K3NMNmNja3pjNHZz?=
 =?utf-8?B?MFNyVi9LSEJzQ21VdEszdTMrZ2Z6Q0hYc0lkWUlwY2NTZkJGM21NemNVd3RM?=
 =?utf-8?B?VGhsSmxDWGkyYXQwVXhkcmZGZkE3VDVOV3ZoVHQ5K3hEd3B2QlZNZXRjUW1O?=
 =?utf-8?B?ejZvSStEVkxRK21UQ2F2UVNoY1BWWHd0VVc0VngyeWVPNjhSNEFkU044VFlI?=
 =?utf-8?B?b0pPaWc5YVVrR1Z3SDdtTThYRWpuU1hqVGVpUFlqa2labHhmdEdHREo1eW9S?=
 =?utf-8?B?a1RxYUtaWGYyWERwWGx0NzNVRTBIZVRrdFRzYmpqRWYzcXRnd2RsOERySUlr?=
 =?utf-8?B?c3JJczN2aGQxV0dXWlE2VUhKbFhCcjEySDFCSWtITVl2L0dmQ1cxOTl3UU1i?=
 =?utf-8?B?bXd0MTE2WEMvZExmK3NIYkhEcCttaEl0VWVYOFNwdE8vSWRYS3NTeHpRelQ3?=
 =?utf-8?B?NHBZSVo2ODhHbzZPZXZaNmZLekdXa09DS3JsK1IrQU5CQkd6Nk1nZmplK0xa?=
 =?utf-8?B?emxBUGlrNHQ1OU5TQXBmUndXTi9lQVBLeHdCclVQUmw3NmZzS0NRdzNWM25T?=
 =?utf-8?B?bndhRHVZS01LZEtvMnVpcVhKWWJNT1I0VGxyYWRHU3haMnVKRUNZZXl1b0xr?=
 =?utf-8?B?b2NGNGxEL09MYmZmbmlKaXBRa3N3bS9nYmxFR3lnWkdhUHhxS01JdWd1dHc5?=
 =?utf-8?B?dkx4ZDJzSWZxY2ZSelR4OFVyV2VZeDlwRCtsVllURVpPbmU5SkZqblN0d25G?=
 =?utf-8?B?ak1BNVNMVGQyQy9Gc0NGODlKZkN0NkpEUHhEMG1hNTNHZ1c5and5Yll2SlAy?=
 =?utf-8?B?ZXMvRkFqRVBtUkFqVGhYbG9VWmNLejRyMkxFYUtObXR1bEZKRGFsRjlwWk5z?=
 =?utf-8?B?NU5lUkhCQ2VvREV1Wk1WZ3pwNzV4U05wQzhneDlVMEtQblZndE4reFN2N0lh?=
 =?utf-8?B?L2lqV3daTFZ0VFYvbk5BRUtRY25uSWZtU1VqTEduMWs5VjB2Y2x1Yk9LV1dR?=
 =?utf-8?Q?KlsN94lyPu+Ix?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWtNVHA1NjYra2tKeWdjbmVKR09hTlNPQUhlR3NYanlMVzkvaUNWUVliWHU5?=
 =?utf-8?B?b3NqaEZIZ2wxUzBwV2xwNHNIb2doeU5oeHZKK1VuRFhxT1lKQWpMMnV2NW5R?=
 =?utf-8?B?YVVyQTMwL3hXV01qTEdzQ0lySVNsdWpCZkZ4RVVtSDhKQkcvbVJhZWhZZ2lW?=
 =?utf-8?B?RkluQ1JsZFAwTy9QaXZibjkyY3MxdXNET2FqMnpSQ1d3MzBod2dmQmZ1WEkx?=
 =?utf-8?B?eW5aQ1VZc2U2NlUrdVc2USt6SERwWmJ0WWV1R1NpNzhLS3F6VkttTHJvR3Fo?=
 =?utf-8?B?UXdrejNxb0NERW93bkFseTJ2ZVREdkhCR3NqYVRCY2VYZlV1cDIwSVR1WWNW?=
 =?utf-8?B?RWFqL2VoTFRoam1KQks5c0Mzc1p5TWZwNkZvaXNyOUVRbEZQTk5aQ3VXWCtE?=
 =?utf-8?B?Q1Y2UG1rdUc1RkFpaXEvTk83eTlHeWdWK1ZaVG1rbGVPY0dmekV0d0tQdW1W?=
 =?utf-8?B?SER1VkVQOG84TFRXL2tnL1VzSTdkdm8zSUYyR2dMbXpDckJxWm1tMmRzaU1G?=
 =?utf-8?B?L2RnK2RxL3ZUa3hpS1p6anFNalRvRXBOMWVaQ2N0UkJEVytsN1hpWVRVYVc4?=
 =?utf-8?B?SUI0Q1oxZVBsc2JOSnprTE02UFdHbFNNbnhhYys5VXhaZmlUYmJpK1VTRFly?=
 =?utf-8?B?Q3lnQXVhUnk1T25oVk1UVGpYK1pOaFQva25tdysvMmE0NzdIOXFrMkhieVlu?=
 =?utf-8?B?SU1CVnR1Y3lFYkpPYTlDc3l2bWZtZGtUSitOZTYraTJBSGhLUjl1MDd0YVR5?=
 =?utf-8?B?NXNpaUpONFdBQjUrSW81Q3k5eHMyZEQ3b25EdjJ5c3BZWGo1ODRSUjRCNUI4?=
 =?utf-8?B?WFMzNUFuVTNzRmtaU2Z4dzVnVkgrem4xVFdTeXBMMmc4VzBnSWxXeC92VVRz?=
 =?utf-8?B?Q3dmejJtRS9hNmg2UHF4RjFWWkJzWFZnWXA0bXloQVlBeUQxb1VIOFFsSXBq?=
 =?utf-8?B?dVpackV6Q0NmMUdFbEhvc1B0b1hIajZLamhYTmsranJIMG8xK3AyenBnRUhM?=
 =?utf-8?B?STRpcitjVTBNbGR3VFRZUEhhY3pabnVUZEN6RXNnOUVhL2tOc1VEcEc4bVY2?=
 =?utf-8?B?YW9hOXpBQXBnQ2xwQ3haR1U4WDR1cnhleVB3RHVCb0pEaWthYlhaNXlvM1lv?=
 =?utf-8?B?YXJDV3hCU29WTldDWXo1L2syVFpKWG9TWjZGdTJCVlYvcGRweUc3ZTF6ZHZY?=
 =?utf-8?B?dXpUNXl6WHNwWGtOeFZwbFdWMnRyUmVhb1F4a2hWeGMvSkZFNENqdE1IMVM0?=
 =?utf-8?B?QmJaVlBWWjJuWWZ2VStMbURiaTVnQWdlallpbHMyT2dyZk1RcHIraE1sVTZz?=
 =?utf-8?B?RzNPNVNBSVN4TEdZenhXNW9xMEZSMU5tckNvUGpVVWp0dUFtVkEzUy96dDdQ?=
 =?utf-8?B?dFZySFFyWUtjdnBlYUpKS0VjVzVPUmR2d2lZZ3BHU0g3V1ZJUWViWVdGaE0y?=
 =?utf-8?B?b0xrOW9ZdUxBSjI4Y2NkK3ZiQlFPNzlJOWM2cnVZVzdyTlJjNW5FUGJpQkh5?=
 =?utf-8?B?cjlLam9UenFZeXBNYytBSzJnSkNsNnBZU0xXSUNxQ0VMTDA1K0tNYVViTzBN?=
 =?utf-8?B?Zk1paGdsUnptdE54dUlpSkRzTEJ2WkQrb0xqdkMzU3orU3VveEo0T284UGp6?=
 =?utf-8?B?cFpBdFYrUFNoRUZFOHovVUNWQU1hNzlqVldFWlFqREJxWHZVNDNSN2wvaWwv?=
 =?utf-8?B?aWZMUmZteU5tU2d3UnllZGRhcDl1QjNpQ1A4cm9Mb3BSSXBzNDJ2bEg1am80?=
 =?utf-8?B?TnVJZ3V0aUJIcEJOT2l5dkNqQXpKcENwZndWSXljSDBFL3pSdmN0MWxJQkJL?=
 =?utf-8?B?WS9HSXdqRC9qWmJtaVlXRDRjN1NWMXRLSFZBcXZucThEMjJvMFg2ajY3eUxN?=
 =?utf-8?B?Mk5HbVNDYitWblZFQnJKQVdydGlLZHpXNW4wRmNuUkxrWTNxQm8wWXRXVlhz?=
 =?utf-8?B?NTE4STdMTEVHNzBQZkhVbEFreGJOejdWSWJGS05XcE0rNkd4NWlMb202c24z?=
 =?utf-8?B?eUhTUUZkNk5PQVFoSFdPbkhRYkV0Tms3c0lKNExpdUNZbWFuR3dmSFRiWEhD?=
 =?utf-8?B?Nk5ObnpmYkpUMDBNSTdzRklwM1hweWp1N1kvdDlvb0VRZzBpanJZK3cydmRs?=
 =?utf-8?B?bjBPdEhSNlFQaU5LTnRQTXQ4TTc5RCtlZWJoYi9OY2Z6YUVwS01PYkxWclQy?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f33b6b92-ecc0-4bc6-6eaa-08dd4a81feb1
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:53:54.2474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvK/0ukvBPRKh367Suv0sXuGbFDNXGLbx6NJI+bX0VH2zyttGzloX22fg5XlKUwUeOtDRGyXFoUgUUhucZd9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7470
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

On 03-02-2025 13:42, Kunal Joshi wrote:
> add function to force link rate and lane count
> for given output, install exit handle to set auto
> at exit
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------

>   lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 35 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 90f44b4d3..424056252 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7190,6 +7190,39 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
>   	drmModeFreeConnector(temp);
>   }
>   
> +/**
> + * igt_set_link_params:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * set link rate and lane count to given value, also installs exit handler
> + * to set link rate and lane count to auto on exit
> + */
> +void igt_set_link_params(int drm_fd, igt_output_t *output,
> +			   char *link_rate, char *lane_count)
> +{
> +	bool valid;
> +	drmModeConnector *temp;
> +
> +	valid = true;
> +	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
> +						    "i915_dp_force_link_rate",
> +						    link_rate, "auto", true);
> +	valid = valid && connector_attr_set_debugfs(drm_fd, output->config.connector,
> +						    "i915_dp_force_lane_count",
> +						    lane_count, "auto", true);
> +	igt_assert_f(valid, "Unable to set attr or install exit handler\n");
> +	dump_connector_attrs();
> +	igt_install_exit_handler(reset_connectors_at_exit);
> +
> +	/*
> +	 * To allow callers to always use GetConnectorCurrent we need to force a
> +	 * redetection here.
> +	 */
> +	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
> +	drmModeFreeConnector(temp);
> +}
> +
>   /**
>    * igt_backlight_read:
>    * @result:	Pointer to store the result
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8810123fb..f696847a4 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1268,6 +1268,8 @@ bool igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t *output
>   int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
>   int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
>   void igt_reset_link_params(int drm_fd, igt_output_t *output);
> +void igt_set_link_params(int drm_fd, igt_output_t *output,
> +			   char *link_rate, char *lane_count);
>   int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>   int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>   
