Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB0CCCD185
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 22:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A0510E2B5;
	Fri, 10 Oct 2025 22:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YDENsRpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E8A10E28D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 22:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760135204; x=1791671204;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d6YKAJPrkXWNYNuS5/kh8/Ra/ZVh0l5216FfJ0sqSJw=;
 b=YDENsRpxh7DcfypcBFm8rDx4GQ12xv08lGaM2qftwFd12kVhwjSz74Rh
 RYp1pfGjilczYk+v3IJ8BTrZQZQnz5m27qoziyK/aYvpXus9v/vIUsTDx
 HMyRzGIF8ldXgnbe7nVqXtDV3xkDAf6gtteWUYLXtQ/ylqTv7SlKKBR7o
 CiDJkmMMS4cfzemsCDvCd6PlczCybv5S3533zaVuKbfqN661M8axeu0if
 t933CWf0Xt5FP5ZW4DfltyyIJdegZDWbIJ7U474z81MSTlMJzSHEMyqr8
 waZP/GEjrgyQdsCEIgCapkvScHE+zOolBsDY2G3zhvUlIrsz9IKKTg5Qf Q==;
X-CSE-ConnectionGUID: /7vW4FfkSHK0iuRQv7E6YQ==
X-CSE-MsgGUID: 3/WFVNlUTJem6JFg/3jOgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62278788"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62278788"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:26:34 -0700
X-CSE-ConnectionGUID: PscrlAUNSXK9wO42IMbBEw==
X-CSE-MsgGUID: fbLBsTZHQrihNg/RlTK3rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; d="scan'208";a="180665318"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 15:26:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:26:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 15:26:29 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 15:26:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApF9yG8vv2C2vKps6kxfsaGojHdmu2FfMnaqZ/zW9+w5gm+46STYrJk/ZJfLem1bKVVmgTqXKjbR0qbfJjpSlPabX4V6FXNjnMqxzx67Q7+GhV/EKtn6wLxzCw72z3Qkz7gmod6KaBdTrmDvsRgO3d6vQBxjHgzIlub18K6YdHs8h4kBZZ0dj+ivC22NaTAZkSyGZ4vUtLMRrIEVGZvMmcXD8/qxFgL7QL/Ykmx5+cZS56AhE6iIcTgDNmpzpcEq9dAbr+beVHG0Hkv+b0eDHTvR/LFrsMqrXJvKW72SmRglEySl1iYKndULk6cvW8DnGfzUSjLUOSBqm+QmtMHDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuZZKa7OhTENRd3qEu8CWspJfuxnDR+30P62pQO4p3M=;
 b=OjHvt1VGLsdfUS+bdYnCSpSqq0R1aogCsMNv9GsWKqhoWbKeaDOIcjlf3q11cAQrkPJqaAZM/VYwWebqjzToYAuO/EYSwFuVVHRbuC0DMpp6GByHwwf9RHkMWRRF/liK8eBvv251D9X1lcLeGn8/Bl1f6vrYi3tfh14q+DvDGAvx4AWornFc+bRXdif9Ub1KQi8ykutNsOZB/px83EM4Fa5+y4BSMlJq5TmcZAjrK1YS2VtIvi1uLEO2Kcy8Q4L8fjlDW7e7kCjqJabpvPkh/Ydb9AT2+1IrSJMjIIdyXaaMxklGKoovjcx0dznrpxH3cWYY9VXhYHAxlyE0WP2J3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:26:28 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 22:26:28 +0000
Date: Fri, 10 Oct 2025 15:26:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 11/18] tests/intel/xe_oa: Convert test_mi_rpc to
 take an OA unit argument
