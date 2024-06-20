Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AF5C2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3257A10E870;
	Thu, 20 Jun 2024 23:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJlOSiZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404F810E912
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718927082; x=1750463082;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=La8d6oVtfOej6pu7J69PxZpu1+ggVO42rmHCxVKaylk=;
 b=DJlOSiZdMQyHpTQ1zIx7DLb/fbIgUfCZYBQX1Caf+WhXvJIH5ZedgAjE
 HuYk5UuAdrHz18JQHEwsCqhzk8gRNorUVnSFj8CW9nLOBolhrVe02soOk
 pQUEARhu63zDz9E6+WVzIX2ne3gcUp9wVMFjqdNQpFQTgkLwQ7LSn4gTQ
 2us3T2pk8vHG2PdHwnimYyUCfZLR0gnUcOjqm3jxS+zYdczVDWb+SkaD5
 jaySH67xWxsPQucELkSjggatlvQ4YkLDps9m2ROBhhCVOLBIP7KAaO6dY
 Ij39l6JMTuggZp5GlCxGufvB7nL9wUzlBkdTvMqnwAcshy8GDuIlv6+vN Q==;
X-CSE-ConnectionGUID: u2QcNYs5Tzm0fg+hSP59dQ==
X-CSE-MsgGUID: iofl3xqsQNOlfMhhSsaVUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15771305"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15771305"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:44:42 -0700
X-CSE-ConnectionGUID: iAvBf5w0T3aSLrEeDWirVw==
X-CSE-MsgGUID: CaND6x4lShy+a1Y30YCYmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="65653526"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:44:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:44:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:44:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKGCOLdtVGr+z7VLlQMMcL28KS0aSCWc45aWn7sbUoLD4aJQWbNqOepEN2kgDGKUK3ra9Y7HvAAeYMHH4GDM3Yn6+50IKEiBWXVHOTtQi9H3ne6FxKTKIwesyKGDq2S7dQerJqi0FFncm9Q9GqtGcJDsXXkHBLb/UpIbArLJ46RrKQuV1lff0D5fvpfPpaA+s/xVEkqKcFZJGJxwOtEPI1G+SghUo0E0XrVhLsVYyWK1O32REBBr0A2Bj8ZeEyS09KjyQpHEYs/WNchCJDFvsExJvwYgXpN6KZdZ/xLLdzuosMMeG0yzsUYZEMrBSYrvcaQEso8Hh1Lwb9ifqtieAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GMPR2Bbwbus5kAO5o6h244GKZ+ufybvIgXcZNoopIo=;
 b=i1dGHO3lsODMUCMe6cA15iYLTOcgVDbTxq08zT6LiVY3oW8fLIQPVAhcEyo6OhCihs6UXcyMkksgcZ6mGa1CDGxLB6guDLmvyW4VMcuii1MBnLIVwE7ocBry4YcdCeUHuI815/R+E0Jv4hbc0TnJr0v39M7fz/jfF/otWSaiznvc29IY9CUj0nyoAowuRDVkE6R1wvs/TUMpoY7cmmEl/5zVfa9IFyADE0M8EOw/JRjFHZUkwD20NO6FS/NTQmLoTr6BeICr76KonRQ9srDjTuUI30Xv79DVIZ3NCX3kOgcCk02vhSSwM8akQFIoR+kp/yESGPchONGB2JhyQbyxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Thu, 20 Jun
 2024 23:44:39 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:44:39 +0000
Date: Thu, 20 Jun 2024 16:44:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 27/28] xe/oa/oa-metricset-codegen: Fix
 XE_OA_FORMAT_PEC64u64 offsets
