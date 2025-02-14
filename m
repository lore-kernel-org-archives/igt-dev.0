Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2531C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 07:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7762C10E486;
	Fri, 14 Feb 2025 07:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hm7eI+jU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5291610E486
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 07:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739517248; x=1771053248;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fyGDYDO6x2W1hZL/7FdLw1Kyl2RbbrlhFLLp7Hje2w0=;
 b=Hm7eI+jUCwrzvNuJzuxakJ6+IkXc7CtiDic/u2REhPlisVH5DHC632WS
 JC7znMpj+c0z44TXfaGQ5fR2x2x48qgyN0f7FX5HD4Kba/5NZirB8tf6J
 sVYECYmFIbnjPNzCLPQIk+AbG/avOfHpGWs1LzrZmMECDI/FjwgBU2MyJ
 p3m+TwhKunjTAPDzHSZTaLDaKwxL70I21ZCnzsyfehytoMMtjQ0i/K5YT
 mmHDFA2hbvmIvdgvsW7MtAgljWNfHAweiRKfOIAvvn/HM6wvcYWuVCh3I
 vA2Fza6PLyggot/Q7VnMbsmI+SeoJi9XCETQvZg9qKSbqmRNo2Sqe3kkn g==;
X-CSE-ConnectionGUID: gnkQk5clSLWg6N+uWfaltQ==
X-CSE-MsgGUID: 3I1Z2ZhAQNe18q1DAMfkfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40377325"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40377325"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 23:14:08 -0800
X-CSE-ConnectionGUID: JOOUCb6eT4e4x3LeRQWpFw==
X-CSE-MsgGUID: g56wR8zLQwuY3Iv7XfmTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113243550"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 23:14:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 23:14:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 23:14:07 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 23:14:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVWUaBxwu2eD1kHzVQIbLiMeRHSwTZKlaIvjBRgsnX9CJvhqjlfA0+FBCAc4lEPXUV9n0IQJp/52hI+6o5YkUEtIjI278+3lXWKzZjbsTJyQbtyBGpnsj7P6iz7ep4ixopFq62tc82xw8X1kYSGRjpI4rUZYNm4TGh+u57YNPxn8FcM3XIlFFfOmoP7L0J5qA3RhW8sZoA5Mvli7lGBHi7lJgyOedbKYgFzRXHt4xmHQ62kny5O/XCbfj175+NCq7fYuCPCtTRyiOWU4hVqm79KoJ3pqmpTXQLZi2Sac5onACO85emsAmWfvqBf/NBoxAraLohJbr0nW/sebrkeLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg4WZrEYUW7LAXzrps/udvIBzmATFDM/mV7918DlXu4=;
 b=TLMVt5RAFm2ak1KrFhBilyOnH52cLkY63nli4NNz8cHlcGQ5tdY99KxREc6QZ/z9BPSrTa81Dr6KGosuKpMSsIT11DQSB58O+MY2Qje7rxsSyKFRmCWfNd8gqt+rkGbXDBatN23OE9wwae9Xxioqzpn3nGs8T3H91XDkW1lEhfZCTK6LygTVwdR0OG7qlOvEEhw7iukS+c46XbPu6ROx/kDLwNCCgDjOtQfXhoW2Cwa0GRiPsIG1WRPN9W719rXf3ub5bRchBE2bpM2yR77AanlCmDlAKF+MjZ3ZjMe9E3GQxgmVffMFuK8CqvMbHver6J+ATJodHv8wchJZitpLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS0PR11MB7443.namprd11.prod.outlook.com (2603:10b6:8:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 07:13:35 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 07:13:35 +0000
Message-ID: <9d2eda87-e411-49b9-b122-93b998c038c4@intel.com>
Date: Fri, 14 Feb 2025 12:43:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/7] tests/intel/kms_mst_helper: add helper for
 MST-related functions
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
 <20250211180542.1430676-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250211180542.1430676-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS0PR11MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: b44b3739-838c-495d-bb1d-08dd4cc718ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGdxekVXcWJURHdMVlA2UFVKUFhBWHVMVUlIcVh2NXJmRjdab0NVTlFXUUVW?=
 =?utf-8?B?SkNtcDJCaFJxbG5pU3BEenlzNDBLS3d0WU5uK3NXYkVUSUdYTDlyQTlvS2VW?=
 =?utf-8?B?b0tEZmQrVjlZblRiVjcrQXZ2MHJvRnFxdnB2NUthWlZzcGttbVNJSGF6M2pP?=
 =?utf-8?B?dmVHait6bWRJWVE5TkdhYjNnTzY4Y1pJSTN1R2xHamNINXRHSEIyeHZHemIv?=
 =?utf-8?B?WUdoUDF5Z0lNN21laGdmUlkxQU1DRlFRcThic1NlNDU0WE5uSDZqV3lhZHdW?=
 =?utf-8?B?Y2lEMURycllVeFJNWVNHREtiWStCMDNMSDg5OXRoWmE3clJGT3ZyNUJuV1ZQ?=
 =?utf-8?B?ckpkUjNTRm14bS9BL29UQWhVaWlZUXdtZGUzM2RpMzd2NnBzUHk4WU53RHhq?=
 =?utf-8?B?bmd1a25tazY4YWUwOG9YeEhYcld5eUZzSW9KZHJjRmhHK3g2bC95d2o2RUlj?=
 =?utf-8?B?clRsekdYSDJPbFkwQmY5Z3UySHgvS2ZnbjlZczI1elJmU0toSWFnM0FHYnR0?=
 =?utf-8?B?SFlLNGs1bTNNTGJ4OFkvWEZ3RGp6ZEFxamJSSnVsdkZ4NDJUcTFWMWxDYUlF?=
 =?utf-8?B?K3A4SllTZm1rT2sxRk5hK0orM0JDSkJzelVLaUV0di9OZXpIekdQSDJBaUJi?=
 =?utf-8?B?WEw1djlDdmhBK0RNbHVXMVM1UlZhZ3dLNXJYQzRFMDZ0R2JaQkJzZDJmT2hz?=
 =?utf-8?B?ZEVQTkJxZ0FzdGFuYWpmbndSRDNaUzBjaUlaWVRzbUk4MThGdFlObmswaWNK?=
 =?utf-8?B?ak9PV2R1bnZGZTFpYnUzL2FNN05ibXVSbjA2UDFiamp6MFozMG0wTmg1SzZX?=
 =?utf-8?B?ZUw5bDE3QjhsNlI0bHU3ZFU1cFBmdGxFOWJIbWlZL0MxVjgvYzlWQ1RsNEVR?=
 =?utf-8?B?RUM3V2lQU0h6NDVqVFFKbnc1U3UyaTU4OFZQbCsvQkppQVQ3L0pLcTQ5Tjls?=
 =?utf-8?B?RlZNUkZBbFBWSkxTYVZSRXlvOUJmaExWVzVsc2pBOUw0T1FEcUV2VUVqTzBp?=
 =?utf-8?B?VE54bzFsN0NUc3VSVHdpSnd5MkUzZjdDRmJ1Zm1aZlpLalVFa1orZlNlWHFv?=
 =?utf-8?B?NzI3WVJNazZTM1JEdnFNZXI4aG0zU3pYV28wdWh5bENHWEVuVC9LemM4Z1M4?=
 =?utf-8?B?dGd6dUtaOTF0SUdUWTJoQkhNZy9ucVZJT1Y2c3FwMnlVeHdKMlFHQ2s1aTc0?=
 =?utf-8?B?b3dUYnArS3lsQ05iZXNSaVQ1Uk5XczEyR3R6cGgyL1crbm10UVhidjNVQkdo?=
 =?utf-8?B?RkpyOWFyN3lyYzV1QUZucU1kTVhJZWZXd2IxdGlzTi9vUFhPb3F5ZCt5aDJi?=
 =?utf-8?B?TUI1SnkraHp3N2dZdmt3RnIxbUFxTnpzZ2kxa1hTNnNmWkgrQlY0VENvWXI1?=
 =?utf-8?B?bDhGS0JKTEM1QURqQzgvaGorQjlXVkVlQXhBVHVQdW1JS2F1MWhIZ1BDMGR4?=
 =?utf-8?B?cTZKWDNrTzQ0bnVQU3NpNHBTQTk4ZUhrdXZiQ3l3cTZnU0p5ZG1PR0YraXpN?=
 =?utf-8?B?cFA5QXMyS1FxUlRmTHNzMUpicm15d3ZLUDJCdHJhazcrQUN2RWo3VHN6QXlm?=
 =?utf-8?B?VzdadWQveWhTVTEvM21CSVZjOVlRcWlzcWxvNDR2S29NQmhEMUFTZHJ1dHEz?=
 =?utf-8?B?aXY1aHlGam14OGtHSWh2OHBDWHNnR2k3aDhreUZVczRlL0dCU1VGbVpTcG5K?=
 =?utf-8?B?QTFlbmhDaytQaUROcjZQOVF1U1Y4THI5VG0vMEdZc2pmTU9IY3hpa1NNY3hY?=
 =?utf-8?B?MnZET2dlUDFHOHdmbDBBM21rV3dEdXd5aWEzR1ZLdW9nYURES2xETFk5UUVw?=
 =?utf-8?B?ZmtTcE1laFlFZzQzazkveEJjUENWMWl5MGdSR2NCVzRwbmtJVGpBM2xNWVln?=
 =?utf-8?Q?h88adjsSJ/v2A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekl3ZmVYWEJYRlZOSTdTdDNUcWNLb25zVlVtOWh4NlBQb09EMytFeDgxYjVr?=
 =?utf-8?B?d3FsNysvUFJzclJpWStxczgxMWkyVU5HRm10Q1JNSUVWaS8vc1ExM1Rmd2hB?=
 =?utf-8?B?UC9rM0VKRlVVWG16ZHZVY3ROYlEvSnJmYVZKTHh6eDhBSVNFc0t5aFpOZUwx?=
 =?utf-8?B?aXMvaTNodnBuRU1SRkhjZmNEYVNyUWZWeGM2Y1RSdzBuSThIajFEcWI2TXdD?=
 =?utf-8?B?ODNPZ0ZEbm9pdVhhdmVDYVNrb0pRSjREMytaYUo5N0dGM216S1A4OW10cTNF?=
 =?utf-8?B?Mlp3RHphMjRpZXdZejlGc2hRbFY3azR4cTd2TTJuanViUHRxakM4Sk11dEJ4?=
 =?utf-8?B?QzY4aVJsdHZmalR2UUlUb2pTZVQ3THc5QWRtenUyeUVtcThDWVJMeElMaXZN?=
 =?utf-8?B?R0pKUEpFNGZUcHNNZ0xuVEdESGJ5ck9haHBwWEJtMWx1RnRNZXBXMmhFVTU0?=
 =?utf-8?B?NmFVQkhVR1lsdGRIT1ZkcHdCOHVaUjJnek85VUswUGEzYWRxWFhwbXk3SDJm?=
 =?utf-8?B?ZUk1aVVIM2JJdFJtWTFkUlQrZk5ZNkx6OHZ3UnkrakFpbE5RWTA2STU2bUtE?=
 =?utf-8?B?VzJLVkx6eUNodU03UFRGTko3dEN5ZXlCT2pBYmNiYTM5WkV4cW9CNytNTEox?=
 =?utf-8?B?NFI2OWZhUVBuRVc2TExTMzNjSEJReUxHVTZSY2NUanA2cUwzSnBQMklkMnRr?=
 =?utf-8?B?RFdUQ2ZjVndrYXVHck42TkJraCs3RG9KTVRBN2lBeHRIZkM4SHIvS1lDQ3JM?=
 =?utf-8?B?WThSRG02ZS9JaDdNY3Rlamk0V1A1YXhXUUxCckdyaXQ4YlBlUk03WjM0Q1da?=
 =?utf-8?B?dEZwY3lNY2xRcUY5RDlqaUpSTXpVRnB0RTd5SHA1SHZxK2FldjRadnJWZWhW?=
 =?utf-8?B?UHMwa2U4SC8xU2UwMExjSDFwa29ONmd0T1pnMUcxWGpidWFYZ1Q5ajdFb1Bv?=
 =?utf-8?B?cGV4M1B2enRwU2ZpcWlLK2Y3c09ScHV0c3lpRTNTYjZpZXdKQ3F6b3NqYml0?=
 =?utf-8?B?SzJVS0pURlpvd2NxdlZsYmJKS1pzT3RrSzRKN2dqM0dLSEJvYVVDMkY1dHpa?=
 =?utf-8?B?ZzBtY0FVelYwSjdwWWlWaUpIU20yRmJtQWVvRmNTMERPWWV4WmQzQmp6STRC?=
 =?utf-8?B?LzdwMFhVTlAvMVVQWnJWTUV2U3Q3UHVSR09Ic3VKemVRTTlaSFBiSnBpZEpB?=
 =?utf-8?B?YWtUOFdiR3BGRzF0ZXBHL0tUSUZZMjV3c3M5cEJYVFlHRFRhSEo4bURQWUlz?=
 =?utf-8?B?MUFVRnZrRzNEdTM3dnhSVjNtQlo3RnlJZWtsTWhrZ1ZyMEZ3UWhVWnFvRzIx?=
 =?utf-8?B?WW5qZnAyMTNYaFQydWpkeG1IbGJKdTRYaVRDS2tJdjVZaEFBRFpYR2FPTk5w?=
 =?utf-8?B?aXNMUytyZFYvSTFLWWVHbVhQSkFIMXVUbEhpRUduUnFFSFdiQmJlTHVRSGxr?=
 =?utf-8?B?eVRSejNVV2RZWlFhR2JXQ1FCdytuTTdOZTlDNkhweHlOYy9ZYlovVDBVQmpv?=
 =?utf-8?B?WGlwTXZWN1lka1R4aFkrb0xaeHF0RVNCMnVxaE5mZlAzcHpMbGFpSEZLSUJ4?=
 =?utf-8?B?TzJUR1JqTSt4M21zbkdnMkcvWERKK0hYajRvVXcybUlkekwvTjZkNmgzbjZ0?=
 =?utf-8?B?S1YyNDNZV2hPR1U0SGdpWkFBOVFlS2VPVkIveWNpTFlHWFFlajc2VlV2Tnpi?=
 =?utf-8?B?bFIxbDU2NVNPOGdhT1V3WHJCa1pTd0o1dllyZXF0RS9ldFYvMnFFV2NaQjNF?=
 =?utf-8?B?M1FRWGwyWFRYZVoxNlk5SVdaVnVJeGpmdUFrMXRoL1grRFYvZXZRTmZkM1dt?=
 =?utf-8?B?Z01VOGUvRDVwNzZrVyt5d2hNazA2UTNna2xhT1c0eXB1L2pHR0NGL1ZrVktD?=
 =?utf-8?B?eHV6UUVFczArRDlKSnpQL09VQkpWY3NBcWVnKzRwVThQaWNvZlV5QnV6YmM5?=
 =?utf-8?B?WnN2SFpQS2NKVzhYODEvWDdUZDNrNmo1SFNaeDEzaUQxMjZZZnhNMWRYblFm?=
 =?utf-8?B?NzZNSi9QcEdPYjJXc3VyYlI0OGF6dzQ4MTBPTlluZURGNmxMbmVNaU1FYWl1?=
 =?utf-8?B?Sk1aSy9hV096aFNaM3BZOGR5cjJUVS8xS1NYYklCZWplM3ZrbnF3eFVCamty?=
 =?utf-8?B?dlFOM2FneGJPelh0RzQ1ZVMrV29NMEVwWU9iNWhxSFdzU2RScktPMldKOUVj?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b44b3739-838c-495d-bb1d-08dd4cc718ab
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:13:35.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBQ5Bscx/4HbDee5zJD4tkvBH9rBp6C+2s6a1YABQmY6OjCIDnWPDcC9eillg1gS4L5KVgxSMmTf5MCbXhgjkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7443
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

