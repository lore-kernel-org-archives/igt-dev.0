Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F0BC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 12:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FCA10E69C;
	Tue, 18 Feb 2025 12:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5q0bzIG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0DA10E69C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739881192; x=1771417192;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yEG1Ixowk6gcYoBrjIInerAHu+rrHmcoNIt83lgb9LM=;
 b=g5q0bzIGMpoBCJT+YCXQx1imwDEmyVnC1ADqrdJKA93v6Sdl7ID8eMIa
 bVktMNa1LWnapwCXZk/GXgvcf5/pByLDARptuATHdJh0MWb+GW3PtWi+I
 mHXdaPA5S2q0xwieBLboScFP7c17n/Zax6OMhQaBRtT3g7kAPPDEkU7SJ
 Ln5G6j265kc2ubDR+cBwKNI2JjCvCaSkoz2F99WYc3hBmQciT725DVeSh
 vvgolgjrnry9dek46vRVjWbDpgA8F/eYUjHjOL8Dez5kiYvWmgZ6h/fii
 jScRX+FS8LvylrP/ZtXBjUsezrPfh9Bl7ywNTCexL/T4TlYxBhojMVQgC A==;
X-CSE-ConnectionGUID: +53HhyDASXCnLtDDOer0uQ==
X-CSE-MsgGUID: J6xW40E9TRqaU7mequTdjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40277379"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="40277379"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 04:19:51 -0800
X-CSE-ConnectionGUID: N3qvh7WjT9CUA42qOjeGRA==
X-CSE-MsgGUID: zksFfisZTj2lL8JdwASxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="114303284"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 04:19:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 04:19:50 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 04:19:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 04:19:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y18wxlxjqFNzeuKhAnCSiotejEa0YDWirIXZqffjt9NN9rjHmsZ11c1fFCPfqxkHW93dQBiCaOn25JuTVIXwUQHLW3Jxii13W1UaWo3wXn0rAOsxJcq4tIvRZ0saAUQfcxyGCnpN9dW4rTPl12mqTZGBPm9XYiHcivPjIVJsRAbc5wwPFUw9hChKPkAgxJX5N7382cxIocsoG7mcNbnMgQhqDQrEu3MVSjrohpwm/hNEnHsBMy6yXgl+P53s6rCG8PnIWCdhcqj9jNJZFDStEpR/i8f7rPXUB6MiMiFfQcaIJS59HL+E2fAayr16WFKwvBVleIpxczb6EdOOvz/0ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLUkiVb8Meyv9ordEbBWhA4MQfgIlSOAIiwdVHxvcP4=;
 b=Knlw+YrzYLF8vzb0FewCbxfdUCNZiaYYhOSsrhqP6+Wz3JckndnFXQ+dUcXZ0uSsbCVBgNZ5vnkKHu+G9YmkqHZKUhe9zYsfFJ0HGoYSA0OVIOVBQA7f/WWTlqNQHz1r9V59ZTnODsPlIMqN/qupl6rvw5BWkKLZKnnxxmWnEnWtRZNQ01jpTPX61aWpnr8mAuISpABQBMh/Pd64Q9L8VRg7+yYt+ey+eqOBmbdgW8wYhO6Wi/5bRWqrLnmsIiRe8bMmYzS25P8foo1dY2O7YEMY7OMXDufNak7WFFk0cPZ57wgCuN93mshiU/BfPRTLGqZZbrMdSc1y9M21zljz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 12:19:47 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 12:19:47 +0000