Message-ID: <ZnS+5SejrSWyUnym@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-28-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240620200054.3550653-28-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:303:8e::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: a11964c0-7031-48c9-070b-08dc9182f376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SytTbndWQTdkMHFZQ1dJYmVvaDk3eWZidVBYTnhYejAvMFhXTzl1ODZsdkZJ?=
 =?utf-8?B?V1g2Y1FTaWpYRDY0MEtIVHFoVy95R0ZIZDVQYU1MS1Yrb0F4ZlJmWHZrV1Zs?=
 =?utf-8?B?Q21YT2FWNTdOUU8vaGNTMGM1a0JUL2RGaFIyZVp0REV5MENiZ1k1cVFNbGxM?=
 =?utf-8?B?WGxkaXBqRWxHQk9VR3h6eUR2UW9LYUxrcHVMSXpsWU9hd3Q0SlJzWjZYekxi?=
 =?utf-8?B?Sko1S1VYNlo3ZWh6b1ZmZCt6OGE1YkFpQVpFQnJiMnB2TldiR1V4U0NiOWpY?=
 =?utf-8?B?QWZRQm5jSkk3R0xlSnJTZUYvQVFqNEUwUU1vdzRDOGtVRU9WZG0zdUlSYTFw?=
 =?utf-8?B?RWpqK2drN2JYT2FlT0JnMm5VSXJ3N2pvOUx2ZGVzdzlHZUg1VkFONDViTEhp?=
 =?utf-8?B?ZWxCVUFQK1l5UVNQY0Y0ZndKa2syQmZmNnNOaXBjZkxDNTBNc0dLWlBtYSts?=
 =?utf-8?B?UzhxZnRYTHdHcjJqeDV5cUI1Q0JxWVBzL0VXWDlFNHE3VEpQS3dZNGR6R2RD?=
 =?utf-8?B?c2RxUVQzbVl4NDU3SEk5Qmg1aUZPblZEWUVJRnJEV2p2Y2hFNVNST2hKQXdh?=
 =?utf-8?B?OHZLbCswa3p3YzNtdWJEZ2ppSDY5WEk2WFB3cXhRVHBTdk5xYzN4Yml2Y2x6?=
 =?utf-8?B?OVVJZHlJd3BHbzZlSnZYUzdheUlUeFR0eExMKzdYRkxBNTRNRm5iSUNuS0xX?=
 =?utf-8?B?MDNqb0ppcWlZUEZCZDYxazV4SkphTS9rMm9JcFpEMUErL3U0Ulp2SlNpaW5J?=
 =?utf-8?B?c2l1aEdOL3hHRHJyZXlGTkdBVTBBUEZISmdXSTVFcno4Y2hLZHFZZUZQdlRU?=
 =?utf-8?B?MTlxQ0JmVkhXOHBDanlHSFVMbE1VelBsRHAvQmxUcHVLT09SbEl3dVlVWDZU?=
 =?utf-8?B?YlZzUm5rWkgrZ1ZnSGxRZnJTdmlqbHkrMVA0YUNSMnlJYXdUVHcwd0JEc2Zn?=
 =?utf-8?B?YXpTN0NuN0NkNlFZZ2ZXUU4vNkJWQXpGZU1XUnhXM09wWXQyS28xZStoUEFq?=
 =?utf-8?B?T2g4ZTh1ZmtzbjROVDJieVZ6cUViYWJTTUoxZnlGclhyTGNKK1lEdTg2UGJJ?=
 =?utf-8?B?d0R1U2MyM2NuWitOSXJkbHV2YVpIZWlOVWlLM0xuYW9DMHRad1BObEJTc0p3?=
 =?utf-8?B?WjNMRFRsMXFIVVpyTFppY3Jpb0Fqejl1aWZEMDhKNkJabWF1NXUwTkZMQk1p?=
 =?utf-8?B?aUp4MUIwaHF0dVNxMC9kU2FBNGV0YkFJdXk4OWw3TklSY21DNDErRzRTM1RS?=
 =?utf-8?B?K0lnYy9ualdtNTdBVHhEK0Z4Ly91dmxweWUzem9tbEJsV2I0bzI3d0ZHK1BQ?=
 =?utf-8?B?VWlHdXBLQ0ZVTnhTZUFNeHQ4TjR1WjRaazdRZ3RjbFNKUTVmS25ZVUVaUVk5?=
 =?utf-8?B?TUFoaEVJQXk3VERCSGlNQW1Pa3RiY05NNlRidnBPczQxT2lBQ1ZWQmV4Nzhu?=
 =?utf-8?B?b01ya05ieGxGVjdtY3M4WU1lWHpzdVVLQ0I4R0VnM2JaelZubVZmVlJlTE5t?=
 =?utf-8?B?YjdITWZaVzVJK0NXRHZsV0oweTRMZlVBM01OQ2RxS2JST0gzS1JSM1AyUzBP?=
 =?utf-8?B?TkhWTm5Sd2VjdExOd3Q1cjNNbGFrMmRMSjZweWJ4d2dvNWpiRks0MGU3dXZO?=
 =?utf-8?B?TFhSMWhVT1pEZ0RQRnpsVzdEYWhSYjlSK0Zha3JhME1RckFIZXVNVkV5dXdM?=
 =?utf-8?B?Rk5JUUFaOUVENG1JQ1V0bWdKQWhSNGdyOURqVDE2V2tZM0NGR09tRzRHZzdk?=
 =?utf-8?Q?lkb5cQkWJ0IRWZHYDMuGRhcxLlxr1XxdjUvTz9z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0ExWkpqZldNL3YySEZvaytoSU1mUm1DaWowUWM2TW1XdkhSVTNEQ3VmM092?=
 =?utf-8?B?bjluN3BPQk9ITlZnYVErUDBmL0hXMG1NcXJleGZvUWxBRUZQNngzenNrUzk4?=
 =?utf-8?B?RVQ5cjhCWGhvY29sWFVhNlRXU29XUFFraGFmTERlUU4vWEJMTlQzOWZwcDRl?=
 =?utf-8?B?MWY1V3FuTHE5ZjBFaXdvTGlBaExLd3J0dHdLVkpKZHZISnBrYlpob2ZKYTA0?=
 =?utf-8?B?emhoOHRhMHhxWk16a0NTR1BheGNjT2VGU1hkSzJBRzE2aGxuaU9uU1c2Tkpp?=
 =?utf-8?B?S3A1TGg2VnJGbkIwOFNzNlpUM0JyT29RVTFqV0w1ZldNRHc2alhKNGx2MU4v?=
 =?utf-8?B?c2w5M1BVS3lpVGo2MjZDNGVpbGdWbmk1V2xVanJEdER2NzFiWEFmc1RTU2Fv?=
 =?utf-8?B?a2tzOEJPbm5KT2U3RlZKUVE5bkw5QklGTkJ1bFJCM1E2M25CUTNDUk15ZWcx?=
 =?utf-8?B?Nnl6OEF2SXp5dGxFZVBTdms2OWxXc0hyTk92MDhWQVJicjAvaFZJRUpWS2xk?=
 =?utf-8?B?MExSU0Y0dU5ZNEVBZnJhVGVtcmZUek5XeFgzbmdjdlBNUlZIQ3RETXFmNk9Q?=
 =?utf-8?B?d2JCa1pRTlVTQUN6QVV4bEV1R3Y2UWFlKzJQSFRQaDNrYW5Dbm1sb0V0dE1n?=
 =?utf-8?B?bm4wc0tZYzREQ1hyTzJRbkxPSVJ0dUtRVUtleTZZZ2t6U3pZOTA3NWVlNUJs?=
 =?utf-8?B?Q2dpQnlvcDVORXFMQWhsaE9KUEZCa3JoY281cGRleXFwTVFVNjJESkdiZXZ5?=
 =?utf-8?B?bzkrUUdvR3JrVE9oVEFydHUxTloya0JLNUFHOWFrcWoxM2F2QXZ3QVBKM04w?=
 =?utf-8?B?OGphYnlBOVpGNEVVMG12ZVBPWXRTckwzMHFEV0FPcC9RWkhHWERkcHhjNDJ5?=
 =?utf-8?B?SlRXY1NwZWZFWE5BYUN5akZMY1lpMmZOc3g2MGJ0bStrZmJmeFV1NkFzVVUr?=
 =?utf-8?B?ZlVYYS90QVprcVFFTTA2OWd5TUtTaGNMd08vMGlLa0FpSUJFTUZnSy9BS0FM?=
 =?utf-8?B?N0M2bUsxdTBjWVA3TDdBTU1rYi9adkxPN3NIV3J3UlBOQWVzTTFKSGVucmhW?=
 =?utf-8?B?bFFMZ095bk1BdElSRGdvdURLTTlVeHVHMXV5dkxkZ29adHdWUjhVUUJJUzds?=
 =?utf-8?B?QldLa09ldVpNRC90SjJtZlc3eHJtSWZXRFlxNzRtTENpTGhpS3k2UlVtcFlI?=
 =?utf-8?B?d1hiZHRUcG9lcWlaUCtDUXMzOEYzend4VkxJbENmUHZTWE5qLy8yNjdaeEFC?=
 =?utf-8?B?V3NjRWJyZitHSjc1MjVTRjVkaEtNK0NJbHhoam9SdDZWK1p4di82NklFSi9O?=
 =?utf-8?B?Sk9QR1d3NG5jVm5QbHByOFQ4ZU5oaHZ2MytlQklHeDQrYXZyTFU5RzVYUFBJ?=
 =?utf-8?B?c1pUSUZqSW5ibVB2S1VyTzR1bGUwdjFlYXNGbW9ONEN0alhlK3psdW1oTStQ?=
 =?utf-8?B?Zm1ocU40enJWdk10RGtqN0M5amtqYUlQdGd6eXVvWW9MRE45YXFmQ0FmNGxm?=
 =?utf-8?B?MUI1SXEwSTYzT1pOeVhkbmM1RDJ0YmRqN3gyclh3TUJtOVFqS2JPRkFsTUF0?=
 =?utf-8?B?NG9BaXd6SjE3SXNWSE1La2Mvd3dIQkFkMUNrd2d3Q1FrU1hlRkNoZmJ6UGpW?=
 =?utf-8?B?VkJ1aDdtQ3JTbEF6NGJ2TXE2dldZc0N2OHcvOHM5RmJuWjg1aXBOUHNzdThO?=
 =?utf-8?B?MHNUbEJjZW1OVUkxZWtkTzArME1oTkZlVEdBU0U5ZC84TXdiU2wwbWNlaHFM?=
 =?utf-8?B?QzYxU0JoUWRSZG1BVndva1FlOXZValJwVG9Xd1d2bVlsbXJWQkJMNVFMUTAz?=
 =?utf-8?B?cnAxZGI5aEVmcWZYVExRcllOQ0NGV1VRZE5qTTV0S3FOYThGaEZ4M05Tbm16?=
 =?utf-8?B?OXplV0p0TkxBbElqSWhwMGFzTTVxSEF3aGtwV3BJUnVEc05qbTNsdUh0UkJn?=
 =?utf-8?B?NEVxRlJUWURabStSYkV3Y012Y0ZkL210d3NBWUVvUlFVOXpyVTFNZTVCdzNp?=
 =?utf-8?B?VldhZnhjMG1rdmdwTEYrV3BpZi8xNkFzU3gwQjFWODdqcmlLcHFsdVlOeVdn?=
 =?utf-8?B?M2c5UHVzcG9yUjVjclNONlFENTc0d2FzaDJEalNyZWxLWGUwQWt4T0JiSmlq?=
 =?utf-8?B?Wnk4SmphdlpLb2hlSlpSWUtUbkNVWHpOekMxbzNoNXRaYitzc2xjU3FGekJY?=
 =?utf-8?Q?UArQ/eFmecv2C1JIdGE+oFs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a11964c0-7031-48c9-070b-08dc9182f376
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:44:39.7259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtH96Oa45nM+tXvcIAadsEwJixMkb+cW6j9kNMreSIho6Ele8MxZu7xS02oMpePYlgZ4hpB3D4jOPJK8ASTzhxsV8sZZYRvBUc1Bh4me9aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Thu, Jun 20, 2024 at 01:00:52PM -0700, Ashutosh Dixit wrote:
>From: José Roberto de Souza <jose.souza@intel.com>
>
>XE_OA_FORMAT_PEC64u64 only has pec_offset.
>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> lib/xe/oa-configs/oa-metricset-codegen.py | 6 +-----
> 1 file changed, 1 insertion(+), 5 deletions(-)
>
>diff --git a/lib/xe/oa-configs/oa-metricset-codegen.py b/lib/xe/oa-configs/oa-metricset-codegen.py
>index f4a008d690..5fa12f9caf 100644
>--- a/lib/xe/oa-configs/oa-metricset-codegen.py
>+++ b/lib/xe/oa-configs/oa-metricset-codegen.py
>@@ -145,11 +145,7 @@ def generate_metric_sets(args, gen):
>                 metric_set->perf_raw_size = 576;
>                 metric_set->gpu_time_offset = 0;
>                 metric_set->gpu_clock_offset = 1;
>-                metric_set->a_offset = 2;
>-                // metric_set->b_offset = metric_set->a_offset + 38;
>-                // metric_set->c_offset = metric_set->b_offset + 8;
>-                metric_set->perfcnt_offset = metric_set->a_offset + 64;
>-

Okay, you can ignore my earlier comment to remove the above lines, since 
it is removed here.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>+                metric_set->pec_offset = 2;
>             """))
>         else:
>             c(textwrap.dedent("""\
>-- 
>2.41.0
>