Hi Kunal,

On 11-02-2025 11:35 pm, Kunal Joshi wrote:
> Add helper to centralize commonly used MST-related logic.
> Move find_mst_outputs to lib.
>
> v2: fix docs (Ankit)
>      split patch (Ankit)
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 38 +++-----------------
>   tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
>   tests/intel/kms_mst_helper.h            | 15 ++++++++
>   tests/meson.build                       |  1 +
>   4 files changed, 69 insertions(+), 33 deletions(-)
>   create mode 100644 tests/intel/kms_mst_helper.c
>   create mode 100644 tests/intel/kms_mst_helper.h
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index edf9409b6..145bf2fc5 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -16,6 +16,7 @@
>   #include <sys/types.h>
>   #include "igt_sysfs.h"
>   #include "igt.h"
> +#include "kms_mst_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
> @@ -47,35 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static int find_mst_outputs(int drm_fd, igt_display_t *display,
> -			    igt_output_t *output,
> -			    igt_output_t *mst_outputs[],
> -			    int *num_mst_outputs)
> -{
> -	int output_root_id, root_id;
> -	igt_output_t *connector_output;
> -
> -	if (!igt_check_output_is_dp_mst(output))
> -		return -EINVAL;
> -
> -	output_root_id = igt_get_dp_mst_connector_id(output);
> -	if (output_root_id == -EINVAL)
> -		return -EINVAL;
> -	/*
> -	 * If output is MST check all other connected output which shares
> -	 * same path and fill mst_outputs and num_mst_outputs
> -	 */
> -	for_each_connected_output(display, connector_output) {
> -		if (!igt_check_output_is_dp_mst(connector_output))
> -			continue;
> -
> -		root_id = igt_get_dp_mst_connector_id(connector_output);
> -		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> -			mst_outputs[(*num_mst_outputs)++] = connector_output;
> -	}
> -	return 0;
> -}
> -
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
>   {
> @@ -90,10 +62,10 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	igt_assert_f(find_mst_outputs(data->drm_fd, &data->display,
> -				      data->output, mst_output,
> -				      output_count) == 0,
> -				      "Unable to find mst outputs or given optput is not mst\n");
> +	igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display,
> +							 data->output, mst_output,
> +							 output_count) == 0,
> +							 "Unable to find mst outputs or given optput is not mst\n");
Please fix the typo here too.
>   
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
> new file mode 100644
> index 000000000..c12bf0703
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "kms_mst_helper.h"
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @display: pointer to #igt_display_t structure
> + * @output: target output
> + * @mst_outputs: filled with mst output of same toplogy as @output
> + * @num_mst_outputs: filled with count of mst outputs found in topology
> + *
> + * Iterates over all connected outputs and adds each DP MST
> + * output that shares the same MST connector ID as @output
> + * into @mst_outputs.
> + *
> + * Returns: 0 on success, -error on failure
> + */
> +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					igt_output_t *output,
> +					igt_output_t *mst_outputs[],
> +					int *num_mst_outputs)
> +{
> +        int output_root_id, root_id;
> +        igt_output_t *connector_output;
> +
> +        if (!igt_check_output_is_dp_mst(output))
> +                return -EINVAL;
> +
> +        output_root_id = igt_get_dp_mst_connector_id(output);
> +        if (output_root_id == -EINVAL)
> +                return -EINVAL;
> +        /*
> +         * If output is MST check all other connected output which shares
> +         * same path and fill mst_outputs and num_mst_outputs
> +         */
> +        for_each_connected_output(display, connector_output) {
> +                if (!igt_check_output_is_dp_mst(connector_output))
> +                        continue;
> +
> +                root_id = igt_get_dp_mst_connector_id(connector_output);
> +                if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> +                        mst_outputs[(*num_mst_outputs)++] = connector_output;
> +        }
> +        return 0;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
> new file mode 100644
> index 000000000..5b62b979b
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef KMS_MST_HELPER_H
> +#define KMS_MST_HELPER_H
> +
> +#include "igt.h"
> +
> +int igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +                                        igt_output_t *output,
> +                                        igt_output_t *mst_outputs[],
> +                                        int *num_mst_outputs);
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..a6f6ad560 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,6 +366,7 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }

