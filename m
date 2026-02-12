Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAA7EEA845
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 19:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1F510E296;
	Thu, 12 Feb 2026 19:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLfQVbVv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6460E10E296
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770926192; x=1802462192;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6uS2LbQECB1LRjVMdRdB/yFphQu48fDBtrtQvLK8EjE=;
 b=OLfQVbVvK8rpD+mYC/QebKI/oyiyceF8MXH+dXxs3QMNZXjamuCxZzzw
 +PXaRYXmVWxQFMORl17W61aHIq4gFCmiCWjFZw0to2wZNGsaneqoZb2ap
 ZVDm8+bP4cjhwpl3zGCLyLYl+SjenOJGPAXKM5lQ/2Z/BjT5UbPw9rHQd
 AAWiETvm0qRG0ZFW4lqyxPptuYorDlaOcZW4gIaUBe3T6palrG9hXvAXD
 I5/I0qOtM839svk28fWz1TC6R62+UTO2JCxXqTxqNODGCzzJrlszlkpdK
 4UPhkGApl7dGOhrQBv6NyfDx0padFRhEcXUrd096cyXvgpRE7ysPztMnu A==;
X-CSE-ConnectionGUID: S+Up+mPlQOyvyrrU/wRt7Q==
X-CSE-MsgGUID: iCWTHf0bTyiIwC3C63HdlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72014854"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72014854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:56:31 -0800
X-CSE-ConnectionGUID: R/DZfsE2Ty2X/38454anpQ==
X-CSE-MsgGUID: sNTQ32t8S6+PbBd0KXwMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="211929538"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 11:56:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 11:56:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 11:56:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 11:56:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPg7zt+1EtX4frQXGiKT245JN2oMS8B1725BoAX84E/v5ZOf9f10fzPCWwDqMHTXQzKgLkg0S2LJC/epDL+/krXo1Ti2rKq1i7dh/Cabmu8nfeqAp4GHeLMJPtDbfWD32UXwXVPscOTyARZkmWy8JtiKpx4h9t/Wy/5R3+QNzhRuOD3FIyyHJwKhhfObkVRmTikpgpS0COtwFrsKIkocbLQmZVMj2WGBwGD6k87qmxeA6/N9PY6qre2xG4A8fr7xFmkHq7ya0YHT/i3ws42BCve1u11mcDIvjMOlotJrYAKpSdJQa8EH73gFhc89MIgxt6MZqxfIx5yziFBfz96BAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=238pbOtVvcghDBZf6pl0gUtMDAfywjJ9+/lPhfiBCrY=;
 b=ZY9z0HN8hs/JqWgzNb1LdDp26SV02hL6kPPc5n10Hh2OzK0OCXvX1FTGcspATsgZU4qN7ZvoONnjmMArSHfuqt+1ra77DQek1W9p7dI5c1Ts4IGBZ2YkBXCN18OQ0iO+FQ4KTYso5OhkG6k0LNP1Epw6q9hHJKakJPyAhkFkC7HnihG4TZClUG42Gjj3RLwmGjGC+IR3s2e4QSMqXs1esqTY/pgWl9Nq8IAw7kFP1soAQm5ILI1S/lg63Fv2S7yxUrK4odMykbHjMaWUuH9DPlrQS+BzR85OC18RPgY+rAasu6iUFwztF/WOBab75VY0V7v27lgk8r+8j0dYqRFcUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 19:56:26 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 19:56:26 +0000
