Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018C2C3271E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 05:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B734C10E941;
	Thu, 11 Jul 2024 05:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eML65lxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEBC10E939
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 05:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720676878; x=1752212878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZBJFr7LveBEeWmwVhKX6x6o72/t0NIV/d67GtAnU54g=;
 b=eML65lxT47YVfJId3b6Rw0IyNehsMveYGgsyUijN3J1LzVAo/jA8xM+j
 M7n6dM9puWau6PT/ziUQYZdTMzFnvnMmKeeyMMgHBR0LUCd9eB5cIE312
 FUwDKsxknl+Ocsiow3Bev1eml2/xS/m0Hyp29M6Hf4pN5TEd6aYb3g1xj
 LcDWA516KybooEw2Xh+Vv7MLegjeiqYtKaB1Jnhe8+JTyVZLkQYfNpm2A
 thYM3sCHCbheNYw47gwAHtYIFFDn/KA94bQt3RxCC92IZz33HZajDdRON
 Ramv6NBkVu+5i8GWnQmoVrdPtvFq1JWKs/1IZaiVF+1yt0evVUe/oyJik w==;
X-CSE-ConnectionGUID: 9iyoW4D9R8SsZ1js0tnx7A==
X-CSE-MsgGUID: kHq10W+ZRVunf1N5gPUoVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="12491085"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="12491085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 22:47:57 -0700
X-CSE-ConnectionGUID: f5mdiwh1QLKuWDXCVHlgFA==
X-CSE-MsgGUID: OaK4SkZkQvGONioMkGoxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48423876"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 22:47:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 22:47:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 22:47:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 22:47:55 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 22:47:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdogSNssqsXDtpEJ3cAvotWFqU7TrO1ahtOQXtEi9R7dsTzLZcqyE6SukD62GKyHp5RjVuJtAhKb/ZxPTihxsBk0p8vXUzqebR/61TdkcGYXQhiZInE1Qsxypny/F7ZnLffyDu7deJJXUwxNDbh/ZE9FU4mmlwPRdG8divC/2XU4oHhBnstyI+6rVgd+zRaosXtU+JeIEiscH+ITSZ4/hTVq4OHKWkOCIh1qpSjJDB6X6Glz+dxlmI283dqd6BUfNHO4UYWH17fNprOGqP7vAih9jxdtLPFAsw53v1Ughfpi7FjbTsiOwpjhYkSFxJuiGV+17xML5dL+OMZ0iztVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUXa+JB0gM9AiZPbBdGlJKehcCuW6JSiTN3pZkRu95w=;
 b=HYX9SOTULK0A97fJ7/St9eGGawgfL6Ln6EzpmuRPjicSlMNq9hrghnxDERZnqMxS98a0SRLr2zUCm0719b+0S1CXV3SCVVBNrQnkQmfd3K62zlo6eSvcOebhZ8ybisqSbpH8W/uZlC2f9HyTiL+StP70G6B2iheCLo8UMARmcAYxaN+qkM9FaIGr+J4FOboFNpt/88FSHcZ9jpWMlGMM1IGPQpUjRhwR8SrcU2IlNGlT17CEGhXLUGskbow5OL8yeEsGNGWo9BzY/Ql3wT6WoH7ylFF200bvt5SE0atEwXLBG80s9aIEDwTL/gOJcxiXQsy2hzIQm5XMJMA5RWNGBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5726.namprd11.prod.outlook.com (2603:10b6:408:164::23)
 by IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.40; Thu, 11 Jul
 2024 05:47:49 +0000
Received: from BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::e484:b723:d325:e5e0]) by BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::e484:b723:d325:e5e0%5]) with mapi id 15.20.7762.016; Thu, 11 Jul 2024
 05:47:49 +0000