Date: Tue, 18 Feb 2025 13:19:39 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t 1/4] lib/igt_sysfs: Add support for device unbinding
Message-ID: <Z7R629psykoNL1bt@fdugast-desk>
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
 <20250207072902.12582-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207072902.12582-2-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: MI1P293CA0025.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 49961d3d-ed63-46a3-55bc-08dd50168907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHUxU29laHg0NnFUQWI4MWdLMkZYcjByMGxsOHphOGpicmo1SG5mSG1YUUF4?=
 =?utf-8?B?d1N4K2NxMmRSRnFYVmx3N3JPVUpSMTJURXFqaEVMOGROUUg1MFY4dFI2a2Q4?=
 =?utf-8?B?clA0Smx3LysvdjdKT0VBWFB6cVdEMjN1YnFFYVNaclVIYVVmT3RLTmorR3o5?=
 =?utf-8?B?QWVhdTYzeTMxWjJYWVZjZDJDTGJQMFhBckx2UmM3eWEzaFVsNXpieTBPSHRV?=
 =?utf-8?B?V3d5clJVREpsZXlvV3pNNm1CSVVvZXdyR0N6cFVSSUY4WHB6ZTdxNDJ0OVpL?=
 =?utf-8?B?RHl3dE1xY09YTUtyQ2lOK2pleUpzajIxNU5jbkVRamZaTGVjYUZmZmMzSnIr?=
 =?utf-8?B?TUlPOXZVcTErVlJqZ3kvYkIvSHhQQ2xEOHNmMGRvT3ZSenRCc3JVeGRXSnZI?=
 =?utf-8?B?QUgrak5oUkVNM1REZUNZbnlvdm55cG5LdlhPK0JtWG8ySUhSTDgvTFpGLzlt?=
 =?utf-8?B?RURRVlVUWGdaWFpjaFNrdWRHWkwrOVZNdlFQODB6TktFdUU3eHRueTNYd2JV?=
 =?utf-8?B?VE4xV3dpU2M3ZGJZN0tXWURua1ZWRDIwVTBGTENUU3luMFdXdXVSSkFVTWVu?=
 =?utf-8?B?aFp2MERsOVVLZkgyTGRYdzRUWGs3bEVvWUMwS1ExV0k1dWtrMkVycGhPVG4r?=
 =?utf-8?B?OStMcEljUXpKUG5sMzBwdHc1Y0xrcDQxcU1BTjV2VEpWcUFMajZYUUtMNmdr?=
 =?utf-8?B?dW1jckJ1blhQL0xoK3JaeXlwREFoMTZ5T0hsYjhnU1ZjNlVCM1NpdUk1ckdo?=
 =?utf-8?B?ajNOaFNsY3NpSGhrK2ZyVExwYXBuVHl3VXBabDNFT3ZCektxckw3VndJZTE3?=
 =?utf-8?B?NXU3U1NhTDdNeWZFREh1b2hQeDliMm9RRE5VUURtOGxVY3FlMXB6bmtKZnF6?=
 =?utf-8?B?ak55T0NFbGVYeFFRWk9SUjA1NDRGc05Pck1uWFFsNjladXFWK0hyelFrNWdn?=
 =?utf-8?B?eS91OE5ZMnpFbGYvdmgraUdPUjZ6anZ3NzkyMkNtQlNNMk8zL3FIOHlJZXpW?=
 =?utf-8?B?clVLamxhQmJubVRNMGFiNmpOb1VKNmJEbXVVNlZIalFoYzRPRkpxUWRqUnFY?=
 =?utf-8?B?L0FNQm10czEzaFRrWVRtWUtmUHFXQ1VGWUkvdmZvMklLU0d5eDZiQjBvZUhi?=
 =?utf-8?B?VDR1cndTcnFuR2I2RmRjK0ZycXJZY1BQYWhyQVFDdEtnbEYvUHZURWhCZE9N?=
 =?utf-8?B?eVpVbU4zTVRkYlgyL1RrZ09VeTBEUW5SQW1hU0pUbUxjeEN2N3diTms5c0hE?=
 =?utf-8?B?QVJ2M3lYeWdjd2VTWFNTMHhOVDdDMWFSTVFmOEp1UmxVZEhKcEl2cHFDcVVk?=
 =?utf-8?B?MUp3UXYxcEV2R0NuQTRVMUZqalg5QVlOSVpMQWo0OGQ4Rkhqcnh5dnYxK29S?=
 =?utf-8?B?dlI2ZWRwRWRrcUViUGJiaGNQRWtmSjRsbWxoL2krd1gvRUNvSDkzdlFNSnlO?=
 =?utf-8?B?ZE9VaFRpZnNmZEVubUZRU1ZHdS9mYkpwY1RBSmd2eDZNTnUzWHVEZ0JsMmdS?=
 =?utf-8?B?SkJ4c25qMWtDQ2RMd2dWVDllN1ZmWjdSNnZKNjB6OHhpT2F5bVpzRWxPTW9L?=
 =?utf-8?B?ZUhVM3hRSTd3aldNRTRXRDFWNlB1K0VsZlJyUisvZmJZSm10M3RhcGdZNnd5?=
 =?utf-8?B?ZU00d3Q5UzA0b1R2ck4ycVptc0tJTWQ1MGw3NFROdjdUOGtCWUlpa0ZmL1Rr?=
 =?utf-8?B?QkwrM1NCaU5MWXpUTlJWQ0EvdkliK3htczZDQ3pGNlRCaEdub3dEano0ajdO?=
 =?utf-8?B?UXNVSnc1ekVsT3ljaFF2MHg3eDVXczhkWXFRb3REUjErODZhdjFBajVhMGYz?=
 =?utf-8?B?dmZoNHM2VGxDRlVZanFZdytrb2tNTTRDcU05ZHRYZjFqR0lXUnB2QUZvVGc5?=
 =?utf-8?Q?pWdO8UAP7rOPP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmEwUzJpclNwaEsrWDlaenhBVVgyUitCc3JuelVOWGxtTG9zaHJkUVJtb3RM?=
 =?utf-8?B?RmdYOU82SVJVbVVCbjhYdVU1UkNWN1Y5eXhFS1QzaFdFcm1uZFI3dnR4a2dv?=
 =?utf-8?B?WjRTRzRMR3JiRmVDZzZ4T3ZobGVzeU1yOXdzYWtnM2ExQXVNdk5DMC9JNmFQ?=
 =?utf-8?B?U0FuMjNqWVk5K3kwa0ZvZXR0QXBCQWpTMmhzU3h6K1d0N1o5ZGxoMkRBYjVT?=
 =?utf-8?B?NmFoMWdIWGpVTWhycDVUR1IrOFpLaFpyaGM4MUl5ZkQxMllwakdlWHlabEo1?=
 =?utf-8?B?dW9JTnA3dW5Gb3JCNjYxaUtEaU9YdXoyVDNSNFNNR1ZzdzhpcDhYYUJqNVFj?=
 =?utf-8?B?OWpxVzZBTzJDcTN5cm9jRHBoNWYxMDlkb1hNeWdpYnNCUDdPMVZ6MjNCWUtY?=
 =?utf-8?B?ZTlDbVViS0c3ZW9xN2I0UGlLOG9sb2xMSUJXVEo0ZlFPWS9jcEhyUzJvOWpn?=
 =?utf-8?B?ZXhDSi9YRmJWWjc5bGVTNzNkWElsYTdsUW9OZXAvQXpTNy9MVFVrSDRJY3R3?=
 =?utf-8?B?emFyZHh2bWFzTmVaTEJ6d3hLNzdQUjdzR1liTk12UWJqVXZvellSSnJhYTY4?=
 =?utf-8?B?WTNOSlh0M1l2UTVndE9WYzMrcHFJZDdWNkdsMGlITFEvS2ZvSm9JTUN4dkRk?=
 =?utf-8?B?ME4xTkM2S2dmODEybFlFRk56Zytka0wzaWIrRlJkL3M5TThqMWg0azB0dDBt?=
 =?utf-8?B?bm5USEgvcGc2VUt5R2Z6OFVGT21uUUdOb1BJQlpCaTBURXZBbTByUTR3cG13?=
 =?utf-8?B?Zyt2WDRHTkRZL0g1QXhROWsrM0YzY0JKTUhDa0hkZlg1aXA0dEIzb1pLMjVn?=
 =?utf-8?B?ZTZQMVJTeTcyWWFha0VvNjVBc3RWeXJDUjFaK3BxSHFUaWtUU3ByTFBkSGhw?=
 =?utf-8?B?RE5OYytqS3RoOUYrYjEvWVBwSGYzMWlwRlA1WDV6QUZ0RW8vT2JhZ3ZDSjNP?=
 =?utf-8?B?LzRad3FKQnIvbXFEeGdwdWJ5b2lKK0xaVFM2TVkrdm94QURpMWd1dENmZmxJ?=
 =?utf-8?B?cjVGTVpkNmRSeXhsRmRybnludUo0eWNUUC9DbUdoZmwyVHRXcm9KTElQNXd2?=
 =?utf-8?B?am5ZQk9NU25DVklpMVJHK2Vza1FqazRoMkZ5YVFML2plSWpVR2t1WUdESTZu?=
 =?utf-8?B?a0U5R280UEduTnNBVURWdGRuZkFXVFErMjJGcHZpTm8yTVVkVGtNemJDcnlP?=
 =?utf-8?B?ZkN1eXpEZnVnSUswK2w4eXB0a3cwUm1aaEF6RGYzL3k3a084VGQ0d3hSclRt?=
 =?utf-8?B?VCtvUEFjL0Y5VmxYdGsyRVNoZGpxOU1wMFdxMngvM2JpTVI0MzRwREpHWnBk?=
 =?utf-8?B?dm1XZmxGaisraEwxWTBHcU5TREV5WnRhQmpnMTF0eVR4NVZlaHZrWnJEMWJv?=
 =?utf-8?B?WjBaRzd0YU9YSjg5THBHRFpGQWpCZFVCd28rZGF5dkVYZm85TkZFT0kvMVBw?=
 =?utf-8?B?em04U3BRUi9yY2xEbzM0emVLZzgwMjRFaVlldVYvSXBkdCtZZWFlMWZzODNE?=
 =?utf-8?B?REt6ZTlKQm5rdXF6cmE5eStCMVUyaWlESHhEMWh5SDQ2QmNtVVhXNzRMSXJa?=
 =?utf-8?B?ZExzVW9IM0JQWGFwVndtai9iTlZYZVZJamkvQXVndG1mSHJDb3RmUFkxUkRB?=
 =?utf-8?B?ZkZlcE1haXRqOWE3RXB4YjBzcTRSNEFYOVdOQm1DTlBISHBxbDUvL0RDMHVZ?=
 =?utf-8?B?VWhPODZaemQ1OEpBb1V2dVI2Q3hTYUR0OHZ2SUJ3R3EwS2FJRUxMN3ExcEo5?=
 =?utf-8?B?Uno1NFVEWkpLSXdKUWFPYkxlbVA5bitLWThOZ3NUdEM2WjFSZWJ4d2NPS25k?=
 =?utf-8?B?OFV0ZGdtRkVSNXpQbHMwTlp4YUVNKzBZckNYTTRYbnlEb0YyYUpES2g0cjB5?=
 =?utf-8?B?S2o4ZE9aNURRY1djaTVzZURITEx2ejcvNWhacDFqR3VYWXh3Y2RYb3Uwc0xs?=
 =?utf-8?B?L3JuV09RSWVKRkV6Q0ZHTkpJWlBYTit0WC9UUWdYR3U2V1A4VXJoQlZ1ckFP?=
 =?utf-8?B?d005MUV5dEJzZktQK1dJczVLUFByeEhJR1I2aW1QTDhNTDdCKzBRenhaaXZC?=
 =?utf-8?B?VDRvTmh4SC8xYnVUYmFqeFpuRVJFV3MwbHZZcDhCYUhhNTQ2MkZzbXBhb0Uv?=
 =?utf-8?B?Q1RSdmxmZUJ2RFZqemE3TFdrRTZZQ25PSXF3UnlXeEV5ME5Wd0FEMDVYMWh5?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49961d3d-ed63-46a3-55bc-08dd50168907
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:19:47.6920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMTbrl6IQEPGW9CcaDrqQzqfvkHGaBtM7FZ0c/HRZ56297NJABnuEZRjNPuEnol5BEsBcyD4mo9tx8xlVYFSxdHm7oUlLu5JkyzPh4Zzz1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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

On Fri, Feb 07, 2025 at 12:58:59PM +0530, Satyanarayana K V P wrote:
> It does not harm anything when we try to unbind a device which
> is already unbinded. We do not want to throw assertion when
> the device is already unbinded.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/igt_sysfs.c | 4 ++++
>  lib/igt_sysfs.h | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2e4c2ee63..3fffaf96b 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -1509,6 +1509,10 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
>  		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
>  		close(sysfs);
>  		break;
> +	case XE_SYSFS_DRIVER_TRY_UNBIND:
> +		igt_sysfs_set(sysfs, "unbind", pci_slot);
> +		close(sysfs);
> +		break;
>  	case XE_SYSFS_DRIVER_REBIND:
>  		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
>  
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 86345f3d1..cc4971e70 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -187,6 +187,7 @@ enum xe_sysfs_driver_action {
>  	XE_SYSFS_DRIVER_BIND,
>  	XE_SYSFS_DRIVER_TRY_BIND,
>  	XE_SYSFS_DRIVER_UNBIND,
> +	XE_SYSFS_DRIVER_TRY_UNBIND,
>  	XE_SYSFS_DRIVER_REBIND,
>  };
>  
> -- 
> 2.35.3
> 
