Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D927AC52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 05:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDE010E0B4;
	Mon, 12 Aug 2024 05:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNZXiQOi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAF910E0B4
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 05:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723439499; x=1754975499;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aiR3ZzrWOY+ANyFJkFEdoXLxAlv7KKNkpbTA3kddR2Y=;
 b=RNZXiQOi7/e2kPZneKwUI3vKoMDQVlSRKrGzdbK5PP3zFEGKfR0GSyoC
 s/iWDvu1zEs7f6awRQ5+UuqwuQG9yyQQHY2JPApSkQdqqdFNNFiBDpZbg
 KHQ/gSq10R5vJdg0Cjxq6OGoZrn7aJEKXuJg4ZQFvrkDtzTlziHy1HwVk
 lLSeUg3HB0FNqQbavQaLnzC6HJWMndTkCLSlgzwvfTjDfEU1t9azc4n1W
 R3poq8HhORTr7FGY7PbHEK/impDyPn4wpXs6xbB9B2Y3oBkBnjbuRm4TU
 lS69J7S9kLRlQIsw1xZHmeGVMpyDK87B2O4Mh1/VECRp1sF7d3EEcr4Af g==;
X-CSE-ConnectionGUID: ROGnLj8MQI+RwpFPTtIQiA==
X-CSE-MsgGUID: 0Q01GJbUR5Oer4R278vHoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="39041563"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="39041563"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 22:11:38 -0700
X-CSE-ConnectionGUID: 0xqgjRUOQaGthPc4VtjvDQ==
X-CSE-MsgGUID: gvnWL0ByR5S5lrYeKfJ6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58043196"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Aug 2024 22:11:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 22:11:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 22:11:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 22:11:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 22:11:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdxeC3wLUUKdnxkSYvjuEmTCeBzk17CdRkDRD3AV8WAvKq43myv6OlNvuTGzKRRZWzRhPVgL3gdUfMp22JXTN2uDaHVTFstFLztkw0xhxnWm8vUvugdxU67asdjPUt8Fq++QwLQzdTVNLMD7NVl/MxTdOzdrKxMidb4103WtyUJx98h74xh6lZwvJOGnRp3F7zwpnT2oJeDE9tKSWl5sAshXx6H373+Lz3gpaR4scxy71KdU57AlGAYZSmauOCufsx3qCbUd+z4d9E2jKfrlf/i6RIR3Ehmes6wz5RtrB7O18Gpnz8zVzvuzWb2r1GfoJkMG67/2g+qu9lPrWC8xDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiR3ZzrWOY+ANyFJkFEdoXLxAlv7KKNkpbTA3kddR2Y=;
 b=RPHunAY5iPi9+8UvwNs8c73X9OGo37spsrZNeMKFEBERQzdh+ziBJ24/YZmKEbrFmC/Pbn59S/H1Go8rsJQhdhr2bn1Uk6gGLpFnuIpZQSR85bsW3ZdUlfFPwjJFZHsLFtZ66RetP1+hOBvVCF6OG09vHr1qY7OTzt9TGWyHtjJKVODHfungyKCWCEuha1ZqV1JOlu3N5NMoGXE91u6UNAf00TOKWMZNfcbp9S7IA14wjSGVnzQQWjEHTQGzG1kMO+TwBDbsoC3Od6wypChHyx7NgQ+BbnnWoP7Lyb8vPVuNtKKkM+Dw6aM4MTxY6uJDOVUoiLD+k6FgYqthCu/45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Mon, 12 Aug
 2024 05:11:34 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.7828.024; Mon, 12 Aug 2024
 05:11:32 +0000