Message-ID: <6c04cb02-fb2f-4c8d-964e-bc82b83ab830@intel.com>
Date: Thu, 11 Jul 2024 11:17:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/3] tests/intel-ci/fast-feedback.testlist: To
 get the required results
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240711041355.749937-1-pranay.samala@intel.com>
 <20240711041355.749937-4-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240711041355.749937-4-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::6) To BN0PR11MB5726.namprd11.prod.outlook.com
 (2603:10b6:408:164::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5726:EE_|IA0PR11MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 9636d0ed-c7d6-4e37-8d16-08dca16cfe9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enQ0R0dCN2JiQU9uckxpQS9oUnYwOEpvRStBWFFpM3l0aEMvelhCQzJoQ0JK?=
 =?utf-8?B?aFd1RVRtZXZSWFc5ejFON0lZbDYrRW0xU0I0cmNGVU01TjNIS3c4RTluTURk?=
 =?utf-8?B?MmdsTjZjajhEamtvZUhCYW84SldkeFQ0eERqMkl1WWxJKzZnY2lRUGU4cUJG?=
 =?utf-8?B?bHpQbzZYSkxTbG9Ca0dYWmFUMlFWclUzVUo1T1ZTalUzeHpveFpEN3NxdkU5?=
 =?utf-8?B?MUhxejNYSDMrczJCUUkzU0ZiMmRYNEUya0ZvUWpNOVNpSUxidlJzdEVyODEx?=
 =?utf-8?B?blFMZjRqWW1WWEl5MWt1dTZzbjV5dzhNdzU1L2FZOG9KSTZGTVU5MEhIcEVE?=
 =?utf-8?B?TS9PTjZuZnR2S3lmYVZlZCtiMm9zbGdtaDBhSmVYQzZNMWZKOFErWlNLN3Nk?=
 =?utf-8?B?VXFTTkNjTzBzNnNOcVIwQVFCZnpjOVAxTFhJWG01VElsUVFPS0FsdmNnbGZE?=
 =?utf-8?B?andRZHZsbnVGcE16ckhQdldZemI5ZGRmNXp1TEVVOGZGMXkrSWgzdjZlZUNj?=
 =?utf-8?B?b0tMWlM3aUpEODN1MTNqMzE5OVQxWXVMS1ZlSmVzVjE4R2w2MEVkZVpaY1lI?=
 =?utf-8?B?cnc5cmtnU2dLZDZUTmczNUFxYytsaXFkSE5qUHJTKzgxQXFNNVVycmdDM0la?=
 =?utf-8?B?V09yc2x5TS8zYkNPK1F5azZWaU1MenlaTFdIbys5M3VPZytTMHBhbUpSUmp1?=
 =?utf-8?B?cWlTM2xpMCtZVHZWQmR2M2FlM0xGclUzRktMdWlFY0ZFMUltU1UzZ1BYUUxS?=
 =?utf-8?B?cXFxUnNhVldvY0ZLcTRLQ2RXQkRWVmg4dldTMXV5QnFWM3NiR2VHcTZUck9q?=
 =?utf-8?B?aFZNUzlpaElpV2dxeWkwZmVvbldpdk1BZDVsNjVoakNBMWx2NEtmM1VLZkVH?=
 =?utf-8?B?UVFyeUN1Tm9VaFlnZHFON2wvbFV5VXNGUXRhVmZyeDk5Y0tzaGtBL3RaVFQz?=
 =?utf-8?B?ODBHbDlxejJMS2VHc3JGbFk3Y0hlNHVZaFJSUzNtdmRGQmsyaFZDYVo1NVU1?=
 =?utf-8?B?blpPVSswTXVob05MUE5qcFd3dWQ4QTNhMFd1L1NPaHcycStyY2xjbzBWTnNJ?=
 =?utf-8?B?aXgvSG5hNTJRN2dxYlpHdjh6d04wNXdDdWloSlhNUks0Uys4VXFxR0grRU9N?=
 =?utf-8?B?QWtvY1V4T0ZqcVZHNTNaMUJlUUk1M1FSVVVGZWNhVGJpRmxwZVMxYm81NGNl?=
 =?utf-8?B?VWxwb2dZd1liclBMVkMxM1hqTkFzcDVTeExpalZKc215N0xvVEJSUGZNdkxB?=
 =?utf-8?B?YzBFNVh4QktCOEcrc3g4NXEwbFFVUmhrdHFBelNYT2NKdUFWMGZJSU5tUmhq?=
 =?utf-8?B?ZXFJV21nSmtJOWhaYkFoSEs2TUJaNWM5QzdJK0JSSnN3UU1JaDE4N3VCcWw5?=
 =?utf-8?B?M1hWdkIxZmNRWm5rR0NReHJCWDRJbWFPVmd5b0JDZkg4UitYS0JWN0JTSHkv?=
 =?utf-8?B?MnVCK1dBempMY2lSME1hWmtSS2tYZ2N2L3RId3Y1bnhRTXJsUUdndk53WFRy?=
 =?utf-8?B?ZmFzSlltUHlielFjajJTNzA0UnN3aWwyazVrMnE4bzBVV2g3U1p0dU5FTVlv?=
 =?utf-8?B?dUJBM0RuVUc5elNuM2svZWNsYTRHcjNFVExQYzNlQ2d2S0k1S2JzQXcxMDBT?=
 =?utf-8?B?dkVkSTdGU01LOGVCenZxTitXMGFLWDVxUFNBQ2hLNDBZN25WU3FwblA2VE9w?=
 =?utf-8?B?QWRIZkVtWlhoai9UUHdRUlhrcm1qUDE4UXFtQ3IyS0ZJNVNWK2p2SmViM0Ni?=
 =?utf-8?Q?43/8E6tdWJANxZ0v1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5726.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2NwR0doR1BBbW13VXp6ZTBBRTRNQmphVVEvc2xPbGM1MS8vUnM5QUJwMngw?=
 =?utf-8?B?Nk5QVjlmZDhYdU9pcExRNVptQS9oSWMzaUZ3Vk9sdHNpaUJPRXpwemJ2bVhr?=
 =?utf-8?B?OEk2WkpnbTBud0JYY1ozbjdqSmxKTGl4V3AyZVQwTi9qMWpxVnRGbUdqTnVR?=
 =?utf-8?B?SXdHTzJxTllyYi9zYzRPSHB5b1VELzhvWUhGVEVUQ1g4SnZsV3BkR3JreXEv?=
 =?utf-8?B?bURrNU5zYmFBVE0wdXFOckZtWHhlU0VDcHVvd0gwdjBYMFQrLzV5Vk1WQVov?=
 =?utf-8?B?b0J5ODlKY1BTQlZKaGJwci9NS09QTUdpTGxidmtvVXBYOEZDTzl2TUJwYlhz?=
 =?utf-8?B?cTEzN2IyYUJoSXhKaUxUaGJWNlFmMTJRS20yc2MrUSt5QlZLOXVYKzFRT0Nq?=
 =?utf-8?B?b0M2Z1JOSVZJNUVWY1JRNVRYc3NXM0ZHWEVGZWd2WVlDSVM0Q0lNTUtWNGlz?=
 =?utf-8?B?cnFuNzBvelV4dWgrZ09DYW5YQXNpdExCNWQxeFVNL0VBU3JiNHJyOGZhei92?=
 =?utf-8?B?SHJHRzFFN21wTnV5b1ZTWURoRTh1bnY1b0tvdW9RRkpWWWhGZ1l6elc4UzVK?=
 =?utf-8?B?bHp1ODZjYTBkQitJR011QVBCb2VPVWNHbnpja2tWbCtsWkZZaTJMVnlTREgw?=
 =?utf-8?B?a0k2bjE5SmhKT3JKeWQ1OTk4dVNTeDNaaUNTakRRMDErcGE1NWlJOHA2czVs?=
 =?utf-8?B?WU4rdEEyL0VxajVVNVFEczFmZm0vL1p6RFBwZ25wWnRpYzZPU0RUaUpZand2?=
 =?utf-8?B?djNtamw1elM5dGxLamJjcGpVanpyVFlvY0Uzc2tGd2NqOHZVRVRERnVYdVFR?=
 =?utf-8?B?ZDQvSmxrUkcwa1NBTmV2bkZldVRyMC8rOFp0YzlLYXRxS3ZMbmRIQmpqUjla?=
 =?utf-8?B?VVNlbFNBQ05neWVXZm5FRTRzMUpjSXkrcERkaGVDWG92OFJGb0RCcmdoaGM2?=
 =?utf-8?B?Tjc1VWVtOVp6UG9oQ0h0RG1jM2FmRHNqaEN6ZHdyS2lhcTdiZm96TERDcVhk?=
 =?utf-8?B?blhJVzlLN2MvTEhwVUJwS1ZDeEhRK0E1WHMzMkc2WFlMdmpETU5Nd0c0VFN5?=
 =?utf-8?B?ZGpPM1VtZ3J5dEpLT1Z6YXJFSmJyK0JkaVhmSGMzSktWbkRtYm9jTGxNa1hT?=
 =?utf-8?B?SUZxTzYySHlSK3RsWjludkhXQ1M0SFhsMS9sdlhBTWpDM3JraGJ1c0I1b3VI?=
 =?utf-8?B?WGM2QldhaTRoSkxpQjU2TDVkVU96Q3FkaUVKTkdJbGZFYWM4S1lnTFcvWkc2?=
 =?utf-8?B?MDBzL2RvdGtOMnVRNnpXOGM2dkVGV3JWNzFQVGc3bktOM0JqWFgzYm5GbmtS?=
 =?utf-8?B?dncxUGtXa3Q4OEJmNkhCUmJwa2F4ak1WQWtnT1NzMERReHZHVTVjMkN6RGVm?=
 =?utf-8?B?eFVHOXN6aHBxK0ZyOWZGa0ZyQi9hbU1EOUoyaGtDM1UxT2l4d0lkVnBhQTRP?=
 =?utf-8?B?MDBjdHhaTHc1Q1dmQUh2VVFKK3psVGd0MStDY215WFg5Mm4yZUdWODZxY3p3?=
 =?utf-8?B?YVh5M2puazNsRS8xcXJzTGl4N2JheUp2UW5jcnBpTGtudC9kUU1BY25WeE9w?=
 =?utf-8?B?cjBuaDhvdTZReDlmMHNZWkdtUFJHbU40YWJYK3AyMTBjMmlabFIrOTFLbEJv?=
 =?utf-8?B?MlRSYW1GMmxHRTNINDBNVGRJV0Z6NWszZ2Fwa2VhdlRwTit2R29JV0hsQk1s?=
 =?utf-8?B?Y3YvMDhqNFhEYUN1VE9ycUoyWHl0YXhsdktjajhZWjRpU2l5Yi8zNkNTL1J6?=
 =?utf-8?B?TjFZVVdCdWVvM2NJNVZHcE1mSGRKeUh5L2xVVGprK0RDMlhpNWpLTkxCWEFP?=
 =?utf-8?B?WnVvcFV3SjRkWFNzVW04TThDeG5sSUVhcjlSZzBJbWpWM1NJbTRET2tDaVJK?=
 =?utf-8?B?MTZ5Z0RkTm11WnVqZTBoSTFIb1FXd1B0WXU3YnJQSGpQWmRVeWhDVlVqUWJ3?=
 =?utf-8?B?akVsZ3FDOWY3LytMRi9KVGIySEdrNEtaWXdoVlJTTkszdDZDRkhmNU5qM29W?=
 =?utf-8?B?SGxibHpBTDJxek0rRThYYjV0aDlFdGVjUUh0TjIzMy9KV2JINk9XSVJuTk1F?=
 =?utf-8?B?SU9OUzIybUhJZlppTkRHOVNPeGtVa0Jyd05CVmFybE5ZMksxV3hRNWRFQUJV?=
 =?utf-8?B?Q0ZjdDRnZTJOaFp5Z1VmYjNCbENhMG5VdXh2cW10NjVBSUxFMXR4allmZkJl?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9636d0ed-c7d6-4e37-8d16-08dca16cfe9c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5726.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 05:47:48.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkcK13auLhEhKhV5MXTVackwO8laL6ba6o/w4kq3r+86k42MaK849axClY2xnzWZpaBbYMWP6mA/USigCrxZAPi14zoV4RCWCwkFuZ+/DpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
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

Hi Pranay,

Please follow [1] to test something in CI BAT. So that we people wont 
review such patches.

[1]: 
https://intel-gfx-ci.01.org/#forcing-tests-in-bat-and-changing-configuration

- Bhanu

On 11-07-2024 09:43 am, Pranay Samala wrote:
> This is to get results of all the tests which are dependent on drm debug
> log level alteration
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist | 184 +++-----------------------
>   1 file changed, 17 insertions(+), 167 deletions(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index be0965110..9cf8edcef 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -1,171 +1,21 @@
>   # Try to load the driver if it's not available yet.
>   igt@i915_module_load@load
>   
> -# Keep alphabetically sorted by default
> -igt@core_auth@basic-auth
> -igt@debugfs_test@read_all_entries
> -igt@debugfs_test@basic-hwmon
> -igt@debugfs_test@sysfs
> -igt@fbdev@eof
> -igt@fbdev@info
> -igt@fbdev@nullptr
> -igt@fbdev@read
> -igt@fbdev@write
> -igt@gem_basic@bad-close
> -igt@gem_basic@create-close
> -igt@gem_basic@create-fd-close
> -igt@gem_busy@busy@all-engines
> -igt@gem_close_race@basic-process
> -igt@gem_close_race@basic-threads
> -igt@gem_ctx_create@basic
> -igt@gem_ctx_create@basic-files
> -igt@gem_ctx_exec@basic
> -igt@gem_exec_basic@basic
> -igt@gem_exec_create@basic
> -igt@gem_exec_fence@basic-busy
> -igt@gem_exec_fence@basic-wait
> -igt@gem_exec_fence@basic-await
> -igt@gem_exec_fence@nb-await
> -igt@gem_exec_gttfill@basic
> -igt@gem_exec_parallel@engines
> -igt@gem_exec_store@basic
> -igt@gem_flink_basic@bad-flink
> -igt@gem_flink_basic@bad-open
> -igt@gem_flink_basic@basic
> -igt@gem_flink_basic@double-flink
> -igt@gem_flink_basic@flink-lifetime
> -igt@gem_huc_copy@huc-copy
> -igt@gem_linear_blits@basic
> -igt@gem_mmap@basic
> -igt@gem_mmap_gtt@basic
> -igt@gem_render_linear_blits@basic
> -igt@gem_render_tiled_blits@basic
> -igt@gem_ringfill@basic-all
> -igt@gem_softpin@allocator-basic
> -igt@gem_softpin@allocator-basic-reserve
> -igt@gem_softpin@safe-alignment
> -igt@gem_sync@basic-all
> -igt@gem_sync@basic-each
> -igt@gem_tiled_blits@basic
> -igt@gem_tiled_fence_blits@basic
> -igt@gem_tiled_pread_basic
> -igt@gem_wait@busy@all-engines
> -igt@gem_wait@wait@all-engines
> -igt@i915_getparams_basic@basic-eu-total
> -igt@i915_getparams_basic@basic-subslice-total
> -igt@i915_hangman@error-state-basic
> -igt@i915_pciid
> -igt@kms_addfb_basic@addfb25-4-tiled
> -igt@kms_addfb_basic@addfb25-bad-modifier
> -igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
> -igt@kms_addfb_basic@addfb25-modifier-no-flag
> -igt@kms_addfb_basic@addfb25-x-tiled-legacy
> -igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
> -igt@kms_addfb_basic@addfb25-yf-tiled-legacy
> -igt@kms_addfb_basic@addfb25-y-tiled-legacy
> -igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> -igt@kms_addfb_basic@bad-pitch-0
> -igt@kms_addfb_basic@bad-pitch-1024
> -igt@kms_addfb_basic@bad-pitch-128
> -igt@kms_addfb_basic@bad-pitch-256
> -igt@kms_addfb_basic@bad-pitch-32
> -igt@kms_addfb_basic@bad-pitch-63
> -igt@kms_addfb_basic@bad-pitch-65536
> -igt@kms_addfb_basic@bad-pitch-999
> -igt@kms_addfb_basic@basic
> -igt@kms_addfb_basic@basic-x-tiled-legacy
> -igt@kms_addfb_basic@basic-y-tiled-legacy
> -igt@kms_addfb_basic@bo-too-small
> -igt@kms_addfb_basic@bo-too-small-due-to-tiling
> -igt@kms_addfb_basic@clobberred-modifier
> -igt@kms_addfb_basic@framebuffer-vs-set-tiling
> -igt@kms_addfb_basic@invalid-get-prop
> -igt@kms_addfb_basic@invalid-get-prop-any
> -igt@kms_addfb_basic@invalid-set-prop
> -igt@kms_addfb_basic@invalid-set-prop-any
> -igt@kms_addfb_basic@no-handle
> -igt@kms_addfb_basic@size-max
> -igt@kms_addfb_basic@small-bo
> -igt@kms_addfb_basic@tile-pitch-mismatch
> -igt@kms_addfb_basic@too-high
> -igt@kms_addfb_basic@too-wide
> -igt@kms_addfb_basic@unused-handle
> -igt@kms_addfb_basic@unused-modifier
> -igt@kms_addfb_basic@unused-offsets
> -igt@kms_addfb_basic@unused-pitches
> -igt@kms_busy@basic
> -igt@kms_prop_blob@basic
> -igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
> -igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
> -igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
> -igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
> -igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> -igt@kms_dsc@dsc-basic
> -igt@kms_flip@basic-flip-vs-dpms
> -igt@kms_flip@basic-flip-vs-modeset
> -igt@kms_flip@basic-flip-vs-wf_vblank
> -igt@kms_flip@basic-plain-flip
> -igt@kms_force_connector_basic@force-connector-state
> -igt@kms_force_connector_basic@force-edid
> -igt@kms_force_connector_basic@force-load-detect
> -igt@kms_force_connector_basic@prune-stale-modes
> -igt@kms_frontbuffer_tracking@basic
> -igt@kms_hdmi_inject@inject-audio
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
> -igt@kms_pipe_crc_basic@hang-read-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc
> -igt@kms_pipe_crc_basic@read-crc-frame-sequence
> -igt@kms_pm_backlight@basic-brightness
> -igt@kms_pm_rpm@basic-pci-d3-state
> -igt@kms_pm_rpm@basic-rte
> -igt@kms_psr@psr-primary-page-flip
> -igt@kms_psr@psr-cursor-plane-move
> -igt@kms_psr@psr-sprite-plane-onoff
> -igt@kms_psr@psr-primary-mmap-gtt
> -igt@kms_setmode@basic-clone-single-crtc
> -igt@i915_pm_rps@basic-api
> -igt@prime_self_import@basic-llseek-bad
> -igt@prime_self_import@basic-llseek-size
> -igt@prime_self_import@basic-with_fd_dup
> -igt@prime_self_import@basic-with_one_bo
> -igt@prime_self_import@basic-with_one_bo_two_files
> -igt@prime_self_import@basic-with_two_bos
> -igt@prime_vgem@basic-fence-flip
> -igt@prime_vgem@basic-fence-mmap
> -igt@prime_vgem@basic-fence-read
> -igt@prime_vgem@basic-gtt
> -igt@prime_vgem@basic-read
> -igt@prime_vgem@basic-write
> -igt@vgem_basic@setversion
> -igt@vgem_basic@create
> -igt@vgem_basic@debugfs
> -igt@vgem_basic@dmabuf-export
> -igt@vgem_basic@dmabuf-fence
> -igt@vgem_basic@dmabuf-fence-before
> -igt@vgem_basic@dmabuf-mmap
> -igt@vgem_basic@mmap
> -igt@vgem_basic@second-client
> -igt@vgem_basic@sysfs
> -
> -# All tests that do module unloading and reloading are executed last.
> -# They will sometimes reveal issues of earlier tests leaving the
> -# driver in a broken state that is not otherwise noticed in that test.
> -
> -igt@core_hotunplug@unbind-rebind
> -igt@vgem_basic@unload
> -igt@i915_module_load@reload
> -igt@gem_lmem_swapping@basic
> -igt@gem_lmem_swapping@parallel-random-engines
> -igt@gem_lmem_swapping@random-engines
> -igt@gem_lmem_swapping@verify-random
> -igt@i915_pm_rpm@module-reload
> -
>   # Kernel selftests
> -igt@i915_selftest@live
> -igt@dmabuf@all-tests
> +igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait
> +igt@kms_atomic_transition@plane-all-transition
> +igt@kms_atomic_transition@plane-all-transition-fencing
> +igt@kms_atomic_transition@plane-all-transition-nonblocking
> +igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing
> +igt@kms_atomic_transition@plane-use-after-nonblocking-unbind
> +igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing
> +igt@kms_atomic_transition@plane-all-modeset-transition
> +igt@kms_atomic_transition@plane-all-modeset-transition-fencing
> +igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels
> +igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels
> +igt@kms_atomic_transition@plane-toggle-modeset-transition
> +igt@kms_atomic_transition@modeset-transition
> +igt@kms_atomic_transition@modeset-transition-fencing
> +igt@kms_atomic_transition@modeset-transition-nonblocking
> +igt@kms_atomic_transition@modeset-transition-nonblocking-fencing
> +