Message-ID: <c67cd5d6-f486-4f2e-890c-e31ef17a0bcd@intel.com>
Date: Fri, 13 Feb 2026 01:26:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_color: Skip the test early if no outputs
 found
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260212031816.896622-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260212031816.896622-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: c1548632-07a1-453d-97f5-08de6a70cdb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHZlNjR5MUVpVHFHTHdoR1hMNUY1VGJXck1PZHhBOHdVUFBqUGVhOGlMbGRP?=
 =?utf-8?B?NkJ2akJuMG9WU0dWRnFnWnJWeGJYWFZNclJaeWdhclpTV2RiWWJVNDFXNU9E?=
 =?utf-8?B?Wm1rQnJubzMwSlVhdVVGeHFlNzd1Y1pzTFpxckwxQ1BMMjNEempZMXRabnlr?=
 =?utf-8?B?NlR3WFVjdkdCYmlmVUk3RUV3TEw5MVJTSHI0RXNGMlEydmd4cXJhbktrZTBP?=
 =?utf-8?B?Y0tTVFVvendkYlc3QllxcllVa0Zld0lPbUhaUkFKODhCeTZZb29HVyt3ZjhJ?=
 =?utf-8?B?c090WmlkMmVzR0xFVUMzQ1ByMVVCc3FOMGh5Q1Fob2dKRW82NThZd2dES3JR?=
 =?utf-8?B?NkdFY21PNkhpKzhKQ2YwK3BQNDE0andrOEl2MzJScUFic25tcnRWbldPSWls?=
 =?utf-8?B?OGphNnlzam1BSlpBbXdnVTNiWHhqVWFsZE5TTGF0WFkwekttazFLSmdTZ3ZK?=
 =?utf-8?B?dFRlNGFhSUVWb2pXTjJxZ3BETUxVSkxjMXlzY0lmNXdEWlVwTXhadnlXQVNt?=
 =?utf-8?B?WE9uaFo4OXNHY05VZWdFOS9KVWJRTms5UlRwb1h6ZEx5Ym1sWnZyclFVTXF3?=
 =?utf-8?B?MURIajZ0SERxU2lQWElPcjlnVm9UWllwNTZBTjIwQ1VNMkFBNE9GSC93UXpZ?=
 =?utf-8?B?a2pDdTl1dytRYUJkUEM1aDVyT1ZKYm91QWZhVW1hNERGUnBtZlZwUUhzazd0?=
 =?utf-8?B?VG9MajJJZFRQMFI5anBLOHJ5Vmw3RGNDbDBmdXBoT0FpVHgrWWtrU3JLcXVx?=
 =?utf-8?B?eVRONjhjRXJhWS9FV01KNS9jTVYza1JydGV0Ui9FTStFdXc3c2FFN0c4TGFt?=
 =?utf-8?B?UTVVZEhhK3pRb2k1TElSN1lkcExHbUdBYlhSb1gwS3VaMGNJbUVRVzB4U0FP?=
 =?utf-8?B?Y082Yjhac0kvNnZFdU1pZ2krZ21kZUw0U0Y1ZFFCakluc2hwdFZmTm1nMnlj?=
 =?utf-8?B?dUNnK0xaUFI0NC8zZXpyYWk0VGs4blZLV0ZFR0pvTnB2QXZLenNQSk5HZkw2?=
 =?utf-8?B?d1RaeS9lUzR5UXBpUTYyUVVxeDU1L0xqTlh3TExidXJaditFU09yWlV5cTRD?=
 =?utf-8?B?NHYydTkwelJhTnVSSTF3WWxhRnJGZU5FRlNHQXp4bVp4dGZRNXpsRzR2eUU0?=
 =?utf-8?B?a3hhSndEZ3ZWekFOd21FQU1yMVZPN1dsaE1hSTRWLzg2cDk3dEdZeEd6NkVR?=
 =?utf-8?B?Z2NNcDlPdEVpNWtQVXQvMlNlUmtqK0FIWDAyU2x2VWNoTkNtREp5MDVqelQ2?=
 =?utf-8?B?MEw0MndSYWRPbTVxTVdYQStDYVdiSmhFTlJld0NHT0dwWjdQR28rSWNYZS9K?=
 =?utf-8?B?YmhieXZMQ0hyemR5MUc3YWlXR29La01RTVl0RDlrQzJlVkhGTSt6U3hqbnlE?=
 =?utf-8?B?QlJiTEVPQWtDaGh2OXFjTE1wLzErbHltWTI1Wm9KUmg4MjFUMmQxdnczK3NS?=
 =?utf-8?B?bW10cmRmN3k2VkVSZHdGMEZPa3lpcVZPTmptQVJ5ZjhoNGs5Vy9QVDM4UzND?=
 =?utf-8?B?VlZtb2lQaUxHVWRXdUc4YTJPbm4zS1BKZ0FzTFZpM2hqT2hISnkwTm5pMTV5?=
 =?utf-8?B?SnU4OE5EWk16ZGh3NTFndXJCY2xMbDRFMUF3MzdadkdPTXVaNkw5R0QzdGUz?=
 =?utf-8?B?S0t0WFd5WUNyUUJPc1QveDRhVnN3V0RRcTR5VkU3MHBPZ2wvczJPMS84MDBs?=
 =?utf-8?B?QjZZVFpIdkE1R3BzVHZmVkI2TFYvSllIbGtvTW1SdDQzYTRFeEVCeU1yandJ?=
 =?utf-8?B?VndmMG43dHlQL1M0Z1h4ZDhsR0lJVW9kUWJpbGh2VUV2RlpOS3hEL0lob1ZB?=
 =?utf-8?B?QVdWY3lQY3lsNHNhakppNDRlUVB2UjkzQzVHVGZrandjNWJUYWlWR2lNeTQ3?=
 =?utf-8?B?UkJzY3ViQkQzU2hyd0c2WTk2Y0w5L2o1UmpydjJETGpmR0xnNVRrU1dKMHBJ?=
 =?utf-8?B?WmJVbTE0eDMvSU5xbUtidWdMeThncjVISnFzTXYyRVZXSUc5azJFOXBzcDVT?=
 =?utf-8?B?WXZkLzdhVkYxdHpqZUFRaXM5dDFTLzNKU09TUmFGSStZRkhwU2VidGttWk1T?=
 =?utf-8?B?WTdkTVkvQVZXME5oSHNUMnVUbFc4MFZuSmhUU05FNFdZNVFVRTk3cjJVVWQ1?=
 =?utf-8?Q?HQu4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFRqaVZqZnZaaGpCMnNYMmJ1Nm1LamtkT2hPM1loUVRsNDY5RjAySDBUa0JM?=
 =?utf-8?B?L0daQkowQStEaCszaGNPcFhtZFk2QWhLL1RTTEkwOFduOEE0ZXI4eWFEcXVZ?=
 =?utf-8?B?UHZRMCtyQkprMmlnRVROVWM3aW1LcFEwcVFDZXRkdU9FZTZwU3BrNTA3VEgx?=
 =?utf-8?B?MmFta3VtV1JMYjF1eHRHanBYeThhU0NZMmpodEYyS2hoa2tKd0o3b2thdXV0?=
 =?utf-8?B?MDBhdnQvQTgzM0tkZ2ZkaUNVcmJnT1d3dUlZTjhNUkhlcVZUbjZRak5IVUlo?=
 =?utf-8?B?cjhHenAvTmwzNUh5Y0Q3dVdCanR0aVp5cVc5OHhWSjF4UGFseDBFUk0wWTlP?=
 =?utf-8?B?SjhHaGdEcXNjTmNYQkdSanRORkFjYlhXRXkzOVl1NFZpcGhMYUtxc0ZLTUZr?=
 =?utf-8?B?TUticjVvNnR6WkxhSXN4NHVjdloyT2FsRS85dkVETEFLMTI0aFR1alZFcUxV?=
 =?utf-8?B?SXZWMDJwSVVZU2Raa2xlWEdoYk1NSnFtdUhzQlZ6WHdmeXNuRjFpYURIcUF3?=
 =?utf-8?B?Skt6REFsdTFHeDVkSTNYVVRGaEVYQWpZOWZ0MlFMalIrYVduRzhPSUo1d3hD?=
 =?utf-8?B?N1grRXZwR0xVRC9sWGplcThDeDJMWWtXcVNVTWtsK3E5NS9tM3h2Z3FqdFl4?=
 =?utf-8?B?MHBKVCtDTW9zQis1OTJ6NFQ2YVpsemJHRUJucTI2dlg3cTlMbVFwNFpJZW9F?=
 =?utf-8?B?ekZhcjBHb09yaGxiRzVjeXgyd2Rhcy9SNjRra1NPb3dnb0g3Z1I2WitpTFBH?=
 =?utf-8?B?THhpWUhMUk05VGhPOHVQQ3J3T1ArZXUrbWhQRngyN3VHS2o2S2p5a0haZ0R2?=
 =?utf-8?B?MHBQNFZLZEZxaG42NG9lVWRXODlnT0R5QWJXMnVwK25pTGtUbC9OaDM2d1dP?=
 =?utf-8?B?NGl5S3QrMDF6VldRNmF5V1Q4VTBlV0srLzc2c0ZxeitLNG5aT3NGKzN0NlNR?=
 =?utf-8?B?NVB2L3RsZzk4VmJkcHQ5RENXblpoREZEWTVid3JWY1VLVG00eUtqTjFCV3p6?=
 =?utf-8?B?VzJ6QVQyQVVWd2Jsa1lGclBESXV2b0N2WmRjc2RtT0Z3L2JMQ1kwWkNHOGdX?=
 =?utf-8?B?TVZKUWxaKzJ3MGlZZ1E5ZFJlU2ZId0ZhcUFqd3pEcWkzMU41bzh6MUdFRllk?=
 =?utf-8?B?cTF1VzNMYVdqMEs5MWowb1NPVTRVZ2h1LzZTREtkSjY5SXpnd0wxSVZ5OUtj?=
 =?utf-8?B?dDBPazhDWS9BQWZ6VGNXSzhDYlp2ckcrVXlLbHE0dFpHellCajRBbU9VeGs2?=
 =?utf-8?B?R0NDTXE1VExKM2tlRUR4N3hKNjBzNkExYnEwWWJTYmRYVzBzcDh2aWpmRHNk?=
 =?utf-8?B?bXFHVXU4SktxVTNTejRFZDB4QVltMmZNVTZpNGZNcmhWc1pHanl4Wk9NR2g5?=
 =?utf-8?B?by85d3JHRGtjaWNTRS82ZHVHUFZIaU00RnNUT1J2NFRRUVBzSjQ0K1VBbTl4?=
 =?utf-8?B?ZVJUS1o1bm1ZNStTOW5aelFxcHphQk5Nd1NjN0FtbFlhRGFzZnNaM0o0d3RJ?=
 =?utf-8?B?Mkt0Y2ZNbHB6YitoTm44cGsraTBFcTRtd2Z0R0p4RGFkdnI2M0pleFdGWmV1?=
 =?utf-8?B?TGxkSUhZNkV2T2V6ZlRBVXd2dlErYW9GWXpmV1VzdlJJN1dXc25Va1h2aFdI?=
 =?utf-8?B?dWhFRHE0R1A5VEpYUTdkUitUSmp3UDE4aW5oY0xJWXc0bmppeTFZdElHVmJG?=
 =?utf-8?B?eWhKY2JuVUgxNzdOMVhVQmZqbHV0NlBsYnhKV1Y4NWpENldHdmtRcEZJNmFn?=
 =?utf-8?B?UXNncnFQaVcrRXhONzFVMkFmNnJpcWpxaUxKUGlPMXUrejFmcEdVNXQ4QWI4?=
 =?utf-8?B?RHhaQkt5b29RSGd4cSsweDBuQkpGZWFkcE5CN2tydnJPeVJ4ckI5Q3laamIv?=
 =?utf-8?B?dGRGTjdLZGFhMjRwQnRzdmVUdHRkcUp0K0FEQWNWWm14VUM5QXNkaG5VcDd1?=
 =?utf-8?B?VW9UNWFwZGpTUkFIaWZNc2s2cFBrSXhXOW45Tit5Wk54UVhSdWpudEdiTUZt?=
 =?utf-8?B?VFlzT3h5NWtMSE5yZHhWQVMyeTJiSjRpbko1ZzU4TmE2SnYycG5ZYmppa3BL?=
 =?utf-8?B?QzVxUXVhbkdRTVJZaW1EdmFhRVlOMmxBVmgyRlFHeG5vamQzZXNPRG9vUXM1?=
 =?utf-8?B?WTJBbGppaG1VTkVNaEpVMUxRZ0NwTndBeHpBZm9rczFlK2o4Y2RHUCtkVElt?=
 =?utf-8?B?Q2ZXL1JEUXN4U1ZSWnRxMjI5bWd5ZThSdlRLcDdjS2ZPdndFaXIyeDJBYjZa?=
 =?utf-8?B?SkRTYXBSWEZkMDJWT0xWdHlVbnM1bjJWTUtrbmxSQzhnRUx2UWRVTWRyL3Rp?=
 =?utf-8?B?cmJtK3pTc2tRTm5zb2RWdnZOQ0l6L3JMQTU1ZVhCbTQvM09adUtjZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1548632-07a1-453d-97f5-08de6a70cdb1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 19:56:25.8995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIi32rqpD0u26LvrueSX2zSX5fK0r2eLwK+owcjcEWzhfo7pdQ+q7e+RDv/q7XC3T2f9zg7nVZQCKcGUbR8SCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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

On 12-02-2026 08:48 am, Karthik B S wrote:
> Add igt_display_require_output call in the initial test fixture to avoid
> skipping the subtest down the line if output is not found.
>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_color.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index a50793651..aea7e008f 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -1168,6 +1168,7 @@ int igt_main()
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
This looks like wrong place for this, there are negative tests which 
doesn't require o/p.
>   	}
>   
>   	igt_subtest_group()