Message-ID: <72b2906b-1cc0-4895-9cfa-589f118390fa@intel.com>
Date: Mon, 12 Aug 2024 10:41:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_joiner: Add tests for Ultrajoiner
 validation
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <kunal1.joshi@intel.com>
References: <20240812044739.5630-1-karthik.b.s@intel.com>
 <20240812044739.5630-2-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240812044739.5630-2-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ef993ae-ab51-450b-caf1-08dcba8d3ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dytqd3Z1aTUyQ2t2V3VLd0FCaVM4STVVMGNrNXJGY0xObUl5MTY0ZWIxOHV2?=
 =?utf-8?B?cW1hTFowSWNEcUpQMC9nMEhsRGJYZG53bkdTMklzZVJHV1lQYkI3Q1BOVEJ4?=
 =?utf-8?B?M2pKM2NDQVhCb2h1elV6Ui9YMExKVnVSbUw3VkFlc0pzSVNzMHZFODdsVmxX?=
 =?utf-8?B?VGJrd3dObnM5emUvVVRGczFXNzloQ3pnYXBTSjNUYkRUS2thMDFKcnRkWU1P?=
 =?utf-8?B?UlBQRUpGUXIvbDVydmRMNnZBVkFFZXZ4YVF2VnBiaFpCZWhIcVNBQnljNlA1?=
 =?utf-8?B?VFgvcXBveXpSb0RVYUphWVNrbktIN0xNbm5ZbGdOZ0htSjVhMTBsNVZObDdl?=
 =?utf-8?B?alYwWjdmeHloT25XTDlqNGVDWXc0eUJtT3dOUzEyRWFjdXBlaUpGbGVrcXJl?=
 =?utf-8?B?Q1JlYmx2K3FObzhxWjVZRUVjbEkwQXZJY09VV0FjWmUyMW9yeWY1SmtBZlZ5?=
 =?utf-8?B?ZGZXMVFoMnMwR3dQUzJXY3dxVnQ2aHFsRVRBSUZ1d0lXc01WT3JKRUtuSi8v?=
 =?utf-8?B?OXRnZVBubVlEbmxjcE1Ob2tDZHd1OGpqbjM0aWFFUTExMVNTamtYWEw3cGl1?=
 =?utf-8?B?dEthVzhYWFZPcDhBMmVPZ0N1ZEl1ZHB0M0kwRjJMeTBraFJxcjU5b2hZUVZL?=
 =?utf-8?B?b2tIV0xpeVBxOWdhYlRweG5YQVhHeGhZQnFWeTI3amhIbk5NYlR5TzVPbGp2?=
 =?utf-8?B?cjJxTnI3NjJhMVhmeUhDbnlCQ3N5OVRzREw1YjQ3alRSd2kySzdTcHVYSHIy?=
 =?utf-8?B?TlpiWGdmVEZ4eVdiY3ZVT2xRM2kwcmxqVzRXdkZheGxKYjlsWnNkcCtsYzBx?=
 =?utf-8?B?cE5lN2tuTlA5M1IwbS8weGpRTVIwTGgvSTR0RWFyTWxXak1pSzhScy9sRk1O?=
 =?utf-8?B?ZVFWWVNkeXhYRkNMNUQ1NnJTVHlWV1lDMlRMemp1TUhyaUJZU0RJejNsM0Nr?=
 =?utf-8?B?TFk4bWVHZHJZUVNrY0xQZi83YkpLa3BGZGlmTjNGVHpHeXRyTzRSVExLME9h?=
 =?utf-8?B?NnpJM25XYXBRbXFvTkZmQjhTZ3BIellYWks1VTVpc3RjRHp0c0JrdUViaGtP?=
 =?utf-8?B?SThrNlhvdlZ3c1oxNVNQWVZ6NGczMURzSjVrVkpsMWRYMXJnTnZDRUY1YTBu?=
 =?utf-8?B?cHpxVnZxWmoxV2Zyd0JBSDRmQnRSZG9qMUJmU3FwcmZnSjdFSjhkSkVRYWhO?=
 =?utf-8?B?OTZuaUo5TEE3TUg3WXRIUnlqSE11cGN1WjlhV1dRZDFIZ2dZVWZOVjMzWkpQ?=
 =?utf-8?B?Lzhyb3dZeW1EQkQxT2NYMG8yamc0WE9VVjg0bEwvelU3WTcyZXcxbE81NFlO?=
 =?utf-8?B?Z01TNUg1cVQ4ck4va2FibGlZQ2hUYkhPNG1LekRkZVRDVkdJZCtRT2JxSWVD?=
 =?utf-8?B?bnpROG0rdEl1dDZFVmFqZU8xdjRWa2RFOHRhbXAvcmpwY0d1SVpMeW52TzFs?=
 =?utf-8?B?TjRkeExUYUprZFJTbEw1VDJEWkZPRUpyOXRQRzFhWjVYNkE5R0RlUDQ4cHJn?=
 =?utf-8?B?WG9MK3NtZTV2Y2NvYTZhVjR3eCtEN2Jra0NWaUR2M2hReExIRFJickpoWS9l?=
 =?utf-8?B?NE83Qk52VW1rMzdleVpPd25TL2hDcklrdGs1dUZlUGl1UWtHVDdobDVTdU5T?=
 =?utf-8?B?QWE2Z25iMWgwWTRTZGdVUEVUbmZkM3d5RTUreGs0bnJOM3ZDNW8zOUJBRmF5?=
 =?utf-8?B?V1cxTUVGVFFNR084dTFkR2lhRFJCU1lsejg1TW10K1A4T1p0Z0tOT2U5Nnpp?=
 =?utf-8?B?TEpGcHNGUTVCN0ErNmxSNmNKQUM3SHBnOUVZWnZsM1hnNTlMbUI0RzcrTGtu?=
 =?utf-8?B?N09YU3RiZndyQ2xZRjZwdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVNib09BdWpSdUNpRHRleStoYXhEMCtPNDQwMFp0Y0ErQlVFcEtuS28yRzFq?=
 =?utf-8?B?Wjc1UXBNZVlHVjhIZUdiY1VENjlQSDFsUUhublJsZVMvL0ZWblVUNGpkbVFP?=
 =?utf-8?B?NENQM0tncm0yWFIvdm4vQWtYa0xacUZTandUL1hJb1NycEd1R00vZkRtREhm?=
 =?utf-8?B?L2VoSkJsT2xJRGNzc09ncHBNbXAvZ0hma09ONCsvUFBnaDV0UzFiOVRDeXZz?=
 =?utf-8?B?LzJVM1lkRDJ4ZFJiL0dYdFErUFZYVmYwVWh1R3FjWE5hYU9Hb29lQldUMDZX?=
 =?utf-8?B?NEhibytmenA0M3g0dXdmMlFxVnNoZ0kycUdNK0w4dndWb3pyK21jMDFHY3M3?=
 =?utf-8?B?dTdDNnFSWGF1ZVZIZVFWRnBNaU5KWmpKdUVuMHBRZ05DeXRSQUJEK3pGdlI5?=
 =?utf-8?B?dGg4dkVVemo5Z2gvRC9FZE9JVzhmZi9oQmQzbFJTcTFYajZqY1Nva0oxSE9P?=
 =?utf-8?B?WDMzSnp1azdTeTd5cWRUOWFtdHg2SWFtQ1J3eDNHMk45OWNuSk1MRUN0RGdM?=
 =?utf-8?B?eng5MUFoT0hGWTdGeU4rUnpMbXJlWkFyb3ltcXp2aEhsQm9laXJUZy9Ub1la?=
 =?utf-8?B?VjdDRnlVaWJQR1RMejJrUWY3RXZUNGlKR0w0QkFaM0tJVnRvLy9VbWlEWkQ2?=
 =?utf-8?B?L0owcTduQml0UFhmM1RvalZiK1ZMRVRkMlQ0Zmc5QWNwa2JkNDVSaUt5eTFl?=
 =?utf-8?B?SnVPTGdzaHZhYjlNK0JjT0xNVmF1dS9TcXJRYmFSSlk1emFFMFpKMGQ2S0VI?=
 =?utf-8?B?QVJ2U3dLbUlUTlBVSmZkNUZ3UGFzVVlSOVhaalJ4VGo2d0laWlcwd1Z1bFpr?=
 =?utf-8?B?cDMzUGFuTkpPS1dsdk9vRW1tb3BvalBka2plMFB2RnJLZ2J0eDJhRjBITzZp?=
 =?utf-8?B?NU11QXdoLzZZWDl3M2VXOUIzT1JWaFlET0xTWjlxamJ2WW5JaS80K1VLRnFP?=
 =?utf-8?B?OTlXWmlNQkNGWXFITXhVMXFFb1lpR0xDUlVFRzdiT2FFWkozUDMwWTgvZjFw?=
 =?utf-8?B?aUpkU0NkQXpaUHl3dElkYnhTMUJVbXVTY3pyTTVZaU5lNFNnWVdyUDR6Yngx?=
 =?utf-8?B?YjYwa1JXbVdVRUNZcnE4VWY4eTlQSTVLM2xXdld1TnNWVlQ1czQzZWtUV2hE?=
 =?utf-8?B?SERMSjVZRmhNL1JVNXhLUW9Zd0FxNW1hc1pzNDJzd2VmUEVxSmEvWXgwR1Uw?=
 =?utf-8?B?NUlMMUxIV2V1TFhLcy82eXRSUHJoZjlwRkVVdlVWeUk0SzQ0d28xbTgzRXEz?=
 =?utf-8?B?d05TSzllUEJDOGNwKzdqZVRyb0tRMkRUdlJlRUV6dmw4MlVVcXFXTGJwRm1r?=
 =?utf-8?B?YUs3QjFYSlBsS3paRnR3eWJoT2lFbTR6dGRKS2lIcTJiaXRUL3VxUFA1emFr?=
 =?utf-8?B?V2xFaWNtK0xWK05pUjAydW00eVg4UGJHQWdxQ3NhTEZZL05BL1A0WWlFM0tG?=
 =?utf-8?B?TmFBeHl6ZkNBbk9GYVBGeGVyVnlZKzBtN0Q2dkZpSDRGUFJyaEl5RXBBSi9h?=
 =?utf-8?B?ZFdhYmN0MENPREZSVHhQRGEvSS9VK3FYRVYzMzJ3Ylk2ajNmTGZkcktUQ1FF?=
 =?utf-8?B?MURtTVoyeXE2ODU1Z09jZHMxTDhmOGQrZjZ5OFd1U3UyN2xSTmdna0lxaWtS?=
 =?utf-8?B?T3prbk1zUkVIYUVmTnFRb1kxcXNZZkNMb29FRnZYdDErOEgyeWY2NEdIL2p6?=
 =?utf-8?B?RnZWR0dJdUlNTlVzUThoTE1iMGJYNitFWFhSWWNyRHBZZUova0xwcitUdGcr?=
 =?utf-8?B?WTdtNkM2ZFNqUGwyM01jL2Q2YTkyd0F2Z292NGIvTHc4NEpVcnorZlVsZ28w?=
 =?utf-8?B?S2ZGQ1hjM25URlRmS05mcVBuMHdYZ2pHSVBlaUZ2VERRQytHeGUySnZ3Z2Jh?=
 =?utf-8?B?dFNNaXErRnYrNW9hWTZVdTcwblhiVXNoaWVVcEFzdy9UclhXbVdCWVJIT0lL?=
 =?utf-8?B?TUczYkFsSVpCVEZjalFnS0lOUGU5OGxtcHBoQjMzNjJueC85NTFleFVKR0p1?=
 =?utf-8?B?WVZkVWwrNkpqZktrRVIwK0tLc0FueHNZTml6V2k5MXpiMjI0SmtuYStGcjJi?=
 =?utf-8?B?NHcvVkE3enZhbGlEUVRSeHd4ZWhJcENsd3lsN2ZGcEVHd0ZCSWlBc3QweXhT?=
 =?utf-8?B?YjlWTkZvRnBTbkZxOW5DR2pKU3JjM1k2dVEvaHdBU05jWlpZSUdtaFFzdm5z?=
 =?utf-8?Q?LcsRXFVF5PNLIvcOH3aKSDE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef993ae-ab51-450b-caf1-08dcba8d3ad8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 05:11:32.3854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geF/GQHIY/zxfTGlx4VKoryPm8zFAK/R2sf5V0vuqFmyxf4RVeQbuparYlx9GKdjBZtXvBekgEqcu8OHvAqcJ/SaKgJ15eKHz2Mwhr+OVcqgjZVxTlt94lG4JJVV73NT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
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

Hi Karthik,

typo, big joiner --> Ultra joiner.

* Returns: True if Ultra joiner found in connector mode

On 12-08-2024 10:17, Karthik B S wrote:
> + * Returns: True if big joiner found in connector mode

Regards,
Santhosh