Message-ID: <aOmIEsR85BVilRtn@soc-5CG1426VCC.clients.intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
 <20251008211806.625154-12-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251008211806.625154-12-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:907::36)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: c50f7efe-3997-4c50-3b70-08de084c0e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alhTZ2tQMnlNR0FlZGo2aDVEejl2dDAxVE1CM2NjM2g2V3ZmS0tOSXlCVjRT?=
 =?utf-8?B?dnRZS2x6ODN3UUdXR25qaldGMnYveld3bDhjck51QzdjN2tJOUgzaGEvb1J6?=
 =?utf-8?B?U2NxcFdkTjVHZVdmbStIdWo3d0FCNGVzbkdHYWZQd2RLRVhlMlljeHAzUGxG?=
 =?utf-8?B?dzREVVlzWEtPZ3VvWWFyNGVzRzQxUk5VNUVvd3dGblV3bUZobVRHZHhtRGlW?=
 =?utf-8?B?RllueVpXcVNtS0xUcXFWYUZXcVpOdjh3ckRIZTFuV0lVSy9BSmtyUWFIOSs0?=
 =?utf-8?B?YlJPcWc4eDdoVTJ4Yjl4QWVLbkE2SkdZQ2RzN1YrNHlFVG8wdmlMSTlYaEt5?=
 =?utf-8?B?ZFVCM2RONmlyTHd3K3ViTG1BNm9VOVFpNGRSa3FHVEgvd1JYQnY3QkN1dHJK?=
 =?utf-8?B?T2lCREEvR2R1VnNnQnVPMUNQN0s2NjFxN2hQc3ZPOVljTEw0VHJtdkpOWjlj?=
 =?utf-8?B?N2NaK3ZxYklCQmwxa2trM3hKZEd6Z3JwNXZ4OWlmNjBlMGxpOVgxUEZpMkI2?=
 =?utf-8?B?ZnpON3prems3dkJTL0hOM0lNNGRxazRLWVpuYjRnZE9lSFlDMklUcVNLVnNY?=
 =?utf-8?B?UFdLR3NKcTlxUEhham85eStxZHk0M3hHMnJGVytPcjJoeU1PenJldmtLa3BY?=
 =?utf-8?B?TEZ0RTNkbWFlbngrODNaQXdqc0kvTmlaS0VuSmU4bGtPWVdYRGtUeXFGZGNi?=
 =?utf-8?B?SXB6SlkzSWp1WisxVTNHTXpYQVlqZHlkNXZmYndiZmpTU1JyYm5zTW9MRTFu?=
 =?utf-8?B?czFRWlkxYmZSVGVJWGUzYlM4Tk9jTU5iMkdMSHRLQkwwcU5IZXQyd200MGFw?=
 =?utf-8?B?TitLTmpXZU5kdG5kRkZqM0xmS0tCRVhZR2hlRGpIdjVBcXhNUjNtcmdrUDc2?=
 =?utf-8?B?d2VWYzVJZ2R5QmgweWpsSVl2bERBOUNEOGtDQVk1Z2xibGZLVndPakxyTFlB?=
 =?utf-8?B?MjF0OXpId0V5NE5oU0ZLNHZmT0hqWTVldjNWYkp0aVExSy9FcTNsV2xKdDhi?=
 =?utf-8?B?cC9jalo4Q0l2NTNYU1h6enB0c2lmbldWcTBwbW9RUXNGdml6NW05Q1FGbUZj?=
 =?utf-8?B?ZHZRRW1remFCQ05idkIxeGxVb2tsS3dLRzQzanNXNUEwcTVLRHZwU09JNDh1?=
 =?utf-8?B?SUhCVzlRRFpQUHRoY1pvSWNmSUVjcWpsVkJZVmJhWTV3YmtUcGpBU1NpTlJz?=
 =?utf-8?B?SUU4U2IzZGd3YmpWaHUybHo3Tmh5ZStxMCt6d3lmeHFqa2RqVGVqZEJmR2pX?=
 =?utf-8?B?TGtuNTY0RGVtcDF5TXhoMTByRjJpSDRhbGpGMnAveEJNajhPdTV2cm5oSW9C?=
 =?utf-8?B?SHk4RS9iU3ZrZDZtUE11UExqeE5tVzd2NDBYVkFHZU5QZDhFRDV3Y3RGTFRZ?=
 =?utf-8?B?RHRvRHhmeG8xL0ZZRTgyTnFHRHYrdnRLcUVCWnB1ZDYwZmYxaGJOY1NJR0ZK?=
 =?utf-8?B?cmlnaWE3ZGc2UFdTMFo2YW1tdEhOT0ZpbHdyNDFISjhDM2NDQ1JneFJCSkZS?=
 =?utf-8?B?ZE1HZEU2K2pqU2s3d25zNE9zVVJrdXNpcWgrbmlrbnM1ZlBlbndrREJ6OEUx?=
 =?utf-8?B?alpaY3h1TEtYQjRyclk0YUkwdTJITzlqdjdiNHhyNVIxL0M3TjBjeVAyZ0FI?=
 =?utf-8?B?K2s5am1YblpLSlNNbklZTi96UEpiZnlhdTBIcHlGdTNCd2hYbEJqRWsrcUFK?=
 =?utf-8?B?Y0I0N2hhNEd5T05VTVE1N2V1eEV4RFAyRDBpdWdsbmx1V0pNUmRkRG8xbEZp?=
 =?utf-8?B?Vm1oSUUyVkE2SHNQWUNPeW1XS0FNZ1VVaUUwTHB1S1pxSUZiOXphQnowUEFD?=
 =?utf-8?B?YzBpdU5wTkQvalVUejd3bUtYdXFxdGQvS0JJcnZpR2FEK0JOVHlOQUdPYUhT?=
 =?utf-8?B?RElyeWw1eXlKSVlEQzZJditUVC8wUjhnOExGU3VibTlQbzVGRisrbnNRdTUx?=
 =?utf-8?Q?vvYZTn3zwBQ0Cw39TVihaquw9rzNjzer?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1Blak5vS2JRenVVV28rUFN2UXFQZmFCenNkMHMzeVNkSmQyRGN3VkJrY3VM?=
 =?utf-8?B?NlZPM2ZFMStlNTdHVFdKTDdoWitGN2lqMDUwT2N3dnhpRFk0QjFCSjVmS21W?=
 =?utf-8?B?NHc0dnU5OFNrT3kvZFo4SEdpNkJRVXpJczQ5UlowdGd5bWN0dUlmWEoxc1Za?=
 =?utf-8?B?RjkyT0hCNTRuYjQyakpjcGNkbjVETU5yUUt5S0ZKSE43bnV4NVhwaVpBL2cz?=
 =?utf-8?B?aHd5Tk41MERTcDIwdjIzU2JjV0R1NnFUWklpUGd2OS9MSUlxQzR0QTdkaHhZ?=
 =?utf-8?B?KzdPeWFRc3Q0S2R6eHA1SkhQd0pOdHF1UVNFOWljMDVpSnladmVRcHBpU3p2?=
 =?utf-8?B?Mlp1ek1EbFV6eTVHeThyN3Bsb1QvMEQ3dnhuUk1LazY3dERodVJQc1ZLSkdJ?=
 =?utf-8?B?b3docjJpOXBCeFI4RGhyY0dmNy85eXlVQVVLblZzdW1rNEFZNFYxTDdMUEFq?=
 =?utf-8?B?emJDMlNaOTNSR1g1VjY3UGExdHlacUptZ1hGTmRFK254blFyMEVXZjcvZDBl?=
 =?utf-8?B?ZlAyM05MWkJPa25LTVRnNUdHRWxSV1RFVjNOYXFkdlhWeXRMdlRsVUEvWk5I?=
 =?utf-8?B?N3hrNURkSmlZK2hnMEs2azZrblFTTEozQ05WVzY4Y09wb0ZSQTd1M0thdEZk?=
 =?utf-8?B?ZEZBU0ZYdHhUNDNvNGRtSEVMT2p6S1YzeTFxUlJhdjlhSkpSYXV5MmFic3Np?=
 =?utf-8?B?TDBrUHZQN1NoNy9DelVoSnB0U1JzNGZYMm44YWJuVXQrOEJBMVB3eEN1MHQ0?=
 =?utf-8?B?NXYwT1E5dGNocks1dm1IbE1SdituQ2xsamt3YUZJUTA3ZHByZHJCNjJ2NUkr?=
 =?utf-8?B?T2prQWd1SEVGa1A4SlhTTXVLRGExWW56enZXQ3lqVi9iZHZGdVBZd2Nlc3cv?=
 =?utf-8?B?bDFyVXdINVJkNlVxSUF2aVJBVVNzRHluOWhQanNZWkUrU09Nd01mZ1o4YXJ5?=
 =?utf-8?B?YllLS0NuZ0ZOTEd2eHAwQmR5MG90ZG45VEV0RkV4a3hYY3BZS2U2VzIyYUhF?=
 =?utf-8?B?V1dkZmNrT3FURlFJNkZublZTL3NRNmNza2hzZkNYVzJsUVBzY2xPQ3RpVi9y?=
 =?utf-8?B?UVp0VlM3Z2o1M0RwZUFSTGpPRDRKZ1NoT1RmejY2b1MxRjJPejZPWTA0RWhh?=
 =?utf-8?B?ajlTWllUSmFyQ2VIc1UyV0tCbHRxdWRsNG5xb2NwTjhPcXhWZ1VLSFJEN1JO?=
 =?utf-8?B?YU1YSjZUYnZUd3FvQ01VSzdFbXg0K2xDaXE3emRwOEFzZVdYNGswNWtXWkFo?=
 =?utf-8?B?aUhSSWxNZGFEOCtqV2FpQTNGN0FidFY0bTlaKzRVT3VXQVRSM0k1S1lDSVRo?=
 =?utf-8?B?aVRJbi8zaXNYQ3NkZUhzUVRZaXJnRS9nYjNqK0R0SnNKK05zMlUzcVNLc3F6?=
 =?utf-8?B?enN3NTNwM0pmaWhnMG93ZFIvZUloWjNhTlA4TGJpb2ZkbXBmeS9GM0YrUHc5?=
 =?utf-8?B?aWp1MlVzeFJDWlU2c2hLTldYei9YMHNNemVtcDlQZzRTMWwwS0FBN1BqWWZH?=
 =?utf-8?B?RnVqVFR2NDdkdHFCUE8xenFjTWFqdDdXU0txUVBNWUtMUDQyc012TmlFb3pZ?=
 =?utf-8?B?SGhmbWVQRW5vVkM2aUFQOHlJZy83Y2NRaUFmalh3cTRJL2wzVS9FbWhLV1Bp?=
 =?utf-8?B?QklpMUJjMFdZaURGUUR0bWxaQzdrZHVHdUFDWHRpQ3JTellmR3FNM0dDSnhH?=
 =?utf-8?B?b2UrODJtUk0xd3p6QUtWSjQ3TkZtUWg2Q0hiTmNQcUNYcnlzZDhFL3NUSFEz?=
 =?utf-8?B?eGRnYTJsSFNZcURhSkRteCt1aVlGRXBSK3BVNTFETzQ2OE9iZDdFZGZuYko3?=
 =?utf-8?B?UjByK0hHT2IwT0JtTG5mRnZwQUt6MFF3d20wa1JBVGxsdjRyUCt1a3RYeHlY?=
 =?utf-8?B?dmxXckJIZ2NRckZCL25HTGt6SklEVUpOaWw2VHZWUktvUktjc1UvK3p4QitV?=
 =?utf-8?B?R2l5VVVWM096blNXUHZFY0RoQ2h2SjVtQWVSYXVrYUpkVEJwVXFzWXl1Uk0z?=
 =?utf-8?B?RCszcjFycVgrN1ZMM3IvMGRCWCsrTlVKelF5bnQwbzdRYUZtaHpiSkNreG5W?=
 =?utf-8?B?T2lYeTdBZTVEbnptL0ovVWVVSUZqMktQWmlSRmJCdjNmZ2hJYU9pNGkwKzlr?=
 =?utf-8?B?ZjljYW5zdlFhMU8xT0tZTmtLLzVKMVY4YTZDNnFjV0xHVGYzc3U4SU9mY1A0?=
 =?utf-8?Q?fhDbeYopSKEbmqEneVvdSog=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c50f7efe-3997-4c50-3b70-08de084c0e13
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:26:28.1039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqwhoYi3IFBtxMwu1d7JrgJ8gVZu7qS5HZvQ19Ly58+wvxAG7IV/hSNfC3RbrOmIvZv3B3vHW8tbjaNo65b6QevTjyfReFv2i9cb1OI+FGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Oct 08, 2025 at 02:17:58PM -0700, Ashutosh Dixit wrote:
>Convert test_mi_rpc to take 'struct drm_xe_oa_unit *' argument, to enable
>it to be run on all OA units.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>---
> tests/intel/xe_oa.c | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 739da370ef..efcac06e15 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -2994,15 +2994,16 @@ test_disabled_read_error(void)
>  * Description: Test OAR/OAC using MI_REPORT_PERF_COUNT
>  */
> static void
>-test_mi_rpc(struct drm_xe_engine_class_instance *hwe)
>+test_mi_rpc(struct drm_xe_oa_unit *oau)
>
> {
>+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
> 	uint64_t fmt = ((IS_DG2(devid) || IS_METEORLAKE(devid)) &&
> 			hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) ?
> 		XE_OAC_FORMAT_A24u64_B8_C8 : oar_unit_default_format();
>-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
> 	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>
> 		/* On Gen12, MI RPC uses OAR. OAR is configured only for the
> 		 * render context that wants to measure the performance. Hence a
>@@ -5177,8 +5178,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
>
> 	igt_subtest_group {
> 		igt_subtest_with_dynamic("mi-rpc")
>-			__for_one_hwe_in_oag(hwe)
>-				test_mi_rpc(hwe);
>+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
>+				test_mi_rpc(oau);
>
> 		igt_subtest_with_dynamic("oa-tlb-invalidate") {
> 			igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70) &&
>-- 
>2.48.1
>
